program UpgOprav;

uses
  classes,
  Forms,
  MainOprav in '..\upgrade\MainOprav.pas' {Form1},
  MyOtazka in '..\upgrade\MyOtazka.pas' {FormMyOtazka},
  MyConsts in '..\upgrade\MyConsts.pas',
  FmxUtils in '..\upgrade\Fmxutils.pas',
  Konv440x in '..\upgrade\Konv440x.pas',
  ExecTh in '..\upgrade\EXECTH.PAS';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'PAM98 HOTFIX';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
