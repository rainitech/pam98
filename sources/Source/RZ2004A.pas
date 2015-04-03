unit RZ2004A;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportRZ_2004 = class(TQuickRep)
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
    QRShape6: TQRShape;
    QRLabel4: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel15: TQRLabel;
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
    QRDBText10: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText20: TQRDBText;
    Q0_code_emp: TIntegerField;
    QR_Vykaz_zostavil: TQRLabel;
    QR_Vykaz_dna: TQRLabel;
    QRShape41: TQRShape;
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
    QRLabel9: TQRLabel;
    QRLabel16: TQRLabel;
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
    QRMemo1: TQRMemo;
    QRLabel50: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel58: TQRLabel;
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
    QRMemo6: TQRMemo;
    QINF_ADR_CISLO: TStringField;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRMemo3: TQRMemo;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRShape10: TQRShape;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape11: TQRShape;
    QRLabel18: TQRLabel;
    QRShape12: TQRShape;
    QRShape15: TQRShape;
    QRDBText11: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape16: TQRShape;
    QRLabel21: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRDBText12: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape19: TQRShape;
    QRLabel30: TQRLabel;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRDBText13: TQRDBText;
    QRLabel31: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel59: TQRLabel;
    QRShape22: TQRShape;
    QRLabel62: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRDBText15: TQRDBText;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRShape25: TQRShape;
    QRLabel65: TQRLabel;
    QRShape26: TQRShape;
    QRShape42: TQRShape;
    QRDBText21: TQRDBText;
    QRLabel66: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QR_Telefon: TQRLabel;
    Q0_D_bonus_narok: TCurrencyField;
    Q0_D_bonus_cerpany: TCurrencyField;
    Q0_CALC_PREPL_BONUS: TCurrencyField;
    Q0_CALC_PREPL_BB: TCurrencyField;
    Q0_CALC_NEDOPL_BONUS: TCurrencyField;
    Q0_CALC_NEDOPL_BB: TCurrencyField;
    Q0_CALC_PREPL_DAN: TCurrencyField;
    Q0_CALC_NEDOPL_DAN: TCurrencyField;
    QRLabel57: TQRLabel;
    QRShape36: TQRShape;
    QRLabel79: TQRLabel;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure QINF_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

var
  ReportRZ_2004: TReportRZ_2004;

procedure RunReportRZ_2004(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportRZ_2004.ShowReport;
begin
  QR_Vykaz_zostavil.Caption := X.Vykaz_zostavil;
  QR_Vykaz_dna.Caption := X.Vykaz_dna;
  QR_Telefon.Caption := X.Telefon;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.Code_Emp1;
  Q0_.ParamByName('P2').AsInteger := X.Code_Emp2;
  Q0_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q0_.ParamByName('ROK').AsInteger := MyRok(X.AktObdobie);
  Q0_.Open;
  QINF_.Open;
  if Q0_.Active AND (Q0_.RecordCount>0) then ReportRZ_2004.Preview;
  QINF_.Close;
  Q0_.Close;
end;

procedure TReportRZ_2004.Q0_CalcFields(DataSet: TDataSet);
var bonus,dan,bb:double;
begin
  Q0_TMP.Value:= Copy(
    Trim(Q0_Title.Value)+' '+
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value),1,100);

  Q0_ADR.Value:=
    Q0_tp_street.Value+', '+Q0_tp_city.Value;
  {--}
  Q0_CALC_PREPL_BONUS.Value :=0;
  Q0_CALC_NEDOPL_BONUS.Value :=0;
  bonus:=Q0_D_bonus_narok.Value - Q0_D_bonus_cerpany.Value;
  if bonus>0
    then Q0_CALC_PREPL_BONUS.Value := bonus
    else Q0_CALC_NEDOPL_BONUS.Value := -bonus;
  {--}
  Q0_CALC_PREPL_DAN.Value :=0;
  Q0_CALC_NEDOPL_DAN.Value :=0;
  dan:=Q0_Preplatok.Value;
  if dan>0
    then Q0_CALC_PREPL_DAN.Value := dan
    else Q0_CALC_NEDOPL_DAN.Value := -dan;
  {--}
  Q0_CALC_PREPL_BB.Value :=0;
  Q0_CALC_NEDOPL_BB.Value :=0;
  bb:=dan-bonus;
  if bb>0
    then Q0_CALC_PREPL_BB.Value := bb
    else Q0_CALC_NEDOPL_BB.Value := -bb;
 end;

procedure RunReportRZ_2004(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportRZ_2004:=TReportRZ_2004.Create(Application);
    if X.DisableShape then QRDisableShape(ReportRZ_2004);
    if X.DisableLabel then QRDisableLabel(ReportRZ_2004);
    Screen.Cursor:=crDefault;
    ReportRZ_2004.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportRZ_2004.Free;
  end;
end;

procedure TReportRZ_2004.QINF_CalcFields(DataSet: TDataSet);
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
