unit Konv280;

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
 _ppv:TMyUp=(nam:'ppv';new:'ppv8';adr:'data';typ:'11100';siz:15);
 _rzp:TMyUp=(nam:'rzp';new:'rzp8';adr:'data';typ:'11100';siz:24);
 _vyp:TMyUp=(nam:'vyp';new:'vyp8';adr:'data';typ:'11111';siz:199);
 _zam:TMyUp=(nam:'zam';new:'zam8';adr:'data';typ:'11111';siz:93);
 _inf:TMyUp=(nam:'inf';new:'inf8';adr:'data';typ:'10000';siz:51);

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
   T2.FieldByName('DIC').Value := '00000000/000';
 end;
 if X.nam='rzp' then begin
    T2.FieldByName('Uhrn_brutto').Value := 0;
    T2.FieldByName('Uhrn_osobitna').Value := 0;
    T2.FieldByName('Dan_osobitna').Value := 0;
    T2.FieldByName('Poistne').Value := 0;
    T2.FieldByName('DDP').Value := 0;
    T2.FieldByName('Uhrn_nepen2').Value := 0;
    T2.FieldByName('Nedoplatok_nepen2').Value := 0;
 end;
 if X.nam='vyp' then begin
    T2.FieldByName('N_sadzba_ddp').Value := 0;
    T2.FieldByName('Nz_ddp').Value := 0;
    T2.FieldByName('Nz_sadzba_ddp').Value := 0;
    T2.FieldByName('KDP').Value := 0;
    T2.FieldByName('N_ukolova').Value := 0;
    {--}
    T2.FieldByName('Cista_denna_mzda').AsString := NVL(T2.FieldByName('Cista_denna_mzda').AsString);
    T2.FieldByName('N_oslobodeny').AsString     := NVL(T2.FieldByName('N_oslobodeny').AsString);
    T2.FieldByName('N_nadcas').AsString         := NVL(T2.FieldByName('N_nadcas').AsString);
    if T2.FieldByName('Nd_rucne').IsNull
      then T2.FieldByName('Nd_rucne').Value  := FALSE;
  end;
 if X.nam='zam' then begin
    T2.FieldByName('N_sadzba_ddp').Value := 0;
    T2.FieldByName('Nz_ddp').Value := 0;
    T2.FieldByName('Nz_sadzba_ddp').Value := 0;
    T2.FieldByName('KDP').Value := 0;
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
  upgrade_table(_ppv,chyba); if chyba<>'' then exit;
  upgrade_table(_rzp,chyba); if chyba<>'' then exit;
  upgrade_table(_vyp,chyba); if chyba<>'' then exit;
  upgrade_table(_zam,chyba); if chyba<>'' then exit;
  upgrade_table(_inf,chyba); if chyba<>'' then exit;
  Tvrdo_prepis('cis_uk.db','cis_uk8.db',MyDataPth);
  Tvrdo_prepis('cis_uk.px','cis_uk8.px',MyDataPth);
  Tvrdo_prepis('zam_uk.db','zam_uk8.db',MyDataPth);
  Tvrdo_prepis('zam_uk.px','zam_uk8.px',MyDataPth);
  Tvrdo_prepis('hsu.db','hsu8.db',MyDataPth);
  Tvrdo_prepis('hsu.px','hsu8.px',MyDataPth);
  except on E:Exception do begin chyba:='data:'+E.Message;end;end;
end;

procedure upgrade_common(var chyba:string);
begin
  try
  if T1= nil then T1 := TTable.Create(Application);
  if T2= nil then T2 := TTable.Create(Application);
  Tvrdo_prepis('cis_pd.db','cis_pd8.db',MyCommPth);
  Tvrdo_prepis('cis_pd.px','cis_pd8.px',MyCommPth);
  Tvrdo_prepis('cis_pd.val','cis_pd8.val',MyCommPth);
  {--}
  T1.Close;
  T1.TableName:=MyCommPth+'cis_par.db';
  T1.Open;
  if T1.FindKey([1]) then T1.Delete;
  if T1.FindKey([2]) then T1.Delete;
  if T1.FindKey([3]) then T1.Delete;
  if T1.FindKey([4]) then T1.Delete;
  if T1.FindKey([5]) then T1.Delete;
  if T1.FindKey([13]) then T1.Delete;
  if T1.FindKey([25]) then T1.Delete;
  if not T1.FindKey([25]) then
   T1.InsertRecord([25,'PRIDAV_NA_DIETA',270,SMyPar25]);
  T1.Close;
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
 T1.FieldByName('ROK').AsString := '2002';
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
