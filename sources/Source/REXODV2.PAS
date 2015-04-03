unit REXODV2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportOdv2 = class(TQuickRep)
    GroupFooterBand1: TQRBand;
    Q0_: TQuery;
    Q0_CALC_MPT: TStringField;
    DetailBand1: TQRBand;
    QRShape45: TQRShape;
    QRDBText47: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel47: TQRLabel;
    QRSysData2: TQRSysData;
    Q0_CALC_FIRMA: TStringField;
    QRLabel20: TQRLabel;
    QRShape6: TQRShape;
    QRDBText2: TQRDBText;
    QRGroup1: TQRGroup;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape10: TQRShape;
    QRLabel3: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape18: TQRShape;
    QRShape20: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape26: TQRShape;
    QRDBText10: TQRDBText;
    QRShape27: TQRShape;
    QRDBText11: TQRDBText;
    QRShape28: TQRShape;
    QRDBText12: TQRDBText;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape38: TQRShape;
    QRDBText21: TQRDBText;
    QRShape39: TQRShape;
    QRDBText23: TQRDBText;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape62: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape21: TQRShape;
    QRLabel15: TQRLabel;
    QRShape29: TQRShape;
    QRLabel16: TQRLabel;
    QRShape30: TQRShape;
    QRLabel17: TQRLabel;
    QRShape42: TQRShape;
    QRLabel18: TQRLabel;
    QRShape43: TQRShape;
    QRLabel19: TQRLabel;
    Q0_v_obdobie: TIntegerField;
    Q0_v_rok: TSmallintField;
    Q0_v_mesiac: TSmallintField;
    Q0_n_zaklad_dp: TCurrencyField;
    Q0_n_zaklad_np: TCurrencyField;
    Q0_n_zaklad_fz: TCurrencyField;
    Q0_zps: TBooleanField;
    Q0_zps1: TBooleanField;
    Q0_ztp: TBooleanField;
    Q0_o_nemoc: TCurrencyField;
    Q0_o_dochod: TCurrencyField;
    Q0_o_fondzam: TCurrencyField;
    Q0_f_nemoc: TFloatField;
    Q0_fz_nemoc: TFloatField;
    Q0_f_dochod: TFloatField;
    Q0_fz_dochod: TFloatField;
    Q0_f_fondz: TFloatField;
    Q0_fz_fondz: TFloatField;
    Q0_u_nemoc: TSmallintField;
    Q0_u_dochod: TSmallintField;
    Q0_u_fondzam: TSmallintField;
    Q0_code_emp: TIntegerField;
    Q0_surname: TStringField;
    Q0_name: TStringField;
    Q0_title: TStringField;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRLabel8: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRShape14: TQRShape;
    QRLabel14: TQRLabel;
    procedure Q0_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

var
  ReportOdv2: TReportOdv2;

procedure RunReportODV2(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportOdv2.ShowReport;
begin
  QRLabel47.Caption := 'ROZPIS ODVODOV POISTNÉHO ZA ' +
     Mesiac(X.AktObdobie mod 100,true)+' '+IntToStr(X.AktObdobie div 100);
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q0_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q0_.Open;
  Preview;
  Q0_.Close;
end;


procedure TReportOdv2.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_CALC_FIRMA.Value := 'FIRMA:  '+X.AktFirmaStr;

  Q0_CALC_MPT.Value:=COPY(
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value)+' '+
    Trim(Q0_Title.Value),
    1,100);
end;

procedure RunReportODV2(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportOdv2:=TReportOdv2.Create(Application);
    if X.DisableShape then QRDisableShape(ReportODV2);
    if X.DisableLabel then QRDisableLabel(ReportODV2);
    Screen.Cursor:=crDefault;
    ReportODV2.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportOdv2.Free;
  end;
end;

















end.
