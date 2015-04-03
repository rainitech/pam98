unit Konv440x;

interface

uses DBTables;

{$INCLUDE INCLUDE.INC}


procedure upgrade_data(var chyba:string);
procedure upgrade_data_skk(var chyba:string);
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
 _zam:TMyUp=(ope:'';nam:'zam';new:'_zam';adr:'data';typ:'1111111';siz:92);
 _vyp:TMyUp=(ope:'';nam:'vyp';new:'_vyp';adr:'data';typ:'1111100';siz:243);
 _inf:TMyUp=(ope:'';nam:'inf';new:'_inf';adr:'data';typ:'1000000';siz:80);
 _nep:TMyUp=(ope:'';nam:'nep';new:'_nep';adr:'data';typ:'1111100';siz:11);
 _rzp:TMyUp=(ope:'';nam:'rzp';new:'_rzp';adr:'data';typ:'1110000';siz:50);

var PocetChybKonverzie: longint;

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
  AdresyReport: TStringList;
  BOOL_UPGRADE_DATA_SKK: boolean;

procedure MyDeleteFile(const s:string);
begin
  if FileExists(s) then DeleteFile(s);
end;

procedure PrcUp(T1,T2,TINF:TTable;X:TMyUp);
var
    U1,U2,U3: string;
begin
 if X.Nam = 'zam' then begin
   T2.FieldByName('Born_name').Value := T2.FieldByName('Prev_name').Value;
   { ----- TRVALY POBYT -----}
   MyRozdelUlicuExt(T2.FieldByName('Tp_street').AsString,U1,U2,U3);
   T2.FieldByName('Tp_ulica').Value := U1;
   T2.FieldByName('Tp_ocislo').Value := U2;
   try
   T2.FieldByName('Tp_supcislo').AsString := U3;
   except end;
   if (not BOOL_UPGRADE_DATA_SKK)
       AND (trim(T2.FieldByName('Tp_street').AsString)<>'')
       AND (T2.FieldByName('Vystup').AsString<>'')
   then begin
     AdresyReport.ADD('<tr>');
     AdresyReport.ADD('<td>'+Lowercase(Copy(MyDataPth,Length(MyDataPth)-6,99))+'</td>');
     AdresyReport.ADD('<td>'+T2.FieldByName('Code_numb').AsString+'</td>');
     AdresyReport.ADD('<td>'+T2.FieldByName('Surname').AsString+'</td>');
     AdresyReport.ADD('<td>trvalá</td>');
     AdresyReport.ADD('<td>'+T2.FieldByName('Tp_street').AsString+'</td>');
     AdresyReport.ADD('<td>'+T2.FieldByName('Tp_ulica').AsString+'</td>');
     AdresyReport.ADD('<td>'+T2.FieldByName('Tp_ocislo').AsString+'</td>');
     AdresyReport.ADD('<td>'+T2.FieldByName('Tp_supcislo').AsString+'</td>');
     AdresyReport.ADD('</tr>');
   end;
   { ----- KORESPONDENCNA ADRESA -----}
   MyRozdelUlicuExt(T2.FieldByName('Pp_street').AsString,U1,U2,U3);
   T2.FieldByName('Pp_ulica').Value := U1;
   T2.FieldByName('Pp_ocislo').Value := U2;
   try
   T2.FieldByName('Pp_supcislo').AsString := U3;
   except end;
   if (not BOOL_UPGRADE_DATA_SKK)
       AND (trim(T2.FieldByName('Pp_street').AsString)<>'')
       AND (T2.FieldByName('Vystup').AsString<>'')
   then begin
     AdresyReport.ADD('<tr>');
     AdresyReport.ADD('<td>'+Lowercase(Copy(MyDataPth,Length(MyDataPth)-6,99))+'</td>');
     AdresyReport.ADD('<td>'+T2.FieldByName('Code_numb').AsString+'</td>');
     AdresyReport.ADD('<td>'+T2.FieldByName('Surname').AsString+'</td>');
     AdresyReport.ADD('<td>trvalá</td>');
     AdresyReport.ADD('<td>'+T2.FieldByName('Pp_street').AsString+'</td>');
     AdresyReport.ADD('<td>'+T2.FieldByName('Pp_ulica').AsString+'</td>');
     AdresyReport.ADD('<td>'+T2.FieldByName('Pp_ocislo').AsString+'</td>');
     AdresyReport.ADD('<td>'+T2.FieldByName('Pp_supcislo').AsString+'</td>');
     AdresyReport.ADD('</tr>');
   end;

 end else
 if X.nam = 'vyp' then begin
   T2.FieldByName('Zniz_ostatne').Value := 0;
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
  else if X.adr='datask' then Result:=MyDataSkk
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
 T1.TableName:=DestData + X.nam+'.db';
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
 except on E:Exception do begin Progress(100); chyba:=X.nam+':'+E.Message; inc(PocetChybKonverzie); end;end;
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

procedure upgrade_data( var chyba:string);
var SrcDir,DestDir : string;
begin
  try
  if T1= nil then T1 := TTable.Create(Application);
  if T2= nil then T2 := TTable.Create(Application);
  if T3= nil then T3 := TTable.Create(Application);
  if TINF= nil then TINF := TTable.Create(Application);

  upgrade_table(_zam,chyba); if chyba<>'' then exit;
  upgrade_table(_vyp,chyba); if chyba<>'' then exit;
  upgrade_table(_inf,chyba); if chyba<>'' then exit;
  upgrade_table(_nep,chyba); if chyba<>'' then exit;
  upgrade_table(_rzp,chyba); if chyba<>'' then exit;

  if not BOOL_UPGRADE_DATA_SKK then begin

  SrcDir := DEF_DATA + 'outbox.conf';
  DestDir := MyDataPth;
  ForceDirectories(DestDir);

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

  end;

  (*

  Dopln_ak_neexistuje('vypnp.db',MyDataPth);
  Dopln_ak_neexistuje('vypnp.px',MyDataPth);
  Dopln_ak_neexistuje('vypnp.val',MyDataPth);
  Dopln_ak_neexistuje('vypnp.xg0',MyDataPth);
  Dopln_ak_neexistuje('vypnp.yg0',MyDataPth);
*)
  except on E:Exception do begin chyba:='data:'+E.Message; Inc(PocetChybKonverzie); end;end;
end;

procedure upgrade_data_skk( var chyba:string);
begin
try
  BOOL_UPGRADE_DATA_SKK := true;
  upgrade_data(chyba);
finally
  BOOL_UPGRADE_DATA_SKK := false;
end;
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

  except on E:Exception do begin chyba:='vytvor_common_rok:'+E.Message; Inc(PocetChybKonverzie); end;end;
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
  if (iRok=2010) then begin
    T1.TableName:=MyRokPath+'CIS_PAR.DB';
    try
    T1.Open;
    T1.Filter:='ID=36';
    T1.Filtered := True;
    if T1.FieldByName('ID').Value=36 then begin
      T1.Edit;
      T1.FieldByName('Hodnota').Value:=15387.12;
      T1.Post;
    end;
    T1.Filter:='';
    T1.Filtered:=False;
    T1.Close;
    except T1.Filter:='';T1.Filtered:=False; end;
  end else
  if (iRok=2011) then begin
    T1.TableName:=MyRokPath+'CIS_PAR.DB';
    try
    T1.Open;
{ nastav hodnotu pre parameter 36 }
    T1.Filter:='ID=36';
    T1.Filtered := True;
    if T1.FieldByName('ID').Value=36 then begin
      T1.Edit;
      T1.FieldByName('Hodnota').Value:=18538.00;
      T1.Post;
    end;
    T1.Filter:='';
    T1.Filtered:=False;
{ nastav hodnotu pre parameter 28 }
    T1.Filter:='ID=28 AND MESIAC_OD=7';
    T1.Filtered := True;
    if T1.FieldByName('ID').Value=28 then begin
      T1.Edit;
      T1.FieldByName('Hodnota').Value:=20.51;
      T1.Post;
    end;
    T1.Filter:='';
    T1.Filtered:=False;
    T1.Close;
    except T1.Filter:='';T1.Filtered:=False; end;
  end else
  if (iRok=2012) then begin
    T1.TableName:=MyRokPath+'CIS_PAR.DB';
    try
    T1.Open;
{ nastav hodnotu pre parameter 36 }
    T1.Filter:='ID=36';
    T1.Filtered := True;
    if T1.FieldByName('ID').Value=36 then begin
      T1.Edit;
      T1.FieldByName('Hodnota').Value:=18983.00;
      T1.Post;
    end;
    T1.Filter:='';
    T1.Filtered:=False;
{ nastav hodnotu pre parameter 28 }
    T1.Filter:='ID=28 AND MESIAC_OD=7';
    T1.Filtered := True;
    if T1.FieldByName('ID').Value=28 then begin
      T1.Edit;
      T1.FieldByName('Hodnota').Value:=21.03;
      T1.Post;
    end;
    T1.Filter:='';
    T1.Filtered:=False;
    T1.Close;
    except T1.Filter:='';T1.Filtered:=False; end;
  end;
  if (iRok=DEF_ROK_DO) then begin
    Tvrdo_prepis('cis_par.db','0cis_par.db',MyRokPath);
    Tvrdo_prepis('cis_par.px','0cis_par.px',MyRokPath);
    Tvrdo_prepis('dzp.db','0dzp.db',MyRokPath);
    Tvrdo_prepis('dzp.px','0dzp.px',MyRokPath);
    Tvrdo_prepis('prerus1.db','0prerus1.db',MyRokPath);
    Tvrdo_prepis('prerus1.px','0prerus1.px',MyRokPath);
    Tvrdo_prepis('typzec.db','0typzec.db',MyRokPath);
    Tvrdo_prepis('typzec.px','0typzec.px',MyRokPath);
    Tvrdo_prepis('typrl.db','0typrl.db',MyRokPath);
    Tvrdo_prepis('typrl.px','0typrl.px',MyRokPath);
    //
   { kalendar pre rok 2012 }
    T1.TableName:=MyRokPath+'SETUP.DB';
    T1.Open;
    T1.Edit;
    T1.FieldByName('JAN').Value := 23;
    T1.FieldByName('FEB').Value := 20;
    T1.FieldByName('MAR').Value := 21;
    T1.FieldByName('APR').Value := 22;
    T1.FieldByName('MAJ').Value := 23;
    T1.FieldByName('JUN').Value := 20;
    T1.FieldByName('JUL').Value := 23;
    T1.FieldByName('AUG').Value := 22;
    T1.FieldByName('SEP').Value := 21;
    T1.FieldByName('OKT').Value := 23;
    T1.FieldByName('NOV').Value := 21;
    T1.FieldByName('DEC').Value := 22;
    T1.FieldByName('JAN1').Value := 1;
    T1.FieldByName('FEB1').Value := 0;
    T1.FieldByName('MAR1').Value := 1;
    T1.FieldByName('APR1').Value := 1;
    T1.FieldByName('MAJ1').Value := 2;
    T1.FieldByName('JUN1').Value := 0;
    T1.FieldByName('JUL1').Value := 1;
    T1.FieldByName('AUG1').Value := 1;
    T1.FieldByName('SEP1').Value := 0;
    T1.FieldByName('OKT1').Value := 0;
    T1.FieldByName('NOV1').Value := 1;
    T1.FieldByName('DEC1').Value := 3;
    T1.Post;
    T1.Close;
  end else
  begin
  end;
 except on E:Exception do begin chyba:='upgrade_common_rok:'+E.Message; Inc(PocetChybKonverzie); end;
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
 except on E:Exception do begin chyba:='priv:'+E.Message; Inc(PocetChybKonverzie); end;end;
end;

procedure upgrade_sys(var chyba:string);
begin
 try
 chyba:='';
{
 Tvrdo_prepis('sys.db','0sys.db',MyPrivPth);
 Tvrdo_prepis('sys.val','0sys.val',MyPrivPth);
}
 T1.Close;
 T1.TableName:=MyPrivPth+'SYS.DB';
 T1.Open;
 T1.Edit;
 T1.FieldByName('REGISTERED').AsBoolean := False;
 T1.FieldByName('PRODUCT_NAME').AsString := MyProductName;
 T1.FieldByName('REG_KEY').AsString := '';
 T1.FieldByName('VOLUME_SN').AsString := '';
 T1.FieldByName('DUMMY_KEY').AsString := '';
{ T1.FieldByName('POCET_ZAM').AsInteger := 5;
 T1.FieldByName('POCET_FIRIEM').AsInteger := 1;
}
 T1.Post;
 T1.Close;
 except on E:Exception do begin chyba:='sys:'+E.Message; Inc(PocetChybKonverzie); end;end;
end;

procedure upgrade_private(var chyba:string);
begin
 try
 if T1= nil then T1 := TTable.Create(Application);
 if T2= nil then T2 := TTable.Create(Application);
 chyba:='';
 upgrade_priv(chyba); if chyba<>'' then exit;
 upgrade_sys(chyba);  if chyba<>'' then exit;
 except on E:Exception do begin chyba:='priv:'+E.Message; Inc(PocetChybKonverzie); end;end;
end;

procedure zalohovanie;
var i,jj,zz:integer;s,nazov5,AdrRok,SrcDir,DestDir,SrcDirDel:string;
  AYear,AMonth,ADay:word;mmdd:string[4];myFile:text;
  yyyy:string;
begin
  DecodeDate(Now, AYear, AMonth, ADay);
  mmdd:= Format('%.2d%.2d',[AMonth,ADay]);
  yyyy := Format('%.4d',[AYear]);
  MyBkpPath:=MyNetPath+'zaloha\';
  //ExecuteFileX(MyAppPath+MenoZip,'-r -9 "'+MyBkpPath+nazov5+'com" "'+MyCommPth+'*.*"',MyCommPth,1);
  for i:=1 to 99 do
  begin
    if i=0 then s:='' else s:=Format('%.2d',[i]);
    if FileExists(MyNetPath+'DATA'+s+'\inf.db') then begin
      for zz:=1 to 9999 do begin
         nazov5:='z'+yyyy+'.upgrade.'+IntToStr(zz)+'.';
         if not FileExists(MyBkpPath+nazov5+'data'+s+'.zip') then begin
           ExecuteFileX(MyAppPath+MenoZip,' -r -9 "'+MyBkpPath+nazov5+'data'+s+'.zip" "./*.*"',MyNetPath+'data'+s+'\',1);
           break;
         end;
      end;
      try
      for jj:=26 to 42 do begin
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
      SrcDirDel := MyNetPath+'DATA'+s+'\DATASK'+'.X'+IntToStr(jj);
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

initialization
 AdresyReport := TStringList.Create;
 AdresyReport.ADD('<!DOCTYPE html>');
 AdresyReport.ADD('<html>');
 AdresyReport.ADD('<head>');
 AdresyReport.ADD('  <meta http-equiv="Content-Type" content="text/html; charset=windows-1250" />'); AdresyReport.ADD('</head>');
 AdresyReport.ADD('<body>');
 AdresyReport.ADD('<table border=1>');
 AdresyReport.ADD('<th>firma</th>');
 AdresyReport.ADD('<th>os.cis.</th>');
 AdresyReport.ADD('<th>prievisko a meno</th>');
 AdresyReport.ADD('<th>typ</th>');
 AdresyReport.ADD('<th>ulica zlucena</th>');
 AdresyReport.ADD('<th>ulica</th>');
 AdresyReport.ADD('<th>orient.cis.</th>');
 AdresyReport.ADD('<th>sup.cis.</th>');
 AdresyReport.ADD('<tbody>');
 PARAMETER34:=false;
finalization
 try if T1<>nil then begin T1.Close; {T1.Free;} end; except end;
 try if T2<>nil then begin T2.Close; {T2.Free;} end; except end;
 try if T3<>nil then begin T3.Close; {T3.Free;} end; except end;
 try if TINF<>nil then begin TINF.Close; {TINF.Free;} end; except end;
 AdresyReport.ADD('</tr>');
 AdresyReport.ADD('</tbody>');
 AdresyReport.ADD('</table>');
 AdresyReport.ADD('</body>');
 AdresyReport.ADD('</html>');
 AdresyReport.SaveToFile(MyPamPath+'ADR'+IntToStr(DEF_ROK_DO)+'.html');
 AdresyReport.Clear;
 AdresyReport.Free;
end.


