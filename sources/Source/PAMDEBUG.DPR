program Pamdebug;

uses
  Forms,
  IniFiles,
  DBTables,
  Dm_main in 'Dm_main.pas' {DM: TDataModule},
  Dm_zam in 'Dm_zam.pas' {DMZ: TDataModule},
  Dm_vypl in 'Dm_vypl.pas' {DMV: TDataModule},
  Dm_ppv in 'Dm_ppv.pas' {DMP: TDataModule},
  Dm_hp in 'Dm_hp.pas' {DMHP: TDataModule},
  RepNz in 'Repnz.pas' {ReportNZ: TQuickRep},
  Frmdebug in 'Frmdebug.pas' {Form1},
  MyConsts in 'MyConsts.pas',
  Obdobie in 'Obdobie.pas' {FormObdobie},
  Stred in 'Stred.pas' {FormStred},
  ParHP in 'Parhp.pas' {FormParHP},
  About in 'About.pas' {FormAbout},
  RXCalc in 'Rxcalc.pas' {FormCalc},
  MainHp1 in 'MainHp1.pas' {FormHP1},
  DM_sql in 'DM_sql.pas' {DMSQL: TDataModule},
  MyOtazka in 'Myotazka.pas' {FormMyOtazka},
  RepHP1 in 'RepHP1.pas' {ReportHP1: TQuickRep},
  MainCsv1 in 'MainCsv1.pas' {FormCsv1},
  Dm_tlac in 'Dm_tlac.pas' {DMTL: TDataModule},
  FmxUtils in 'Fmxutils.pas',
  RepOdv in 'RepOdv.pas' {ReportOdv: TQuickRep};

{$R *.RES}

begin
  MyIniFile:=TIniFile.Create(MyAppPath+'PAM.INI');
  MyNetPath:=MyIniFile.ReadString('NETWORK','Network_Path',MyAppPath);
  MyCommPth:=MyNetPath+'COMMON\';
  MyDataPth:=MyNetPath+'DATA01\';
  MyPrivPth:=MyAppPath+'PRIVATE\';
  if MyNetPath<>MyAppPath then
    DBTables.Session.NetFileDir:=MyNetPath;
  DBTables.Session.ConfigMode := [cfmSession];
  DBTables.Session.DeleteAlias(Alias_Common);
  DBTables.Session.AddStandardAlias(Alias_Common,MyCommPth,'PARADOX');
  DBTables.Session.DeleteAlias(Alias_Data);
  DBTables.Session.AddStandardAlias(Alias_Data,MyDataPth,'PARADOX');
  DBTables.Session.DeleteAlias(Alias_Private);
  DBTables.Session.AddStandardAlias(Alias_Private,MyPrivPth,'PARADOX');
  DBTables.Session.AddPassword(MyPassword(MyDbPassword));
  Application.Initialize;
  Application.Title := 'DEBUG-PAM98';
  Application.CreateForm(TDMHP, DMHP);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDMZ, DMZ);
  Application.CreateForm(TDMP, DMP);
  Application.CreateForm(TDMV, DMV);
  Application.CreateForm(TDMSQL, DMSQL);
  Application.CreateForm(TDMTL, DMTL);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormStred, FormStred);
  Application.CreateForm(TFormObdobie, FormObdobie);
  Application.CreateForm(TFormCalc, FormCalc);
  Application.Run;
end.
