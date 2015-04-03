unit Konv300;

interface

uses DBTables;

{$INCLUDE INCLUDE.INC}


procedure upgrade_data(var chyba:string);
procedure rozdel_common(var chyba:string);
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
 _hsu:TMyUp=(nam:'hsu';new:'hsu0';adr:'data';typ:'10100';siz:8);
 _rzp:TMyUp=(nam:'rzp';new:'rzp0';adr:'data';typ:'11100';siz:31);
 _vyp:TMyUp=(nam:'vyp';new:'vyp0';adr:'data';typ:'11111';siz:234);
 _zam:TMyUp=(nam:'zam';new:'zam0';adr:'data';typ:'11111';siz:103);

implementation

uses
  classes,
  Forms,
  FMXUtils,
  FileCtrl,
  db,
  SysUtils,
  MyConsts,
  Main;

var
  T1: TTable;
  T2: TTable;
  Q1: TQuery;

procedure PrcUp(T1,T2:TTable;X:TMyUp);
 var oUlica,oCislo:string;
begin
{
 if X.nam='inf' then begin
   MyRozdelUlicu(T2.FieldByName('ADR_ULICA').Value,oUlica,oCislo);
   T2.FieldByName('ADR_ULICA').Value := oUlica;
   T2.FieldByName('ADR_CISLO').Value := oCislo;
   T2.FieldByName('ADR_TELEFON').Value := '';
   T2.FieldByName('ADR_FAX').Value := '';
   T2.FieldByName('ADR_EMAIL').Value := '';
   T2.FieldByName('ICZ').Value := '';
   T2.FieldByName('NAZOV_BANKY').Value := '';
   T2.FieldByName('RIADENIE').Value := 99;
 end else
}
 if X.nam='rzp' then begin
    T2.FieldByName('D_bonus_narok').Value := 0;
    T2.FieldByName('D_bonus_cerpany').Value := 0;
 end else
 if X.nam='vyp' then begin
    T2.FieldByName('Miera_poklesu').Value := 0;
    T2.FieldByName('N_prijem_zp').Value :=
      T2.FieldByName('N_zaklad_zp').Value;
 end else
 if X.nam='zam' then begin
    T2.FieldByName('Miera_poklesu').Value := 0;
 end else
{
 if X.nam='deti' then begin
    T2.FieldByName('Dan_bonus').Value    := T2.FieldByName('NC').Value;
    T2.FieldByName('Zniz_poistne').Value := T2.FieldByName('NC').Value;
 end else
}
 if X.nam='setup' then begin
 end
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
var i:integer;rc,pc:longint;
 DestData:string;
begin
 try
 chyba:='';
 T1.Close;
 T2.Close;
 DestData:=GetDestPath(X);
 T1.TableName:=DestData + X.nam+'.db';
 T1.Open;
 rc:=T1.recordcount;
 if rc=0 then rc:=1;
 pc:=0;
 if T1.FieldCount = X.siz then
 begin
   for i:=1 to extsize do if Copy(X.typ,i,1)='1' then
     CopyFile(DEF_DATA+X.new+'.'+EXT[i],DestData);
   T2.Tablename:=DestData + X.new+'.db';
   T2.EmptyTable;
   T2.Open;
   while not T1.EOF do begin
     inc(pc); Progress(trunc(pc/rc*100));
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
 Progress(100);
 except on E:Exception do begin Progress(100); chyba:=X.nam+':'+E.Message;end;end;
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
  upgrade_table(_zam,chyba); if chyba<>'' then exit;
  upgrade_table(_rzp,chyba); if chyba<>'' then exit;
  upgrade_table(_hsu,chyba); if chyba<>'' then exit;

  Dopln_a_prepis('cis_pu.db','cis_pu0.db',MyDataPth);
  Dopln_a_prepis('cis_pu.px','cis_pu0.px',MyDataPth);

  T1.Close;
  T1.TableName:=MyDataPth+'inf.db';
  T1.Open;
  T1.Edit;
  T1.FieldByName('F_ODSTUP').Value := 0;
  T1.Post;
  T1.Close;

  except on E:Exception do begin chyba:='data:'+E.Message;end;end;
end;

procedure rozdel_common(var chyba:string);
var MyDestPth:array[1..999] of string[128];MyCurrDir,SrcDir,DestDir:string;
  Found,pocet,i:integer;SearchRec:TSearchRec;uspech:boolean;
begin
  SrcDir := MyPamPath + 'COMMON\*.*';
  DestDir := MyPamPath + 'COMMON\ROK2004\';
  try
  File_Dir(
      'COPY',    //Action            : String;  //COPY, DELETE,
                                               //MOVE, RENAME
      True,    //RenameOnCollision : Boolean; //Renames if
                                               //directory exists
      True,     //NoConfirmation    : Boolean; //Responds "Yes to All"
                                               //to any dialogs
      False,     //Silent            : Boolean; //No progress dialog
                                               //is shown
      True,    //ShowProgress      : Boolean; //displays progress
                                               //dialog but no file names
      SrcDir,   //FromDir : String;  //From directory
      DestDir   //ToDir   : String   //To directory
      );
  Tvrdo_prepis('cis_vvz.db','cis_vvz0.db',DestDir);
  Tvrdo_prepis('cis_vvz.px','cis_vvz0.px',DestDir);
  DestDir := MyPamPath + 'COMMON\ROK2005\';
  File_Dir(
      'COPY',    //Action            : String;  //COPY, DELETE,
                                               //MOVE, RENAME
      True,    //RenameOnCollision : Boolean; //Renames if
                                               //directory exists
      True,     //NoConfirmation    : Boolean; //Responds "Yes to All"
                                               //to any dialogs
      False,     //Silent            : Boolean; //No progress dialog
                                               //is shown
      True,    //ShowProgress      : Boolean; //displays progress
                                               //dialog but no file names
      SrcDir,   //FromDir : String;  //From directory
      DestDir   //ToDir   : String   //To directory
      );
  SrcDir := MyPamPath + 'COMMON\*.*';
  File_Dir(
      'DELETE',    //Action            : String;  //COPY, DELETE,
                                               //MOVE, RENAME
      False,    //RenameOnCollision : Boolean; //Renames if
                                               //directory exists
      True,     //NoConfirmation    : Boolean; //Responds "Yes to All"
                                               //to any dialogs
      False,     //Silent            : Boolean; //No progress dialog
                                               //is shown
      False,    //ShowProgress      : Boolean; //displays progress
                                               //dialog but no file names
      SrcDir,   //FromDir : String;  //From directory
      ''       //ToDir   : String   //To directory
      );
  Tvrdo_prepis('cis_par.db','cis_par0.db',DestDir);
  Tvrdo_prepis('cis_par.px','cis_par0.px',DestDir);
  Tvrdo_prepis('setup.db','setup0.db',DestDir);
  Tvrdo_prepis('setup.val','setup0.val',DestDir);
  Tvrdo_prepis('cis_vvz.db','cis_vvz0.db',DestDir);
  Tvrdo_prepis('cis_vvz.px','cis_vvz0.px',DestDir);

  except on E:Exception do begin chyba:='data:'+E.Message;end;end;
end;
(*
procedure rozdel_data(var chyba:string);
var MyDestPth:array[1..999] of string[128];MyCurrDir:string;
  Found,pocet,i:integer;SearchRec:TSearchRec;uspech:boolean;
begin
  pocet:=0;
  if Q1 = nil then Q1 := TQuery.Create(Application);
  Q1.SQL.Clear;
  Q1.SQL.Add('select distinct v_rok from "'+MyDataPth+'VYP.DB" where v_rok between 2004 and 2099');
  Q1.Open;
  try
  MyCurrDir:=GetCurrentDir;
  Chdir(MyDataPth);
  while not Q1.EOF do begin
    inc(pocet);
    MyDestPth[pocet] := MyDataPth + '\'+ Q1.FieldByName('v_rok').AsString+'\';
    if NOT DirectoryExists(MyDestPth[pocet]) then CreateDir(MyDestPth[pocet]);
    Q1.Next;
  end;
  Q1.Close;
  finally
  Chdir(MyCurrDir);
  end;
  try
      {--kopirovanie adresara}
      Found := FindFirst(MyDataPth+'*.*', faAnyFile, SearchRec);
      while Found = 0 do
      begin
        if SearchRec.Attr and faDirectory = 0 then begin
          for i:=1 to pocet do CopyFile(MyDataPth+Searchrec.Name,MyDestPth[i]);
        end;
        if Uppercase(SearchRec.Name)='INF.DB' then uspech:=true;
        Found := FindNext(SearchRec);
      end;
      FindClose(SearchRec);
      {--zmazanie adresara}
      Found := FindFirst(MyDataPth+'*.*', faAnyFile, SearchRec);
      while Found = 0 do
      begin
        if SearchRec.Attr and faDirectory = 0 then begin
          MyDeleteFile(MyDataPth+Searchrec.Name);
        end;
        if Uppercase(SearchRec.Name)='INF.DB' then uspech:=true;
        Found := FindNext(SearchRec);
      end;
      FindClose(SearchRec);
  except on E:Exception do begin chyba:='data:'+E.Message;end;end;
end;
*)
procedure upgrade_common(var chyba:string);
begin
  try
  if T1= nil then T1 := TTable.Create(Application);
  if T2= nil then T2 := TTable.Create(Application);

  Zalohuj_A_Prepis (MyCommPth,'cis_par.db','p2004.db');
  Zalohuj_A_Prepis (MyCommPth,'cis_par.px','p2004.px');

  MyDeleteFile(MyCommPth+'p2004.db');
  MyDeleteFile(MyCommPth+'p2004.px');
  MyDeleteFile(MyCommPth+'p2004.val');
  MyDeleteFile(MyCommPth+'cis_par.val');
{
  Dopln_a_prepis('cis_vvz.db','cis_vvz9.db',MyCommPth);
  Dopln_a_prepis('cis_vvz.px','cis_vvz9.px',MyCommPth);
  Dopln_a_prepis('p2004.db','p20049.db',MyCommPth);
  Dopln_a_prepis('p2004.px','p20049.px',MyCommPth);
  Dopln_a_prepis('p2004.val','p20049.val',MyCommPth);
  upgrade_table(_setup,chyba); if chyba<>'' then exit;}
 except on E:Exception do begin chyba:='comm5:'+E.Message;end;end;
end;

procedure upgrade_priv(var chyba:string);
begin
 try
 chyba:='';
 T1.Close;
 T1.TableName:=MyPrivPth+'priv.db';
 T1.Open;
 T1.Edit;
 T1.FieldByName('ROK').AsString := '2004';
 T1.Post;
 T1.Close;

 Tvrdo_prepis('hsv.db','hsv0.db',MyPrivPth);
 Tvrdo_prepis('hsv.px','hsv0.px',MyPrivPth);
{
 Tvrdo_prepis('nakl.xg0','nakl9.xg0',MyPrivPth);
 Tvrdo_prepis('nakl.yg0','nakl9.yg0',MyPrivPth);
}
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

(*
      {--kopirovanie adresara}
      Found := FindFirst(MyDataPth+'*.*', faAnyFile, SearchRec);
      while Found = 0 do
      begin
        if SearchRec.Attr and faDirectory = 0 then begin
          for i:=1 to pocet do CopyFile(MyDataPth+Searchrec.Name,MyDestPth[i]);
        end;
        if Uppercase(SearchRec.Name)='INF.DB' then uspech:=true;
        Found := FindNext(SearchRec);
      end;
      FindClose(SearchRec);
      {--zmazanie adresara}
      Found := FindFirst(MyDataPth+'*.*', faAnyFile, SearchRec);
      while Found = 0 do
      begin
        if SearchRec.Attr and faDirectory = 0 then begin
          MyDeleteFile(MyDataPth+Searchrec.Name);
        end;
        if Uppercase(SearchRec.Name)='INF.DB' then uspech:=true;
        Found := FindNext(SearchRec);
      end;
      FindClose(SearchRec);
*)

end.
