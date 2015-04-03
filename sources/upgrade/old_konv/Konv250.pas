unit Konv250;

interface

uses DBTables;

{$INCLUDE INCLUDE.INC}


procedure upgrade_data(var chyba:string);
procedure upgrade_common(var chyba:string);
procedure upgrade_private(var chyba:string);

type
 TMyUp=record
   nam:string[8];
   new:string[8];
   adr:string[8];
   typ:string[5];
   siz:integer;
 end;

const
 extsize = 5;
 ext:array[1..extsize] of string[10]=('db','val','px','xg0','yg0');
 _vyp:TMyUp=(nam:'vyp';new:'vyp5';adr:'data';typ:'11111';siz:188);
 _zam:TMyUp=(nam:'zam';new:'zam5';adr:'data';typ:'11111';siz:89);
 _inf:TMyUp=(nam:'inf';new:'inf5';adr:'data';typ:'10000';siz:46);
 _set:TMyUp=(nam:'setup';new:'setup5';adr:'comm';typ:'11000';siz:88);
 _zrz:TMyUp=(nam:'zrz';new:'zrz5';adr:'data';typ:'11100';siz:17);
 _zrv:TMyUp=(nam:'zrv';new:'zrv5';adr:'data';typ:'11100';siz:14);
 _nep:TMyUp=(nam:'nep';new:'nep5';adr:'data';typ:'11100';siz:7);


implementation

uses
  classes,
  Forms,
  FMXUtils,
  db,
  SysUtils,
  MyConsts,
  Main;

var
  T1: TTable;
  T2: TTable;

procedure PrcUp(T1,T2:TTable;X:TMyUp);
begin
 if X.nam='inf' then begin
   T2.FieldByName('F_SOCFOND').Value := 0.6;
   if T2.FieldByName('F_FIRMA_ZPS').Value
     then T2.FieldByName('F_TYP_ULAVY_SP').Value := 1
     else T2.FieldByName('F_TYP_ULAVY_SP').Value := 0;
   if T2.FieldByName('F_NEMOCD').Value = 1
     then T2.FieldByName('F_TYP_ULAVY_FZ').Value := 3
     else T2.FieldByName('F_TYP_ULAVY_FZ').Value := 0;
   T2.FieldByName('F_NEMOHOL').Value := 60;
   T2.FieldByName('DATUM_UZAV').Value := EncodeDate(1999,12,31);
 end else
 if X.nam='setup' then begin
   T2.FieldByName('FZ_FONDZ').Value   := 2.75;
   T2.FieldByName('FZ_GARFOND').Value := 0.25;
   T2.FieldByName('FZ_FONDZ1').Value  := 0.9;
   T2.FieldByName('FZ_GARFOND1').Value:= 0.1;
 end else
 if X.nam='vyp' then begin
   T2.FieldByName('FZ_GARFOND').Value := 0;
   T2.FieldByName('F_TYP_ULAVY_SP').Value := 1;
   T2.FieldByName('F_TYP_ULAVY_FZ').Value := 3;
   T2.FieldByName('PRHRMEZA').AsString := '';
   T2.FieldByName('Vh_nemohol').Value := 0;
   T2.FieldByName('N_nemohol').Value := 0;
   T2.FieldByName('Dan_nerezident').Value := False;
 end else
 if X.nam='zam' then begin
   T2.FieldByName('PRHRMEZA').AsString := '';
   T2.FieldByName('Vsym_u').Value := '';
   T2.FieldByName('Ksym_u').Value := '';
   T2.FieldByName('Dan_nerezident').Value := False;
 end else
 if X.nam='zrz' then begin
   T2.FieldByName('Typ_sumy').Value := 0;
 end else
 if X.nam='zrv' then begin
   T2.FieldByName('Typ_sumy').Value := 0;
   T2.FieldByName('Vypocitana_suma').Value := T2.FieldByName('Suma').Value;
 end else
 if X.nam='nep' then begin
   T2.FieldByName('Typ').Value := 0;
 end;
end;

procedure CopyFileX(const s1,s2:string);
begin if FileExists(s1) then CopyFile(s1,s2); end;

procedure Zalohuj_A_Prepis(const cesta,sub_old,sub_new:string);
begin
 MyBkpPath:=ExtractFileDir(cesta)+'.'+DEF_BKP_EXT;
 {$i-} mkdir(MyBkpPath); {$i+}
 CopyFileX(cesta+sub_old,MyBkpPath);
 MoveFile(cesta+sub_new,cesta+sub_old);
end;

procedure Dopln_A_Prepis(const sub_old,sub_new,cesta:string);
begin
 if not FileExists(cesta+sub_old) then
 begin
   CopyFile(DEF_DATA+sub_new,cesta);
   MoveFile(cesta+sub_new,cesta+sub_old);
 end;
end;

procedure Tvrdo_Prepis(const sub_old,sub_new,cesta:string);
begin
 MyBkpPath:=ExtractFileDir(cesta)+'.'+DEF_BKP_EXT;
 {$i-} mkdir(MyBkpPath); {$i+}
 CopyFile(DEF_DATA+sub_new,cesta);
 CopyFileX(cesta+sub_old,MyBkpPath);
 MoveFile(cesta+sub_new,cesta+sub_old);
end;

function GetDestPath(X:TMyUp):string;
begin
  if X.adr='data' then Result:=MyDataPth
  else if X.adr='priv' then Result:=MyPrivPth
  else if X.adr='comm' then Result:=MyCommPth
  else raise EMyError.Create('chyba');
end;

procedure upgrade_table(X:TMyUp;var chyba:string);
var i:integer;
 DestData:string;
begin
 try
 chyba:='';
 T1.Close;
 T2.Close;
 DestData:=GetDestPath(X);
 T1.TableName:=DestData + X.nam+'.db';
 T1.Open;
 if T1.FieldCount = X.siz then
 begin
   for i:=1 to extsize do if Copy(X.typ,i,1)='1' then
     CopyFile(DEF_DATA+X.new+'.'+EXT[i],DestData);
   T2.Tablename:=DestData + X.new+'.db';
   T2.EmptyTable;
   T2.Open;
   while not T1.EOF do begin
     with T1 do
     T2.Insert;
     for i:=1 to X.siz do T2.Fields[i-1].Value:=T1.Fields[i-1].Value;
     PrcUp(T1,T2,X);
     T2.Post;
     T1.Next;
   end;
   T2.Close;
   T1.Close;
   for i:=1 to extsize do if Copy(X.typ,i,1)='1' then
     Zalohuj_A_Prepis(DestData,X.nam+'.'+EXT[i],X.new+'.'+EXT[i]);
 end;
 except on E:Exception do begin chyba:=X.nam+':'+E.Message;end;end;
end;

procedure MyDeleteFile(const s:string);
begin
  if FileExists(s) then DeleteFile(s);
end;

procedure upgrade_data_vymaz;
  procedure MyVymaz(x:TMyUp);
  var i:integer;
  begin
    for i:=1 to extsize do if Copy(X.typ,i,1)='1' then
      MyDeleteFile(GetDestPath(X)+X.new+'.'+EXT[i]);
  end;
begin
end;

procedure upgrade_data(var chyba:string);
begin
  try
  if T1= nil then T1 := TTable.Create(Application);
  if T2= nil then T2 := TTable.Create(Application);
  upgrade_table(_zam,chyba); if chyba<>'' then exit;
  upgrade_table(_vyp,chyba); if chyba<>'' then exit;
  upgrade_table(_inf,chyba); if chyba<>'' then exit;
  upgrade_table(_nep,chyba); if chyba<>'' then exit;
  MyDeleteFile(MyDataPth+'inf.val');
  upgrade_table(_zrz,chyba); if chyba<>'' then exit;
  upgrade_table(_zrv,chyba); if chyba<>'' then exit;
 except on E:Exception do begin chyba:='data:'+E.Message;end;end;
end;

procedure upgrade_common(var chyba:string);
begin
  try
  if T1= nil then T1 := TTable.Create(Application);
  if T2= nil then T2 := TTable.Create(Application);
  upgrade_table(_set,chyba); if chyba<>'' then exit;
  {--}
   T1.Close;
   T1.TableName:=MyCommPth+'cis_par.db';
   T1.Open;
   if T1.FindKey([24]) then T1.Delete;
   if not T1.FindKey([24]) then
    T1.InsertRecord([24,'PRIEMER_ND',1,SMyPar24]);
   T1.Close;
 except on E:Exception do begin chyba:='comm:'+E.Message;end;end;
end;

procedure upgrade_sys(var chyba:string);
begin
 try
 chyba:='';
 T1.Close;
 T1.TableName:=MyPrivPth+'sys.db';
 T1.Open;
 T1.Edit;
 T1.FieldByName('REGISTERED').AsBoolean := False;
 T1.FieldByName('REG_KEY').AsString := '';
 T1.FieldByName('VOLUME_SN').AsString := '';
 T1.FieldByName('DUMMY_KEY').AsString := '';
 T1.FieldByName('POCET_ZAM').AsInteger := 5;
 T1.FieldByName('POCET_FIRIEM').AsInteger := 1;
 T1.Post;
 T1.Close;
 except on E:Exception do begin chyba:='sys:'+E.Message;end;end;
end;

procedure upgrade_private(var chyba:string);
begin
 try
 if T1= nil then T1 := TTable.Create(Application);
 if T2= nil then T2 := TTable.Create(Application);
 chyba:='';
 upgrade_sys(chyba);
 Tvrdo_prepis('hsv.db','hsv5.db',MyPrivPth);
 Tvrdo_prepis('hsv.px','hsv5.px',MyPrivPth);
 except on E:Exception do begin chyba:='priv:'+E.Message;end;end;
end;

end.
