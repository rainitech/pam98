program PAM;

uses
  Forms,
  QuickRpt,
  SysUtils,
  IniFiles,
  DBTables,
  DBITypes,
  DBIProcs,
  Controls,
  Registry,
  FileCtrl,
  Dm_main in 'Dm_main.pas' {DM: TDataModule},
  Dm_zam in 'Dm_zam.pas' {DMZ: TDataModule},
  Dm_vypl in 'Dm_vypl.pas' {DMV: TDataModule},
  Dm_hp in 'Dm_hp.pas' {DMHP: TDataModule},
  MyConsts in 'MyConsts.pas',
  About in 'About.pas' {FormAbout},
  Obdobie in 'Obdobie.pas' {FormObdobie},
  MyOtazka in 'MyOtazka.pas' {FormMyOtazka},
  Dm_ppv in 'Dm_ppv.pas' {DMP: TDataModule},
  RXCalc in 'Rxcalc.pas' {FormCalc},
  Myreg in 'Myreg.pas' {FormReg},
  Sc_main in 'Sc_main.pas' {FormCis},
  Mydes in 'Mydes.pas',
  Login in 'Login.pas' {FormHeslo},
  Stred in 'Stred.pas' {FormStred},
  Pridavky in 'Pridavky.pas' {FormPridavky},
  Xenon in 'Xenon.pas',
  FmxUtils in 'Fmxutils.pas',
  ParHP in 'ParHP.pas' {FormParHP},
  Progress in 'Progress.pas' {FormProgress},
  MainHP1 in 'MainHP1.pas' {FormHP},
  Pomoc in 'Pomoc.pas' {FormPomoc},
  DM_sql in 'DM_sql.pas' {DMSQL: TDataModule},
  MainCsv1 in 'MainCsv1.pas' {FormCsv1},
  Dm_tlac in 'Dm_tlac.pas' {DMTL: TDataModule},
  ParForm in 'ParForm.pas' {FParForm},
  Rexdov in 'Rexdov.pas' {ReportDOV: TQuickRep},
  REXDPC2 in 'REXDPC2.pas' {ReportDPC2: TQuickRep},
  REXDVP2 in 'REXDVP2.pas' {ReportDVP2: TQuickRep},
  REXEN in 'REXEN.pas' {ReportEN: TQuickRep},
  REXFZ1 in 'REXFZ1.pas' {ReportFZ1: TQuickRep},
  REXFZ2 in 'REXFZ2.pas' {ReportFZ2: TQuickRep},
  REXHP in 'REXHP.pas' {ReportHP: TQuickRep},
  REXHP1 in 'REXHP1.pas' {ReportHP1: TQuickRep},
  RexML in 'RexML.pas' {ReportML: TQuickRep},
  REXML2 in 'REXML2.pas' {ReportML2: TQuickRep},
  REXNZ in 'REXNZ.pas' {ReportNZ: TQuickRep},
  REXODV in 'REXODV.pas' {ReportOdv: TQuickRep},
  REXPOI in 'REXPOI.pas' {ReportPOI: TQuickRep},
  REXPP in 'REXPP.pas' {ReportPP: TQuickRep},
  REXPZ in 'REXPZ.pas' {ReportPZ: TQuickRep},
  REXRZ in 'REXRZ.pas' {ReportRZ: TQuickRep},
  REXRZ2 in 'REXRZ2.pas' {ReportRZ2: TQuickRep},
  REXSPV in 'REXSPV.pas' {ReportSPV: TQuickRep},
  REXVL in 'REXVL.pas' {ReportVL: TQuickRep},
  REXVL2 in 'REXVL2.pas' {ReportVL2: TQuickRep},
  REXDNS2 in 'REXDNS2.pas' {ReportDNS2: TQuickRep},
  REXZL in 'REXZL.pas' {ReportZL: TQuickRep},
  REXZML2 in 'REXZML2.pas' {ReportZML2: TQuickRep},
  RexZP in 'RexZP.pas' {ReportZP: TQuickRep},
  REXSP in 'REXSP.pas' {ReportSP: TQuickRep},
  MyQuick in 'MyQuick.pas',
  REXVL3 in 'REXVL3.pas' {ReportVL3: TQuickRep},
  MainVyp in 'MainVyp.pas' {FormMainVyp},
  Main in 'Main.pas' {FormMain},
  MainVzor in 'MainVzor.pas' {FormMainVzor},
  M_Pomoc in 'M_Pomoc.pas' {FormMenuPomoc},
  DM_ALL in 'DM_ALL.pas' {DMA: TDataModule},
  MainSet in 'MainSet.pas' {FormSetup},
  MainInf in 'MainInf.pas' {FormInf},
  REXODVDP in 'REXODVDP.pas' {ReportOdvDp: TQuickRep},
  REXVLND in 'REXVLND.pas' {ReportVLND: TQuickRep},
  REXFZ1A in 'REXFZ1A.PAS' {ReportFZ1A: TQuickRep},
  REXDNS3 in 'REXDNS3.pas' {ReportDNS3: TQuickRep},
  REXHP2 in 'REXHP2.pas' {ReportHP2: TQuickRep},
  RexELDZ1 in 'RexELDZ1.pas' {ReportELDZ1: TQuickRep},
  REXPZ2 in 'REXPZ2.pas' {ReportPZ2: TQuickRep},
  REXRZ3 in 'REXRZ3.pas' {ReportRZ3: TQuickRep},
  REXVD in 'REXVD.pas' {ReportVD: TQuickRep},
  REXVD2 in 'REXVD2.pas' {ReportVD2: TQuickRep},
  REXPOI2 in 'REXPOI2.pas' {ReportPOI2: TQuickRep},
  REXRZ4 in 'REXRZ4.pas' {ReportRZ4: TQuickRep},
  RexSpXml in 'RexSpXml.pas',
  REXSP1 in 'REXSP1.pas' {ReportSP1: TQuickRep},
  REXSP1P in 'REXSP1P.pas' {ReportSP1P: TQuickRep},
  RexML3 in 'RexML3.pas' {ReportML3: TQuickRep},
  REXVYK in 'REXVYK.pas' {ReportVYK: TQuickRep},
  REXNZOLD in 'REXNZOLD.pas' {ReportNZOLD: TQuickRep},
  REXDBPS in 'REXDBPS.pas' {ReportDBPS: TQuickRep},
  REXVLOLD in 'REXVLOLD.pas' {ReportVLOLD: TQuickRep},
  REXODVZP in 'REXODVZP.PAS' {ReportOdvZp: TQuickRep},
  ParPU in 'parpu.pas' {FormParPU},
  REXPU in 'REXPU.pas' {ReportPU: TQuickRep},
  REXDNS2A in 'REXDNS2A.pas' {ReportDNS2A: TQuickRep},
  REXPZ3 in 'REXPZ3.pas' {ReportPZ3: TQuickRep},
  REXZRAZ in 'REXZRAZ.pas' {ReportZraz: TQuickRep},
  NewFirma in 'NewFirma.pas' {FormNovaFirma},
  RZ2004A in 'RZ2004A.pas' {ReportRZ_2004: TQuickRep},
  RZ2004B in 'RZ2004B.pas' {ReportRZ_2004B: TQuickRep},
  REXPP2 in 'REXPP2.pas' {ReportPP2: TQuickRep},
  VD2005A in 'VD2005A.pas' {ReportVD2005A: TQuickRep},
  VD2005B in 'VD2005B.pas' {ReportVD2005B: TQuickRep},
  SP2005VY in 'SP2005VY.pas' {ReportSP2005VY: TQuickRep},
  SP2005PR in 'SP2005PR.pas' {ReportSP2005PR: TQuickRep},
  REXVZ in 'REXVZ.pas' {ReportVZ: TQuickRep},
  VP2005A in 'VP2005A.pas' {ReportVP2005A: TQuickRep},
  VP2005B in 'VP2005B.pas' {ReportVP2005B: TQuickRep},
  ZP2005PR in 'ZP2005PR.pas' {ReportZP2005PR: TQuickRep},
  ZP2005VY in 'ZP2005VY.pas' {ReportZP2005VY: TQuickRep},
  PZ2005 in 'PZ2005.pas' {ReportPZ2005: TQuickRep},
  BO2005 in 'BO2005.pas' {ReportBO2005: TQuickRep},
  RexZpTxt in 'RexZpTxt.pas',
  MainNEP1 in 'MainNEP1.pas' {FormNEP1},
  ParForm2 in 'ParForm2.pas' {FormTLA1},
  RZ2005A in 'RZ2005A.pas' {ReportRZ_2005: TQuickRep},
  RZ2005B in 'RZ2005B.pas' {ReportRZ_2005B: TQuickRep},
  RexRTF in 'RexRTF.pas' {ReportRTF: TQuickRep},
  ZP05OZVY in 'ZP05OZVY.pas' {ReportZP05OZVY: TQuickRep},
  ZP05OZPR in 'ZP05OZPR.pas' {ReportZP05OZPR: TQuickRep},
  PZ2006 in 'PZ2006.pas' {ReportPZ2006: TQuickRep},
  REXVP in 'REXVP.pas' {ReportVP: TQuickRep},
  REXVP2 in 'REXVP2.pas' {ReportVP2: TQuickRep},
  REXVP2t in 'REXVP2t.pas' {ReportVP2T: TQuickRep},
  PR2007 in 'PR2007.pas' {ReportPR2007: TQuickRep},
  PZ2007 in 'PZ2007.pas' {ReportPZ2007: TQuickRep},
  RZ2007A in 'RZ2007A.pas' {ReportRZ_2007: TQuickRep},
  VD2007A in 'VD2007A.pas' {ReportVD2007A: TQuickRep},
  VD2007B in 'VD2007B.pas' {ReportVD2007B: TQuickRep},
  VLH2009 in 'VLH2009.pas' {ReportVLH2009: TQuickRep},
  ZL2009 in 'ZL2009.pas' {ReportZL2009: TQuickRep},
  RZ2008A in 'RZ2008A.pas' {ReportRZ_2008: TQuickRep},
  RZ2008B in 'RZ2008B.pas' {ReportRZ_2008B: TQuickRep},
  PZ2008 in 'PZ2008.pas' {ReportPZ2008: TQuickRep},
  RZ2009A in 'RZ2009A.pas' {ReportRZ_2009: TQuickRep},
  RZ2009B in 'RZ2009B.pas' {ReportRZ_2009B: TQuickRep},
  PZ2009 in 'PZ2009.pas' {ReportPZ2009: TQuickRep},
  VD2009A in 'VD2009A.pas' {ReportVD2009A: TQuickRep},
  VD2009B in 'VD2009B.pas' {ReportVD2009B: TQuickRep},
  Bullzip_TLB in 'Bullzip_TLB.pas',
  PZ2011 in 'PZ2011.pas' {ReportPZ2011: TQuickRep},
  RZ2011A in 'RZ2011A.pas' {ReportRZ_2011: TQuickRep},
  RZ2011B in 'RZ2011B.pas' {ReportRZ_2011B: TQuickRep},
  REXVL4 in 'REXVL4.pas' {ReportVL4: TQuickRep},
  PZ2012 in 'PZ2012.pas' {ReportPZ2012: TQuickRep},
  PZ2013 in 'PZ2013.pas' {ReportPZ2013: TQuickRep},
  RZ2012A in 'RZ2012A.pas' {ReportRZ_2012: TQuickRep},
  RZ2012B in 'RZ2012B.pas' {ReportRZ_2012B: TQuickRep},
  VP2005C in 'VP2005C.pas' {ReportVP2005C: TQuickRep},
  REXHP3 in 'REXHP3.pas' {ReportHP3: TQuickRep},
  RexDuXml in 'RexDuXml.pas',
  PZ2014 in 'PZ2014.pas' {ReportPZ2014: TQuickRep},
  RZ2014A in 'RZ2014A.pas' {ReportRZ_2014: TQuickRep},
  RZ2014B in 'RZ2014B.pas' {ReportRZ_2014B: TQuickRep};

{$R *.RES}

var _yy,_mm,_dd:word;

procedure PDOX_INIT;
var
  hCur : hDBICur;
  Config : CFGDesc;
  ContinueIt: boolean;

begin

  if DbiInit(nil) = DBIERR_NONE then
  begin
    hCur := nil;
    if DbiOpenCfgInfoList(nil, dbiREADWRITE, cfgPersistent,
        '\\DRIVERS\\PARADOX\\INIT', hCur) = DBIERR_NONE then
    begin
      if DbiSetToBegin(hCur) = DBIERR_NONE then
      begin
        ContinueIt := true;
        while ContinueIt do
        begin
          if(DbiGetNextRecord(hCur, dbiWRITELOCK, @Config, nil)
                 <> DBIERR_NONE) then
            ContinueIt := false
          else
            if StrIComp(Config.szNodeName, 'NET DIR') = 0 then
            begin
              StrCopy(Config.szValue, @MyNetPath);
              DbiModifyRecord(hCur, @Config, true);
              ContinueIt := false
            end;
        end;
      end;
    end;
    DbiExit();
  end;
end;

begin
  MyIniFile:=TIniFile.Create(MyAppPath+'PAM.INI');
  MyParFile:=TIniFile.Create(MyAppPath+'PARAM.INI');
  MyNetPath:=MyIniFile.ReadString('NETWORK','Network_Path',MyAppPath);
  MyImpPath:=MyIniFile.ReadString('IMPORT','Gfk_Path',MyAppPath+MenoImpDir+'\');
  MyStdImpPath:=MyAppPath+MenoImpDir+'\';
  {--}
  MyCommPth:=MyNetPath+'COMMON\';
  MyBkpPath:=MyNetPath+'ZALOHA\';
  MySklPath:=MyNetPath+'SKLAD\';
  MyDataPth:=MyNetPath+'DATA01\';
  MyPrivPth:=MyAppPath+'PRIVATE\';
  MyFrmPath    := MyNetPath + MenoFrmDir + '\' ;
  { ModifyBDE---------------
LOW MEMORY USAGE LIMIT  increase to 128, 256, or 512
MAXBUFSIZE can be set to 4096 or 8192 (in kb, no upper limit)
MAXFILEHANDLES should be set to 196 or 256
MEMSIZE  can be increased to 24, 36, or 48 as needed (use smaller values first)
SHAREDMEMSIZE can be set to 4096 or 6144 (in kb, no upper limit)
}
  ModifyBDE( '\Drivers\Paradox\Init', 'Net Dir', MyNetPath);
  ModifyBDE( '\System\Init', 'LOCAL SHARE', 'TRUE' );
  ModifyBDE( '\System\Init', 'MAXBUFSIZE', '8192' );
  ModifyBDE( '\System\Init', 'MAXFILEHANDLES', '256' );
  ModifyBDE( '\System\Init', 'LOW MEMORY USAGE LIMIT', '128' );
  ModifyBDE( '\System\Init', 'MEMSIZE', '36' );
  ModifyBDE( '\System\Init', 'SHAREDMEMLOCATION', '7000' );
  ModifyBDE( '\System\Init', 'SHAREDMEMSIZE', '4096' );
  //ModifyBDE( '\System\FORMATS\DATE', 'FOURDIGITYEAR', 'TRUE' );
{  PDOX_INIT;}

  ForceDirectories(ExtractFileDrive(MyAppPath)+'\PAM98LCK');
  Session.privatedir := ExtractFileDrive(MyAppPath)+'\PAM98LCK';

  if MyNetPath<>MyAppPath then
    DBTables.Session.NetFileDir:=MyNetPath;
  (*
  DBTables.Session.Open;
  if Uppercase(DBTables.Session.NetFileDir)='C:\' then
  begin
    DBTables.Session.Close;
    DBTables.Session.NetFileDir := MyNetPath;
  end
  else DBTables.Session.Close;
  MyMessage('netfiledir='+DBTables.Session.NetFileDir);
  *)
  DBTables.Session.ConfigMode := [cfmSession];
  DBTables.Session.DeleteAlias(Alias_Common);
  DBTables.Session.AddStandardAlias(Alias_Common,MyCommPth,'PARADOX');
  DBTables.Session.DeleteAlias(Alias_Data);
  DBTables.Session.AddStandardAlias(Alias_Data,MyDataPth,'PARADOX');
  DBTables.Session.DeleteAlias(Alias_Private);
  DBTables.Session.AddStandardAlias(Alias_Private,MyPrivPth,'PARADOX');

  FormAbout:=TFormAbout.Create(nil);
  FormAbout.Button1.Visible:=False;
  FormAbout.Show;
  FormAbout.Update;
  DBTables.Session.AddPassword(MyPassword(MyDbPassword));
  Application.UpdateFormatSettings := False;
  Application.Initialize;
  DecimalSeparator := ',';
  ThousandSeparator := ' ';
  DateSeparator := '.';
  ShortDateFormat := 'd.m.yyyy';
  LongDateFormat := 'd.m.yyyy';
  Application.Title := 'PAM98';
  Application.HintPause := 100;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDMZ, DMZ);
  Application.CreateForm(TDMP, DMP);
  Application.CreateForm(TDMV, DMV);
  Application.CreateForm(TDMHP, DMHP);
  Application.CreateForm(TDMSQL, DMSQL);
  Application.CreateForm(TDMSQL2, DMSQL2);
  Application.CreateForm(TDMTL, DMTL);
  Application.CreateForm(TDMA, DMA);
  MyDB_Init;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormMenuPomoc, FormMenuPomoc);
  Application.CreateForm(TFormCalc, FormCalc);
  Application.CreateForm(TFormPomoc, FormPomoc);
  FormAbout.Button1.Visible:=True;
  FormAbout.Release;
  FormAbout:=nil;
  FormMain.Akcia_priprav_menu(nil);
  FormMain.Update;
  Nacitaj_Milionarsku_Dan;
  Nacitaj_Kompatibilitu;
  Nacitaj_Texty;

  {--}
  _dd:=MyIniFile.ReadInteger(MenoIniSectionZaloha, MenoPoslednaZalohaPrefix+'Den',1);
  _mm:=MyIniFile.ReadInteger(MenoIniSectionZaloha, MenoPoslednaZalohaPrefix+'Mesiac',1);
  _yy:=MyIniFile.ReadInteger(MenoIniSectionZaloha, MenoPoslednaZalohaPrefix+'Rok',2000);
  MyBkpDate := EncodeDate(_yy,_mm,_dd);
  {--}
  _dd:=MyIniFile.ReadInteger(MenoIniSectionZaloha, MenoPoslednaNotifikaciaPrefix+'Den',1);
  _mm:=MyIniFile.ReadInteger(MenoIniSectionZaloha, MenoPoslednaNotifikaciaPrefix+'Mesiac',1);
  _yy:=MyIniFile.ReadInteger(MenoIniSectionZaloha, MenoPoslednaNotifikaciaPrefix+'Rok',2000);
  MyBkpNotifDate := EncodeDate(_yy,_mm,_dd);
  {--}
   if MyDateDaysBetween(MyBkpDate,now)>31 then begin
     if MyDateDaysBetween(MyBkpNotifDate,now)>7 then begin
       ZapisDatumPoslednejNotifikacie;
       FormMain.spusti_zalohovanie(FormMain, true); {true => je vynutene}
     end;
   end;
  {--}

{  NacitajParametre;}
{
  DM.DanovePasmaToIniFile('TMP1.BAK');
  DM.IniFileToDanovePasma('PAM.INI');
}
  Application.Run;
end.
