program upgrade;

uses
  classes,
  Forms,
  Main in 'Main.pas' {Form1},
  MyOtazka in 'MyOtazka.pas' {FormMyOtazka},
  MyConsts in 'MyConsts.pas',
  FmxUtils in 'Fmxutils.pas',
  Konv500 in 'Konv500.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'PAM98 UPGRADE';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
