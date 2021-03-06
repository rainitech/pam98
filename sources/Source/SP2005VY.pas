unit SP2005VY;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportSP2005VY = class(TQuickRep)
    Q0_: TQuery;
    DS0: TDataSource;
    GroupFooterBand1: TQRBand;
    QRLabel14: TQRLabel;
    QRGroup1: TQRGroup;
    LP_NEMOC: TQRLabel;
    Q1_: TQuery;
    Q1_CALC_OBDOBIE: TStringField;
    Q1_CALC_FIRMA: TStringField;
    QRShape17: TQRShape;
    QRShape25: TQRShape;
    QRShape29: TQRShape;
    QRLabel43: TQRLabel;
    Q1_NAZOV: TStringField;
    Q1_ADR_ULICA: TStringField;
    Q1_ADR_MESTO: TStringField;
    Q1_ADR_PSC: TStringField;
    Q1_ICO: TStringField;
    Q1_PREDCISLO_U: TStringField;
    Q1_CISLO_U: TStringField;
    Q1_BANKA_U: TStringField;
    Q1_CALC_CISLO_UCTU: TStringField;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    Q1_FZ_DEN: TSmallintField;
    Q1_OKEC: TStringField;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel54: TQRLabel;
    DetailBand1: TQRBand;
    QR_Nadpis: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRShape9: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRShape33: TQRShape;
    QRShape36: TQRShape;
    QRShape38: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    Q0_Code_emp: TIntegerField;
    Q0_V_obdobie: TIntegerField;
    Q0_SID: TSmallintField;
    Q0_V_rok: TSmallintField;
    Q0_V_mesiac: TSmallintField;
    Q0_V_fmes: TSmallintField;
    Q0_V_den: TFloatField;
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
    Q0_U_zdrav: TSmallintField;
    Q0_U_nemoc: TSmallintField;
    Q0_U_dochod: TSmallintField;
    Q0_U_fondzam: TSmallintField;
    Q0_U_zdrav1: TSmallintField;
    Q0_U_nemoc1: TSmallintField;
    Q0_U_dochod1: TSmallintField;
    Q0_U_fondzam1: TSmallintField;
    Q0_U_zdrav2: TSmallintField;
    Q0_U_nemoc2: TSmallintField;
    Q0_U_dochod2: TSmallintField;
    Q0_U_fondzam2: TSmallintField;
    Q0_U_nezdc: TBooleanField;
    Q0_F_nadcas: TFloatField;
    Q0_F_sobota: TFloatField;
    Q0_F_nedela: TFloatField;
    Q0_F_sviatok: TFloatField;
    Q0_F_noc: TFloatField;
    Q0_F_skod: TFloatField;
    Q0_F_dan_sadzba1: TFloatField;
    Q0_F_dan_maximum1: TCurrencyField;
    Q0_Fixny_mv_plat: TBooleanField;
    Q0_F_poistne: TFloatField;
    Q0_F_typ_pripl: TSmallintField;
    Q0_F_typ_premii: TSmallintField;
    Q0_F_sadzba_premii: TFloatField;
    Q0_N_socfond: TCurrencyField;
    Q0_D_ciastzd2: TCurrencyField;
    Q0_D_zdanmzda2: TCurrencyField;
    Q0_D_vyrovnanie: TCurrencyField;
    Q0_N_zaklad_zp: TCurrencyField;
    Q0_N_zaklad_dp: TCurrencyField;
    Q0_N_zaklad_np: TCurrencyField;
    Q0_N_zaklad_fz: TCurrencyField;
    Q0_Verzia: TSmallintField;
    Q0_N_clenovia_organov: TCurrencyField;
    Q0_Ne_stravne: TCurrencyField;
    Q0_N_odstupne: TCurrencyField;
    Q0_N_pohotovost: TCurrencyField;
    Q0_D_ciastzd1: TCurrencyField;
    Q0_D_zdanmzda1: TCurrencyField;
    Q0_D_preddavok1: TCurrencyField;
    Q0_D_ciastzd3: TCurrencyField;
    Q0_D_zdanmzda3: TCurrencyField;
    Q0_D_preddavok3: TCurrencyField;
    Q0_N_jednoraz1: TCurrencyField;
    Q0_V_mesiace1: TSmallintField;
    Q0_V_maxobd1: TIntegerField;
    Q0_N_jednoraz2: TCurrencyField;
    Q0_V_mesiace2: TSmallintField;
    Q0_V_maxobd2: TIntegerField;
    Q0_F_firma_zps: TBooleanField;
    Q0_N_poist1: TCurrencyField;
    Q0_N_poist3: TCurrencyField;
    Q0_ZTP: TBooleanField;
    Q0_ZPS1: TBooleanField;
    Q0_Vh_nahrada: TFloatField;
    Q0_N_nahrada: TCurrencyField;
    Q0_Zvys_ostatne: TCurrencyField;
    Q0_Dopravne_mimoriadne: TCurrencyField;
    Q0_U_dopravne_mimoriadne: TBooleanField;
    Q0_Automatika: TBooleanField;
    Q0_F_typ_pripl2: TSmallintField;
    Q0_F_priplat1: TFloatField;
    Q0_F_priplat2: TFloatField;
    Q0_F_priplat3: TFloatField;
    Q0_F_priplat4: TFloatField;
    Q0_F_priplat5: TFloatField;
    Q0_Vh_priplat1: TFloatField;
    Q0_Vh_priplat2: TFloatField;
    Q0_Vh_priplat3: TFloatField;
    Q0_Vh_priplat4: TFloatField;
    Q0_Vh_priplat5: TFloatField;
    Q0_Vp_priplat1: TCurrencyField;
    Q0_Vp_priplat2: TCurrencyField;
    Q0_Vp_priplat3: TCurrencyField;
    Q0_Vp_priplat4: TCurrencyField;
    Q0_Vp_priplat5: TCurrencyField;
    Q0_V_ocr1: TFloatField;
    Q0_V_ocr2: TFloatField;
    Q0_V_ocr12: TFloatField;
    Q0_N_ocr1: TCurrencyField;
    Q0_N_ocr2: TCurrencyField;
    Q0_N_pn: TCurrencyField;
    Q0_U_sviatky: TBooleanField;
    Q0_V_materska: TFloatField;
    Q0_Nd_rodic: TCurrencyField;
    Q0_U_materska: TBooleanField;
    Q0_U_rodic: TBooleanField;
    Q0_N_ddp: TCurrencyField;
    Q0_Fz_garfond: TFloatField;
    Q0_F_typ_ulavy_sp: TSmallintField;
    Q0_F_typ_ulavy_fz: TSmallintField;
    Q0_PRHRMEZA: TCurrencyField;
    Q0_Vh_nemohol: TFloatField;
    Q0_N_nemohol: TCurrencyField;
    Q0_Dan_nerezident: TBooleanField;
    Q0_Cista_denna_mzda: TCurrencyField;
    Q0_N_oslobodeny: TCurrencyField;
    Q0_N_nadcas: TCurrencyField;
    Q0_Nd_rucne: TBooleanField;
    Q0_N_sadzba_ddp: TFloatField;
    Q0_Nz_ddp: TCurrencyField;
    Q0_Nz_sadzba_ddp: TFloatField;
    Q0_KDP: TSmallintField;
    Q0_N_ukolova: TCurrencyField;
    Q0_F_invalid: TFloatField;
    Q0_Fz_invalid: TFloatField;
    Q0_Fz_uraz: TFloatField;
    Q0_Fz_rezerva: TFloatField;
    Q0_N_zaklad_up: TCurrencyField;
    Q0_Oz_zdravot: TCurrencyField;
    Q0_Oz_nemoc: TCurrencyField;
    Q0_Oz_dochod: TCurrencyField;
    Q0_Oz_fondzam: TCurrencyField;
    Q0_O_invalid: TCurrencyField;
    Q0_Oz_invalid: TCurrencyField;
    Q0_Oz_uraz: TCurrencyField;
    Q0_Oz_rezerva: TCurrencyField;
    Q0_Oz_garancne: TCurrencyField;
    Q0_U_invalid: TSmallintField;
    Q0_U_uraz: TSmallintField;
    Q0_U_rezerva: TSmallintField;
    Q0_U_garancne: TSmallintField;
    Q0_N_zaklad_ip: TCurrencyField;
    Q0_N_zaklad_gp: TCurrencyField;
    Q0_N_zaklad_rf: TCurrencyField;
    Q0_Poc_nezaop_deti: TSmallintField;
    Q0_V_nahrada_pn1: TSmallintField;
    Q0_V_nahrada_pn2: TSmallintField;
    Q0_N_nahrada_pn: TCurrencyField;
    Q0_D_bonus_predpis: TCurrencyField;
    Q0_D_bonus_cerpany: TCurrencyField;
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    LO_NEMOC: TQRLabel;
    LZ_NEMOC: TQRLabel;
    LP_DOCHOD: TQRLabel;
    QRShape1: TQRShape;
    QRShape: TQRShape;
    QRShape6: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel51: TQRLabel;
    LO_dochod: TQRLabel;
    LZ_DOCHOD: TQRLabel;
    LP_INVALID: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    LO_INVALID: TQRLabel;
    LZ_INVALID: TQRLabel;
    LP_FONDZAM: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    LO_FONDZAM: TQRLabel;
    LZ_FONDZAM: TQRLabel;
    LP_URAZ: TQRLabel;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    LZ_URAZ: TQRLabel;
    LP_GARANCNE: TQRLabel;
    QRShape18: TQRShape;
    QRShape20: TQRShape;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    LZ_GARANCNE: TQRLabel;
    LP_REZERVA: TQRLabel;
    QRShape21: TQRShape;
    QRShape23: TQRShape;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    LZ_REZERVA: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel89: TQRLabel;
    ChildBand1: TQRChildBand;
    QRShape5: TQRShape;
    QRShape15: TQRShape;
    LP_SPOLU: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    LPZ_PN: TQRLabel;
    QRShape22: TQRShape;
    QRShape27: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    LVY_PN: TQRLabel;
    LPZ_OCR: TQRLabel;
    QRShape28: TQRShape;
    QRShape30: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    LVY_OCR: TQRLabel;
    LPZ_MATERSKA: TQRLabel;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    LVY_MATERSKA: TQRLabel;
    LPZ_VYROVDAV: TQRLabel;
    QRShape35: TQRShape;
    QRShape37: TQRShape;
    QRLabel42: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    LVY_VYROVDAV: TQRLabel;
    QRShape39: TQRShape;
    LD_SPOLU: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel22: TQRLabel;
    LPD_PN: TQRLabel;
    QRShape40: TQRShape;
    LPD_OCR: TQRLabel;
    QRShape41: TQRShape;
    QRLabel68: TQRLabel;
    LPD_MATERSKA: TQRLabel;
    QRShape42: TQRShape;
    QRLabel85: TQRLabel;
    LPD_VYROVDAV: TQRLabel;
    QRShape43: TQRShape;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    LPP_PN: TQRLabel;
    QRShape45: TQRShape;
    LPP_OCR: TQRLabel;
    QRShape46: TQRShape;
    QRLabel98: TQRLabel;
    LPP_MATERSKA: TQRLabel;
    QRShape47: TQRShape;
    QRLabel100: TQRLabel;
    LPP_VYROVDAV: TQRLabel;
    QRShape48: TQRShape;
    QRLabel102: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRShape49: TQRShape;
    LR_SPOLU: TQRLabel;
    QRLabel111: TQRLabel;
    Q1_ADR_CISLO: TStringField;
    Q1_ADR_TELEFON: TStringField;
    Q1_ADR_FAX: TStringField;
    Q1_ADR_EMAIL: TStringField;
    Q1_ICZ: TStringField;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QR_OBDOBIE: TQRLabel;
    QRShape19: TQRShape;
    QRShape24: TQRShape;
    Q1_NAZOV_BANKY: TStringField;
    QRLabel23: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRMemo1: TQRMemo;
    PageFooterBand1: TQRBand;
    QRShape26: TQRShape;
    QRShape34: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape44: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRLabel47: TQRLabel;
    QRShape52: TQRShape;
    QRLabel53: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel86: TQRLabel;
    QRShape53: TQRShape;
    QRLabel92: TQRLabel;
    QRShape54: TQRShape;
    QRLabel93: TQRLabel;
    QRLabel99: TQRLabel;
    Q1_DIC: TStringField;
    Q2_: TQuery;
    Q2_code_emp: TIntegerField;
    Q2_v_obdobie_vyp: TIntegerField;
    Q2_n_zaklad_np: TCurrencyField;
    Q2_n_zaklad_dp: TCurrencyField;
    Q2_n_zaklad_fz: TCurrencyField;
    Q2_n_zaklad_ip: TCurrencyField;
    Q2_n_zaklad_up: TCurrencyField;
    Q2_n_zaklad_rf: TCurrencyField;
    Q2_n_zaklad_gp: TCurrencyField;
    Q2_o_np: TCurrencyField;
    Q2_o_dp: TCurrencyField;
    Q2_o_fz: TCurrencyField;
    Q2_o_ip: TCurrencyField;
    Q2_oz_np: TCurrencyField;
    Q2_oz_dp: TCurrencyField;
    Q2_oz_fz: TCurrencyField;
    Q2_oz_ip: TCurrencyField;
    Q2_oz_up: TCurrencyField;
    Q2_oz_rf: TCurrencyField;
    Q2_oz_gp: TCurrencyField;
    Q2_sid: TSmallintField;
    Q0_Typzec: TSmallintField;
    Q0_PoSkonceni: TBooleanField;
    Q55_: TQuery;
    Q0_surname: TStringField;
    Q0_name: TStringField;
    Q0_title: TStringField;
    Q0_born_numb: TStringField;
    Q0_fz_uvazok: TStringField;
    Q0_fz_typzam: TStringField;
    SmallintField10: TSmallintField;
    Q55_code_emp: TIntegerField;
    Q55_u_dochod: TSmallintField;
    Q55_u_nemoc: TSmallintField;
    Q55_u_invalid: TSmallintField;
    Q55_u_fondzam: TSmallintField;
    Q55_u_uraz: TSmallintField;
    Q55_u_garancne: TSmallintField;
    Q55_u_rezerva: TSmallintField;
    Q55_sid: TSmallintField;
    procedure GroupFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Q1_AfterOpen(DataSet: TDataSet);
    procedure Q1_CalcFields(DataSet: TDataSet);
    procedure ReportSP2005VYBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    first_preview:boolean;
  public
    A:TMemo;
    procedure ShowReportStart;
    procedure ShowReportEnd;
    procedure SpracujStredisko;
    procedure SpracujStrediskoNP;
    procedure SpracujStrediskoPrihlBezPrijmu;
    procedure VypocitajOdvody(typ:string);
    procedure SetX(const MyReportParam:TMyReportParam);
  end;

type
  TMyOdvody = record
    p_nemoc    :double;
    o_nemoc    :double;
    z_nemoc    :double;
    p_dochod   :double;
    o_dochod   :double;
    z_dochod   :double;
    p_invalid  :double;
    o_invalid  :double;
    z_invalid  :double;
    p_fondzam  :double;
    o_fondzam  :double;
    z_fondzam  :double;
    p_uraz     :double;
    z_uraz     :double;
    p_garancne :double;
    z_garancne :double;
    p_rezerva  :double;
    z_rezerva  :double;
    pz_pn      :double;
    pd_pn      :double;
    pp_pn      :double;
    vy_pn      :double;
    pz_ocr     :double;
    pd_ocr     :double;
    pp_ocr     :double;
    vy_ocr     :double;
    pz_materska:double;
    pd_materska:double;
    pp_materska:double;
    vy_materska:double;
    pz_vyrovdav:double;
    pd_vyrovdav:double;
    pp_vyrovdav:double;
    vy_vyrovdav:double;
    p_spolu    :double;
    d_spolu    :double;
    r_spolu    :double;
    vyluka     :double;
  end;
var
  ReportSP2005VY: TReportSP2005VY;
  MyOdvody:array[0..99] of TMyOdvody;
  MyOdvodyNP:array[0..99] of TMyOdvody;

procedure RunReportSP2005VY(const MyReportParam: TMyReportParam);
procedure RunReportSP2005VY_PDF(const MyReportParam: TMyReportParam);

implementation

uses Dm_main;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportSP2005VY.SetX(const MyReportParam:TMyReportParam);
begin
  X:=MyReportParam;
end;

procedure InitMyPremenne;
var i:integer;
begin
  for i:=0 to 99 do
  with MyOdvody[i] do
  begin
    p_nemoc     :=0;
    o_nemoc     :=0;
    z_nemoc     :=0;
    p_dochod    :=0;
    o_dochod    :=0;
    z_dochod    :=0;
    p_invalid   :=0;
    o_invalid   :=0;
    z_invalid   :=0;
    p_fondzam   :=0;
    o_fondzam   :=0;
    z_fondzam   :=0;
    p_uraz      :=0;
    z_uraz      :=0;
    p_garancne  :=0;
    z_garancne  :=0;
    p_rezerva   :=0;
    z_rezerva   :=0;
    pz_pn       :=0;
    pd_pn       :=0;
    pp_pn       :=0;
    vy_pn       :=0;
    pz_ocr      :=0;
    pd_ocr      :=0;
    pp_ocr      :=0;
    vy_ocr      :=0;
    pz_materska :=0;
    pd_materska :=0;
    pp_materska :=0;
    vy_materska :=0;
    pz_vyrovdav :=0;
    pd_vyrovdav :=0;
    pp_vyrovdav :=0;
    vy_vyrovdav :=0;
    p_spolu     :=0;
    d_spolu     :=0;
    r_spolu     :=0;
    vyluka      :=0;
  end;
  for i:=0 to 99 do
  with MyOdvodyNP[i] do
  begin
    p_nemoc     :=0;
    o_nemoc     :=0;
    z_nemoc     :=0;
    p_dochod    :=0;
    o_dochod    :=0;
    z_dochod    :=0;
    p_invalid   :=0;
    o_invalid   :=0;
    z_invalid   :=0;
    p_fondzam   :=0;
    o_fondzam   :=0;
    z_fondzam   :=0;
    p_uraz      :=0;
    z_uraz      :=0;
    p_garancne  :=0;
    z_garancne  :=0;
    p_rezerva   :=0;
    z_rezerva   :=0;
    pz_pn       :=0;
    pd_pn       :=0;
    pp_pn       :=0;
    vy_pn       :=0;
    pz_ocr      :=0;
    pd_ocr      :=0;
    pp_ocr      :=0;
    vy_ocr      :=0;
    pz_materska :=0;
    pd_materska :=0;
    pp_materska :=0;
    vy_materska :=0;
    pz_vyrovdav :=0;
    pd_vyrovdav :=0;
    pp_vyrovdav :=0;
    vy_vyrovdav :=0;
    p_spolu     :=0;
    d_spolu     :=0;
    r_spolu     :=0;
    vyluka      :=0;
  end;
end;

procedure TReportSP2005VY.ShowReportStart;
begin
  first_preview:=true;
  QR_Obdobie.Caption := IntToStr(X.AktObdobie mod 100)+' / '
                       +IntToStr(X.AktObdobie div 100);
  if false {X.Typ='SPV'} then begin
    QR_Nadpis.Caption := 'Mesa�n� v�kaz poistn�ho a d�vok NP';
    QR_Nadpis.Left := 120;
  end
  else begin
    ChildBand1.Enabled := False;
  end;
  try
  Q1_.Close;
  Q1_.Open;
  except MyError(SMyRepExecError);
  end;
end;

procedure TReportSP2005VY.ShowReportEnd;
begin
  Q1_.Close;
end;

procedure TReportSP2005VY.GroupFooterBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with MyOdvody[0] do begin
    LP_nemoc.Caption := Format('%10.0n',[p_nemoc]);
    LP_dochod.Caption := Format('%10.0n',[p_dochod]);
    LP_invalid.Caption := Format('%10.0n',[p_invalid]);
    LP_fondzam.Caption := Format('%10.0n',[p_fondzam]);
    LP_uraz.Caption := Format('%10.0n',[p_uraz]);
    LP_garancne.Caption := Format('%10.0n',[p_garancne]);
    LP_rezerva.Caption := Format('%10.0n',[p_rezerva]);
    {--}
    LO_nemoc.Caption := Format('%10.0n',[O_nemoc]);
    LO_dochod.Caption := Format('%10.0n',[O_dochod]);
    LO_invalid.Caption := Format('%10.0n',[O_invalid]);
    LO_fondzam.Caption := Format('%10.0n',[O_fondzam]);
    {--}
    LZ_nemoc.Caption := Format('%10.0n',[Z_nemoc]);
    LZ_dochod.Caption := Format('%10.0n',[Z_dochod]);
    LZ_invalid.Caption := Format('%10.0n',[Z_invalid]);
    LZ_fondzam.Caption := Format('%10.0n',[Z_fondzam]);
    LZ_uraz.Caption := Format('%10.0n',[Z_uraz]);
    LZ_garancne.Caption := Format('%10.0n',[Z_garancne]);
    LZ_rezerva.Caption := Format('%10.0n',[Z_rezerva]);
    {--}
    LP_spolu.Caption := Format('%10.0n',[p_spolu]);
    {--}
    LPZ_pn.Caption := Format('%10.0n',[pz_pn]);
    LPZ_ocr.Caption := Format('%10.0n',[pz_ocr]);
    LPZ_materska.Caption := Format('%10.0n',[pz_materska]);
    LPZ_vyrovdav.Caption := Format('%10.0n',[pz_vyrovdav]);
    LPP_pn.Caption := Format('%10.0n',[PP_pn]);
    LPP_ocr.Caption := Format('%10.0n',[PP_ocr]);
    LPP_materska.Caption := Format('%10.0n',[PP_materska]);
    LPP_vyrovdav.Caption := Format('%10.0n',[PP_vyrovdav]);
    LPD_pn.Caption := Format('%10.0n',[PD_pn]);
    LPD_ocr.Caption := Format('%10.0n',[PD_ocr]);
    LPD_materska.Caption := Format('%10.0n',[PD_materska]);
    LPD_vyrovdav.Caption := Format('%10.0n',[PD_vyrovdav]);
    LVY_pn.Caption := Format('%10.0n',[VY_pn]);
    LVY_ocr.Caption := Format('%10.0n',[VY_ocr]);
    LVY_materska.Caption := Format('%10.0n',[VY_materska]);
    LVY_vyrovdav.Caption := Format('%10.0n',[VY_vyrovdav]);
    {--}
    LD_spolu.Caption := Format('%10.0n',[d_spolu]);
    LR_spolu.Caption := Format('%10.0n',[r_spolu]);
  end;
end;

procedure TReportSP2005VY.Q1_AfterOpen(DataSet: TDataSet);
begin
  VypocitajOdvody('ALL');
end;

procedure TReportSP2005VY.SpracujStrediskoNP;
var sid: byte;
begin
  sid:=Q2_SID.Value;
  with MyOdvodyNP[sid] do begin
    o_nemoc      :=o_nemoc    + Q2_o_np.Value;
    o_dochod     :=o_dochod   + Q2_o_dp.Value;
    o_invalid    :=o_invalid  + Q2_o_ip.Value;
    o_fondzam    :=o_fondzam  + Q2_o_fz.Value;
    z_nemoc      :=z_nemoc    + Q2_oz_np.Value;
    z_dochod     :=z_dochod   + Q2_oz_dp.Value;
    z_invalid    :=z_invalid  + Q2_oz_ip.Value;
    z_fondzam    :=z_fondzam  + Q2_oz_fz.Value;
    z_uraz       :=z_uraz     + Q2_oz_up.Value;
    z_garancne   :=z_garancne + Q2_oz_gp.Value;
    z_rezerva    :=z_rezerva  + Q2_oz_rf.Value;
    if Q2_n_zaklad_np.Value<>0  then p_nemoc      :=p_nemoc    + 1;
    if Q2_n_zaklad_dp.Value<>0  then p_dochod     :=p_dochod   + 1;
    if Q2_n_zaklad_ip.Value<>0  then p_invalid    :=p_invalid  + 1;
    if Q2_n_zaklad_fz.Value<>0  then p_fondzam    :=p_fondzam  + 1;
    if Q2_n_zaklad_up.Value<>0  then p_uraz       :=p_uraz     + 1;
    if Q2_n_zaklad_gp.Value<>0  then p_garancne   :=p_garancne + 1;
    if Q2_n_zaklad_rf.Value<>0  then p_rezerva    :=p_rezerva  + 1;
  end;
end;

procedure TReportSP2005VY.SpracujStredisko;
var sid: byte;
begin
sid:=Q0_SID.Value;
if (Q0_V_obdobie.Value >= ZAKON_2013_01) AND
   (
     (Q0_typzec.Value IN SetOf_Typzec_NP) or (Q0_PoSkonceni.Value)
   )
then
with MyOdvodyNP[sid] do
begin
  o_nemoc      :=o_nemoc    + Q0_o_nemoc.Value;
  o_dochod     :=o_dochod   + Q0_o_dochod.Value;
  o_invalid    :=o_invalid + Q0_o_invalid.Value;
  o_fondzam    :=o_fondzam + Q0_o_fondzam.Value;
  z_nemoc      :=z_nemoc    + Q0_oz_nemoc.Value;
  z_dochod     :=z_dochod   + Q0_oz_dochod.Value;
  z_invalid    :=z_invalid + Q0_oz_invalid.Value;
  z_fondzam    :=z_fondzam + Q0_oz_fondzam.Value;
  z_uraz       :=z_uraz       + Q0_oz_uraz.Value;
  z_garancne   :=z_garancne + Q0_oz_garancne.Value;
  z_rezerva    :=z_rezerva + Q0_oz_rezerva.Value;
  if Q0_n_zaklad_np.Value<>0  then p_nemoc      :=p_nemoc    + 1;
  if Q0_n_zaklad_dp.Value<>0  then p_dochod     :=p_dochod   + 1;
  if Q0_n_zaklad_ip.Value<>0  then p_invalid    :=p_invalid  + 1;
  if Q0_n_zaklad_fz.Value<>0  then p_fondzam    :=p_fondzam  + 1;
  if Q0_n_zaklad_up.Value<>0  then p_uraz       :=p_uraz     + 1;
  if Q0_n_zaklad_gp.Value<>0  then p_garancne   :=p_garancne + 1;
  if Q0_n_zaklad_rf.Value<>0  then p_rezerva    :=p_rezerva  + 1;
  if Q0_N_pn.Value > 0 then begin
    pz_pn := pz_pn + 1;
    pp_pn := pp_pn + 1;
    pd_pn := pd_pn + Q0_V_pn.Value;
    vy_pn := vy_pn + Q0_N_pn.Value;
  end;
  if Q0_N_ocr.Value > 0 then begin
    pz_ocr := pz_ocr + 1;
    pp_ocr := pp_ocr + 1;
    pd_ocr := pd_ocr + Q0_V_ocr12.Value;
    vy_ocr := vy_ocr + Q0_N_ocr.Value;
  end;
  if Q0_nd_materska.Value > 0 then begin
    pz_materska := pz_materska + 1;
    pp_materska := pp_materska + 1;
    pd_materska := pd_materska + Q0_V_materska.Value;
    vy_materska := vy_materska + Q0_Nd_materska.Value;
  end;
end
else
with MyOdvody[sid] do
begin
  o_nemoc      :=o_nemoc    + Q0_o_nemoc.Value;
  o_dochod     :=o_dochod   + Q0_o_dochod.Value;
  o_invalid    :=o_invalid + Q0_o_invalid.Value;
  o_fondzam    :=o_fondzam + Q0_o_fondzam.Value;
  z_nemoc      :=z_nemoc    + Q0_oz_nemoc.Value;
  z_dochod     :=z_dochod   + Q0_oz_dochod.Value;
  z_invalid    :=z_invalid + Q0_oz_invalid.Value;
  z_fondzam    :=z_fondzam + Q0_oz_fondzam.Value;
  z_uraz       :=z_uraz       + Q0_oz_uraz.Value;
  z_garancne   :=z_garancne + Q0_oz_garancne.Value;
  z_rezerva    :=z_rezerva + Q0_oz_rezerva.Value;

  if Q0_n_zaklad_np.Value<>0  then p_nemoc      :=p_nemoc    + 1;
  if Q0_n_zaklad_dp.Value<>0  then p_dochod     :=p_dochod   + 1;
  if Q0_n_zaklad_ip.Value<>0  then p_invalid    :=p_invalid  + 1;
  if Q0_n_zaklad_fz.Value<>0  then p_fondzam    :=p_fondzam  + 1;
  if Q0_n_zaklad_up.Value<>0  then p_uraz       :=p_uraz     + 1;
  if Q0_n_zaklad_gp.Value<>0  then p_garancne   :=p_garancne + 1;
  if Q0_n_zaklad_rf.Value<>0  then p_rezerva    :=p_rezerva  + 1;

  if Q0_N_pn.Value > 0 then begin
    pz_pn := pz_pn + 1;
    pp_pn := pp_pn + 1;
    pd_pn := pd_pn + Q0_V_pn.Value;
    vy_pn := vy_pn + Q0_N_pn.Value;
  end;
  if Q0_N_ocr.Value > 0 then begin
    pz_ocr := pz_ocr + 1;
    pp_ocr := pp_ocr + 1;
    pd_ocr := pd_ocr + Q0_V_ocr12.Value;
    vy_ocr := vy_ocr + Q0_N_ocr.Value;
  end;
  if Q0_nd_materska.Value > 0 then begin
    pz_materska := pz_materska + 1;
    pp_materska := pp_materska + 1;
    pd_materska := pd_materska + Q0_V_materska.Value;
    vy_materska := vy_materska + Q0_Nd_materska.Value;
  end;
(*
  with MyOdvodyNP[sid] do begin
    o_nemoc      :=o_nemoc    + Q2_o_np.Value;
    o_dochod     :=o_dochod   + Q2_o_dp.Value;
    o_invalid    :=o_invalid  + Q2_o_ip.Value;
    o_fondzam    :=o_fondzam  + Q2_o_fz.Value;
    z_nemoc      :=z_nemoc    + Q2_oz_np.Value;
    z_dochod     :=z_dochod   + Q2_oz_dp.Value;
    z_invalid    :=z_invalid  + Q2_oz_ip.Value;
    z_fondzam    :=z_fondzam  + Q2_oz_fz.Value;
    z_uraz       :=z_uraz     + Q2_oz_up.Value;
    z_garancne   :=z_garancne + Q2_oz_gp.Value;
    z_rezerva    :=z_rezerva  + Q2_oz_rf.Value;
    if Q2_n_zaklad_np.Value<>0  then p_nemoc      :=p_nemoc    + 1;
    if Q2_n_zaklad_dp.Value<>0  then p_dochod     :=p_dochod   + 1;
    if Q2_n_zaklad_ip.Value<>0  then p_invalid    :=p_invalid  + 1;
    if Q2_n_zaklad_fz.Value<>0  then p_fondzam    :=p_fondzam  + 1;
    if Q2_n_zaklad_up.Value<>0  then p_uraz       :=p_uraz     + 1;
    if Q2_n_zaklad_gp.Value<>0  then p_garancne   :=p_garancne + 1;
    if Q2_n_zaklad_rf.Value<>0  then p_rezerva    :=p_rezerva  + 1;
  end;
*)
end;end;

procedure TReportSP2005VY.SpracujStrediskoPrihlBezPrijmu;
var sid: byte;
begin
sid:=Q55_SID.Value;
with MyOdvody[sid] do
begin
  if Q55_u_nemoc.Value<>0  then p_nemoc      :=p_nemoc    + 1;
  if Q55_u_dochod.Value<>0  then p_dochod     :=p_dochod   + 1;
  if Q55_u_invalid.Value<>0  then p_invalid    :=p_invalid  + 1;
  if Q55_u_fondzam.Value<>0  then p_fondzam    :=p_fondzam  + 1;
  if Q55_u_uraz.Value<>0  then p_uraz       :=p_uraz     + 1;
  if Q55_u_garancne.Value<>0  then p_garancne   :=p_garancne + 1;
  if Q55_u_rezerva.Value<>0  then p_rezerva    :=p_rezerva  + 1;
end;end;

procedure TReportSP2005VY.Q1_CalcFields(DataSet: TDataSet);
var s:string;
begin
  Q1_CALC_FIRMA.Value := 'FIRMA: '+X.AktFirmaStr;

  s:=IntToStr(X.AktObdobie);
  Q1_CALC_OBDOBIE.Value:=
    'za mesiac  '+Copy(s,5,2)+' / '+Copy(s,1,4);
  Q1_CALC_CISLO_UCTU.Value:=
    LongCisloU(Q1_predcislo_u.Value,Q1_cislo_u.Value)+' / '+
    Q1_banka_u.Value;
end;

procedure RunReportSP2005VY(const MyReportParam: TMyReportParam);
begin with ReportSP2005VY do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportSP2005VY:=TReportSP2005VY.Create(Application);
    if X.DisableShape then QRDisableShape(ReportSP2005VY);
    if X.DisableLabel then QRDisableLabel(ReportSP2005VY);
    Screen.Cursor:=crDefault;
    ReportSP2005VY.ShowReportStart;
    if Q1_.Active AND (Q1_.RecordCount>0) then
    begin
      ReportSP2005VY.Preview;
    end;
    ReportSP2005VY.ShowReportEnd;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportSP2005VY.Free;
  end;
end;end;

procedure RunReportSP2005VY_PDF_2011(const MyReportParam: TMyReportParam);
var prefix: string;
  ObdVyplatenia : longint;
begin with ReportSP2005VY,MyOdvody[0] do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportSP2005VY:=TReportSP2005VY.Create(Application);
    if X.DisableShape then QRDisableShape(ReportSP2005VY);
    if X.DisableLabel then QRDisableLabel(ReportSP2005VY);
    Screen.Cursor:=crDefault;
    ReportSP2005VY.ShowReportStart;
    if X.Typ = 'SP_PDF/NP' then MyOdvody[0]:=MyOdvodyNP[0];
    if X.Typ = 'SP_PDF/NP' then begin
      prefix := 'form1[0].#subform[0].';
      X.rtf_sablona := MyFrmPath + 'MesVykNP_1101.pdf';
      X.rtf_subor :=  MyRepPath1 + 'MesVykNP_'+IntToStr(X.AktObdobie)+X.AktSidListSuffix+'.xfdf';
      ObdVyplatenia := Obdobie_ADD_MM(X.AktObdobie,1);
    end else begin
      prefix := 'form1[0].SubForm1[0].';
      X.rtf_sablona := MyFrmPath + 'MesVykPCB_1101.pdf';
      X.rtf_subor :=  MyRepPath1 + 'MesVykPCB_'+IntToStr(X.AktObdobie)+X.AktSidListSuffix+'.xfdf';
      ObdVyplatenia := X.AktObdobie;
    end;
    Rtf_Open(X);
    if X.Rtf_prepisat then
    begin
      MyXML := '';
      E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
      E_TEXT('<xfdf xmlns="http://ns.adobe.com/xfdf/" xml:space="preserve">');
      E_TAGZ('fields');
      if X.Typ = 'SP_PDF/NP' then
        E_XFDF(prefix+'DateTimeFieldCisloVykazu[0]', LPAD(IntToStr(MyMesiac(ObdVyplatenia)),2,'0')+'99'+IntToStr(MyRok(ObdVyplatenia)));
      E_XFDF(prefix+'DateTimeFieldZaObdobie[0]', ObdobieToMMRRRR(ObdVyplatenia));
      E_XFDF(prefix+'TextFieldNazovZam[1]',Q1_Nazov.Value);
      if DM.TINF_SP_IDENTIFIKATOR.Value = 1 then
      begin
        E_XFDF(prefix+'RBListIcoDic[0]','1');
        E_XFDF(prefix+'TextFieldId[1]',Q1_ICO.Value);
      end else begin
        E_XFDF(prefix+'RBListIcoDic[0]','2');
        E_XFDF(prefix+'TextFieldId[1]',Q1_DIC.Value);
      end;
      if X.Vykaz_Riadny='R'
        then E_XFDF(prefix+'RadioButtonList[0]','0')
        else E_XFDF(prefix+'RadioButtonList[0]','1');
      E_XFDF(prefix+'TextFieldId[0]',Q1_ICZ.Value);
      E_XFDF(prefix+'TextFieldCisloUctu[0]',Q1_CALC_CISLO_UCTU.Value);
      E_XFDF(prefix+'TextFieldNazovBanky[0]',Q1_Nazov_banky.Value);
      E_XFDF(prefix+'TextFieldObec[0]',Q1_ADR_Mesto.Value);
      E_XFDF(prefix+'NumericFieldPocetStran[0]','1');
      E_XFDF(prefix+'TextFieldPSC[0]',Q1_ADR_PSC.Value);
      E_XFDF(prefix+'TextFieldUlica[0]',Q1_ADR_ULICA.Value);
      E_XFDF(prefix+'TextFieldCisloSupOrient[0]',Q1_ADR_Cislo.Value);
      E_XFDF(prefix+'TextFieldTelefon[0]',Q1_ADR_TELEFON.Value);
      E_XFDF(prefix+'TextFieldFax[0]',Q1_ADR_FAX.Value);
      E_XFDF(prefix+'TextFieldEMail[0]',Q1_ADR_EMAIL.Value);
      E_XFDF(prefix+'DateTimeField[0]',FormatDateTime('dd.mm.yyyy',X.Vykaz_dna_DT));
      E_XFDF(prefix+'TextFieldFormularVyplnil[0]',X.Vykaz_zostavil);
      E_XFDF(prefix+'NumericFieldSumaCelaCast[0]',Format('%d',[Trunc(O_nemoc)]));
      E_XFDF(prefix+'NumericFieldSumaCelaCast[4]',Format('%d',[Trunc(Z_nemoc)]));
      E_XFDF(prefix+'NumericFieldSumaCelaCast[1]',Format('%d',[Trunc(O_dochod)]));
      E_XFDF(prefix+'NumericFieldSumaCelaCast[5]',Format('%d',[Trunc(Z_dochod)]));
      E_XFDF(prefix+'NumericFieldSumaCelaCast[2]',Format('%d',[Trunc(O_invalid)]));
      E_XFDF(prefix+'NumericFieldSumaCelaCast[6]',Format('%d',[Trunc(Z_invalid)]));
      E_XFDF(prefix+'NumericFieldSumaCelaCast[3]',Format('%d',[Trunc(O_fondzam)]));
      E_XFDF(prefix+'NumericFieldSumaCelaCast[7]',Format('%d',[Trunc(Z_fondzam)]));
      E_XFDF(prefix+'NumericFieldSumaCelaCast[8]',Format('%d',[Trunc(Z_uraz)]));
      E_XFDF(prefix+'NumericFieldSumaCelaCast[9]',Format('%d',[Trunc(Z_garancne)]));
      E_XFDF(prefix+'NumericFieldSumaCelaCast[10]',Format('%d',[Trunc(Z_rezerva)]));
      E_XFDF(prefix+'NumericFieldPocet[5]',Format('%d',[Trunc(p_garancne)]));
      E_XFDF(prefix+'NumericFieldPocet[2]',Format('%d',[Trunc(p_invalid)]));
      E_XFDF(prefix+'NumericFieldPocet[0]',Format('%d',[Trunc(p_nemoc)]));
      E_XFDF(prefix+'NumericFieldPocet[6]',Format('%d',[Trunc(p_rezerva)]));
      E_XFDF(prefix+'NumericFieldPocet[3]',Format('%d',[Trunc(p_fondzam)]));
      E_XFDF(prefix+'NumericFieldPocet[1]',Format('%d',[Trunc(p_dochod)]));
      E_XFDF(prefix+'NumericFieldPocet[4]',Format('%d',[Trunc(p_uraz)]));
      E_XFDF(prefix+'NumericFieldSumaCelaCast[11]',Format('%d',[Trunc(p_spolu)]));
      //desatinna cast
      E_XFDF(prefix+'NumericFieldSumaDesMiesta[0]',Format('%.2d',[Trunc(ZAOKRUHLI(Frac(O_nemoc)*100,0,2))]));
      E_XFDF(prefix+'NumericFieldSumaDesMiesta[1]',Format('%.2d',[Trunc(ZAOKRUHLI(Frac(O_dochod)*100,0,2))]));
      E_XFDF(prefix+'NumericFieldSumaDesMiesta[2]',Format('%.2d',[Trunc(ZAOKRUHLI(Frac(O_invalid)*100,0,2))]));
      E_XFDF(prefix+'NumericFieldSumaDesMiesta[3]',Format('%.2d',[Trunc(ZAOKRUHLI(Frac(O_fondzam)*100,0,2))]));
      E_XFDF(prefix+'NumericFieldSumaDesMiesta[4]',Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Z_nemoc)*100,0,2))]));
      E_XFDF(prefix+'NumericFieldSumaDesMiesta[5]',Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Z_dochod)*100,0,2))]));
      E_XFDF(prefix+'NumericFieldSumaDesMiesta[6]',Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Z_invalid)*100,0,2))]));
      E_XFDF(prefix+'NumericFieldSumaDesMiesta[7]',Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Z_fondzam)*100,0,2))]));
      E_XFDF(prefix+'NumericFieldSumaDesMiesta[8]',Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Z_uraz)*100,0,2))]));
      E_XFDF(prefix+'NumericFieldSumaDesMiesta[9]',Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Z_garancne)*100,0,2))]));
      E_XFDF(prefix+'NumericFieldSumaDesMiesta[10]',Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Z_rezerva)*100,0,2))]));
      E_XFDF(prefix+'NumericFieldSumaDesMiesta[11]',Format('%.2d',[Trunc(ZAOKRUHLI(Frac(p_spolu)*100,0,2))]));
      E_TAGK('fields');
      E_ATTRZ('href',X.rtf_sablona);
      E_TAGA('f',MyAttr);
      E_TAGK('xfdf');
      Rtf_Uloz_XML(X);
    end;
    ReportSP2005VY.ShowReportEnd;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportSP2005VY.Free;
  end;
  Rtf_zobraz(X);
end;end;

procedure RunReportSP2005VY_PDF(const MyReportParam: TMyReportParam);
begin with ReportSP2005VY,MyOdvody[0] do begin
  X:=MyReportParam;
  if X.AktObdobie >= ZAKON_2011_01 then begin
   RunReportSP2005VY_PDF_2011(MyReportParam);
   exit;
  end;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportSP2005VY:=TReportSP2005VY.Create(Application);
    if X.DisableShape then QRDisableShape(ReportSP2005VY);
    if X.DisableLabel then QRDisableLabel(ReportSP2005VY);
    Screen.Cursor:=crDefault;
    ReportSP2005VY.ShowReportStart;
    if X.AktObdobie >= Zakon_2011_01 then
      X.rtf_sablona := MyFrmPath + 'MesVykPCB_1101.pdf'
    else if X.AktObdobie >= Zakon_2009_01 then
      X.rtf_sablona := MyFrmPath + 'MesVykPCB_0901.pdf'
    else if X.AktObdobie >= Zakon_2008_07 then
      X.rtf_sablona := MyFrmPath + 'MesVykPCB_0807.pdf'
    else
      X.rtf_sablona := MyFrmPath + 'MesVykPCB_web.pdf';
    X.rtf_subor :=  MyRepPath1 + 'MesVykPCB_'+IntToStr(X.AktObdobie)+X.AktSidListSuffix+'.xfdf';
    Rtf_Open(X);
    if X.Rtf_prepisat then
    begin
      MyXML := '';
      E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
      E_TEXT('<xfdf xmlns="http://ns.adobe.com/xfdf/" xml:space="preserve">');
      E_TAGZ('fields');
      E_XFDF('b12c96nfobdobie', ObdobieToMMRRRR(X.AktObdobie));
      if X.AktObdobie >= ZAKON_2008_07 then begin
        E_XFDF('b12c96nfZamNaz_h',Q1_Nazov.Value);
        E_XFDF('b12c96nfZamNaz_2_h','');
        E_XFDF('b12c96nfZamNaz_3_h','');
        if DM.TINF_SP_IDENTIFIKATOR.Value = 1 then
        begin
          E_XFDF('b12c96nfChoice_23','1');
          E_XFDF('b12c96nfidentifikator',Q1_ICO.Value);
        end else begin
          E_XFDF('b12c96nfChoice_23','2');
          E_XFDF('b12c96nfidentifikator',Q1_DIC.Value);
        end;
        if X.Vykaz_Riadny='R'
          then E_XFDF('b12c96nftypVykazu','1')
          else E_XFDF('b12c96nftypVykazu','0');
      end else begin
        E_XFDF('b12c96nfZamNaz',Q1_Nazov.Value);
        E_XFDF('b12c96nfZamNaz_2','');
        E_XFDF('b12c96nfZamNaz_3','');
        E_XFDF('b12c96nftypVykazu',X.Vykaz_riadny);
        E_XFDF('b12c96nfidentifikator',Q1_ICO.Value);
      end;
      if X.AktObdobie >= ZAKON_2011_01 then begin
          E_XFDF('TextFieldId_0',Q1_ICZ.Value);
      end
      else if X.AktObdobie >= ZAKON_2009_01 then
        E_XFDF('b12c96nficz',Q1_ICZ.Value)
      else
        E_XFDF('b12c96nfick',Q1_ICZ.Value);
      E_XFDF('b12c96nfcislo_kod_uctu',Q1_CALC_CISLO_UCTU.Value);
      E_XFDF('b12c96nfnazovSidloBanky',Q1_Nazov_banky.Value);
      E_XFDF('b12c96nfobec',Q1_ADR_Mesto.Value);
      E_XFDF('b12c96nfPocStr','1');
      E_XFDF('b12c96nfpsc',Q1_ADR_PSC.Value);
      E_XFDF('b12c96nfstat','');
      E_XFDF('b12c96nfulica',Q1_ADR_ULICA.Value);
      E_XFDF('b12c96nfsupCislo_oCislo',Q1_ADR_Cislo.Value);
      E_XFDF('b12c96nftel',Q1_ADR_TELEFON.Value);
      E_XFDF('b12c96nffax',Q1_ADR_FAX.Value);
      E_XFDF('b12c96nfmail',Q1_ADR_EMAIL.Value);
{      E_XFDF('b12c96nfVypStr',);}
      {E_XFDF('b12c96nfDatVyp',X.Vykaz_dna);}
      E_XFDF('b12c96nfDatVyp',FormatDateTime('dd.mm.yyyy',X.Vykaz_dna_DT));
      E_XFDF('b12c96nfFormVyp',X.Vykaz_zostavil);
      E_XFDF('b12c96nfnpZamnec',Format('%d',[Trunc(O_nemoc)]));
      E_XFDF('b12c96nfnpZamtel',Format('%d',[Trunc(Z_nemoc)]));
      E_XFDF('b12c96nfspZamnec',Format('%d',[Trunc(O_dochod)]));
      E_XFDF('b12c96nfspZamtel',Format('%d',[Trunc(Z_dochod)]));
      E_XFDF('b12c96nfipZamnec',Format('%d',[Trunc(O_invalid)]));
      E_XFDF('b12c96nfipZamtel',Format('%d',[Trunc(Z_invalid)]));
      E_XFDF('b12c96nfpvnZamnec',Format('%d',[Trunc(O_fondzam)]));
      E_XFDF('b12c96nfpvnZamtel',Format('%d',[Trunc(Z_fondzam)]));
      E_XFDF('b12c96nfupZamtel',Format('%d',[Trunc(Z_uraz)]));
      E_XFDF('b12c96nfgpZamtel',Format('%d',[Trunc(Z_garancne)]));
      E_XFDF('b12c96nfpdrfZamtel',Format('%d',[Trunc(Z_rezerva)]));
      E_XFDF('b12c96nfpocZamGP',Format('%d',[Trunc(p_garancne)]));
      E_XFDF('b12c96nfpocZamIP',Format('%d',[Trunc(p_invalid)]));
      E_XFDF('b12c96nfpocZamNP',Format('%d',[Trunc(p_nemoc)]));
      E_XFDF('b12c96nfpocZamPdRF',Format('%d',[Trunc(p_rezerva)]));
      E_XFDF('b12c96nfpocZamPvN',Format('%d',[Trunc(p_fondzam)]));
      E_XFDF('b12c96nfpocZamSP',Format('%d',[Trunc(p_dochod)]));
      E_XFDF('b12c96nfpocZamUP',Format('%d',[Trunc(p_uraz)]));
      E_XFDF('b12c96nfspoluPoistne',Format('%d',[Trunc(p_spolu)]));
      if X.AktObdobie >= Zakon_2009_01 then begin
        E_XFDF('b12c96nfDesatina',Format('%d',[Trunc(ZAOKRUHLI(Frac(O_nemoc)*10,0,1))]));
        E_XFDF('b12c96nfDesatina_2',Format('%d',[Trunc(ZAOKRUHLI(Frac(O_dochod)*10,0,1))]));
        E_XFDF('b12c96nfDesatina_3',Format('%d',[Trunc(ZAOKRUHLI(Frac(O_invalid)*10,0,1))]));
        E_XFDF('b12c96nfDesatina_4',Format('%d',[Trunc(ZAOKRUHLI(Frac(O_fondzam)*10,0,1))]));
        E_XFDF('b12c96nfDesatina_5',Format('%d',[Trunc(ZAOKRUHLI(Frac(Z_nemoc)*10,0,1))]));
        E_XFDF('b12c96nfDesatina_6',Format('%d',[Trunc(ZAOKRUHLI(Frac(Z_dochod)*10,0,1))]));
        E_XFDF('b12c96nfDesatina_7',Format('%d',[Trunc(ZAOKRUHLI(Frac(Z_invalid)*10,0,1))]));
        E_XFDF('b12c96nfDesatina_8',Format('%d',[Trunc(ZAOKRUHLI(Frac(Z_fondzam)*10,0,1))]));
        E_XFDF('b12c96nfDesatina_9',Format('%d',[Trunc(ZAOKRUHLI(Frac(Z_uraz)*10,0,1))]));
        E_XFDF('b12c96nfDesatina_10',Format('%d',[Trunc(ZAOKRUHLI(Frac(Z_garancne)*10,0,1))]));
        E_XFDF('b12c96nfDesatina_11',Format('%d',[Trunc(ZAOKRUHLI(Frac(Z_rezerva)*10,0,1))]));
        E_XFDF('b12c96nfDesatina_12',Format('%d',[Trunc(ZAOKRUHLI(Frac(p_spolu)*10,0,1))]));
      end;
      E_TAGK('fields');
      E_ATTRZ('href',X.rtf_sablona);
      E_TAGA('f',MyAttr);
      E_TAGK('xfdf');
      Rtf_Uloz_XML(X);
    end;
    ReportSP2005VY.ShowReportEnd;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportSP2005VY.Free;
  end;
  Rtf_zobraz(X);
end;end;

procedure TReportSP2005VY.ReportSP2005VYBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,5);
end;

procedure TReportSP2005VY.VypocitajOdvody(typ:string);
var i:integer;
begin
  typ := 'ALL'; { -- od 1.1.2013 je mozne pocitat vzdy len ALL}
{typ: PP-pravidelny prijem,
      NP-nepravidelny prijem
      ALL-obidva
}
  InitMyPremenne;
{ =========================  Spracuj pravidelne prijmy ==============================}
if ((typ='PP') or (typ='ALL')) then
begin
  try
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q0_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P3').AsInteger := X.AktMaxSid;
  if X.AktSidList<>''
   then Q0_.SQL.Add (X.AktSidList);
  Q0_.Open;
  except MyError(SMyRepExecError);
  end;
  if Q0_.Active AND (Q0_.RecordCount>0) then
  begin
   while not Q0_.EOF do begin
     SpracujStredisko;
     Q0_.Next;
   end;
  end;
  Q0_.Close;
end;
{ =========================  SpracujNepravidelnePrijmy ==============================}
if ((typ='NP') or (typ='ALL')) then
begin
  try
  Q2_.Close;
  Q2_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q2_.Open;
  except MyError(SMyRepExecError);
  end;
  if Q2_.Active AND (Q2_.RecordCount>0) then
  begin
   while not Q2_.EOF do begin
     SpracujStrediskoNP;
     Q2_.Next;
   end;
  end;
  Q2_.Close;
{ =========================  SpracujPrihlasenychBezPrijmov ==============================}
(*
  Q55_.Close;
  if X.AktSidList<>'' then begin
    Q55_.SQL.Text := StrReplaceX(Q55_.SQL.Text,'UNION',StrReplaceX(X.AktSidList,'sid','v.sid')+' '+CHR(10)+' UNION ');
    Q55_.SQL.Text := StrReplaceX(Q55_.SQL.Text,'1=:gfk','1=:gfk '+X.AktSidList+' ');
  end;
  Q55_.SQL.Text := StrReplaceX(Q55_.SQL.Text,'8=8','vv.v_obdobie = '+IntToStr(X.AktObdobie));
  if X.AktObdobie >= ZAKON_2013_01
    then Q55_.SQL.Text := StrReplaceX(Q55_.SQL.Text,'7=7','zz.typzec '+ Condition_Typzec_PP)
    else Q55_.SQL.Text := StrReplaceX(Q55_.SQL.Text,'7=7','zz.typzec<>3');
  Q55_.ParamByName('P1').Value := X.AktObdobie;
  Q55_.ParamByName('P2').Value := X.AktMinSid;
  Q55_.ParamByName('P3').Value := X.AktMaxSid;
  if PARAMETRE[40].Hodnota = 1
   then Q55_.ParamByName('GFK').Value := 0
     else Q55_.ParamByName('GFK').Value := 1;
  MyMessage(Q55_.SQL.Text);
  Q55_.Open;
  MyMessage('Q55_. OPEN SUCCESS');
  if Q55_.Active AND (Q55_.RecordCount>0) then
  begin
   while not Q55_.EOF do begin
     SpracujStrediskoPrihlBezPrijmu;
     Q55_.Next;
   end;
  end;
  Q55_.Close;
*)
  { =========================  SUMMARY ==============================}
  for i:=1 to 99 do
  with MyOdvody[i] do
  begin
    MyOdvody[0].o_nemoc    :=MyOdvody[0].o_nemoc  +ZAOKRUHLI(o_nemoc,-2,2);
    MyOdvody[0].o_dochod   :=MyOdvody[0].o_dochod +ZAOKRUHLI(o_dochod,-2,2);
    MyOdvody[0].o_invalid  :=MyOdvody[0].o_invalid+ZAOKRUHLI(o_invalid,-2,2);
    MyOdvody[0].o_fondzam  :=MyOdvody[0].o_fondzam+ZAOKRUHLI(o_fondzam,-2,2);
    MyOdvody[0].z_nemoc    :=MyOdvody[0].z_nemoc  +ZAOKRUHLI(z_nemoc,-2,2);
    MyOdvody[0].z_dochod   :=MyOdvody[0].z_dochod +ZAOKRUHLI(z_dochod,-2,2);
    MyOdvody[0].z_invalid  :=MyOdvody[0].z_invalid+ZAOKRUHLI(z_invalid,-2,2);
    MyOdvody[0].z_fondzam  :=MyOdvody[0].z_fondzam+ZAOKRUHLI(z_fondzam,-2,2);
    MyOdvody[0].z_uraz     :=MyOdvody[0].z_uraz   +ZAOKRUHLI(z_uraz,-2,2);
    MyOdvody[0].z_garancne  :=MyOdvody[0].z_garancne+ZAOKRUHLI(z_garancne,-2,2);
    MyOdvody[0].z_rezerva  :=MyOdvody[0].z_rezerva+ZAOKRUHLI(z_rezerva,-2,2);
    MyOdvody[0].p_nemoc    :=MyOdvody[0].p_nemoc  +p_nemoc;
    MyOdvody[0].p_dochod   :=MyOdvody[0].p_dochod +p_dochod;
    MyOdvody[0].p_invalid  :=MyOdvody[0].p_invalid+p_invalid;
    MyOdvody[0].p_fondzam  :=MyOdvody[0].p_fondzam+p_fondzam;
    MyOdvody[0].p_uraz     :=MyOdvody[0].p_uraz   +p_uraz;
    MyOdvody[0].p_garancne  :=MyOdvody[0].p_garancne+p_garancne;
    MyOdvody[0].p_rezerva  :=MyOdvody[0].p_rezerva+p_rezerva;
  end;
  for i:=1 to 99 do
  with MyOdvodyNP[i] do
  begin
    MyOdvodyNP[0].o_nemoc    :=MyOdvodyNP[0].o_nemoc  +o_nemoc;
    MyOdvodyNP[0].o_dochod   :=MyOdvodyNP[0].o_dochod +o_dochod;
    MyOdvodyNP[0].o_invalid  :=MyOdvodyNP[0].o_invalid+o_invalid;
    MyOdvodyNP[0].o_fondzam  :=MyOdvodyNP[0].o_fondzam+o_fondzam;
    MyOdvodyNP[0].z_nemoc    :=MyOdvodyNP[0].z_nemoc  +z_nemoc;
    MyOdvodyNP[0].z_dochod   :=MyOdvodyNP[0].z_dochod +z_dochod;
    MyOdvodyNP[0].z_invalid  :=MyOdvodyNP[0].z_invalid+z_invalid;
    MyOdvodyNP[0].z_fondzam  :=MyOdvodyNP[0].z_fondzam+z_fondzam;
    MyOdvodyNP[0].z_uraz     :=MyOdvodyNP[0].z_uraz   +z_uraz;
    MyOdvodyNP[0].z_garancne  :=MyOdvodyNP[0].z_garancne+z_garancne;
    MyOdvodyNP[0].z_rezerva  :=MyOdvodyNP[0].z_rezerva+z_rezerva;
    MyOdvodyNP[0].p_nemoc    :=MyOdvodyNP[0].p_nemoc  +p_nemoc;
    MyOdvodyNP[0].p_dochod   :=MyOdvodyNP[0].p_dochod +p_dochod;
    MyOdvodyNP[0].p_invalid  :=MyOdvodyNP[0].p_invalid+p_invalid;
    MyOdvodyNP[0].p_fondzam  :=MyOdvodyNP[0].p_fondzam+p_fondzam;
    MyOdvodyNP[0].p_uraz     :=MyOdvodyNP[0].p_uraz   +p_uraz;
    MyOdvodyNP[0].p_garancne  :=MyOdvodyNP[0].p_garancne+p_garancne;
    MyOdvodyNP[0].p_rezerva  :=MyOdvodyNP[0].p_rezerva+p_rezerva;
  end;
  with MyOdvody[0] do begin
    p_spolu:=o_nemoc+o_dochod+o_invalid+o_fondzam+
             z_nemoc+z_dochod+z_invalid+z_fondzam+
             z_uraz+z_garancne+z_rezerva;
    d_spolu:=vy_pn+vy_ocr+vy_materska+vy_vyrovdav;
    r_spolu:=p_spolu-d_spolu;
  end;
  with MyOdvodyNp[0] do begin
    p_spolu:=o_nemoc+o_dochod+o_invalid+o_fondzam+
             z_nemoc+z_dochod+z_invalid+z_fondzam+
             z_uraz+z_garancne+z_rezerva;
    d_spolu := 0;
    r_spolu:=p_spolu-d_spolu;
  end;
end;

end;


end.
