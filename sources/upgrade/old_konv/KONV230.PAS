unit Konv230;

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

procedure upgrade_inf(var chyba:string);
var i:integer;
begin
 try
 chyba:='';
 T1.Close;
 T2.Close;
 T1.TableName:=MyDataPth+'inf.db';
 T2.Tablename:=MyDataPth+'inf3.db';
 T1.Open;
 if T1.FieldCount=35 then
 begin
   CopyFile(DEF_DATA+'inf3.db',MyDataPth);
   CopyFile(DEF_DATA+'inf3.val',MyDataPth);
   T2.EmptyTable;
   T2.Open;
   while not T1.EOF do begin
     with T1 do
     T2.Insert;
     for i:=1 to 35 do T2.Fields[i-1].Value:=T1.Fields[i-1].Value;
     T2.Fields[36-1].Value:=248;
     for i:=37 to 41 do T2.Fields[i-1].Value:=0;
     for i:=42 to 46 do T2.Fields[i-1].Value:='príplatok è.'+IntToStr(i-41);
     T2.Post;
     T1.Next;
   end;
   T2.Close;
   T1.Close;
   Zalohuj_A_Prepis(MyDataPth,'inf.db','inf3.db');
   Zalohuj_A_Prepis(MyDataPth,'inf.val','inf3.val');
 end;
 except on E:Exception do begin chyba:=E.Message;end;end;
end;

procedure upgrade_zam(var chyba:string);
var i:integer;
begin
 try
 chyba:='';
 T1.Close;
 T2.Close;
 T1.TableName:=MyDataPth+'zam.db';
 T2.Tablename:=MyDataPth+'zam3.db';
 T1.Open;
 if T1.FieldCount=82 then
 begin
   CopyFile(DEF_DATA+'zam3.db',MyDataPth);
   CopyFile(DEF_DATA+'zam3.px',MyDataPth);
   CopyFile(DEF_DATA+'zam3.val',MyDataPth);
   CopyFile(DEF_DATA+'zam3.xg0',MyDataPth);
   CopyFile(DEF_DATA+'zam3.yg0',MyDataPth);
   T2.EmptyTable;
   T2.Open;
   while not T1.EOF do begin
     with T1 do
     T2.Insert;
     for i:=1 to 82 do T2.Fields[i-1].Value:=T1.Fields[i-1].Value;
     T2.Fields[83-1].Value:=False;
     T2.Fields[84-1].AsString:='';
     if T2.Fields[50-1].Value = True then
     begin
       T2.Fields[85-1].Value:=True;
       T2.Fields[86-1].Value:=True;
     end else
     begin
       T2.Fields[85-1].Value:=False;
       T2.Fields[86-1].Value:=False;
     end;
     T2.Fields[87-1].Value:=False;
     T2.Fields[88-1].Value:=False;
     T2.Post;
     T1.Next;
   end;
   T2.Close;
   T1.Close;
   Zalohuj_A_Prepis(MyDataPth,'zam.db','zam3.db');
   Zalohuj_A_Prepis(MyDataPth,'zam.px','zam3.px');
   Zalohuj_A_Prepis(MyDataPth,'zam.val','zam3.val');
   Zalohuj_A_Prepis(MyDataPth,'zam.xg0','zam3.xg0');
   Zalohuj_A_Prepis(MyDataPth,'zam.yg0','zam3.yg0');
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
 T2.Tablename:=MyDataPth+'vyp3.db';
 T1.Open;
 if T1.FieldCount=158 then
 begin
   CopyFile(DEF_DATA+'vyp3.db',MyDataPth);
   CopyFile(DEF_DATA+'vyp3.px',MyDataPth);
   CopyFile(DEF_DATA+'vyp3.val',MyDataPth);
   CopyFile(DEF_DATA+'vyp3.xg0',MyDataPth);
   CopyFile(DEF_DATA+'vyp3.yg0',MyDataPth);
   T2.EmptyTable;
   T2.Open;
   while not T1.EOF do begin
     with T1 do
     T2.Insert;
     for i:=1 to 152 do T2.Fields[i-1].Value:=T1.Fields[i-1].Value;
     T2.Fields[153-1].Value:=False; //ztp
     T2.Fields[154-1].Value:=False; // zps1
     T2.Fields[155-1].Value:=0;
     T2.Fields[156-1].Value:=0;
     T2.Fields[157-1].Value:=0;
     T2.Fields[158-1].Value:=0; // dopravne mimoriadne
     T2.Fields[159-1].Value:=False; // ucast na dopravnom mimoriadnom
     T2.Fields[160-1].Value:=True; // automatika
     T2.Fields[161-1].Value:=248; // typ priplatku 2
     for i:=162 to 176 do T2.Fields[i-1].Value:=0;
     T2.Fields[177-1].Value:=0;
     T2.Fields[178-1].Value:=T2.Fields[13-1].Value; // V_ocr
     T2.Fields[179-1].Value:=T2.Fields[177-1].Value+T2.Fields[178-1].Value;
     T2.Fields[180-1].Value:=0;
     T2.Fields[181-1].Value:=T2.Fields[77-1].Value;
     T2.Fields[182-1].Value:=T2.Fields[75-1].Value+T2.Fields[76-1].Value;
     T2.Fields[183-1].Value:=0;
     T2.Fields[184-1].Value:=False;
     T2.Fields[185-1].Value:=0;
     T2.Fields[186-1].Value:=False;
     T2.Fields[187-1].Value:=False;
     if T2.Fields[2-1].Value>=199904 then
     begin
       if T2.Fields[50-1].Value = 500 then begin
         T2.Fields[50-1].Value := 0;
         T2.Fields[158-1].Value := 500;
         T2.Fields[159-1].Value := True;
         T2.Fields[138-1].Value := T2.Fields[138-1].Value - 500;
         T2.Fields[57-1].Value := T2.Fields[57-1].Value - 500;
       end;
     end;
     T2.Post;
     T1.Next;
   end;
   T1.Close;
   T2.Close;
   Zalohuj_A_Prepis(MyDataPth,'vyp.db','vyp3.db');
   Zalohuj_A_Prepis(MyDataPth,'vyp.px','vyp3.px');
   Zalohuj_A_Prepis(MyDataPth,'vyp.val','vyp3.val');
   Zalohuj_A_Prepis(MyDataPth,'vyp.xg0','vyp3.xg0');
   Zalohuj_A_Prepis(MyDataPth,'vyp.yg0','vyp3.yg0');
 end;
 except on E:Exception do begin chyba:=E.Message;end;end;
end;

procedure upgrade_cis_bu(var chyba:string);
var i:integer;
begin
 try
 chyba:='';
 T1.Close;
 T2.Close;
 T1.TableName:=MyDataPth+'cis_bu.db';
 T2.Tablename:=MyDataPth+'cis_bu3.db';
 T1.Open;
 if T1.FieldCount=10 then
 begin
   CopyFile(DEF_DATA+'cis_bu3.db',MyDataPth);
   CopyFile(DEF_DATA+'cis_bu3.px',MyDataPth);
   CopyFile(DEF_DATA+'cis_bu3.val',MyDataPth);
   T2.EmptyTable;
   T2.Open;
   while not T1.EOF do begin
     with T1 do
     T2.Insert;
     for i:=1 to 10 do T2.Fields[i-1].Value:=T1.Fields[i-1].Value;
     T2.Fields[11-1].Value:=LongCisloU(T2.Fields[3-1].AsString,T2.Fields[4-1].AsString);
     T2.Post;
     T1.Next;
   end;
   T2.Close;
   T1.Close;
   Zalohuj_A_Prepis(MyDataPth,'cis_bu.db','cis_bu3.db');
   Zalohuj_A_Prepis(MyDataPth,'cis_bu.px','cis_bu3.px');
   Zalohuj_A_Prepis(MyDataPth,'cis_bu.val','cis_bu3.val');
 end;
 except on E:Exception do begin chyba:=E.Message;end;end;
end;

procedure upgrade_data_vymaz;
  procedure MyDeleteFile(const s:string);
  begin
    if FileExists(s) then DeleteFile(s);
  end;
begin
   MyDeleteFile(MyDataPth+'cis_bu3.db');
   MyDeleteFile(MyDataPth+'cis_bu3.px');
   MyDeleteFile(MyDataPth+'cis_bu3.val');
   MyDeleteFile(MyDataPth+'cis_par3.db');
   MyDeleteFile(MyDataPth+'cis_par3.px');
   MyDeleteFile(MyDataPth+'cis_par3.val');
   MyDeleteFile(MyDataPth+'hp13.db');
   MyDeleteFile(MyDataPth+'hp13.px');
   MyDeleteFile(MyDataPth+'hp23.db');
   MyDeleteFile(MyDataPth+'hp23.px');
   MyDeleteFile(MyDataPth+'hsv3.db');
   MyDeleteFile(MyDataPth+'hsv3.px');
   MyDeleteFile(MyDataPth+'inf3.db');
   MyDeleteFile(MyDataPth+'inf3.val');
   MyDeleteFile(MyDataPth+'setup3.db');
   MyDeleteFile(MyDataPth+'setup3.val');
   MyDeleteFile(MyDataPth+'tlac13.db');
   MyDeleteFile(MyDataPth+'tlac13.px');
   MyDeleteFile(MyDataPth+'tlac23.db');
   MyDeleteFile(MyDataPth+'tlac23.px');
   MyDeleteFile(MyDataPth+'vyp3.db');
   MyDeleteFile(MyDataPth+'vyp3.px');
   MyDeleteFile(MyDataPth+'vyp3.val');
   MyDeleteFile(MyDataPth+'vyp3.xg0');
   MyDeleteFile(MyDataPth+'vyp3.yg0');
   MyDeleteFile(MyDataPth+'zam3.db');
   MyDeleteFile(MyDataPth+'zam3.px');
   MyDeleteFile(MyDataPth+'zam3.val');
   MyDeleteFile(MyDataPth+'zam3.xg0');
   MyDeleteFile(MyDataPth+'zam3.yg0');
end;

procedure upgrade_data(var chyba:string);
begin
  try
  if T1= nil then T1 := TTable.Create(Application);
  if T2= nil then T2 := TTable.Create(Application);
  upgrade_inf(chyba); if chyba<>'' then exit;
  upgrade_zam(chyba); if chyba<>'' then exit;
  upgrade_vyp(chyba); if chyba<>'' then exit;
  upgrade_cis_bu(chyba); if chyba<>'' then exit;
  Dopln_A_Prepis('hp1.db','hp13.db',MyDataPth);
  Dopln_A_Prepis('hp1.px','hp13.px',MyDataPth);
  Dopln_A_Prepis('hp2.db','hp23.db',MyDataPth);
  Dopln_A_Prepis('hp2.px','hp23.px',MyDataPth);
{  upgrade_data_vymaz;}
 except on E:Exception do begin chyba:=E.Message;end;end;
end;

procedure upgrade_setup(var chyba:string);
var i:integer;
begin
 try
 chyba:='';
 T1.Close;
 T2.Close;
 T1.TableName:=MyCommPth+'setup.db';
 T2.Tablename:=MyCommPth+'setup3.db';
 T1.Open;
 if T1.FieldCount=68 then
 begin
   CopyFile(DEF_DATA+'setup3.db',MyCommPth);
   CopyFile(DEF_DATA+'setup3.val',MyCommPth);
   T2.Open;
   while not T1.EOF do begin
     with T1 do
     T2.Edit;
     begin
       for i:=1 to 68 do T2.Fields[i-1].Value:=T1.Fields[i-1].Value;
       for i:=69 to 88 do T2.Fields[i-1].Value:=0;
       T2.Fields[69-1].Value:=2;
       T2.Fields[72-1].Value:=2;
       T2.Fields[75-1].Value:=1;
       T2.Fields[77-1].Value:=2;
       T2.Fields[79-1].Value:=1;
       T2.Fields[80-1].Value:=1;
     end ;
     T2.Post;
     T1.Next;
   end;
   T1.Close;
   T2.Close;
   Zalohuj_A_Prepis(MyCommPth,'setup.db','setup3.db');
   Zalohuj_A_Prepis(MyCommPth,'setup.val','setup3.val');
 end;
 except on E:Exception do begin chyba:=E.Message;end;end;
end;

procedure upgrade_cis_par(var chyba:string);
var s:string;id:integer;
begin
 try
 chyba:='';
 T1.Close;
 T2.Close;
 T1.TableName:=MyCommPth+'cis_par.db';
 T2.Tablename:=MyCommPth+'cis_par3.db';
 T1.Open;
 if T1.FieldCount=3 then
 begin
   CopyFile(DEF_DATA+'cis_par3.db',MyCommPth);
   CopyFile(DEF_DATA+'cis_par3.px',MyCommPth);
   CopyFile(DEF_DATA+'cis_par3.val',MyCommPth);
   T2.Open;
   while not T1.EOF do begin
     s:=T1.Fields[0].Value;
     if s='KOEF_PRIDAVKY1' then id:=6 else
     if s='KOEF_PRIDAVKY2' then id:=7 else
     if s='NEZD_DIETA'     then id:=8 else
     if s='NEZD_DIETA_MAX' then id:=9 else
     if s='NEZD_DIETA_ZTP' then id:=10 else
     if s='NEZD_MINIMUM'   then id:=11 else
     if s='TLAC_2VP_NA1'   then id:=12 else
     if s='ZALOHOVANIE'    then id:=13 else
     if s='ZIV_MINIMUM'    then id:=14 else
     if s='ZIV_MINIMUM1'   then id:=15 else
     id:=-1;
     if id<>-1 then
     begin
       if T2.FindKey([id]) then
       begin
         T2.Edit;
         T2.Fields[3-1].Value := T1.Fields[2-1].Value;
       end;
     end;
     T1.Next;
   end;
   T1.Close;
   T2.Close;
   Zalohuj_A_Prepis(MyCommPth,'cis_par.db','cis_par3.db');
   Zalohuj_A_Prepis(MyCommPth,'cis_par.px','cis_par3.px');
   Zalohuj_A_Prepis(MyCommPth,'cis_par.val','cis_par3.val');
 end;
 except on E:Exception do begin chyba:=E.Message;end;end;
end;

procedure upgrade_common(var chyba:string);
begin
  try
  if T1= nil then T1 := TTable.Create(Application);
  if T2= nil then T2 := TTable.Create(Application);
  upgrade_setup(chyba); if chyba<>'' then exit;
  upgrade_cis_par(chyba); if chyba<>'' then exit;
  Dopln_A_Prepis('tlac1.db','tlac13.db',MyCommPth);
  Dopln_A_Prepis('tlac1.px','tlac13.px',MyCommPth);
  Dopln_A_Prepis('tlac2.db','tlac23.db',MyCommPth);
  Dopln_A_Prepis('tlac2.px','tlac23.px',MyCommPth);
  upgrade_data_vymaz;
  except chyba:='99';raise; end;
end;

procedure upgrade_private(var chyba:string);
begin
 try
 chyba:='';
 Dopln_A_Prepis('hp1.db','hp13.db',MyPrivPth);
 Dopln_A_Prepis('hp1.px','hp13.px',MyPrivPth);
 Dopln_A_Prepis('hp2.db','hp23.db',MyPrivPth);
 Dopln_A_Prepis('hp2.px','hp23.px',MyPrivPth);
 Tvrdo_prepis('hsv.db','hsv3.db',MyPrivPth);
 Tvrdo_prepis('hsv.px','hsv3.px',MyPrivPth);
 except on E:Exception do begin chyba:=E.Message;end;end;
end;

end.
