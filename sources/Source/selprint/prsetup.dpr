program prsetup;

uses
  Forms,
  mainform in 'mainform.pas' {frmMainForm},
  report1 in 'report1.pas' {rptTextFile},
  viewform in 'viewform.pas' {frmSLViewer};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMainForm, frmMainForm);
  Application.CreateForm(TfrmSLViewer, frmSLViewer);
  Application.Run;
end.
