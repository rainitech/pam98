unit REXVLND;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportVLND = class(TQuickRep)
    GroupFooterBand1: TQRBand;
    QRShape11: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape120: TQRShape;
    QRShape104: TQRShape;
    QRShape110: TQRShape;
    QRShape114: TQRShape;
    QRShape116: TQRShape;
    QRShape122: TQRShape;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr23: TQRExpr;
    QRLabel61: TQRLabel;
    Q0_: TQuery;
    Q0_CALC_MPT: TStringField;
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRShape5: TQRShape;
    QRShape14: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    QRDBText16: TQRDBText;
    QRShape34: TQRShape;
    QRShape39: TQRShape;
    QRShape43: TQRShape;
    QRDBText32: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText44: TQRDBText;
    QRShape45: TQRShape;
    QRDBText47: TQRDBText;
    QRSysData1: TQRSysData;
    QRShape8: TQRShape;
    QRShape24: TQRShape;
    QRShape38: TQRShape;
    QRShape46: TQRShape;
    QRLabel7: TQRLabel;
    QRShape52: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape60: TQRShape;
    QRShape62: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape76: TQRShape;
    QRLabel43: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape6: TQRShape;
    QRLabel5: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRShape84: TQRShape;
    QRLabel47: TQRLabel;
    QRDBText2: TQRDBText;
    Q0_CALC_FIRMA: TStringField;
    QRDBText1: TQRDBText;
    QRExpr5: TQRExpr;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    QRExpr12: TQRExpr;
    QRDBText5: TQRDBText;
    QRExpr10: TQRExpr;
    QRSysData2: TQRSysData;
    QRShape17: TQRShape;
    Q0_code_emp: TIntegerField;
    Q0_nd_materska: TCurrencyField;
    Q0_nd_pridavky: TCurrencyField;
    Q0_nd_rodic: TCurrencyField;
    Q0_nd_ine: TCurrencyField;
    Q0_nd_spolu: TCurrencyField;
    Q0_n_pn: TCurrencyField;
    Q0_n_ocr: TCurrencyField;
    Q0_surname: TStringField;
    Q0_name: TStringField;
    Q0_title: TStringField;
    Q0_v_pn: TSmallintField;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRDBText3: TQRDBText;
    Q0_v_priemer2: TCurrencyField;
    Q0_v_ocr12: TFloatField;
    Q0_cista_denna_mzda: TCurrencyField;
    procedure Q0_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

var
  ReportVLND: TReportVLND;

procedure RunReportVLND(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportVLND.ShowReport;
begin
  if X.Abeceda
   then Q0_.SQL.Add('order by z.surname,z.name;')
     else Q0_.SQL.Add('order by z.code_emp;');
  QRLabel47.Caption := 'Výplatná listina - súhrn nemocenských dávok za ' +
     Mesiac(X.AktObdobie mod 100,false)+' '+IntToStr(X.AktObdobie div 100);
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q0_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q0_.Open;
  Preview;
  Q0_.Close;
end;


procedure TReportVLND.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_CALC_FIRMA.Value:='FIRMA: '+X.AktFirmaStr;

  Q0_CALC_MPT.Value:=COPY(
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value)+' '+
    Trim(Q0_Title.Value),
    1,100);
end;

procedure RunReportVLND(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportVLND:=TReportVLND.Create(Application);
    if X.DisableShape then QRDisableShape(ReportVLND);
    if X.DisableLabel then QRDisableLabel(ReportVLND);
    Screen.Cursor:=crDefault;
    ReportVLND.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportVLND.Free;
  end;
end;













end.
