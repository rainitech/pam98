unit ZP05OZPR;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportZP05OZPR = class(TQuickRep)
    GroupFooterBand1: TQRBand;
    Q1_: TQuery;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    Q0_: TQuery;
    Q0_kzp: TSmallintField;
    Q0_pocet: TIntegerField;
    Q0_CA_OBDOBIE: TStringField;
    Q0_CA_NADPIS1: TStringField;
    DS0: TDataSource;
    SummaryBand1: TQRBand;
    QRGroup2: TQRGroup;
    Q0_CALC_SS: TStringField;
    QRSubDetail1: TQRSubDetail;
    QRDBText33: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape34: TQRShape;
    QRShape38: TQRShape;
    QRShape41: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    PageFooterBand1: TQRBand;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape33: TQRShape;
    QRExpr1: TQRExpr;
    QRLabel47: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRMemo5: TQRMemo;
    QRMemo6: TQRMemo;
    Q0_CALC_ICO: TStringField;
    QRMemo7: TQRMemo;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRMemo8: TQRMemo;
    QRDBText9: TQRDBText;
    QRLabel_KZP: TQRLabel;
    GroupFooterBand2: TQRBand;
    QRLabel4: TQRLabel;
    QRMemo1: TQRMemo;
    QRMemo4: TQRMemo;
    Q0_nedopl_znec: TCurrencyField;
    Q0_nedopl_ztel: TCurrencyField;
    Q1_Code_numb: TIntegerField;
    Q1_Code_emp: TIntegerField;
    Q1_SID: TSmallintField;
    Q1_Name: TStringField;
    Q1_Surname: TStringField;
    Q1_Prev_name: TStringField;
    Q1_Title: TStringField;
    Q1_Born_date: TDateField;
    Q1_Born_numb: TStringField;
    Q1_Born_city: TStringField;
    Q1_Rod_stav: TStringField;
    Q1_Pohlavie: TStringField;
    Q1_Narodnost: TStringField;
    Q1_C_op: TStringField;
    Q1_C_pasu: TStringField;
    Q1_C_vodicaku: TStringField;
    Q1_Predcislo_u: TStringField;
    Q1_Cislo_u: TStringField;
    Q1_Banka_u: TStringField;
    Q1_SSym_u: TStringField;
    Q1_Tp_street: TStringField;
    Q1_Tp_city: TStringField;
    Q1_Tp_zip: TStringField;
    Q1_Pp_street: TStringField;
    Q1_Pp_city: TStringField;
    Q1_Pp_zip: TStringField;
    Q1_Education: TStringField;
    Q1_Zamestnanie: TStringField;
    Q1_W_holiday: TFloatField;
    Q1_Holiday: TFloatField;
    Q1_KZP: TSmallintField;
    Q1_ZPS: TBooleanField;
    Q1_Nastup: TDateField;
    Q1_Vystup: TDateField;
    Q1_VYHL: TBooleanField;
    Q1_RZP: TBooleanField;
    Q1_MV_plat: TCurrencyField;
    Q1_V_sadzba: TCurrencyField;
    Q1_Pouz_auto: TCurrencyField;
    Q1_Nc_minimum: TCurrencyField;
    Q1_Ne_zaloha: TCurrencyField;
    Q1_Ne_pozicky: TCurrencyField;
    Q1_Ne_odborar: TCurrencyField;
    Q1_Ne_poistovna: TCurrencyField;
    Q1_Ne_exekucia: TCurrencyField;
    Q1_Spor_plat: TSmallintField;
    Q1_Sporenie: TCurrencyField;
    Q1_U_zdrav: TSmallintField;
    Q1_U_nemoc: TSmallintField;
    Q1_U_dochod: TSmallintField;
    Q1_U_fondzam: TSmallintField;
    Q1_Fz_uvazok: TStringField;
    Q1_Fz_typzam: TStringField;
    Q1_Fz_hlavne: TBooleanField;
    Q1_Dan_zrazkou: TBooleanField;
    Q1_F_doba: TFloatField;
    Q1_Fixny_mv_plat: TBooleanField;
    Q1_F_sadzba_premii: TFloatField;
    Q1_Holiday_old: TFloatField;
    Q1_ZTP: TBooleanField;
    Q1_Zvys_ostatne: TCurrencyField;
    Q1_U_sviatky: TBooleanField;
    Q1_N_ddp: TCurrencyField;
    Q1_Vsym_u: TStringField;
    Q1_Ksym_u: TStringField;
    Q1_Dan_nerezident: TBooleanField;
    Q1_N_sadzba_ddp: TFloatField;
    Q1_Nz_ddp: TCurrencyField;
    Q1_Nz_sadzba_ddp: TFloatField;
    Q1_KDP: TSmallintField;
    Q1_U_invalid: TSmallintField;
    Q1_U_uraz: TSmallintField;
    Q1_U_rezerva: TSmallintField;
    Q1_U_garancne: TSmallintField;
    Q1_PN_DENNE: TFloatField;
    Q1_VYNIMKA_VZ: TStringField;
    Q1_Miera_poklesu: TFloatField;
    Q1_Stat_obcan: TStringField;
    Q1_Stat_tp: TStringField;
    Q1_Stat_pp: TStringField;
    Q1_Tp_zip2: TStringField;
    Q1_Pp_zip2: TStringField;
    Q1_SSN: TStringField;
    Q1_CPP: TStringField;
    Q1_TYPZEC: TSmallintField;
    Q1_Tel1: TStringField;
    Q1_Tel2: TStringField;
    Q1_Fax: TStringField;
    Q1_Mail: TStringField;
    Q1_SSN_STATP: TStringField;
    Q1_Banka2_u: TStringField;
    Q1_U_sds: TSmallintField;
    Q1_Code_emp_1: TIntegerField;
    Q1_V_rok: TSmallintField;
    Q1_Typ: TStringField;
    Q1_Rok: TSmallintField;
    Q1_X1: TCurrencyField;
    Q1_X2: TCurrencyField;
    Q1_X3: TCurrencyField;
    Q1_X4: TCurrencyField;
    Q1_X5: TCurrencyField;
    Q1_X6: TCurrencyField;
    Q1_X7: TCurrencyField;
    Q1_X8: TCurrencyField;
    Q1_X9: TCurrencyField;
    Q1_X10: TCurrencyField;
    Q1_X11: TCurrencyField;
    Q1_X12: TCurrencyField;
    Q1_X13: TCurrencyField;
    Q1_X14: TCurrencyField;
    Q1_X15: TCurrencyField;
    Q1_X16: TCurrencyField;
    Q1_X17: TCurrencyField;
    Q1_X18: TCurrencyField;
    Q1_X19: TCurrencyField;
    Q1_X20: TCurrencyField;
    Q1_X21: TCurrencyField;
    Q1_X22: TCurrencyField;
    Q1_X23: TCurrencyField;
    Q1_X24: TCurrencyField;
    Q1_X25: TCurrencyField;
    Q1_X26: TCurrencyField;
    Q1_X28: TCurrencyField;
    Q1_X29: TCurrencyField;
    Q1_X30: TCurrencyField;
    Q1_X31: TCurrencyField;
    Q1_X32: TCurrencyField;
    Q1_X33: TCurrencyField;
    Q1_X34: TCurrencyField;
    Q1_X35: TCurrencyField;
    Q1_X36: TCurrencyField;
    Q1_X37: TCurrencyField;
    Q1_X38: TCurrencyField;
    Q1_X39: TCurrencyField;
    Q1_X40: TCurrencyField;
    Q1_X41: TCurrencyField;
    Q1_X42: TCurrencyField;
    Q1_X43: TCurrencyField;
    Q1_X44: TCurrencyField;
    Q1_X45: TCurrencyField;
    Q1_X46: TCurrencyField;
    Q1_X47: TCurrencyField;
    Q1_X48: TCurrencyField;
    Q1_X49: TCurrencyField;
    Q1_X50: TCurrencyField;
    Q1_X51: TCurrencyField;
    Q1_X52: TCurrencyField;
    Q1_X53: TCurrencyField;
    Q1_X54: TCurrencyField;
    Q1_X55: TCurrencyField;
    Q1_X56: TCurrencyField;
    Q1_X57: TCurrencyField;
    Q1_X58: TCurrencyField;
    Q1_X59: TCurrencyField;
    Q1_X60: TCurrencyField;
    Q1_X61: TCurrencyField;
    Q1_X62: TCurrencyField;
    Q1_X63: TCurrencyField;
    Q1_X64: TCurrencyField;
    Q1_X65: TCurrencyField;
    Q1_X66: TCurrencyField;
    Q1_X67: TCurrencyField;
    Q1_X68: TCurrencyField;
    Q1_X69: TCurrencyField;
    Q1_X70: TCurrencyField;
    Q1_D1: TDateField;
    Q1_D2: TDateField;
    Q1_D3: TDateField;
    Q1_D4: TDateField;
    Q1_D5: TDateField;
    Q1_D6: TDateField;
    Q1_D7: TDateField;
    Q1_D8: TDateField;
    Q1_D9: TDateField;
    Q1_D10: TDateField;
    Q1_A1: TStringField;
    Q1_A2: TStringField;
    Q1_A3: TStringField;
    Q1_A4: TStringField;
    Q1_A5: TStringField;
    Q1_A6: TStringField;
    Q1_A7: TStringField;
    Q1_A8: TStringField;
    Q1_A9: TStringField;
    Q1_A10: TStringField;
    Q1_PO_NAZOV: TStringField;
    Q1_PO_ZPCPP: TStringField;
    Q1_FO_RC: TStringField;
    Q1_FO_CPP: TStringField;
    Q1_ICO: TStringField;
    Q1_DIC: TStringField;
    Q1_ADR_ULICA: TStringField;
    Q1_ADR_PSC: TStringField;
    Q1_ADR_OBEC: TStringField;
    Q1_ADR_TEL: TStringField;
    Q1_ADR_FAX: TStringField;
    QRDBText1: TQRDBText;
    Q1_CALC_VYK_ZNEC: TStringField;
    Q1_CALC_VYK_ZTEL: TStringField;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ReportZP05OZPRBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure Q1_CalcFields(DataSet: TDataSet);
  private
    first_preview:boolean;
  public
    procedure ShowReport;
    procedure SetX(const MyReportParam:TMyReportParam);
  end;

var
  ReportZP05OZPR: TReportZP05OZPR;

procedure RunReportZP05OZPR(const MyReportParam: TMyReportParam);

implementation

uses RexZP, Dm_main;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportZP05OZPR.ShowReport;
begin
  first_preview:=true;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := MyRok(X.AktObdobie);
  Q0_.Open;
  Q1_.Close;
  Q1_.ParamByName('P1').AsInteger := MyRok(X.AktObdobie);
  Q1_.Open;
  Preview;
  Q1_.Close;
  Q0_.Close;
end;


procedure RunReportZP05OZPR(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportZP05OZPR:=TReportZP05OZPR.Create(Application);
    if X.DisableShape then QRDisableShape(ReportZP05OZPR);
    if X.DisableLabel then QRDisableLabel(ReportZP05OZPR);
    Screen.Cursor:=crDefault;
    ReportZP05OZPR.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportZP05OZPR.Free;
  end;
end;

procedure TReportZP05OZPR.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 QRExpr1.Reset;
end;

procedure TReportZP05OZPR.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 QRLabel_KZP.Caption := Q0_KZP.AsString;
end;

procedure TReportZP05OZPR.ReportZP05OZPRBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  Q0_.First;
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,5);
end;

procedure TReportZP05OZPR.SetX(const MyReportParam:TMyReportParam);
begin
  X:=MyReportParam;
end;


procedure TReportZP05OZPR.Q1_CalcFields(DataSet: TDataSet);
begin
  if Q1_A1.Value = '2' then
    Q1_CALC_VYK_ZNEC.Value := 'X' else Q1_CALC_VYK_ZNEC.Value := '';
  if Q1_A1.Value = '1' then
    Q1_CALC_VYK_ZTEL.Value := 'X' else Q1_CALC_VYK_ZTEL.Value := '';
end;

end.
