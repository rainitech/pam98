unit Konv220;

interface

{$INCLUDE INCLUDE.INC}

procedure upgrade_data(var chyba:integer);
procedure upgrade_common(var chyba:integer);
procedure upgrade_private(var chyba:integer);

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

const
  chyba_inf1=10;
  chyba_inf2=11;
  chyba_zam1=20;
  chyba_zam2=21;
  chyba_vyp1=30;
  chyba_vyp2=31;
  chyba_setup1=40;
  chyba_setup2=41;
  chyba_cis_par1=50;

var
  T1: TTable;
  T2: TTable;
  BolaModifikacia : boolean;

procedure CopyFileX(const s1,s2:string);
begin if FileExists(s1) then CopyFile(s1,s2); end;

procedure upgrade_inf(var chyba:integer);
var i:integer;
begin
 chyba:=chyba_inf1;
 T1.TableName:=MyDataPth+'inf.db';
 T2.Tablename:=MyDataPth+'inf22.db';
 try
 T1.Open;
 if T1.FieldCount<35 then
 begin
   CopyFile(DEF_DATA+'inf22.db',MyDataPth);
   CopyFile(DEF_DATA+'inf22.val',MyDataPth);
   T2.EmptyTable;
   T2.Open;
   chyba:=11;
   while not T1.EOF do begin
     with T1 do
     T2.Insert;
     if T1.FieldCount=32 then
     begin
       for i:=1 to 18 do T2.Fields[i-1]:=T1.Fields[i-1];
       T2.Fields[19-1].Value:=0;
       for i:=20 to 33 do T2.Fields[i-1]:=T1.Fields[i-2];
       T2.Fields[34-1].Value:=0;
       T2.Fields[35-1].Value:=False;
     end else
     if T1.FieldCount=34 then
     begin
       for i:=1 to 34 do T2.Fields[i-1]:=T1.Fields[i-1];
       T2.Fields[35-1].Value:=False;
     end;
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
 chyba:=chyba_zam1;
 T1.TableName:=MyDataPth+'zam.db';
 T2.Tablename:=MyDataPth+'zam22.db';
 try
 T1.Open;
 if T1.FieldCount<82 then
 begin
   CopyFile(DEF_DATA+'zam22.db',MyDataPth);
   CopyFile(DEF_DATA+'zam22.px',MyDataPth);
   CopyFile(DEF_DATA+'zam22.val',MyDataPth);
   CopyFile(DEF_DATA+'zam22.xg0',MyDataPth);
   CopyFile(DEF_DATA+'zam22.yg0',MyDataPth);
   T2.EmptyTable;
   T2.Open;
   chyba:=chyba_zam2;
   while not T1.EOF do begin
     with T1 do
     T2.Insert;
     if T1.FieldCount<81 then
     begin
       for i:=1 to 80 do T2.Fields[i-1]:=T1.Fields[i-1];
       T2.Fields[81-1].Value:=0;
       T2.Fields[82-1].Value:=0;
     end else
     if T1.FieldCount<82 then
     begin
       for i:=1 to 81 do T2.Fields[i-1]:=T1.Fields[i-1];
       T2.Fields[82-1].Value:=0;
     end;
     if T2.Fields[38-1].AsString='' then T2.Fields[38-1].Value:=0;
     if T2.Fields[39-1].AsString='' then T2.Fields[39-1].Value:=0;
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
 chyba:=chyba_vyp1;
 T1.TableName:=MyDataPth+'vyp.db';
 T2.Tablename:=MyDataPth+'vyp22.db';
 try
 T1.Open;
 if T1.FieldCount<158 then
 begin
   CopyFile(DEF_DATA+'vyp22.db',MyDataPth);
   CopyFile(DEF_DATA+'vyp22.px',MyDataPth);
   CopyFile(DEF_DATA+'vyp22.val',MyDataPth);
   CopyFile(DEF_DATA+'vyp22.xg0',MyDataPth);
   CopyFile(DEF_DATA+'vyp22.yg0',MyDataPth);
   T2.EmptyTable;
   T2.Open;
   chyba:=chyba_vyp2;
   while not T1.EOF do begin
     with T1 do
     T2.Insert;
     begin
       for i:=1 to 121 do T2.Fields[i-1]:=T1.Fields[i-1];
       if T1.FieldCount<=121 then
       begin
         T2.Fields[122-1].Value:=0;
         T2.Fields[123-1].Value:=0;
         T2.Fields[124-1].Value:=0;
       end
       else for i:=122 to 124 do T2.Fields[i-1]:=T1.Fields[i-1];
       for i:=125 to 128 do T2.Fields[i-1].Value:=0;
       for i:=129 to 132 do T2.Fields[i-1].Value:=T1.Fields[78-1].Value;
       T2.Fields[133-1].Value:=210;
       for i:=134 to 137 do T2.Fields[i-1].Value:=0;
       T2.Fields[138-1].Value:=T1.Fields[57-1].Value;
       T2.Fields[139-1].Value:=T1.Fields[58-1].Value;
       T2.Fields[140-1].Value:=T1.Fields[59-1].Value;
       for i:=141 to 149 do T2.Fields[i-1].Value:=0;
       T2.Fields[150-1].Value:=False;
       T2.Fields[151-1].Value:=T2.Fields[45-1].Value;
       for i:=152 to 153 do T2.Fields[i-1].Value:=0;
       for i:=154 to 158 do T2.Fields[i-1].Value:='';
     end ;
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
  if FileExists(MyDataPth+'inf22.db') then
  begin
   CopyFileX(MyDataPth+'inf.db',MyBkpPath);
   CopyFileX(MyDataPth+'inf.val',MyBkpPath);
   MoveFile(MyDataPth+'inf22.db',MyDataPth+'inf.db');
   MoveFile(MyDataPth+'inf22.val',MyDataPth+'inf.val');
  end;
  if FileExists(MyDataPth+'zam22.db') then
  begin
   CopyFileX(MyDataPth+'zam.db',MyBkpPath);
   CopyFileX(MyDataPth+'zam.px',MyBkpPath);
   CopyFileX(MyDataPth+'zam.val',MyBkpPath);
   CopyFileX(MyDataPth+'zam.xg0',MyBkpPath);
   CopyFileX(MyDataPth+'zam.yg0',MyBkpPath);

   MoveFile(MyDataPth+'zam22.db',MyDataPth+'zam.db');
   MoveFile(MyDataPth+'zam22.px',MyDataPth+'zam.px');
   MoveFile(MyDataPth+'zam22.val',MyDataPth+'zam.val');
   MoveFile(MyDataPth+'zam22.xg0',MyDataPth+'zam.xg0');
   MoveFile(MyDataPth+'zam22.yg0',MyDataPth+'zam.yg0');
  end;
  if FileExists(MyDataPth+'vyp22.db') then
  begin
   CopyFileX(MyDataPth+'vyp.db',MyBkpPath);
   CopyFileX(MyDataPth+'vyp.px',MyBkpPath);
   CopyFileX(MyDataPth+'vyp.val',MyBkpPath);
   CopyFileX(MyDataPth+'vyp.xg0',MyBkpPath);
   CopyFileX(MyDataPth+'vyp.yg0',MyBkpPath);
   MoveFile(MyDataPth+'vyp22.db',MyDataPth+'vyp.db');
   MoveFile(MyDataPth+'vyp22.px',MyDataPth+'vyp.px');
   MoveFile(MyDataPth+'vyp22.val',MyDataPth+'vyp.val');
   MoveFile(MyDataPth+'vyp22.xg0',MyDataPth+'vyp.xg0');
   MoveFile(MyDataPth+'vyp22.yg0',MyDataPth+'vyp.yg0');
  end;
end;

procedure vymaz;
  procedure MyDeleteFile(const s:string);
  begin
    if FileExists(s) then DeleteFile(s);
  end;
begin
   MyDeleteFile(MyDataPth+'inf22.db');
   MyDeleteFile(MyDataPth+'inf22.val');
   MyDeleteFile(MyDataPth+'zam22.db');
   MyDeleteFile(MyDataPth+'zam22.px');
   MyDeleteFile(MyDataPth+'zam22.val');
   MyDeleteFile(MyDataPth+'zam22.xg0');
   MyDeleteFile(MyDataPth+'zam22.yg0');
   MyDeleteFile(MyDataPth+'vyp22.db');
   MyDeleteFile(MyDataPth+'vyp22.px');
   MyDeleteFile(MyDataPth+'vyp22.val');
   MyDeleteFile(MyDataPth+'vyp22.xg0');
   MyDeleteFile(MyDataPth+'vyp22.yg0');
   MyDeleteFile(MyDataPth+'zrv22.db');
   MyDeleteFile(MyDataPth+'zrv22.px');
   MyDeleteFile(MyDataPth+'zrv22.val');
   MyDeleteFile(MyDataPth+'zrz22.db');
   MyDeleteFile(MyDataPth+'zrz22.px');
   MyDeleteFile(MyDataPth+'zrz22.val');
   MyDeleteFile(MyDataPth+'nep22.db');
   MyDeleteFile(MyDataPth+'nep22.px');
   MyDeleteFile(MyDataPth+'nep22.val');
   MyDeleteFile(MyDataPth+'cis_bu22.db');
   MyDeleteFile(MyDataPth+'cis_bu22.px');
   MyDeleteFile(MyDataPth+'cis_bu22.val');
end;

procedure dopln_chybajuce(var chyba:integer);
begin
 if not FileExists(MyDataPth+'cis_bu.db') then
 begin
   CopyFile(DEF_DATA+'cis_bu22.db',MyDataPth);
   MoveFile(MyDataPth+'cis_bu22.db',MyDataPth+'cis_bu.db');
   CopyFile(DEF_DATA+'cis_bu22.px',MyDataPth);
   MoveFile(MyDataPth+'cis_bu22.px',MyDataPth+'cis_bu.px');
   CopyFile(DEF_DATA+'cis_bu22.val',MyDataPth);
   MoveFile(MyDataPth+'cis_bu22.val',MyDataPth+'cis_bu.val');
 end;
{}
 if not FileExists(MyDataPth+'nep.db') then
 begin
   CopyFile(DEF_DATA+'nep22.db',MyDataPth);
   MoveFile(MyDataPth+'nep22.db',MyDataPth+'nep.db');
   CopyFile(DEF_DATA+'nep22.px',MyDataPth);
   MoveFile(MyDataPth+'nep22.px',MyDataPth+'nep.px');
   CopyFile(DEF_DATA+'nep22.val',MyDataPth);
   MoveFile(MyDataPth+'nep22.val',MyDataPth+'nep.val');
 end;
{}
 if not FileExists(MyDataPth+'zrv.db') then
 begin
   CopyFile(DEF_DATA+'zrv22.db',MyDataPth);
   MoveFile(MyDataPth+'zrv22.db',MyDataPth+'zrv.db');
   CopyFile(DEF_DATA+'zrv22.px',MyDataPth);
   MoveFile(MyDataPth+'zrv22.px',MyDataPth+'zrv.px');
   CopyFile(DEF_DATA+'zrv22.val',MyDataPth);
   MoveFile(MyDataPth+'zrv22.val',MyDataPth+'zrv.val');
 end;
{}
 if not FileExists(MyDataPth+'zrz.db') then
 begin
   CopyFile(DEF_DATA+'zrz22.db',MyDataPth);
   MoveFile(MyDataPth+'zrz22.db',MyDataPth+'zrz.db');
   CopyFile(DEF_DATA+'zrz22.px',MyDataPth);
   MoveFile(MyDataPth+'zrz22.px',MyDataPth+'zrz.px');
   CopyFile(DEF_DATA+'zrz22.val',MyDataPth);
   MoveFile(MyDataPth+'zrz22.val',MyDataPth+'zrz.val');
 end;
end;

procedure upgrade_data(var chyba:integer);
begin
  if T1= nil then T1 := TTable.Create(Application);
  if T2= nil then T2 := TTable.Create(Application);
  chyba:=0;
  BolaModifikacia:=false;
  if chyba=0 then dopln_chybajuce(chyba);
  if chyba=0 then upgrade_inf(chyba);
  if chyba=0 then upgrade_zam(chyba);
  if chyba=0 then upgrade_vyp(chyba);
  if chyba<>0 then begin
    Form1.Status('Konverzia adresára '+Form1.adresar_data+' : CHYBA '+IntToStr(chyba));
    exit;
  end;
  Form1.Status('Konverzia adresára '+Form1.adresar_data+' : OK.');
  if BolaModifikacia then dokonci;
  vymaz;
end;

procedure upgrade_setup(var chyba:integer);
var i:integer;
begin
 chyba:=chyba_setup1;
 T1.TableName:=MyCommPth+'setup.db';
 T2.Tablename:=MyCommPth+'setup22.db';
 try
 T1.Open;
 if T1.FieldCount<68 then
 begin
   CopyFile(DEF_DATA+'setup22.db',MyCommPth);
   CopyFile(DEF_DATA+'setup22.val',MyCommPth);
   T2.EmptyTable;
   T2.Open;
   chyba:=chyba_setup2;
   while not T1.EOF do begin
     with T1 do
     T2.Insert;
     begin
       for i:=1 to 50 do T2.Fields[i-1].Value:=T1.Fields[i-1].Value;
       if T1.FieldCount<=50 then
       begin
         T2.Fields[51-1].Value:=0;
         T2.Fields[52-1].Value:=2;
         T2.Fields[53-1].Value:=0;
         T2.Fields[54-1].Value:=3;
         T2.Fields[55-1].Value:=0;
         T2.Fields[56-1].Value:=3;
         for i:=57 to 68 do T2.Fields[i-1].Value:=(i+1) mod 2;
       end
     end ;
     T2.Post;
     T1.Next;
   end;
   T1.Close;
   T2.Close;
   chyba:=0;
 end else chyba:=0;
 finally
 T1.Close;
 T2.Close;
 end;
 if chyba=0 then
 begin
  if FileExists(MyCommPth+'setup22.db') then
  begin
   CopyFile(MyCommPth+'setup.db',MyBkpPath);
   CopyFile(MyCommPth+'setup.val',MyBkpPath);
   MoveFile(MyCommPth+'setup22.db',MyCommPth+'setup.db');
   MoveFile(MyCommPth+'setup22.val',MyCommPth+'setup.val');
  end;
 end;
 DeleteFile(MyCommPth+'setup22.db');
 DeleteFile(MyCommPth+'setup22.val');
end;

procedure upgrade_cis_par(var chyba:integer);
begin
 chyba:=chyba_cis_par1;
 T1.TableName:=MyCommPth+'cis_par.db';
 try
 T1.Open;
 try
 T1.AppendRecord(['TLAC_2VP_NA1',1,'Tlaèi 2 výplatné pásky na jednu stranu A4 (NIE=0,ÁNO=1)']);
 except end;
 try
 T1.AppendRecord(['ZALOHOVANIE',1,'1=disketa A, 2=disketa B, 0=pevný disk']);
 except end;
 chyba:=0;
 finally
 T1.Close;
 end;
end;

procedure upgrade_common(var chyba:integer);
begin
  chyba:=0;
  MyBkpPath:=ExtractFileDir(MyCommPth)+'.'+DEF_BKP_EXT;
  {$i-} mkdir(MyBkpPath); {$i+}
  if T1= nil then T1 := TTable.Create(Application);
  if T2= nil then T2 := TTable.Create(Application);
  if chyba=0 then upgrade_setup(chyba);
  if chyba=0 then upgrade_cis_par(chyba);
end;

procedure upgrade_private(var chyba:integer);
begin
 chyba:=100;
 if NOT FileExists(MyDataPth+'nakl.db') then
 begin
   CopyFile(DEF_DATA+'nakl22.db',MyPrivPth);
   MoveFile(MyPrivPth+'nakl22.db',MyPrivPth+'nakl.db');
   CopyFile(DEF_DATA+'nakl22.px',MyPrivPth);
   MoveFile(MyPrivPth+'nakl22.px',MyPrivPth+'nakl.px');
   CopyFile(DEF_DATA+'nakl22.xg0',MyPrivPth);
   MoveFile(MyPrivPth+'nakl22.xg0',MyPrivPth+'nakl.xg0');
   CopyFile(DEF_DATA+'nakl22.yg0',MyPrivPth);
   MoveFile(MyPrivPth+'nakl22.yg0',MyPrivPth+'nakl.yg0');
 end;
 chyba:=0;
end;

end.
