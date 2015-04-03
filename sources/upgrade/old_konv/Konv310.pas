unit Konv310;

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
   typ:string[5];
   siz:integer;
 end;

const
 extsize = 7;
 ext:array[1..extsize] of string[10]=('db','val','px','xg0','yg0','xg1','yg1');
 _cis_zp:TMyUp=(nam:'cis_zp';new:'_cis_zp';adr:'comm_rok';typ:'1110000';siz:2);
 _setup:TMyUp=(nam:'setup';new:'_setup';adr:'comm_rok';typ:'1100000';siz:100);
 _inf:TMyUp=(nam:'inf';new:'_inf';adr:'data';typ:'1000000';siz:59);
 _nep:TMyUp=(nam:'nep';new:'_nep';adr:'data';typ:'1111100';siz:9);
 _zam:TMyUp=(nam:'zam';new:'_zam';adr:'data';typ:'1111111';siz:104);
 _rzp:TMyUp=(nam:'rzp';new:'_rzp';adr:'data';typ:'1110000';siz:33);
 _vyp:TMyUp=(nam:'vyp';new:'_vyp';adr:'data';typ:'1111100';siz:236);

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
  Q1: TQuery;

procedure PrcUp(T1,T2:TTable;X:TMyUp);
 var oUlica,oCislo,rStav:string;
begin

 if X.nam='inf' then begin
   T2.FieldByName('ADR_ULICA1').Value := T2.FieldByName('ADR_ULICA').Value +' '+T2.FieldByName('ADR_CISLO').Value;
   T2.FieldByName('ADR_STAT').Value := '703';
   if Trim(T1.FieldByName('ADR_MESTO').Value)<>''
    then T2.FieldByName('ADR_STAT').Value := '703';
 end else
 if X.nam='rzp' then begin
 end else
 if X.nam='vyp' then begin
   T2.FieldByName('V_nepoist_zp').Value := T1.FieldByName('V_uraz').Value;

   if T1.FieldByName('U_dopravne_mimoriadne').Value= 255
    then T2.FieldByName('U_sds').Value := 1
     else T2.FieldByName('U_sds').Value := 0;

   T2.FieldByName('Vyrovnanie_zp').Value:= 0;
   T2.FieldByName('Version').Value :=
     Copy(T2.FieldByName('Verzia').AsString,1,1)+'.'+
     Copy(T2.FieldByName('Verzia').AsString,2,100);

   T2.FieldByName('V_nepoist_zp').Value :=
     T2.FieldByName('v_pn1').Value +
     T2.FieldByName('v_pn2').Value +
     T2.FieldByName('v_nahrada_pn1').Value +
     T2.FieldByName('v_nahrada_pn2').Value +
     T2.FieldByName('v_ocr1').Value +
     T2.FieldByName('v_ocr2').Value +
     T2.FieldByName('v_uraz').Value;

 end else
 if X.nam='nep' then begin
   T2.FieldByName('Prerusenie').AsString := '';
   case T1.FieldByName('Typ').Value of
     4: T2.FieldByName('Prerusenie').Value := 3;
     3: T2.FieldByName('Prerusenie').Value := 1;
     1,2: if FormatDateTime('yyyy',T2.FieldByName('Datum_od').Value)>'2004' then
          T2.FieldByName('Prerusenie').Value := 4;
   else T2.FieldByName('Prerusenie').AsString := '';
   end;
   if T2.FieldByName('Prerusenie').AsString <> ''
    then T2.FieldByName('TypRL').Value := 'PE'
    else T2.FieldByName('TypRL').Value := '00';
   T2.FieldByName('TypRL2').Value := 1;
 end else
 if X.nam='zam' then begin
   T2.FieldByName('TYPZEC').Value := 1;
   rStav := T1.FieldByName('Rod_stav').AsString;
   if LENGTH(rStav)>0 then
   case rStav[1] of
    'S':T2.FieldByName('Rod_stav').Value := '1';
    'Z':T2.FieldByName('Rod_stav').Value := '2';
    'R':T2.FieldByName('Rod_stav').Value := '3';
    'V':T2.FieldByName('Rod_stav').Value := '4';
    else T2.FieldByName('Rod_stav').AsString := '';
   end;
   if T1.FieldByName('Born_numb').AsString<>'' then
    T2.FieldByName('Born_numb').AsString := RC_BEZ(T1.FieldByName('Born_numb').Value);
   T2.FieldByName('Stat_obcan').Value := 703;
   if T1.FieldByName('Tp_city').AsString<>'' then
     T2.FieldByName('Stat_tp').Value := 703;
   if T1.FieldByName('Pp_city').AsString<>'' then
     T2.FieldByName('Stat_pp').Value := 703;
   if T1.FieldByName('Pd_osoby').Value= 255
    then T2.FieldByName('U_sds').Value := 1
     else T2.FieldByName('U_sds').Value := 0;
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

procedure Tvrdo_Prepis(const sub_old,cesta:string);
var sub_new:string;
begin
 sub_new:='_'+sub_old;
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
 if (T1.FieldCount = X.siz) or (X.nam='inf') or (X.nam='rzp') then
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

procedure NacitajNastavenia (var T1:TTable);
  var MyIni:TIniFile;
begin
  try
  MyIni:=TIniFile.Create(MyAppPath+'TEXTY.INI');
  T1.Edit;
  T1.FieldByName('VYKAZ_ZOSTAVIL').Value := MyIni.ReadString(coReportDoplnok,'VYKAZ_ZOSTAVIL','');
  T1.FieldByName('DEN').Value  := now;
  T1.FieldByName('MIESTO').Value  := MyIni.ReadString(coReportDoplnok,'VYKAZ_MIESTO','');
  T1.FieldByName('TELEFON').Value := MyIni.ReadString(coReportDoplnok,'TELEFON','');
  T1.FieldByName('FAX').Value := MyIni.ReadString(coReportDoplnok,'FAX','');
  T1.FieldByName('KONTAKTNA_OSOBA').Value := MyIni.ReadString(coReportDoplnok,'KONTAKTNA_OSOBA','');
  T1.Post;
  except on E:Exception do
  MyError('Chyba pri naèítaní nastavení:'+E.Message);
  end;
end;

procedure upgrade_data(var chyba:string);
begin
  try
  if T1= nil then T1 := TTable.Create(Application);
  if T2= nil then T2 := TTable.Create(Application);

  upgrade_table(_inf,chyba); if chyba<>'' then exit;
  upgrade_table(_zam,chyba); if chyba<>'' then exit;
  upgrade_table(_nep,chyba); if chyba<>'' then exit;
  upgrade_table(_rzp,chyba); if chyba<>'' then exit;
  upgrade_table(_vyp,chyba); if chyba<>'' then exit;

  Dopln_ak_neexistuje('CIS_PU.DB',MyDataPth);
  Dopln_ak_neexistuje('CIS_PU.PX',MyDataPth);
  Dopln_ak_neexistuje('doch.db',MyDataPth);
  Dopln_ak_neexistuje('doch.px',MyDataPth);
  Dopln_ak_neexistuje('eldp.db',MyDataPth);
  Dopln_ak_neexistuje('eldp.px',MyDataPth);
  Dopln_ak_neexistuje('tlac_par.db',MyDataPth);
  Dopln_ak_neexistuje('zp_pstat.db',MyDataPth);
  Dopln_ak_neexistuje('zp_pstat.px',MyDataPth);
  Dopln_ak_neexistuje('zp_tab.db',MyDataPth);
  Dopln_ak_neexistuje('zp_tab.px',MyDataPth);
  Dopln_ak_neexistuje('zp_univ.db',MyDataPth);
  Dopln_ak_neexistuje('zp_univ.px',MyDataPth);
  Dopln_ak_neexistuje('zp_znec.db',MyDataPth);
  Dopln_ak_neexistuje('zp_znec.px',MyDataPth);

  T1.Close;
  T1.TableName:=MyDataPth+'tlac_par.db';
  T1.Open;
  NacitajNastavenia(T1);
  T1.Close;

  except on E:Exception do begin chyba:='data:'+E.Message;end;end;
end;

procedure vytvor_common_rok(iRok:integer; var chyba:string);
var MyDestPth:array[1..999] of string[128];MyCurrDir,SrcDir,DestDir,rr_akt,rr_min:string;
  Found,pocet,i:integer;SearchRec:TSearchRec;uspech:boolean;
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
  Tvrdo_prepis('cis_par.db',DestDir);
  Tvrdo_prepis('cis_par.px',DestDir);
  Tvrdo_prepis('setup.db',DestDir);
  Tvrdo_prepis('setup.val',DestDir);

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
  if iRok=DEF_ROK_DO then begin vytvor_common_rok(iRok,chyba); exit; end;
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
  if not T1.Active then begin chyba:='NEEXISTUJE'; exit; end;
  T1.Close;

  Dopln_ak_neexistuje('CIS_DOCH.DB',MyRokPath);
  Dopln_ak_neexistuje('CIS_ELDZ.DB',MyRokPath);
  Dopln_ak_neexistuje('CIS_PAR.DB',MyRokPath);
  Dopln_ak_neexistuje('CIS_PAR.PX',MyRokPath);
  Dopln_ak_neexistuje('CIS_STAT.DB',MyRokPath);
  Dopln_ak_neexistuje('CIS_STAT.PX',MyRokPath);
  Dopln_ak_neexistuje('CIS_STAT.XG0',MyRokPath);
  Dopln_ak_neexistuje('CIS_STAT.YG0',MyRokPath);
  Dopln_ak_neexistuje('CIS_STAV.DB',MyRokPath);
  Dopln_ak_neexistuje('Prerus1.DB',MyRokPath);
  Dopln_ak_neexistuje('Prerus1.PX',MyRokPath);
  Dopln_ak_neexistuje('Typfo.DB',MyRokPath);
  Dopln_ak_neexistuje('Typrl.DB',MyRokPath);
  Dopln_ak_neexistuje('Typrl.PX',MyRokPath);
  Dopln_ak_neexistuje('Typrl2.DB',MyRokPath);
  Dopln_ak_neexistuje('Typzec.DB',MyRokPath);
  Dopln_ak_neexistuje('Typzel.DB',MyRokPath);
  Dopln_ak_neexistuje('Typzuct.DB',MyRokPath);

  upgrade_table(_cis_zp,chyba); if chyba<>'' then exit;
  upgrade_table(_setup,chyba); if chyba<>'' then exit;

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
{ Dopln_ak_neexistuje('hld.db',MyPrivPth);}
 Dopln_Ak_Neexistuje('hld.db',MyPrivPth);
 Dopln_Ak_Neexistuje('hld.px',MyPrivPth);

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

end.
