unit mainform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus;

type
  TfrmMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    PrinterSetup1: TMenuItem;
    Print1: TMenuItem;
    N2: TMenuItem;
    Exit1: TMenuItem;
    mmoTextFile: TMemo;
    dlgFileopen: TOpenDialog;
    dlgPrinterSetup: TPrinterSetupDialog;
    ShowPrinters1: TMenuItem;
    procedure About1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure ShowPrinters1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainForm: TfrmMainForm;

implementation

uses printers, // provides the object for tracking the selected printer.
     report1,
     viewform; // viewer for the selected printer

{$R *.DFM}

procedure TfrmMainForm.PrinterSetup1Click(Sender: TObject);
begin
   dlgPrinterSetup.execute;
end;

procedure TfrmMainForm.Exit1Click(Sender: TObject);
begin
   application.terminate;
end;

procedure TfrmMainForm.About1Click(Sender: TObject);
const
   CONTENT = 'This shows how to print your QuickReport applications to ' +
             'a printer selected with the PrinterSetup dialog. ' + #10#10 +
             'To run the demonstration:' + #10#10 +
             '1) Use File | Open to load a small text file.' + #10 +
             '2) Select a printer with File | Printer Setup. ' + #10 +
             '3) Print your doument.  ' + #10#10 +
             'The results should print on the selected device.' + #10#10 +
             'The File | Show Printers displays a list of printer ' +
             'devices currently installed in your copy of Windows. ' + #10#10 +
             'This program is provided as a service of techtricks.com. ' +
             'For restrictions and additional details, please see our ' +
             'Disclaimer and Conditions for Use on our website.' + #10#10 +
             'Version 1.00 - Copyright © 2001, techtricks.com. ' +
             'All rights reserved.';

   MBFLAGS = MB_OK + MB_ICONINFORMATION + MB_APPLMODAL + MB_SETFOREGROUND;
begin

   application.messageBox( pchar( CONTENT ), 'About', MBFLAGS );


end;

procedure TfrmMainForm.Open1Click(Sender: TObject);
begin

   with dlgFileOpen do
   begin

      if execute then mmoTextFile.Lines.loadFromFile( filename )

   end;

end;

procedure TfrmMainForm.Print1Click(Sender: TObject);
begin

   with tRptTextFile.create( self ) do
   try
      qrmTextFile.Lines.assign( mmoTextFile.lines );
      quickRep1.preview;
   finally
      release
   end;


end;


procedure TfrmMainForm.ShowPrinters1Click(Sender: TObject);
begin

   with TfrmSLViewer.create( self ) do
   try
      Memo1.Lines.assign( Printer.Printers );
      if printer.PrinterIndex <> -1 then
         Memo1.Lines[ Printer.PrinterIndex ] :=
            Memo1.Lines[ Printer.PrinterIndex ] + ' (Current)';
      showModal;
   finally
      release;
   end;

end;

end.
