unit report1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TrptTextFile = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    qrmTextFile: TQRMemo;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptTextFile: TrptTextFile;

implementation

uses
   printers;

{$R *.DFM}

procedure TrptTextFile.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin

   with QuickRep1.PrinterSettings do
      if PrinterIndex <> printer.printerIndex then
         PrinterIndex := printer.printerIndex;

end;

end.
