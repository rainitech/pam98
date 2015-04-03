program AutoStrExample;

uses
  Forms,
  userinterface in 'userinterface.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
