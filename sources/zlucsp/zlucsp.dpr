program zlucsp;

uses
  Forms,
  IniFiles,
  xmlzluc1 in 'xmlzluc1.pas' {Form1},
  MSXML2_TLB in 'MSXML2_TLB.pas',
  MyConsts in 'MyConsts.pas',
  MyOtazka in 'MyOtazka.pas' {FormMyOtazka},
  FmxUtils in 'Fmxutils.pas',
  Progress in 'PROGRESS.PAS' {FormProgress},
  UnicodeUtils in 'Utilities\UnicodeUtils.pas';

{$R *.RES}

begin
  MyIniFile:=TIniFile.Create(MyAppPath+'zlucsp.ini');
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormMyOtazka, FormMyOtazka);
  Application.CreateForm(TFormProgress, FormProgress);
  Application.Run;
end.
