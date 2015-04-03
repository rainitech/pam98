unit Dm_vypl;

interface

(* Zaokr˙hæovanie
   Zaokruh1 - hrub· mzda
   Zaokruh2 - prÌplatky
   Zaokruh3 - mesaËn· mzda
   Zaokruh4 - nemocenskÈ d·vky jednotlivo
   Zaokruh5 - roËn· zdaniteæn· mzda
   Zaokruh6 - prÈmie
   Zaokruh7 - soci·lny fond - z·klad
   Zaokruh8 - soci·lny fond - odvod
   Zaokruh9 - zr·ûkov˝ z·klad dane + dan
   Zaokruh10 - nemocenskÈ d·vky spolu
*)

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables;

type
  EVAlreadyExist = class(Exception);

  TMilionarskaDan =
  object
    pocet:integer;
    obdobie_od:longint;
    obdobie_do:longint;
    pasmo:array[1..10] of double;
    sadzba:array[1..10] of double;
    rzp:byte;
    function ZVYS_MESACNU_DAN(Z:double):double;
    function ZVYS_ROCNU_DAN(Z:double):double;
  end;

  TDMV = class(TDataModule)
    TVYP_: TTable;
    DS_VYPL: TDataSource;
    QVYP_: TQuery;
    QVYP_v_rok: TSmallintField;
    QVYP_v_mesiac: TSmallintField;
    QVYP_V_fmes: TSmallintField;
    QVYP_V_hodina: TFloatField;
    DS_VGRID: TDataSource;
    QVYP_V_holiday: TFloatField;
    QVYP_V_pn: TSmallintField;
    QVYP_V_sviatok: TSmallintField;
    QPRX_: TQuery;
    TVYP_MES: TStringField;
    TVYP_MESROK: TStringField;
    QPOCZ_: TQuery;
    QPOCZ_pocet: TIntegerField;
    QPOCM_: TQuery;
    QPOCM_pocet: TIntegerField;
    QPRX_sum_uvazok: TFloatField;
    QPRX_sum_hodina: TFloatField;
    QVYP_N_brutto: TCurrencyField;
    TVYP_CALC_NETTO_ZRAZKY: TCurrencyField;
    TVYP_V_obdobie: TIntegerField;
    TVYP_V_rok: TSmallintField;
    TVYP_V_mesiac: TSmallintField;
    TVYP_V_fmes: TSmallintField;
    TVYP_V_sviatok: TSmallintField;
    TVYP_V_holiday: TFloatField;
    TVYP_V_absencia: TFloatField;
    TVYP_V_pn1: TSmallintField;
    TVYP_V_pn2: TSmallintField;
    TVYP_V_hodina: TFloatField;
    TVYP_MV_plat: TCurrencyField;
    TVYP_V_plat: TCurrencyField;
    TVYP_V_sadzba: TCurrencyField;
    TVYP_N_brutto: TCurrencyField;
    TVYP_N_holiday: TCurrencyField;
    TVYP_N_premie: TCurrencyField;
    TVYP_N_odmeny: TCurrencyField;
    TVYP_N_dohody_ovp: TCurrencyField;
    TVYP_N_dohody_opc: TCurrencyField;
    TVYP_N_doplatok: TCurrencyField;
    TVYP_Vh_nadcas: TFloatField;
    TVYP_Vp_nadcas: TCurrencyField;
    TVYP_Vh_sobota: TFloatField;
    TVYP_Vp_sobota: TCurrencyField;
    TVYP_Vh_nedela: TFloatField;
    TVYP_Vp_nedela: TCurrencyField;
    TVYP_Vh_sviatok: TFloatField;
    TVYP_Vp_sviatok: TCurrencyField;
    TVYP_Vh_noc: TFloatField;
    TVYP_Vp_noc: TCurrencyField;
    TVYP_Vh_skod: TFloatField;
    TVYP_Vp_skod: TCurrencyField;
    TVYP_N_priplat: TCurrencyField;
    TVYP_O_zdravot: TCurrencyField;
    TVYP_O_nemoc: TCurrencyField;
    TVYP_O_dochod: TCurrencyField;
    TVYP_O_fondzam: TCurrencyField;
    TVYP_N_poist: TCurrencyField;
    TVYP_Dopravne: TCurrencyField;
    TVYP_Pouz_auto: TCurrencyField;
    TVYP_Nc_minimum: TCurrencyField;
    TVYP_Nc_deti: TCurrencyField;
    TVYP_Nc_ine: TCurrencyField;
    TVYP_Nc_spolu: TCurrencyField;
    TVYP_Nd_materska: TCurrencyField;
    TVYP_Nd_pridavky: TCurrencyField;
    TVYP_Nd_ine: TCurrencyField;
    TVYP_Nd_spolu: TCurrencyField;
    TVYP_Dan_vyrovnana: TSmallintField;
    TVYP_D_ciastzd: TCurrencyField;
    TVYP_D_zdanmzda: TCurrencyField;
    TVYP_D_preddavok: TCurrencyField;
    TVYP_D_dan: TCurrencyField;
    TVYP_N_netto: TCurrencyField;
    TVYP_Ne_zaloha: TCurrencyField;
    TVYP_Ne_pozicky: TCurrencyField;
    TVYP_Ne_odborar: TCurrencyField;
    TVYP_Ne_poistovna: TCurrencyField;
    TVYP_Ne_exekucia: TCurrencyField;
    TVYP_Ne_spolu: TCurrencyField;
    TVYP_Spor_plat: TSmallintField;
    TVYP_Sporenie: TCurrencyField;
    TVYP_Vyplata: TCurrencyField;
    TVYP_V_priemer1: TCurrencyField;
    TVYP_V_priemer2: TCurrencyField;
    TVYP_V_pn: TSmallintField;
    TVYP_N_sviatok: TCurrencyField;
    TVYP_N_pn1: TCurrencyField;
    TVYP_N_pn2: TCurrencyField;
    TVYP_N_ocr: TCurrencyField;
    TVYP_N_zaklad_poist: TCurrencyField;
    TVYP_KZP: TSmallintField;
    TVYP_ZPS: TBooleanField;
    TVYP_F_doba: TFloatField;
    TVYP_F_pn_dni: TSmallintField;
    TVYP_F_pn1: TSmallintField;
    TVYP_F_pn2: TSmallintField;
    TVYP_F_ocr: TSmallintField;
    TVYP_F_uraz: TSmallintField;
    TVYP_F_nemmax: TCurrencyField;
    TVYP_F_zdravot: TFloatField;
    TVYP_F_nemoc: TFloatField;
    TVYP_F_dochod: TFloatField;
    TVYP_F_fondz: TFloatField;
    TVYP_Fz_zdravot: TFloatField;
    TVYP_Fz_nemoc: TFloatField;
    TVYP_Fz_dochod: TFloatField;
    TVYP_Fz_fondz: TFloatField;
    TVYP_F_poistmax: TCurrencyField;
    TVYP_F_min_mzda: TCurrencyField;
    TVYP_F_nd_pocita: TSmallintField;
    TVYP_U_zdrav: TSmallintField;
    TVYP_U_nemoc: TSmallintField;
    TVYP_U_dochod: TSmallintField;
    TVYP_U_fondzam: TSmallintField;
    TVYP_U_zdrav1: TSmallintField;
    TVYP_U_nemoc1: TSmallintField;
    TVYP_U_dochod1: TSmallintField;
    TVYP_U_fondzam1: TSmallintField;
    TVYP_U_zdrav2: TSmallintField;
    TVYP_U_nemoc2: TSmallintField;
    TVYP_U_dochod2: TSmallintField;
    TVYP_U_fondzam2: TSmallintField;
    TVYP_F_dan_sadzba1: TFloatField;
    TVYP_F_dan_maximum1: TCurrencyField;
    TVYP_N_mzda: TCurrencyField;
    QPRX_sum_n_mzda: TCurrencyField;
    TRZP_: TTable;
    DS_RZP: TDataSource;
    DS_RGRID: TDataSource;
    TRZP_V_rok: TSmallintField;
    TRZP_Ciastzd1: TCurrencyField;
    TRZP_Ciastzd2: TCurrencyField;
    TRZP_Ciastzd_spolu: TCurrencyField;
    TRZP_Nc_minimum: TCurrencyField;
    TRZP_Nc_deti: TCurrencyField;
    TRZP_Nc_partner: TCurrencyField;
    TRZP_Nc_invalid_ciast: TCurrencyField;
    TRZP_Nc_invalid_ztp: TCurrencyField;
    TRZP_Nc_dary: TCurrencyField;
    TRZP_Nc_spolu: TCurrencyField;
    TRZP_Zdanmzda: TCurrencyField;
    TRZP_Zdanmzda_round: TCurrencyField;
    TRZP_Dan: TCurrencyField;
    TRZP_Uhrn_preddavkov: TCurrencyField;
    TRZP_Preplatok: TCurrencyField;
    QRZP_: TQuery;
    QRZP_d_ciastzd: TCurrencyField;
    QRZP_d_preddavok: TCurrencyField;
    TRZP_CALC_PREPLATOK: TStringField;
    TRZP_Preddavky1: TCurrencyField;
    TRZP_Preddavky2: TCurrencyField;
    XRZP_: TQuery;
    XRZP_pocet: TIntegerField;
    TVYP_Code_emp: TIntegerField;
    QVYP_code_emp: TIntegerField;
    TRZP_Code_emp: TIntegerField;
    THSV_: TTable;
    THSV_Code_emp: TIntegerField;
    THSV_PMT: TStringField;
    THSV_V_sviatok: TSmallintField;
    THSV_V_hodina: TFloatField;
    THSV_N_premie: TCurrencyField;
    THSV_N_odmeny: TCurrencyField;
    THSV_Zaloha: TCurrencyField;
    DS_HSV: TDataSource;
    THSV_Zauctovany: TStringField;
    QVYP_N_premie: TCurrencyField;
    QVYP_N_odmeny: TCurrencyField;
    QVYP_Ne_zaloha: TCurrencyField;
    QVYP_MV_plat: TCurrencyField;
    THSV_V_holiday: TFloatField;
    TVYP_SID: TSmallintField;
    TVYP_U_nezdc: TBooleanField;
    QPRX_sum_dan: TCurrencyField;
    TVYP_Fixny_mv_plat: TBooleanField;
    TVYP_V_den: TFloatField;
    QVYP_V_den: TFloatField;
    THSV_V_den: TFloatField;
    QRZP_nc_minimum: TCurrencyField;
    QRZP_nc_deti: TCurrencyField;
    QRZP_nc_ine: TCurrencyField;
    TRZP_Pom_nc_minimum: TCurrencyField;
    TRZP_Pom_nc_deti: TCurrencyField;
    TRZP_Pom_nc_ine: TCurrencyField;
    QEXP_: TQuery;
    QEXP_Code_emp: TIntegerField;
    QEXP_v_obdobie: TIntegerField;
    QEXP_SID: TSmallintField;
    QEXP_V_rok: TSmallintField;
    QEXP_V_mesiac: TSmallintField;
    QEXP_V_fmes: TSmallintField;
    QEXP_V_den: TFloatField;
    QEXP_V_sviatok: TSmallintField;
    QEXP_V_holiday: TFloatField;
    QEXP_V_absencia: TFloatField;
    QEXP_V_pn1: TSmallintField;
    QEXP_V_pn2: TSmallintField;
    QEXP_V_uraz: TSmallintField;
    QEXP_V_hodina: TFloatField;
    QEXP_MV_plat: TCurrencyField;
    QEXP_V_plat: TCurrencyField;
    QEXP_V_sadzba: TCurrencyField;
    QEXP_N_mzda: TCurrencyField;
    QEXP_N_brutto: TCurrencyField;
    QEXP_N_holiday: TCurrencyField;
    QEXP_N_premie: TCurrencyField;
    QEXP_N_odmeny: TCurrencyField;
    QEXP_N_dohody_ovp: TCurrencyField;
    QEXP_N_dohody_opc: TCurrencyField;
    QEXP_N_doplatok: TCurrencyField;
    QEXP_Vh_nadcas: TFloatField;
    QEXP_Vp_nadcas: TCurrencyField;
    QEXP_Vh_sobota: TFloatField;
    QEXP_Vp_sobota: TCurrencyField;
    QEXP_Vh_nedela: TFloatField;
    QEXP_Vp_nedela: TCurrencyField;
    QEXP_Vh_sviatok: TFloatField;
    QEXP_Vp_sviatok: TCurrencyField;
    QEXP_Vh_noc: TFloatField;
    QEXP_Vp_noc: TCurrencyField;
    QEXP_Vh_skod: TFloatField;
    QEXP_Vp_skod: TCurrencyField;
    QEXP_N_priplat: TCurrencyField;
    QEXP_O_zdravot: TCurrencyField;
    QEXP_O_nemoc: TCurrencyField;
    QEXP_O_dochod: TCurrencyField;
    QEXP_O_fondzam: TCurrencyField;
    QEXP_N_poist: TCurrencyField;
    QEXP_Dopravne: TCurrencyField;
    QEXP_Pouz_auto: TCurrencyField;
    QEXP_Nc_minimum: TCurrencyField;
    QEXP_Nc_deti: TCurrencyField;
    QEXP_Nc_ine: TCurrencyField;
    QEXP_Nc_spolu: TCurrencyField;
    QEXP_Nd_materska: TCurrencyField;
    QEXP_Nd_pridavky: TCurrencyField;
    QEXP_Nd_ine: TCurrencyField;
    QEXP_Nd_spolu: TCurrencyField;
    QEXP_Dan_vyrovnana: TSmallintField;
    QEXP_D_ciastzd: TCurrencyField;
    QEXP_D_zdanmzda: TCurrencyField;
    QEXP_D_preddavok: TCurrencyField;
    QEXP_D_dan: TCurrencyField;
    QEXP_N_netto: TCurrencyField;
    QEXP_Ne_zaloha: TCurrencyField;
    QEXP_Ne_pozicky: TCurrencyField;
    QEXP_Ne_odborar: TCurrencyField;
    QEXP_Ne_poistovna: TCurrencyField;
    QEXP_Ne_exekucia: TCurrencyField;
    QEXP_Ne_spolu: TCurrencyField;
    QEXP_Spor_plat: TSmallintField;
    QEXP_Sporenie: TCurrencyField;
    QEXP_Vyplata: TCurrencyField;
    QEXP_V_priemer1: TCurrencyField;
    QEXP_V_priemer2: TCurrencyField;
    QEXP_V_pn: TSmallintField;
    QEXP_N_sviatok: TCurrencyField;
    QEXP_N_pn1: TCurrencyField;
    QEXP_N_pn2: TCurrencyField;
    QEXP_N_ocr: TCurrencyField;
    QEXP_N_zaklad_poist: TCurrencyField;
    QEXP_KZP: TSmallintField;
    QEXP_ZPS: TBooleanField;
    QEXP_F_doba: TFloatField;
    QEXP_F_pn_dni: TSmallintField;
    QEXP_F_pn1: TSmallintField;
    QEXP_F_pn2: TSmallintField;
    QEXP_F_ocr: TSmallintField;
    QEXP_F_uraz: TSmallintField;
    QEXP_F_nemmax: TCurrencyField;
    QEXP_F_zdravot: TFloatField;
    QEXP_F_nemoc: TFloatField;
    QEXP_F_dochod: TFloatField;
    QEXP_F_fondz: TFloatField;
    QEXP_Fz_zdravot: TFloatField;
    QEXP_Fz_nemoc: TFloatField;
    QEXP_Fz_dochod: TFloatField;
    QEXP_Fz_fondz: TFloatField;
    QEXP_F_poistmax: TCurrencyField;
    QEXP_F_min_mzda: TCurrencyField;
    QEXP_F_nd_pocita: TSmallintField;
    QEXP_U_zdrav: TSmallintField;
    QEXP_U_nemoc: TSmallintField;
    QEXP_U_dochod: TSmallintField;
    QEXP_U_fondzam: TSmallintField;
    QEXP_U_zdrav1: TSmallintField;
    QEXP_U_nemoc1: TSmallintField;
    QEXP_U_dochod1: TSmallintField;
    QEXP_U_fondzam1: TSmallintField;
    QEXP_U_zdrav2: TSmallintField;
    QEXP_U_nemoc2: TSmallintField;
    QEXP_U_dochod2: TSmallintField;
    QEXP_U_fondzam2: TSmallintField;
    QEXP_U_nezdc: TBooleanField;
    QEXP_F_dan_sadzba1: TFloatField;
    QEXP_F_dan_maximum1: TCurrencyField;
    QEXP_Fixny_mv_plat: TBooleanField;
    QPOI_: TQuery;
    QPOI_CALC_POISTNE: TCurrencyField;
    QPOI_CALC_CISLO_U: TStringField;
    QPOI_pocet: TIntegerField;
    QPOI_n_brutto: TCurrencyField;
    QPOI_f_poistne: TFloatField;
    QPOI_NAZOV: TStringField;
    QPOI_ADR_ULICA: TStringField;
    QPOI_ADR_MESTO: TStringField;
    QPOI_ADR_PSC: TStringField;
    QPOI_ICO: TStringField;
    QPOI_OKEC: TStringField;
    QPOI_PREDCISLO_U: TStringField;
    QPOI_CISLO_U: TStringField;
    QPOI_BANKA_U: TStringField;
    QPOI_SSYM_U: TStringField;
    QPOI_KSYM_U: TStringField;
    QEXP_F_poistne: TFloatField;
    TVYP_F_poistne: TFloatField;
    TVYP_F_nadcas: TFloatField;
    TVYP_F_sobota: TFloatField;
    TVYP_F_nedela: TFloatField;
    TVYP_F_sviatok: TFloatField;
    TVYP_F_noc: TFloatField;
    TVYP_F_skod: TFloatField;
    TVYP_F_typ_pripl: TSmallintField;
    TVYP_F_typ_premii: TSmallintField;
    QEXP_F_nadcas: TFloatField;
    QEXP_F_sobota: TFloatField;
    QEXP_F_nedela: TFloatField;
    QEXP_F_sviatok: TFloatField;
    QEXP_F_noc: TFloatField;
    QEXP_F_skod: TFloatField;
    QEXP_F_typ_pripl: TSmallintField;
    QEXP_F_typ_premii: TSmallintField;
    TVYP_F_sadzba_premii: TFloatField;
    TVYP_CALC_TEXT_PREMII: TStringField;
    TVYP_CALC_PRIPL_NADCAS: TStringField;
    TVYP_CALC_PRIPL_SOBOTA: TStringField;
    TVYP_CALC_PRIPL_NEDELA: TStringField;
    TVYP_CALC_PRIPL_SVIATOK: TStringField;
    TVYP_CALC_PRIPL_NOC: TStringField;
    TVYP_CALC_PRIPL_SKODP: TStringField;
    TZRV_: TTable;
    DS_ZRV: TDataSource;
    DS_ZRVG: TDataSource;
    TZRV_V_obdobie: TIntegerField;
    TZRV_Code_emp: TIntegerField;
    TZRV_ZRID: TAutoIncField;
    TZRV_Typ: TStringField;
    TZRV_Predcislo_u: TStringField;
    TZRV_Cislo_u: TStringField;
    TZRV_Banka_u: TStringField;
    TZRV_SSym_u: TStringField;
    TZRV_VSym: TStringField;
    TZRV_KSym: TStringField;
    TZRV_Spp: TStringField;
    TZRV_Suma: TCurrencyField;
    QZRV_: TQuery;
    QZRV_suma: TCurrencyField;
    QZRV_typ: TStringField;
    TZRV_Poznamka: TStringField;
    TZRV_Prijemca: TStringField;
    TVYP_N_socfond: TCurrencyField;
    TVYP_D_ciastzd2: TCurrencyField;
    TVYP_D_zdanmzda2: TCurrencyField;
    TVYP_D_vyrovnanie: TCurrencyField;
    TVYP_N_zaklad_zp: TCurrencyField;
    TVYP_N_zaklad_dp: TCurrencyField;
    TVYP_N_zaklad_np: TCurrencyField;
    TVYP_N_zaklad_fz: TCurrencyField;
    TVYP_Verzia: TSmallintField;
    TVYP_N_clenovia_organov: TCurrencyField;
    TVYP_Ne_stravne: TCurrencyField;
    TVYP_CALC_V_DEN_HOD: TStringField;
    TVYP_CALC_V_FMES_HOD: TStringField;
    TVYP_CALC_HOD_ROZDIEL: TStringField;
    TVYP_N_odstupne: TCurrencyField;
    TVYP_N_pohotovost: TCurrencyField;
    TVYP_D_ciastzd1: TCurrencyField;
    TVYP_D_zdanmzda1: TCurrencyField;
    TVYP_D_preddavok1: TCurrencyField;
    TVYP_D_ciastzd3: TCurrencyField;
    TVYP_D_zdanmzda3: TCurrencyField;
    TVYP_D_preddavok3: TCurrencyField;
    TVYP_N_jednoraz1: TCurrencyField;
    TVYP_V_maxobd1: TIntegerField;
    TVYP_N_jednoraz2: TCurrencyField;
    TVYP_V_maxobd2: TIntegerField;
    TVYP_F_firma_zps: TBooleanField;
    QPRY1_: TQuery;
    QPRY1_pridavok: TCurrencyField;
    QPRY2_: TQuery;
    QPRY2_pridavok: TCurrencyField;
    TVYP_N_poist3: TCurrencyField;
    TVYP_V_mesiace1: TSmallintField;
    TVYP_V_mesiace2: TSmallintField;
    TVYP_N_poist1: TCurrencyField;
    QPRX_max_v_priemer2: TCurrencyField;
    QPRX_max_v_priemer1: TCurrencyField;
    QVYP_F_sadzba_premii: TFloatField;
    TVYP_ZTP: TBooleanField;
    TVYP_ZPS1: TBooleanField;
    TVYP_Vh_nahrada: TFloatField;
    TVYP_N_nahrada: TCurrencyField;
    TVYP_Zvys_ostatne: TCurrencyField;
    TVYP_Dopravne_mimoriadne: TCurrencyField;
    TVYP_U_dopravne_mimoriadne: TBooleanField;
    TVYP_Automatika: TBooleanField;
    THSV_N_dohody_ovp: TCurrencyField;
    THSV_N_dohody_opc: TCurrencyField;
    QVYP_N_dohody_ovp: TCurrencyField;
    QVYP_N_dohody_opc: TCurrencyField;
    THSV_Priznak_uctovat: TStringField;
    TVYP_F_typ_pripl2: TSmallintField;
    TVYP_F_priplat1: TFloatField;
    TVYP_F_priplat2: TFloatField;
    TVYP_F_priplat3: TFloatField;
    TVYP_F_priplat4: TFloatField;
    TVYP_Vh_priplat1: TFloatField;
    TVYP_Vh_priplat2: TFloatField;
    TVYP_Vh_priplat3: TFloatField;
    TVYP_Vh_priplat4: TFloatField;
    TVYP_Vp_priplat1: TCurrencyField;
    TVYP_Vp_priplat2: TCurrencyField;
    TVYP_Vp_priplat3: TCurrencyField;
    TVYP_Vp_priplat4: TCurrencyField;
    TVYP_CALC_PRIPL1: TStringField;
    TVYP_CALC_PRIPL2: TStringField;
    TVYP_CALC_PRIPL3: TStringField;
    TVYP_CALC_PRIPL4: TStringField;
    TVYP_Vh_priplat5: TFloatField;
    TVYP_Vp_priplat5: TCurrencyField;
    TVYP_F_priplat5: TFloatField;
    TVYP_CALC_PRIPL5: TStringField;
    TVYP_V_ocr1: TFloatField;
    TVYP_V_ocr2: TFloatField;
    TVYP_N_ocr1: TCurrencyField;
    TVYP_N_ocr2: TCurrencyField;
    TVYP_N_pn: TCurrencyField;
    TVYP_V_ocr12: TFloatField;
    TVYP_U_sviatky: TBooleanField;
    THSV_V_pn1: TSmallintField;
    THSV_V_pn2: TSmallintField;
    THSV_V_ocr1: TFloatField;
    THSV_V_ocr2: TFloatField;
    QVYP_V_pn1: TSmallintField;
    QVYP_V_pn2: TSmallintField;
    QVYP_V_ocr1: TFloatField;
    QVYP_V_ocr2: TFloatField;
    THSV_CALC_DNI_PN: TIntegerField;
    THSV_CALC_DNI_OCR: TFloatField;
    TVYP_V_materska: TFloatField;
    TVYP_Nd_rodic: TCurrencyField;
    TVYP_U_materska: TBooleanField;
    TVYP_U_rodic: TBooleanField;
    TVYP_N_ddp: TCurrencyField;
    TVYP_Fz_garfond: TFloatField;
    QHSV1_: TQuery;
    QHSV2_: TQuery;
    QHSV1_V_den: TFloatField;
    QHSV1_V_sviatok: TSmallintField;
    QHSV1_V_holiday: TFloatField;
    QHSV1_V_pn1: TSmallintField;
    QHSV1_V_pn2: TSmallintField;
    QHSV1_V_ocr1: TFloatField;
    QHSV1_V_ocr2: TFloatField;
    QHSV1_F_sadzba_premii: TFloatField;
    QHSV1_N_odmeny: TCurrencyField;
    QHSV1_N_dohody_ovp: TCurrencyField;
    QHSV1_N_dohody_opc: TCurrencyField;
    QHSV1_MV_plat: TCurrencyField;
    QHSV1_Code_emp: TIntegerField;
    QHSV1_Ne_zaloha: TCurrencyField;
    QHSV2_code_emp: TIntegerField;
    QHSV2_name: TStringField;
    QHSV2_surname: TStringField;
    QHSV2_title: TStringField;
    QHSV1_surname: TStringField;
    QHSV1_name: TStringField;
    QHSV1_title: TStringField;
    QHSV1_V_hodina: TFloatField;
    THSV_Vh_nadcas: TFloatField;
    THSV_Vh_sobota: TFloatField;
    THSV_Vh_nedela: TFloatField;
    THSV_Vh_sviatok: TFloatField;
    THSV_Vh_noc: TFloatField;
    THSV_Vh_skod: TFloatField;
    THSV_Vh_priplat1: TFloatField;
    THSV_Vh_priplat2: TFloatField;
    THSV_Vh_priplat3: TFloatField;
    THSV_Vh_priplat4: TFloatField;
    THSV_Vh_priplat5: TFloatField;
    QHSV1_vh_nadcas: TFloatField;
    QHSV1_vh_sobota: TFloatField;
    QHSV1_vh_nedela: TFloatField;
    QHSV1_vh_sviatok: TFloatField;
    QHSV1_vh_noc: TFloatField;
    QHSV1_vh_skod: TFloatField;
    QHSV1_vh_priplat1: TFloatField;
    QHSV1_vh_priplat2: TFloatField;
    QHSV1_vh_priplat3: TFloatField;
    QHSV1_vh_priplat4: TFloatField;
    QHSV1_vh_priplat5: TFloatField;
    QPRX_pocet: TIntegerField;
    TVYP_PRHRMEZA: TCurrencyField;
    QPRX_sum_n_mzda2: TCurrencyField;
    TZRV_Typ_sumy: TSmallintField;
    QZRV_typ_sumy: TSmallintField;
    QZRV_vypocitana_suma: TCurrencyField;
    TZRV_Vypocitana_suma: TCurrencyField;
    TZRV_CALC_VYP_SUMA: TCurrencyField;
    TVYP_Vh_nemohol: TFloatField;
    TVYP_N_nemohol: TCurrencyField;
    TVYP_Dan_nerezident: TBooleanField;
    TZRV_CALC_TEXT_ZRAZKY: TStringField;
    TVYP_F_typ_ulavy_sp: TSmallintField;
    TVYP_F_typ_ulavy_fz: TSmallintField;
    TVYP_Cista_denna_mzda: TCurrencyField;
    TVYP_N_oslobodeny: TCurrencyField;
    QPRX_max_prhrmeza: TCurrencyField;
    TVYP_N_nadcas: TCurrencyField;
    TVYP_Nd_rucne: TBooleanField;
    TRZP_Uhrn_nepenaznych: TCurrencyField;
    TRZP_Nedoplatok_nepenaznych: TCurrencyField;
    TCUK_: TTable;
    TZUK_: TTable;
    THSU_: TTable;
    TCUK_UKID: TSmallintField;
    TCUK_POPIS: TStringField;
    TCUK_HODNOTA: TCurrencyField;
    TZUK_Code_emp: TIntegerField;
    TZUK_UKID: TSmallintField;
    TZUK_HODNOTA: TCurrencyField;
    THSU_V_obdobie: TIntegerField;
    THSU_Code_emp: TIntegerField;
    THSU_Pocet: TFloatField;
    THSU_Suma1: TCurrencyField;
    THSU_Suma: TCurrencyField;
    TZUK_CALC_POPIS: TStringField;
    DS_HSU: TDataSource;
    QHSU1_: TQuery;
    QHSU1_code_numb: TIntegerField;
    QHSU1_code_emp: TIntegerField;
    QHSU1_pocet: TFloatField;
    QHSU1_hodnota: TCurrencyField;
    QHSU1_suma: TFloatField;
    QHSU2_: TQuery;
    QHSU2_v_obdobie: TFloatField;
    QHSU2_code_emp: TIntegerField;
    QHSU2_ukid: TSmallintField;
    QHSU2_pocet: TFloatField;
    QHSU2_hodnota: TCurrencyField;
    QHSU2_suma: TFloatField;
    TRZP_Uhrn_brutto: TCurrencyField;
    TRZP_Uhrn_osobitna: TCurrencyField;
    TRZP_Dan_osobitna: TCurrencyField;
    TRZP_Poistne: TCurrencyField;
    TRZP_DDP: TCurrencyField;
    TRZP_Uhrn_nepen2: TCurrencyField;
    TRZP_Nedoplatok_nepen2: TCurrencyField;
    QRZP_n_poist: TCurrencyField;
    QRZP_n_ddp: TCurrencyField;
    QRZP_n_brutto: TCurrencyField;
    QRZP_d_dan: TCurrencyField;
    TVYP_N_sadzba_ddp: TFloatField;
    TVYP_Nz_ddp: TCurrencyField;
    TVYP_Nz_sadzba_ddp: TFloatField;
    TVYP_KDP: TSmallintField;
    TVYP_N_ukolova: TCurrencyField;
    DS_CUK: TDataSource;
    QHSU1_ukid: TSmallintField;
    QHSU1_v_obdobie: TFloatField;
    DS_HSUG: TDataSource;
    QHSU3_: TQuery;
    QHSU3_suma: TCurrencyField;
    QHSU4_: TQuery;
    QHSU4_hodnota: TCurrencyField;
    QPRX_sum_dni: TFloatField;
    QPRX_sum_odm_pre: TCurrencyField;
    QPRX_sum_nadcas: TCurrencyField;
    QRZP_d_osobitna: TCurrencyField;
    QDDP1_: TQuery;
    QDDP1_kdp: TSmallintField;
    QDDP1_n_ddp: TCurrencyField;
    QDDP1_nz_ddp: TCurrencyField;
    TVYP_F_invalid: TFloatField;
    TVYP_Fz_invalid: TFloatField;
    TVYP_Fz_uraz: TFloatField;
    TVYP_Fz_rezerva: TFloatField;
    TVYP_N_zaklad_up: TCurrencyField;
    TVYP_Oz_zdravot: TCurrencyField;
    TVYP_Oz_nemoc: TCurrencyField;
    TVYP_Oz_dochod: TCurrencyField;
    TVYP_Oz_fondzam: TCurrencyField;
    TVYP_O_invalid: TCurrencyField;
    TVYP_Oz_invalid: TCurrencyField;
    TVYP_Oz_uraz: TCurrencyField;
    TVYP_Oz_rezerva: TCurrencyField;
    TVYP_Oz_garancne: TCurrencyField;
    TVYP_U_invalid: TSmallintField;
    TVYP_U_uraz: TSmallintField;
    TVYP_U_rezerva: TSmallintField;
    TVYP_U_garancne: TSmallintField;
    TVYP_N_zaklad_ip: TCurrencyField;
    TVYP_N_zaklad_gp: TCurrencyField;
    TVYP_N_zaklad_rf: TCurrencyField;
    TVYP_Poc_nezaop_deti: TSmallintField;
    TVYP_V_nahrada_pn1: TSmallintField;
    TVYP_V_nahrada_pn2: TSmallintField;
    TVYP_N_nahrada_pn: TCurrencyField;
    TVYP_D_bonus_predpis: TCurrencyField;
    TVYP_D_bonus_cerpany: TCurrencyField;
    TVYP_VYNIMKA_VZ: TStringField;
    TVYP_V_nepl_volno: TSmallintField;
    TVYP_V_nepoisteny: TSmallintField;
    TVYP_V_uraz: TSmallintField;
    TVYP_N_mimo_poistne: TCurrencyField;
    TVYP_CALC_DAN: TCurrencyField;
    TVYP_CALC_KAL_DNI: TIntegerField;
    QCDM_: TQuery;
    TVYP_V_kal_dni: TSmallintField;
    QCDM_n_zaklad_np: TCurrencyField;
    QCDM_v_pn: TFloatField;
    QCDM_v_kal_dni: TFloatField;
    DS_CDM: TDataSource;
    QCDM_code_emp: TIntegerField;
    TZUK_Code_numb: TIntegerField;
    QCDM_v_ocr12: TFloatField;
    THSU_HSUID: TAutoIncField;
    THSU_UKID: TIntegerField;
    THSU_LKP_POPIS_UKONU: TStringField;
    THSU_Code_numb: TIntegerField;
    THSV_Code_numb: TIntegerField;
    QHSV1_code_numb: TIntegerField;
    QHSV2_code_numb: TIntegerField;
    QHSU2_code_numb: TIntegerField;
    QRZP_d_bonus_narok: TCurrencyField;
    QRZP_d_bonus_cerpany: TCurrencyField;
    TRZP_D_bonus_narok: TCurrencyField;
    TRZP_D_bonus_cerpany: TCurrencyField;
    TRZP_CALC_BONUS_PREPL: TCurrencyField;
    TRZP_CALC_BONUS_NEDOPL: TCurrencyField;
    TRZP_CALC_DAN_PREPL: TCurrencyField;
    TRZP_CALC_DAN_NEDOPL: TCurrencyField;
    TRZP_CALC_BB_PREPL: TCurrencyField;
    TRZP_CALC_BB_NEDOPL: TCurrencyField;
    TVYP_Miera_poklesu: TFloatField;
    QPPP_: TQuery;
    TVYP_N_prijem_zp: TCurrencyField;
    QCDM_v_nahrada_pn: TFloatField;
    DS_ZUK: TDataSource;
    TRZP_Nc_ucelove_sporenie: TCurrencyField;
    TRZP_Nc_zivotne_poistenie: TCurrencyField;
    TRZP_Nc_do_limitu: TCurrencyField;
    TVYP_U_sds: TSmallintField;
    TVYP_V_nepoist_zp: TSmallintField;
    TVYP_Version: TStringField;
    TVYP_Vyrovnanie_zp: TCurrencyField;
    TVYP_Rezerva1: TCurrencyField;
    QRZP07_: TQuery;
    QRZP07_d_ciastzd: TCurrencyField;
    QRZP07_d_preddavok: TCurrencyField;
    QRZP07_nc_minimum: TCurrencyField;
    QRZP07_nc_deti: TCurrencyField;
    QRZP07_nc_ine: TCurrencyField;
    QRZP07_n_poist: TCurrencyField;
    QRZP07_n_ddp: TCurrencyField;
    QRZP07_n_brutto: TCurrencyField;
    QRZP07_d_osobitna: TCurrencyField;
    QRZP07_d_dan: TCurrencyField;
    QRZP07_d_bonus_narok: TCurrencyField;
    QRZP07_d_bonus_cerpany: TCurrencyField;
    QRZP07_vyrovnanie_zp: TCurrencyField;
    TVYP_Rezerva2: TCurrencyField;
    TVYP_Rezerva3: TCurrencyField;
    TRZP_Nc_minimum_upravena: TCurrencyField;
    TRZP_Nc_partner_upravena: TCurrencyField;
    TRZP_Nc_minimum_dochodok: TCurrencyField;
    TRZP_Nc_partner_prijem: TCurrencyField;
    TRZP_Nc_partner_mesiacov: TSmallintField;
    TRZP_Uplatnuje_Nc_minimum: TBooleanField;
    TRZP_Uplatnuje_Nc_partner: TBooleanField;
    TRZP_Zdravotnici_vzdelavanie: TCurrencyField;
    TRZP_Premia_zaklad: TCurrencyField;
    TRZP_Premia_mesiacov: TSmallintField;
    TRZP_Premia_suma: TCurrencyField;
    TRZP_Zdravotnici_zvysenie: TCurrencyField;
    TRZP_CALC_NEU_PREPL: TCurrencyField;
    TRZP_CALC_NEU_NEDOPL: TCurrencyField;
    TRZP_Premia_narok: TBooleanField;
    TRZP_Premia_manualne: TBooleanField;
    TVYPNP_: TTable;
    DS_VYPNP: TDataSource;
    DS_VYPNPG: TDataSource;
    QVYPNP_: TQuery;
    QVYPNP_n_prijem: TCurrencyField;
    QVYPNP_n_poist3: TCurrencyField;
    QNPMEM_: TQuery;
    TVYPNP_Code_emp: TIntegerField;
    TVYPNP_V_obdobie_vyp: TIntegerField;
    TVYPNP_V_mesiac_vyp: TSmallintField;
    TVYPNP_V_obdobie: TIntegerField;
    TVYPNP_Kal_dni: TSmallintField;
    TVYPNP_N_prijem: TCurrencyField;
    TVYPNP_N_zaklad_dp: TCurrencyField;
    TVYPNP_N_zaklad_np: TCurrencyField;
    TVYPNP_N_zaklad_fz: TCurrencyField;
    TVYPNP_N_zaklad_ip: TCurrencyField;
    TVYPNP_N_zaklad_up: TCurrencyField;
    TVYPNP_N_zaklad_rf: TCurrencyField;
    TVYPNP_N_zaklad_gp: TCurrencyField;
    TVYPNP_O_dp: TCurrencyField;
    TVYPNP_O_np: TCurrencyField;
    TVYPNP_O_fz: TCurrencyField;
    TVYPNP_O_ip: TCurrencyField;
    TVYPNP_O_up: TCurrencyField;
    TVYPNP_O_rf: TCurrencyField;
    TVYPNP_O_gp: TCurrencyField;
    TVYPNP_Oz_dp: TCurrencyField;
    TVYPNP_Oz_np: TCurrencyField;
    TVYPNP_Oz_fz: TCurrencyField;
    TVYPNP_Oz_ip: TCurrencyField;
    TVYPNP_Oz_up: TCurrencyField;
    TVYPNP_Oz_rf: TCurrencyField;
    TVYPNP_Oz_gp: TCurrencyField;
    TVYPNP_F_sadzba: TFloatField;
    TVYPNP_Fz_sadzba: TFloatField;
    QNPMEM_code_emp: TIntegerField;
    QNPMEM_V_obdobie_vyp: TIntegerField;
    QNPMEM_V_mesiac_vyp: TSmallintField;
    QNPMEM_v_obdobie: TIntegerField;
    QNPMEM_Kal_dni: TSmallintField;
    QNPMEM_N_prijem: TCurrencyField;
    QNPMEM_N_zaklad_dp: TCurrencyField;
    QNPMEM_N_zaklad_np: TCurrencyField;
    QNPMEM_N_zaklad_fz: TCurrencyField;
    QNPMEM_N_zaklad_ip: TCurrencyField;
    QNPMEM_N_zaklad_up: TCurrencyField;
    QNPMEM_N_zaklad_rf: TCurrencyField;
    QNPMEM_N_zaklad_gp: TCurrencyField;
    QNPMEM_O_dp: TCurrencyField;
    QNPMEM_O_np: TCurrencyField;
    QNPMEM_O_fz: TCurrencyField;
    QNPMEM_O_ip: TCurrencyField;
    QNPMEM_O_up: TCurrencyField;
    QNPMEM_O_rf: TCurrencyField;
    QNPMEM_O_gp: TCurrencyField;
    QNPMEM_Oz_dp: TCurrencyField;
    QNPMEM_Oz_np: TCurrencyField;
    QNPMEM_Oz_fz: TCurrencyField;
    QNPMEM_Oz_ip: TCurrencyField;
    QNPMEM_Oz_up: TCurrencyField;
    QNPMEM_Oz_rf: TCurrencyField;
    QNPMEM_Oz_gp: TCurrencyField;
    QNPMEM_F_sadzba: TFloatField;
    QNPMEM_Fz_sadzba: TFloatField;
    QRZP_o_zdravot: TCurrencyField;
    TRZP_CALC_TOTAL_PREPL: TCurrencyField;
    TRZP_CALC_TOTAL_NEDOPL: TCurrencyField;
    TRZP_CALC_BONUS_ZNIZ: TCurrencyField;
    TVYP_Typzec: TSmallintField;
    TVYP_PocDniStrajku: TSmallintField;
    TVYP_PoSkonceni: TBooleanField;
    TVYP_CALC_TYPZEC: TStringField;
    TRZP_Uhrn_prijmov_dohody: TCurrencyField;
    QRZP12_: TQuery;
    QRZP12_n_dohody: TCurrencyField;
    TVYP_Zniz_ostatne: TCurrencyField;
    TVYP_CALC_Label_Odmeny: TStringField;
    QRZP07_o_zdravot: TCurrencyField;
    TANK_: TTable;
    DS_ANK: TDataSource;
    TANK_Code_emp: TIntegerField;
    TANK_V_obdobie: TIntegerField;
    TANK_Cis_zakazky: TStringField;
    TANK_Cis_kvotneho_listu: TStringField;
    TANK_Dohoda_id: TIntegerField;
    TANK_SID: TSmallintField;
    TZRV_IBAN: TStringField;
    TVYPNP_PocDniStrajku: TSmallintField;
    TVYPNP_PocDniObdobia: TSmallintField;
    TVYPNP_VylucDobyObdobieOd: TDateField;
    TVYPNP_VylucDobyObdobieDo: TDateField;
    TVYPNP_VylucDobyTrva: TBooleanField;
    QCDM1_: TQuery;
    QCDM1_code_emp: TIntegerField;
    QCDM1_dni_pn: TFloatField;
    QVYPNP_oz_spolu: TCurrencyField;
    procedure DS_VYPLStateChange(Sender: TObject);
    procedure DMVCreate(Sender: TObject);
    procedure TVYP_BeforeInsert(DataSet: TDataSet);
    procedure TVYP_BeforeDelete(DataSet: TDataSet);
    procedure TVYP_CalcFields(DataSet: TDataSet);
    procedure TVYP_NewRecord(DataSet: TDataSet);
    procedure TVYP_BeforePost(DataSet: TDataSet);
    procedure TRZP_NewRecord(DataSet: TDataSet);
    procedure TRZP_AfterInsert(DataSet: TDataSet);
    procedure TRZP_BeforePost(DataSet: TDataSet);
    procedure DS_RZPStateChange(Sender: TObject);
    procedure TRZP_CalcFields(DataSet: TDataSet);
    procedure TRZP_BeforeDelete(DataSet: TDataSet);
    procedure TRZP_BeforeInsert(DataSet: TDataSet);
    procedure THSV_BeforeInsert(DataSet: TDataSet);
    procedure HSV_Validate(Sender: TField);
    procedure Kontrola_desatinnej_casti(Sender: TField);
    procedure QPOI_CalcFields(DataSet: TDataSet);
    procedure DS_ZRVStateChange(Sender: TObject);
    procedure TZRV_NewRecord(DataSet: TDataSet);
    procedure Predcislo_validate(Sender: TField);
    procedure Cislouctu_validate(Sender: TField);
    procedure TZRV_TypValidate(Sender: TField);
    procedure TVYP_F_typ_premiiValidate(Sender: TField);
    procedure TVYP_U_poistenieValidate(Sender: TField);
    procedure TVYP_U_poistenie2Validate(Sender: TField);
    procedure THSV_Priznak_uctovatValidate(Sender: TField);
    procedure THSV_CalcFields(DataSet: TDataSet);
    procedure TVYP_BeforeEdit(DataSet: TDataSet);
    procedure TVYP_BeforeCancel(DataSet: TDataSet);
    procedure TZRV_BeforeEdit(DataSet: TDataSet);
    procedure TZRV_BeforeInsert(DataSet: TDataSet);
    procedure TZRV_CalcFields(DataSet: TDataSet);
    procedure TVYP_AfterPost(DataSet: TDataSet);
    procedure TVYP_AfterCancel(DataSet: TDataSet);
    procedure TVYP_AfterDelete(DataSet: TDataSet);
    procedure DS_VGRIDDataChange(Sender: TObject; Field: TField);
    procedure TZRV_BeforePost(DataSet: TDataSet);
    procedure THSV_BeforePost(DataSet: TDataSet);
    procedure TCUK_BeforeInsert(DataSet: TDataSet);
    procedure TZUK_NewRecord(DataSet: TDataSet);
    procedure sucet_vykonu(Sender: TField);
    procedure TRZP_BeforeEdit(DataSet: TDataSet);
    procedure THSU_BeforeInsert(DataSet: TDataSet);
    procedure DS_HSUStateChange(Sender: TObject);
    procedure THSU_BeforeEdit(DataSet: TDataSet);
    procedure THSU_NewRecord(DataSet: TDataSet);
    procedure THSU_UKIDChange(Sender: TField);
    procedure TZUK_BeforeInsert(DataSet: TDataSet);
    procedure TZUK_BeforeDelete(DataSet: TDataSet);
    procedure TCUK_BeforeDelete(DataSet: TDataSet);
    procedure TCUK_PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure TZUK_PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure TVYP_VYNIMKA_VZValidate(Sender: TField);
    procedure TVYP_V_nepoistenyValidate(Sender: TField);
    procedure TVYPNP_NewRecord(DataSet: TDataSet);
    procedure TVYPNP_BeforePost(DataSet: TDataSet);
    procedure TVYPNP_AfterPost(DataSet: TDataSet);
    procedure TVYPNP_V_mesiac_vypChange(Sender: TField);
    procedure TVYPNP_PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
    BoliZmenyNepravidelnehoPrijmu: boolean;
    INSERT_HSV: boolean;
    UCTUJ_HSV: boolean;
    UCTUJ_MDB: boolean;
    POCET_HSV: integer;
    ZRAZKY_P,ZRAZKY_O,ZRAZKY_Y,ZRAZKY_X,ZRAZKY_S:double;
    LAST_CODE_EMP:longint;
    LAST_V_OBDOBIE:longint;
    ZMENY_OK:boolean;
    function  POCET_VYPLAT_ZAM(xCode_emp:integer):longint;
    function  POCET_VYPLAT_MES(xObdobie:longint):longint;
    function  EXISTUJE_VYPLATA
              (xCode_emp,xV_rok,xV_mesiac:integer):boolean;
    function  NAJDI_VYPLATU
              (xCode_emp,xV_rok,xV_mesiac:integer):boolean;
    procedure VYPL_OTVOR_QUERY;
    procedure VYPL_ZATVOR_QUERY;
    function  VYPL_PRIEMER1(xCode_emp:integer;xObdobie1,xObdobie2:longint;xPrvy:boolean):double;
    function  VYPL_PRIEMER3(xCode_emp:integer;xObdobie1,xObdobie2:longint;xAktRok:boolean):double;
    function  GET_FMES(M:byte):byte;
    function  GET_FSVIAT(M:byte):byte;
    procedure SET_V_PRIEMER1;
    procedure SET_V_PRIEMER3;
    procedure SET_V_FMES;
    procedure SET_V_PLAT;
    procedure SET_UPRAV_PRIEMERY;
    procedure SET_N_NAHRADA;
    procedure SET_N_HOLIDAY;
    procedure SET_N_SVIATOK;
    procedure SET_N_PREMIE;
    procedure SET_N_MZDA;
    procedure SET_POMOCNE;
    procedure SET_N_BRUTTO;
    procedure SET_CISTA_DENNA_MZDA;
    procedure SET_N_PN;
    procedure SET_N_PRIPLAT;
    procedure SET_ODVODY_ZAKLAD;
    procedure SET_ODVODY;
    procedure SET_D_CIASTZD;
    procedure SET_NC_SPOLU;
    procedure SET_D_ZDANMZDA;
    procedure SET_DANE;
    procedure SET_N_NETTO;
    procedure SET_ZRAZKY;
    procedure SET_VYPLATA;
    procedure SET_ALL;
    procedure SET_ALL_VYPNP;
    procedure SET_FROM_SETUP;
    procedure SET_RZP;
    procedure PRIPRAV_HSV;
    procedure ZAUCTUJ_HSV;
    procedure PRIPRAV_HSU;
    procedure NACITAJ_HSU;
    function  GET_POISTENIE(Par_mes,Par_rok:integer): double;
    procedure ZISTI_ZRAZKY;
    procedure ZISTI_VYKONY;
    procedure PRENES_ZRAZKY_ZO_ZAMESTNANCA;
    procedure PRENES_VYKONY_ZO_ZAMESTNANCA;
    procedure AKTUALIZUJ_VYPLATY(iTyp:integer);
    procedure ROZDEL_DAN;
    function  POM_POISTNE(Z: double):double;
    function  POM_DAN(Z: double):double;
    function  PCDZ(PRHRMEZA:double):double;
    //PCDZ = Priemerny cisty denny zarobok
    //PHMZ = Priemerny hruby mesacny zarobok
    function  VYSKA_ZRAZKY(nSuma:double;nTypSumy:integer):double;
    procedure Kontrola_Datumu_Uzav;
    procedure Kontrola_Zmien(T:TTable;const ErrMsg:string;bAbort:boolean);
    procedure Nastav_Cistu_Dennu_Mzdu(iRok:integer);
    procedure Zauctuj_RZP_Do_Vyplaty;
    procedure Zauctuj_RZZP_Do_Vyplaty;
    function  Zvyhodneny_ZP(iMiera:double; iObdobie:longint; iZTP:boolean):boolean;
    procedure NepravidelnyPrijem_Restore;
    procedure NepravidelnyPrijem_Backup;
    procedure NepravidelnyPrijem_Zmena;
end;

  procedure Nacitaj_Milionarsku_Dan;
  procedure Nacitaj_Kompatibilitu;
  procedure Nacitaj_Texty;
  procedure Nacitaj_BLAT;
  function MESACNA_DAN_BEZ_ZAOKRUH(Zaklad:double): double;
  function MESACNA_DAN(Zaklad:double;iObdobie:longint): double;
  function ROCNA_DAN(Zaklad:double;IbaPreddavok:boolean): double;


var
  DMV: TDMV;
  MD: TMilionarskaDan;
  KOMP_PRIPL: integer;
  T1: TTable;

implementation

uses Dm_zam, Dm_main, MyConsts, Dm_ppv, DM_sql, FmxUtils, Main;

{$R *.DFM}

function TMilionarskaDan.ZVYS_MESACNU_DAN(Z:double):double;
var i:integer;
begin
  Result:=Z;
  if pocet=0 then exit;
  for i:=pocet downto 1 do
  begin
    if Z>=pasmo[i]/12 then
    begin
      Result:=Z+(Z*sadzba[i]/100);
      exit;
    end;
  end;
end;

function TMilionarskaDan.ZVYS_ROCNU_DAN(Z:double):double;
var i:integer;
begin
  Result:=Z;
  if pocet=0 then exit;
  for i:=pocet downto 1 do
  begin
    if Z>=pasmo[i] then
    begin
      Result:=Z+Z*sadzba[i]/100;
      exit;
    end;
  end;
end;

function TDMV.Zvyhodneny_ZP(iMiera:double; iObdobie:longint; iZTP:boolean):boolean;
begin
  Result := (iMiera >= PARAMETRE[29].Hodnota) or ((iObdobie >= ZAKON_2005_09) and iZTP);
end;

function TDMV.POCET_VYPLAT_ZAM(xCode_emp:integer):longint;
begin
  if QPOCZ_.Active then QPOCZ_.Close;
  QPOCZ_.ParamByName('P1').AsInteger := xCode_emp;
  QPOCZ_.Open;
  Result:=QPOCZ_Pocet.Value;
  QPOCZ_.Close;
end;

function TDMV.POCET_VYPLAT_MES(xObdobie:longint):longint;
begin
  if QPOCM_.Active then QPOCM_.Close;
  QPOCM_.ParamByName('P1').AsInteger := xObdobie;
  QPOCM_.Open;
  Result:=QPOCM_Pocet.Value;
  QPOCM_.Close;
end;

function TDMV.EXISTUJE_VYPLATA
(xCode_emp,xV_rok,xV_mesiac:integer):boolean;
begin
  Result:=NAJDI_VYPLATU(xCode_emp,xV_rok,xV_mesiac);
  VYPL_ZATVOR_QUERY;
end;

function TDMV.NAJDI_VYPLATU
(xCode_emp,xV_rok,xV_mesiac:integer):boolean;
begin
  if QVYP_.Active then QVYP_.Close;
  QVYP_.ParamByName('P1').AsInteger := xCode_emp;
  QVYP_.ParamByName('P2').AsInteger := xV_rok;
  QVYP_.ParamByName('P3').AsInteger := xV_mesiac;
  VYPL_OTVOR_QUERY;
  Result:=QVYP_.Active AND (QVYP_.RecordCount=1);
end;

procedure TDMV.VYPL_OTVOR_QUERY;
begin
  QVYP_.Open;
end;

procedure TDMV.VYPL_ZATVOR_QUERY;
begin
  if QVYP_.Active then QVYP_.Close;
end;

function TDMV.VYPL_PRIEMER1
(xCode_emp:integer;xObdobie1,xObdobie2:longint;xPrvy:boolean):double;
begin
  try
  {}
  if QPRX_.Active then QPRX_.Close;
  if (xObdobie1 div 100) <> DM.AktRok
  then QPRX_.DatabaseName := 'PAM98_DATX'
  else QPRX_.DatabaseName := 'PAM98_DATA';
  QPRX_.ParamByName('P1').AsInteger := xCode_emp;
  QPRX_.ParamByName('P2').AsInteger := xObdobie1;
  QPRX_.ParamByName('P3').AsInteger := xObdobie2;
  QPRX_.Open;
  {}
  if TVYP_V_obdobie.Value < Zakon_2001_01 then
  begin
    if QPRY1_.Active then QPRY1_.Close;
    QPRY1_.ParamByName('P1').AsInteger := xCode_emp;
    QPRY1_.ParamByName('P2').AsInteger := xObdobie1;
    QPRY1_.ParamByName('P3').AsInteger := xObdobie2;
    {}
    if QPRY2_.Active then QPRY2_.Close;
    QPRY2_.ParamByName('P1').AsInteger := xCode_emp;
    QPRY2_.ParamByName('P2').AsInteger := xObdobie1;
    QPRY2_.ParamByName('P3').AsInteger := xObdobie2;
    {}
    QPRY1_.Open;
    QPRY2_.Open;
  end;
  {}
  if xPrvy then begin
    if xObdobie1=200810 then
    Result:= ZAOKRUHLI(QPRX_MAX_V_PRIEMER1.Value/KonvKurzEuro,-4,2)
    else
    Result:= QPRX_MAX_V_PRIEMER1.Value
  end
  else begin
    if TVYP_V_obdobie.Value < Zakon_2001_01 then
      Result:= ( QPRX_SUM_N_MZDA.Value +
                 QPRY1_PRIDAVOK.Value +
                 QPRY2_PRIDAVOK.Value
               ) / QPRX_SUM_HODINA.Value
    else begin
      if xObdobie1 = 200810 then
        Result:= ZAOKRUHLI(QPRX_SUM_N_MZDA.Value  / QPRX_SUM_HODINA.Value
                      / KonvKurzEuro,-4,2)
      else
        Result:= QPRX_SUM_N_MZDA.Value  / QPRX_SUM_HODINA.Value;
    end
  end;
  except
  Result:=0;
  end;
  if QPRX_.Active then QPRX_.Close;
  if QPRY1_.Active then QPRY1_.Close;
  if QPRY2_.Active then QPRY2_.Close;
end;

function TDMV.VYPL_PRIEMER3
  (xCode_emp:integer;xObdobie1,xObdobie2:longint;xAktRok:boolean):double;
var pom:double;
begin
  try
  if QPRX_.Active then QPRX_.Close;
  if xObdobie1<200901
    then QPRX_.Databasename := 'PAM98_DATX'
    else QPRX_.Databasename := 'PAM98_DATA';
  QPRX_.ParamByName('P1').AsInteger := xCode_emp;
  QPRX_.ParamByName('P2').AsInteger := xObdobie1;
  QPRX_.ParamByName('P3').AsInteger := xObdobie2;
  QPRX_.Open;
  if QPRX_Pocet.Value = 0 then Result := 0
  else if (xAktRok) and (QPRX_MAX_PRHRMEZA.Value>0) then Result:= QPRX_MAX_PRHRMEZA.Value
  else if TVYP_MV_plat.Value>0 then
   begin
     pom:=ZAOKRUHLI(QPRX_SUM_ODM_PRE.Value/QPRX_SUM_DNI.Value * PriemernyPocetDni
          ,0,0);
     Result := TVYP_MV_Plat.Value + pom;
  end
  else
    Result:= ZAOKRUHLI(
         (QPRX_SUM_N_MZDA2.Value - QPRX_SUM_NADCAS.Value)
          /QPRX_SUM_DNI.Value*PriemernyPocetDni
         ,0,0);
  except
  Result:=0;
  end;
  if QPRX_.Active then QPRX_.Close;
end;

procedure TDMV.DS_VYPLStateChange(Sender: TObject);
begin with DM,DMZ do begin
  if TVYP_.State in [dsInsert,dsEdit] then
  begin
    DS_VGRID.Enabled := False;
    DMZ.DS_ZAMF.Enabled := False;
  end else begin
    DS_VGRID.Enabled := True;
    DMZ.DS_ZAMF.Enabled := True;
  end;
end;end;

procedure TDMV.SET_V_PRIEMER1;
var M_OD,M_DO,OBDOBIE1,OBDOBIE2:Longint;
begin with DM,DMZ,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  M_DO:=TVYP_V_ROK.AsInteger*12+TVYP_V_MESIAC.AsInteger-1;
  M_DO:=(M_DO div 3)*3-1;
  M_OD:=M_DO-3+1;
  OBDOBIE1:= M_OD div 12 * 100 + (M_OD mod 12)+1;
  OBDOBIE2:= M_DO div 12 * 100 + (M_DO mod 12)+1;
  TVYP_V_PRIEMER1.Value:=
    VYPL_PRIEMER1(TZAM_Code_emp.Value,OBDOBIE1,OBDOBIE2,FALSE);
  if (OBDOBIE2 = 200203) and MyOtazka('Zv˝öiù priemern˙ mzdu zamestnanca '+TZAM_TMP.Value+' vyn·sobenÌm koeficientom 1,0625 kÙli zmene fondu prac.Ëasu z 8,5 na 8 hodÌn ?') then
    TVYP_V_PRIEMER1.Value:=TVYP_V_PRIEMER1.Value / 8 * 8.5;
  if TVYP_V_PRIEMER1.Value=0 then begin
    M_DO:=TVYP_V_ROK.AsInteger*12+1-1;
    M_OD:=M_DO;
    OBDOBIE1:= M_OD div 12 * 100 + (M_OD mod 12)+1;
    OBDOBIE2:= M_DO div 12 * 100 + (M_DO mod 12)+1;
    TVYP_V_PRIEMER1.Value:=
      VYPL_PRIEMER1(TZAM_Code_emp.Value,OBDOBIE1,OBDOBIE2,TRUE);
  end;
  if TVYP_V_obdobie.Value >= ZAKON_2009_01 then
   TVYP_V_PRIEMER1.Value:= ZAOKRUHLI(TVYP_V_PRIEMER1.Value,-4,2);
end;end;

procedure TDMV.SET_V_PRIEMER3;
var OBDOBIE1,OBDOBIE2:longint;
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  if TVYP_PRHRMEZA.Value = 0 then begin
    OBDOBIE1:=(TVYP_V_rok.Value-1)*100+1;
    OBDOBIE2:=(TVYP_V_rok.Value-1)*100+12;
    TVYP_PRHRMEZA.Value:=
      VYPL_PRIEMER3(TVYP_Code_emp.Value,OBDOBIE1,OBDOBIE2,false);
    if TVYP_PRHRMEZA.Value = 0 then begin
      OBDOBIE1:=TVYP_V_rok.Value*100+1;
      OBDOBIE2:=TVYP_V_obdobie.Value-1;
      TVYP_PRHRMEZA.Value:=
        VYPL_PRIEMER3(TVYP_Code_emp.Value,OBDOBIE1,OBDOBIE2,true);
    end;
  end;
end;end;

function TDMV.GET_FMES(M:byte):byte;
begin
    With DM Do
    Case M Of
      1: GET_FMES:=TSET_JAN.Value;
      2: GET_FMES:=TSET_FEB.Value;
      3: GET_FMES:=TSET_MAR.Value;
      4: GET_FMES:=TSET_APR.Value;
      5: GET_FMES:=TSET_MAJ.Value;
      6: GET_FMES:=TSET_JUN.Value;
      7: GET_FMES:=TSET_JUL.Value;
      8: GET_FMES:=TSET_AUG.Value;
      9: GET_FMES:=TSET_SEP.Value;
     10: GET_FMES:=TSET_OKT.Value;
     11: GET_FMES:=TSET_NOV.Value;
     12: GET_FMES:=TSET_DEC.Value;
     Else GET_FMES:=0;
    End;
end;

function TDMV.GET_FSVIAT(M:byte):byte;
begin
    With DM Do
    Case M Of
      1: GET_FSVIAT:=TSET_JAN1.Value;
      2: GET_FSVIAT:=TSET_FEB1.Value;
      3: GET_FSVIAT:=TSET_MAR1.Value;
      4: GET_FSVIAT:=TSET_APR1.Value;
      5: GET_FSVIAT:=TSET_MAJ1.Value;
      6: GET_FSVIAT:=TSET_JUN1.Value;
      7: GET_FSVIAT:=TSET_JUL1.Value;
      8: GET_FSVIAT:=TSET_AUG1.Value;
      9: GET_FSVIAT:=TSET_SEP1.Value;
     10: GET_FSVIAT:=TSET_OKT1.Value;
     11: GET_FSVIAT:=TSET_NOV1.Value;
     12: GET_FSVIAT:=TSET_DEC1.Value;
     Else GET_FSVIAT:=0;
    End;
end;

procedure TDMV.SET_V_FMES;
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  TVYP_V_FMES.Value:=GET_FMES(TVYP_V_MESIAC.Value);
end;end;

procedure TDMV.SET_V_PLAT;
begin with DM,DMZ,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  try
  ZISTI_VYKONY;
  if TVYP_N_ukolova.Value>0 then begin
    TVYP_V_PLAT.Value := TVYP_N_ukolova.Value;
    if TVYP_V_HODINA.Value<>0
    then TVYP_V_SADZBA.Value:=TVYP_V_PLAT.Value/TVYP_V_HODINA.Value
    else TVYP_V_SADZBA.Value:=0;
  end
  else
  if TVYP_MV_PLAT.Value>0 then begin
    if TVYP_V_HODINA.Value=0 then
      TVYP_V_HODINA.Value:=TVYP_V_DEN.Value*TVYP_F_DOBA.Value;
    if TVYP_Fixny_mv_plat.Value then
      TVYP_V_PLAT.Value := TVYP_MV_PLAT.Value
    else
      TVYP_V_PLAT.Value :=
        TVYP_MV_PLAT.Value * TVYP_V_HODINA.Value /
        TVYP_F_DOBA.Value / TVYP_V_FMES.Value;
    if TVYP_V_HODINA.Value<>0
    then TVYP_V_SADZBA.Value:=TVYP_V_PLAT.Value/TVYP_V_HODINA.Value
    else TVYP_V_SADZBA.Value:=0;
  end else
  begin
    TVYP_V_PLAT.Value :=
      (TVYP_V_SADZBA.Value * TVYP_V_HODINA.Value);
  end;
  except
  TVYP_V_PLAT.Value := 0;
  end;
  TVYP_V_PLAT.Value:=ZAOKRUHLI(TVYP_V_PLAT.Value,
    TSET_ZAOKRUH3.Value,TSET_ZAOKRUH3SM.Value);
end;end;

procedure TDMV.SET_UPRAV_PRIEMERY;
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  if (TVYP_V_PRIEMER1.Value=0) and (TVYP_V_hodina.Value>0)
   then TVYP_V_PRIEMER1.Value:=TVYP_N_MZDA.Value/TVYP_V_hodina.Value;
end;end;

procedure TDMV.SET_N_NAHRADA;
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  if TVYP_V_Obdobie.Value >= ZAKON_2009_01 then
  {suma nahrady prijmu sa zaokruhluje od 1.1.2009 na eurocenty nahor}
  TVYP_N_NAHRADA_PN.Value :=
    ZAOKRUHLI(
    (TVYP_V_NAHRADA_PN1.Value * TVYP_V_priemer2.Value * TVYP_F_PN1.Value / 100) +
    (TVYP_V_NAHRADA_PN2.Value * TVYP_V_priemer2.Value * TVYP_F_PN2.Value / 100)
    ,-2,0)
  else
  TVYP_N_NAHRADA_PN.Value :=
    ZAOKRUHLI(
    TVYP_V_NAHRADA_PN1.Value * TVYP_V_priemer2.Value * TVYP_F_PN1.Value / 100,
        TSET_ZAOKRUH4.Value,TSET_ZAOKRUH4SM.Value) +
    ZAOKRUHLI(
    TVYP_V_NAHRADA_PN2.Value * TVYP_V_priemer2.Value * TVYP_F_PN2.Value / 100,
    TSET_ZAOKRUH4.Value,TSET_ZAOKRUH4SM.Value);
  try
  if TVYP_V_Obdobie.Value >= ZAKON_2009_01 then begin
   {suma nahrady prijmu sa zaokruhluje od 1.1.2009 na eurocenty nahor}
    TVYP_N_NAHRADA.Value := ZAOKRUHLI(
      TVYP_V_PRIEMER1.Value * TVYP_Vh_NAHRADA.Value,
      -2,0);
    TVYP_N_NEMOHOL.Value := ZAOKRUHLI(
      TVYP_V_PRIEMER1.Value * TVYP_Vh_NEMOHOL.Value * TINF_F_NEMOHOL.Value / 100,
      -2,0);
  end else begin
    TVYP_N_NAHRADA.Value := ZAOKRUHLI(
      TVYP_V_PRIEMER1.Value * TVYP_Vh_NAHRADA.Value,
      0,2);
    TVYP_N_NEMOHOL.Value := ZAOKRUHLI(
      TVYP_V_PRIEMER1.Value * TVYP_Vh_NEMOHOL.Value * TINF_F_NEMOHOL.Value / 100,
      0,2);
  end;
  except
  TVYP_N_NAHRADA.Value := 0;
  TVYP_N_NEMOHOL.Value := 0;
  end;
end;end;

procedure TDMV.SET_N_HOLIDAY;
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  try
  TVYP_N_HOLIDAY.Value :=
    TVYP_V_PRIEMER1.Value * TVYP_V_HOLIDAY.Value *
    TVYP_F_DOBA.Value;
  if TVYP_V_Obdobie.Value >= ZAKON_2009_01 then
    {suma nahrady prijmu sa zaokruhluje od 1.1.2009 na eurocenty nahor}
    TVYP_N_HOLIDAY.Value := ZAOKRUHLI(TVYP_N_HOLIDAY.Value,-2,0)
  else
    TVYP_N_HOLIDAY.Value := ZAOKRUHLI(TVYP_N_HOLIDAY.Value,0,2);
  except
  TVYP_N_HOLIDAY.Value := 0;
  end;
end;end;

procedure TDMV.SET_N_SVIATOK;
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  try
  if (TVYP_MV_Plat.Value = 0) or (TINF_F_Holiday.Value=255) then
  begin
    TVYP_N_SVIATOK.Value :=
      TVYP_V_PRIEMER1.Value * TVYP_V_SVIATOK.Value *
      TVYP_F_DOBA.Value;
    {ak pocitam sviatok priemerkou ako nahradu, tak zaokruhlim na eurocent nahor}
    if TVYP_V_Obdobie.Value >= ZAKON_2009_01 then
      TVYP_N_SVIATOK.Value := ZAOKRUHLI(TVYP_N_SVIATOK.Value,-2,0)
  end
  else begin
    TVYP_N_SVIATOK.Value :=
      TVYP_V_SADZBA.Value  * TVYP_V_SVIATOK.Value *
      TVYP_F_DOBA.Value;
    {ak pocitam sviatok s beznej hodinovej sadzby, tak zaokruhlim na eurocent matematicky}
    if TVYP_V_Obdobie.Value >= ZAKON_2009_01 then
      TVYP_N_SVIATOK.Value := ZAOKRUHLI(TVYP_N_SVIATOK.Value,-2,2)
  end;
  if TVYP_V_Obdobie.Value < ZAKON_2009_01 then
    TVYP_N_SVIATOK.Value := ZAOKRUHLI(TVYP_N_SVIATOK.Value,0,2);
  except
  TVYP_N_SVIATOK.Value := 0;
  end;
end;end;

procedure TDMV.SET_N_PREMIE;
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  case TVYP_F_typ_premii.Value of
    0:TVYP_N_PREMIE.Value := TVYP_F_sadzba_premii.Value;
    1:TVYP_N_PREMIE.Value := TVYP_V_PLAT.Value * TVYP_F_sadzba_premii.Value / 100;
    2:TVYP_N_PREMIE.Value := TVYP_V_HODINA.Value * TVYP_F_sadzba_premii.Value;
  end;
  if TVYP_V_Obdobie.Value >= ZAKON_2009_01 then
  TVYP_N_PREMIE.Value := ZAOKRUHLI(TVYP_N_PREMIE.Value,-2,2)
  else
  TVYP_N_PREMIE.Value := ZAOKRUHLI(TVYP_N_PREMIE.Value,
    TSET_ZAOKRUH6.Value,TSET_ZAOKRUH6SM.Value);

end;end;

procedure TDMV.SET_N_MZDA;
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  TVYP_N_MZDA.Value :=
    TVYP_V_PLAT.Value +
    TVYP_N_premie.Value +
    TVYP_N_odmeny.Value;
  if TVYP_V_Obdobie.Value > Zakon_2000_05 then
  TVYP_N_MZDA.Value :=
    TVYP_N_MZDA.Value +
    TVYP_N_priplat.Value;
  if TVYP_V_Obdobie.Value >= ZAKON_2009_01 then
    TVYP_N_MZDA.Value := ZAOKRUHLI(TVYP_N_MZDA.Value,-2,1);
end;end;

procedure TDMV.SET_POMOCNE;
  function URCI_OBD(mes:integer):longint;
  var MM,RR:word;
  begin
    Result:=0;
    if mes=0 then exit;
    MM:=TVYP_V_Obdobie.Value mod 100;
    RR:=TVYP_V_Obdobie.Value div 100;
    MM:=MM+mes-1;
    if MM>12 then begin
      MM:=MM-12;
      RR:=RR+1;
    end;
    Result:=RR*100+MM;
  end;
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  if TVYP_N_jednoraz1.Value > 0
    then TVYP_V_maxobd1.Value:=URCI_OBD(TVYP_V_mesiace1.Value);
  if TVYP_N_jednoraz2.Value > 0
    then TVYP_V_maxobd2.Value:=URCI_OBD(TVYP_V_mesiace2.Value);
  if TVYP_Verzia.Value<>300 then
    TVYP_Verzia.Value:=MyDbVerzia;
  TVYP_Version.Value := MyVerziaNum;
end;end;

procedure TDMV.SET_N_BRUTTO;
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  TVYP_N_BRUTTO.Value :=
    TVYP_V_PLAT.Value +
    TVYP_N_premie.Value +
    TVYP_N_odmeny.Value +
    TVYP_N_clenovia_organov.Value +
    TVYP_N_priplat.Value +
    TVYP_N_Nahrada.Value +
    TVYP_N_Nemohol.Value+
    TVYP_N_HOLIDAY.Value +
    TVYP_N_SVIATOK.Value +
    TVYP_N_DOHODY_OVP.Value+
    TVYP_N_DOHODY_OPC.Value+
    TVYP_N_socfond.Value+
    TVYP_N_pohotovost.Value+
    TVYP_N_odstupne.Value+
    TVYP_N_jednoraz1.Value+
    TVYP_N_jednoraz2.Value+
    TVYP_N_nahrada_pn.Value+
    TVYP_N_mimo_poistne.Value{+
    TVYP_Vyrovnanie_zp.Value};
  if TVYP_V_Obdobie.Value >= ZAKON_2011_01 then
  begin
    TVYP_N_BRUTTO.Value := TVYP_N_BRUTTO.Value + TVYP_Rezerva2.Value;
  end;
  if TVYP_V_Obdobie.Value >= ZAKON_2009_01 then
  TVYP_N_BRUTTO.Value := ZAOKRUHLI(TVYP_N_BRUTTO.Value,-2,1)
  else
  TVYP_N_BRUTTO.Value := ZAOKRUHLI(TVYP_N_BRUTTO.Value,
    TSET_ZAOKRUH1.Value,TSET_ZAOKRUH1SM.Value);
end;end;

procedure TDMV.SET_CISTA_DENNA_MZDA;
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  if TVYP_V_Obdobie.Value < Zakon_2004_01 then
  begin
    if TVYP_Nd_rucne.Value then exit;
    if TVYP_PRHRMEZA.Value = 0 then begin
      TVYP_CISTA_DENNA_MZDA.Value := 0;
    end
    else begin
      TVYP_CISTA_DENNA_MZDA.Value := PCDZ(TVYP_PRHRMEZA.Value);
    end;
  end;
  if TVYP_CISTA_DENNA_MZDA.Value < TSET_F_NEMMIN.Value
    then TVYP_CISTA_DENNA_MZDA.Value := TSET_F_NEMMIN.Value;
  if TVYP_CISTA_DENNA_MZDA.Value > TSET_F_NEMMAX.Value
    then TVYP_CISTA_DENNA_MZDA.Value := TSET_F_NEMMAX.Value;
end;end;

procedure TDMV.SET_N_PN;
var xDennaSuma:double;
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  SET_CISTA_DENNA_MZDA;
  {-- PN -- }
  TVYP_V_pn.Value := TVYP_V_pn1.Value + TVYP_V_pn2.Value;
  {-- O»R -- }
  TVYP_V_ocr12.Value := TVYP_V_ocr1.Value + TVYP_V_ocr2.Value;
  {--}
  xDennaSuma := TVYP_CISTA_DENNA_MZDA.Value;
  if (AktVelkyZavod) and (TVYP_V_obdobie.Value<ZAKON_2005_01) then
  begin
    TVYP_N_PN1.Value:=
      ZAOKRUHLI(TVYP_V_PN1.Value * xDennaSuma * TVYP_F_PN1.Value / 100,
        TSET_ZAOKRUH4.Value,TSET_ZAOKRUH4SM.Value);
    TVYP_N_PN2.Value:=
      ZAOKRUHLI(TVYP_V_PN2.Value * xDennaSuma * TVYP_F_PN2.Value / 100,
        TSET_ZAOKRUH4.Value,TSET_ZAOKRUH4SM.Value);
    TVYP_N_OCR1.Value:=
      ZAOKRUHLI(TVYP_V_OCR1.Value* xDennaSuma * TVYP_F_PN1.Value / 100,
        TSET_ZAOKRUH4.Value,TSET_ZAOKRUH4SM.Value);
    TVYP_N_OCR2.Value:=
      ZAOKRUHLI(TVYP_V_OCR2.Value* xDennaSuma * TVYP_F_PN2.Value / 100,
        TSET_ZAOKRUH4.Value,TSET_ZAOKRUH4SM.Value);
    TVYP_N_PN.Value:=TVYP_N_PN1.Value + TVYP_N_PN2.Value;
    TVYP_N_OCR.Value:=TVYP_N_OCR1.Value + TVYP_N_OCR2.Value;
    TVYP_Nd_materska.Value:=
      ZAOKRUHLI(TVYP_V_materska.Value* xDennaSuma * TVYP_F_PN2.Value / 100,
        TSET_ZAOKRUH4.Value,TSET_ZAOKRUH4SM.Value);
  end else
  begin
    TVYP_N_PN1.Value:=0;
    TVYP_N_PN2.Value:=0;
    TVYP_N_PN.Value:=0;
    TVYP_N_OCR1.Value:=0;
    TVYP_N_OCR2.Value:=0;
    TVYP_N_OCR.Value:=0;
    TVYP_Nd_materska.Value:=0;
    TVYP_Nd_rodic.Value:=0;
    TVYP_Nd_pridavky.Value:=0;
    TVYP_Nd_ine.Value:=0;
  end;
  if NOT TVYP_U_materska.Value then TVYP_Nd_materska.Value:=0;
  if NOT TVYP_U_rodic.Value then TVYP_Nd_rodic.Value:=0;
  TVYP_Nd_spolu.Value:=
    ZAOKRUHLI(
      TVYP_N_PN1.Value+
      TVYP_N_PN2.Value+
      TVYP_N_OCR1.Value+
      TVYP_N_OCR2.Value+
      TVYP_Nd_materska.Value+
      TVYP_Nd_rodic.Value+
      TVYP_Nd_pridavky.Value+
      TVYP_Nd_ine.Value,
    TSET_ZAOKRUH10.Value,TSET_ZAOKRUH10SM.Value);
end;end;

procedure TDMV.SET_N_PRIPLAT;
var s1,s2:string[8];
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
   try
   s1:=typ_pripl_to_string(TVYP_F_typ_pripl.Value);
   {--nadcas--}
   if Copy(s1,2,1)='0' then
   begin
     if PARAMETRE[33].Hodnota=1 then
     TVYP_Vp_nadcas.Value:=
       TVYP_Vh_nadcas.Value*TVYP_F_nadcas.Value/100*
       TVYP_V_priemer1.value
     else
     TVYP_Vp_nadcas.Value:=
       TVYP_Vh_nadcas.Value*TVYP_F_nadcas.Value/100*
       TVYP_V_plat.Value/TVYP_V_hodina.Value;
   end
   else
     TVYP_Vp_nadcas.Value:=TVYP_Vh_nadcas.Value*TVYP_F_nadcas.Value;
   {--sobota--}
   if Copy(s1,3,1)='0' then
   begin
     if PARAMETRE[33].Hodnota=1 then
     TVYP_Vp_sobota.Value:=
       TVYP_Vh_sobota.Value*TVYP_F_sobota.Value/100*
       TVYP_V_priemer1.value
     else
     TVYP_Vp_sobota.Value:=
       TVYP_Vh_sobota.Value*TVYP_F_sobota.Value/100*
       TVYP_V_plat.Value/TVYP_V_hodina.Value;
   end
   else
     TVYP_Vp_sobota.Value:=TVYP_Vh_sobota.Value*TVYP_F_sobota.Value;
   {--nedela--}
   if Copy(s1,4,1)='0' then
   begin
     if PARAMETRE[33].Hodnota=1 then
     TVYP_Vp_nedela.Value:=
       TVYP_Vh_nedela.Value*TVYP_F_nedela.Value/100*
       TVYP_V_priemer1.value
     else
     TVYP_Vp_nedela.Value:=
       TVYP_Vh_nedela.Value*TVYP_F_nedela.Value/100*
       TVYP_V_plat.Value/TVYP_V_hodina.Value;
   end
   else
     TVYP_Vp_nedela.Value:=TVYP_Vh_nedela.Value*TVYP_F_nedela.Value;
   {--sviatok--}
   if Copy(s1,5,1)='0' then
   begin
     if PARAMETRE[33].Hodnota=1 then
     TVYP_Vp_sviatok.Value:=
       TVYP_Vh_sviatok.Value*TVYP_F_sviatok.Value/100*
       TVYP_V_priemer1.value
     else
     TVYP_Vp_sviatok.Value:=
       TVYP_Vh_sviatok.Value*TVYP_F_sviatok.Value/100*
       TVYP_V_plat.Value/TVYP_V_hodina.Value;
   end
   else
     TVYP_Vp_sviatok.Value:=TVYP_Vh_sviatok.Value*TVYP_F_sviatok.Value;

   {--noc--}
   if Copy(s1,6,1)='0' then
   begin
     if PARAMETRE[33].Hodnota=1 then
     TVYP_Vp_noc.Value:=
       TVYP_Vh_noc.Value*TVYP_F_noc.Value/100*
       TVYP_V_priemer1.value
     else
     TVYP_Vp_noc.Value:=
       TVYP_Vh_noc.Value*TVYP_F_noc.Value/100*
       TVYP_V_plat.Value/TVYP_V_hodina.Value;
   end
   else
     TVYP_Vp_noc.Value:=TVYP_Vh_noc.Value*TVYP_F_noc.Value;
   {--skodlive prostredie--}
   if Copy(s1,7,1)='0' then
   begin
     if PARAMETRE[33].Hodnota=1 then
     TVYP_Vp_skod.Value:=
       TVYP_Vh_skod.Value*TVYP_F_skod.Value/100*
       TVYP_V_priemer1.value
     else
     TVYP_Vp_skod.Value:=
       TVYP_Vh_skod.Value*TVYP_F_skod.Value/100*
       TVYP_V_plat.Value/TVYP_V_hodina.Value;
   end
   else
     TVYP_Vp_skod.Value:=
       TVYP_Vh_skod.Value*TVYP_F_skod.Value;
   except
   TVYP_Vp_nadcas.Value:=0;
   TVYP_Vp_sobota.Value:=0;
   TVYP_Vp_nedela.Value:=0;
   TVYP_Vp_sviatok.Value:=0;
   TVYP_Vp_noc.Value:=0;
   TVYP_Vp_skod.Value:=0;
   end;
   {-- volitelne priplatky --}
   {-- priplat 1 --}
   try
   s2:=typ_pripl2_to_string(TVYP_F_typ_pripl2.Value);
   if Copy(s2,1,1)='0' then
     TVYP_Vp_priplat1.Value:=
       TVYP_Vh_priplat1.Value*TVYP_F_priplat1.Value/100*TVYP_V_priemer1.value
   else
     TVYP_Vp_priplat1.Value:=TVYP_Vh_priplat1.Value*TVYP_F_priplat1.Value;
   {-- priplat 2 --}
   if Copy(s2,2,1)='0' then
     TVYP_Vp_priplat2.Value:=
       TVYP_Vh_priplat2.Value*TVYP_F_priplat2.Value/100*TVYP_V_priemer1.value
   else
     TVYP_Vp_priplat2.Value:=TVYP_Vh_priplat2.Value*TVYP_F_priplat2.Value;
   {-- priplat 3 --}
   if Copy(s2,3,1)='0' then
     TVYP_Vp_priplat3.Value:=
       TVYP_Vh_priplat3.Value*TVYP_F_priplat3.Value/100*TVYP_V_priemer1.value
   else
     TVYP_Vp_priplat3.Value:=TVYP_Vh_priplat3.Value*TVYP_F_priplat3.Value;
   {-- priplat 4 --}
   if Copy(s2,4,1)='0' then
     TVYP_Vp_priplat4.Value:=
       TVYP_Vh_priplat4.Value*TVYP_F_priplat4.Value/100*TVYP_V_priemer1.value
   else
     TVYP_Vp_priplat4.Value:=TVYP_Vh_priplat4.Value*TVYP_F_priplat4.Value;
   {-- priplat 5 --}
   if Copy(s2,5,1)='0' then
     TVYP_Vp_priplat5.Value:=
       TVYP_Vh_priplat5.Value*TVYP_F_priplat5.Value/100*TVYP_V_priemer1.value
   else
     TVYP_Vp_priplat5.Value:=TVYP_Vh_priplat5.Value*TVYP_F_priplat5.Value;
   except
   TVYP_Vp_priplat1.Value:=0;
   TVYP_Vp_priplat2.Value:=0;
   TVYP_Vp_priplat3.Value:=0;
   TVYP_Vp_priplat4.Value:=0;
   TVYP_Vp_priplat5.Value:=0;
   end;
   {* zaokruhlenie vsetkych priplatkov:}
   if TVYP_V_Obdobie.Value >= ZAKON_2009_01 then begin
     TVYP_Vp_nadcas.Value:=ZAOKRUHLI(TVYP_Vp_nadcas.Value,-2,2);
     TVYP_Vp_sobota.Value:=ZAOKRUHLI(TVYP_Vp_sobota.Value,-2,2);
     TVYP_Vp_nedela.Value:=ZAOKRUHLI(TVYP_Vp_nedela.Value,-2,2);
     TVYP_Vp_sviatok.Value:=ZAOKRUHLI(TVYP_Vp_sviatok.Value,-2,2);
     TVYP_Vp_noc.Value:=ZAOKRUHLI(TVYP_Vp_noc.Value,-2,2);
     TVYP_Vp_skod.Value:=ZAOKRUHLI(TVYP_Vp_skod.Value,-2,2);
     TVYP_Vp_priplat1.Value:=ZAOKRUHLI(TVYP_Vp_priplat1.Value,-2,2);
     TVYP_Vp_priplat2.Value:=ZAOKRUHLI(TVYP_Vp_priplat2.Value,-2,2);
     TVYP_Vp_priplat3.Value:=ZAOKRUHLI(TVYP_Vp_priplat3.Value,-2,2);
     TVYP_Vp_priplat4.Value:=ZAOKRUHLI(TVYP_Vp_priplat4.Value,-2,2);
     TVYP_Vp_priplat5.Value:=ZAOKRUHLI(TVYP_Vp_priplat5.Value,-2,2);
   end else begin
     TVYP_Vp_nadcas.Value:=ZAOKRUHLI(TVYP_Vp_nadcas.Value,
       TSET_ZAOKRUH2.Value,TSET_ZAOKRUH2SM.Value);
     TVYP_Vp_sobota.Value:=ZAOKRUHLI(TVYP_Vp_sobota.Value,
      TSET_ZAOKRUH2.Value,TSET_ZAOKRUH2SM.Value);
     TVYP_Vp_nedela.Value:=ZAOKRUHLI(TVYP_Vp_nedela.Value,
      TSET_ZAOKRUH2.Value,TSET_ZAOKRUH2SM.Value);
     TVYP_Vp_sviatok.Value:=ZAOKRUHLI(TVYP_Vp_sviatok.Value,
      TSET_ZAOKRUH2.Value,TSET_ZAOKRUH2SM.Value);
     TVYP_Vp_noc.Value:=ZAOKRUHLI(TVYP_Vp_noc.Value,
      TSET_ZAOKRUH2.Value,TSET_ZAOKRUH2SM.Value);
     TVYP_Vp_skod.Value:=ZAOKRUHLI(TVYP_Vp_skod.Value,
      TSET_ZAOKRUH2.Value,TSET_ZAOKRUH2SM.Value);
     TVYP_Vp_priplat1.Value:=ZAOKRUHLI(TVYP_Vp_priplat1.Value,
      TSET_ZAOKRUH2.Value,TSET_ZAOKRUH2SM.Value);
     TVYP_Vp_priplat2.Value:=ZAOKRUHLI(TVYP_Vp_priplat2.Value,
      TSET_ZAOKRUH2.Value,TSET_ZAOKRUH2SM.Value);
     TVYP_Vp_priplat3.Value:=ZAOKRUHLI(TVYP_Vp_priplat3.Value,
      TSET_ZAOKRUH2.Value,TSET_ZAOKRUH2SM.Value);
     TVYP_Vp_priplat4.Value:=ZAOKRUHLI(TVYP_Vp_priplat4.Value,
      TSET_ZAOKRUH2.Value,TSET_ZAOKRUH2SM.Value);
     TVYP_Vp_priplat5.Value:=ZAOKRUHLI(TVYP_Vp_priplat5.Value,
      TSET_ZAOKRUH2.Value,TSET_ZAOKRUH2SM.Value);
   end;
   {* sucet vsetkych priplatkov:}
   TVYP_N_priplat.Value:=
     TVYP_Vp_nadcas.Value+
     TVYP_Vp_sobota.Value+
     TVYP_Vp_nedela.Value+
     TVYP_Vp_sviatok.Value+
     TVYP_Vp_noc.Value+
     TVYP_Vp_skod.Value+
     TVYP_Vp_priplat1.Value+
     TVYP_Vp_priplat2.Value+
     TVYP_Vp_priplat3.Value+
     TVYP_Vp_priplat4.Value+
     TVYP_Vp_priplat5.Value;
   if TVYP_V_Obdobie.Value >= ZAKON_2009_01 then
   TVYP_N_nadcas.Value :=
     ZAOKRUHLI(TVYP_Vh_nadcas.Value * TVYP_V_sadzba.Value,-2,2)
   else
   TVYP_N_nadcas.Value :=
     ZAOKRUHLI(TVYP_Vh_nadcas.Value * TVYP_V_sadzba.Value,
       TSET_ZAOKRUH3.Value,TSET_ZAOKRUH3SM.Value);
end;end;

procedure TDMV.SET_ODVODY_ZAKLAD;
var Zaklad,Zaklad_J1,HranicaPrijmuStudenta:double;
    MaxZP,MaxDP,MaxNP,MaxFZ,DODPRAC,DSPOLU,DPOIST,MinZ:double;
    VVZ:char;vek_studenta:longint;
begin with DM do if TVYP_.State in [dsEdit,dsInsert] then begin
    VVZ:=StrToChar(TVYP_VYNIMKA_VZ.Value);
    if TVYP_V_obdobie.Value >= ZAKON_2011_01
    then Zaklad:=
        TVYP_V_PLAT.Value +
        TVYP_N_premie.Value +
        TVYP_N_odmeny.Value+
        TVYP_N_priplat.Value +
        TVYP_N_Nahrada.Value +
        TVYP_N_Nemohol.Value+
        TVYP_N_HOLIDAY.Value +
        TVYP_N_SVIATOK.Value +
        {TVYP_N_Jednoraz1.Value} +
        TVYP_N_Jednoraz2.Value +
        TVYP_N_clenovia_organov.Value +
        {TVYP_N_DOHODY_OVP.Value+}
        {TVYP_N_DOHODY_OPC.Value+}
        TVYP_N_socfond.Value+
        TVYP_N_pohotovost.Value+
        TVYP_N_odstupne.Value+
        {TVYP_N_nahrada_pn.Value+}
        {TVYP_N_mimo_poistne.Value;}
        {TVYP_Nz_ddp.Value}
        TVYP_Pouz_auto.Value+
        TVYP_Rezerva2.Value
    else Zaklad:=
        TVYP_V_PLAT.Value +
        TVYP_N_premie.Value +
        TVYP_N_odmeny.Value+
        TVYP_N_priplat.Value +
        TVYP_N_Nahrada.Value +
        TVYP_N_Nemohol.Value+
        TVYP_N_HOLIDAY.Value +
        TVYP_N_SVIATOK.Value +
        TVYP_N_Jednoraz1.Value +
        TVYP_N_Jednoraz2.Value;
    if TVYP_V_obdobie.Value >= ZAKON_2011_01
    then TVYP_N_zaklad_zp.Value:=
        TVYP_V_PLAT.Value +
        TVYP_N_premie.Value +
        TVYP_N_odmeny.Value +
        TVYP_N_priplat.Value +
        TVYP_N_Nahrada.Value +
        TVYP_N_Nemohol.Value+
        TVYP_N_HOLIDAY.Value +
        TVYP_N_SVIATOK.Value +
        TVYP_N_jednoraz1.Value+
        TVYP_N_jednoraz2.Value+
        TVYP_N_clenovia_organov.Value +
        {TVYP_N_DOHODY_OVP.Value+}
        {TVYP_N_DOHODY_OPC.Value+}
        TVYP_N_socfond.Value+
        TVYP_N_pohotovost.Value+
        TVYP_N_odstupne.Value+
        {TVYP_N_nahrada_pn.Value+}
        {TVYP_N_mimo_poistne.Value;}
        TVYP_Nz_ddp.Value+
        TVYP_Pouz_auto.Value+
        TVYP_Rezerva2.Value
    else if TVYP_V_obdobie.Value >= ZAKON_2005_09
    then TVYP_N_zaklad_zp.Value:=
        TVYP_V_PLAT.Value +
        TVYP_N_premie.Value +
        TVYP_N_odmeny.Value +
        TVYP_N_clenovia_organov.Value +
        TVYP_N_priplat.Value +
        TVYP_N_Nahrada.Value +
        TVYP_N_Nemohol.Value+
        TVYP_N_HOLIDAY.Value +
        TVYP_N_SVIATOK.Value +
        {TVYP_N_DOHODY_OVP.Value+}
        {TVYP_N_DOHODY_OPC.Value+}
        {TVYP_N_socfond.Value+}
        {TVYP_N_pohotovost.Value+}
        {VYP_N_odstupne.Value+}
        {TVYP_N_jednoraz1.Value+}
        {TVYP_N_jednoraz2.Value+}
        {TVYP_N_nahrada_pn.Value+}
        {TVYP_N_mimo_poistne.Value;}
        TVYP_Nz_ddp.Value
    else
    if TVYP_V_obdobie.Value >= ZAKON_2005_01
     then TVYP_N_zaklad_zp.Value:=Zaklad
      else TVYP_N_zaklad_zp.Value:=Zaklad + TVYP_N_clenovia_organov.Value;
    TVYP_N_zaklad_dp.Value:=Zaklad;
    TVYP_N_zaklad_np.Value:=Zaklad;
    TVYP_N_zaklad_fz.Value:=Zaklad;
    TVYP_N_zaklad_ip.Value:=Zaklad;
    TVYP_N_zaklad_up.Value:=Zaklad + TVYP_N_dohody_ovp.Value + TVYP_N_dohody_opc.Value;
    TVYP_N_zaklad_rf.Value:=Zaklad;
    TVYP_N_zaklad_gp.Value:=Zaklad;

(*
Ak mesaËn˝ prÌjem/priemern˝ mesaËn˝ prÌjem ûiaka/ötudenta z urËenej dohody o brig·dnickej pr·ci ötudentov presiahne
stanoven˙ sumu
    (66 eur/155 eur pre rok 2013)
    (68 eur/159 eur pre rok 2014),
vznikne mu povinnÈ dÙchodkovÈ poistenie, a to od prvÈho dÚa kalend·rneho mesiaca,
za ktor˝ jeho mesaËn˝ prÌjem presiahol stanoven˙ sumu, najskÙr od vzniku dohody.
Takto vzniknutÈ povinnÈ dÙchodkovÈ poistenie zanikne posledn˝m dÚom kalend·rneho mesiaca, za ktor˝ jeho mesaËn˝
prÌjem/priemern˝ mesaËn˝ prÌjem naposledy presiahol hraniËn˙ sumu, najneskÙr skonËenÌm dohody o brig·dnickej pr·ci
ötudentov.
VymeriavacÌ z·klad na platenie poistnÈho na dÙchodkovÈ poistenie a poistnÈho do rezervnÈho fondu solidarity ûiaka/
ötudenta je jeho mesaËn˝/priemern˝ mesaËn˝ prÌjem z urËenej dohody o brig·dnickej pr·ci ötudentov po odËÌtanÌ sumy 66
eur, resp. 155 eur. Na ˙Ëely ˙razovÈho a garanËnÈho poistenia sa neodpoËÌtavaj˙ hraniËnÈ sumy ñ 66 eur a 155 eur.
*)
    if TVYP_Typzec.Value IN [16,17] then begin
      vek_studenta := vek(ObdobieToRRRRMM(DateToObdobie(DMZ.TZAM_Born_date.Value)),Obdobie_Add_MM(TVYP_V_Obdobie.Value,-1));
      if vek_studenta<=17 then begin
        if TVYP_V_obdobie.Value >= ZAKON_2014_01 then HranicaPrijmuStudenta := 68
        else if TVYP_V_obdobie.Value >= ZAKON_2013_01 then HranicaPrijmuStudenta := 66
        else HranicaPrijmuStudenta := 0;
        TVYP_U_dochod.Value  := 1;
        TVYP_U_invalid.Value := 1;
        TVYP_U_rezerva.Value := 1;
        TVYP_N_zaklad_dp.Value:= TVYP_N_zaklad_dp.Value - HranicaPrijmuStudenta; if TVYP_N_zaklad_dp.Value < 0 then begin TVYP_N_zaklad_dp.Value := 0; TVYP_U_dochod.Value  := 0; end;
        TVYP_N_zaklad_ip.Value:= TVYP_N_zaklad_ip.Value - HranicaPrijmuStudenta; if TVYP_N_zaklad_ip.Value < 0 then begin TVYP_N_zaklad_ip.Value := 0; TVYP_U_invalid.Value := 0; end;
        TVYP_N_zaklad_rf.Value:= TVYP_N_zaklad_rf.Value - HranicaPrijmuStudenta; if TVYP_N_zaklad_rf.Value < 0 then begin TVYP_N_zaklad_rf.Value := 0; TVYP_U_rezerva.Value := 0; end;
      end else
      if vek_studenta>17 then begin
        if TVYP_V_obdobie.Value >= ZAKON_2014_01 then HranicaPrijmuStudenta := 159
        else if TVYP_V_obdobie.Value >= ZAKON_2013_01 then HranicaPrijmuStudenta := 155
        else HranicaPrijmuStudenta := 0;
        TVYP_U_dochod.Value  := 1;
        TVYP_U_invalid.Value := 1;
        TVYP_U_rezerva.Value := 1;
        TVYP_N_zaklad_dp.Value := TVYP_N_zaklad_dp.Value - HranicaPrijmuStudenta; if TVYP_N_zaklad_dp.Value < 0 then begin TVYP_N_zaklad_dp.Value := 0; TVYP_U_dochod.Value  := 0; end;
        TVYP_N_zaklad_ip.Value := TVYP_N_zaklad_ip.Value - HranicaPrijmuStudenta; if TVYP_N_zaklad_ip.Value < 0 then begin TVYP_N_zaklad_ip.Value := 0; TVYP_U_invalid.Value := 0; end;
        TVYP_N_zaklad_rf.Value := TVYP_N_zaklad_rf.Value - HranicaPrijmuStudenta; if TVYP_N_zaklad_rf.Value < 0 then begin TVYP_N_zaklad_rf.Value := 0; TVYP_U_rezerva.Value := 0; end;
      end;
    end;

    {docasne pouzity stlpec Rezerva1 vo vyzname U_garancne}
    if TVYP_V_obdobie.Value >= ZAKON_2008_01 then TVYP_Rezerva1.Value := 1;
    if TVYP_Rezerva1.Value=1 then
      TVYP_N_zaklad_gp.Value:=
        TVYP_N_zaklad_gp.Value + TVYP_N_dohody_ovp.Value;
    {-- korekcie zakladov na nulu --}
    if TVYP_V_obdobie.Value >= ZAKON_2006_08 then begin
    if (
        (TVYP_U_zdrav.Value   = 0) and
        (TVYP_Typzec.Value <> 20) and
        (TVYP_Typzec.Value <> 21) and
        (TVYP_Typzec.Value <> 22) and
        (TVYP_Typzec.Value <> 23)
        ) then TVYP_N_zaklad_zp.Value:=0;
      if TVYP_U_dochod.Value=0 then TVYP_N_zaklad_dp.Value := 0;
      if TVYP_U_nemoc.Value=0 then TVYP_N_zaklad_np.Value := 0;
      if TVYP_U_fondzam.Value=0 then TVYP_N_zaklad_fz.Value := 0;
      if TVYP_U_invalid.Value=0 then TVYP_N_zaklad_ip.Value := 0;
      if TVYP_U_uraz.Value=0 then TVYP_N_zaklad_up.Value := 0;
      if TVYP_U_rezerva.Value=0 then TVYP_N_zaklad_rf.Value := 0;
      if TVYP_U_garancne.Value=0 then TVYP_N_zaklad_gp.Value := 0;
    end;
    {-- dohody o vykonani prace --}
    if TVYP_U_zdrav1.Value=1 then
      TVYP_N_zaklad_zp.Value:=TVYP_N_zaklad_zp.Value+TVYP_N_dohody_ovp.Value;
    if TVYP_U_nemoc1.Value=1 then
      TVYP_N_zaklad_np.Value:=TVYP_N_zaklad_np.Value+TVYP_N_dohody_ovp.Value;
    if TVYP_U_dochod1.Value=1 then
      TVYP_N_zaklad_dp.Value:=TVYP_N_zaklad_dp.Value+TVYP_N_dohody_ovp.Value;
    if TVYP_U_fondzam1.Value=1 then
      TVYP_N_zaklad_fz.Value:=TVYP_N_zaklad_fz.Value+TVYP_N_dohody_ovp.Value;
    {-- dohody o pracovnej cinnosti --}
    if TVYP_U_zdrav2.Value=1 then
      TVYP_N_zaklad_zp.Value:=TVYP_N_zaklad_zp.Value+TVYP_N_dohody_opc.Value;
    if TVYP_U_nemoc2.Value=1 then
      TVYP_N_zaklad_np.Value:=TVYP_N_zaklad_np.Value+TVYP_N_dohody_opc.Value;
    if TVYP_U_dochod2.Value=1 then
      TVYP_N_zaklad_dp.Value:=TVYP_N_zaklad_dp.Value+TVYP_N_dohody_opc.Value;
    if TVYP_U_fondzam2.Value=1 then
      TVYP_N_zaklad_fz.Value:=TVYP_N_zaklad_fz.Value+TVYP_N_dohody_opc.Value;
    {--Predzaokruhlenie zakladov poistneho--}
    if TVYP_V_obdobie.Value >= ZAKON_2011_01 then begin
      TVYP_N_zaklad_zp.Value:=ZAOKRUHLI(TVYP_N_zaklad_zp.Value,-2,1);
      TVYP_N_zaklad_dp.Value:=ZAOKRUHLI(TVYP_N_zaklad_dp.Value,-2,1);
      TVYP_N_zaklad_np.Value:=ZAOKRUHLI(TVYP_N_zaklad_np.Value,-2,1);
      TVYP_N_zaklad_fz.Value:=ZAOKRUHLI(TVYP_N_zaklad_fz.Value,-2,1);
      TVYP_N_zaklad_ip.Value:=ZAOKRUHLI(TVYP_N_zaklad_ip.Value,-2,1);
      TVYP_N_zaklad_up.Value:=ZAOKRUHLI(TVYP_N_zaklad_up.Value,-2,1);
      TVYP_N_zaklad_rf.Value:=ZAOKRUHLI(TVYP_N_zaklad_rf.Value,-2,1);
      TVYP_N_zaklad_gp.Value:=ZAOKRUHLI(TVYP_N_zaklad_gp.Value,-2,1);
      TVYP_N_prijem_zp.Value := TVYP_N_zaklad_zp.Value;
    end else
    if TVYP_V_obdobie.Value >= ZAKON_2009_01 then begin
      TVYP_N_zaklad_zp.Value:=ZAOKRUHLI(TVYP_N_zaklad_zp.Value,-2,1);
      TVYP_N_zaklad_dp.Value:=ZAOKRUHLI(TVYP_N_zaklad_dp.Value,-2,0);
      TVYP_N_zaklad_np.Value:=ZAOKRUHLI(TVYP_N_zaklad_np.Value,-2,0);
      TVYP_N_zaklad_fz.Value:=ZAOKRUHLI(TVYP_N_zaklad_fz.Value,-2,0);
      TVYP_N_zaklad_ip.Value:=ZAOKRUHLI(TVYP_N_zaklad_ip.Value,-2,0);
      TVYP_N_zaklad_up.Value:=ZAOKRUHLI(TVYP_N_zaklad_up.Value,-2,0);
      TVYP_N_zaklad_rf.Value:=ZAOKRUHLI(TVYP_N_zaklad_rf.Value,-2,0);
      TVYP_N_zaklad_gp.Value:=ZAOKRUHLI(TVYP_N_zaklad_gp.Value,-2,0);
      TVYP_N_prijem_zp.Value := TVYP_N_zaklad_zp.Value;
    end else
    if TVYP_V_obdobie.Value >= ZAKON_2005_01 then
    begin
      TVYP_N_zaklad_zp.Value:=ZAOKRUHLI(TVYP_N_zaklad_zp.Value,0,0);
      TVYP_N_zaklad_dp.Value:=ZAOKRUHLI(TVYP_N_zaklad_dp.Value,0,1);
      TVYP_N_zaklad_np.Value:=ZAOKRUHLI(TVYP_N_zaklad_np.Value,0,1);
      TVYP_N_zaklad_fz.Value:=ZAOKRUHLI(TVYP_N_zaklad_fz.Value,0,1);
      TVYP_N_zaklad_ip.Value:=ZAOKRUHLI(TVYP_N_zaklad_ip.Value,0,1);
      TVYP_N_zaklad_up.Value:=ZAOKRUHLI(TVYP_N_zaklad_up.Value,0,1);
      TVYP_N_zaklad_rf.Value:=ZAOKRUHLI(TVYP_N_zaklad_rf.Value,0,1);
      TVYP_N_zaklad_gp.Value:=ZAOKRUHLI(TVYP_N_zaklad_gp.Value,0,1);
      TVYP_N_prijem_zp.Value := TVYP_N_zaklad_zp.Value;
    end else
    if TVYP_V_obdobie.Value < ZAKON_2005_01 then
    begin
    {--Zaokruhlenie zakladov poistneho--}
      TVYP_N_zaklad_zp.Value:=ZAOKRUHLI(TVYP_N_zaklad_zp.Value,
          TSET_F_ZAZAKLPOIST.Value,TSET_F_SMZAKLPOIST.Value);
      TVYP_N_zaklad_dp.Value:=ZAOKRUHLI(TVYP_N_zaklad_dp.Value,
          TSET_F_ZAZAKLPOIST.Value,TSET_F_SMZAKLPOIST.Value);
      TVYP_N_zaklad_np.Value:=ZAOKRUHLI(TVYP_N_zaklad_np.Value,
          TSET_F_ZAZAKLPOIST.Value,TSET_F_SMZAKLPOIST.Value);
      TVYP_N_zaklad_fz.Value:=ZAOKRUHLI(TVYP_N_zaklad_fz.Value,
          TSET_F_ZAZAKLPOIST.Value,TSET_F_SMZAKLPOIST.Value);
      Zaklad_J1:=ZAOKRUHLI(Zaklad_J1,
          TSET_F_ZAZAKLPOIST.Value,TSET_F_SMZAKLPOIST.Value);
    end;
    {--}
    if TVYP_V_obdobie.Value >= ZAKON_2005_01
     Then MinZ  := PARAMETRE[30].Hodnota
      Else MinZ  := TSET_F_MIN_MZDA.Value;
    if TVYP_VYNIMKA_VZ.Value = '1' then
        MinZ:= ZAOKRUHLI(MinZ*0.75,
               TSET_F_ZAODVOD.Value,TSET_F_SMODVOD.Value)
    else if TVYP_VYNIMKA_VZ.Value = '2' then
        MinZ:= ZAOKRUHLI(MinZ*0.50,
               TSET_F_ZAODVOD.Value,TSET_F_SMODVOD.Value)
    else if TVYP_VYNIMKA_VZ.Value <> '0' then
        MinZ:=0;
    MaxZP := PARAMETRE[19].Hodnota;
    MaxDP := PARAMETRE[21].Hodnota;
    MaxNP := PARAMETRE[20].Hodnota;
    MaxFZ := PARAMETRE[22].Hodnota;
    if TVYP_V_Obdobie.Value >= Zakon_2004_01 then begin
      DSPOLU := TVYP_V_FMES.Value;
      DODPRAC := TVYP_V_FMES.Value - TVYP_V_pn.Value - TVYP_V_ocr12.Value;
      if (DODPRAC>0) and (DODPRAC < DSPOLU) then begin
        MaxZP := ZAOKRUHLI(ZAOKRUHLI(MaxZP / DSPOLU,-2,2) * DODPRAC,0,2);
      end;
      DSPOLU:=TVYP_V_Kal_dni.Value;
      DPOIST:=DSPOLU-TVYP_V_nepoisteny.Value;
      if DPOIST>DSPOLU then DPOIST:=DSPOLU;
      if DPOIST<>DSPOLU then begin
        if TVYP_V_Obdobie.Value < ZAKON_2009_01 then begin
          MaxDP := ZAOKRUHLI(ZAOKRUHLI(MaxDP / DSPOLU,-2,2) * DPOIST,0,2);
          MaxNP := ZAOKRUHLI(ZAOKRUHLI(MaxNP / DSPOLU,-2,2) * DPOIST,0,2);
          MaxFZ := ZAOKRUHLI(ZAOKRUHLI(MaxFZ / DSPOLU,-2,2) * DPOIST,0,2);
          MinZ  := ZAOKRUHLI(ZAOKRUHLI(MinZ  / DSPOLU,-2,2) * DPOIST,0,2);
        end else if TVYP_V_Obdobie.Value >= ZAKON_2009_01 then begin
          MaxDP := ZAOKRUHLI(ZAOKRUHLI(MaxDP / DSPOLU,-4,2) * DPOIST,-2,2);
          MaxNP := ZAOKRUHLI(ZAOKRUHLI(MaxNP / DSPOLU,-4,2) * DPOIST,-2,2);
          MaxFZ := ZAOKRUHLI(ZAOKRUHLI(MaxFZ / DSPOLU,-4,2) * DPOIST,-2,2);
          MinZ  := ZAOKRUHLI(ZAOKRUHLI(MinZ  / DSPOLU,-4,2) * DPOIST,-2,2);
        end;
      end;
    end else
    if TVYP_V_Obdobie.Value >= Zakon_2000_05 then begin
      DSPOLU := TVYP_V_FMES.Value;
      DODPRAC := TVYP_V_FMES.Value - TVYP_V_pn.Value - TVYP_V_ocr12.Value;
      if (DODPRAC>0) and (DODPRAC < DSPOLU) then begin
        MaxZP := ZAOKRUHLI(MaxZP / DSPOLU * DODPRAC,-2,2);
        MaxDP := ZAOKRUHLI(MaxDP / DSPOLU * DODPRAC,-2,2);
        MaxNP := ZAOKRUHLI(MaxNP / DSPOLU * DODPRAC,-2,2);
        MinZ  := ZAOKRUHLI(MinZ  / DSPOLU * DODPRAC,-2,2);
      end;
    end;
    { kontrola na maximalnu vysku zakladu }
    if TVYP_N_zaklad_zp.Value>MaxZP then TVYP_N_zaklad_zp.Value:=MaxZP;
    if TVYP_N_zaklad_dp.Value>MaxDP then TVYP_N_zaklad_dp.Value:=MaxDP;
    if TVYP_N_zaklad_ip.Value>MaxDP then TVYP_N_zaklad_ip.Value:=MaxDP;
    if TVYP_N_zaklad_np.Value>MaxNP then TVYP_N_zaklad_np.Value:=MaxNP;
    if TVYP_N_zaklad_fz.Value>MaxFZ then TVYP_N_zaklad_fz.Value:=MaxFZ;
    if TVYP_N_zaklad_rf.Value>MaxDP then TVYP_N_zaklad_rf.Value:=MaxDP;
    if TVYP_N_zaklad_gp.Value>MaxNP then TVYP_N_zaklad_gp.Value:=MaxNP;
    { nulovanie zakladov, ak zam. neodvadza a nie je vypnute pocitanie
      zakladov automaticky }
    if (
        (TVYP_U_zdrav.Value   = 0) and
        (TVYP_Typzec.Value <> 20) and
        (TVYP_Typzec.Value <> 21) and
        (TVYP_Typzec.Value <> 22) and
        (TVYP_Typzec.Value <> 23)
        ) then TVYP_N_zaklad_zp.Value:=0;
    if TVYP_U_dochod.Value  = 0 then TVYP_N_zaklad_dp.Value:=0;
    if TVYP_U_invalid.Value = 0 then TVYP_N_zaklad_ip.Value:=0;
    if TVYP_U_nemoc.Value   = 0 then TVYP_N_zaklad_np.Value:=0;
    if TVYP_U_fondzam.Value = 0 then TVYP_N_zaklad_fz.Value:=0;
    if TVYP_U_rezerva.Value= 0 then TVYP_N_zaklad_rf.Value:=0;
    if TVYP_U_garancne.Value= 0 then TVYP_N_zaklad_gp.Value:=0;
    if TVYP_U_uraz.Value = 0 then TVYP_N_zaklad_up.Value:=0
end;end;

procedure TDMV.SET_ODVODY;
var
  MaxZP,MaxDP,MaxNP,MaxFZ,kuvik:double;
  Zaklad_J1,Zaklad_J2,Odvod_J,Zaklad_DDP,O1,O2:double;
  ZnizSadzbu:double;
function SPOCITAJ_ODVOD_BEZ_ZAOKRUH(iZaklad,iSadzba:double):double;
begin with DM do begin
  kuvik := iZaklad * iSadzba / 100;
  Result:= kuvik;
end;end;
function SPOCITAJ_ODVOD(iZaklad,iSadzba:double):double;
begin with DM,DMV do begin
  kuvik := iZaklad * iSadzba / 100;
  if TVYP_V_Obdobie.Value < ZAKON_2006_01 then
  begin
  kuvik := ZAOKRUHLI(kuvik,-2,1); //zaokr˙hli dole na 2 desatinnÈ miesta
  end;
  if TVYP_V_Obdobie.Value < ZAKON_2009_01 then
    Result:=
    ZAOKRUHLI(kuvik,TSET_F_ZAODVOD.Value,TSET_F_SMODVOD.Value) //zaokr˙hli hore na celÈ koruny
  else
  if TVYP_V_Obdobie.Value >= ZAKON_2011_01 then
  Result:=
  ZAOKRUHLI(kuvik,-2,1) //zaokr˙hli dole na 2 desatinnÈ miesta
  else
  if TVYP_V_Obdobie.Value >= ZAKON_2009_01 then
  Result:=
  ZAOKRUHLI(kuvik,-1,1); //zaokr˙hli na desaù eurocentov nadol
end;end;
function KORIGUJ_ZAKLAD(iZaklad,iInyZaklad,iMax:double):double;
var pom:double;
begin with DM do begin
  if iZaklad+iInyZaklad>iMax then pom:=iZaklad+iInyZaklad-iMax else pom:=0;
  if (pom>iZaklad) and (iZaklad>=0) then pom:=iZaklad;
  Result:=iZaklad - pom;
end;end;
procedure SPOCITAJ_ODVODY(
iZaklad1,iZaklad2,iSadzba1,iSadzba2:double;
iPlati1,iPlati2:boolean;
var oOdvod1,oOdvod2:double);
begin
  if (iZaklad1<0) AND (TVYP_Automatika.Value) then iZaklad1:=0;
  if (iZaklad2<0) AND (TVYP_Automatika.Value) then iZaklad2:=0;
  if iPlati1 then oOdvod1:=SPOCITAJ_ODVOD(iZaklad1,iSadzba1) else oOdvod1:=0;
  if iPlati2 then oOdvod2:=SPOCITAJ_ODVOD(iZaklad2,iSadzba2) else oOdvod2:=0;
end;
procedure SPOCITAJ_ODVODY_ZP(
iZaklad1,iZaklad2,iSadzba1,iSadzba2:double;
iPlati1,iPlati2:boolean;
var oOdvod1,oOdvod2:double);
begin with DM do begin
  if (iZaklad1<0) AND (TVYP_Automatika.Value) then iZaklad1:=0;
  if (iZaklad2<0) AND (TVYP_Automatika.Value) then iZaklad2:=0;
  if iPlati1 then oOdvod1:=ZAOKRUHLI(ZAOKRUHLI(SPOCITAJ_ODVOD_BEZ_ZAOKRUH(iZaklad1,iSadzba1),-2,1),TSET_F_ZAODVOD.Value,TSET_F_SMODVOD.Value)
             else oOdvod1:=0;
  if iPlati2 then oOdvod2:=ZAOKRUHLI(SPOCITAJ_ODVOD_BEZ_ZAOKRUH(iZaklad2,iSadzba2),-2,0)
             else oOdvod2:=0;
end;end;
procedure SPOCITAJ_ODVODY_ZP_200509(
iZaklad1,iZaklad2,iSadzba1,iSadzba2:double;
iPlati1,iPlati2:boolean;
var oOdvod1,oOdvod2:double);
begin with DM do begin
  if (iZaklad1<0) AND (TVYP_Automatika.Value) then iZaklad1:=0;
  if (iZaklad2<0) AND (TVYP_Automatika.Value) then iZaklad2:=0;
  if iPlati1 then oOdvod1:=ZAOKRUHLI(ZAOKRUHLI(SPOCITAJ_ODVOD_BEZ_ZAOKRUH(iZaklad1,iSadzba1),-2,1),TSET_F_ZAODVOD.Value,TSET_F_SMODVOD.Value)
             else oOdvod1:=0;
  if iPlati2 then oOdvod2:=ZAOKRUHLI(SPOCITAJ_ODVOD_BEZ_ZAOKRUH(iZaklad2,iSadzba2),0,0)
             else oOdvod2:=0;
end;end;
procedure SPOCITAJ_ODVODY_ZP_200901(
iZaklad1,iZaklad2,iSadzba1,iSadzba2:double;
iPlati1,iPlati2:boolean;
var oOdvod1,oOdvod2:double);
begin with DM do begin
  if (iZaklad1<0) AND (TVYP_Automatika.Value) then iZaklad1:=0;
  if (iZaklad2<0) AND (TVYP_Automatika.Value) then iZaklad2:=0;
  if iPlati1 then oOdvod1:=ZAOKRUHLI(SPOCITAJ_ODVOD_BEZ_ZAOKRUH(iZaklad1,iSadzba1),-2,1)
             else oOdvod1:=0;
  if iPlati2 then oOdvod2:=ZAOKRUHLI(SPOCITAJ_ODVOD_BEZ_ZAOKRUH(iZaklad2,iSadzba2),-2,1)
             else oOdvod2:=0;
end;end;
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
    if TVYP_V_obdobie.Value < ZAKON_2006_08
      then TVYP_Rezerva1.Value := 0;
    if (TVYP_Rezerva1.Value = 1) and (TVYP_N_dohody_ovp.Value > 0)
      then TVYP_U_garancne.Value := 1;
    MaxZP := PARAMETRE[19].Hodnota;
    MaxDP := PARAMETRE[21].Hodnota;
    MaxNP := PARAMETRE[20].Hodnota;
    MaxFZ := PARAMETRE[22].Hodnota;
    {--od 1.1.2005: ulava plati pre zam. s poklesom zarobkovej schopnosti 20% a viac
     --od 1.9.2005: ulava plati aj pre zamestnancov ZTP }
    TVYP_F_zdravot.Value   :=TSET_F_zdravot.Value;
    if TVYP_V_obdobie.Value >= ZAKON_2005_01 then
    begin
      if TVYP_Miera_Poklesu.Value>=PARAMETRE[29].Hodnota then
        TVYP_F_zdravot.Value   :=TSET_F_zdravot1.Value;
    end;
    if TVYP_V_obdobie.Value >= ZAKON_2005_09 then
    begin
      if TVYP_ZTP.Value then
        TVYP_F_zdravot.Value   :=TSET_F_zdravot1.Value;
    end;
    if TVYP_U_zdrav.Value = 4
     then TVYP_F_zdravot.Value   :=TSET_F_zdravot.Value + TSET_Fz_zdravot.Value;
    {--zamestnanec nema ziadne ulavy na poistnom do SP,
       bud plati alebo nie}    TVYP_F_nemoc.Value     :=TSET_F_nemoc.Value;
    if TVYP_U_nemoc.Value = 4
     then TVYP_F_nemoc.Value   :=TSET_F_nemoc.Value + TSET_Fz_nemoc.Value;

    {--znizenie sadzby o 0,5% platilo len v roku 2005 }
    if (TVYP_V_obdobie.Value>=Zakon_2005_01) and (TVYP_V_obdobie.Value<Zakon_2006_01)
     then ZnizSadzbu := MinD(TVYP_Poc_nezaop_deti.Value,8)* PARAMETRE[27].Hodnota
     else ZnizSadzbu := 0;
    TVYP_F_dochod.Value    :=TSET_F_dochod.Value - ZnizSadzbu;
    if TVYP_U_dochod.Value = 4
     then TVYP_F_dochod.Value   :=TSET_F_dochod.Value + TSET_Fz_dochod.Value;
    TVYP_F_fondz.Value     :=TSET_F_fondz.Value;
    if TVYP_U_fondzam.Value = 4
     then TVYP_F_fondz.Value :=TSET_F_fondz.Value + TSET_Fz_fondz.Value;
    TVYP_F_invalid.Value     :=TSET_F_invalid.Value;
    if TVYP_U_invalid.Value = 4
     then TVYP_F_invalid.Value :=TSET_F_invalid.Value + TSET_Fz_invalid.Value;
    {--zamestnavatel ma ulavy na poistnom za urcitych podmienok}
    TVYP_FZ_zdravot.Value  :=TSET_FZ_zdravot.Value;
    TVYP_FZ_nemoc.Value    :=TSET_FZ_nemoc.Value;
    TVYP_FZ_dochod.Value   :=TSET_FZ_dochod.Value;
    TVYP_FZ_fondz.Value    :=TSET_FZ_fondz.Value;
    TVYP_FZ_garfond.Value  :=TSET_FZ_garfond.Value;
    TVYP_FZ_invalid.Value  :=TSET_FZ_invalid.Value;
    TVYP_FZ_uraz.Value     :=TSET_FZ_uraz.Value;
    TVYP_FZ_rezerva.Value  :=TSET_FZ_rezerva.Value;
    if TVYP_V_Obdobie.Value < 200401 then
    begin
      TVYP_F_invalid.Value := 0;
      TVYP_Fz_invalid.Value := 0;
      TVYP_Fz_uraz.Value := 0;
      TVYP_Fz_rezerva.Value := 0;
    end;
    {--do 31.12.2004: ulava na zdravotnom poisteni plati len za ZPS+ZTP zamestnancov
     --od 1.1.2005: ulava plati pre zam. s poklesom zarobkovej schopnosti 20% a viac
     --od 1.9.2005: ulava plati aj pre zamestnancov ZTP }
    if TVYP_V_obdobie.Value < ZAKON_2005_01 then
    begin
      if (TVYP_ZPS.Value) OR (TVYP_ZTP.Value) then
        TVYP_FZ_zdravot.Value  :=TSET_FZ_zdravot1.Value;
    end else
    if TVYP_V_obdobie.Value >= ZAKON_2005_01 then
    begin
      if TVYP_Miera_Poklesu.Value>=PARAMETRE[29].Hodnota then
        TVYP_FZ_zdravot.Value  :=TSET_FZ_zdravot1.Value;
    end;
    if TVYP_V_obdobie.Value >= ZAKON_2005_09 then
    begin
      if TVYP_ZTP.Value then
        TVYP_FZ_zdravot.Value  :=TSET_FZ_zdravot1.Value;
    end;
    {S ˙Ëinnosùou od 1. janu·ra 2004 sa zamestn·vateæovi nezniûuje sadzba poistnÈho
     na nemocenskÈ poistenie, dÙchodkovÈ poistenie (starobnÈ a invalidnÈ) a poistenie v nezamestnanosti tak,
     ako to bolo podæa pr·vnej ˙pravy do 31. decembra 2003, keÔ zamestn·vateæ zamestn·val obËanov
     so zmenenou pracovnou schopnosùou a obËanov so zmenenou pracovnou schopnosùou s ùaûöÌm zdravotn˝m
     postihnutÌm.}
    if TVYP_V_Obdobie.Value < 200401 then
    begin
      {--ulava na fonde zamestnanosti plati pre vsetkych, ak zamestnavatel splna podmienky}
      TVYP_F_firma_zps.Value  :=
        (
         ((TVYP_F_typ_ulavy_fz.Value = 1) AND TVYP_ZPS.Value) OR
         ((TVYP_F_typ_ulavy_fz.Value = 2) AND TVYP_ZTP.Value) OR
         ((TVYP_F_typ_ulavy_fz.Value = 3))
        );
      if TVYP_F_FIRMA_ZPS.Value then begin
        TVYP_FZ_fondz.Value    :=TSET_FZ_fondz1.Value;
        TVYP_FZ_garfond.Value  :=TSET_FZ_garfond1.Value;
      end;
      {--ulava na odvode do soc.poistovne plati pre vsetkych, ak zamestnavatel splna podmienky}
      TVYP_ZPS1.Value  :=
        (
         ((TVYP_F_typ_ulavy_sp.Value = 1) AND TVYP_ZPS.Value) OR
         ((TVYP_F_typ_ulavy_sp.Value = 2) AND TVYP_ZTP.Value) OR
         ((TVYP_F_typ_ulavy_sp.Value = 3))
        );
      if TVYP_ZPS1.Value then begin
        TVYP_FZ_nemoc.Value    :=TSET_FZ_nemoc1.Value;
        TVYP_FZ_dochod.Value   :=TSET_FZ_dochod1.Value;
      end;
    end;{end TVYP_V_Obdobie.Value < 200401}
    {--}
    if TVYP_Automatika.Value then SET_ODVODY_ZAKLAD;
    if TVYP_V_Obdobie.Value < ZAKON_2005_01 Then
    begin
      SPOCITAJ_ODVODY(
         TVYP_N_zaklad_zp.Value,
         TVYP_N_zaklad_zp.Value,
         TVYP_F_zdravot.Value,
         TVYP_Fz_zdravot.Value,
         TVYP_U_zdrav.Value in PoiPlatiZam,
         false,
         O1,O2);
         TVYP_O_zdravot.Value := O1;
         TVYP_Oz_zdravot.Value:= O2;
    end
    else if (TVYP_V_Obdobie.Value < ZAKON_2005_09) and (TVYP_Verzia.Value=300) Then
    begin
      SPOCITAJ_ODVODY(
         TVYP_N_zaklad_zp.Value,
         TVYP_N_zaklad_zp.Value,
         TVYP_F_zdravot.Value,
         TVYP_Fz_zdravot.Value,
         TVYP_U_zdrav.Value in PoiPlatiZam,
         TVYP_U_zdrav.Value in PoiPlatiFir,
         O1,O2);
         TVYP_O_zdravot.Value := O1;
         TVYP_Oz_zdravot.Value:= O2;
    end
    else if (TVYP_V_Obdobie.Value < ZAKON_2005_09) and (TVYP_Verzia.Value<>300) Then
    begin
      SPOCITAJ_ODVODY_ZP(
         TVYP_N_zaklad_zp.Value,
         TVYP_N_zaklad_zp.Value,
         TVYP_F_zdravot.Value,
         TVYP_Fz_zdravot.Value,
         TVYP_U_zdrav.Value in PoiPlatiZam,
         TVYP_U_zdrav.Value in PoiPlatiFir,
         O1,O2);
         TVYP_O_zdravot.Value := O1;
         TVYP_Oz_zdravot.Value:= O2;
    end
    else if TVYP_V_Obdobie.Value >= ZAKON_2009_01 Then
    begin
      SPOCITAJ_ODVODY_ZP_200901(
         TVYP_N_zaklad_zp.Value,
         TVYP_N_zaklad_zp.Value,
         TVYP_F_zdravot.Value,
         TVYP_Fz_zdravot.Value,
         TVYP_U_zdrav.Value in PoiPlatiZam,
         TVYP_U_zdrav.Value in PoiPlatiFir,
         O1,O2);
         TVYP_O_zdravot.Value := O1;
         TVYP_Oz_zdravot.Value:= O2;
    end
    else if TVYP_V_Obdobie.Value >= ZAKON_2005_09 Then
    begin
      SPOCITAJ_ODVODY_ZP_200509(
         TVYP_N_zaklad_zp.Value,
         TVYP_N_zaklad_zp.Value,
         TVYP_F_zdravot.Value,
         TVYP_Fz_zdravot.Value,
         TVYP_U_zdrav.Value in PoiPlatiZam,
         TVYP_U_zdrav.Value in PoiPlatiFir,
         O1,O2);
         TVYP_O_zdravot.Value := O1;
         TVYP_Oz_zdravot.Value:= O2;
    end;

    SPOCITAJ_ODVODY(
       KORIGUJ_ZAKLAD(TVYP_N_zaklad_np.Value,TVYP_N_zaklad_poist.Value,MaxNP),
       TVYP_N_zaklad_np.Value,
       TVYP_F_nemoc.Value,
       TVYP_Fz_nemoc.Value,
       TVYP_U_nemoc.Value in PoiPlatiZam,
       TVYP_U_nemoc.Value in PoiPlatiFir,
       O1,O2);
       TVYP_O_nemoc.Value  := O1;
       TVYP_Oz_nemoc.Value := O2;

    SPOCITAJ_ODVODY(
       KORIGUJ_ZAKLAD(TVYP_N_zaklad_dp.Value,TVYP_N_zaklad_poist.Value,MaxDP),
       TVYP_N_zaklad_dp.Value,
       TVYP_F_dochod.Value,
       TVYP_Fz_dochod.Value,
       TVYP_U_dochod.Value in PoiPlatiZam,
       TVYP_U_dochod.Value in PoiPlatiFir,
       O1,O2);
       TVYP_O_dochod.Value  := O1;
       TVYP_Oz_dochod.Value := O2;

    SPOCITAJ_ODVODY(
       KORIGUJ_ZAKLAD(TVYP_N_zaklad_fz.Value,TVYP_N_zaklad_poist.Value,MaxFZ),
       TVYP_N_zaklad_fz.Value,
       TVYP_F_fondz.Value,
       TVYP_Fz_fondz.Value,
       TVYP_U_fondzam.Value in PoiPlatiZam,
       TVYP_U_fondzam.Value in PoiPlatiFir,
       O1,O2);
       TVYP_O_fondzam.Value  := O1;
       TVYP_Oz_fondzam.Value := O2;

    SPOCITAJ_ODVODY(
       KORIGUJ_ZAKLAD(TVYP_N_zaklad_ip.Value,TVYP_N_zaklad_poist.Value,MaxDP),
       TVYP_N_zaklad_ip.Value,
       TVYP_F_invalid.Value,
       TVYP_Fz_invalid.Value,
       TVYP_U_invalid.Value in PoiPlatiZam,
       TVYP_U_invalid.Value in PoiPlatiFir,
       O1,O2);
       TVYP_O_invalid.Value  := O1;
       TVYP_Oz_invalid.Value := O2;

    SPOCITAJ_ODVODY(
       TVYP_N_zaklad_up.Value,
       TVYP_N_zaklad_up.Value,
       0,
       TVYP_Fz_uraz.Value,
       false,
       TVYP_U_uraz.Value in PoiPlatiFir,
       O1,O2);
       TVYP_Oz_uraz.Value := O2;

    SPOCITAJ_ODVODY(
       TVYP_N_zaklad_rf.Value,
       TVYP_N_zaklad_rf.Value,
       0,
       TVYP_Fz_rezerva.Value,
       false,
       TVYP_U_rezerva.Value in PoiPlatiFir,
       O1,O2);
       TVYP_Oz_rezerva.Value := O2;

    SPOCITAJ_ODVODY(
       TVYP_N_zaklad_gp.Value,
       TVYP_N_zaklad_gp.Value,
       0,
       TVYP_Fz_garfond.Value,
       false,
       TVYP_U_garancne.Value in PoiPlatiFir,
       O1,O2);
       TVYP_Oz_garancne.Value := O2;

    {* sucet poistneho za zamestnanca:}
    if TVYP_V_Obdobie.Value >= ZAKON_2011_01 then
    TVYP_N_poist.Value:=
      TVYP_O_zdravot.Value+TVYP_O_nemoc.Value+TVYP_O_dochod.Value+
      TVYP_O_fondzam.Value+TVYP_O_invalid.Value+
      TVYP_N_Poist3.Value
    else
    TVYP_N_poist.Value:=
      TVYP_O_zdravot.Value+TVYP_O_nemoc.Value+TVYP_O_dochod.Value+
      TVYP_O_fondzam.Value+TVYP_O_invalid.Value;

    if TVYP_V_Obdobie.Value < 200001 then
    begin
    {xxxxxxxxxxxxx kod platny len pre rok < 2001 // start}
      Odvod_J := 0;
      Zaklad_J1:=
        TVYP_N_Jednoraz1.Value +
        TVYP_N_Jednoraz2.Value;
      {zdravot}
      if (TVYP_U_zdrav.Value in PoiPlatiZam)
      then begin
        Zaklad_J2:=Zaklad_J1;
        if Zaklad_J2>PARAMETRE[19].Hodnota
        then Zaklad_J2:=PARAMETRE[19].Hodnota;
        Odvod_J:=Odvod_J+
          ZAOKRUHLI(
          TVYP_F_zdravot.Value/100*Zaklad_J2,
          TSET_F_ZAODVOD.Value,TSET_F_SMODVOD.Value);
      end;
      {nemoc}
      Zaklad_J2:=Zaklad_J1;
      if Zaklad_J2>PARAMETRE[20].Hodnota
      then Zaklad_J2:=PARAMETRE[20].Hodnota;
      Odvod_J:=Odvod_J+
        ZAOKRUHLI(
        TVYP_F_nemoc.Value/100*Zaklad_J2,
        TSET_F_ZAODVOD.Value,TSET_F_SMODVOD.Value);
      {dochod}
      Zaklad_J2:=Zaklad_J1;
      if Zaklad_J2>PARAMETRE[21].Hodnota
      then Zaklad_J2:=PARAMETRE[21].Hodnota;
      Odvod_J:=Odvod_J+
        ZAOKRUHLI(
        TVYP_F_dochod.Value/100*Zaklad_J2,
        TSET_F_ZAODVOD.Value,TSET_F_SMODVOD.Value);
      {fondzam}
      Zaklad_J2:=Zaklad_J1;
      if Zaklad_J2>PARAMETRE[22].Hodnota
      then Zaklad_J2:=PARAMETRE[22].Hodnota;
      Odvod_J:=Odvod_J+
        ZAOKRUHLI(
        TVYP_F_fondz.Value/100*Zaklad_J2,
        TSET_F_ZAODVOD.Value,TSET_F_SMODVOD.Value);
      {vysl}
      TVYP_N_poist3.Value:=Odvod_J
    end
    {xxxxxxxxxxxxx kod platny len pre rok < 2001 a roky >= 2011}
    else if TVYP_V_Obdobie.Value < ZAKON_2011_01 then
      TVYP_N_poist3.Value:=0;

    if TVYP_V_obdobie.Value < ZAKON_2011_01 then
    begin
      if TVYP_N_poist3.Value > TVYP_N_poist.Value
        then TVYP_N_poist3.Value := TVYP_N_poist.Value;
    end;
    TVYP_N_poist1.Value := TVYP_N_poist.Value - TVYP_N_poist3.Value;
    {--DDP}
    if PARAMETRE[26].hodnota=1
      then Zaklad_DDP := TVYP_N_brutto.Value
      else Zaklad_DDP := TVYP_V_plat.Value;
    if TVYP_N_sadzba_ddp.Value > 0 then
      TVYP_N_ddp.Value :=
        ZAOKRUHLI(
         Zaklad_DDP * TVYP_N_sadzba_ddp.Value / 100,
         TSET_ZAOKRUH3.Value,TSET_ZAOKRUH3SM.Value);
    if TVYP_Nz_sadzba_ddp.Value > 0 then
      TVYP_Nz_ddp.Value :=
        ZAOKRUHLI(
         Zaklad_DDP * TVYP_Nz_sadzba_ddp.Value / 100,
         TSET_ZAOKRUH3.Value,TSET_ZAOKRUH3SM.Value);
end;end;

procedure TDMV.SET_D_CIASTZD;
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
{
  if TVYP_V_Obdobie.Value>=200001 then
  begin
    TVYP_Dopravne.Value := 0;
    TVYP_Dopravne_mimoriadne.Value :=0;
    TVYP_U_dopravne_mimoriadne.Value := False;
  end;
}
  if (TVYP_V_Obdobie.Value>=199904) and
     (TVYP_V_Obdobie.Value<200001) and
     (TVYP_U_dopravne_mimoriadne.Value) and
     (TVYP_N_Brutto.Value<=PARAMETRE[4].Hodnota)
  then TVYP_Dopravne_mimoriadne.Value := PARAMETRE[5].Hodnota
  else TVYP_Dopravne_mimoriadne.Value := 0;

  if TVYP_Automatika.Value then
  begin
    if (TVYP_V_Obdobie.Value>=199904) and
       (TVYP_V_Obdobie.Value<200001) and
       (TVYP_N_Brutto.Value>PARAMETRE[4].Hodnota) and
       (TVYP_Dopravne.Value > PARAMETRE[1].Hodnota)
    then TVYP_Dopravne.Value := PARAMETRE[1].Hodnota;
  end;
  TVYP_D_CIASTZD1.Value:=
    TVYP_N_Brutto.Value
    - TVYP_N_socfond.Value
    - TVYP_N_odstupne.Value
    - TVYP_N_jednoraz1.Value
    - TVYP_N_jednoraz2.Value
    + TVYP_Pouz_auto.Value
    + TVYP_Zvys_ostatne.Value
    - TVYP_Zniz_ostatne.Value
    + TVYP_Nz_ddp.Value
    - TVYP_N_poist1.Value
    - TVYP_N_nahrada_pn.Value
    - TVYP_Dopravne.Value
    - TVYP_Dopravne_mimoriadne.Value;

// Nedoplatok z roËnÈho z˙Ët. zdrav.poistenia
  if TVYP_Vyrovnanie_zp.Value < 0
   then
     TVYP_D_CIASTZD1.Value:=
       TVYP_D_CIASTZD1.Value
       + TVYP_Vyrovnanie_zp.Value;
(* LegislatÌvna zmena platn· od 1.1.2007
   Preplatky z roËnÈho z˙Ëtovania poistnÈho na zdravotnÈ poistenie uû nie s˙ zaradenÈ medzi
   ostatnÈ prÌjmy podæa ß 8 z·kona.
   V prÌpade zamestnanca ide o prÌjmy zo z·vislej Ëinnosti, v prÌpade SZ»O o poloûku zniûuj˙cu
   sumu daÚovo uplaten˝ch v˝davkov.
*)
// Preplatok z roËnÈho z˙Ët. zdrav.poistenia
   if (TVYP_Vyrovnanie_zp.Value > 0) AND (TVYP_V_obdobie.Value >= ZAKON_2007_01)
   then
     TVYP_D_CIASTZD1.Value:=
       TVYP_D_CIASTZD1.Value
       - TVYP_Vyrovnanie_zp.Value;

  {Od 1.1.2005:
  - prÌspevky na DDS platenÈ zamestnancom mu nezniûuj˙ Ëiastkov˝ z·klad dane
    pri v˝poËte mesaËn˝ch preddavkov - uplatnia sa aû na konci roka.
    Uplatniù si mÙûe sumu max.12000 Sk, okrem prÌspevkov na DDS si uplatniù
    mÙûe i prÌspevky na tzv. ˙ËelovÈ sporenie}
  if TVYP_V_Obdobie.Value < ZAKON_2005_01 then
  begin
  TVYP_D_CIASTZD1.Value:=
    TVYP_D_CIASTZD1.Value - TVYP_N_ddp.Value;
  end;
  TVYP_D_CIASTZD2.Value:= TVYP_N_socfond.Value;

  if TVYP_V_Obdobie.Value >= Zakon_2004_01 then
  begin
     TVYP_D_CIASTZD1.Value:= TVYP_D_CIASTZD1.Value + TVYP_N_socfond.Value;
     TVYP_D_CIASTZD2.Value:= 0;
  end;

  TVYP_D_CIASTZD3.Value:=
    TVYP_N_odstupne.Value+
    TVYP_N_jednoraz1.Value+
    TVYP_N_jednoraz2.Value
    - TVYP_N_poist3.Value;

  if TVYP_V_Obdobie.Value >= 200001 then
  begin
    TVYP_D_CIASTZD1.Value:= TVYP_D_CIASTZD1.Value + TVYP_D_CIASTZD3.Value;
    TVYP_D_CIASTZD3.Value:= 0;
  end;

  if TVYP_D_CIASTZD1.Value < 0 then TVYP_D_CIASTZD1.Value:=0;
  if TVYP_D_CIASTZD2.Value < 0 then TVYP_D_CIASTZD2.Value:=0;
  if TVYP_D_CIASTZD3.Value < 0 then TVYP_D_CIASTZD3.Value:=0;

  if TVYP_Dan_vyrovnana.Value=1 then begin
    TVYP_D_CIASTZD2.Value:=
      TVYP_D_CIASTZD1.Value+TVYP_D_CIASTZD2.Value+TVYP_D_CIASTZD3.Value;
    TVYP_D_CIASTZD1.Value:=0;
    TVYP_D_CIASTZD3.Value:=0;
  end;
  if TVYP_V_Obdobie.Value >= ZAKON_2009_01 then begin
    TVYP_D_CIASTZD1.Value := ZAOKRUHLI(TVYP_D_CIASTZD1.Value,-2,1);
    TVYP_D_CIASTZD2.Value := ZAOKRUHLI(TVYP_D_CIASTZD2.Value,-2,1);
    TVYP_D_CIASTZD3.Value := ZAOKRUHLI(TVYP_D_CIASTZD3.Value,-2,1);
  end;
  TVYP_D_CIASTZD.Value :=
    TVYP_D_CIASTZD1.Value + TVYP_D_CIASTZD3.Value;

end;end;

procedure TDMV.SET_NC_SPOLU;
begin with DM,DMV,DMZ do if TVYP_.State in [dsEdit,dsInsert] then begin
  if NOT TVYP_U_nezdc.Value then
  begin
    TVYP_Nc_minimum.Value:=0;
  end
  else if TZAM_Nc_minimum.AsString<>'' then TVYP_Nc_minimum.Value:=TZAM_Nc_minimum.Value
  else TVYP_Nc_minimum.Value:=PARAMETRE[23].Hodnota;
  if TVYP_V_Obdobie.Value>=200401 then begin
    TVYP_Nc_deti.Value := 0;
  end;
  TVYP_Nc_spolu.Value:=
    TVYP_Nc_minimum.Value+TVYP_Nc_deti.Value+TVYP_Nc_ine.Value;
end;end;

procedure TDMV.SET_D_ZDANMZDA;
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  if TVYP_Dan_vyrovnana.Value=0 then
  begin
    TVYP_D_ZDANMZDA1.Value:=
      TVYP_D_ciastzd1.Value-
      TVYP_Nc_spolu.Value;
    if TVYP_D_ZDANMZDA1.Value < 0 then TVYP_D_ZDANMZDA1.Value :=0;
    if TVYP_V_obdobie.Value >= ZAKON_2009_01 then
      TVYP_D_ZDANMZDA1.Value:= ZAOKRUHLI(TVYP_D_ZDANMZDA1.Value,-2,1) // na eurocenty nadol
    else
    if (TVYP_D_ZDANMZDA1.Value > 0) and (TVYP_D_ZDANMZDA1.Value <= 100) then
      TVYP_D_ZDANMZDA1.Value:= ZAOKRUHLI(TVYP_D_ZDANMZDA1.Value,0,0)
    else
      TVYP_D_ZDANMZDA1.Value:= ZAOKRUHLI(TVYP_D_ZDANMZDA1.Value,TSET_F_ZADANZP.Value,TSET_F_SMDANZP.Value);
    TVYP_D_ZDANMZDA2.Value:=TVYP_D_ciastzd2.Value;
  end else
  begin
    TVYP_D_ZDANMZDA1.Value:=0;
    TVYP_D_ZDANMZDA2.Value:=
      TVYP_D_ciastzd2.Value;
  end;
  if TVYP_V_obdobie.Value >= ZAKON_2009_01 then
    TVYP_D_ZDANMZDA3.Value:= ZAOKRUHLI(TVYP_D_ciastzd3.Value,-2,1)
  else
    TVYP_D_ZDANMZDA3.Value:= ZAOKRUHLI(TVYP_D_ciastzd3.Value,TSET_ZAOKRUH5.Value,TSET_ZAOKRUH5SM.Value);
  if TVYP_D_ZDANMZDA1.Value < 0 then TVYP_D_ZDANMZDA1.Value :=0;
  if TVYP_D_ZDANMZDA2.Value < 0 then TVYP_D_ZDANMZDA2.Value :=0;
  if TVYP_D_ZDANMZDA3.Value < 0 then TVYP_D_ZDANMZDA3.Value :=0;
{
  if TVYP_Dan_vyrovnana.Value=1 then begin
    TVYP_D_ZDANMZDA2.Value := TVYP_D_ZDANMZDA2.Value + TVYP_D_ZDANMZDA1.Value;
    TVYP_D_ZDANMZDA1.Value := 0;
  end;
}
end;end;

procedure TDMV.SET_DANE;
var Zaklad: double;
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
{--zrazkova dan}
  if (TVYP_D_ZDANMZDA2.Value>0) or (TVYP_Dan_vyrovnana.Value=1) then
  begin
    if TVYP_V_obdobie.Value >= ZAKON_2009_01 then begin
      Zaklad:=ZAOKRUHLI(TVYP_D_ZDANMZDA2.Value,-2,1);
      TVYP_D_dan.Value:=ZAOKRUHLI(Zaklad*TVYP_F_Dan_sadzba1.Value/100,-2,1);
    end else begin
      Zaklad:=ZAOKRUHLI(TVYP_D_ZDANMZDA2.Value,0,1);
      TVYP_D_dan.Value:=ZAOKRUHLI(Zaklad*TVYP_F_Dan_sadzba1.Value/100,TSET_ZAOKRUH9.Value,TSET_ZAOKRUH9SM.Value);
    end;
  end
  else TVYP_D_dan.Value:=0;
{--mesacny preddavok}
  if TVYP_Dan_vyrovnana.Value=0 then
  begin
    if TVYP_Dan_nerezident.Value
    then TVYP_D_preddavok1.Value:=0
    else TVYP_D_preddavok1.Value:=MESACNA_DAN(TVYP_D_ZDANMZDA1.Value,TVYP_V_Obdobie.Value);
(*
    TDZP_.Last;
    TVYP_D_preddavok1.Value:=0;
    Zaklad:=TVYP_D_ZDANMZDA1.Value;
    while NOT TDZP_.BOF do
    begin
      if TDZP_D_Od.Value<=Zaklad*12 then
      begin
        TVYP_D_preddavok1.Value:=
          (TDZP_D_sumaplus.Value/12)+TDZP_D_sadzba.Value/100*
          (Zaklad-(TDZP_D_Od.Value/12));
        TVYP_D_preddavok1.Value:=ZAOKRUHLI(TVYP_D_preddavok1.Value,TSET_F_ZAPREDDAV.Value,TSET_F_SMPREDDAV.Value);
        if (TVYP_V_obdobie.Value>=MD.Obdobie_od) AND
           (TVYP_V_obdobie.Value<=MD.Obdobie_do) then
        begin
          TVYP_D_preddavok1.Value:=MD.ZVYS_MESACNU_DAN(TVYP_D_preddavok1.Value);
          TVYP_D_preddavok1.Value:=ZAOKRUHLI(TVYP_D_preddavok1.Value,TSET_F_ZAPREDDAV.Value,TSET_F_SMPREDDAV.Value);
        end;
        break;
      end;
      TDZP_.Prior;
    end;
*)
  end
  else TVYP_D_preddavok1.Value:=0;

{--rocny preddavok}
  if TVYP_V_obdobie.Value >= ZAKON_2009_01 then
  TVYP_D_preddavok3.Value:=
    ZAOKRUHLI(ROCNA_DAN(TVYP_D_zdanmzda3.Value,True),-2,1)
  else
  TVYP_D_preddavok3.Value:=
    ZAOKRUHLI(ROCNA_DAN(TVYP_D_zdanmzda3.Value,True),TSET_F_ZAPREDDAV.Value,TSET_F_SMPREDDAV.Value);
{--preddavok sumarne}
  TVYP_D_preddavok.Value:=
    TVYP_D_preddavok1.Value + TVYP_D_preddavok3.Value;
end;end;

procedure TDMV.SET_N_NETTO;
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  TVYP_D_bonus_cerpany.Value := TVYP_D_bonus_predpis.Value;
{
  if TVYP_D_bonus_predpis.Value > TVYP_D_preddavok.Value
   then TVYP_D_bonus_cerpany.Value := TVYP_D_preddavok.Value
    else TVYP_D_bonus_cerpany.Value := TVYP_D_bonus_predpis.Value;
}
  TVYP_N_Netto.Value:=
    TVYP_N_BRUTTO.Value
  - TVYP_N_POIST.Value
  - TVYP_N_DDP.Value
  - TVYP_D_preddavok.Value
  + TVYP_D_bonus_cerpany.Value
  - TVYP_D_dan.Value
  + TVYP_N_doplatok.Value
  + TVYP_D_vyrovnanie.Value
  + TVYP_Nd_spolu.Value
  + TVYP_Vyrovnanie_zp.Value;

  if TVYP_V_Obdobie.Value >= ZAKON_2009_01 then
  TVYP_N_NETTO.Value:=ZAOKRUHLI(TVYP_N_NETTO.Value,-2,1)
  else
  TVYP_N_NETTO.Value:=ZAOKRUHLI(TVYP_N_NETTO.Value,0,0);
end;end;

procedure TDMV.SET_ZRAZKY;
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  ZISTI_ZRAZKY;
  if (ZRAZKY_P<>0) or (ZRAZKY_O<>0) or (ZRAZKY_X<>0) or (ZRAZKY_Y<>0) or
     (ZRAZKY_S<>0) then
  begin
    TVYP_Ne_poistovna.Value:=ZRAZKY_P;
    TVYP_Ne_odborar.Value:=ZRAZKY_O;
    TVYP_Ne_pozicky.Value:=ZRAZKY_Y;
    TVYP_Ne_exekucia.Value:=ZRAZKY_X+ZRAZKY_S;
  end;
end;end;

procedure TDMV.SET_VYPLATA;
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  if TVYP_Spor_plat.Value=1 then begin
    TVYP_Sporenie.Value:=
      TVYP_N_NETTO.Value
      -TVYP_Ne_zaloha.Value
      -TVYP_Ne_stravne.Value
      -TVYP_Ne_pozicky.Value
      -TVYP_Ne_odborar.Value
      -TVYP_Ne_poistovna.Value
      -TVYP_Ne_exekucia.Value;
    TVYP_Vyplata.Value:=0;
  end else begin
    TVYP_Vyplata.Value:=
      TVYP_N_NETTO.Value
      -TVYP_Ne_zaloha.Value
      -TVYP_Ne_stravne.Value
      -TVYP_Ne_pozicky.Value
      -TVYP_Ne_odborar.Value
      -TVYP_Ne_poistovna.Value
      -TVYP_Ne_exekucia.Value
      -TVYP_Sporenie.Value;
  end;
end;end;

procedure TDMV.DMVCreate(Sender: TObject);
begin
  TVYP_.Close;
end;

procedure TDMV.TVYP_BeforeInsert(DataSet: TDataSet);
begin
  if not UCTUJ_HSV then
    if EXISTUJE_VYPLATA(DMZ.TZAM_Code_emp.Value,DM.AktRok,DM.AktMesiac)
     then raise EMyError.Create(SMyVypUzExistuje);

  if not UCTUJ_MDB then
  if DM.TSYS_POCET_ZAM.Value>0 then
  if POCET_VYPLAT_MES(DM.AktObdobie)>DM.TSYS_POCET_ZAM.Value
  then raise EMyError.Create(Format(SMyAppLimitExceeded,[DM.TSYS_POCET_ZAM.AsString]));

  if (DMZ.TZAM_Vystup.AsString<>'') and
     (DateToObdobie(DMZ.TZAM_Vystup.Value) < DM.AktObdobie)
  then raise EMyError.Create(SMyZamUkoncenyPomer2);

end;

procedure TDMV.TVYP_BeforeDelete(DataSet: TDataSet);
var s:string;
begin
  Kontrola_Datumu_Uzav;
  if MyOtazka(SMyVypVymazatVyplatu) then
  if MyOtazka(SMyVypBudeDefinitivneZrusena) then
  begin
    s:='delete from ":pam98_data:zrv" where code_emp='+TVYP_Code_emp.AsString+
       ' and v_obdobie='+TVYP_V_obdobie.AsString;
    DMSQL.ExecuteSql(s);
    exit;
  end;
  raise EMyError.Create(SMyVypVymazanieBoloZastavene);
end;

procedure TDMV.TVYP_CalcFields(DataSet: TDataSet);
var s1,s2:string[8];
begin
try
  TVYP_CALC_TYPZEC.Value := slTypZecPopis[TVYP_TYPZEC.Value];
except end;
  if DMV.UCTUJ_MDB then exit;
  TVYP_MES.Value:=
    MESIAC(TVYP_V_mesiac.Value,false);
  TVYP_MESROK.Value:=
    DMZ.TZAM_TMP.Value
    +' - v˝plata za '
    +MESIAC(TVYP_V_mesiac.Value,false)
    +' '+TVYP_V_rok.AsString;
  TVYP_CALC_NETTO_ZRAZKY.Value:=
    TVYP_Ne_Pozicky.Value + TVYP_Ne_Odborar.Value +
    TVYP_Ne_poistovna.Value + TVYP_Ne_exekucia.Value;
  TVYP_CALC_TEXT_PREMII.Value:=
    TEXT_TYP_PREMII(TVYP_F_typ_premii.Value);

  s1:=TYP_PRIPL_TO_STRING(TVYP_F_typ_pripl.Value);
  s2:=TYP_PRIPL2_TO_STRING(TVYP_F_typ_pripl2.Value);
  TVYP_CALC_PRIPL_NADCAS.Value :=TEXT_TYP_PRIPLATKOV(StrToInt(Copy(s1,2,1)));
  TVYP_CALC_PRIPL_SOBOTA.Value :=TEXT_TYP_PRIPLATKOV(StrToInt(Copy(s1,3,1)));
  TVYP_CALC_PRIPL_NEDELA.Value :=TEXT_TYP_PRIPLATKOV(StrToInt(Copy(s1,4,1)));
  TVYP_CALC_PRIPL_SVIATOK.Value:=TEXT_TYP_PRIPLATKOV(StrToInt(Copy(s1,5,1)));
  TVYP_CALC_PRIPL_NOC.Value    :=TEXT_TYP_PRIPLATKOV(StrToInt(Copy(s1,6,1)));
  TVYP_CALC_PRIPL_SKODP.Value  :=TEXT_TYP_PRIPLATKOV(StrToInt(Copy(s1,7,1)));
  TVYP_CALC_PRIPL1.Value       :=TEXT_TYP_PRIPLATKOV(StrToInt(Copy(s2,1,1)));
  TVYP_CALC_PRIPL2.Value       :=TEXT_TYP_PRIPLATKOV(StrToInt(Copy(s2,2,1)));
  TVYP_CALC_PRIPL3.Value       :=TEXT_TYP_PRIPLATKOV(StrToInt(Copy(s2,3,1)));
  TVYP_CALC_PRIPL4.Value       :=TEXT_TYP_PRIPLATKOV(StrToInt(Copy(s2,4,1)));
  TVYP_CALC_PRIPL5.Value       :=TEXT_TYP_PRIPLATKOV(StrToInt(Copy(s2,5,1)));

  TVYP_CALC_V_FMES_HOD.Value := '['+
    FloatToStrF(TVYP_V_FMES.Value * TVYP_F_doba.Value,ffGeneral,15,1)+'hod]';
  TVYP_CALC_V_DEN_HOD.Value := '['+
    FloatToStrF(TVYP_V_den.Value * TVYP_F_doba.Value,ffGeneral,15,1)+'hod]';
  TVYP_CALC_HOD_ROZDIEL.Value :=
    FloatToStrF(TVYP_V_hodina.Value-
      (TVYP_V_den.Value * TVYP_F_doba.Value),ffGeneral,15,1)+'hod';
  TVYP_CALC_DAN.Value :=
    TVYP_D_preddavok.Value + TVYP_D_dan.Value - TVYP_D_bonus_cerpany.Value;
  TVYP_CALC_KAL_DNI.Value := KAL_DNI(TVYP_V_Obdobie.Value);
  if (TVYP_V_Obdobie.Value >= ZAKON_2013_01) and (TVYP_Typzec.Value in SetOf_Typzec_DH) then
    TVYP_CALC_Label_odmeny.Value := 'Dohody mimo prac.pomeru'
  else
    TVYP_CALC_Label_odmeny.Value := 'Odmeny';
end;

procedure TDMV.TVYP_NewRecord(DataSet: TDataSet);
var POM1,POM2,POM3:integer;
begin with DM,DMZ do begin
  if not PripustneObdobiePreDemo
   then raise EMyError.Create(SMyAppInvalidObdobie4Demo);
  TVYP_Code_emp.Value     :=TZAM_Code_emp.Value;
  TVYP_V_rok.Value        :=AktRok;
  TVYP_V_mesiac.Value     :=AktMesiac;
  TVYP_V_obdobie.Value    :=AktObdobie;
  Kontrola_Datumu_Uzav;
  TVYP_Verzia.Value       :=MyDbVerzia;
  TVYP_V_kal_dni.Value    :=KAL_DNI(TVYP_V_obdobie.Value);
  TVYP_VYNIMKA_VZ.Value   :=NVL(TZAM_VYNIMKA_VZ.Value);
  TVYP_F_nd_pocita.Value  :=TINF_F_nd_pocita.Value;

  TVYP_F_typ_premii.Value :=TINF_F_typ_premii.Value;
  TVYP_F_sadzba_premii.Value:=TZAM_F_sadzba_premii.Value;
  TVYP_F_poistmax.Value   :=0; //zaklad poistneho od ineho zamestnavatela
  TVYP_PRHRMEZA.Value     :=0;
  TVYP_V_sviatok.Value    :=0;
  TVYP_V_holiday.Value    :=0;
  TVYP_V_absencia.Value   :=0;
  TVYP_V_pn1.Value        :=0;
  TVYP_V_pn2.Value        :=0;
  TVYP_V_nahrada_pn1.Value:=0;
  TVYP_V_nahrada_pn2.Value:=0;
  TVYP_V_ocr1.Value       :=0;
  TVYP_V_ocr2.Value       :=0;
  TVYP_V_ocr12.Value      :=0;
  TVYP_V_nepl_volno.Value :=0;
  TVYP_V_nepoisteny.Value :=0;
  TVYP_V_nepoist_zp.Value :=0;
  TVYP_V_uraz.Value       :=0;
  TVYP_V_materska.Value   :=0;
  TVYP_V_hodina.Value     :=0;
  TVYP_MV_plat.AsString   :=NVL(TZAM_MV_plat.AsString);
  TVYP_Fixny_mv_plat.Value:=TZAM_Fixny_mv_plat.Value;
  TVYP_V_plat.Value       :=0;
  TVYP_V_den.Value        :=0;
  TVYP_V_sadzba.AsString  :=NVL(TZAM_V_sadzba.AsString);
  TVYP_N_holiday.Value    :=0;
  TVYP_N_brutto.Value     :=0;
  TVYP_N_ukolova.Value    :=0;
  TVYP_N_premie.Value     :=0;
  TVYP_N_odmeny.Value     :=0;
  TVYP_N_doplatok.Value   :=0;
  TVYP_N_mimo_poistne.Value :=0;
  TVYP_Vyrovnanie_zp.Value:=0;
  TVYP_Vh_nadcas.Value    :=0;
  TVYP_Vp_nadcas.Value    :=0;
  TVYP_Vh_sobota.Value    :=0;
  TVYP_Vp_sobota.Value    :=0;
  TVYP_Vh_nedela.Value    :=0;
  TVYP_Vp_nedela.Value    :=0;
  TVYP_Vh_sviatok.Value   :=0;
  TVYP_Vp_sviatok.Value   :=0;
  TVYP_Vh_noc.Value       :=0;
  TVYP_Vp_noc.Value       :=0;
  TVYP_Vh_skod.Value      :=0;
  TVYP_Vp_skod.Value      :=0;
  TVYP_Vh_priplat1.Value  :=0;
  TVYP_Vp_priplat1.Value  :=0;
  TVYP_Vh_priplat2.Value  :=0;
  TVYP_Vp_priplat2.Value  :=0;
  TVYP_Vh_priplat3.Value  :=0;
  TVYP_Vp_priplat3.Value  :=0;
  TVYP_Vh_priplat4.Value  :=0;
  TVYP_Vp_priplat4.Value  :=0;
  TVYP_Vh_priplat5.Value  :=0;
  TVYP_Vp_priplat5.Value  :=0;
  TVYP_N_odmeny.Value     :=0;
  TVYP_N_priplat.Value    :=0;
  TVYP_N_dohody_ovp.Value :=0;
  TVYP_N_dohody_opc.Value :=0;
  TVYP_N_nahrada_pn.Value :=0;
  TVYP_O_zdravot.Value    :=0;
  TVYP_O_nemoc.Value      :=0;
  TVYP_O_dochod.Value     :=0;
  TVYP_N_poist.Value      :=0;
  TVYP_O_fondzam.Value    :=0;

  if TVYP_V_Obdobie.Value<200001 then
  begin
  end else
  if TVYP_V_Obdobie.Value >= Zakon_2005_01 then
  begin
    TVYP_Dopravne.Value:= 0;
    TVYP_Dopravne_mimoriadne.Value:= 0;
  end else
  begin
    TVYP_Dopravne.Value:= 0;
    TVYP_Dopravne_mimoriadne.Value:= 0;
    TVYP_U_DOPRAVNE_MIMORIADNE.Value:= False;
  end;
  TVYP_D_ciastzd.Value    :=0;
  TVYP_Pouz_auto.AsString :=NVL(TZAM_Pouz_auto.AsString);
  TVYP_Zvys_ostatne.AsString:=NVL(TZAM_Zvys_ostatne.AsString);
  TVYP_Zniz_ostatne.Value := 0;
{  TVYP_Nc_minimum.AsString:=NVL(TZAM_Nc_minimum.AsString);}
  TVYP_U_NEZDC.Value      :=DMZ.TZAM_VYHL.Value;
  TVYP_Nc_deti.AsString   :='0';
  TVYP_Nc_ine.AsString    :='0';
  TVYP_Nc_spolu.Value     :=0;
  TVYP_Nd_materska.Value  :=0;
  TVYP_Nd_rodic.Value     :=0;
  TVYP_Nd_pridavky.Value  :=0;
  TVYP_Nd_ine.Value       :=0;
  TVYP_Nd_spolu.Value     :=0;
  TVYP_D_zdanmzda.Value   :=0;
  TVYP_D_preddavok.Value  :=0;
  TVYP_D_dan.Value        :=0;
  TVYP_N_netto.Value      :=0;
  TVYP_Ne_Zaloha.AsString   :=NVL(TZAM_Ne_zaloha.AsString);
  TVYP_Ne_Pozicky.AsString  :=NVL(TZAM_Ne_pozicky.AsString);
  TVYP_Ne_Odborar.AsString  :=NVL(TZAM_Ne_odborar.AsString);
  TVYP_Ne_Poistovna.AsString:=NVL(TZAM_Ne_poistovna.AsString);
  TVYP_Ne_Exekucia.AsString :=NVL(TZAM_Ne_exekucia.AsString);
  TVYP_Sporenie.AsString    :=NVL(TZAM_Sporenie.AsString);
  {ddp}
  TVYP_N_ddp.AsString         :=NVL(TZAM_N_ddp.AsString);
  TVYP_N_sadzba_ddp.AsString  :=NVL(TZAM_N_sadzba_ddp.AsString);
  TVYP_Nz_ddp.AsString        :=NVL(TZAM_Nz_ddp.AsString);
  TVYP_Nz_sadzba_ddp.AsString :=NVL(TZAM_Nz_sadzba_ddp.AsString);
  {end ddp}
  TVYP_Vyplata.Value      :=0;
  TVYP_V_pn.Value         :=0;
  TVYP_N_pn1.Value        :=0;
  TVYP_N_pn2.Value        :=0;
  TVYP_N_ocr.Value        :=0;
  TVYP_N_ocr1.Value       :=0;
  TVYP_N_ocr2.Value       :=0;
  TVYP_N_zaklad_poist.Value:=0;
  TVYP_Spor_plat.Value    :=TZAM_Spor_plat.Value;
  TVYP_U_zdrav.Value      :=TZAM_U_zdrav.Value;
  TVYP_U_nemoc.Value      :=TZAM_U_nemoc.Value;
  TVYP_U_dochod.Value     :=TZAM_U_dochod.Value;
  TVYP_U_fondzam.Value    :=TZAM_U_fondzam.Value;
  TVYP_U_zdrav1.Value     :=TSET_U_zdrav1.Value;
  TVYP_Rezerva1.Value     :=TINF_F_odstupm.Value;
  TVYP_U_nemoc1.Value     :=TSET_U_nemoc1.Value;
  TVYP_U_dochod1.Value    :=TSET_U_dochod1.Value;
  TVYP_U_fondzam1.Value   :=TSET_U_fondzam1.Value;
  TVYP_U_zdrav2.Value     :=TSET_U_zdrav2.Value;
  TVYP_U_nemoc2.Value     :=TSET_U_nemoc2.Value;
  TVYP_U_dochod2.Value    :=TSET_U_dochod2.Value;
  TVYP_U_fondzam2.Value   :=TSET_U_fondzam2.Value;
  TVYP_U_invalid.Value    :=TZAM_U_invalid.Value;
  TVYP_U_uraz.Value       :=TZAM_U_uraz.Value;
  TVYP_U_rezerva.Value    :=TZAM_U_rezerva.Value;
  TVYP_U_garancne.Value   :=TZAM_U_garancne.Value;
  TVYP_U_materska.Value   :=false;
  TVYP_U_rodic.Value      :=false;
  TVYP_N_socfond.Value    :=0;
  TVYP_D_ciastzd2.Value   :=0;
  TVYP_D_zdanmzda2.Value  :=0;
  TVYP_D_vyrovnanie.Value :=0;
  TVYP_N_clenovia_organov.Value:=0;
  TVYP_Ne_Stravne.Value   :=0;
  TVYP_N_odstupne.Value   :=0;
  TVYP_N_pohotovost.Value :=0;
  TVYP_N_jednoraz1.Value  :=0;
  TVYP_V_mesiace1.Value   :=0;
  TVYP_N_jednoraz2.Value  :=0;
  TVYP_V_mesiace2.Value   :=0;
  TVYP_ZPS.Value          :=TZAM_ZPS.Value;
  TVYP_ZTP.Value          :=TZAM_ZTP.Value;
  TVYP_Vh_nahrada.Value   :=0;
  TVYP_Vh_nemohol.Value   :=0;
  TVYP_Rezerva2.Value     :=0; {pouzite vo vyzname vreckove pri zahranicnych pracovnych cestach}
  TVYP_Rezerva3.Value     :=0; {zatial nepouzite}
  TVYP_Automatika.Value   :=True;
  TVYP_U_sviatky.Value    :=TZAM_U_sviatky.Value;
  if TVYP_U_sviatky.Value then
    TVYP_V_sviatok.Value  :=GET_FSVIAT(TVYP_V_MESIAC.Value);
  if (TZAM_DAN_ZRAZKOU.Value)
   then TVYP_Dan_vyrovnana.Value:=1
   else TVYP_Dan_vyrovnana.Value:=0;
  TVYP_F_dan_sadzba1.Value := TSET_F_dan_sadzba1.Value;
  TVYP_F_dan_maximum1.Value:=TSET_F_dan_maximum1.Value;
  TVYP_N_oslobodeny.Value :=0;
  TVYP_N_nadcas.Value :=0;
  TVYP_Nd_rucne.Value :=False;
  TVYP_Nd_materska.Value  :=0;
  TVYP_Nd_pridavky.Value  :=0;
  TVYP_Nd_ine.Value       :=0;
  if TVYP_V_Obdobie.Value >= 200401 then
  begin
    DMZ.POCTY_DETI(POM1,POM2,POM3);
    TVYP_POC_NEZAOP_DETI.Value := POM1;
    TVYP_D_BONUS_PREDPIS.Value := POM2 * PARAMETRE[28].Hodnota;
    TVYP_Nd_pridavky.Value     := POM3 * PARAMETRE[24].Hodnota;
    TVYP_Nc_deti.Value         := 0;
  end
  else begin
    TVYP_POC_NEZAOP_DETI.Value := 0;
    TVYP_D_BONUS_PREDPIS.Value := 0;
    TVYP_Nc_deti.Value         := 0;
  end;
  SET_V_FMES;
  SET_FROM_SETUP;
  SET_V_PRIEMER1;

  if TVYP_V_Obdobie.Value < Zakon_2004_01 then SET_V_PRIEMER3;
  PRENES_ZRAZKY_ZO_ZAMESTNANCA;
  PRENES_VYKONY_ZO_ZAMESTNANCA;
  if AktVelkyZavod then begin
    if TVYP_U_materska.Value then TVYP_V_materska.Value := TVYP_V_fmes.Value;
    if TVYP_U_rodic.Value then TVYP_Nd_rodic.Value := PARAMETRE[16].Hodnota;
  end;
  TVYP_CISTA_DENNA_MZDA.AsString := NVL(TZAM_PN_DENNE.AsString);
  if TVYP_V_Obdobie.Value >= Zakon_2004_01 then
    TVYP_V_priemer2.AsString := NVL(TZAM_PN_DENNE.AsString);
  TVYP_PocDniStrajku.Value := 0;
  TVYP_PoSkonceni.Value := False;
  TVYP_TYPZEC.Value := TZAM_TYPZEC.Value;
  SET_ALL;
end;end;

procedure TDMV.SET_ALL;
begin
  SET_FROM_SETUP;
  SET_V_PLAT;
  SET_N_PRIPLAT;
  SET_N_PREMIE;
  SET_N_MZDA;
  SET_UPRAV_PRIEMERY;
  SET_N_NAHRADA;
  SET_N_HOLIDAY;
  SET_N_SVIATOK;
  SET_POMOCNE;
  SET_N_BRUTTO;
  SET_ODVODY;
  SET_D_CIASTZD;
  SET_NC_SPOLU;
  SET_N_PN;
  SET_D_ZDANMZDA;
  SET_DANE;
  SET_N_NETTO;
  SET_ZRAZKY;
  SET_VYPLATA;
end;

procedure TDMV.SET_ALL_VYPNP;
var
  DODPRAC,DSPOLU,DPOIST:double;
  MaxZP,MaxDP,MaxNP,MaxFZ,kuvik:double;
  O1,O2:double;
function ROB_ODVOD(iZaklad,iSadzba:double):double;
begin with DM,DMV do begin
  if iZaklad <= 0 then Result := 0
  else begin
    kuvik := iZaklad * iSadzba / 100;
    Result := ZAOKRUHLI(kuvik,-2,1) //zaokr˙hli dole na 2 desatinnÈ miesta
  end;
end;end;
procedure ROB_ODVODY(
iZaklad,iSadzba1,iSadzba2:double;
var oOdvod1,oOdvod2:double);
begin
  if (iZaklad<0) then iZaklad:=0;
  oOdvod1:=ROB_ODVOD(iZaklad,iSadzba1);
  oOdvod2:=ROB_ODVOD(iZaklad,iSadzba2);
end;
begin with DM,DMV do if TVYPNP_.State in [dsEdit,dsInsert] then begin
  if TVYPNP_V_mesiac_vyp.AsString = '' then exit;
  if TVYPNP_V_mesiac_vyp.Value > MyMesiac(TVYPNP_V_obdobie.Value)
  then
  TVYPNP_V_obdobie_vyp.Value :=
    (MyRok(TVYPNP_V_obdobie.Value)-1) * 100 + TVYPNP_V_mesiac_vyp.Value
  else
  TVYPNP_V_obdobie_vyp.Value :=
    MyRok(TVYPNP_V_obdobie.Value) * 100 + TVYPNP_V_mesiac_vyp.Value;

  if TVYPNP_Kal_dni.AsString = '' then
    TVYPNP_Kal_dni.Value := KAL_DNI (TVYPNP_V_obdobie_vyp.Value);
  {predzaokruhlenie zakladov}
  TVYPNP_N_zaklad_dp.Value:=ZAOKRUHLI(TVYPNP_N_zaklad_dp.Value,-2,1);
  TVYPNP_N_zaklad_np.Value:=ZAOKRUHLI(TVYPNP_N_zaklad_np.Value,-2,1);
  TVYPNP_N_zaklad_fz.Value:=ZAOKRUHLI(TVYPNP_N_zaklad_fz.Value,-2,1);
  TVYPNP_N_zaklad_ip.Value:=ZAOKRUHLI(TVYPNP_N_zaklad_ip.Value,-2,1);
  TVYPNP_N_zaklad_up.Value:=ZAOKRUHLI(TVYPNP_N_zaklad_up.Value,-2,1);
  TVYPNP_N_zaklad_rf.Value:=ZAOKRUHLI(TVYPNP_N_zaklad_rf.Value,-2,1);
  TVYPNP_N_zaklad_gp.Value:=ZAOKRUHLI(TVYPNP_N_zaklad_gp.Value,-2,1);
  {konstanty pre vypocet}
  MaxZP := PARAMETRE[19].Hodnota;
  MaxDP := PARAMETRE[21].Hodnota;
  MaxNP := PARAMETRE[20].Hodnota;
  MaxFZ := PARAMETRE[22].Hodnota;
  {korekcia max.zakladov podla poctu dni poistenia}
  DSPOLU:=KAL_DNI(TVYPNP_V_obdobie_vyp.Value);
  if DSPOLU=0 then exit;
  DPOIST:=TVYPNP_Kal_dni.Value;
  if DPOIST>DSPOLU then DPOIST:=DSPOLU;
  if DPOIST<>DSPOLU then begin
      MaxDP := ZAOKRUHLI(ZAOKRUHLI(MaxDP / DSPOLU,-4,2) * DPOIST,-2,2);
      MaxNP := ZAOKRUHLI(ZAOKRUHLI(MaxNP / DSPOLU,-4,2) * DPOIST,-2,2);
      MaxFZ := ZAOKRUHLI(ZAOKRUHLI(MaxFZ / DSPOLU,-4,2) * DPOIST,-2,2);
  end;
  { kontrola na maximalnu vysku zakladu }
  if TVYPNP_N_zaklad_dp.Value>MaxDP then TVYPNP_N_zaklad_dp.Value:=MaxDP;
  if TVYPNP_N_zaklad_ip.Value>MaxDP then TVYPNP_N_zaklad_ip.Value:=MaxDP;
  if TVYPNP_N_zaklad_np.Value>MaxNP then TVYPNP_N_zaklad_np.Value:=MaxNP;
  if TVYPNP_N_zaklad_fz.Value>MaxFZ then TVYPNP_N_zaklad_fz.Value:=MaxFZ;
  if TVYPNP_N_zaklad_rf.Value>MaxDP then TVYPNP_N_zaklad_rf.Value:=MaxDP;
  if TVYPNP_N_zaklad_gp.Value>MaxNP then TVYPNP_N_zaklad_gp.Value:=MaxNP;
  {}
 ROB_ODVODY(
    TVYPNP_N_zaklad_np.Value,
    TVYP_F_nemoc.Value,
    TVYP_Fz_nemoc.Value,
    O1,O2);
 TVYPNP_O_np.Value  := O1;
 TVYPNP_Oz_np.Value := O2;

 ROB_ODVODY(
    TVYPNP_N_zaklad_dp.Value,
    TVYP_F_dochod.Value,
    TVYP_Fz_dochod.Value,
    O1,O2);
 TVYPNP_O_dp.Value  := O1;
 TVYPNP_Oz_dp.Value := O2;

 ROB_ODVODY(
    TVYPNP_N_zaklad_fz.Value,
    TVYP_F_fondz.Value,
    TVYP_Fz_fondz.Value,
    O1,O2);
 TVYPNP_O_fz.Value  := O1;
 TVYPNP_Oz_fz.Value := O2;

 ROB_ODVODY(
    TVYPNP_N_zaklad_ip.Value,
    TVYP_F_invalid.Value,
    TVYP_Fz_invalid.Value,
    O1,O2);
 TVYPNP_O_ip.Value  := O1;
 TVYPNP_Oz_ip.Value := O2;

 ROB_ODVODY(
    TVYPNP_N_zaklad_up.Value,
    0,
    TVYP_Fz_uraz.Value,
    O1,O2);
 TVYPNP_Oz_up.Value := O2;

 ROB_ODVODY(
    TVYPNP_N_zaklad_rf.Value,
    0,
    TVYP_Fz_rezerva.Value,
    O1,O2);
 TVYPNP_Oz_rf.Value := O2;

 ROB_ODVODY(
    TVYPNP_N_zaklad_gp.Value,
    0,
    TVYP_Fz_garfond.Value,
    O1,O2);
 TVYPNP_Oz_gp.Value := O2;

end;end;

procedure TDMV.TVYP_BeforePost(DataSet: TDataSet);
begin
  SET_ALL;
  if TVYP_Dan_vyrovnana.Value = 1 then
  begin
    if TVYP_V_obdobie.Value >= ZAKON_2006_01 then
    begin
      if (TVYP_U_nezdc.Value) or (TVYP_d_bonus_cerpany.Value<>0) or
         (TVYP_D_CIASTZD1.Value+
          TVYP_D_CIASTZD2.Value+
          TVYP_D_CIASTZD3.Value+
          TVYP_N_poist.Value > PARAMETRE[31].Hodnota) then
      if not MyOtazka(Format(SMyVypOtazkaUplatnitZrazkovuDan,[FloatToStr(PARAMETRE[31].Hodnota)+' '+DM.NasaMena]))
        then Abort;
    end;
  end;
{
  if (TVYP_N_jednoraz1.Value > 0) and (TVYP_V_mesiace1.Value=0) then
  begin
    MyError(SMyVypMesiaceTrebaVyplnit);
    Abort;
  end;
  if (TVYP_N_jednoraz2.Value > 0) and (TVYP_V_mesiace2.Value=0) then
  begin
    MyError(SMyVypMesiaceTrebaVyplnit);
    Abort;
  end;
}
  if (TVYP_V_plat.Value > 0) and (TVYP_V_Den.Value = 0) then
  begin
    MyError(SMyVypOdpracDniTrebaVyplnit);
    Abort;
  end;
  if (TVYP_V_plat.Value > 0) and (TVYP_V_Hodina.Value = 0) then
  begin
    MyError(SMyVypOdpracHodinyTrebaVyplnit);
    Abort;
  end;
  if TVYP_V_obdobie.Value <= DateToObdobie(DM.TINF_Datum_Uzav.Value) then
  begin
    MyError(Format(SMyAppZakazRobitZmeny,[DM.TINF_Datum_Uzav.AsString]));
    Abort;
 end;
 if TVYP_Vynimka_vz.AsString='' then TVYP_Vynimka_VZ.Value := '0';
 if (TVYP_V_Obdobie.Value >= ZAKON_2013_01) and (TVYP_N_Dohody_ovp.Value <> 0) then begin
    MyError(SMyVypPoloykaDohodyNesmieBytVyplnena);
    Abort;
 end;
end;

procedure TDMV.SET_FROM_SETUP;
begin with DM,DMZ,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  TVYP_SID.Value          :=DMZ.TZAM_SID.Value;
  TVYP_ZPS.Value          :=DMZ.TZAM_ZPS.Value;
  TVYP_ZTP.Value          :=DMZ.TZAM_ZTP.Value;
  TVYP_Miera_poklesu.Value:=DMZ.TZAM_Miera_poklesu.Value;
  TVYP_KZP.Value          :=DMZ.TZAM_KZP.Value;
  TVYP_KDP.Value          :=DMZ.TZAM_KDP.Value;
  TVYP_F_doba.Value       :=DMZ.TZAM_F_doba.Value;
  TVYP_Fixny_mv_plat.Value:=DMZ.TZAM_Fixny_mv_plat.Value;
  TVYP_Dan_nerezident.Value:=DMZ.TZAM_Dan_nerezident.Value;
  {}
  TVYP_F_dan_sadzba1.Value := TSET_F_dan_sadzba1.Value;
  TVYP_F_dan_maximum1.Value:=TSET_F_dan_maximum1.Value;

  TVYP_F_nd_pocita.Value  :=DM.TINF_F_nd_pocita.Value;
  {--}
  TVYP_F_nadcas.Value     :=DM.TINF_F_nadcas.Value;
  TVYP_F_sobota.Value     :=DM.TINF_F_sobota.Value;
  TVYP_F_nedela.Value     :=DM.TINF_F_nedela.Value;
  TVYP_F_sviatok.Value    :=DM.TINF_F_sviatok.Value;
  TVYP_F_noc.Value        :=DM.TINF_F_noc.Value;
  TVYP_F_skod.Value       :=DM.TINF_F_skod.Value;
  {--}
  TVYP_F_priplat1.Value   :=DM.TINF_F_priplat1.Value;
  TVYP_F_priplat2.Value   :=DM.TINF_F_priplat2.Value;
  TVYP_F_priplat3.Value   :=DM.TINF_F_priplat3.Value;
  TVYP_F_priplat4.Value   :=DM.TINF_F_priplat4.Value;
  TVYP_F_priplat5.Value   :=DM.TINF_F_priplat5.Value;
  {--}
  TVYP_F_pn_dni.Value     :=DM.TSET_F_pn_dni.Value;
  TVYP_F_pn1.Value        :=DM.TSET_F_pn1.Value;
  TVYP_F_pn2.Value        :=DM.TSET_F_pn2.Value;
  TVYP_F_ocr.Value        :=DM.TSET_F_pn2.Value;
  TVYP_F_uraz.Value       :=DM.TSET_F_uraz.Value;
  TVYP_F_nemmax.Value     :=DM.TSET_F_nemmax.Value;

  TVYP_F_nd_pocita.Value  :=DM.TINF_F_nd_pocita.Value;
  TVYP_F_poistne.Value    :=DM.TINF_F_poistne.Value;
  TVYP_F_typ_pripl.Value  :=DM.TINF_F_typ_pripl.Value;
  TVYP_F_typ_pripl2.Value :=DM.TINF_F_typ_pripl2.Value;
  TVYP_F_firma_zps.Value  :=DM.TINF_F_firma_zps.Value;
  TVYP_ZPS1.Value         :=DM.TINF_F_nemocd.Value=1;
  TVYP_F_typ_ulavy_sp.Value:=DM.TINF_F_typ_ulavy_sp.Value;
  TVYP_F_typ_ulavy_fz.Value:=DM.TINF_F_typ_ulavy_fz.Value;
  {}
  TVYP_F_zdravot.Value   :=TSET_F_zdravot.Value;
  TVYP_F_nemoc.Value     :=TSET_F_nemoc.Value;
  TVYP_F_dochod.Value    :=TSET_F_dochod.Value;
  TVYP_F_fondz.Value     :=TSET_F_fondz.Value;
  if TVYP_V_obdobie.Value >= ZAKON_2005_01 Then
    TVYP_F_min_mzda.Value  :=PARAMETRE[30].Hodnota;
  if TVYP_V_kal_dni.Value = 0 then
    TVYP_V_kal_dni.Value    :=KAL_DNI(TVYP_V_obdobie.Value);
  if TVYP_V_Obdobie.Value>=Zakon_2005_01
   then TVYP_U_SDS.Value:= TZAM_U_SDS.Value
    else TVYP_U_SDS.Value:= 0;
end;end;

procedure TDMV.TRZP_NewRecord(DataSet: TDataSet);
begin
  TRZP_Code_emp.Value         := DMZ.TZAM_Code_emp.Value;
  TRZP_V_rok.Value            := DM.AktRok;
  TRZP_Ciastzd1.Value         := 0;
  TRZP_Ciastzd2.Value         := 0;
  TRZP_Ciastzd_spolu.Value    := 0;
  TRZP_Nc_minimum.Value       := 0;
  TRZP_Nc_deti.Value          := 0;
  TRZP_Nc_partner.Value       := 0;
  TRZP_Nc_invalid_ciast.Value := 0;
  TRZP_Nc_invalid_ztp.Value   := 0;
  TRZP_Nc_dary.Value          := 0;
  TRZP_Nc_spolu.Value         := 0;
  TRZP_Zdanmzda.Value         := 0;
  TRZP_Zdanmzda_round.Value   := 0;
  TRZP_Dan.Value              := 0;
  TRZP_Preddavky1.Value       := 0;
  TRZP_Preddavky2.Value       := 0;
  TRZP_Uhrn_preddavkov.Value  := 0;
  TRZP_Preplatok.Value        := 0;
  TRZP_Uhrn_nepenaznych.Value := 0;
  TRZP_Nedoplatok_nepenaznych.Value := 0;
  TRZP_D_bonus_narok.Value    := 0;
  TRZP_D_bonus_cerpany.Value  := 0;
  TRZP_Nc_ucelove_sporenie.Value   := 0;
  TRZP_Nc_zivotne_poistenie.Value  := 0;
  TRZP_Nc_do_limitu.Value          := 0;
  TRZP_Uplatnuje_Nc_Minimum.Value  := True;
  TRZP_Uplatnuje_Nc_Partner.Value  := False;
  TRZP_Nc_partner_prijem.Value     := 0;
  TRZP_Nc_partner_mesiacov.Value   := 12;
  TRZP_Nc_minimum_dochodok.Value   := 0;
  TRZP_Zdravotnici_vzdelavanie.Value := 0;
  TRZP_Zdravotnici_zvysenie.Value := 0;
  TRZP_Premia_zaklad.Value        := 0;
  TRZP_Premia_mesiacov.Value      := 0;
  TRZP_Premia_suma.Value          := 0;
  TRZP_Premia_narok.Value         := False;
  TRZP_Premia_manualne.Value      := False;
end;

procedure TDMV.TRZP_AfterInsert(DataSet: TDataSet);
begin
  if TRZP_V_rok.Value < 2006 then
  begin
    QRZP_.Close;
    QRZP_.ParamByName('P1').AsInteger := TRZP_Code_emp.Value;
    QRZP_.ParamByName('P2').AsInteger := TRZP_V_rok.Value;
    QRZP_.Open;
    TRZP_Ciastzd1.Value       := QRZP_D_ciastzd.Value;
    TRZP_Preddavky1.Value     := QRZP_D_preddavok.Value;
    TRZP_Pom_nc_minimum.Value := QRZP_Nc_minimum.Value;
    TRZP_Pom_nc_deti.Value    := QRZP_Nc_deti.Value;
    TRZP_Pom_nc_ine.Value     := QRZP_Nc_ine.Value;
    TRZP_Poistne.Value        := QRZP_N_poist.Value;
    if TRZP_V_rok.Value >= 2011 then
    TRZP_DDP.Value            := QRZP_O_zdravot.Value {Od roku 2011 sa do DDP plni odvod ZP}
    else
    TRZP_DDP.Value            := QRZP_N_ddp.Value;
    if TRZP_V_rok.Value >= 2005 then
      TRZP_Uhrn_brutto.Value  := QRZP_N_brutto.Value - QRZP_N_ddp.Value
    else
      TRZP_Uhrn_brutto.Value  := QRZP_N_brutto.Value;

    TRZP_Uhrn_osobitna.Value  := QRZP_D_osobitna.Value;
    TRZP_Dan_osobitna.Value   := QRZP_D_dan.Value;
    TRZP_D_bonus_narok.Value  := QRZP_D_bonus_narok.Value;
    TRZP_D_bonus_cerpany.Value:= QRZP_D_bonus_cerpany.Value;
    QRZP_.Close;
  end else
  if TRZP_V_rok.Value >= 2006 then
  begin
    QRZP07_.Close;
    QRZP07_.ParamByName('P1').AsInteger := TRZP_Code_emp.Value;
    QRZP07_.ParamByName('P2').AsInteger := TRZP_V_rok.Value;
    QRZP07_.Open;
    if TRZP_V_rok.Value >= 2012 then begin
      QRZP12_.Close;
      QRZP12_.ParamByName('P2').AsInteger := TRZP_V_rok.Value;
      QRZP12_.ParamByName('born_numb').Value := DMZ.TZAM_Born_numb.Value;
      QRZP12_.Open;
    end;
    TRZP_Ciastzd1.Value       := QRZP07_D_ciastzd.Value;
    if (QRZP07_Vyrovnanie_zp.Value > 0) AND (TRZP_V_rok.Value = 2006)
      then TRZP_Ciastzd1.Value := TRZP_Ciastzd1.Value + QRZP07_Vyrovnanie_zp.Value;
    TRZP_Preddavky1.Value     := QRZP07_D_preddavok.Value;
    TRZP_Pom_nc_minimum.Value := QRZP07_Nc_minimum.Value;
    TRZP_Pom_nc_deti.Value    := QRZP07_Nc_deti.Value;
    TRZP_Pom_nc_ine.Value     := QRZP07_Nc_ine.Value;
    TRZP_Poistne.Value        := QRZP07_N_poist.Value;
    if TRZP_V_rok.Value >= 2011
      then TRZP_DDP.Value := QRZP07_O_zdravot.Value {Od roku 2011 sa do DDP plni odvod ZP}
      else TRZP_DDP.Value := QRZP07_N_ddp.Value;
    TRZP_Uhrn_brutto.Value    := QRZP07_N_brutto.Value;
    if (QRZP07_Vyrovnanie_zp.Value > 0) AND (TRZP_V_rok.Value = 2006)
      then TRZP_Uhrn_brutto.Value := TRZP_Uhrn_brutto.Value + QRZP07_Vyrovnanie_zp.Value;
    TRZP_Uhrn_osobitna.Value  := QRZP07_D_osobitna.Value;
    TRZP_Dan_osobitna.Value   := QRZP07_D_dan.Value;
    TRZP_D_bonus_narok.Value  := QRZP07_D_bonus_narok.Value;
    TRZP_D_bonus_cerpany.Value:= QRZP07_D_bonus_cerpany.Value;
    if TRZP_V_rok.Value >= 2012 then begin
      TRZP_Uhrn_prijmov_dohody.Value:= QRZP12_N_dohody.Value;
      QRZP12_.Close;
    end;
    QRZP07_.Close;
  end;
  if DMZ.TZAM_VYHL.Value then
    TRZP_Nc_minimum.Value   := PARAMETRE[23].Hodnota * 12;
  SET_RZP;
end;

function MESACNA_DAN_BEZ_ZAOKRUH(Zaklad:double): double;
begin with DM do begin
  Result:=0;
  TDZP_.Last;
  while NOT TDZP_.BOF do
  begin
    if TDZP_D_Od.Value<=Zaklad*12 then
    begin
      Result:=
        (TDZP_D_sumaplus.Value/12)+TDZP_D_sadzba.Value/100*
        (Zaklad-(TDZP_D_Od.Value/12));
      if (AktObdobie>=MD.Obdobie_od) AND
         (AktObdobie<=MD.Obdobie_do) then
      begin
        Result:=MD.ZVYS_MESACNU_DAN(Result);
      end;
      break;
    end;
    TDZP_.Prior;
  end;
end;end;

function MESACNA_DAN(Zaklad:double;iObdobie:longint): double;
begin with DM do begin
  if iObdobie >= ZAKON_2009_01 then
  Result:=ZAOKRUHLI(MESACNA_DAN_BEZ_ZAOKRUH(Zaklad),-2,1)
  else
  Result:=ZAOKRUHLI(MESACNA_DAN_BEZ_ZAOKRUH(Zaklad)
         ,TSET_F_ZAPREDDAV.Value,TSET_F_SMPREDDAV.Value)
end;end;

function ROCNA_DAN(Zaklad:double;IbaPreddavok:boolean): double;
var rok1,rok2:longint;
begin with DM do begin
  Result:=0;
  TDZP_.Last;
  while NOT TDZP_.BOF do
  begin
    if TDZP_D_Od.Value<=Zaklad then
    begin
      Result:=
        TDZP_D_sumaplus.Value+
        TDZP_D_sadzba.Value/100*(Zaklad-TDZP_D_Od.Value);
      rok1:=MD.obdobie_od div 100;
      rok2:=(MD.obdobie_do div 100) - 1;
      if IbaPreddavok AND (AktObdobie>=MD.Obdobie_od) AND
         (AktObdobie<=MD.obdobie_do) then
      begin
        Result:= MD.ZVYS_ROCNU_DAN(Result);
      end else
      if (NOT IbaPreddavok) AND (AktRok>=rok1) AND (AktRok<=rok2)
         AND (MD.RZP = 1) then
      begin
        Result:= MD.ZVYS_ROCNU_DAN(Result);
      end;
      break;
    end;
    TDZP_.Prior;
  end;
end;end;

procedure TDMV.SET_RZP;
{
Rok:2011
Polozka DDP sa pouziva na urcenie sumy odvedeneho zdravotneho poistenia
}
var PomVypocet,PomVypocet1: double;
    Nc_osoba_rocna: double;
    Nc_koeficient: double; {4}
    Nc_osoba_prijem_MIN: double;
    Nc_osoba_prijem_MAX: double;
    Nc_partner_prijem_MIN: double;
    Nc_partner_prijem_MAX: double;
    Zaklad_Premia: double;
    Poistne_Premia: double;
    IX:longint;

begin if TRZP_.State in [dsEdit,dsInsert] then begin
  if TRZP_V_rok.Value >= 2009 then
    NC_osoba_rocna := PARAMETRE[37].Hodnota
  else
    NC_osoba_rocna := PARAMETRE[23].Hodnota * 12;

  NC_koeficient := 4;
  if TRZP_V_rok.Value >= 2011 then
  begin
    TRZP_Ciastzd1.Value :=
      TRZP_Uhrn_brutto.Value -
      TRZP_Poistne.Value
  end else
  if TRZP_V_rok.Value >= 2007 then
  begin
    TRZP_Ciastzd1.Value :=
      TRZP_Uhrn_brutto.Value -
      TRZP_Poistne.Value -
      TRZP_Zdravotnici_vzdelavanie.Value;
  end else
  if TRZP_V_rok.Value >= 2005 then
  begin
    TRZP_Ciastzd1.Value :=
      TRZP_Uhrn_brutto.Value -
      TRZP_Poistne.Value;
  end else
  if TRZP_V_rok.Value >= 2002 then
  begin
    TRZP_Ciastzd1.Value :=
      TRZP_Uhrn_brutto.Value -
      TRZP_Poistne.Value -
      TRZP_DDP.Value;
  end;

  if TRZP_V_rok.Value>=2009 then
  TRZP_Ciastzd_spolu.Value :=
    TRZP_Ciastzd1.Value +
    TRZP_Ciastzd2.Value +
    TRZP_Zdravotnici_zvysenie.Value
  else
  TRZP_Ciastzd_spolu.Value :=
    TRZP_Ciastzd1.Value +
    TRZP_Ciastzd2.Value;

   if ((TRZP_V_rok.Value>=2004) AND (TRZP_V_rok.Value<2009)) then
     TRZP_Ciastzd_spolu.Value := ZAOKRUHLI(TRZP_Ciastzd_spolu.Value,0,1)
   else if TRZP_V_rok.Value>=2009 then
     TRZP_Ciastzd_spolu.Value := ZAOKRUHLI(TRZP_Ciastzd_spolu.Value,-2,1);

  if TRZP_V_rok.Value < 2004 then
    TRZP_Nc_spolu.Value :=
      TRZP_Nc_minimum.Value +
      TRZP_Nc_deti.Value +
      TRZP_Nc_partner.Value +
      TRZP_Nc_invalid_ciast.Value +
      TRZP_Nc_invalid_ztp.Value +
      TRZP_Nc_dary.Value
  else if TRZP_V_rok.Value < 2005 then
    TRZP_Nc_spolu.Value :=
      TRZP_Nc_minimum.Value +
      TRZP_Nc_partner.Value
  else if TRZP_V_rok.Value < 2007 then
  begin
    TRZP_NC_do_limitu.Value :=
      TRZP_Nc_ucelove_sporenie.Value +
      TRZP_Nc_zivotne_poistenie.Value +
      TRZP_DDP.Value;
    if TRZP_NC_do_limitu.Value > 12000 then
      TRZP_NC_do_limitu.Value := 12000;
    TRZP_Nc_spolu.Value :=
      TRZP_Nc_minimum.Value +
      TRZP_Nc_partner.Value +
      TRZP_NC_do_limitu.Value;
  end else if TRZP_V_rok.Value >=2007 then
  begin
    if PARAMETRE[36].Hodnota = 0 then
    raise EMyError.Create(SMyRzpChybaHranicaPreNezdCiastku);

    if TRZP_Uplatnuje_Nc_minimum.Value then begin
      TRZP_Nc_minimum.Value := Nc_osoba_rocna;
      Nc_osoba_prijem_MIN := PARAMETRE[36].Hodnota;
      Nc_osoba_prijem_MAX := Nc_osoba_prijem_MIN + Nc_osoba_rocna * Nc_koeficient;
      if TRZP_Ciastzd_spolu.Value >= Nc_osoba_prijem_MAX {880464} then PomVypocet:=0 else
      if TRZP_Ciastzd_spolu.Value <= Nc_osoba_prijem_MIN {498000} then PomVypocet:=Nc_osoba_rocna else
      begin {vzorec}
        if TRZP_V_rok.Value < 2009 then begin
           PomVypocet := (Trunc(Nc_osoba_prijem_MAX / Nc_koeficient)) - (TRZP_Ciastzd_spolu.Value/Nc_koeficient);
           PomVypocet := ZAOKRUHLI (PomVypocet,0,0)
        end
        else if TRZP_V_rok.Value < 2011 then begin
           PomVypocet := (Nc_osoba_prijem_MAX / Nc_koeficient) - (TRZP_Ciastzd_spolu.Value/Nc_koeficient);
           PomVypocet := ZAOKRUHLI (PomVypocet,-2,0)
        end
        else if TRZP_V_rok.Value = 2011 then begin
           {
           PomVypocet := (Nc_osoba_prijem_MAX / Nc_koeficient) - (TRZP_Ciastzd_spolu.Value/Nc_koeficient);
           PomVypocet := ZAOKRUHLI (PomVypocet,-2,0);
           }
           PomVypocet := TRZP_Ciastzd_spolu.Value / Nc_koeficient;
           PomVypocet := 8193.796 - PomVypocet;
           PomVypocet := ZAOKRUHLI (PomVypocet,-2,0);
        end;
      end;
      PomVypocet:=PomVypocet - TRZP_Nc_minimum_dochodok.Value;
      if PomVypocet<0 then PomVypocet:=0;
      TRZP_Nc_minimum_upravena.Value := PomVypocet;
    end else
    begin
      TRZP_Nc_minimum.Value := 0;
      TRZP_Nc_minimum_upravena.Value := 0;
    end;
    if TRZP_Uplatnuje_Nc_partner.Value then begin
      TRZP_Nc_partner.Value := Nc_osoba_rocna;
      Nc_partner_prijem_MIN := Nc_osoba_prijem_MAX;
      Nc_partner_prijem_MAX := Nc_partner_prijem_MIN +(Nc_osoba_rocna * Nc_koeficient);
      if TRZP_Ciastzd_spolu.Value >= Nc_partner_prijem_MAX {1262928} then PomVypocet:=0 else
      if TRZP_Ciastzd_spolu.Value <= Nc_partner_prijem_MIN {880464} then PomVypocet:=Nc_osoba_rocna else
      begin {vzorec}
        if TRZP_V_rok.Value < 2009 then begin
           PomVypocet := (Trunc(Nc_partner_prijem_MAX / Nc_koeficient)) - (TRZP_Ciastzd_spolu.Value/Nc_koeficient);
           PomVypocet := ZAOKRUHLI (PomVypocet,0,0)
        end
        else if TRZP_V_rok.Value < 2011 then begin
           PomVypocet := (Nc_partner_prijem_MAX / Nc_koeficient) - (TRZP_Ciastzd_spolu.Value/Nc_koeficient);
           PomVypocet := ZAOKRUHLI (PomVypocet,-2,0);
        end
        else if TRZP_V_rok.Value = 2011 then begin
        {
           PomVypocet := (Nc_partner_prijem_MAX / Nc_koeficient) - (TRZP_Ciastzd_spolu.Value/Nc_koeficient);
           PomVypocet := ZAOKRUHLI (PomVypocet,-2,0);
        }
           PomVypocet := 11753.092 - (TRZP_Ciastzd_spolu.Value/Nc_koeficient);
           PomVypocet := ZAOKRUHLI (PomVypocet,-2,0);
        end;
      end;
      PomVypocet:=PomVypocet-TRZP_Nc_partner_prijem.Value;
      if PomVypocet<0 then PomVypocet:=0;
      PomVypocet:=PomVypocet*TRZP_Nc_partner_mesiacov.Value/12;
      if TRZP_V_rok.Value < 2009 then
          PomVypocet:=Trunc(PomVypocet)
      else if TRZP_V_rok.Value >= 2009 then
         PomVypocet := ZAOKRUHLI (PomVypocet,-2,0);
      TRZP_Nc_partner_upravena.Value := PomVypocet;
    end else
    begin
      TRZP_Nc_partner.Value := 0;
      TRZP_Nc_partner_upravena.Value := 0;
    end;
    TRZP_NC_do_limitu.Value :=
      TRZP_Nc_ucelove_sporenie.Value +
      TRZP_Nc_zivotne_poistenie.Value +
      TRZP_DDP.Value;
    if TRZP_NC_do_limitu.Value > PARAMETRE[38].Hodnota then
      TRZP_NC_do_limitu.Value := PARAMETRE[38].Hodnota;
    if TRZP_V_rok.Value >= 2014 then
      TRZP_Nc_spolu.Value :=
        TRZP_Nc_minimum_upravena.Value +
        TRZP_Nc_partner_upravena.Value +
        TRZP_Nc_invalid_ciast.Value +
        TRZP_Nc_invalid_ZTP.Value
    else
    if TRZP_V_rok.Value >= 2011 then
      TRZP_Nc_spolu.Value :=
        TRZP_Nc_minimum_upravena.Value +
        TRZP_Nc_partner_upravena.Value
    else
      TRZP_Nc_spolu.Value :=
        TRZP_Nc_minimum_upravena.Value +
        TRZP_Nc_partner_upravena.Value +
        TRZP_NC_do_limitu.Value;
    if (TRZP_V_rok.Value >= 2009) and (not TRZP_Premia_narok.Value) then begin
      TRZP_Premia_zaklad.Value := 0;
      TRZP_Premia_suma.Value := 0;
      TRZP_Premia_mesiacov.Value := 0;
    end;
    if (TRZP_V_rok.Value >= 2009) and (TRZP_Premia_narok.Value) then begin
      if (TRZP_Uhrn_Brutto.Value<PARAMETRE[30].Hodnota*6) {or
         (TRZP_Uhrn_Brutto.Value>PARAMETRE[37].Hodnota+TRZP_Poistne.Value) }
      then begin
         TRZP_Premia_zaklad.Value := 0;
         TRZP_Premia_suma.Value := 0;
      end else if TRZP_Uhrn_Brutto.Value <= PARAMETRE[30].Hodnota*12
          then
      begin
        case TRZP_V_rok.Value of
          2009: begin Poistne_Premia:=473.04; end;
          2010: begin Poistne_Premia:=493.20; end;
          2011: begin Poistne_Premia:=509.64; end;
          2012: begin Poistne_Premia:=525.84; end;
          2013: begin Poistne_Premia:=542.64; end;
          2014: begin Poistne_Premia:=565.92; end;
        end;
        TRZP_Premia_zaklad.Value := PARAMETRE[30].Hodnota*12-Poistne_Premia;
        Zaklad_Premia := TRZP_Nc_minimum_upravena.Value - TRZP_Premia_zaklad.Value;
        if Zaklad_Premia < 0 then Zaklad_Premia :=0;
        if TRZP_Premia_mesiacov.Value = 12 then
          TRZP_Premia_suma.Value := ZAOKRUHLI(Zaklad_premia * 0.19,-2,0)
        else
          TRZP_Premia_suma.Value := ZAOKRUHLI(Zaklad_premia * TRZP_Premia_mesiacov.Value*0.19/12,-2,0);
      end else
      begin
        TRZP_Premia_zaklad.Value := TRZP_Ciastzd_spolu.Value;
        Zaklad_Premia := TRZP_Nc_minimum_upravena.Value - TRZP_Premia_zaklad.Value;
        if Zaklad_Premia < 0 then Zaklad_Premia :=0;
        if TRZP_Premia_mesiacov.Value = 12 then
          TRZP_Premia_suma.Value := ZAOKRUHLI(Zaklad_premia * 0.19,-2,0)
        else
          TRZP_Premia_suma.Value := ZAOKRUHLI(Zaklad_premia * TRZP_Premia_mesiacov.Value*0.19/12,-2,0);
      end;
    end;
  end;

   TRZP_Zdanmzda.Value :=
     TRZP_Ciastzd_spolu.Value -
     TRZP_Nc_spolu.Value;
   if TRZP_Zdanmzda.Value < 0 then TRZP_Zdanmzda.Value := 0;

  if TRZP_V_rok.Value < 2004 then
   TRZP_Zdanmzda_round.Value :=
     ZAOKRUHLI(TRZP_Zdanmzda.Value,2,1)
  else if TRZP_V_rok.Value <2009 then
   TRZP_Zdanmzda_round.Value :=
     ZAOKRUHLI(TRZP_Zdanmzda.Value,0,1)
  else if TRZP_V_rok.Value >= 2009 then
   TRZP_Zdanmzda_round.Value :=
     ZAOKRUHLI(TRZP_Zdanmzda.Value,-2,1);

   TRZP_Dan.Value := ROCNA_DAN(TRZP_Zdanmzda_round.Value,False);
   if TRZP_V_rok.Value>=2009 then
     TRZP_Dan.Value := ZAOKRUHLI(TRZP_Dan.Value,-2,1)
   else if TRZP_V_rok.Value>=2004 then
     TRZP_Dan.Value := ZAOKRUHLI(TRZP_Dan.Value,0,1);

   TRZP_Uhrn_preddavkov.Value :=
     TRZP_Preddavky1.Value +
     TRZP_Preddavky2.Value;

  if TRZP_V_rok.Value < 2004 then
   TRZP_Preplatok.Value :=
     TRZP_Uhrn_preddavkov.Value -
     TRZP_Dan.Value -
     TRZP_Nedoplatok_nepenaznych.Value -
     TRZP_Nedoplatok_nepen2.Value
  else if TRZP_V_rok.Value < 2009 then
   TRZP_Preplatok.Value :=
     TRZP_Uhrn_preddavkov.Value -
     TRZP_Dan.Value -
     TRZP_D_bonus_cerpany.Value +
     TRZP_D_bonus_narok.Value
  else if TRZP_V_rok.Value < 2011 then
   TRZP_Preplatok.Value :=
     TRZP_Uhrn_preddavkov.Value +
     TRZP_Dan_osobitna.Value -
     TRZP_Dan.Value -
     TRZP_D_bonus_cerpany.Value +
     TRZP_D_bonus_narok.Value +
     TRZP_Premia_suma.Value
  else if TRZP_V_rok.Value >= 2011 then
   TRZP_Preplatok.Value :=
     TRZP_Uhrn_preddavkov.Value
     - TRZP_Dan.Value
     - TRZP_D_bonus_cerpany.Value
     + TRZP_D_bonus_narok.Value
     + TRZP_Premia_suma.Value
     - TRZP_Nc_dary.Value;
end;end;

procedure TDMV.TRZP_BeforePost(DataSet: TDataSet);
begin
  SET_RZP;
end;

procedure TDMV.DS_RZPStateChange(Sender: TObject);
begin with DM,DMZ do begin
  if TRZP_.State in [dsInsert,dsEdit] then
  begin
    DS_RGRID.Enabled := False;
    DMZ.DS_ZAMF.Enabled := True;
  end else begin
    DS_RGRID.Enabled := True;
    DMZ.DS_ZAMF.Enabled := True;
  end;
end;end;

procedure TDMV.TRZP_CalcFields(DataSet: TDataSet);
var pom,pr,bb,neu,bz:double;
begin
  if TRZP_V_Rok.Value < 2004 then
  begin
    if TRZP_Preplatok.Value < 0
    then TRZP_CALC_Preplatok.Value := TRZP_Preplatok.DisplayText
    else TRZP_CALC_Preplatok.Value := '+ ' + TRZP_Preplatok.DisplayText;
  end;
  if ((TRZP_V_Rok.Value >= 2004) and (TRZP_V_Rok.Value < 2011)) then
  begin
    TRZP_CALC_BONUS_NEDOPL.Value := 0;
    TRZP_CALC_BONUS_PREPL.Value  := 0;
    TRZP_CALC_DAN_NEDOPL.Value   := 0;
    TRZP_CALC_DAN_PREPL.Value    := 0;
    TRZP_CALC_BB_NEDOPL.Value    := 0;
    TRZP_CALC_BB_PREPL.Value     := 0;
    TRZP_CALC_NEU_NEDOPL.Value   := 0;
    TRZP_CALC_NEU_PREPL.Value    := 0;
    pom := TRZP_D_bonus_narok.Value - TRZP_D_bonus_cerpany.Value;
    if pom>0 then TRZP_CALC_BONUS_PREPL.Value:=pom
             else TRZP_CALC_BONUS_NEDOPL.Value:=-pom;
    pr:=TRZP_Preplatok.Value;
    if pr>0  then TRZP_CALC_DAN_PREPL.Value:=pr
             else TRZP_CALC_DAN_NEDOPL.Value:=-pr;
    bb:=pr - pom;
    if bb>0  then TRZP_CALC_BB_PREPL.Value:=bb
             else TRZP_CALC_BB_NEDOPL.Value:=-bb;
  end;
  if TRZP_V_Rok.Value >= 2011 then
  begin
    TRZP_CALC_BONUS_NEDOPL.Value := 0;
    TRZP_CALC_BONUS_PREPL.Value  := 0;
    TRZP_CALC_DAN_NEDOPL.Value   := 0;
    TRZP_CALC_DAN_PREPL.Value    := 0;
    TRZP_CALC_BB_NEDOPL.Value    := 0;
    TRZP_CALC_BB_PREPL.Value     := 0;
    TRZP_CALC_NEU_NEDOPL.Value   := 0;
    TRZP_CALC_NEU_PREPL.Value    := 0;
    TRZP_CALC_BONUS_ZNIZ.Value   := 0;
    pom := TRZP_D_bonus_narok.Value - TRZP_D_bonus_cerpany.Value;
    if pom>0 then TRZP_CALC_BONUS_PREPL.Value:=pom
             else TRZP_CALC_BONUS_NEDOPL.Value:=-pom;
    if pom>0 then begin
      bz := pom - TRZP_Dan.Value; if bz<0 then bz:=0;
      TRZP_CALC_BONUS_ZNIZ.Value:=bz;
    end;

    neu:= TRZP_Preddavky1.Value - TRZP_Dan.Value;
    if neu>0  then TRZP_CALC_NEU_PREPL.Value := neu
              else TRZP_CALC_NEU_NEDOPL.Value := -neu;
    bb:=neu + pom - TRZP_NC_dary.Value;
    if bb>0  then TRZP_CALC_BB_PREPL.Value:=bb
             else TRZP_CALC_BB_NEDOPL.Value:=-bb;
    pr:=TRZP_Preplatok.Value;
    if pr>0  then TRZP_CALC_DAN_PREPL.Value:=pr
             else TRZP_CALC_DAN_NEDOPL.Value:=-pr;
  end else
  if TRZP_V_Rok.Value >= 2009 then
  begin
    pr:=TRZP_Preplatok.Value;
    if pr>0  then TRZP_CALC_DAN_PREPL.Value:=-pr
             else TRZP_CALC_DAN_NEDOPL.Value:=-pr;
    neu:= TRZP_Dan.Value - TRZP_Preddavky1.Value - TRZP_Dan_osobitna.Value;
    if neu>0  then TRZP_CALC_NEU_NEDOPL.Value := neu
             else TRZP_CALC_NEU_PREPL.Value := neu;
  end;
end;

procedure TDMV.TRZP_BeforeDelete(DataSet: TDataSet);
begin
  if TRZP_V_Rok.Value < 2002 then
   raise EMyError.Create(SMyRzpNemenPred2002);
  if MyOtazka(SMyRzpVymazatZuctovanie) then
  if MyOtazka(SMyRzpBudeDefinitivneZrusene) then exit;
  raise EMyError.Create(SMyRzpVymazanieBoloZastavene);
end;

procedure TDMV.TRZP_BeforeInsert(DataSet: TDataSet);
var Pocet:integer;
begin
  if DM.AktRok < 2002 then
   raise EMyError.Create(SMyRzpNemenPred2002);
  XRZP_.Close;
  XRZP_.ParamByName('P1').AsInteger := DMZ.TZAM_Code_emp.Value;
  XRZP_.ParamByName('P2').AsInteger := DM.AktRok;
  XRZP_.Open;
  Pocet := XRZP_Pocet.Value;
  XRZP_.Close;
  if Pocet > 0 then raise EMyError.Create(SMyRzpUzExistuje);
end;

procedure TDMV.PRIPRAV_HSV;
begin with DMZ do begin
  if DM.AktObdobie <= DateToObdobie(DM.TINF_Datum_Uzav.Value) then
  begin
    MyError(Format(SMyAppZakazRobitHsv,[DM.TINF_Datum_Uzav.AsString]));
    Abort;
  end;
  DS_HSV.Enabled:=False;
  THSV_.Close;
  DMSQL.ExecuteSql('delete from ":pam98_priv:hsv"');
  THSV_.Open;
  QHSV1_.Close;
  QHSV1_.ParamByName('V_obdobie').AsInteger := DM.AktObdobie;
  QHSV1_.ParamByName('sid1').AsInteger := DM.AktMinSid;
  QHSV1_.ParamByName('sid2').AsInteger := DM.AktMaxSid;
  QHSV1_.Open;
  while NOT QHSV1_.EOF do
  begin
    INSERT_HSV:=TRUE;
    THSV_.Insert;
    THSV_Code_numb.Value := QHSV1_Code_numb.Value;
    THSV_Code_emp.Value := QHSV1_Code_emp.Value;
    THSV_Zauctovany.Value := '0';
    THSV_Priznak_uctovat.Value := '1';
    THSV_PMT.Value := Spoj(QHSV1_Surname.Value,QHSV1_Name.Value,QHSV1_Title.Value);
    THSV_V_den.Value     :=QHSV1_V_den.Value;
    THSV_V_hodina.Value  :=QHSV1_V_hodina.Value;
    THSV_V_sviatok.Value :=QHSV1_V_sviatok.Value;
    THSV_V_holiday.Value :=QHSV1_V_holiday.AsInteger;
    THSV_V_pn1.Value     :=QHSV1_V_pn1.Value;
    THSV_V_pn2.Value     :=QHSV1_V_pn2.Value;
    THSV_V_ocr1.Value    :=QHSV1_V_ocr1.Value;
    THSV_V_ocr2.Value    :=QHSV1_V_ocr2.Value;
    THSV_N_premie.Value  :=QHSV1_F_Sadzba_Premii.Value;
    THSV_N_odmeny.Value  :=QHSV1_N_odmeny.Value;
    THSV_N_dohody_ovp.Value  :=QHSV1_N_dohody_ovp.Value;
    THSV_N_dohody_opc.Value  :=QHSV1_N_dohody_opc.Value;
    THSV_Zaloha.Value    :=QHSV1_Ne_zaloha.Value;
    if QHSV1_MV_plat.Value = 0
      then THSV_V_hodina.Value  :=QHSV1_V_hodina.Value;
    THSV_Vh_nadcas.Value  :=QHSV1_Vh_nadcas.Value;
    THSV_Vh_sobota.Value  :=QHSV1_Vh_sobota.Value;
    THSV_Vh_nedela.Value  :=QHSV1_Vh_nedela.Value;
    THSV_Vh_sviatok.Value :=QHSV1_Vh_sviatok.Value;
    THSV_Vh_noc.Value     :=QHSV1_Vh_noc.Value;
    THSV_Vh_skod.Value    :=QHSV1_Vh_skod.Value;
    THSV_Vh_priplat1.Value:=QHSV1_Vh_priplat1.Value;
    THSV_Vh_priplat2.Value:=QHSV1_Vh_priplat2.Value;
    THSV_Vh_priplat3.Value:=QHSV1_Vh_priplat3.Value;
    THSV_Vh_priplat4.Value:=QHSV1_Vh_priplat4.Value;
    THSV_Vh_priplat5.Value:=QHSV1_Vh_priplat5.Value;
    THSV_.Post;
    QHSV1_.Next;
  end;
  QHSV1_.Close;
{--}
  QHSV2_.Close;
  QHSV2_.ParamByName('V_obdobie').AsInteger := DM.AktObdobie;
  QHSV2_.ParamByName('sid1').AsInteger := DM.AktMinSid;
  QHSV2_.ParamByName('sid2').AsInteger := DM.AktMaxSid;
  QHSV2_.ParamByName('Datum').Value :=EncodeDate(DM.AktRok,DM.AktMesiac,1);
  QHSV2_.Open;
  while NOT QHSV2_.EOF do
  begin
    INSERT_HSV:=TRUE;
    THSV_.Insert;
    THSV_Code_numb.Value := QHSV2_Code_numb.Value;
    THSV_Code_emp.Value := QHSV2_Code_emp.Value;
    THSV_Zauctovany.Value := '0';
    THSV_Priznak_uctovat.Value := '1';
    THSV_PMT.Value := Spoj(QHSV2_Surname.Value,QHSV2_Name.Value,QHSV2_Title.Value);
    THSV_.Post;
    QHSV2_.Next;
  end;
  QHSV2_.Close;
  THSV_.First;
  DS_HSV.Enabled:=True;
end;end;

procedure TDMV.ZAUCTUJ_HSV;
var ii:integer;
  procedure RIADOK;
  begin with DMZ do begin
    if THSV_Priznak_uctovat.Value='1'
    then begin
      TZAM_.CancelRange;
      TZAM_.First;
      if NOT TZAM_.FindKey([THSV_Code_numb.Value,THSV_Code_emp.Value]) then
      begin
        exit;
      end;
      TVYP_.CancelRange;
      TVYP_.First;
      if NOT TVYP_.FindKey([THSV_Code_emp.Value,DM.AktObdobie])
       then TVYP_.Insert
         else TVYP_.Edit;
      {--}
      TVYP_V_den.AsString           :=NVL(THSV_V_den.AsString);
      TVYP_V_sviatok.AsString       :=NVL(THSV_V_sviatok.AsString);
      TVYP_V_holiday.AsString       :=NVL(THSV_V_holiday.AsString);
      TVYP_V_pn2.AsString           :=NVL(THSV_V_pn2.AsString);
      TVYP_V_pn1.AsString           :=NVL(THSV_V_pn1.AsString);
      TVYP_V_ocr2.AsString          :=NVL(THSV_V_ocr2.AsString);
      TVYP_V_ocr1.AsString          :=NVL(THSV_V_ocr1.AsString);
      TVYP_V_hodina.AsString        :=NVL(THSV_V_hodina.AsString);
      TVYP_F_Sadzba_Premii.AsString :=NVL(THSV_N_premie.AsString);
      TVYP_N_odmeny.AsString        :=NVL(THSV_N_odmeny.AsString);
      TVYP_Ne_zaloha.AsString       :=NVL(THSV_Zaloha.AsString);
      TVYP_N_dohody_ovp.AsString    :=NVL(THSV_N_dohody_ovp.AsString);
      TVYP_N_dohody_opc.AsString    :=NVL(THSV_N_dohody_opc.AsString);
      TVYP_Vh_nadcas.AsString       :=NVL(THSV_Vh_nadcas.AsString);
      TVYP_Vh_sobota.AsString       :=NVL(THSV_Vh_sobota.AsString);
      TVYP_Vh_nedela.AsString       :=NVL(THSV_Vh_nedela.AsString);
      TVYP_Vh_sviatok.AsString      :=NVL(THSV_Vh_sviatok.AsString);
      TVYP_Vh_noc.AsString          :=NVL(THSV_Vh_noc.AsString);
      TVYP_Vh_skod.AsString         :=NVL(THSV_Vh_skod.AsString);
      TVYP_Vh_priplat1.AsString     :=NVL(THSV_Vh_priplat1.AsString);
      TVYP_Vh_priplat2.AsString     :=NVL(THSV_Vh_priplat2.AsString);
      TVYP_Vh_priplat3.AsString     :=NVL(THSV_Vh_priplat3.AsString);
      TVYP_Vh_priplat4.AsString     :=NVL(THSV_Vh_priplat4.AsString);
      TVYP_Vh_priplat5.AsString     :=NVL(THSV_Vh_priplat5.AsString);
      {--}
      TVYP_.Post;
      THSV_.Edit;
      THSV_Zauctovany.Value:='1';
      THSV_.Post;
      Inc(POCET_HSV);
    end;
  end;end;

begin with DMZ do begin
  try
  POCET_HSV := 0;
  UCTUJ_HSV := True;
  DS_HSV.Enabled:=False;
  THSV_.First;
  TZAM_.Filtered:=False;
  TZAM_.IndexName := '';
  Progress(0);
  ii:=0;
  while not THSV_.EOF do begin
    THSV_.Edit;
    THSV_Zauctovany.Value:='0';
    THSV_.Post;
    try
    RIADOK;
    except
      on E:Exception do MyError(E.Message);
    end;
    Inc(ii);
    Progress(Trunc(ii/THSV_.RecordCount*100));
    THSV_.Next;
  end;
  THSV_.First;
  DS_HSV.Enabled:=True;
  finally
  Progress(100);
  UCTUJ_HSV := False;
  end;
end;end;


procedure TDMV.PRIPRAV_HSU;
begin with DMZ do begin
  if DM.AktObdobie <= DateToObdobie(DM.TINF_Datum_Uzav.Value) then
  begin
    MyError(Format(SMyAppZakazRobitHsu,[DM.TINF_Datum_Uzav.AsString]));
    Abort;
  end;
  DS_HSU.Enabled:=False;
  THSU_.Filtered:=false;
  THSU_.Filter:='v_obdobie='+IntToStr(DM.AktObdobie);
  THSU_.Filtered:=true;
  DS_HSU.Enabled:=True;
  DS_CUK.Enabled:=True;
end;end;

procedure TDMV.NACITAJ_HSU;
var ii,xx:longint;
begin with DMZ do begin
  POCET_HSV:=0;
  DS_HSU.Enabled:=False;
  THSU_.Close;
  DMSQL.ExecuteSql('delete from ":pam98_data:hsu" where v_obdobie='+IntToStr(DM.AktObdobie));
  THSU_.Open;
  QHSU1_.Close;
  QHSU1_.ParamByName('V_obdobie').AsInteger := DM.AktObdobie;
  QHSU1_.ParamByName('sid1').AsInteger := DM.AktMinSid;
  QHSU1_.ParamByName('sid2').AsInteger := DM.AktMaxSid;
  QHSU1_.Open;
  Progress(0);ii:=0;xx:=QHSU1_.RecordCount;
  while NOT QHSU1_.EOF do
  begin
    INSERT_HSV := True;
    THSU_.Insert;
    if THSU_.State in [dsInsert] then begin
      THSU_V_Obdobie.Value := Trunc(QHSU1_V_obdobie.Value);
      THSU_Code_numb.Value := QHSU1_Code_numb.Value;
      THSU_Code_emp.Value  := QHSU1_Code_emp.Value;
      THSU_UKID.Value      := QHSU1_UKID.Value;
      THSU_Pocet.Value     := 0;
      THSU_Suma1.Value     := QHSU1_Hodnota.Value;
      THSU_Suma.Value      := 0;
      THSU_.Post;
      Inc(POCET_HSV);
    end;
    QHSU1_.Next;
    inc(ii);Progress(Trunc(ii/xx*100));
  end;
  QHSU1_.Close;

  QHSU2_.Close;
  QHSU2_.ParamByName('V_obdobie').AsInteger := DM.AktObdobie;
  QHSU2_.ParamByName('sid1').AsInteger := DM.AktMinSid;
  QHSU2_.ParamByName('sid2').AsInteger := DM.AktMaxSid;
  QHSU2_.Open;
  Progress(0);ii:=0;xx:=QHSU2_.RecordCount;
  while NOT QHSU2_.EOF do
  begin
    try
    INSERT_HSV := True;
    THSU_.Insert;
    if THSU_.State in [dsInsert] then begin
      THSU_V_Obdobie.Value := Trunc(QHSU2_V_obdobie.Value);
      THSU_Code_numb.Value := QHSU2_Code_numb.Value;
      THSU_Code_emp.Value  := QHSU2_Code_emp.Value;
      THSU_UKID.Value      := QHSU2_UKID.Value;
      THSU_Pocet.Value     := 0;
      THSU_Suma1.Value     := QHSU2_Hodnota.Value;
      THSU_Suma.Value      := 0;
      THSU_.Post;
      Inc(POCET_HSV);
    end;
    except
    THSU_.Cancel;
    end;
    QHSU2_.Next;
    inc(ii);Progress(Trunc(ii/xx*100));
  end;
  QHSU2_.Close;

  DS_HSU.Enabled:=True;
  Progress(100);
end;end;

procedure TDMV.THSV_BeforeInsert(DataSet: TDataSet);
begin
  if NOT INSERT_HSV then Abort;
  INSERT_HSV:=FALSE;
end;

procedure TDMV.HSV_Validate(Sender: TField);
begin
  Kontrola_desatinnej_casti(Sender);
end;

procedure TDMV.Kontrola_desatinnej_casti(Sender: TField);
var fr:double;
begin
  if Sender.AsString='' then exit;
  fr:=Frac(Sender.Value);
  if (fr<>0) and (fr<>0.5) then begin
    MyError(SMyAppOnlyHalfValueAllowed);
    Abort;
  end;
end;

function  TDMV.GET_POISTENIE(Par_mes,Par_rok:integer): double;
var POM,RR,Stvrtrok:integer;
begin
  Result:=0;
  POM:=(Par_mes - 1) div 3;
  case POM of
  0:Stvrtrok:=4;
  1:Stvrtrok:=1;
  2:Stvrtrok:=2;
  3:Stvrtrok:=3;
  else exit;
  end;
  RR:=Par_rok;
  if Stvrtrok=4 then RR:=RR-1;
  QPOI_.Close;
  QPOI_.ParamByName('P1').AsInteger := RR * 100 + (Stvrtrok-1)*3+1;
  QPOI_.Open;
  Result:=QPOI_CALC_POISTNE.Value;
  QPOI_.Close;
end;

procedure TDMV.QPOI_CalcFields(DataSet: TDataSet);
begin
  QPOI_CALC_POISTNE.Value := INT(
    QPOI_N_BRUTTO.Value *
    QPOI_F_POISTNE.Value /
    1000);
  if  (QPOI_N_BRUTTO.Value > 0) and
      (QPOI_CALC_POISTNE.Value < DM.TSET_F_MIN_POIST_SKODA.Value)
  then QPOI_CALC_POISTNE.Value := DM.TSET_F_MIN_POIST_SKODA.Value;
end;

procedure Nacitaj_Milionarsku_Dan;
var h1,h2:longint;i:integer;
begin
  MD.obdobie_od:=MyIniFile.ReadInteger('Milionarska_Dan','Obdobie_od',199805);
  MD.obdobie_do:=MyIniFile.ReadInteger('Milionarska_Dan','Obdobie_do',199903);
  MD.rzp:=MyIniFile.ReadInteger('Milionarska_Dan','Obdobie_do',0);
  MD.pocet:=0;
  for i:=1 to 9 do begin
    h1:=MyIniFile.ReadInteger('Milionarska_Dan','Pasmo'+Format('%d',[i]),0);
    h2:=MyIniFile.ReadInteger('Milionarska_Dan','Sadzba'+Format('%d',[i]),0);
    if (h1>0) and (h2>0) and (h1>=367200) and (h2<50) then
    begin
      MD.pocet:=MD.pocet+1;
      MD.pasmo[MD.pocet]:=h1;
      MD.sadzba[MD.pocet]:=h2;
    end;
  end;
end;

procedure Nacitaj_Kompatibilitu;
begin
 KOMP_PRIPL:=MyIniFile.ReadInteger('Kompatibilita','Priplatky',1);
end;

procedure Nacitaj_Texty;
begin
  MyTextDoplatky:=MyIniFile.ReadString('Texty','Doplatky','Doplatky');
end;

procedure Nacitaj_BLAT;
begin
  MySmtpServer:=MyBlatIniFile.ReadString('SMTP','Server','UNKNOWN');
  MySmtpUser:=MyBlatIniFile.ReadString('SMTP','User','UNKNOWN');
  MySmtpPassword:=MyBlatIniFile.ReadString('SMTP','Password','UNKNOWN');
  MySmtpCC:=MyBlatIniFile.ReadString('SMTP','CC','');
  MySmtpMailFrom:=MyBlatIniFile.ReadString('SMTP','MailFrom','');
  MySmtpTestMailTo:=MyBlatIniFile.ReadString('SMTP','TestMailTo','');
end;

procedure TDMV.DS_ZRVStateChange(Sender: TObject);
begin
  if TZRV_.State in [dsInsert,dsEdit] then
  begin
    DS_ZRVG.Enabled := False;
  end else begin
    DS_ZRVG.Enabled := True;
  end;
end;

procedure TDMV.TZRV_NewRecord(DataSet: TDataSet);
begin
  TZRV_V_obdobie.Value := TVYP_V_obdobie.Value;
  TZRV_Code_emp.Value  := TVYP_Code_emp.Value;
  TZRV_Typ_sumy.Value  := 0;
  TZRV_Vypocitana_suma.Value  := 0;
end;

procedure TDMV.Predcislo_validate(Sender: TField);
begin
  Kontrola_predcisla(Sender.Text);
end;

procedure TDMV.Cislouctu_validate(Sender: TField);
begin
  Kontrola_ABO(Sender.Text);
end;

procedure TDMV.TZRV_TypValidate(Sender: TField);
begin
  if not (StrToChar(Sender.AsString) in ['P','O','Y','X','S']) then
  raise EMyError.Create(SMyZamTypZrazkyNotValid);
end;

procedure TDMV.ZISTI_ZRAZKY;
var ZRAZKA:double;
begin
  ZRAZKY_P:=0;
  ZRAZKY_O:=0;
  ZRAZKY_X:=0;
  ZRAZKY_Y:=0;
  ZRAZKY_S:=0;
  try
  if QZRV_.Active then QZRV_.Close;
  QZRV_.ParamByName('P1').AsInteger := TVYP_V_obdobie.Value;
  QZRV_.ParamByName('P2').AsInteger := TVYP_Code_emp.Value;
  QZRV_.Open;
  while not QZRV_.EOF do begin
    ZRAZKA:=VYSKA_ZRAZKY(QZRV_Suma.Value,QZRV_Typ_Sumy.Value);
    if QZRV_Typ.Value='P' then ZRAZKY_P:=ZRAZKY_P+ZRAZKA else
    if QZRV_Typ.Value='O' then ZRAZKY_O:=ZRAZKY_O+ZRAZKA else
    if QZRV_Typ.Value='X' then ZRAZKY_X:=ZRAZKY_X+ZRAZKA else
    if QZRV_Typ.Value='Y' then ZRAZKY_Y:=ZRAZKY_Y+ZRAZKA else
    if QZRV_Typ.Value='S' then ZRAZKY_S:=ZRAZKY_S+ZRAZKA;
    QZRV_.Edit;
    QZRV_Vypocitana_suma.Value := ZRAZKA;
    QZRV_.Post;
    QZRV_.Next;
  end;
  except on E:Exception do
    MyError('Chyba pri v˝poËte zr·ûok:'+E.Message);
  end;
  if QZRV_.Active then QZRV_.Close;
  TZRV_.Refresh;
end;

procedure TDMV.ZISTI_VYKONY;
begin
  if DMV.UCTUJ_MDB then exit;
  try
  if QHSU3_.Active then QHSU3_.Close;
  QHSU3_.ParamByName('P1').AsInteger := TVYP_V_obdobie.Value;
  QHSU3_.ParamByName('P2').AsInteger := TVYP_Code_emp.Value;
  QHSU3_.Open;
  TVYP_N_ukolova.Value := ZAOKRUHLI(QHSU3_Suma.Value,-2,0);
  if QHSU3_.Active then QHSU3_.Close;
  finally
  end;
end;

procedure TDMV.PRENES_ZRAZKY_ZO_ZAMESTNANCA;
begin with DMZ do begin
  try
  TZRV_.SetRangeStart;
  TZRV_.FieldByName('V_obdobie').Value := TVYP_V_obdobie.Value;
  TZRV_.FieldByName('Code_emp').Value := TZAM_Code_emp.Value;
  TZRV_.SetRangeEnd;
  TZRV_.FieldByName('V_obdobie').Value := TVYP_V_obdobie.Value;
  TZRV_.FieldByName('Code_emp').Value := TZAM_Code_emp.Value+1;
  TZRV_.ApplyRange;
  TZRV_.First;
  TZRV_.Filtered:=False;
  while not TZRV_.EOF do TZRV_.Delete;
  QZRZ_.ParamByName('P1').AsInteger := TVYP_Code_emp.Value;
  QZRZ_.ParamByName('P2').AsInteger := TVYP_V_obdobie.Value;
  QZRZ_.Open;
  while not QZRZ_.EOF do begin
    TZRV_.Insert;
    TZRV_V_obdobie.Value := TVYP_V_obdobie.Value;
    TZRV_Code_emp.Value := TVYP_Code_emp.Value;
    TZRV_Typ.Value := QZRZ_Typ.Value;
    TZRV_Prijemca.Value := QZRZ_Prijemca.Value;
    TZRV_Predcislo_u.Value := QZRZ_Predcislo_u.Value;
    TZRV_Cislo_u.Value := QZRZ_Cislo_u.Value;
    TZRV_Banka_u.Value := QZRZ_Banka_u.Value;
    TZRV_SSym_u.Value := QZRZ_SSym_u.Value;
    TZRV_VSym.Value := QZRZ_VSym.Value;
    TZRV_KSym.Value := QZRZ_KSym.Value;
    TZRV_Spp.Value := QZRZ_Spp.Value;
    TZRV_Suma.Value := QZRZ_Suma.Value;
    TZRV_Typ_Sumy.Value := QZRZ_Typ_Sumy.Value;
    TZRV_Poznamka.Value := QZRZ_Poznamka.Value;
    TZRV_IBAN.Value := QZRZ_IBAN.Value;
    TZRV_.Post;
    QZRZ_.Next;
  end;
  QZRZ_.Close;
  except
  end;
end;end;

procedure TDMV.PRENES_VYKONY_ZO_ZAMESTNANCA;
begin with DMZ do begin
  if DMV.UCTUJ_MDB then exit;
  try
  THSU_.CancelRange;
  THSU_.SetRangeStart;
  THSU_.FieldByName('V_obdobie').Value := TVYP_V_obdobie.Value;
  THSU_.FieldByName('Code_numb').Value := TZAM_Code_numb.Value;
  THSU_.FieldByName('Code_emp').Value := TZAM_Code_emp.Value;
  THSU_.SetRangeEnd;
  THSU_.FieldByName('V_obdobie').Value := TVYP_V_obdobie.Value;
  THSU_.FieldByName('Code_numb').Value := TZAM_Code_numb.Value;
  THSU_.FieldByName('Code_emp').Value := TZAM_Code_emp.Value+1;
  THSU_.ApplyRange;
  THSU_.First;
  THSU_.Filtered:=False;
  while not THSU_.EOF do THSU_.Delete;
  TZUK_.CancelRange;
  TZUK_.SetRangeStart;
  TZUK_.FieldByName('Code_numb').Value := TZAM_Code_numb.Value;
  TZUK_.FieldByName('Code_emp').Value := TZAM_Code_emp.Value;
  TZUK_.SetRangeEnd;
  TZUK_.FieldByName('Code_numb').Value := TZAM_Code_numb.Value;
  TZUK_.FieldByName('Code_emp').Value := TZAM_Code_emp.Value+1;
  TZUK_.ApplyRange;
  TZUK_.First;
  TZUK_.Filtered:=False;
  while not TZUK_.EOF do begin
    INSERT_HSV := True;
    THSU_.Insert;
    THSU_V_obdobie.Value := TVYP_V_obdobie.Value;
    THSU_Code_numb.Value := TZAM_Code_numb.Value;
    THSU_Code_emp.Value := TZAM_Code_emp.Value;
    THSU_UKID.Value     := TZUK_UKID.Value;
    THSU_Suma1.Value    := TZUK_Hodnota.Value;
    THSU_Pocet.Value    := 0;
    THSU_Suma.Value     := 0;
    THSU_.Post;
    TZUK_.Next;
  end;
  finally
  end;
end;end;

procedure TDMV.TVYP_F_typ_premiiValidate(Sender: TField);
begin
 if not (Sender.AsInteger in [0,1,2]) then
   raise EMyError.Create(SMyVypTypPremiiInvalid);
end;

procedure TDMV.TVYP_U_poistenieValidate(Sender: TField);
begin
 if not (Sender.AsInteger in SetOf_PoistenieValid) then
   raise EMyError.Create(SMyAppInvalidValue+' '+SMyAppHintPoistenie);
end;

procedure TDMV.TVYP_U_poistenie2Validate(Sender: TField);
begin
 if not (Sender.AsInteger in SetOf_Poistenie2Valid) then
   raise EMyError.Create(SMyAppInvalidValue+' '+SMyAppHintPoistenie2);
end;

procedure TDMV.THSV_Priznak_uctovatValidate(Sender: TField);
begin
  if not (Sender.AsInteger in [0,1]) then
   raise EMyError.Create(SMyAppPriznakUctovatInvalid);
end;

procedure TDMV.THSV_CalcFields(DataSet: TDataSet);
begin
  THSV_CALC_DNI_PN.Value := THSV_V_pn1.Value + THSV_V_pn2.Value;
  THSV_CALC_DNI_OCR.Value:= THSV_V_ocr1.Value + THSV_V_ocr2.Value;
end;

procedure TDMV.TVYP_BeforeEdit(DataSet: TDataSet);
begin
 Kontrola_Datumu_Uzav;
 NepravidelnyPrijem_Backup;
end;

procedure TDMV.AKTUALIZUJ_VYPLATY(iTyp:integer);
{0-ötandardnÈ prepoËÌtanie vöetk˝ch v˝plat
 1-prepoËÌtanie len t˝ch v˝plat, kde je preplatok/nedoplatok dane z RZP
 2-prepoËÌtanie len t˝ch v˝plat, kde je preplatok/nedoplatok zdrav.poistenia z RZP
 3-prepoËÌtanie len t˝ch v˝plat, kde je rezerva1=1
}
var i:integer;
begin
  if iTyp=0 then
  begin
    if DM.AktObdobie <= DateToObdobie(DM.TINF_Datum_Uzav.Value) then exit;
    if NOT MyOtazka(Format(SMyAppPreniestZmenyDoVyplat,[DM.AktObdobieStr(False)]))
    then exit;
    if NOT MyOtazka(Format(SMyAppNaozajPrepocitatVyplaty,[DM.AktObdobieStr(False)]))
    then exit;
 end;
try
  TVYP_.Refresh;
  case iTyp of
   0:TVYP_.Filter:='V_obdobie='+IntToStr(DM.AktObdobie);
   1:TVYP_.Filter:='V_obdobie='+IntToStr(DM.AktObdobie)+' and d_vyrovnanie<>0';
   2:TVYP_.Filter:='V_obdobie='+IntToStr(DM.AktObdobie)+' and vyrovnanie_zp<>0';
   3:TVYP_.Filter:='V_obdobie='+IntToStr(DM.AktObdobie)+' and rezerva1=1';
  end;
  TVYP_.Filtered:=True;
  TVYP_.First;
  Progress(0);
  i:=0;
  while NOT TVYP_.EOF do begin
    DMZ.TZAM_.Filtered:= False;
    DMZ.TZAM_.Filter:= 'Code_emp='+TVYP_Code_emp.AsString;
    DMZ.TZAM_.Filtered:= True;
    TVYP_.Edit;
    TVYP_.Post;
    Inc(i);
    Progress(Trunc(i/TVYP_.RecordCount*100));
    TVYP_.Next;
  end;
finally
  Progress(100);
  TVYP_.Filter:= '';
  TVYP_.Filtered:= False;
  DMZ.TZAM_.Filtered:= False;
  case MyZamFilter of
  'S':FormMain.Akcia_zam_sucasny(Application);
  'V':FormMain.Akcia_zam_vyradeny(Application);
  'A':FormMain.Akcia_zam_vsetci(Application);
  end;
end;
end;

procedure TDMV.ROZDEL_DAN;
var i:integer;
begin
  if DM.AktObdobie <= DateToObdobie(DM.TINF_Datum_Uzav.Value) then exit;
  if NOT MyOtazka(Format(SMyAppNaozajRozdelitDan,[DM.AktStrediskoStr2,DM.AktObdobieStr(False)]))
  then exit;
try
  TVYP_.Filter:='V_obdobie='+IntToStr(DM.AktObdobie)+' and '+DM.AktSidFilter;
  TVYP_.Filtered:=True;
  TVYP_.First;
  Progress(0);
  i:=0;
  while NOT TVYP_.EOF do begin
    DMZ.TZAM_.Filtered:= False;
    DMZ.TZAM_.Filter:= 'Code_emp='+TVYP_Code_emp.AsString;
    DMZ.TZAM_.Filtered:= True;
    TVYP_.Edit;
    if TVYP_U_nezdc.Value then TVYP_Dan_vyrovnana.Value:=0
    else if TVYP_D_bonus_cerpany.Value<>0 then TVYP_Dan_vyrovnana.Value:=0
    else begin
      if TVYP_D_CIASTZD1.Value+
         TVYP_D_CIASTZD2.Value+
         TVYP_D_CIASTZD3.Value+
         TVYP_N_poist.Value > PARAMETRE[31].Hodnota
       then TVYP_Dan_vyrovnana.Value:=0
       else TVYP_Dan_vyrovnana.Value:=1;
    end;
    (*
      MyMessage(Format('Suma %d, dan vyrovnana %d',[Trunc(TVYP_D_CIASTZD1.Value+
         TVYP_D_CIASTZD2.Value+
         TVYP_D_CIASTZD3.Value+
         TVYP_N_poist.Value),TVYP_Dan_vyrovnana.Value]));
    *)
    TVYP_.Post;
    Inc(i);
    Progress(Trunc(i/TVYP_.RecordCount*100));
    TVYP_.Next;
  end;
finally
  Progress(100);
  TVYP_.Filter:= '';
  TVYP_.Filtered:= False;
  DMZ.TZAM_.Filtered:= False;
end;
end;

function TDMV.POM_POISTNE(Z: double):double;
var ZZP,ZDP,ZNP,ZFZ,OP:double;
begin with DM do begin
  Z:=ZAOKRUHLI(Z,TSET_F_ZAZAKLPOIST.Value,TSET_F_SMZAKLPOIST.Value);
  ZZP:=Z;ZDP:=Z;ZNP:=Z;ZFZ:=Z;
  if ZZP>PARAMETRE[19].Hodnota then ZZP:=PARAMETRE[19].Hodnota;
  if ZDP>PARAMETRE[21].Hodnota then ZDP:=PARAMETRE[21].Hodnota;
  if ZNP>PARAMETRE[20].Hodnota then ZNP:=PARAMETRE[20].Hodnota;
  if ZFZ>PARAMETRE[22].Hodnota then ZFZ:=PARAMETRE[22].Hodnota;
  OP:=0;
  if (TVYP_U_zdrav.Value in PoiPlatiZam) then
    OP:=OP+ZAOKRUHLI(TVYP_F_zdravot.Value/100*ZZP,TSET_F_ZAODVOD.Value,TSET_F_SMODVOD.Value);
  if (TVYP_U_nemoc.Value in PoiPlatiZam) then
    OP:=OP+ZAOKRUHLI(TVYP_F_nemoc.Value/100*ZNP,TSET_F_ZAODVOD.Value,TSET_F_SMODVOD.Value);
  if (TVYP_U_dochod.Value in PoiPlatiZam) then
    OP:=OP+ZAOKRUHLI(TVYP_F_dochod.Value/100*ZDP,TSET_F_ZAODVOD.Value,TSET_F_SMODVOD.Value);
  if (TVYP_U_fondzam.Value in PoiPlatiZam) then
    OP:=OP+ZAOKRUHLI(TVYP_F_fondz.Value/100*ZFZ,TSET_F_ZAODVOD.Value,TSET_F_SMODVOD.Value);
  Result := OP;
end;end;

function  TDMV.POM_DAN(Z: double):double;
var ZDANMZDA:double;
begin with DM do begin
  ZDANMZDA:=Z-TVYP_Nc_spolu.Value;
  if ZDANMZDA<0 then ZDANMZDA:=0;
  ZDANMZDA:=ZAOKRUHLI(ZDANMZDA,TSET_F_ZADANZP.Value,TSET_F_SMDANZP.Value);
  Result:=ZAOKRUHLI(MESACNA_DAN_BEZ_ZAOKRUH(ZDANMZDA),1,0);
end;end;

function  TDMV.PCDZ(PRHRMEZA:double):double;
//PCDZ = Priemerny cisty denny zarobok
//PHMZ = Priemerny hruby mesacny zarobok
var CZD,P,D,PCMZ,VYSL:double;
begin with DM do begin
  if PRHRMEZA < TVYP_F_min_mzda.Value then
    PRHRMEZA := TVYP_F_min_mzda.Value;
  CZD := PRHRMEZA;
  if TVYP_V_plat.Value = 0 then
    P:=0
  else
    P := POM_POISTNE(CZD);
  D := POM_DAN(CZD - P);
  PCMZ := CZD - D;
  if PCMZ<0 then PCMZ:=0;
  VYSL :=ZAOKRUHLI(PCMZ /PriemernyPocetDni,-2,2);
  if VYSL < TSET_F_NEMMIN.Value then VYSL := TSET_F_NEMMIN.Value;
  if VYSL > TSET_F_NEMMAX.Value then VYSL := TSET_F_NEMMAX.Value;
  Result := VYSL;
end;end;

procedure TDMV.TVYP_BeforeCancel(DataSet: TDataSet);
begin
  Kontrola_Zmien(TZRV_,SMyAppZrvCancel,True);
  Kontrola_Zmien(THSU_,SMyAppHsuCancel,True);
  LAST_CODE_EMP := TVYP_Code_emp.Value;
  LAST_V_OBDOBIE:= TVYP_V_obdobie.Value;
  NepravidelnyPrijem_Restore;
end;

procedure TDMV.TZRV_BeforeEdit(DataSet: TDataSet);
begin
  if not (TVYP_.State in [dsEdit,dsInsert]) then begin
    MyError(SMyAppZrvAzPoZmeneVyp);
    Abort;
  end;
end;

procedure TDMV.TZRV_BeforeInsert(DataSet: TDataSet);
begin
  if not (TVYP_.State in [dsEdit,dsInsert]) then begin
    MyError(SMyAppZrvAzPoZmeneVyp);
    Abort;
  end;
end;

function TDMV.VYSKA_ZRAZKY(nSuma:double;nTypSumy:integer):double;
var nVysl: double;
begin
  if nTypSumy = 0 then
    nVysl:=nSuma
  else if nTypSumy = 1 then
    nVysl := TVYP_N_brutto.Value * nSuma / 100
  else if nTypSumy = 2 then
    nVysl := (
      TVYP_N_brutto.Value -
      TVYP_N_holiday.Value -
      TVYP_N_sviatok.Value
      ) * nSuma / 100
  else if nTypSumy = 3 then
    nVysl := TVYP_N_netto.Value * nSuma / 100
  else if nTypSumy = 4 then
    nVysl := TVYP_N_zaklad_dp.Value * nSuma / 100
  else
    nVysl := 0;
  if TVYP_V_Obdobie.Value >= ZAKON_2009_01 then
   Result := ZAOKRUHLI(nVysl,-2,2)
  else
   Result:= ZAOKRUHLI(nVysl,0,2);
end;


procedure TDMV.TZRV_CalcFields(DataSet: TDataSet);
begin
  TZRV_CALC_VYP_SUMA.Value := VYSKA_ZRAZKY(TZRV_SUMA.Value,TZRV_TYP_SUMY.Value);
  TZRV_CALC_TEXT_ZRAZKY.Value := TEXT_ZRAZKY(TZRV_TYP.Value);
end;

procedure TDMV.TVYP_AfterPost(DataSet: TDataSet);
begin
 TZRV_.Refresh;
end;

procedure TDMV.TVYP_AfterCancel(DataSet: TDataSet);
var i:integer;
begin
 if (LAST_CODE_EMP = TVYP_Code_emp.Value) and
    (LAST_V_OBDOBIE = TVYP_V_obdobie.Value)
 then begin
{
   TVYP_.Edit;
   SET_ZRAZKY;
   SET_VYPLATA;
   TVYP_.Post;
}
 end;
 TZRV_.Refresh;
end;

procedure TDMV.TVYP_AfterDelete(DataSet: TDataSet);
begin
 TZRV_.Refresh;
end;

procedure TDMV.DS_VGRIDDataChange(Sender: TObject; Field: TField);
begin with DMZ do begin
  THSU_.Filtered:=False;
  THSU_.SetRangeStart;
  THSU_.FieldByName('V_obdobie').Value := TVYP_V_obdobie.Value;
  THSU_.FieldByName('Code_numb').Value := TZAM_Code_numb.Value;
  THSU_.FieldByName('Code_emp').Value := TZAM_Code_emp.Value;
  THSU_.SetRangeEnd;
  THSU_.FieldByName('V_obdobie').Value := TVYP_V_obdobie.Value;
  THSU_.FieldByName('Code_numb').Value := TZAM_Code_numb.Value;
  THSU_.FieldByName('Code_emp').Value := TZAM_Code_emp.Value+1;
  THSU_.ApplyRange;
  THSU_.First;
  {--}
  TZRV_.Filtered:=False;
  TZRV_.SetRangeStart;
  TZRV_.FieldByName('Code_emp').Value := TZAM_Code_emp.Value;
  TZRV_.FieldByName('V_obdobie').Value := TVYP_V_obdobie.Value;
  TZRV_.SetRangeEnd;
  TZRV_.FieldByName('Code_emp').Value := TZAM_Code_emp.Value;
  TZRV_.FieldByName('V_obdobie').Value := TVYP_V_obdobie.Value+1;
  TZRV_.ApplyRange;
  TZRV_.First;
end;end;

procedure TDMV.Kontrola_Datumu_Uzav;
begin
  if (DM.TINF_DATUM_UZAV.AsString<>'') and
     (TVYP_V_obdobie.Value <= DateToObdobie(DM.TINF_Datum_Uzav.Value))
  then begin
    MyError(Format(SMyAppZakazRobitZmeny,[DM.TINF_Datum_Uzav.AsString]));
    Abort;
  end;
  if (TVYP_V_mesiac.Value<>DM.AktMesiac)
  then begin
    MyError(SMyAppZakazRobitZmenyMimoAktMesiaca);
    Abort;
  end;
end;

procedure TDMV.TZRV_BeforePost(DataSet: TDataSet);
begin
  TZRV_Vypocitana_suma.Value := VYSKA_ZRAZKY(TZRV_SUMA.Value,TZRV_TYP_SUMY.Value);
end;

procedure TDMV.Kontrola_Zmien(T:TTable;const ErrMsg:string;bAbort:boolean);
begin
  Zmeny_Ok:=true;
  if T.State in [dsEdit,dsInsert] then begin
    if MyOtazka(ErrMsg) then
    begin T.Cancel; end else
    begin Zmeny_Ok:=False; if bAbort then Abort;end;
  end;
end;

procedure TDMV.THSV_BeforePost(DataSet: TDataSet);
begin
  if (THSV_V_hodina.Value > 0) and (THSV_V_Den.Value = 0) then
  begin
    MyError(SMyVypOdpracDniTrebaVyplnit);
    Abort;
  end;
end;

procedure TDMV.TCUK_BeforeInsert(DataSet: TDataSet);
begin
  if MyOtazka(SMyAppUserWantInsert) then exit;
  raise EMyError.Create(SMyAppStopUserWantInsert);
end;

procedure TDMV.TZUK_NewRecord(DataSet: TDataSet);
begin
  TZUK_Code_numb.Value := DMZ.TZAM_Code_numb.Value;
  TZUK_Code_emp.Value := DMZ.TZAM_Code_emp.Value;
end;

procedure TDMV.sucet_vykonu(Sender: TField);
begin
 if THSU_.State in [dsInsert,dsEdit] then
 begin
   if TVYP_V_obdobie.Value >= ZAKON_2009_01 then
   THSU_Suma.Value := ZAOKRUHLI(THSU_Pocet.Value * THSU_Suma1.Value,-4,0)
   else
   THSU_Suma.Value := THSU_Pocet.Value * THSU_Suma1.Value;
 end;
end;

procedure TDMV.TRZP_BeforeEdit(DataSet: TDataSet);
begin
  if TRZP_V_Rok.Value < 2002 then
   raise EMyError.Create(SMyRzpNemenPred2002);
end;

procedure TDMV.THSU_BeforeInsert(DataSet: TDataSet);
begin
  if not (TVYP_.State in [dsEdit,dsInsert]) then begin
    MyError(SMyAppHsuAzPoZmeneVyp);
    Abort;
  end;
  INSERT_HSV:=FALSE;
end;

procedure TDMV.DS_HSUStateChange(Sender: TObject);
begin
  if THSU_.State in [dsInsert,dsEdit] then
  begin
    DS_HSUG.Enabled := False;
  end else begin
    DS_HSUG.Enabled := True;
  end;
end;

procedure TDMV.THSU_BeforeEdit(DataSet: TDataSet);
begin
  if not (TVYP_.State in [dsEdit,dsInsert]) then begin
    MyError(SMyAppHsuAzPoZmeneVyp);
    Abort;
  end;
end;

procedure TDMV.THSU_NewRecord(DataSet: TDataSet);
begin with DMZ do begin
  THSU_V_obdobie.Value := TVYP_V_obdobie.Value;
  THSU_Code_emp.Value  := TZAM_Code_emp.Value;
  THSU_Code_numb.Value := TZAM_Code_numb.Value;
end;end;

procedure TDMV.THSU_UKIDChange(Sender: TField);
begin
  if THSU_.State in [dsEdit,dsInsert] then begin
    if THSU_Suma1.Value = 0 then begin
      if QHSU4_.Active then QHSU4_.Close;
      QHSU4_.ParamByName('P1').AsInteger := THSU_Code_numb.Value;
      QHSU4_.ParamByName('P2').AsInteger := THSU_UKID.Value;
      QHSU4_.Open;
      if not QHSU4_.EOF then
        THSU_Suma1.Value := QHSU4_Hodnota.Value;
      if QHSU4_.Active then QHSU4_.Close;
    end;
  end;
end;

procedure TDMV.TZUK_BeforeInsert(DataSet: TDataSet);
begin
  if MyOtazka(SMyAppUserWantInsert) then exit;
  raise EMyError.Create(SMyAppStopUserWantInsert);
end;

procedure TDMV.TZUK_BeforeDelete(DataSet: TDataSet);
begin
  if MyOtazka(SMyZukVymazatZuctovanie) then
  if MyOtazka(SMyZukBudeDefinitivneZrusene) then exit;
  raise EMyError.Create(SMyZukVymazanieBoloZastavene);
end;

procedure TDMV.TCUK_BeforeDelete(DataSet: TDataSet);
begin
  if MyOtazka(SMyCisDeleteQuestion) then exit;
  raise EMyError.Create(SMyCisDeleteStopped);
end;

procedure TDMV.TCUK_PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  if E.Message=SMyCisKeyViolation then begin
    MyError(SMyCisDuplicitnyZaznam);
    Action := daAbort;
  end;
end;

procedure TDMV.TZUK_PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  if E.Message=SMyCisKeyViolation then begin
    MyError(SMyCisDuplicitnyZaznam);
    Action := daAbort;
  end;
end;

procedure TDMV.TVYP_VYNIMKA_VZValidate(Sender: TField);
begin
  if TVYP_V_obdobie.Value >= Zakon_2004_01 then
  begin
    if not(StrToChar(Sender.Value) in SetOf_VynimkaVzValid) then
     raise EMyError.Create(SMyAppInvalidValue);
  end;
end;

procedure TDMV.TVYP_V_nepoistenyValidate(Sender: TField);
begin
  if TVYP_V_obdobie.Value >= Zakon_2004_01 then
  begin
    if KAL_DNI(TVYP_V_obdobie.Value)-Sender.Value < 0 then
     raise EMyError.Create(SMyAppInvalidValue);
  end;
end;

procedure TDMV.Nastav_Cistu_Dennu_Mzdu(iRok:integer);
var dni:double;obd1,obd2:longint;
    SL:TStringList;subor,s:string;
    bVymazat:boolean;
    YY,MM,DD:word;
begin with DMZ do begin
  bVymazat := false; {MyOtazka(SMyAppOtazkaVymazatCDM);}
  try
  subor := MyRepPath1+'\'+'cdm'+IntToStr(iRok)+'.txt';
  SL := TStringList.Create;
  SL.Add('PROTOKOL O NASTAVENÕ »ISTEJ DENNEJ MZDY');
  SL.Add(' ');
  SL.Add('Os.Ë.   Priezvisko a meno              Vym.z·klad NP   ZapoË.dnÌ Denn˝ vym.z·kl.');
  SL.Add('------- ------------------------------ --------------- --------- ---------------');
  if T1= nil then T1 := TTable.Create(Application);
  T1.DatabaseName := 'PAM98_DATA';
  T1.TableName    :='zam.db';
  T1.Open;
  if QCDM_.Active then QCDM_.Close;
  obd1:=(irok-1)*100;
  obd2:=obd1+12;
  obd1:=obd1+1;
  if iRok>2009
  then QCDM_.Databasename:='PAM98_DATA'
  else QCDM_.Databasename:='PAM98_DATX';
  QCDM_.ParamByName('obdobie1').AsInteger := obd1;
  QCDM_.ParamByName('obdobie2').AsInteger := obd2;
  QCDM_.Open;
  QCDM_.Filtered:=true;
{}
  if iRok>2009
  then QCDM1_.Databasename:='PAM98_DATA'
  else QCDM1_.Databasename:='PAM98_DATX';
  QCDM1_.ParamByName('datum1').Value := EncodeDate(obd1 div 100,obd1 mod 100,1);
  QCDM1_.ParamByName('datum2').Value := EncodeDate(obd2 div 100,obd2 mod 100,31);
  QCDM1_.Open;
  QCDM1_.Filtered:=true;
  while not T1.EOF do
  begin
    QCDM_.Filter:='code_emp='+T1.FieldByName('Code_emp').AsString;
    QCDM1_.Filter:='code_emp='+T1.FieldByName('Code_emp').AsString;
    dni:=QCDM_V_kal_dni.Value-QCDM_V_pn.Value-QCDM_V_ocr12.Value-QCDM_V_nahrada_pn.Value-QCDM1_Dni_pn.Value;
    DecodeDate(T1.FieldByName('Nastup').Value,YY,MM,DD);
    if YY=iRok-1 then dni := dni - (DD-1);
    if dni>0 then begin
      T1.Edit;
      if iRok = 2009 then
        T1.FieldByName('PN_DENNE').Value :=
          ZAOKRUHLI(ZAOKRUHLI(QCDM_N_zaklad_np.Value / KonvKurzEuro,-8,0) / dni,-4,0)
      else if iRok > 2009 then
      T1.FieldByName('PN_DENNE').Value :=
        ZAOKRUHLI(QCDM_N_zaklad_np.Value / dni,-4,0)
      else
      T1.FieldByName('PN_DENNE').Value :=
        ZAOKRUHLI(QCDM_N_zaklad_np.Value / dni,-4,2);
      SL.Add(
        LPAD(T1.FieldByName('Code_numb').AsString,7,' ')+' '+
        RPAD(T1.FieldByName('Surname').AsString+' '+T1.FieldByName('Name').AsString,30,' ')+' '+
        LPAD(QCDM_N_zaklad_np.AsString,15,' ')+' '+
        LPAD(FloatToStr(dni),9,' ')+' '+
        LPAD(T1.FieldByName('PN_DENNE').AsString,15,' '));
      T1.Post;
    end else if (T1.FieldByName('Vystup').AsString='') and bVymazat then begin
      T1.Edit;
      T1.FieldByName('PN_DENNE').AsString := '';
      SL.Add(
        LPAD(T1.FieldByName('Code_numb').AsString,7,' ')+' '+
        RPAD(T1.FieldByName('Surname').AsString+' '+T1.FieldByName('Name').AsString,30,' ')+' '+
        LPAD(' ',15,' ')+' '+
        LPAD(' ',9,' ')+' '+
        LPAD(' ',15,' '));
      T1.Post;
    end;
    T1.Next;
  end;
  T1.Close;
  QCDM_.Close;
  QCDM1_.Close;
  TZAM_.Refresh;
  SL.SaveToFile(subor);
  ExecuteFile('notepad', '"'+subor+'"', '', 1);
  finally
  SL.Free;
  end;
end;end;

procedure TDMV.Zauctuj_RZP_Do_Vyplaty;
var pc,ii,chyby:longint;
  v_obdobie_str,v_rok_str,xx,yy1,yy2,yy3,yy,yyvyp,yyzauct,subor:string;
  SL:TStringList;
  zauct_suma,preplatok_eur:double;
begin with DM do begin
if NOT MyOtazka(SMyRzpZaciatok) then exit;
if NOT MyOtazka(Format(SMyAppZauctovatPreplatkyDane,[AktObdobieStr(false),MyRok(DM.AktObdobie)-1]))
  then exit;
try
  chyby:=0;
  Screen.Cursor:=crHourGlass;
  CreateDir(MyAppPath+MenoXmlDir);
  subor := MyAppPath+MenoXmlDir+'\'+'rzp'+IntToStr(MyRok(DM.AktObdobie)-1)+'.txt';
  v_obdobie_str:='v_obdobie='+IntToStr(DM.AktObdobie);
  v_rok_str:='v_rok='+IntToStr(MyRok(DM.AktObdobie)-1);
(*
  xx:='update ":pam98_data:vyp" set d_vyrovnanie=';
  xx:=xx+'(select max(preplatok) from ":pam98_datx:rzp" where '+v_rok_str+' and code_emp=vyp.code_emp) ';
  xx:=xx+'where '+v_obdobie_str+' and exists ';
  xx:=xx+'(select 1 from ":pam98_datx:rzp" where '+v_rok_str+' and code_emp=vyp.code_emp);';
  QPPP_.SQL.Clear;
  QPPP_.SQL.Add(xx);
  QPPP_.ExecSQL;
  {--}
select zam.code_numb,zam.surname,zam.name,zam.title,rzp.preplatok,vyp.d_vyrovnanie
from ":pam98_data:rzp" rzp
LEFT OUTER JOIN ":pam98_data:vyp" vyp ON vyp.code_emp=rzp.code_emp AND vyp.v_obdobie=200602
JOIN ":pam98_data:zam" zam ON zam.code_emp=rzp.code_emp
where rzp.v_rok=2005
*)
  xx:='select zam.code_emp,zam.code_numb,zam.surname,zam.name,zam.title,rzp.preplatok,d_vyrovnanie';
  xx:=xx+' from ":pam98_datx:rzp" ';
  xx:=xx+' LEFT OUTER JOIN ":pam98_data:vyp" vyp ON vyp.code_emp=rzp.code_emp AND vyp.'+v_obdobie_str;
  xx:=xx+' JOIN ":pam98_data:zam" zam ON zam.code_emp=rzp.code_emp';
  xx:=xx+' where rzp.'+v_rok_str+';';
  QPPP_.SQL.Clear;
  QPPP_.SQL.Add(xx);
  SL := TStringList.Create;
  SL.Add('PROTOKOL O V›SLEDKU ZA⁄»TOVANIA PREPLATKOV/NEDOPLATKOV DANE DO V›PLATY');
  SL.Add(' ');
  SL.Add('                                       Preplatok (+)    Nedoplatok(-) ');
  SL.Add('');
  SL.Add('Os.Ë.   Priezvisko a meno              vypoËÌtan˝       za˙Ëtovan˝       v˝sledok');
  SL.Add('------- ------------------------------ ---------------- ---------------- ---------');
  QPPP_.Open;
  Progress(0);pc:=QPPP_.RecordCount;ii:=0;
  while not QPPP_.EOF do begin
    zauct_suma := 0;
    TVYP_.Filter:='Code_emp='+QPPP_.FieldByName('code_emp').AsString+' and v_obdobie='+IntToStr(DM.AktObdobie);
    TVYP_.Filtered:=True;
    if TVYP_Code_emp.Value=QPPP_.FieldByName('code_emp').Value then begin
      TVYP_.Edit;
      if DM.AktRok=2009 then begin
      if QPPP_.FieldByName('preplatok').Value>0
        then TVYP_D_vyrovnanie.Value := KonverziaSKK_EUR_nahor(QPPP_.FieldByName('preplatok').Value)
        else  TVYP_D_vyrovnanie.Value := KonverziaSKK_EUR_nadol(QPPP_.FieldByName('preplatok').Value);
      end else TVYP_D_vyrovnanie.Value := QPPP_.FieldByName('preplatok').Value;
      zauct_suma := TVYP_D_vyrovnanie.Value;
      TVYP_.Post;
    end;
    inc(ii);Progress(round(ii/pc*100));
    yy1:=LPAD(QPPP_.FieldByName('code_numb').AsString,7,' ')+' ';
    yy2:=PMT(QPPP_.FieldByName('surname').AsString,
        QPPP_.FieldByName('name').AsString,
        QPPP_.FieldByName('title').AsString)+'';
    yy3:=RPAD(yy2,30,' ')+' ';
    yyvyp:=LPAD(FloatToStrF(QPPP_.FieldByName('preplatok').Value,ffFixed,12,2),12,' ');
    yyzauct:=LPAD(FloatToStrF(zauct_suma,ffFixed,12,2),12,' ');
    if (DM.AktRok>2009) then begin yyvyp:=yyvyp+' EUR ';yyzauct:=yyzauct+' EUR';end
    else if (DM.AktRok=2009) then begin yyvyp:=yyvyp+' SKK ';yyzauct:=yyzauct+' EUR';end
    else begin yyvyp:=yyvyp+' SKK ';yyzauct:=yyzauct+' SKK';end;
    yy:=yy1+yy3+yyvyp+yyzauct;
    if QPPP_.FieldByName('d_vyrovnanie').AsString<>'' then
    begin
      if (DM.AktRok<>2009) and (zauct_suma <> QPPP_.FieldByName('preplatok').Value) then
      begin
        yy:=yy+' CHYBA';
        chyby:=chyby+1;
      end
      else if (DM.AktRok=2009)then begin
        if QPPP_.FieldByName('preplatok').Value > 0
         then preplatok_eur := KonverziaSKK_EUR_nahor(QPPP_.FieldByName('preplatok').Value)
         else preplatok_eur := KonverziaSKK_EUR_nadol(QPPP_.FieldByName('preplatok').Value);
        if zauct_suma <> preplatok_eur then begin
          yy:=yy+' CHYBA';
          chyby:=chyby+1;
        end else yy:=yy+' OK';;
      end else yy:=yy+' OK';
    end else begin
      yy:=yy+' CHYBA,neex.v˝plata';
      chyby:=chyby+1;
    end;
    SL. Add(yy);
    QPPP_.Next;
  end;
  QPPP_.Close;
  SL.SaveToFile(subor);
  SL.Free;
  Progress(100);
  if pc=0 then MyError(Format(SMyAppNeexistujeRZP,[MyRok(DM.AktObdobie)-1]))
  else begin
    DMV.AKTUALIZUJ_VYPLATY(1);
    if chyby>0 then MyError(SMyAppChybaPriZauctovaniPreplatkovDane);
    ExecuteFile('notepad', '"'+subor+'"', '', 1);
  end;
  finally
  TVYP_.Filtered:=False;
  Screen.Cursor:=crDefault;
  end;
end;end;

procedure TDMV.Zauctuj_RZZP_Do_Vyplaty;
var pc,ii,chyby:longint;
  v_obdobie_str,v_rok_str,xx,yy1,yy2,yy3,yy,yyvyp,yyzauct,subor:string;
  SL:TStringList;
  zauct_suma,preplatok_eur:double;
begin with DM do begin
if NOT MyOtazka(SMyRzzpZaciatok) then exit;
if NOT MyOtazka(Format(SMyAppZauctovatPreplatkyZP,[AktObdobieStr(false),MyRok(DM.AktObdobie)-1]))
  then exit;
try
  chyby:=0;
  Screen.Cursor:=crHourGlass;
  CreateDir(MyAppPath+MenoXmlDir);
  subor := MyAppPath+MenoXmlDir+'\'+'rzp'+IntToStr(MyRok(DM.AktObdobie)-1)+'.txt';
  v_obdobie_str:='v_obdobie='+IntToStr(DM.AktObdobie);
  v_rok_str:='v_rok='+IntToStr(MyRok(DM.AktObdobie));
(*
  xx:='update ":pam98_data:vyp" set vyrovnanie_zp=';
  xx:=xx+'(select -X1 preplatok from ":pam98_data:zp_univ" where '+v_rok_str+' and code_emp=vyp.code_emp and typ=''VV'') ';
  xx:=xx+'where '+v_obdobie_str+' and exists ';
  xx:=xx+'(select 1 from ":pam98_data:zp_univ" where '+v_rok_str+' and code_emp=vyp.code_emp and typ=''VV'');';
  QPPP_.SQL.Clear;
  QPPP_.SQL.Add(xx);
  QPPP_.ExecSQL;
*)
  {--}
  xx:='select zam.code_emp,zam.code_numb,zam.surname,zam.name,zam.title,-univ.X1 preplatok,vyrovnanie_zp';
  xx:=xx+' from ":pam98_data:zp_univ" univ ';
  xx:=xx+' LEFT OUTER JOIN ":pam98_data:vyp" vyp ON vyp.code_emp=univ.code_emp AND vyp.'+v_obdobie_str;
  xx:=xx+' JOIN ":pam98_data:zam" zam ON zam.code_emp=univ.code_emp';
  xx:=xx+' where univ.'+v_rok_str+' and univ.typ=''VV'';';
  QPPP_.SQL.Clear;
  QPPP_.SQL.Add(xx);
  SL := TStringList.Create;
  SL.Add('PROTOKOL O V›SLEDKU ZA⁄»TOVANIA PREPLATKOV/NEDOPL. ZDR.POIST. DO V›PLATY');
  SL.Add(' ');
  SL.Add('                                       Preplatok (+)    Nedoplatok (-)  ');
  SL.Add('');
  SL.Add('Os.Ë.   Priezvisko a meno              vypoËÌtan˝       za˙Ëtovan˝       v˝sledok');
  SL.Add('------- ------------------------------ ---------------- ---------------- ---------');
  QPPP_.Open;
  Progress(0);pc:=QPPP_.RecordCount;ii:=0;
  while not QPPP_.EOF do begin
    TVYP_.Filter:='Code_emp='+QPPP_.FieldByName('code_emp').AsString+' and v_obdobie='+IntToStr(DM.AktObdobie);
    TVYP_.Filtered:=True;
    if TVYP_Code_emp.Value=QPPP_.FieldByName('code_emp').Value then begin
      TVYP_.Edit;
      if DM.AktRok=2009 then begin
      if QPPP_.FieldByName('preplatok').Value>0
        then TVYP_vyrovnanie_zp.Value := KonverziaSKK_EUR_nahor(QPPP_.FieldByName('preplatok').Value)
        else  TVYP_vyrovnanie_zp.Value := KonverziaSKK_EUR_nadol(QPPP_.FieldByName('preplatok').Value);
      end else TVYP_vyrovnanie_zp.Value := QPPP_.FieldByName('preplatok').Value;
      zauct_suma := TVYP_vyrovnanie_zp.Value;
      TVYP_.Post;
    end;
    inc(ii);Progress(round(ii/pc*100));
    yy1:=LPAD(QPPP_.FieldByName('code_numb').AsString,7,' ')+' ';
    yy2:=PMT(QPPP_.FieldByName('surname').AsString,
        QPPP_.FieldByName('name').AsString,
        QPPP_.FieldByName('title').AsString)+'';
    yy3:=RPAD(yy2,30,' ')+' ';
    yyvyp:=LPAD(QPPP_.FieldByName('preplatok').Value,12,' ');
    yyzauct:=LPAD(FloatToStr(zauct_suma),12,' ');
    if (DM.AktRok>2009) then begin yyvyp:=yyvyp+' EUR ';yyzauct:=yyzauct+' EUR';end
    else if (DM.AktRok=2009) then begin yyvyp:=yyvyp+' SKK ';yyzauct:=yyzauct+' EUR';end
    else begin yyvyp:=yyvyp+' SKK ';yyzauct:=yyzauct+' SKK';end;
    yy:=yy1+yy3+yyvyp+yyzauct;
    if QPPP_.FieldByName('vyrovnanie_zp').AsString<>'' then
    begin
      if (DM.AktRok<>2009) and (zauct_suma <> QPPP_.FieldByName('preplatok').Value) then
      begin
        yy:=yy+' CHYBA';
        chyby:=chyby+1;
      end
      else if (DM.AktRok=2009)then begin
        if QPPP_.FieldByName('preplatok').Value > 0
         then preplatok_eur := KonverziaSKK_EUR_nahor(QPPP_.FieldByName('preplatok').Value)
         else preplatok_eur := KonverziaSKK_EUR_nadol(QPPP_.FieldByName('preplatok').Value);
        if zauct_suma <> preplatok_eur then begin
          yy:=yy+' CHYBA';
          chyby:=chyby+1;
        end else yy:=yy+' OK';;
      end else yy:=yy+' OK';
    end else begin
      yy:=yy+' CHYBA,neex.v˝plata';
      chyby:=chyby+1;
    end;
    SL. Add(yy);
    QPPP_.Next;
  end;
  QPPP_.Close;
  SL.SaveToFile(subor);
  SL.Free;
  Progress(100);
  if pc=0 then MyError(Format(SMyAppNeexistujeRZP,[MyRok(DM.AktObdobie)-1]))
  else begin
    DMV.AKTUALIZUJ_VYPLATY(2);
    if chyby>0 then MyError(SMyAppChybaPriZauctovaniPreplatkovZP);
    ExecuteFile('notepad', '"'+subor+'"', '', 1);
  end;
  finally
  TVYP_.Filtered:=False;
  Screen.Cursor:=crDefault;
  end;
end;end;

procedure TDMV.TVYPNP_NewRecord(DataSet: TDataSet);
begin
  TVYPNP_Code_emp.Value := TVYP_Code_emp.Value;
  TVYPNP_V_obdobie.Value := TVYP_V_obdobie.Value;
  {--}
  TVYPNP_N_Prijem.Value := 0;
  {--}
  TVYPNP_N_Zaklad_np.Value := 0;
  TVYPNP_N_Zaklad_dp.Value := 0;
  TVYPNP_N_Zaklad_fz.Value := 0;
  TVYPNP_N_Zaklad_ip.Value := 0;
  TVYPNP_N_Zaklad_up.Value := 0;
  TVYPNP_N_Zaklad_rf.Value := 0;
  TVYPNP_N_Zaklad_gp.Value := 0;
  {--}
  TVYPNP_VylucDobyTrva.Value := false;
  {--}
  SET_ALL_VYPNP;
end;

procedure TDMV.TVYPNP_BeforePost(DataSet: TDataSet);
begin
  SET_ALL_VYPNP;
  if TVYPNP_V_Obdobie_Vyp.Value > TVYPNP_V_Obdobie.Value then
  begin
    MyError(SMyAppVypNpZleObdobie);
    Abort;
  end;
  if (Trim(TVYPNP_N_prijem.AsString)='') or (TVYPNP_N_prijem.Value = 0) then
  begin
    MyError(Format(SMyAppItemIsRequired,['Suma prÌjmu']));
    Abort;
  end;
end;

procedure TDMV.TVYPNP_AfterPost(DataSet: TDataSet);
begin
  NepravidelnyPrijem_Zmena;
end;

procedure TDMV.NepravidelnyPrijem_Backup;
begin
 BoliZmenyNepravidelnehoPrijmu := FALSE;
 if QNPMEM_.Active Then QNPMEM_.Close;
 QNPMEM_.ParamByName('P1').AsInteger := TVYP_Code_emp.Value;
 QNPMEM_.ParamByName('P2').AsInteger := TVYP_V_obdobie.Value;
 QNPMEM_.Open;
end;

procedure TDMV.NepravidelnyPrijem_Restore;
var i: integer;
begin
 if TVYP_.State = dsInsert then begin
   TVYPNP_.First;
   while not TVYPNP_.EOF do TVYPNP_.Delete;
   exit;
 end;
 if not QNPMEM_.Active then exit;
 if not BoliZmenyNepravidelnehoPrijmu then begin
  QNPMEM_.Close;
  exit;
 end;
 TVYPNP_.First;
 while not TVYPNP_.EOF do TVYPNP_.Delete;
 QNPMEM_.First;
 while not QNPMEM_.EOF do
 begin
   TVYPNP_.Edit;
   for i:=0 to TVYPNP_.FieldCount-1 do
     TVYPNP_.Fields[i].Value := QNPMEM_.Fields[i].Value;
   TVYPNP_.Post;
   QNPMEM_.Next;
 end;
 QNPMEM_.Close;
end;

procedure TDMV.NepravidelnyPrijem_Zmena;
begin
  if TVYP_.State in [dsEdit,dsInsert] then begin
   if QVYPNP_.Active then QVYPNP_.Close;
   QVYPNP_.ParamByName('P1').AsInteger := TVYP_Code_emp.Value;
   QVYPNP_.ParamByName('P2').AsInteger := TVYP_V_obdobie.Value;
   QVYPNP_.Open;
   TVYP_N_Jednoraz1.Value := QVYPNP_N_Prijem.Value;
   TVYP_N_Poist3.Value := QVYPNP_N_Poist3.Value;
   QVYPNP_.Close;
  end;
  BoliZmenyNepravidelnehoPrijmu := TRUE;
end;

procedure TDMV.TVYPNP_V_mesiac_vypChange(Sender: TField);
begin if TVYPNP_.State in [dsEdit,dsInsert] then begin
   TVYPNP_Kal_dni.Value := KAL_DNI(TVYPNP_V_mesiac_vyp.Value);
end;end;

procedure TDMV.TVYPNP_PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  if E.Message=SMyCisKeyViolation then begin
    MyError(SMyAppVypNpDuplicitnyZaznam);
    Action := daAbort;
  end;
end;





end.
