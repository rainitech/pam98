unit VP2005B;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick, Dm_main;

type
  TReportVP2005B = class(TQuickRep)
    Q1_: TQuery;
    Q1_CALC_OBDOBIE: TStringField;
    Q1_CALC_TMP: TStringField;
    Q1_CALC_ZRAZKY: TCurrencyField;
    DetailBand1: TQRBand;
    QRShape15: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape13: TQRShape;
    QRShape7: TQRShape;
    QRShape2: TQRShape;
    QRShape11: TQRShape;
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel49: TQRLabel;
    QRDBText35: TQRDBText;
    QRDBText48: TQRDBText;
    QRLabel51: TQRLabel;
    QRDBText49: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText51: TQRDBText;
    QRLabel54: TQRLabel;
    QRDBText52: TQRDBText;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRDBText54: TQRDBText;
    QRLabel57: TQRLabel;
    QRDBText55: TQRDBText;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText40: TQRDBText;
    QRDBText42: TQRDBText;
    QRLabel21: TQRLabel;
    QRLAB_doplatky: TQRLabel;
    QRDBText44: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel58: TQRLabel;
    QRSuma2: TQRLabel;
    QRLabel62: TQRLabel;
    QRSuma1: TQRLabel;
    QRLabel64: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel65: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel69: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel72: TQRLabel;
    QRDBText57: TQRDBText;
    QRLabel73: TQRLabel;
    QRDBText58: TQRDBText;
    QRLabel74: TQRLabel;
    QRDBText59: TQRDBText;
    QRLabel75: TQRLabel;
    QRDBText60: TQRDBText;
    Q1_surname: TStringField;
    Q1_name: TStringField;
    Q1_title: TStringField;
    Q1_V_obdobie: TIntegerField;
    Q1_v_rok: TSmallintField;
    Q1_v_mesiac: TSmallintField;
    Q1_V_fmes: TSmallintField;
    Q1_V_sviatok: TSmallintField;
    Q1_V_holiday: TFloatField;
    Q1_V_absencia: TFloatField;
    Q1_V_pn1: TSmallintField;
    Q1_V_pn2: TSmallintField;
    Q1_V_uraz: TSmallintField;
    Q1_V_hodina: TFloatField;
    Q1_MV_plat: TCurrencyField;
    Q1_V_plat: TCurrencyField;
    Q1_V_sadzba: TCurrencyField;
    Q1_N_mzda: TCurrencyField;
    Q1_N_brutto: TCurrencyField;
    Q1_N_holiday: TCurrencyField;
    Q1_N_premie: TCurrencyField;
    Q1_N_odmeny: TCurrencyField;
    Q1_N_dohody_ovp: TCurrencyField;
    Q1_N_dohody_opc: TCurrencyField;
    Q1_N_doplatok: TCurrencyField;
    Q1_Vh_nadcas: TFloatField;
    Q1_Vp_nadcas: TCurrencyField;
    Q1_Vh_sobota: TFloatField;
    Q1_Vp_sobota: TCurrencyField;
    Q1_Vh_nedela: TFloatField;
    Q1_Vp_nedela: TCurrencyField;
    Q1_Vh_sviatok: TFloatField;
    Q1_Vp_sviatok: TCurrencyField;
    Q1_Vh_noc: TFloatField;
    Q1_Vp_noc: TCurrencyField;
    Q1_Vh_skod: TFloatField;
    Q1_Vp_skod: TCurrencyField;
    Q1_N_priplat: TCurrencyField;
    Q1_O_zdravot: TCurrencyField;
    Q1_O_nemoc: TCurrencyField;
    Q1_O_dochod: TCurrencyField;
    Q1_O_fondzam: TCurrencyField;
    Q1_N_poist: TCurrencyField;
    Q1_Dopravne: TCurrencyField;
    Q1_Pouz_auto: TCurrencyField;
    Q1_Nc_minimum: TCurrencyField;
    Q1_Nc_deti: TCurrencyField;
    Q1_Nc_ine: TCurrencyField;
    Q1_Nc_spolu: TCurrencyField;
    Q1_Dan_vyrovnana: TSmallintField;
    Q1_D_ciastzd: TCurrencyField;
    Q1_D_zdanmzda: TCurrencyField;
    Q1_D_preddavok: TCurrencyField;
    Q1_D_dan: TCurrencyField;
    Q1_N_netto: TCurrencyField;
    Q1_Ne_zaloha: TCurrencyField;
    Q1_Ne_pozicky: TCurrencyField;
    Q1_Ne_odborar: TCurrencyField;
    Q1_Ne_poistovna: TCurrencyField;
    Q1_Ne_exekucia: TCurrencyField;
    Q1_Ne_spolu: TCurrencyField;
    Q1_Spor_plat: TSmallintField;
    Q1_Sporenie: TCurrencyField;
    Q1_Vyplata: TCurrencyField;
    Q1_V_priemer1: TCurrencyField;
    Q1_V_priemer2: TCurrencyField;
    Q1_V_pn: TSmallintField;
    Q1_N_sviatok: TCurrencyField;
    Q1_N_pn1: TCurrencyField;
    Q1_N_pn2: TCurrencyField;
    Q1_N_ocr: TCurrencyField;
    Q1_N_zaklad_poist: TCurrencyField;
    Q1_KZP: TSmallintField;
    Q1_ZPS: TBooleanField;
    Q1_F_doba: TFloatField;
    Q1_F_pn_dni: TSmallintField;
    Q1_F_pn1: TSmallintField;
    Q1_F_pn2: TSmallintField;
    Q1_F_ocr: TSmallintField;
    Q1_F_uraz: TSmallintField;
    Q1_F_nemmax: TCurrencyField;
    Q1_F_zdravot: TFloatField;
    Q1_F_nemoc: TFloatField;
    Q1_F_dochod: TFloatField;
    Q1_F_fondz: TFloatField;
    Q1_Fz_zdravot: TFloatField;
    Q1_Fz_nemoc: TFloatField;
    Q1_Fz_dochod: TFloatField;
    Q1_Fz_fondz: TFloatField;
    Q1_F_poistmax: TCurrencyField;
    Q1_F_min_mzda: TCurrencyField;
    Q1_F_nd_pocita: TSmallintField;
    Q1_U_zdrav: TSmallintField;
    Q1_U_nemoc: TSmallintField;
    Q1_U_dochod: TSmallintField;
    Q1_U_fondzam: TSmallintField;
    Q1_U_zdrav1: TSmallintField;
    Q1_U_nemoc1: TSmallintField;
    Q1_U_dochod1: TSmallintField;
    Q1_U_fondzam1: TSmallintField;
    Q1_U_zdrav2: TSmallintField;
    Q1_U_nemoc2: TSmallintField;
    Q1_U_dochod2: TSmallintField;
    Q1_U_fondzam2: TSmallintField;
    Q1_F_dan_sadzba1: TFloatField;
    Q1_F_dan_maximum1: TCurrencyField;
    Q1_CALC_FIRMA: TStringField;
    QRDBText64: TQRDBText;
    Q1_CALC_STREDISKO: TStringField;
    QRDBText65: TQRDBText;
    Q1_sid: TSmallintField;
    Q1_V_den: TFloatField;
    Q1_born_numb: TStringField;
    QRDBText67: TQRDBText;
    Q1_CALC_OS_CISLO: TStringField;
    Q1_CALC_RODNE_CISLO: TStringField;
    QRDBText68: TQRDBText;
    QRShape1: TQRShape;
    QRShape6: TQRShape;
    QRSuma3: TQRLabel;
    QRShapeEuro4: TQRShape;
    QRShapeEuro5: TQRShape;
    QRLabel7: TQRLabel;
    Q1_N_socfond: TCurrencyField;
    Q1_D_ciastzd2: TCurrencyField;
    Q1_D_zdanmzda2: TCurrencyField;
    Q1_D_vyrovnanie: TCurrencyField;
    QRLabel79: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel96: TQRLabel;
    QRDBText79: TQRDBText;
    QRDBText80: TQRDBText;
    QRDBText81: TQRDBText;
    Q1_N_zaklad_zp: TCurrencyField;
    Q1_N_zaklad_dp: TCurrencyField;
    Q1_N_zaklad_np: TCurrencyField;
    Q1_N_zaklad_fz: TCurrencyField;
    Q1_N_clenovia_organov: TCurrencyField;
    Q1_Ne_stravne: TCurrencyField;
    QRLabel106: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel107: TQRLabel;
    QRDBText25: TQRDBText;
    Q1_N_jednoraz1: TCurrencyField;
    Q1_N_jednoraz2: TCurrencyField;
    Q1_N_odstupne: TCurrencyField;
    Q1_N_pohotovost: TCurrencyField;
    QRLabel119: TQRLabel;
    QRDBText85: TQRDBText;
    Q1_D_ciastzd1: TCurrencyField;
    Q1_D_zdanmzda1: TCurrencyField;
    Q1_D_preddavok1: TCurrencyField;
    Q1_D_ciastzd3: TCurrencyField;
    Q1_D_zdanmzda3: TCurrencyField;
    Q1_D_preddavok3: TCurrencyField;
    QRLabel121: TQRLabel;
    QRDBText86: TQRDBText;
    QRLabel122: TQRLabel;
    QRDBText88: TQRDBText;
    Q2_: TQuery;
    DS1: TDataSource;
    Q1_code_emp: TIntegerField;
    Q1_CALC_DOVOLENKA: TStringField;
    Q2_holiday_cerpane: TFloatField;
    Q1_holiday_spolu: TFloatField;
    Q1_Vh_nahrada: TFloatField;
    Q1_N_nahrada: TCurrencyField;
    QRLabel124: TQRLabel;
    QRDBText89: TQRDBText;
    QRLabel127: TQRLabel;
    QRDBText91: TQRDBText;
    Q1_Zvys_ostatne: TCurrencyField;
    Q1_Vh_priplat1: TFloatField;
    Q1_Vh_priplat2: TFloatField;
    Q1_Vh_priplat3: TFloatField;
    Q1_Vh_priplat4: TFloatField;
    Q1_Vh_priplat5: TFloatField;
    Q1_Vp_priplat1: TCurrencyField;
    Q1_Vp_priplat2: TCurrencyField;
    Q1_Vp_priplat3: TCurrencyField;
    Q1_Vp_priplat4: TCurrencyField;
    Q1_Vp_priplat5: TCurrencyField;
    Q1_V_ocr1: TFloatField;
    Q1_V_ocr2: TFloatField;
    Q1_V_ocr12: TFloatField;
    Q1_N_ocr1: TCurrencyField;
    Q1_N_ocr2: TCurrencyField;
    Q1_N_pn: TCurrencyField;
    Q1_Nd_rodic: TCurrencyField;
    Q1_N_ddp: TCurrencyField;
    QRLabel27: TQRLabel;
    QRDBText114: TQRDBText;
    Q1_Vh_nemohol: TFloatField;
    Q1_N_nemohol: TCurrencyField;
    Q1_Cista_denna_mzda: TCurrencyField;
    Q1_CALC_CENA_PRACE: TCurrencyField;
    Q1_Fz_garfond: TFloatField;
    Q1_CALC_TEXT_DOPLATKY: TStringField;
    Q1_Nz_ddp: TCurrencyField;
    QRLabel31: TQRLabel;
    QRDBText118: TQRDBText;
    QRDBText119: TQRDBText;
    Q1_O_invalid: TCurrencyField;
    Q1_N_zaklad_ip: TCurrencyField;
    Q1_F_invalid: TFloatField;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText34: TQRDBText;
    Q1_N_nahrada_pn: TCurrencyField;
    Q1_D_bonus_cerpany: TCurrencyField;
    Q1_N_mimo_poistne: TCurrencyField;
    Q1_V_nepl_volno: TSmallintField;
    Q1_V_nepoisteny: TSmallintField;
    QRLabel23: TQRLabel;
    QRDBText77: TQRDBText;
    Q1_CALC_OCR: TCurrencyField;
    Q1_Oz_zdravot: TCurrencyField;
    Q1_Oz_nemoc: TCurrencyField;
    Q1_Oz_dochod: TCurrencyField;
    Q1_Oz_fondzam: TCurrencyField;
    Q1_Oz_invalid: TCurrencyField;
    Q1_Oz_uraz: TCurrencyField;
    Q1_Oz_rezerva: TCurrencyField;
    Q1_Oz_garancne: TCurrencyField;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel40: TQRLabel;
    QRDBText83: TQRDBText;
    Q1_N_ukolova: TCurrencyField;
    Q1_n_zakladna: TCurrencyField;
    QRDBText30: TQRDBText;
    QRLabel25: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText112: TQRDBText;
    QRDBText117: TQRDBText;
    Q1_code_numb: TIntegerField;
    QRLabel43: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    Q1_N_prijem_zp: TCurrencyField;
    QRDBText5: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText78: TQRDBText;
    QRDBText107: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel50: TQRLabel;
    QRDBText109: TQRDBText;
    QRDBText111: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText120: TQRDBText;
    QRDBText121: TQRDBText;
    QRDBText122: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText116: TQRDBText;
    QRShape5: TQRShape;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRSuma4: TQRLabel;
    QRLabel14: TQRLabel;
    Q1_CALC_Fz_dochod: TFloatField;
    Q1_CALC_Fz_sds: TFloatField;
    Q1_CALC_Oz_sds: TCurrencyField;
    Q1_CALC_Oz_dochod: TCurrencyField;
    Q1_CALC_N_mzda_a_nahrady: TCurrencyField;
    Q1_U_dopravne_mimoriadne: TBooleanField;
    Q1_CALC_Oz_zdravot: TCurrencyField;
    Q1_U_sds: TSmallintField;
    QRLabel13: TQRLabel;
    QRDBText33: TQRDBText;
    Q1_Vyrovnanie_zp: TCurrencyField;
    QRShapeEuro2: TQRShape;
    QRLabelEuroSuma: TQRLabel;
    QRShapeEuro1: TQRShape;
    QRDBTextEuro1: TQRDBText;
    QRDBTextEuro2: TQRDBText;
    QRDBTextEuro3: TQRDBText;
    QRDBTextEuro4: TQRDBText;
    Q1_EUR_SPORENIE: TFloatField;
    Q1_EUR_VYPLATA: TFloatField;
    Q1_EUR_N_BRUTTO: TFloatField;
    Q1_EUR_N_NETTO: TFloatField;
    QRShapeEuro3: TQRShape;
    QRLabelEuroKonv: TQRLabel;
    Q1_mail: TStringField;
    Q1_N_poist3: TCurrencyField;
    QRLabel9: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText43: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText45: TQRDBText;
    Q1_Rezerva2: TCurrencyField;
    Q1_Typzec: TSmallintField;
    QRDBText125: TQRDBText;
    Q1_CALC_Label_Odmeny: TStringField;
    procedure Q1_CalcFields(DataSet: TDataSet);
    procedure ReportVP2005BBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure Q1_AfterOpen(DataSet: TDataSet);
  private
    first_preview : boolean;
  public
    procedure ShowReport;

  end;

var
  ReportVP2005B: TReportVP2005B;

procedure RunReportVP2005B(const MyReportParam: TMyReportParam);

implementation

uses VP2005A, Dm_vypl;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportVP2005B.ShowReport;
var tl2na1: boolean;
begin
  first_preview:= true;
  QRLAB_doplatky.Caption := MyTextDoplatky;
  tl2na1:=PARAMETRE[12].Hodnota=1;
  DetailBand1.ForceNewPage:=not tl2na1;
  if (X.AktObdobie >= Zakon_Euro_Dual_Od) and
     (X.AktObdobie <= Zakon_Euro_Dual_Do) then
  begin
   QRDBTextEuro1.Width:=52;
   QRDBTextEuro2.Width:=52;
   QRDBTextEuro3.Width:=52;
   QRDBTextEuro4.Width:=52;
   QRLabelEuroKonv.Caption := KonvKurzEuroTxt;
   if X.AktObdobie >= ZAKON_2009_01 then
   QRLabelEuroSuma.Caption := 'Suma Sk'
   else
   QRLabelEuroSuma.Caption := 'Suma EUR';
   QRShapeEuro1.Width:=60;
   QRShapeEuro2.Width:=60;
   QRShapeEuro3.Width:=260;
   QRShapeEuro4.Height:=340;
   QRShapeEuro5.Height:=340;
  end
  else begin
   QRDBTextEuro1.Width:=0;
   QRDBTextEuro2.Width:=0;
   QRDBTextEuro3.Width:=0;
   QRDBTextEuro4.Width:=0;
   QRLabelEuroKonv.Caption := '';
   QRLabelEuroSuma.Caption := '';
   QRShapeEuro1.Width:=0;
   QRShapeEuro2.Width:=0;
   QRShapeEuro3.Width:=0;
   QRShapeEuro4.Height:=357;
   QRShapeEuro5.Height:=357;
  end;
  Q1_.Close;
  Q1_.ParamByName('P1').AsInteger := X.Code_emp1;
  Q1_.ParamByName('P2').AsInteger := X.Code_emp2;
  Q1_.ParamByName('P3').AsInteger := X.AktObdobie;
  Q1_.ParamByName('P4').AsInteger := X.AktMinSid;
  Q1_.ParamByName('P5').AsInteger := X.AktMaxSid;
  Q1_.Open;
  if X.Bullzip then begin
      VP_To_Email(TQuickRep(ReportVP2005B), Q1_, X);
  end else
    ReportVP2005B.Preview;
  Q1_.Close;
end;

procedure TReportVP2005B.Q1_CalcFields(DataSet: TDataSet);
  var Z,S,V, OZ_SP : double;
begin with DM, DMV do begin
  OZ_SP := 0;

  if Q1_N_Jednoraz1.Value > 0 then begin
   if QVYPNP_.Active then QVYPNP_.Close;
   QVYPNP_.ParamByName('P1').AsInteger := Q1_Code_emp.Value;
   QVYPNP_.ParamByName('P2').AsInteger := Q1_V_obdobie.Value;
   QVYPNP_.Open;
   OZ_SP := QVYPNP_OZ_SPOLU.Value;
   QVYPNP_.Close;
  end;

  Q1_CALC_FIRMA.Text := 'FIRMA: '+X.AktFirmaStr;
  Q1_CALC_STREDISKO.Text := 'Stredisko: '+Q1_SID.AsString;

  Q1_CALC_TMP.Text:=Trim(Q1_Title.Value);
  if Q1_CALC_TMP.Text<>'' then
    Q1_CALC_TMP.Text:=Q1_CALC_TMP.Text+' ';
  Q1_CALC_TMP.Text:=
    Q1_CALC_TMP.Text+
    Trim(Q1_Name.Value)+' '+
    Trim(Q1_Surname.Value);

  Q1_CALC_OS_CISLO.Text:=
   'Osob.èíslo: '+Trim(Q1_Code_numb.AsString);
  Q1_CALC_RODNE_CISLO.Text:=
    'Rodné è.: '+Trim(Q1_Born_numb.AsString);

 Q1_CALC_OBDOBIE.Text:=
   'POTVRDENIE O PRÍJMOCH A ZRÁŽKACH ZA OBDOBIE '+
   Mesiac(Q1_V_Mesiac.Value,true)+' '+Q1_V_rok.AsString;

 Q1_CALC_ZRAZKY.Value:=
   Q1_Ne_Stravne.Value +
   Q1_Ne_Odborar.Value +
   Q1_Ne_Poistovna.Value +
   Q1_Ne_Pozicky.Value +
   Q1_Ne_Exekucia.Value;

 Q1_CALC_DOVOLENKA.Value:=Q1_holiday_spolu.AsString+' / ';
 try
   Q2_.Close;
   Q2_.Open;
   Q1_CALC_DOVOLENKA.Value:=
     Q1_CALC_DOVOLENKA.Value+Q2_holiday_cerpane.AsString;
   Q2_.Close;
 except end;
 if Q1_V_obdobie.Value < Zakon_2004_01 then
 begin
 Q1_CALC_Cena_Prace.Value := Q1_N_Brutto.Value;
 if (Q1_U_zdrav.Value in PoiPlatiZam) then begin
   Z := Q1_N_Zaklad_ZP.Value;
   S := Q1_Fz_zdravot.Value;
   V := ZAOKRUHLI(S/100*Z,TSET_F_ZAODVOD.Value,TSET_F_SMODVOD.Value);
   Q1_CALC_Cena_Prace.Value :=    Q1_CALC_Cena_Prace.Value + V;
 end;
 if (Q1_U_nemoc.Value in PoiPlatiZam) then begin
   Z := Q1_N_Zaklad_NP.Value;
   S := Q1_Fz_nemoc.Value;
   V := ZAOKRUHLI(S/100*Z,TSET_F_ZAODVOD.Value,TSET_F_SMODVOD.Value);
   Q1_CALC_Cena_Prace.Value :=    Q1_CALC_Cena_Prace.Value + V;
 end;
 if (Q1_U_dochod.Value in PoiPlatiZam) then begin
   Z := Q1_N_Zaklad_DP.Value;
   S := Q1_Fz_dochod.Value;
   V := ZAOKRUHLI(S/100*Z,TSET_F_ZAODVOD.Value,TSET_F_SMODVOD.Value);
   Q1_CALC_Cena_Prace.Value :=    Q1_CALC_Cena_Prace.Value + V;
 end;
 if (Q1_U_fondzam.Value in PoiPlatiZam) then begin
   Z := Q1_N_Zaklad_FZ.Value;
   S := Q1_Fz_fondz.Value+Q1_Fz_garfond.Value;
   V := ZAOKRUHLI(S/100*Z,TSET_F_ZAODVOD.Value,TSET_F_SMODVOD.Value);
   Q1_CALC_Cena_Prace.Value :=    Q1_CALC_Cena_Prace.Value + V;
 end;
 end else if Q1_V_obdobie.Value < Zakon_2005_01 then
 begin
   Q1_CALC_Cena_Prace.Value :=
     Q1_N_Brutto.Value + Q1_Oz_nemoc.Value + Q1_oz_dochod.Value +
     Q1_Oz_invalid.Value + Q1_Oz_fondzam.Value + Q1_Oz_uraz.Value +
     Q1_Oz_rezerva.Value + Q1_Oz_garancne.Value;
   if (Q1_U_zdrav.Value in PoiPlatiZam) then begin
     Z := Q1_N_Zaklad_ZP.Value;
     S := Q1_Fz_zdravot.Value;
     V := ZAOKRUHLI(S/100*Z,TSET_F_ZAODVOD.Value,TSET_F_SMODVOD.Value);
     Q1_CALC_Cena_Prace.Value :=    Q1_CALC_Cena_Prace.Value + V;
   end;
 end else if Q1_V_obdobie.Value >= Zakon_2005_01 then
 begin
   Q1_CALC_Fz_sds.Value := 0;
   Q1_CALC_Oz_sds.Value := 0;
   if Q1_U_sds.Value = 1 then begin
     if Q1_V_Obdobie.Value < ZAKON_2012_01
       then Q1_CALC_Fz_sds.Value := 9
       else Q1_CALC_Fz_sds.Value := PARAMETRE[39].HODNOTA;
     if Q1_V_Obdobie.Value >=ZAKON_2012_01 then
       Q1_CALC_Oz_sds.Value := ZAOKRUHLI(
         (Q1_Oz_dochod.Value+Q1_O_dochod.Value)/(Q1_Fz_dochod.Value+Q1_F_dochod.Value)*Q1_CALC_Fz_sds.Value
         ,-2,1)
     else if Q1_V_Obdobie.Value >=ZAKON_2009_01 then
       Q1_CALC_Oz_sds.Value := ZAOKRUHLI(
         (Q1_Oz_dochod.Value+Q1_O_dochod.Value)/(Q1_Fz_dochod.Value+Q1_F_dochod.Value)*Q1_CALC_Fz_sds.Value
         ,-2,1)
     else
       Q1_CALC_Oz_sds.Value := ZAOKRUHLI(Q1_Oz_dochod.Value/14*9,0,1);
   end;
   Q1_CALC_Fz_dochod.Value := Q1_Fz_dochod.Value{-Q1_CALC_Fz_sds.Value};
   Q1_CALC_Oz_dochod.Value := Q1_Oz_dochod.Value{-Q1_CALC_Oz_sds.Value};
   if Q1_V_Obdobie.Value >= ZAKON_2009_01 then
   Q1_CALC_Oz_zdravot.Value := Q1_Oz_zdravot.Value
   else
   Q1_CALC_Oz_zdravot.Value := ZAOKRUHLI(Q1_Oz_zdravot.Value,0,0);

   Q1_CALC_N_mzda_a_nahrady.Value :=
      Q1_N_mzda.Value +
      Q1_N_nahrada_pn.Value+
      Q1_N_nahrada.Value+
      Q1_N_nemohol.Value+
      Q1_N_holiday.Value+
      Q1_N_sviatok.Value+
      Q1_N_pohotovost.Value;

   Q1_CALC_Cena_Prace.Value :=
      Q1_N_Brutto.Value +
      Q1_CALC_Oz_zdravot.Value +
      Q1_Oz_nemoc.Value +
      Q1_CALC_oz_dochod.Value +
      Q1_Oz_invalid.Value +
      Q1_Oz_fondzam.Value +
      Q1_Oz_garancne.Value +
      Q1_Oz_uraz.Value +
      Q1_Oz_rezerva.Value +
      OZ_SP { +
      Q1_Calc_Oz_sds.Value};
 end;
 Q1_CALC_OCR.Value :=
   Q1_N_OCR1.Value + Q1_N_OCR2.Value;
 if Q1_V_Obdobie.Value >= ZAKON_2009_01 then begin { Dualne ocenovanie od 1.1.2009 }
   Q1_EUR_N_BRUTTO.Value := KonverziaEUR_SKK(Q1_N_BRUTTO.Value);
   Q1_EUR_N_NETTO.Value := KonverziaEUR_SKK(Q1_N_NETTO.Value);
   Q1_EUR_SPORENIE.Value := KonverziaEUR_SKK(Q1_SPORENIE.Value);
   Q1_EUR_VYPLATA.Value := KonverziaEUR_SKK(Q1_VYPLATA.Value);
 end else begin { Dualne ocenovanie do 31.12.2008 }
   Q1_EUR_N_BRUTTO.Value := KonverziaSKK_EUR(Q1_N_BRUTTO.Value);
   Q1_EUR_N_NETTO.Value := KonverziaSKK_EUR(Q1_N_NETTO.Value);
   Q1_EUR_SPORENIE.Value := KonverziaSKK_EUR(Q1_SPORENIE.Value);
   Q1_EUR_VYPLATA.Value := KonverziaSKK_EUR(Q1_VYPLATA.Value);
 end;

  if (Q1_V_Obdobie.Value > ZAKON_2013_01) and (Q1_Typzec.Value in SetOf_Typzec_DH) then
    Q1_CALC_Label_odmeny.Value := 'Dohody mimo pr.pomer'
  else
    Q1_CALC_Label_odmeny.Value := 'Odmeny';

end;end;

procedure RunReportVP2005B(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportVP2005B:=TReportVP2005B.Create(Application);
    if X.DisableShape then QRDisableShape(ReportVP2005B);
    if X.DisableLabel then QRDisableLabel(ReportVP2005B);
    Screen.Cursor:=crDefault;
    ReportVP2005B.ShowReport;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportVP2005B.Free;
  end;
end;









procedure TReportVP2005B.ReportVP2005BBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,8);
end;


procedure TReportVP2005B.Q1_AfterOpen(DataSet: TDataSet);
begin
   if Q1_V_Obdobie.Value >= ZAKON_2009_01 then begin
     Q1_EUR_N_BRUTTO.DisplayFormat:='0';
     Q1_EUR_N_NETTO.DisplayFormat:='0';
     Q1_EUR_SPORENIE.DisplayFormat:='0';
     Q1_EUR_VYPLATA.DisplayFormat:='0';
     QRSuma1.Caption:='Suma EUR';
     QRSuma2.Caption:='Suma EUR';
     QRSuma3.Caption:='Suma EUR';
     QRSuma4.Caption:='Suma EUR';
   end else begin
     Q1_EUR_N_BRUTTO.DisplayFormat:='0.00';
     Q1_EUR_N_NETTO.DisplayFormat:='0.00';
     Q1_EUR_SPORENIE.DisplayFormat:='0.00';
     Q1_EUR_VYPLATA.DisplayFormat:='0.00';
     QRSuma1.Caption:='Suma Sk';
     QRSuma2.Caption:='Suma Sk';
     QRSuma3.Caption:='Suma Sk';
     QRSuma4.Caption:='Suma Sk';
   end;
end;







end.
