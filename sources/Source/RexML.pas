unit RexML;
{$F+}

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportML = class(TQuickRep)
    QRShape64: TQRShape;
    QRShape25: TQRShape;
    QRShape22: TQRShape;
    QRShape37: TQRShape;
    QRShape74: TQRShape;
    QRShape38: TQRShape;
    QRShape75: TQRShape;
    QRShape44: TQRShape;
    QRShape43: TQRShape;
    QRShape6: TQRShape;
    QRShape10: TQRShape;
    QRShape8: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape36: TQRShape;
    QRDBText1: TQRDBText;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape42: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText18: TQRDBText;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape65: TQRShape;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape81: TQRShape;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    Q0_: TQuery;
    Q0_Name: TStringField;
    Q0_Surname: TStringField;
    Q0_Prev_name: TStringField;
    Q0_Title: TStringField;
    Q0_Born_date: TDateField;
    Q0_Born_numb: TStringField;
    Q0_Born_city: TStringField;
    Q0_Rod_stav: TStringField;
    Q0_Pohlavie: TStringField;
    Q0_Narodnost: TStringField;
    Q0_C_op: TStringField;
    Q0_C_pasu: TStringField;
    Q0_C_vodicaku: TStringField;
    Q0_Tp_street: TStringField;
    Q0_Tp_city: TStringField;
    Q0_Tp_zip: TStringField;
    Q0_Pp_street: TStringField;
    Q0_Pp_city: TStringField;
    Q0_Pp_zip: TStringField;
    Q0_Education: TStringField;
    Q0_Zamestnanie: TStringField;
    Q1_: TQuery;
    Q0_Nastup: TDateField;
    Q0_Vystup: TDateField;
    Q0_CALC_MPT: TStringField;
    Q0_CALC_ADRESA_TP: TStringField;
    Q0_CALC_ADRESA_PP: TStringField;
    Q0_CALC_STAV: TStringField;
    Q1_CALC_PREMIE: TCurrencyField;
    Q1_CALC_NAHRADY: TCurrencyField;
    QRDBText20: TQRDBText;
    QRShape126: TQRShape;
    Q0_code_emp: TIntegerField;
    Q0_CALC_FIRMA: TStringField;
    Q1_CALC_DAVKY_NP: TCurrencyField;
    QRDBText32: TQRDBText;
    QRDBText44: TQRDBText;
    DS0: TDataSource;
    Q1_CALC_OSTATNE_P: TCurrencyField;
    QRDBText47: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape12: TQRShape;
    QRShape48: TQRShape;
    QRDBText46: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText48: TQRDBText;
    QRShape108: TQRShape;
    QRShape109: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRShape131: TQRShape;
    QRShape132: TQRShape;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText53: TQRDBText;
    QRShape135: TQRShape;
    QRDBText54: TQRDBText;
    Q1_CALC_JEDNORAZ: TCurrencyField;
    Q1_CALC_DOPR_SPOLU: TCurrencyField;
    Q1_v_mesiac: TSmallintField;
    Q1_v_den: TFloatField;
    Q1_v_sviatok: TSmallintField;
    Q1_v_holiday: TFloatField;
    Q1_v_hodina: TFloatField;
    Q1_v_plat: TCurrencyField;
    Q1_n_priplat: TCurrencyField;
    Q1_n_sviatok: TCurrencyField;
    Q1_n_nahrada: TCurrencyField;
    Q1_n_poist: TCurrencyField;
    Q1_n_premie: TCurrencyField;
    Q1_n_odmeny: TCurrencyField;
    Q1_n_jednoraz1: TCurrencyField;
    Q1_n_jednoraz2: TCurrencyField;
    Q1_n_socfond: TCurrencyField;
    Q1_n_dohody_ovp: TCurrencyField;
    Q1_n_dohody_opc: TCurrencyField;
    Q1_n_brutto: TCurrencyField;
    Q1_n_nemohol: TCurrencyField;
    Q1_n_clenovia_organov: TCurrencyField;
    Q1_n_odstupne: TCurrencyField;
    Q1_n_pohotovost: TCurrencyField;
    Q1_n_ddp: TCurrencyField;
    Q1_o_zdravot: TCurrencyField;
    Q1_o_nemoc: TCurrencyField;
    Q1_o_dochod: TCurrencyField;
    Q1_o_fondzam: TCurrencyField;
    Q1_dopravne: TCurrencyField;
    Q1_dopravne_mimoriadne: TCurrencyField;
    Q1_nc_minimum: TCurrencyField;
    Q1_nc_ine: TCurrencyField;
    Q1_d_preddavok: TCurrencyField;
    Q1_d_dan: TCurrencyField;
    Q1_nd_materska: TCurrencyField;
    Q1_nd_pridavky: TCurrencyField;
    Q1_nd_spolu: TCurrencyField;
    Q1_n_doplatok: TCurrencyField;
    Q1_ne_pozicky: TCurrencyField;
    Q1_ne_odborar: TCurrencyField;
    Q1_n_netto: TCurrencyField;
    Q1_ne_exekucia: TCurrencyField;
    Q1_ne_zaloha: TCurrencyField;
    Q1_sporenie: TCurrencyField;
    Q1_vyplata: TCurrencyField;
    Q1_d_vyrovnanie: TCurrencyField;
    Q1_d_ciastzd: TCurrencyField;
    Q1_nc_deti: TCurrencyField;
    Q1_ne_spolu: TCurrencyField;
    Q1_n_holiday: TCurrencyField;
    QRDBText11: TQRDBText;
    QRDBText35: TQRDBText;
    Q1_ne_stravne: TCurrencyField;
    Q1_ne_poistovna: TCurrencyField;
    Q2_: TQuery;
    Q2_Code_emp: TIntegerField;
    Q2_DID: TIntegerField;
    Q2_Priezvisko: TStringField;
    Q2_Meno: TStringField;
    Q2_RC: TStringField;
    Q2_DAT_NAR: TDateField;
    Q2_PD: TBooleanField;
    Q2_NC: TBooleanField;
    Q2_ZTP: TBooleanField;
    Q2_MES_OD: TSmallintField;
    Q2_MES_DO: TSmallintField;
    SummaryBand1: TQRBand;
    QRShape136: TQRShape;
    QRShape127: TQRShape;
    QRShape11: TQRShape;
    QRShape92: TQRShape;
    QRShape96: TQRShape;
    QRShape93: TQRShape;
    QRShape97: TQRShape;
    QRShape94: TQRShape;
    QRShape98: TQRShape;
    QRShape95: TQRShape;
    QRShape120: TQRShape;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRShape121: TQRShape;
    QRShape104: TQRShape;
    QRShape103: TQRShape;
    QRShape112: TQRShape;
    QRShape90: TQRShape;
    QRExpr1: TQRExpr;
    QRShape91: TQRShape;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRShape107: TQRShape;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    QRShape113: TQRShape;
    QRShape114: TQRShape;
    QRShape115: TQRShape;
    QRShape116: TQRShape;
    QRShape117: TQRShape;
    QRShape118: TQRShape;
    QRShape119: TQRShape;
    QRShape122: TQRShape;
    QRShape123: TQRShape;
    QRShape124: TQRShape;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRLabel61: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRShape49: TQRShape;
    QRExpr32: TQRExpr;
    QRExpr33: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr34: TQRExpr;
    QRShape128: TQRShape;
    QRShape129: TQRShape;
    QRExpr4: TQRExpr;
    QRExpr35: TQRExpr;
    QRExpr36: TQRExpr;
    QRShape133: TQRShape;
    QRShape134: TQRShape;
    QRExpr37: TQRExpr;
    QRExpr38: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr31: TQRExpr;
    QRExpr39: TQRExpr;
    QRExpr40: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr24: TQRExpr;
    PageHeaderBand1: TQRBand;
    QRShape80: TQRShape;
    QRShape137: TQRShape;
    QRShape31: TQRShape;
    QRShape14: TQRShape;
    QRShape19: TQRShape;
    QRShape15: TQRShape;
    QRShape5: TQRShape;
    QRShape30: TQRShape;
    QRShape7: TQRShape;
    QRShape40: TQRShape;
    QRShape29: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape28: TQRShape;
    QRShape82: TQRShape;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape34: TQRShape;
    QRShape83: TQRShape;
    QRDBText16: TQRDBText;
    QRShape13: TQRShape;
    QRLabel8: TQRLabel;
    QRShape85: TQRShape;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel12: TQRLabel;
    QRShape35: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape41: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape61: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape84: TQRShape;
    QRLabel47: TQRLabel;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabelRok: TQRLabel;
    QRShape89: TQRShape;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText17: TQRDBText;
    QRShape125: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape9: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape16: TQRShape;
    QRShape50: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape51: TQRShape;
    QRLabel62: TQRLabel;
    QRShape130: TQRShape;
    QRLabel63: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel45: TQRLabel;
    QRShape39: TQRShape;
    QRShape138: TQRShape;
    QRShape139: TQRShape;
    QRLabel51: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRShape145: TQRShape;
    QRShape149: TQRShape;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRShape150: TQRShape;
    Q1_n_zaklad_dp: TCurrencyField;
    Q1_n_zaklad_np: TCurrencyField;
    Q1_n_zaklad_zp: TCurrencyField;
    Q1_n_zaklad_fz: TCurrencyField;
    QRShape148: TQRShape;
    QRShape151: TQRShape;
    QRShape152: TQRShape;
    QRExpr41: TQRExpr;
    QRExpr42: TQRExpr;
    QRExpr43: TQRExpr;
    QRShape153: TQRShape;
    QRLabel71: TQRLabel;
    QRDBText60: TQRDBText;
    QRLabel72: TQRLabel;
    Q0_KZP: TSmallintField;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel74: TQRLabel;
    QRShape154: TQRShape;
    QRLabel75: TQRLabel;
    Q2_CALC_MP: TStringField;
    Q0_CALC_NAZOV_ZP: TStringField;
    BandVypTelo: TQRSubDetail;
    QRSubDetail1: TQRSubDetail;
    GroupHeaderBand1: TQRBand;
    QRShape140: TQRShape;
    QRLabel67: TQRLabel;
    QRShape141: TQRShape;
    QRLabel68: TQRLabel;
    QRShape143: TQRShape;
    QRLabel70: TQRLabel;
    QRShape147: TQRShape;
    QRShape146: TQRShape;
    QRDBText43: TQRDBText;
    QRDBText56: TQRDBText;
    Q0_Code_numb: TIntegerField;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure Q1_CalcFields(DataSet: TDataSet);
    procedure Q2_CalcFields(DataSet: TDataSet);
    procedure ReportMLBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    first_preview: boolean;
  public
    procedure ShowReport(X:TMyReportParam);
  end;

var
  ReportML: TReportML;

procedure RunReportML(MyReportParam: TMyReportParam);

implementation

uses Dm_main;

{$R *.DFM}

var X:TMyReportParam;

procedure TReportML.ShowReport(X:TMyReportParam);
begin
  first_preview := true;
  QRLabelRok.Caption := 'Rok: '+IntToStr(X.AktObdobie div 100);
  Q2_.Close;
  Q1_.Close;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.Code_emp1;
  Q0_.ParamByName('P2').AsInteger := X.Code_emp2;
  Q0_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q0_.ParamByName('OBDOBIE1').AsInteger := (X.AktObdobie div 100)*100 + 1;
  Q0_.ParamByName('OBDOBIE2').AsInteger := (X.AktObdobie div 100)*100 + 12;
  Q1_.ParamByName('OBDOBIE1').AsInteger := (X.AktObdobie div 100)*100 + 1;
  Q1_.ParamByName('OBDOBIE2').AsInteger := (X.AktObdobie div 100)*100 + 12;
  Q0_.Open;
  Q1_.Open;
  Q2_.Open;
  ReportML.Preview;
  Q2_.Close;
  Q1_.Close;
  Q0_.Close;
end;


procedure TReportML.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_CALC_FIRMA.Value:= X.AktFirmaStr;

  Q0_CALC_MPT.Value:=COPY(
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value)+' '+
    Trim(Q0_Title.Value),
    1,100);

  if Q0_tp_street.Value <> ''
    then Q0_CALC_ADRESA_TP.Value :=
           Q0_tp_street.Value + ', ' +
           Q0_tp_zip.Value + ' ' + Q0_tp_city.Value
    else Q0_CALC_ADRESA_TP.Value :=
           Q0_tp_zip.Value + ' ' + Q0_tp_city.Value;

  if Q0_pp_street.Value <> ''
    then Q0_CALC_ADRESA_PP.Value :=
           Q0_pp_street.Value + ', ' +
           Q0_pp_zip.Value + ' ' + Q0_pp_city.Value
    else Q0_CALC_ADRESA_PP.Value :=
           Q0_pp_zip.Value + ' ' + Q0_pp_city.Value;

  Q0_CALC_STAV.Value := RODINNY_STAV(Q0_Rod_stav.Value[1],Q0_Pohlavie.Value[1]);
  Q0_CALC_NAZOV_ZP.Value := DM.NAZOV_ZP(Q0_KZP.AsInteger);
end;


procedure TReportML.Q1_CalcFields(DataSet: TDataSet);
begin
  Q1_CALC_JEDNORAZ.Value :=
    Q1_N_jednoraz1.Value+
    Q1_N_jednoraz2.Value;

  Q1_CALC_PREMIE.Value :=
    Q1_N_Premie.Value +
    Q1_N_Odmeny.Value +
    Q1_CALC_Jednoraz.Value;

  Q1_CALC_NAHRADY.Value :=
    Q1_N_Nahrada.Value +
    Q1_N_Nemohol.Value;

  Q1_CALC_DAVKY_NP.Value :=
    Q1_Nd_spolu.value -
    Q1_Nd_materska.value -
    Q1_Nd_pridavky.Value;

  Q1_CALC_OSTATNE_P.Value :=
    Q1_N_clenovia_organov.Value+
    Q1_N_odstupne.Value+
    Q1_N_pohotovost.Value;

  Q1_CALC_DOPR_SPOLU.Value :=
    Q1_dopravne.Value+
    Q1_dopravne_mimoriadne.Value;
end;

procedure RunReportML(MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportML:=TReportML.Create(Application);
    if X.DisableShape then QRDisableShape(ReportML);
    if X.DisableLabel then QRDisableLabel(ReportML);
    Screen.Cursor:=crDefault;
    ReportML.ShowReport(X);
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportML.Free;
  end;
end;

procedure TReportML.Q2_CalcFields(DataSet: TDataSet);
begin
  Q2_Calc_MP.Value :=
  Copy(
    Trim(Q2_Meno.Value)+' '+
    Trim(Q2_Priezvisko.Value),1,100);
end;


procedure TReportML.ReportMLBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,8);
end;

end.
