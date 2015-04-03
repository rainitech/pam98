unit REXVP2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick, Dm_main;

type
  TReportVP2 = class(TQuickRep)
    Q1_: TQuery;
    Q1_CALC_OBDOBIE: TStringField;
    Q1_CALC_TMP: TStringField;
    Q1_CALC_ZRAZKY: TCurrencyField;
    DetailBand1: TQRBand;
    QRShape15: TQRShape;
    QRShape5: TQRShape;
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
    QRLabel37: TQRLabel;
    QRLabel42: TQRLabel;
    QRLAB_doplatky: TQRLabel;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
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
    QRLabel48: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel65: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel66: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel69: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel50: TQRLabel;
    QRDBText39: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel71: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel72: TQRLabel;
    QRDBText57: TQRDBText;
    QRLabel73: TQRLabel;
    QRDBText58: TQRDBText;
    QRLabel74: TQRLabel;
    QRDBText59: TQRDBText;
    QRLabel75: TQRLabel;
    QRDBText60: TQRDBText;
    QRLabel77: TQRLabel;
    QRDBText61: TQRDBText;
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
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText27: TQRDBText;
    Q1_N_socfond: TCurrencyField;
    Q1_D_ciastzd2: TCurrencyField;
    Q1_D_zdanmzda2: TCurrencyField;
    Q1_D_vyrovnanie: TCurrencyField;
    QRLabel79: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel59: TQRLabel;
    QRLabel81: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel82: TQRLabel;
    QRDBText50: TQRDBText;
    QRLabel83: TQRLabel;
    QRDBText53: TQRDBText;
    QRLabel84: TQRLabel;
    QRDBText62: TQRDBText;
    QRLabel85: TQRLabel;
    QRDBText63: TQRDBText;
    QRShape17: TQRShape;
    QRLabel86: TQRLabel;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRDBText71: TQRDBText;
    QRDBText72: TQRDBText;
    QRDBText73: TQRDBText;
    QRDBText74: TQRDBText;
    QRDBText75: TQRDBText;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRDBText76: TQRDBText;
    QRShape8: TQRShape;
    QRLabel96: TQRLabel;
    QRDBText78: TQRDBText;
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
    QRLabel108: TQRLabel;
    QRDBText41: TQRDBText;
    QRLabel109: TQRLabel;
    QRDBText43: TQRDBText;
    QRLabel111: TQRLabel;
    QRDBText66: TQRDBText;
    Q1_N_jednoraz1: TCurrencyField;
    Q1_N_jednoraz2: TCurrencyField;
    QRLabel117: TQRLabel;
    QRDBText84: TQRDBText;
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
    QRLabel123: TQRLabel;
    QRDBText87: TQRDBText;
    QRLabel124: TQRLabel;
    QRDBText89: TQRDBText;
    QRLabel126: TQRLabel;
    QRLabel127: TQRLabel;
    QRDBText90: TQRDBText;
    QRDBText91: TQRDBText;
    Q1_Zvys_ostatne: TCurrencyField;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText92: TQRDBText;
    QRDBText93: TQRDBText;
    QRDBText94: TQRDBText;
    QRDBText95: TQRDBText;
    QRDBText96: TQRDBText;
    QRDBText97: TQRDBText;
    QRDBText98: TQRDBText;
    QRDBText99: TQRDBText;
    QRDBText100: TQRDBText;
    QRDBText101: TQRDBText;
    QRDBText102: TQRDBText;
    QRDBText103: TQRDBText;
    QRDBText104: TQRDBText;
    QRDBText105: TQRDBText;
    QRDBText106: TQRDBText;
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
    QRDBText107: TQRDBText;
    Q1_V_ocr1: TFloatField;
    Q1_V_ocr2: TFloatField;
    Q1_V_ocr12: TFloatField;
    Q1_N_ocr1: TCurrencyField;
    Q1_N_ocr2: TCurrencyField;
    Q1_N_pn: TCurrencyField;
    QRLabel19: TQRLabel;
    QRDBText109: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText111: TQRDBText;
    Q1_Nd_rodic: TCurrencyField;
    QRLabel25: TQRLabel;
    QRDBText112: TQRDBText;
    Q1_N_ddp: TCurrencyField;
    QRDBText113: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText114: TQRDBText;
    Q1_Vh_nemohol: TFloatField;
    Q1_N_nemohol: TCurrencyField;
    QRLabel26: TQRLabel;
    QRDBText115: TQRDBText;
    Q1_Cista_denna_mzda: TCurrencyField;
    Q1_CALC_CENA_PRACE: TCurrencyField;
    QRLabel28: TQRLabel;
    QRDBText116: TQRDBText;
    Q1_Fz_garfond: TFloatField;
    Q1_CALC_TEXT_DOPLATKY: TStringField;
    QRLabel30: TQRLabel;
    QRDBText117: TQRDBText;
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
    QRLabel8: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText34: TQRDBText;
    Q1_N_nahrada_pn: TCurrencyField;
    Q1_D_bonus_cerpany: TCurrencyField;
    Q1_N_mimo_poistne: TCurrencyField;
    Q1_V_nepl_volno: TSmallintField;
    Q1_V_nepoisteny: TSmallintField;
    QRLabel16: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText77: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText82: TQRDBText;
    Q1_CALC_OCR: TCurrencyField;
    Q1_Oz_zdravot: TCurrencyField;
    Q1_Oz_nemoc: TCurrencyField;
    Q1_Oz_dochod: TCurrencyField;
    Q1_Oz_fondzam: TCurrencyField;
    Q1_Oz_invalid: TCurrencyField;
    Q1_Oz_uraz: TCurrencyField;
    Q1_Oz_rezerva: TCurrencyField;
    Q1_Oz_garancne: TCurrencyField;
    QRShape18: TQRShape;
    QRLabel40: TQRLabel;
    QRDBText83: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText108: TQRDBText;
    Q1_N_ukolova: TCurrencyField;
    Q1_n_zakladna: TCurrencyField;
    QRDBText30: TQRDBText;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel43: TQRLabel;
    Q1_code_numb: TIntegerField;
    procedure Q1_CalcFields(DataSet: TDataSet);
    procedure ReportVP2BeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    first_preview: boolean;
  public
    procedure ShowReport;

  end;

var
  ReportVP2: TReportVP2;

procedure RunReportVP2(const MyReportParam: TMyReportParam);

implementation

uses REXVP, REXVP2t;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportVP2.ShowReport;
var tl2na1: boolean;
begin
  first_preview := true;
  QRLAB_doplatky.Caption := MyTextDoplatky;
  tl2na1:=PARAMETRE[12].Hodnota=1;
  DetailBand1.ForceNewPage:=not tl2na1;
  Q1_.Close;
  Q1_.ParamByName('P1').AsInteger := X.Code_emp1;
  Q1_.ParamByName('P2').AsInteger := X.Code_emp2;
  Q1_.ParamByName('P3').AsInteger := X.AktObdobie;
  Q1_.ParamByName('P4').AsInteger := X.AktMinSid;
  Q1_.ParamByName('P5').AsInteger := X.AktMaxSid;
  Q1_.Open;
  ReportVP2.Preview;
  Q1_.Close;
end;

procedure TReportVP2.Q1_CalcFields(DataSet: TDataSet);
  var Z,S,V : double;
begin with DM do begin
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
   Q1_CALC_Cena_Prace.Value :=
     Q1_N_Brutto.Value + Q1_Oz_zdravot.Value + Q1_Oz_nemoc.Value + Q1_oz_dochod.Value +
     Q1_Oz_invalid.Value + Q1_Oz_fondzam.Value;
 end;
 Q1_CALC_OCR.Value :=
   Q1_N_OCR1.Value + Q1_N_OCR2.Value;
end;end;

procedure RunReportVP2(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportVP2:=TReportVP2.Create(Application);
    if X.DisableShape then QRDisableShape(ReportVP2);
    if X.DisableLabel then QRDisableLabel(ReportVP2);
    Screen.Cursor:=crDefault;
    ReportVP2.ShowReport;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportVP2.Free;
  end;
end;

































procedure TReportVP2.ReportVP2BeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,8);
end;

end.
