program CSVTest;

uses
  Forms,
  CSVTestMain in 'CSVTestMain.pas' {CSVTester};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TCSVTester, CSVTester);
  Application.Run;
end.
