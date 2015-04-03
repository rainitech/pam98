program zluczp;

uses
  Forms,
  IniFiles,
  DBTables,
  xmlzluc1 in 'xmlzluc1.pas' {Form1},
  MSXML2_TLB in 'MSXML2_TLB.pas',
  MyConsts in 'MyConsts.pas',
  MyOtazka in 'MyOtazka.pas' {FormMyOtazka},
  FmxUtils in 'Fmxutils.pas',
  Progress in 'PROGRESS.PAS' {FormProgress},
  UnicodeUtils in 'Utilities\UnicodeUtils.pas';

{$R *.RES}

begin
  DBTables.Session.ConfigMode := [cfmSession];
  DBTables.Session.DeleteAlias(Alias_Private);
  DBTables.Session.AddStandardAlias(Alias_Private,MyAppPath,'PARADOX');

  MyIniFile:=TIniFile.Create(MyAppPath+'zlucsp.ini');
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormMyOtazka, FormMyOtazka);
  Application.CreateForm(TFormProgress, FormProgress);
  Application.Run;
end.
