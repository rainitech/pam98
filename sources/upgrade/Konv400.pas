unit Konv400;

interface

uses DBTables;

{$INCLUDE INCLUDE.INC}


procedure upgrade_data(var chyba:string);
procedure upgrade_common_rok(iRok:integer;var chyba:string);
procedure vytvor_common_rok(iRok:integer; var chyba:string);
procedure upgrade_common(var chyba:string);
procedure upgrade_private(var chyba:string);
procedure zalohovanie;

type
 TMyUp=record
   ope:string[8];
   nam:string[8];
   new:string[8];
   adr:string[8];
   typ:string[32];
   siz:integer;
 end;

const
 extsize = 7;
 ext:array[1..extsize] of string[10]=('db','val','px','xg0','yg0','xg1','yg1');
 _rzp:TMyUp=(ope:'';nam:'rzp';new:'_rzp';adr:'data';typ:'1110000';siz:43);
 _rzp2:TMyUp=(ope:'';nam:'rzp';new:'_rzp';adr:'datask';typ:'1110000';siz:43);
 _zam:TMyUp=(ope:'';nam:'zam';new:'_zam';adr:'data';typ:'1111111';siz:92);
 _zrz:TMyUp=(ope:'';nam:'zrz';new:'_zrz';adr:'data';typ:'1110000';siz:18);
 _zam_uk:TMyUp=(ope:'';nam:'zam_uk';new:'_zam_uk';adr:'data';typ:'1010000';siz:4);
 _xxxcis_par:TMyUp=(nam:'cis_par';new:'_cis_par';adr:'comm_rok';typ:'1010000';siz:4);
 _setup:TMyUp=(nam:'setup';new:'_setup';adr:'comm_rok';typ:'1100000';siz:100);
 _xxxrzp:TMyUp=(nam:'rzp';new:'_rzp';adr:'data';typ:'1110000';siz:36);
 _xxxinf:TMyUp=(nam:'inf';new:'_inf';adr:'data';typ:'1000000';siz:76);

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
  T3: TTable;
  TINF: TTable;
  PARAMETER34: boolean;

procedure PrcUp(T1,T2,TINF:TTable;X:TMyUp);
begin
 if X.Nam = 'cis_par' then begin
 end else
 if X.nam = 'setup' then begin
   { kalendar pre rok 2009 }
   T2.FieldByName('JAN').Value := 22;
   T2.FieldByName('FEB').Value := 20;
   T2.FieldByName('MAR').Value := 22;
   T2.FieldByName('APR').Value := 22;
   T2.FieldByName('MAJ').Value := 21;
   T2.FieldByName('JUN').Value := 22;
   T2.FieldByName('JUL').Value := 23;
   T2.FieldByName('AUG').Value := 21;
   T2.FieldByName('SEP').Value := 22;
   T2.FieldByName('OKT').Value := 22;
   T2.FieldByName('NOV').Value := 21;
   T2.FieldByName('DEC').Value := 23;
   T2.FieldByName('JAN1').Value := 2;
   T2.FieldByName('FEB1').Value := 0;
   T2.FieldByName('MAR1').Value := 0;
   T2.FieldByName('APR1').Value := 2;
   T2.FieldByName('MAJ1').Value := 2;
   T2.FieldByName('JUN1').Value := 0;
   T2.FieldByName('JUL1').Value := 0;
   T2.FieldByName('AUG1').Value := 0;
   T2.FieldByName('SEP1').Value := 2;
   T2.FieldByName('OKT1').Value := 0;
   T2.FieldByName('NOV1').Value := 1;
   T2.FieldByName('DEC1').Value := 2;
 end else
 if X.nam = 'inf' then begin
 end else
 if X.nam = 'rzp' then begin
   T2.FieldByName('Zdravotnici_vzdelavanie').Value := 0;
 end
 else
 if X.nam = 'zam' then begin
     if T2.FieldByName('MV_Plat').AsString<>'' then begin
       if T2.FieldByName('Typzec').Value = 2 {dohodar} then
       T2.FieldByName('MV_Plat').Value := KonverziaSKK_EUR_nahor(T2.FieldByName('MV_Plat').Value)
       else
       T2.FieldByName('MV_Plat').Value := KonverziaSKK_EUR(T2.FieldByName('MV_Plat').Value);
     end;
     if T2.FieldByName('V_Sadzba').AsString<>'' then
     T2.FieldByName('V_sadzba').Value := ZAOKRUHLI(T2.FieldByName('V_Sadzba').Value/KonvKurzEuro,-4,2);
     if T2.FieldByName('Sporenie').AsString<>'' then
     T2.FieldByName('Sporenie').Value := KonverziaSKK_EUR(T2.FieldByName('Sporenie').Value);
     if T2.FieldByName('Pouz_auto').AsString<>'' then
     T2.FieldByName('Pouz_auto').Value := KonverziaSKK_EUR(T2.FieldByName('Pouz_auto').Value);
     if T2.FieldByName('Ne_zaloha').AsString<>'' then
     T2.FieldByName('Ne_zaloha').Value := KonverziaSKK_EUR(T2.FieldByName('Ne_zaloha').Value);
     if T2.FieldByName('Ne_pozicky').AsString<>'' then
     T2.FieldByName('Ne_pozicky').Value := KonverziaSKK_EUR(T2.FieldByName('Ne_pozicky').Value);
     if T2.FieldByName('Ne_odborar').AsString<>'' then
     T2.FieldByName('Ne_odborar').Value := KonverziaSKK_EUR(T2.FieldByName('Ne_odborar').Value);
     if T2.FieldByName('Ne_poistovna').AsString<>'' then
     T2.FieldByName('Ne_poistovna').Value := KonverziaSKK_EUR(T2.FieldByName('Ne_poistovna').Value);
     if T2.FieldByName('Ne_exekucia').AsString<>'' then
     T2.FieldByName('Ne_exekucia').Value := KonverziaSKK_EUR(T2.FieldByName('Ne_exekucia').Value);
     if T2.FieldByName('Zvys_ostatne').AsString<>'' then
     T2.FieldByName('Zvys_ostatne').Value := KonverziaSKK_EUR(T2.FieldByName('Zvys_ostatne').Value);
     if T2.FieldByName('N_ddp').AsString<>'' then
     T2.FieldByName('N_ddp').Value := KonverziaSKK_EUR(T2.FieldByName('N_ddp').Value);
     if T2.FieldByName('Nz_ddp').AsString<>'' then
     T2.FieldByName('Nz_ddp').Value := KonverziaSKK_EUR(T2.FieldByName('Nz_ddp').Value);
     if TINF.FieldByName('F_typ_premii').Value = 0 then begin
       if T2.FieldByName('F_sadzba_premii').AsString<>'' then
       T2.FieldByName('F_sadzba_premii').Value := KonverziaSKK_EUR(T2.FieldByName('F_sadzba_premii').Value);
     end;
 end
 else
 if X.nam = 'zrz' then begin
     if (T2.FieldByName('Suma').AsString<>'') and (T2.FieldByName('Typ_sumy').Value=0) then
     T2.FieldByName('Suma').Value := KonverziaSKK_EUR(T2.FieldByName('Suma').Value);
 end
 else
 if X.nam = 'zam_uk' then begin
     if T2.FieldByName('Hodnota').AsString<>'' then
     T2.FieldByName('Hodnota').Value := ZAOKRUHLI(T2.FieldByName('Hodnota').Value * 10000 / KonvKurzEuro,0,5)/10000;
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
// MyBkpPath:=ExtractFileDir(cesta)+'.'+DEF_BKP_EXT;
 MyBkpPath:=ExtractFileDir(cesta)+'.'+DEF_BKP_EXT;
 {$i-} mkdir(MyBkpPath); {$i+}
 CopyFile(DEF_DATA+sub_new,cesta);
 CopyFileX(cesta+sub_old,MyBkpPath);
 MoveFile(cesta+sub_new,cesta+sub_old);
end;

function GetDestPath(X:TMyUp):string;
begin
  if X.adr='data' then Result:=MyDataPth
  else if X.adr='datask' then Result:=MyDataskPth
  else if X.adr='priv' then Result:=MyPrivPth
  else if X.adr='comm' then Result:=MyCommPth
  else if X.adr='comm_rok' then Result:=MyRokPath
  else raise EMyError.Create('chyba');
end;

procedure upgrade_table(X:TMyUp;var chyba:string);
var i,j:integer;rc,pc:longint;
 DestData,DestDataSkk,myField:string;
 myFld1:array[0..500] of integer;
begin
 try
 chyba:='';
 T1.Close;
 T2.Close;
 TINF.Close;
 DestData:=GetDestPath(X);
 DestDataSkk:=GetDestPath(X)+'datask\';
 T1.TableName:=DestData + X.nam+'.db';
 if Pos('data\datask',lowercase(DestData))<>0 then exit;
 if X.ope='DELETE' then begin
   if Pos('data\datask',lowercase(DestDataSkk))<>0 then begin
     T1.Close;
     exit;
   end;
   T3.Close;
   T3.TableName:=DestDataSkk + X.nam+'.db';
   T1.Open;
   T3.Open;
   if T1.RecordCount = T3.RecordCount then begin
     T1.Close;
     T3.Close;
     T1.EmptyTable;
   end else begin
     T1.Close;
     T3.Close;
   end;
   exit;
 end;
 if X.nam='zam' then begin
   TINF.TableName:=GetDestPath(X) + 'inf.db';
   TINF.Open;
 end;
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
     PrcUp(T1,T2,TINF,X);
     T2.Post;
     T1.Next;
   end;
   T2.Close;
   T1.Close;
   if X.nam='zam' then TINF.Close;
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
  if T3= nil then T3 := TTable.Create(Application);
  if TINF= nil then TINF := TTable.Create(Application);
  upgrade_table(_zam,chyba); if chyba<>'' then exit;
  upgrade_table(_zrz,chyba); if chyba<>'' then exit;
  upgrade_table(_zam_uk,chyba); if chyba<>'' then exit;
  upgrade_table(_rzp,chyba); if chyba<>'' then exit;
  upgrade_table(_rzp2,chyba); if chyba<>'' then exit;
(*
  upgrade_table(_inf,chyba); if chyba<>'' then exit;
  upgrade_table(_rzp,chyba); if chyba<>'' then exit;
*)
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
    Tvrdo_prepis('setup.db','9setup.db',MyRokPath);
    Tvrdo_prepis('setup.val','9setup.val',MyRokPath);
    Tvrdo_prepis('cis_par.db','9cis_par.db',MyRokPath);
    Tvrdo_prepis('cis_par.px','9cis_par.px',MyRokPath);
  end else
  begin
  end;
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
 T1.TableName:=MyPrivPth+'SYS.DB';
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

procedure zalohovanie;
var i,jj:integer;s,nazov5,AdrRok,SrcDir,DestDir,SrcDirDel:string;
  AYear,AMonth,ADay:word;mmdd:string[4];myFile:text;
begin
  DecodeDate(Now, AYear, AMonth, ADay);
  mmdd:= Format('%.2d%.2d',[AMonth,ADay]);
  MyBkpPath:=MyNetPath+'zaloha\';
  //ExecuteFileX(MyAppPath+MenoZip,'-r -9 "'+MyBkpPath+nazov5+'com" "'+MyCommPth+'*.*"',MyCommPth,1);
  for i:=1 to 99 do
  begin
    if i=0 then s:='' else s:=Format('%.2d',[i]);
    if FileExists(MyNetPath+'DATA'+s+'\inf.db') then begin
      nazov5:='zup09';
      if FileExists(MyBkpPath+nazov5+'d'+s+'.zip') then begin
        nazov5:='zuq09';
        if FileExists(MyBkpPath+nazov5+'d'+s+'.zip') then nazov5:='zur09';
      end;
      ExecuteFileX(MyAppPath+MenoZip,' -r -9 "'+MyBkpPath+nazov5+'d'+s+'.zip" "./*.*"',MyNetPath+'data'+s+'\',1);
      SrcDir := MyNetPath+'DATA'+s+'\*.*';
      DestDir := MyNetPath+'DATA'+s+'\datask\';
      CreateDir(DestDir);
      if true{not FileExists(MyNetPath+'DATA'+s+'\datask\inf.db')} then
      begin
      try
      File_Dir(
          'COPY',    //Action            : String;  //COPY, DELETE, MOVE, RENAME
          False,    //RenameOnCollision : Boolean; //Renames if directory exists
          True,     //NoConfirmation    : Boolean; //Responds "Yes to All" to any dialogs
          False,     //Silent            : Boolean; //No progress dialog is shown
          True,    //ShowProgress      : Boolean; //displays progress dialog but no file names
          SrcDir,   //FromDir : String;  //From directory
          DestDir   //ToDir   : String   //To directory
          );
      except on E:Exception do
       begin MyError('Chyba pri vytvarani adresara '+MyNetPath+'DATA'+s+'\datask. '+E.Message); end;
      end;
      try
      for jj:=23 to 32 do begin
      SrcDirDel := MyNetPath+'DATA'+s+'.X'+IntToStr(jj);
      File_Dir(
          'DELETE',    //Action            : String;  //COPY, DELETE, MOVE, RENAME
          False,    //RenameOnCollision : Boolean; //Renames if directory exists
          True,     //NoConfirmation    : Boolean; //Responds "Yes to All" to any dialogs
          True,     //Silent            : Boolean; //No progress dialog is shown
          True,    //ShowProgress      : Boolean; //displays progress dialog but no file names
          SrcDirDel,   //FromDir : String;  //From directory
          SrcDirDel   //ToDir   : String   //To directory
          );
      end;
      except on E:Exception do
       begin end;
      end;
      end;
      end;
  end;
end;

begin
 PARAMETER34:=false;
end.
