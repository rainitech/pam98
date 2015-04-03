unit REXODV;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportOdv = class(TQuickRep)
    GroupFooterBand1: TQRBand;
    Q0_: TQuery;
    Q0_CALC_MPT: TStringField;
    PageHeaderBand1: TQRBand;
    QRLabel47: TQRLabel;
    QRSysData2: TQRSysData;
    Q0_CALC_FIRMA: TStringField;
    QRLabel20: TQRLabel;
    QRDBText2: TQRDBText;
    QRGroup1: TQRGroup;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape10: TQRShape;
    QRLabel3: TQRLabel;
    QRShape40: TQRShape;
    QRShape49: TQRShape;
    QRLabel29: TQRLabel;
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
    Q0_code_emp: TIntegerField;
    Q0_surname: TStringField;
    Q0_name: TStringField;
    Q0_title: TStringField;
    Q0_CALC_ZPS: TStringField;
    QRShape3: TQRShape;
    QRLabel6: TQRLabel;
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
    QRLabel13: TQRLabel;
    QRShape16: TQRShape;
    QRShape23: TQRShape;
    QRLabel14: TQRLabel;
    QRShape24: TQRShape;
    QRLabel21: TQRLabel;
    QRShape25: TQRShape;
    QRLabel22: TQRLabel;
    QRShape12: TQRShape;
    QRLabel5: TQRLabel;
    QRShape32: TQRShape;
    QRLabel23: TQRLabel;
    QRShape29: TQRShape;
    QRShape44: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    Q0_n_zaklad_ip: TCurrencyField;
    Q0_n_zaklad_up: TCurrencyField;
    Q0_n_zaklad_rf: TCurrencyField;
    Q0_n_zaklad_gp: TCurrencyField;
    Q0_o_invalid: TCurrencyField;
    Q0_oz_invalid: TCurrencyField;
    Q0_oz_uraz: TCurrencyField;
    Q0_oz_rezerva: TCurrencyField;
    Q0_oz_garancne: TCurrencyField;
    Q0_f_invalid: TFloatField;
    Q0_fz_invalid: TFloatField;
    Q0_fz_uraz: TFloatField;
    Q0_fz_rezerva: TFloatField;
    Q0_fz_garfond: TFloatField;
    Q0_oz_nemoc: TCurrencyField;
    Q0_oz_dochod: TCurrencyField;
    Q0_oz_fondzam: TCurrencyField;
    QRShape46: TQRShape;
    QRLabel16: TQRLabel;
    QRShape47: TQRShape;
    QRLabel17: TQRLabel;
    QRShape48: TQRShape;
    QRLabel18: TQRLabel;
    QRShape56: TQRShape;
    QRLabel4: TQRLabel;
    QRExpr7: TQRExpr;
    QRShape59: TQRShape;
    QRExpr8: TQRExpr;
    QRShape60: TQRShape;
    QRExpr9: TQRExpr;
    QRShape61: TQRShape;
    QRExpr10: TQRExpr;
    QRShape62: TQRShape;
    QRExpr11: TQRExpr;
    QRShape63: TQRShape;
    QRExpr12: TQRExpr;
    QRShape64: TQRShape;
    QRExpr13: TQRExpr;
    QRShape65: TQRShape;
    QRExpr14: TQRExpr;
    QRShape66: TQRShape;
    QRExpr15: TQRExpr;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRShape70: TQRShape;
    QRExpr18: TQRExpr;
    Q0_born_numb: TStringField;
    QRLabel9: TQRLabel;
    DetailBand1: TQRBand;
    QRShape33: TQRShape;
    QRShape35: TQRShape;
    QRShape45: TQRShape;
    QRDBText47: TQRDBText;
    QRShape13: TQRShape;
    QRDBText4: TQRDBText;
    QRShape17: TQRShape;
    QRDBText6: TQRDBText;
    QRShape20: TQRShape;
    QRDBText8: TQRDBText;
    QRShape26: TQRShape;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape14: TQRShape;
    QRDBText7: TQRDBText;
    QRShape15: TQRShape;
    QRDBText9: TQRDBText;
    QRShape30: TQRShape;
    QRShape34: TQRShape;
    QRShape36: TQRShape;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape42: TQRShape;
    QRDBText23: TQRDBText;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRShape54: TQRShape;
    QRDBText29: TQRDBText;
    QRShape57: TQRShape;
    QRDBText31: TQRDBText;
    QRDBText21: TQRDBText;
    procedure Q0_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

var
  ReportOdv: TReportOdv;

procedure RunReportODV(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportOdv.ShowReport;
begin
  QRLabel47.Caption := 'ROZPIS ODVODOV POISTN…HO ZA ' +
     Mesiac(X.AktObdobie mod 100,true)+' '+IntToStr(X.AktObdobie div 100);
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q0_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q0_.Open;
  Preview;
  Q0_.Close;
end;


procedure TReportOdv.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_CALC_FIRMA.Value := 'FIRMA:  '+X.AktFirmaStr;

  Q0_CALC_MPT.Value:=COPY(
    Trim(Q0_Surname.Value)+' '+
    Trim(Q0_Name.Value),
    1,100);
  Q0_CALC_ZPS.Value := '';
  if Q0_ZPS.Value then Q0_CALC_ZPS.Value := 'ZPS';
  if Q0_ZTP.Value then Q0_CALC_ZPS.Value := 'ZçP';
end;

procedure RunReportODV(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportOdv:=TReportOdv.Create(Application);
    if X.DisableShape then QRDisableShape(ReportODV);
    if X.DisableLabel then QRDisableLabel(ReportODV);
    Screen.Cursor:=crDefault;
    ReportODV.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportOdv.Free;
  end;
end;















































end.
