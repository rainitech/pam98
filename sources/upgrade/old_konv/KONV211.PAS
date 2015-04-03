unit Konv211;

interface

{$INCLUDE INCLUDE.INC}

procedure upgrade211(var chyba:integer);

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
  BolaModifikacia : boolean;
  
procedure upgrade_inf(var chyba:integer);
var i:integer;
begin
 chyba:=10;
 T1.TableName:=MyDataPth+'inf.db';
 T2.Tablename:=MyDataPth+'inf211.db';
 try
 T1.Open;
 if T1.FieldCount=32 then
 begin
   CopyFile(DEF_DATA+'inf211.db',MyDataPth);
   CopyFile(DEF_DATA+'inf211.val',MyDataPth);
   T2.EmptyTable;
   T2.Open;
   chyba:=11;
   while not T1.EOF do begin
     with T1 do
     T2.Insert;
     for i:=1 to 18 do T2.Fields[i-1]:=T1.Fields[i-1];
     T2.Fields[19-1].Value:=0;
     for i:=20 to 33 do T2.Fields[i-1]:=T1.Fields[i-2];
     T2.Fields[34-1].Value:=0;
     T2.Post;
     T1.Next;
   end;
   T2.Close;
   T1.Close;
   BolaModifikacia:=true;
   chyba:=0;
 end else chyba:=0;
 finally
 T1.Close;
 T2.Close;
 end;
end;

procedure upgrade_zam(var chyba:integer);
var i:integer;
begin
 chyba:=20;
 T1.TableName:=MyDataPth+'zam.db';
 T2.Tablename:=MyDataPth+'zam211.db';
 try
 T1.Open;
 if T1.FieldCount=80 then
 begin
   CopyFile(DEF_DATA+'zam211.db',MyDataPth);
   CopyFile(DEF_DATA+'zam211.px',MyDataPth);
   CopyFile(DEF_DATA+'zam211.val',MyDataPth);
   CopyFile(DEF_DATA+'zam211.xg0',MyDataPth);
   CopyFile(DEF_DATA+'zam211.yg0',MyDataPth);
   T2.EmptyTable;
   T2.Open;
   chyba:=21;
   while not T1.EOF do begin
     with T1 do
     T2.Insert;
     for i:=1 to 80 do T2.Fields[i-1]:=T1.Fields[i-1];
     T2.Fields[81-1].Value:=0;
     T2.Post;
     T1.Next;
   end;
   T2.Close;
   T1.Close;
   BolaModifikacia:=true;
   chyba:=0;
 end else chyba:=0;
 finally
 T1.Close;
 T2.Close;
 end;
end;

procedure upgrade_vyp(var chyba:integer);
var i:integer;
begin
 chyba:=30;
 T1.TableName:=MyDataPth+'vyp.db';
 T2.Tablename:=MyDataPth+'vyp211.db';
 try
 T1.Open;
 if T1.FieldCount=121 then
 begin
   CopyFile(DEF_DATA+'vyp211.db',MyDataPth);
   CopyFile(DEF_DATA+'vyp211.px',MyDataPth);
   CopyFile(DEF_DATA+'vyp211.val',MyDataPth);
   T2.EmptyTable;
   T2.Open;
   chyba:=31;
   while not T1.EOF do begin
     with T1 do
     T2.Insert;
     for i:=1 to 121 do T2.Fields[i-1]:=T1.Fields[i-1];
     T2.Fields[122-1].Value:=0;
     T2.Fields[123-1].Value:=0;
     T2.Fields[124-1].Value:=0;
     T2.Post;
     T1.Next;
   end;
   T1.Close;
   T2.Close;
   BolaModifikacia:=true;
   chyba:=0;
 end else chyba:=0;
 finally
 T1.Close;
 T2.Close;
 end;
end;

procedure dokonci;
begin
  if NOT BolaModifikacia then exit;
  MyBkpPath:=ExtractFileDir(MyDataPth)+'.'+DEF_BKP_EXT;
  {$i-} mkdir(MyBkpPath); {$i+}   
  if FileExists(MyDataPth+'inf211.db') then
  begin
   CopyFile(MyDataPth+'inf.db',MyBkpPath);
   CopyFile(MyDataPth+'inf.val',MyBkpPath);
   MoveFile(MyDataPth+'inf211.db',MyDataPth+'inf.db');
   MoveFile(MyDataPth+'inf211.val',MyDataPth+'inf.val');
  end;
  if FileExists(MyDataPth+'zam211.db') then
  begin
   CopyFile(MyDataPth+'zam.db',MyBkpPath);
   CopyFile(MyDataPth+'zam.px',MyBkpPath);
   CopyFile(MyDataPth+'zam.val',MyBkpPath);
   CopyFile(MyDataPth+'zam.xg0',MyBkpPath);
   CopyFile(MyDataPth+'zam.yg0',MyBkpPath);

   MoveFile(MyDataPth+'zam211.db',MyDataPth+'zam.db');
   MoveFile(MyDataPth+'zam211.px',MyDataPth+'zam.px');
   MoveFile(MyDataPth+'zam211.val',MyDataPth+'zam.val');
   MoveFile(MyDataPth+'zam211.xg0',MyDataPth+'zam.xg0');
   MoveFile(MyDataPth+'zam211.yg0',MyDataPth+'zam.yg0');
  end; 
  if FileExists(MyDataPth+'vyp211.db') then
  begin
   CopyFile(MyDataPth+'vyp.db',MyBkpPath);
   CopyFile(MyDataPth+'vyp.px',MyBkpPath);
   CopyFile(MyDataPth+'vyp.val',MyBkpPath);
   MoveFile(MyDataPth+'vyp211.db',MyDataPth+'vyp.db');
   MoveFile(MyDataPth+'vyp211.px',MyDataPth+'vyp.px');
   MoveFile(MyDataPth+'vyp211.val',MyDataPth+'vyp.val');
  end; 
end;

procedure vymaz;
  procedure MyDeleteFile(const s:string);
  begin
    if FileExists(s) then DeleteFile(s);
  end;
begin
   MyDeleteFile(MyDataPth+'inf211.db');
   MyDeleteFile(MyDataPth+'inf211.val');
   MyDeleteFile(MyDataPth+'zam211.db');
   MyDeleteFile(MyDataPth+'zam211.px');
   MyDeleteFile(MyDataPth+'zam211.val');
   MyDeleteFile(MyDataPth+'zam211.xg0');
   MyDeleteFile(MyDataPth+'zam211.yg0');
   MyDeleteFile(MyDataPth+'vyp211.db');
   MyDeleteFile(MyDataPth+'vyp211.px');
   MyDeleteFile(MyDataPth+'vyp211.val');
end;

procedure upgrade211(var chyba:integer);
begin
  if T1= nil then T1 := TTable.Create(Application);
  if T2= nil then T2 := TTable.Create(Application);
  chyba:=0;
  BolaModifikacia:=false;
  if chyba=0 then try upgrade_inf(chyba); except chyba:=90; end;
  if chyba=0 then try upgrade_zam(chyba); except chyba:=91; end;
  if chyba=0 then try upgrade_vyp(chyba); except chyba:=92; end;
  if chyba<>0 then begin
    Form1.Status('Konverzia adresára '+Form1.adresar_data+' : CHYBA '+IntToStr(chyba));
    exit;
  end;
  Form1.Status('Konverzia adresára '+Form1.adresar_data+' : OK.');
  if BolaModifikacia then dokonci;
  vymaz;  
end;

end.
