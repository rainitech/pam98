unit Konv260;

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
 _vyp:TMyUp=(nam:'vyp';new:'vyp6';adr:'data';typ:'11111';siz:195);
 _set:TMyUp=(nam:'setup';new:'setup6';adr:'comm';typ:'11000';siz:90);
 _zam:TMyUp=(nam:'zam';new:'zam5';adr:'data';typ:'11111';siz:89);
 _inf:TMyUp=(nam:'inf';new:'inf5';adr:'data';typ:'10000';siz:46);
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
var nSuma,nPom:double;
begin
 if X.nam='vyp' then begin
   T2.FieldByName('N_OSLOBODENY').Value := 0;
   T2.FieldByName('ND_RUCNE').Value := False;
   if (T1.FieldByName('VH_NADCAS').AsString='') or
      (T1.FieldByName('V_SADZBA').AsString='') then
     T2.FieldByName('N_NADCAS').Value := 0
   else begin
     nPom  := T1.FieldByName('VH_NADCAS').Value;
     nPom  := nPom * T1.FieldByName('V_SADZBA').Value;
     nSuma := ZAOKRUHLI(nPom,0,2);
     T2.FieldByName('N_NADCAS').Value := nSuma;
   end;
   if (T1.FieldByName('V_PRIEMER2').AsString='') or
      (T1.FieldByName('F_DOBA').AsString='') then
     T2.FieldByName('CISTA_DENNA_MZDA').Value := 0
   else begin
     nPom  := T1.FieldByName('V_PRIEMER2').Value;
     nPom  := nPom * T1.FieldByName('F_DOBA').Value;
     nSuma := nPom;
     if nSuma > 350 then nSuma := 350;
     if T2.FieldByName('V_OBDOBIE').Value < 200001 then
       T2.FieldByName('CISTA_DENNA_MZDA').Value := 0
     else
       T2.FieldByName('CISTA_DENNA_MZDA').Value := nSuma;
   end;
 end else
 if X.nam='setup' then begin
   T2.FieldByName('ZAOKRUH10').Value   := 0;
   T2.FieldByName('ZAOKRUH10SM').Value := 3;
   T2.FieldByName('ZAOKRUH11').Value   := 0;
   T2.FieldByName('ZAOKRUH11SM').Value := 3;
   T2.FieldByName('ZAOKRUH12').Value   := 0;
   T2.FieldByName('ZAOKRUH12SM').Value := 3;
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
  upgrade_table(_vyp,chyba); if chyba<>'' then exit;
 except on E:Exception do begin chyba:='data:'+E.Message;end;end;
end;

procedure upgrade_common(var chyba:string);
begin
  try
  if T1= nil then T1 := TTable.Create(Application);
  if T2= nil then T2 := TTable.Create(Application);
  upgrade_table(_set,chyba); if chyba<>'' then exit;
 except on E:Exception do begin chyba:='comm:'+E.Message;end;end;
end;

procedure upgrade_priv(var chyba:string);
begin
 try
 chyba:='';
 T1.Close;
 T1.TableName:=MyPrivPth+'priv.db';
 T1.Open;
 T1.Edit;
 T1.FieldByName('ROK').AsString := '2000';
 T1.Post;
 T1.Close;
 except on E:Exception do begin chyba:='priv:'+E.Message;end;end;
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
 upgrade_priv(chyba); if chyba<>'' then exit;
 upgrade_sys(chyba);  if chyba<>'' then exit;
 except on E:Exception do begin chyba:='priv:'+E.Message;end;end;
end;

end.
