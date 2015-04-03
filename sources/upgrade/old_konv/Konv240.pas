unit Konv240;

interface

{$INCLUDE INCLUDE.INC}

procedure upgrade_data(var chyba:string);
procedure upgrade_common(var chyba:string);
procedure upgrade_private(var chyba:string);

implementation

uses
  classes,
  Forms,
  FMXUtils,
  db,
  DBtables,
  SysUtils,
  MyConsts,
  Main;

var
  T1: TTable;
  T2: TTable;

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

procedure upgrade_zam(var chyba:string);
var i:integer;
begin
 try
 chyba:='';
 T1.Close;
 T2.Close;
 T1.TableName:=MyDataPth+'zam.db';
 T2.Tablename:=MyDataPth+'zam4.db';
 T1.Open;
 if T1.FieldCount=88 then
 begin
   CopyFile(DEF_DATA+'zam4.db',MyDataPth);
   CopyFile(DEF_DATA+'zam4.px',MyDataPth);
   CopyFile(DEF_DATA+'zam4.val',MyDataPth);
   CopyFile(DEF_DATA+'zam4.xg0',MyDataPth);
   CopyFile(DEF_DATA+'zam4.yg0',MyDataPth);
   T2.EmptyTable;
   T2.Open;
   while not T1.EOF do begin
     with T1 do
     T2.Insert;
     for i:=1 to 88 do T2.Fields[i-1].Value:=T1.Fields[i-1].Value;
     T2.Fields[89-1].AsString:='';   //ddp
     T2.Post;
     T1.Next;
   end;
   T2.Close;
   T1.Close;
   Zalohuj_A_Prepis(MyDataPth,'zam.db','zam4.db');
   Zalohuj_A_Prepis(MyDataPth,'zam.px','zam4.px');
   Zalohuj_A_Prepis(MyDataPth,'zam.val','zam4.val');
   Zalohuj_A_Prepis(MyDataPth,'zam.xg0','zam4.xg0');
   Zalohuj_A_Prepis(MyDataPth,'zam.yg0','zam4.yg0');
 end;
 except on E:Exception do begin chyba:=E.Message;end;end;
end;

procedure upgrade_vyp(var chyba:string);
var i:integer;
begin
 try
 chyba:='';
 T1.Close;
 T2.Close;
 T1.TableName:=MyDataPth+'vyp.db';
 T2.Tablename:=MyDataPth+'vyp4.db';
 T1.Open;
 if T1.FieldCount=187 then
 begin
   CopyFile(DEF_DATA+'vyp4.db',MyDataPth);
   CopyFile(DEF_DATA+'vyp4.px',MyDataPth);
   CopyFile(DEF_DATA+'vyp4.val',MyDataPth);
   CopyFile(DEF_DATA+'vyp4.xg0',MyDataPth);
   CopyFile(DEF_DATA+'vyp4.yg0',MyDataPth);
   T2.EmptyTable;
   T2.Open;
   while not T1.EOF do begin
     with T1 do
     T2.Insert;
     for i:=1 to 187 do T2.Fields[i-1].Value:=T1.Fields[i-1].Value;
     T2.Fields[188-1].Value:=0; //ddp
     T2.Post;
     T1.Next;
   end;
   T1.Close;
   T2.Close;
   Zalohuj_A_Prepis(MyDataPth,'vyp.db','vyp4.db');
   Zalohuj_A_Prepis(MyDataPth,'vyp.px','vyp4.px');
   Zalohuj_A_Prepis(MyDataPth,'vyp.val','vyp4.val');
   Zalohuj_A_Prepis(MyDataPth,'vyp.xg0','vyp4.xg0');
   Zalohuj_A_Prepis(MyDataPth,'vyp.yg0','vyp4.yg0');
 end;
 except on E:Exception do begin chyba:=E.Message;end;end;
end;

procedure upgrade_data_vymaz;
  procedure MyDeleteFile(const s:string);
  begin
    if FileExists(s) then DeleteFile(s);
  end;
begin
   MyDeleteFile(MyDataPth+'cis_par4.db');
   MyDeleteFile(MyDataPth+'cis_par4.px');
   MyDeleteFile(MyDataPth+'cis_par4.val');
   MyDeleteFile(MyDataPth+'dzp4.db');
   MyDeleteFile(MyDataPth+'dzp4.px');
   MyDeleteFile(MyDataPth+'dzp4.val');
   MyDeleteFile(MyDataPth+'vyp4.db');
   MyDeleteFile(MyDataPth+'vyp4.px');
   MyDeleteFile(MyDataPth+'vyp4.val');
   MyDeleteFile(MyDataPth+'vyp4.xg0');
   MyDeleteFile(MyDataPth+'vyp4.yg0');
   MyDeleteFile(MyDataPth+'zam4.db');
   MyDeleteFile(MyDataPth+'zam4.px');
   MyDeleteFile(MyDataPth+'zam4.val');
   MyDeleteFile(MyDataPth+'zam4.xg0');
   MyDeleteFile(MyDataPth+'zam4.yg0');
end;

procedure upgrade_data(var chyba:string);
begin
  try
  if T1= nil then T1 := TTable.Create(Application);
  if T2= nil then T2 := TTable.Create(Application);
  upgrade_zam(chyba); if chyba<>'' then exit;
  upgrade_vyp(chyba); if chyba<>'' then exit;
 except on E:Exception do begin chyba:=E.Message;end;end;
end;

procedure upgrade_setup(var chyba:string);
begin
 try
 chyba:='';
 T1.Close;
 T1.TableName:=MyCommPth+'setup.db';
 T1.Open;
 T1.Edit;
 T1.FieldByName('F_MIN_MZDA').AsCurrency := 4000;
 T1.FieldByName('F_DAN_MAXIMUM1').AsCurrency := 4000;
 T1.FieldByName('ZAOKRUH5').AsInteger := 2;
 T1.FieldByName('ZAOKRUH5SM').AsInteger := 1;
 T1.Post;
 T1.Close;
 except on E:Exception do begin chyba:=E.Message;end;end;
end;

procedure upgrade_sys(var chyba:string);

  function GetRegKey:string;
  begin
    Result:=
       'Software\'+
       T1.FieldByName('COMPANY_NAME').Value + '\' +
       T1.FieldByName('PRODUCT_NAME').Value + '\' +
       T1.FieldByName('REG_KEY').Value;
  end;

begin
 try
 chyba:='';
 T1.Close;
 T1.TableName:=MyPrivPth+'sys.db';
 T1.Open;
 if T1.FIeldByName('REG_KEY').AsString<>'' then
   RegSetStr (GetRegKey,'DUMMY_KEY','DEMO');
 T1.Edit;
 T1.FieldByName('REGISTERED').AsBoolean := False;
 T1.FieldByName('REG_KEY').AsString := '';
 T1.FieldByName('VOLUME_SN').AsString := '';
 T1.FieldByName('DUMMY_KEY').AsString := '';
 T1.FieldByName('POCET_ZAM').AsInteger := 5;
 T1.FieldByName('POCET_FIRIEM').AsInteger := 1;
 T1.Post;
 T1.Close;
 except on E:Exception do begin chyba:=E.Message;end;end;
end;


procedure upgrade_cis_par(var chyba:string);
begin
 try
 chyba:='';
 Tvrdo_prepis('cis_par.db','cis_par4.db',MyCommPth);
 Tvrdo_prepis('cis_par.px','cis_par4.px',MyCommPth);
 Tvrdo_prepis('cis_par.val','cis_par4.val',MyCommPth);
 except on E:Exception do begin chyba:=E.Message;end;end;
end;

procedure upgrade_common(var chyba:string);
begin
  try
  if T1= nil then T1 := TTable.Create(Application);
  if T2= nil then T2 := TTable.Create(Application);
  upgrade_setup(chyba); if chyba<>'' then exit;
  upgrade_cis_par(chyba); if chyba<>'' then exit;
  Tvrdo_prepis('dzp.db' ,'dzp4.db',MyCommPth);
  Tvrdo_prepis('dzp.px' ,'dzp4.px',MyCommPth);
  Tvrdo_prepis('dzp.val','dzp4.val',MyCommPth);
  upgrade_data_vymaz;
  except chyba:='99';raise; end;
end;

procedure upgrade_private(var chyba:string);
begin
 try
 if T1= nil then T1 := TTable.Create(Application);
 if T2= nil then T2 := TTable.Create(Application);
 chyba:='';
 upgrade_sys(chyba);
{ Tvrdo_prepis('sys.db','sys4.db',MyPrivPth);
 Tvrdo_prepis('sys.val','sys4.val',MyPrivPth);}
 except on E:Exception do begin chyba:=E.Message;end;end;
end;

end.
