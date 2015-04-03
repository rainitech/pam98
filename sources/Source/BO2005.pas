unit BO2005;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportBO2005 = class(TQuickRep)
    Q0_: TQuery;
    DS0: TDataSource;
    QINF_: TQuery;
    QINF_NAZOV: TStringField;
    QINF_ADR_ULICA: TStringField;
    QINF_ADR_MESTO: TStringField;
    QINF_ADR_PSC: TStringField;
    QINF_CALC_ADRESA: TStringField;
    QINF_DIC: TStringField;
    QINF_ADR_CISLO: TStringField;
    DetailBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel51: TQRLabel;
    QRShape54: TQRShape;
    QRLabel15: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel60: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRL_obdobie: TQRLabel;
    QRShape26: TQRShape;
    QRShape28: TQRShape;
    QRShape30: TQRShape;
    QRShape32: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QR_Vykaz_zostavil_text: TQRLabel;
    QR_telefon: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape50: TQRShape;
    QRShape66: TQRShape;
    QRLabel26: TQRLabel;
    QR_Vykaz_miesto: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText32: TQRDBText;
    QR_Vykaz_dna: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape10: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape13: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    Q0_d_preddavok: TCurrencyField;
    Q0_d_vyrovnanie: TCurrencyField;
    Q0_d_bonus_cerpany: TCurrencyField;
    Q0_CALC_bonus_vypl: TCurrencyField;
    Q0_CALC_bonus_vlastne: TCurrencyField;
    QINF_NAZOV_BANKY: TStringField;
    QRDBText1: TQRDBText;
    QINF_ICO: TStringField;
    QRDBText2: TQRDBText;
    QRLabel41: TQRLabel;
    QINF_PREDCISLO_U: TStringField;
    QINF_CISLO_U: TStringField;
    QINF_BANKA_U: TStringField;
    QINF_CALC_CISLO_UCTU: TStringField;
    QRDBText3: TQRDBText;
    Q0_d_dan: TCurrencyField;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure QINF_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;
  end;

var
  ReportBO2005: TReportBO2005;

  procedure RunReportBO2005(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportBO2005.ShowReport;
begin
  QRL_obdobie.Caption:=IntToStr(X.AktObdobie mod 100)+'/'+IntToStr(X.AktObdobie div 100);
  QR_Vykaz_miesto.Caption := X.Vykaz_miesto;
  QR_Vykaz_dna.Caption := X.Vykaz_dna;
  QR_Telefon.Caption := X.Telefon;
  Q0_.Close;
  Q0_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q0_.ParamByName('OBDOBIE1').AsInteger := X.AktObdobie;
  Q0_.ParamByName('OBDOBIE2').AsInteger := X.AktObdobie;
  Q0_.Open;
  QINF_.Close;
  QINF_.Open;
  Preview;
  QINF_.Close;
  Q0_.Close;
end;

procedure TReportBO2005.Q0_CalcFields(DataSet: TDataSet);
var dispo: double;
begin
  Q0_calc_bonus_vypl.Value := Q0_d_bonus_cerpany.Value;
  Q0_calc_bonus_vlastne.Value :=0;
  dispo := Q0_d_preddavok.Value - Q0_d_vyrovnanie.Value;
  if X.AktObdobie >= ZAKON_2007_01 then
    dispo := dispo + Q0_d_dan.Value;
  if dispo < 0 then dispo := 0;
  if dispo < Q0_d_bonus_cerpany.Value then begin
    Q0_calc_bonus_vypl.Value := dispo;
    Q0_calc_bonus_vlastne.Value := Q0_d_bonus_cerpany.Value - dispo;
  end;
end;

procedure RunReportBO2005(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportBO2005:=TReportBO2005.Create(Application);
    if X.DisableShape then QRDisableShape(ReportBO2005);
    if X.DisableLabel then QRDisableLabel(ReportBO2005);
    Screen.Cursor:=crDefault;
    ReportBO2005.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportBO2005.Free;
  end;
end;

procedure TReportBO2005.QINF_CalcFields(DataSet: TDataSet);
begin
  QINF_CALC_CISLO_UCTU.Value :=
    LongCisloU (QINF_Predcislo_u.Value,QINF_Cislo_u.Value)+'/'+QINF_Banka_u.Value;

  QINF_CALC_ADRESA.Value :=
    MyAdresa(
    QINF_adr_ulica.Value,
    QINF_adr_cislo.Value,
    QINF_adr_psc.Value,
    QINF_adr_mesto.Value );
end;




















































































































































end.
