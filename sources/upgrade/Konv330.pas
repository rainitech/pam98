unit Konv330;

interface

uses DBTables;

{$INCLUDE INCLUDE.INC}


procedure upgrade_data(var chyba:string);
procedure upgrade_common_rok(iRok:integer;var chyba:string);
procedure vytvor_common_rok(iRok:integer; var chyba:string);
procedure upgrade_common(var chyba:string);
procedure upgrade_private(var chyba:string);

type
 TMyUp=record
   nam:string[8];
   new:string[8];
   adr:string[8];
   typ:string[32];
   siz:integer;
 end;

const
 extsize = 7;
 ext:array[1..extsize] of string[10]=('db','val','px','xg0','yg0','xg1','yg1');
 _cis_par:TMyUp=(nam:'cis_par';new:'_cis_par';adr:'comm_rok';typ:'1010000';siz:4);
 _setup:TMyUp=(nam:'setup';new:'_setup';adr:'comm_rok';typ:'1100000';siz:100);
 _rzp:TMyUp=(nam:'rzp';new:'_rzp';adr:'data';typ:'1110000';siz:36);
 _inf:TMyUp=(nam:'inf';new:'_inf';adr:'data';typ:'1000000';siz:76);

implementation

uses
  classes,
  Forms,
  FMXUtils,
  FileCtrl,
  db,
  SysUtils,
  MyConsts,
  IniFiles,
  Main;

var
  T1: TTable;
  T2: TTable;
  PARAMETER34: boolean;

procedure PrcUp(T1,T2:TTable;X:TMyUp);
begin
 if X.Nam = 'cis_par' then begin
   T2.FieldByName('MESIAC_OD').Value := 1;
   T2.FieldByName('MESIAC_DO').Value := 12;
   if (T2.FieldByName('ID').Value = 34) and (T2.FieldByName('HODNOTA').Value='1')
     then PARAMETER34:=True;
 end else
 if X.nam = 'setup' then begin
   T2.FieldByName('JAN').Value := 23;
   T2.FieldByName('FEB').Value := 21;
   T2.FieldByName('MAR').Value := 21;
   T2.FieldByName('APR').Value := 22;
   T2.FieldByName('MAJ').Value := 22;
   T2.FieldByName('JUN').Value := 21;
   T2.FieldByName('JUL').Value := 23;
   T2.FieldByName('AUG').Value := 21;
   T2.FieldByName('SEP').Value := 22;
   T2.FieldByName('OKT').Value := 23;
   T2.FieldByName('NOV').Value := 20;
   T2.FieldByName('DEC').Value := 23;
   T2.FieldByName('JAN1').Value := 1;
   T2.FieldByName('FEB1').Value := 0;
   T2.FieldByName('MAR1').Value := 2;
   T2.FieldByName('APR1').Value := 0;
   T2.FieldByName('MAJ1').Value := 2;
   T2.FieldByName('JUN1').Value := 0;
   T2.FieldByName('JUL1').Value := 0;
   T2.FieldByName('AUG1').Value := 1;
   T2.FieldByName('SEP1').Value := 2;
   T2.FieldByName('OKT1').Value := 0;
   T2.FieldByName('NOV1').Value := 1;
   T2.FieldByName('DEC1').Value := 3;
 end else
 if X.nam = 'inf' then begin
   T2.FieldByName('Riadenie').Value := 1;
   if PARAMETER34
     then T2.FieldByName('SP_Identifikator').Value := 2
     else T2.FieldByName('SP_Identifikator').Value := 1;
 end else
 if X.nam = 'rzp' then begin
   T2.FieldByName('Nc_minimum_dochodok').Value := 0;
   T2.FieldByName('Nc_minimum_upravena').Value := T2.FieldByName('Nc_minimum').Value;
   T2.FieldByName('Nc_partner_upravena').Value := T2.FieldByName('Nc_partner').Value;
   T2.FieldByName('Nc_partner_prijem').Value := 0;
   T2.FieldByName('Nc_partner_mesiacov').Value := 12;
   T2.FieldByName('Uplatnuje_nc_minimum').Value := T2.FieldByName('Nc_minimum').Value>0;
   T2.FieldByName('Uplatnuje_nc_partner').Value := T2.FieldByName('Nc_partner').Value>0;
 end
{ else
 if X.nam = 'vyp' then begin
     T2.FieldByName('Rezerva2').Value :=0;
     T2.FieldByName('Rezerva3').Value :=0;
 end;
}
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

procedure Dopln_ak_neexistuje(const sub_old,cesta:string);
var sub_new:string;
begin
  sub_new:='_'+sub_old;
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
  else if X.adr='comm_rok' then Result:=MyRokPath
  else raise EMyError.Create('chyba');
end;

procedure upgrade_table(X:TMyUp;var chyba:string);
var i,j:integer;rc,pc:longint;
 DestData,myField:string;
 myFld1:array[0..500] of integer;
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
{ MyMessage(T1.TableName+';'+IntToStr(T1.FieldCount)+';'+IntToStr(X.siz));}
 if (T1.FieldCount = X.siz) then
 begin
   for i:=1 to extsize do if Copy(X.typ,i,1)='1' then
     CopyFile(DEF_DATA+X.new+'.'+EXT[i],DestData);
   T2.Tablename:=DestData + X.new+'.db';
   T2.EmptyTable;
   T2.Open;
   {inicializacia transformacnej tabulky}
   for j:=0 to T2.FieldDefs.Count-1 do
   begin
    myField := T2.FieldDefs[j].Name;
    myFld1[j] := T1.FieldDefs.IndexOf(myField);
   end;
   while not T1.EOF do begin
     inc(pc); Progress(trunc(pc/rc*100));
     with T1 do
     T2.Insert;
     for j:=0 to T2.FieldDefs.Count-1 do
     begin
       if myFld1[j]<>-1 then T2.Fields[j].Value:=T1.Fields[myFld1[j]].Value;
     end;
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
  upgrade_table(_inf,chyba); if chyba<>'' then exit;
  upgrade_table(_rzp,chyba); if chyba<>'' then exit;

  except on E:Exception do begin chyba:='data:'+E.Message;end;end;
end;

procedure vytvor_common_rok(iRok:integer; var chyba:string);
var SrcDir,DestDir,rr_akt,rr_min:string;
begin
  rr_akt:=IntToStr(DEF_ROK_DO);
  rr_min:=IntToStr(DEF_ROK_DO-1);
  SrcDir := MyPamPath + 'COMMON\ROK'+rr_min+'\*.*';
  DestDir := MyPamPath + 'COMMON\ROK'+rr_akt+'\';
  CreateDir(DestDir);
  try
  File_Dir(
      'COPY',    //Action            : String;  //COPY, DELETE,
                                               //MOVE, RENAME
      False,    //RenameOnCollision : Boolean; //Renames if
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

  except on E:Exception do begin chyba:='vytvor_common_rok:'+E.Message;end;end;
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

procedure upgrade_common_rok(iRok:integer;var chyba:string);
begin
  try
  chyba:='';
  MyRokPath := MyCommPth + 'ROK'+IntToStr(iRok)+'\';
  if T1= nil then T1 := TTable.Create(Application);
  if T2= nil then T2 := TTable.Create(Application);
  T1.Close;
  T1.TableName:=MyRokPath+'SETUP.DB';
  try
  T1.Open;
  except end;
  if (iRok=DEF_ROK_DO) and (not T1.Active) then begin
    vytvor_common_rok(iRok,chyba); if chyba<>'' then exit;
  end else
  if not T1.Active then begin chyba:='NEEXISTUJE'; exit; end;
  T1.Close;
  if (iRok=DEF_ROK_DO) then begin
    upgrade_table(_setup,chyba); if chyba<>'' then exit;
    Tvrdo_prepis('setup.val','_setup.val',MyRokPath);
    Tvrdo_prepis('cis_par.db','8cis_par.db',MyRokPath);
    Tvrdo_prepis('cis_par.px','8cis_par.px',MyRokPath);
  end else
  begin
    upgrade_table(_cis_par,chyba); if chyba<>'' then exit;
  end;
  //Dopln_ak_neexistuje('CIS_DOCH.DB',MyRokPath);

  //upgrade_table(_setup,chyba); if chyba<>'' then exit;

 except on E:Exception do begin chyba:='upgrade_common_rok:'+E.Message;end;
 end;
end;

procedure upgrade_common(var chyba:string);
begin
  chyba:='';
end;

procedure upgrade_priv(var chyba:string);
begin
 try
 chyba:='';
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
 T1.FieldByName('PRODUCT_NAME').AsString := MyProductName;
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

begin
 PARAMETER34:=false;
end.
