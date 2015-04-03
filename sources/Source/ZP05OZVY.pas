unit ZP05OZVY;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick, QRPRNTR;

type
  TReportZP05OZVY = class(TQuickRep)
    Q0_: TQuery;
    DetailBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape24: TQRShape;
    QRLabel8: TQRLabel;
    QRShape16: TQRShape;
    QRShape2: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    Q0_CALC_FIRMA: TStringField;
    QRDBText1: TQRDBText;
    QRShape3: TQRShape;
    QRLabel17: TQRLabel;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel25: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRShape41: TQRShape;
    QRDBText6: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel92: TQRLabel;
    QRShape53: TQRShape;
    QRLabel93: TQRLabel;
    QRShape54: TQRShape;
    QRLabel3: TQRLabel;
    QRShape25: TQRShape;
    QRShape45: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel28: TQRLabel;
    QRMemo2: TQRMemo;
    QRLabel6: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape93: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRLabel61: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    Q0_kzp: TSmallintField;
    Q0_pocet: TIntegerField;
    Q0_nedopl_znec: TCurrencyField;
    Q0_nedopl_ztel: TCurrencyField;
    QRLabel_rok: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape39: TQRShape;
    QRShape34: TQRShape;
    QRLabel9: TQRLabel;
    QRMemo1: TQRMemo;
    QRShape35: TQRShape;
    QRShape30: TQRShape;
    QRLabel16: TQRLabel;
    QRShape36: TQRShape;
    QRLabel22: TQRLabel;
    QRShape40: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape44: TQRShape;
    QRLabel32: TQRLabel;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape14: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel1: TQRLabel;
    QCBU_: TQuery;
    QCBU_BUID_TYP: TStringField;
    QCBU_BUID_KOD: TSmallintField;
    QCBU_OLD_PREDCISLO_U: TStringField;
    QCBU_OLD_CISLO_U: TStringField;
    QCBU_BANKA_U: TStringField;
    QCBU_SSYM_U: TStringField;
    QCBU_KSYM: TStringField;
    QCBU_VSYM: TStringField;
    QCBU_PRIJEMCA: TStringField;
    QCBU_SPP: TStringField;
    QCBU_CISLO_U: TStringField;
    DS0: TDataSource;
    Q0_R24: TCurrencyField;
    Q0_R25: TCurrencyField;
    Q0_R26: TCurrencyField;
    Q0_R27: TCurrencyField;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure ReportZP05OZVYBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    first_preview:boolean;
  public
    procedure ShowReportStart;
    procedure ShowReportEnd;
    procedure SetX(const MyReportParam:TMyReportParam);
  end;

var
  ReportZP05OZVY: TReportZP05OZVY;

procedure RunReportZP05OZVY(const MyReportParam: TMyReportParam);

implementation

uses Dm_main, Dm_vypl;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportZP05OZVY.ShowReportStart;
begin
  first_preview:=true;
  try
  QCBU_.Close;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := MyRok(X.AktObdobie);
  Q0_.Open;
  QCBU_.Open;
  QRLabel_rok.Caption := 'o preplatkoch a nedoplatkoch za jednotlivých zamestnancov za rok '+IntToStr(MyRok(X.AktObdobie)-1);
  finally
  end;
end;

procedure TReportZP05OZVY.ShowReportEnd;
begin
  Q0_.Close;
  QCBU_.Close;
end;

procedure TReportZP05OZVY.Q0_CalcFields(DataSet: TDataSet);
var s: string;
begin
 Q0_CALC_FIRMA.Value := X.AktFirmaStr;
 Q0_R24.Value := Q0_nedopl_znec.Value + Q0_nedopl_ztel.Value;
 Q0_R25.Value := 0;
 Q0_R26.Value := 0;
 Q0_R27.Value := Q0_R24.Value + Q0_R25.Value + Q0_R26.Value;
end;

procedure TReportZP05OZVY.SetX(const MyReportParam:TMyReportParam);
begin
  X:=MyReportParam;
end;

procedure RunReportZP05OZVY(const MyReportParam: TMyReportParam);
begin with ReportZP05OZVY do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportZP05OZVY:=TReportZP05OZVY.Create(Application);
    if X.DisableShape then QRDisableShape(ReportZP05OZVY);
    if X.DisableLabel then QRDisableLabel(ReportZP05OZVY);
    Screen.Cursor:=crDefault;
    ReportZP05OZVY.ShowReportStart;
    if Q0_.Active AND (Q0_.RecordCount>0) then
    begin
     ReportZP05OZVY.Preview;
    end;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportZP05OZVY.ShowReportEnd;
    ReportZP05OZVY.Free;
  end;
end;end;

procedure TReportZP05OZVY.ReportZP05OZVYBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,4);
end;










































end.
