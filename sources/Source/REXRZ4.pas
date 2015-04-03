unit REXRZ4;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportRZ4 = class(TQuickRep)
    DetailBand1: TQRBand;
    QRLabel32: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape13: TQRShape;
    QRShape38: TQRShape;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel6: TQRLabel;
    QRShape5: TQRShape;
    QRLabel12: TQRLabel;
    QRShape14: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    Q0_: TQuery;
    Q0_ADR: TStringField;
    Q0_TMP: TStringField;
    Q0_Name: TStringField;
    Q0_Surname: TStringField;
    Q0_Title: TStringField;
    Q0_born_numb: TStringField;
    Q0_tp_street: TStringField;
    Q0_tp_city: TStringField;
    Q0_tp_zip: TStringField;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape6: TQRShape;
    QRLabel4: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel5: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel13: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel15: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel17: TQRLabel;
    QRShape19: TQRShape;
    QRLabel18: TQRLabel;
    QRShape20: TQRShape;
    QRLabel19: TQRLabel;
    QRShape21: TQRShape;
    QRLabel20: TQRLabel;
    QRShape22: TQRShape;
    QRLabel21: TQRLabel;
    QRShape23: TQRShape;
    QRLabel22: TQRLabel;
    QRShape24: TQRShape;
    QRLabel25: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRLabel26: TQRLabel;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRLabel27: TQRLabel;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRLabel28: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRLabel29: TQRLabel;
    QRShape37: TQRShape;
    QRShape39: TQRShape;
    Q0_v_rok: TSmallintField;
    Q0_Ciastzd1: TCurrencyField;
    Q0_Ciastzd2: TCurrencyField;
    Q0_Ciastzd_spolu: TCurrencyField;
    Q0_Nc_minimum: TCurrencyField;
    Q0_Nc_deti: TCurrencyField;
    Q0_Nc_partner: TCurrencyField;
    Q0_Nc_invalid_ciast: TCurrencyField;
    Q0_Nc_invalid_ztp: TCurrencyField;
    Q0_Nc_dary: TCurrencyField;
    Q0_Nc_spolu: TCurrencyField;
    Q0_Zdanmzda: TCurrencyField;
    Q0_Zdanmzda_round: TCurrencyField;
    Q0_Dan: TCurrencyField;
    Q0_Uhrn_preddavkov: TCurrencyField;
    Q0_Preplatok: TCurrencyField;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRDBText20: TQRDBText;
    Q0_CALC_PREPLATOK: TStringField;
    Q0_code_emp: TIntegerField;
    QR_Vykaz_zostavil: TQRLabel;
    QR_Vykaz_dna: TQRLabel;
    QRShape41: TQRShape;
    QRShape43: TQRShape;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel61: TQRLabel;
    QR_Vykaz_zostavil_text: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel47: TQRLabel;
    QRShape44: TQRShape;
    QRLabel62: TQRLabel;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRDBText21: TQRDBText;
    QRShape47: TQRShape;
    QRLabel65: TQRLabel;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRDBText22: TQRDBText;
    QRLabel66: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRDBText24: TQRDBText;
    QINF_: TQuery;
    QINF_NAZOV: TStringField;
    QINF_ADR_ULICA: TStringField;
    QINF_ADR_MESTO: TStringField;
    QINF_ADR_PSC: TStringField;
    QINF_CALC_ADRESA: TStringField;
    Q0_Uhrn_nepenaznych: TCurrencyField;
    Q0_Nedoplatok_nepenaznych: TCurrencyField;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRShape54: TQRShape;
    QRLabel75: TQRLabel;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRLabel37: TQRLabel;
    QRShape40: TQRShape;
    QRShape48: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape49: TQRShape;
    QRShape57: TQRShape;
    QRShape42: TQRShape;
    QRShape58: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    Q0_Uhrn_brutto: TCurrencyField;
    Q0_Uhrn_osobitna: TCurrencyField;
    Q0_Dan_osobitna: TCurrencyField;
    Q0_Poistne: TCurrencyField;
    Q0_DDP: TCurrencyField;
    Q0_Uhrn_nepen2: TCurrencyField;
    Q0_Nedoplatok_nepen2: TCurrencyField;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRMemo1: TQRMemo;
    QRLabel50: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel76: TQRLabel;
    QINF_DIC: TStringField;
    QRDBText29: TQRDBText;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRMemo2: TQRMemo;
    QRMemo4: TQRMemo;
    QRMemo5: TQRMemo;
    QRMemo6: TQRMemo;
    QRMemo3: TQRMemo;
    QINF_ADR_CISLO: TStringField;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure QINF_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

var
  ReportRZ4: TReportRZ4;

procedure RunReportRZ4(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportRZ4.ShowReport;
begin
  QR_Vykaz_zostavil.Caption := X.Vykaz_zostavil;
  QR_Vykaz_dna.Caption := X.Vykaz_dna;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.Code_Emp1;
  Q0_.ParamByName('P2').AsInteger := X.Code_Emp2;
  Q0_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q0_.ParamByName('ROK').AsInteger := MyRok(X.AktObdobie);
  Q0_.Open;
  QINF_.Open;
  if Q0_.Active AND (Q0_.RecordCount>0) then ReportRZ4.Preview;
  QINF_.Close;
  Q0_.Close;
end;

procedure TReportRZ4.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_TMP.Value:= Copy(
    Trim(Q0_Title.Value)+' '+
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value),1,100);

  Q0_ADR.Value:=
    Q0_tp_street.Value+', '+Q0_tp_city.Value;

  if Q0_Preplatok.Value < 0
  then Q0_CALC_Preplatok.Value := Q0_Preplatok.DisplayText
  else Q0_CALC_Preplatok.Value := '+ ' + Q0_Preplatok.DisplayText;

end;

procedure RunReportRZ4(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportRZ4:=TReportRZ4.Create(Application);
    if X.DisableShape then QRDisableShape(ReportRZ4);
    if X.DisableLabel then QRDisableLabel(ReportRZ4);
    Screen.Cursor:=crDefault;
    ReportRZ4.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportRZ4.Free;
  end;
end;

procedure TReportRZ4.QINF_CalcFields(DataSet: TDataSet);
begin
  QINF_CALC_ADRESA.Value :=
    QINF_nazov.Value + ', '+
    MyAdresa(
    QINF_adr_ulica.Value,
    QINF_adr_cislo.Value,
    QINF_adr_psc.Value,
    QINF_adr_mesto.Value );
end;














































end.
