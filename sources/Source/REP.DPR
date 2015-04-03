program Rep;

uses
  IniFiles,
  DbTables,
  Forms,
  ParForm in 'ParForm.pas' {FParForm},
  MyConsts in 'MyConsts.pas',
  MyOtazka in 'Myotazka.pas' {FormMyOtazka},
  Progress in 'Progress.pas' {FormProgress},
  RexML in 'RexML.pas' {ReportML: TQuickRep},
  Rexdov in 'Rexdov.pas' {ReportDOV: TQuickRep},
  MyQuick in 'MyQuick.pas',
  RepMain in 'RepMain.pas' {FormRepMain},
  REXDPC in 'REXDPC.pas' {ReportDPC: TQuickRep},
  REXDVP in 'REXDVP.pas' {ReportDVP: TQuickRep},
  REXEN in 'REXEN.pas' {ReportEN: TQuickRep},
  REXFZ1A in 'REXFZ1A.pas' {ReportFZ1A: TQuickRep},
  REXFZ2 in 'REXFZ2.pas' {ReportFZ2: TQuickRep},
  REXHP in 'REXHP.pas' {ReportHP: TQuickRep},
  REXHP1 in 'REXHP1.pas' {ReportHP1: TQuickRep},
  REXML2 in 'REXML2.pas' {ReportML2: TQuickRep},
  REXNZ in 'REXNZ.pas' {ReportNZ: TQuickRep},
  REXODVZP in 'REXODVZP.pas' {ReportOdvZp: TQuickRep},
  REXPOI in 'REXPOI.pas' {ReportPOI: TQuickRep},
  REXPP in 'REXPP.pas' {ReportPP: TQuickRep},
  REXPZ in 'REXPZ.pas' {ReportPZ: TQuickRep},
  REXRZ in 'REXRZ.pas' {ReportRZ: TQuickRep},
  REXRZ2 in 'REXRZ2.pas' {ReportRZ2: TQuickRep},
  REXSP in 'REXSP.pas' {ReportSP: TQuickRep},
  REXVLND in 'REXVLND.pas' {ReportVLND: TQuickRep},
  REXVL2 in 'REXVL2.pas' {ReportVL2: TQuickRep},
  REXVL3 in 'REXVL3.pas' {ReportVL3: TQuickRep},
  REXVP in 'REXVP.pas' {ReportVP: TQuickRep},
  REXZL in 'REXZL.pas' {ReportZL: TQuickRep},
  REXZML in 'REXZML.pas' {ReportZML: TQuickRep},
  RexZP in 'RexZP.pas' {ReportZP: TQuickRep},
  ParHP in 'ParHP.pas' {FormParHP},
  DM_sql in 'DM_SQL.PAS' {DMSQL: TDataModule},
  REXSPV in 'Rexspv.pas' {ReportSPV: TQuickRep},
  REXODV2 in 'REXODV2.pas' {ReportOdv2: TQuickRep},
  REXFZ1 in 'Rexfz1.pas' {ReportFZ1: TQuickRep},
  REXODV in 'REXODV.pas' {ReportOdv: TQuickRep},
  REXDNS2 in 'Rexdns2.pas' {ReportDNS2: TQuickRep},
  REXVL in 'Rexvl.pas' {ReportVL: TQuickRep};

{$R *.RES}

begin
  MyIniFile:=TIniFile.Create(MyAppPath+'PAM.INI');
  MyParFile:=TIniFile.Create(MyAppPath+'PARAM.INI');
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
  Application.Title := 'PAM98 Report Manager';
  Application.HintPause := 100;

  Application.Initialize;
  Application.CreateForm(TFormRepMain, FormRepMain);
  Application.CreateForm(TFormParHP, FormParHP);
  Application.CreateForm(TDMSQL, DMSQL);
  NacitajParametre;
  Application.Run;
end.
