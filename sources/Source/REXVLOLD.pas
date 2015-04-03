unit REXVLOLD;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportVLOLD = class(TQuickRep)
    GroupFooterBand1: TQRBand;
    QRShape11: TQRShape;
    QRShape92: TQRShape;
    QRShape96: TQRShape;
    QRShape93: TQRShape;
    QRShape97: TQRShape;
    QRShape94: TQRShape;
    QRShape98: TQRShape;
    QRShape95: TQRShape;
    QRShape120: TQRShape;
    QRShape100: TQRShape;
    QRShape121: TQRShape;
    QRShape104: TQRShape;
    QRShape112: TQRShape;
    QRShape90: TQRShape;
    QRExpr1: TQRExpr;
    QRShape91: TQRShape;
    QRShape101: TQRShape;
    QRShape105: TQRShape;
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
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRLabel61: TQRLabel;
    Q0_: TQuery;
    Q0_Name: TStringField;
    Q0_Surname: TStringField;
    Q0_Title: TStringField;
    Q0_CALC_MPT: TStringField;
    QRExpr8: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRDBText14: TQRDBText;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRDBText19: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRShape45: TQRShape;
    Q0_v_obdobie: TIntegerField;
    Q0_V_rok: TSmallintField;
    Q0_V_mesiac: TSmallintField;
    Q0_V_fmes: TSmallintField;
    Q0_V_sviatok: TSmallintField;
    Q0_V_holiday: TFloatField;
    Q0_V_absencia: TFloatField;
    Q0_V_pn1: TSmallintField;
    Q0_V_pn2: TSmallintField;
    Q0_V_uraz: TSmallintField;
    Q0_V_hodina: TFloatField;
    Q0_MV_plat: TCurrencyField;
    Q0_V_plat: TCurrencyField;
    Q0_V_sadzba: TCurrencyField;
    Q0_N_mzda: TCurrencyField;
    Q0_N_brutto: TCurrencyField;
    Q0_N_holiday: TCurrencyField;
    Q0_N_premie: TCurrencyField;
    Q0_N_odmeny: TCurrencyField;
    Q0_N_dohody_ovp: TCurrencyField;
    Q0_N_dohody_opc: TCurrencyField;
    Q0_N_doplatok: TCurrencyField;
    Q0_Vh_nadcas: TFloatField;
    Q0_Vp_nadcas: TCurrencyField;
    Q0_Vh_sobota: TFloatField;
    Q0_Vp_sobota: TCurrencyField;
    Q0_Vh_nedela: TFloatField;
    Q0_Vp_nedela: TCurrencyField;
    Q0_Vh_sviatok: TFloatField;
    Q0_Vp_sviatok: TCurrencyField;
    Q0_Vh_noc: TFloatField;
    Q0_Vp_noc: TCurrencyField;
    Q0_Vh_skod: TFloatField;
    Q0_Vp_skod: TCurrencyField;
    Q0_N_priplat: TCurrencyField;
    Q0_O_zdravot: TCurrencyField;
    Q0_O_nemoc: TCurrencyField;
    Q0_O_dochod: TCurrencyField;
    Q0_O_fondzam: TCurrencyField;
    Q0_N_poist: TCurrencyField;
    Q0_Dopravne: TCurrencyField;
    Q0_Pouz_auto: TCurrencyField;
    Q0_Nc_minimum: TCurrencyField;
    Q0_Nc_deti: TCurrencyField;
    Q0_Nc_ine: TCurrencyField;
    Q0_Nc_spolu: TCurrencyField;
    Q0_Nd_materska: TCurrencyField;
    Q0_Nd_pridavky: TCurrencyField;
    Q0_Nd_ine: TCurrencyField;
    Q0_Nd_spolu: TCurrencyField;
    Q0_Dan_vyrovnana: TSmallintField;
    Q0_D_ciastzd: TCurrencyField;
    Q0_D_zdanmzda: TCurrencyField;
    Q0_D_preddavok: TCurrencyField;
    Q0_D_dan: TCurrencyField;
    Q0_N_netto: TCurrencyField;
    Q0_Ne_zaloha: TCurrencyField;
    Q0_Ne_pozicky: TCurrencyField;
    Q0_Ne_odborar: TCurrencyField;
    Q0_Ne_poistovna: TCurrencyField;
    Q0_Ne_exekucia: TCurrencyField;
    Q0_Ne_spolu: TCurrencyField;
    Q0_Spor_plat: TSmallintField;
    Q0_Sporenie: TCurrencyField;
    Q0_Vyplata: TCurrencyField;
    Q0_V_priemer1: TCurrencyField;
    Q0_V_priemer2: TCurrencyField;
    Q0_V_pn: TSmallintField;
    Q0_N_sviatok: TCurrencyField;
    Q0_N_pn1: TCurrencyField;
    Q0_N_pn2: TCurrencyField;
    Q0_N_ocr: TCurrencyField;
    Q0_N_zaklad_poist: TCurrencyField;
    Q0_KZP: TSmallintField;
    Q0_ZPS: TBooleanField;
    Q0_F_doba: TFloatField;
    Q0_F_pn_dni: TSmallintField;
    Q0_F_pn1: TSmallintField;
    Q0_F_pn2: TSmallintField;
    Q0_F_ocr: TSmallintField;
    Q0_F_uraz: TSmallintField;
    Q0_F_nemmax: TCurrencyField;
    Q0_F_zdravot: TFloatField;
    Q0_F_nemoc: TFloatField;
    Q0_F_dochod: TFloatField;
    Q0_F_fondz: TFloatField;
    Q0_Fz_zdravot: TFloatField;
    Q0_Fz_nemoc: TFloatField;
    Q0_Fz_dochod: TFloatField;
    Q0_Fz_fondz: TFloatField;
    Q0_F_poistmax: TCurrencyField;
    Q0_F_min_mzda: TCurrencyField;
    Q0_F_nd_pocita: TSmallintField;
    Q0_F_dan_sadzba1: TFloatField;
    Q0_F_dan_maximum1: TCurrencyField;
    QRDBText47: TQRDBText;
    QRSysData1: TQRSysData;
    Q0_CALC_PREMIE: TCurrencyField;
    Q0_CALC_NAHRADY: TCurrencyField;
    PageHeaderBand1: TQRBand;
    QRShape84: TQRShape;
    QRLabel47: TQRLabel;
    QRDBText2: TQRDBText;
    Q0_code_emp: TIntegerField;
    Q0_CALC_FIRMA: TStringField;
    Q0_CALC_DAVKY_NP: TCurrencyField;
    QRDBText1: TQRDBText;
    QRExpr5: TQRExpr;
    Q0_V_den: TFloatField;
    QRDBText3: TQRDBText;
    QRExpr11: TQRExpr;
    Q0_CALC_OSTATNE_P: TCurrencyField;
    Q0_N_socfond: TCurrencyField;
    Q0_D_ciastzd2: TCurrencyField;
    Q0_D_zdanmzda2: TCurrencyField;
    Q0_D_vyrovnanie: TCurrencyField;
    QRDBText4: TQRDBText;
    QRExpr12: TQRExpr;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr10: TQRExpr;
    QRExpr13: TQRExpr;
    Q0_N_clenovia_organov: TCurrencyField;
    Q0_Ne_stravne: TCurrencyField;
    Q0_CALC_OSTATNE_Z: TCurrencyField;
    Q0_n_jednoraz: TCurrencyField;
    Q0_N_odstupne: TCurrencyField;
    Q0_N_pohotovost: TCurrencyField;
    QRShape23: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    QRExpr32: TQRExpr;
    Q0_N_nahrada: TCurrencyField;
    QRSysData2: TQRSysData;
    QRShape17: TQRShape;
    QRShape71: TQRShape;
    QRShape70: TQRShape;
    Q0_N_nemohol: TCurrencyField;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText15: TQRDBText;
    QRExpr16: TQRExpr;
    QRExpr33: TQRExpr;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRDBText18: TQRDBText;
    QRDBText20: TQRDBText;
    Q0_N_ddp: TCurrencyField;
    Q0_Nz_ddp: TCurrencyField;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRExpr34: TQRExpr;
    QRExpr35: TQRExpr;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape20: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape37: TQRShape;
    QRShape82: TQRShape;
    QRShape38: TQRShape;
    QRShape42: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape52: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape64: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape6: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape21: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape22: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape65: TQRShape;
    QRLabel42: TQRLabel;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape80: TQRShape;
    QRLabel45: TQRLabel;
    procedure Q0_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

var
  ReportVLOLD: TReportVLOLD;

procedure RunReportVLOLD(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportVLOLD.ShowReport;
begin
  if X.Abeceda
   then Q0_.SQL.Add('order by z.surname,z.name')
    else Q0_.SQL.Add('order by v.code_emp');
  QRLabel47.Caption := 'Výplatná listina súhrnná za ' +
     Mesiac(X.AktObdobie mod 100,false)+' '+IntToStr(X.AktObdobie div 100);
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q0_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q0_.Open;
  Preview;
  Q0_.Close;
end;


procedure TReportVLOLD.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_CALC_FIRMA.Value:='FIRMA: '+X.AktFirmaStr;

  Q0_CALC_MPT.Value:=COPY(
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value)+' '+
    Trim(Q0_Title.Value),
    1,100);

  Q0_CALC_PREMIE.Value :=
    Q0_N_Premie.Value +
    Q0_N_Odmeny.Value +
    Q0_N_Jednoraz.Value;

  Q0_CALC_NAHRADY.Value :=
    Q0_N_Nahrada.Value +
    Q0_N_Sviatok.Value +
    Q0_N_Holiday.Value +
    Q0_N_nemohol.Value;

  Q0_CALC_DAVKY_NP.Value :=
    Q0_Nd_spolu.Value -
    Q0_Nd_materska.value -
    Q0_Nd_pridavky.Value -
    Q0_Nd_ine.Value;

  Q0_CALC_OSTATNE_P.Value :=
    Q0_N_SOCFOND.Value +
    Q0_N_clenovia_organov.Value+
    Q0_N_pohotovost.Value+
    Q0_N_odstupne.value;

  Q0_CALC_OSTATNE_Z.Value :=
    Q0_Ne_exekucia.Value +
    Q0_Ne_stravne.Value;

end;

procedure RunReportVLOLD(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportVLOLD:=TReportVLOLD.Create(Application);
    if X.DisableShape then QRDisableShape(ReportVLOLD);
    if X.DisableLabel then QRDisableLabel(ReportVLOLD);
    Screen.Cursor:=crDefault;
    ReportVLOLD.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportVLOLD.Free;
  end;
end;

end.
