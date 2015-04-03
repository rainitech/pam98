unit RZ2009B;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportRZ_2009B = class(TQuickRep)
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
    Q0_code_emp: TIntegerField;
    QINF_: TQuery;
    QINF_NAZOV: TStringField;
    QINF_ADR_ULICA: TStringField;
    QINF_ADR_MESTO: TStringField;
    QINF_ADR_PSC: TStringField;
    QINF_CALC_ADRESA: TStringField;
    Q0_Uhrn_nepenaznych: TCurrencyField;
    Q0_Nedoplatok_nepenaznych: TCurrencyField;
    Q0_Uhrn_brutto: TCurrencyField;
    Q0_Uhrn_osobitna: TCurrencyField;
    Q0_Dan_osobitna: TCurrencyField;
    Q0_Poistne: TCurrencyField;
    Q0_DDP: TCurrencyField;
    Q0_Uhrn_nepen2: TCurrencyField;
    Q0_Nedoplatok_nepen2: TCurrencyField;
    QINF_DIC: TStringField;
    QINF_ADR_CISLO: TStringField;
    Q0_D_bonus_narok: TCurrencyField;
    Q0_D_bonus_cerpany: TCurrencyField;
    Q0_CALC_PREPL_BONUS: TCurrencyField;
    Q0_CALC_PREPL_BB: TCurrencyField;
    Q0_CALC_NEDOPL_BONUS: TCurrencyField;
    Q0_CALC_NEDOPL_BB: TCurrencyField;
    Q0_CALC_PREPL_DAN: TCurrencyField;
    Q0_CALC_NEDOPL_DAN: TCurrencyField;
    Q0_CALC_PREPL_NEU: TCurrencyField;
    Q0_CALC_NEDOPL_NEU: TCurrencyField;
    Q0_Premia_suma: TCurrencyField;
    Q0_Preddavky1: TCurrencyField;
    DetailBand1: TQRBand;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape33: TQRShape;
    QRShape27: TQRShape;
    QRShape22: TQRShape;
    QRShape9: TQRShape;
    QRShape29: TQRShape;
    QRShape21: TQRShape;
    QRShape19: TQRShape;
    QRShape25: TQRShape;
    QRShape30: TQRShape;
    QRLabel27: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText14: TQRDBText;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape15: TQRShape;
    QRDBText3: TQRDBText;
    QRShape16: TQRShape;
    QRShape11: TQRShape;
    QRShape6: TQRShape;
    QRShape38: TQRShape;
    QRLabel5: TQRLabel;
    QRShape56: TQRShape;
    QRShape50: TQRShape;
    QRShape4: TQRShape;
    QRShape14: TQRShape;
    QRDBText4: TQRDBText;
    QRShape7: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape8: TQRShape;
    QRShape13: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape2: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel71: TQRLabel;
    QR_Vykaz_miesto: TQRLabel;
    QR_Vykaz_dna: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText20: TQRDBText;
    QRMemo1: TQRMemo;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure QINF_CalcFields(DataSet: TDataSet);
    procedure ReportRZ_2009BBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    first_preview : boolean;
  public
    procedure ShowReport;

  end;

var
  ReportRZ_2009B: TReportRZ_2009B;

procedure RunReportRZ_2009B(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportRZ_2009B.ShowReport;
begin
  first_preview := true;
  QR_Vykaz_dna.Caption := X.Vykaz_dna;
  QR_Vykaz_miesto.Caption := X.Vykaz_miesto;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.Code_Emp1;
  Q0_.ParamByName('P2').AsInteger := X.Code_Emp2;
  Q0_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q0_.ParamByName('ROK').AsInteger := MyRok(X.AktObdobie);
  Q0_.Open;
  QINF_.Open;
  if Q0_.Active AND (Q0_.RecordCount>0) then ReportRZ_2009B.Preview;
  QINF_.Close;
  Q0_.Close;
end;

procedure TReportRZ_2009B.Q0_CalcFields(DataSet: TDataSet);
var bonus,bb,pr,neu:double;
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
  Q0_CALC_PREPL_DAN.Value :=0;
  Q0_CALC_NEDOPL_DAN.Value :=0;
  Q0_CALC_PREPL_BB.Value :=0;
  Q0_CALC_NEDOPL_BB.Value :=0;
  Q0_CALC_PREPL_BB.Value :=0;
  Q0_CALC_NEDOPL_BB.Value :=0;
  Q0_CALC_PREPL_NEU.Value :=0;
  Q0_CALC_NEDOPL_NEU.Value :=0;
  {--}
  bonus:=Q0_D_bonus_narok.Value - Q0_D_bonus_cerpany.Value;
  if bonus>0
    then Q0_CALC_PREPL_BONUS.Value := bonus
    else Q0_CALC_NEDOPL_BONUS.Value := -bonus;
  {--}
  bb:=Q0_CALC_NEDOPL_DAN.Value +
      Q0_CALC_NEDOPL_BONUS.Value -
      Q0_CALC_PREPL_DAN.Value -
      Q0_CALC_NEDOPL_BONUS.Value;
  if bb>0
    then Q0_CALC_PREPL_BB.Value := bb
    else Q0_CALC_NEDOPL_BB.Value := -bb;
  pr:=Q0_Preplatok.Value;
  if pr>0  then Q0_CALC_PREPL_DAN.Value := -pr
           else Q0_CALC_NEDOPL_DAN.Value := -pr;
  neu:= Q0_Dan.Value - Q0_Preddavky1.Value - Q0_Dan_osobitna.Value;
  if neu>0  then Q0_CALC_NEDOPL_NEU.Value := neu
           else Q0_CALC_PREPL_NEU.Value := -neu;
 end;

procedure RunReportRZ_2009B(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportRZ_2009B:=TReportRZ_2009B.Create(Application);
    if X.DisableShape then QRDisableShape(ReportRZ_2009B);
    if X.DisableLabel then QRDisableLabel(ReportRZ_2009B);
    Screen.Cursor:=crDefault;
    ReportRZ_2009B.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportRZ_2009B.Free;
  end;
end;

procedure TReportRZ_2009B.QINF_CalcFields(DataSet: TDataSet);
begin
  QINF_CALC_ADRESA.Value :=
    QINF_nazov.Value + ', '+
    MyAdresa(
    QINF_adr_ulica.Value,
    QINF_adr_cislo.Value,
    QINF_adr_psc.Value,
    QINF_adr_mesto.Value );
end;


procedure TReportRZ_2009B.ReportRZ_2009BBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,4);
end;

end.
