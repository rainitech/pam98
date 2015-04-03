unit Dm_zam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables;

type
  EAlreadyExist = class(Exception);

  TPridavky=record
    p1,p2:double;
    dom_potreba:double;
    dom_kategoria:integer;
    pridavky:double;
    nezdc_deti:double;
  end;

  TDMZ = class(TDataModule)
    TZAM_: TTable;
    TZAM_TMP: TStringField;
    TZAM_PMT: TStringField;
    QZAM_: TQuery;
    DS_ZAM1: TDataSource;
    DS_ZGRID: TDataSource;
    DS_ZAMF: TDataSource;
    TZAM_CALC_SUBJ: TStringField;
    TZAM_CALC_ADRESA: TStringField;
    TZAM_CALC_POHLAVIE: TStringField;
    TDET_: TTable;
    TDET_Code_emp: TIntegerField;
    TDET_DID: TAutoIncField;
    TDET_Priezvisko: TStringField;
    TDET_Meno: TStringField;
    TDET_RC: TStringField;
    TDET_NC: TBooleanField;
    TDET_MES_OD: TSmallintField;
    TDET_MES_DO: TSmallintField;
    DS_DETI: TDataSource;
    DS_DGRID: TDataSource;
    TDET_CALC_MP: TStringField;
    TZAM_L_KZP: TStringField;
    TZAM_Name: TStringField;
    TZAM_Surname: TStringField;
    TZAM_Prev_name: TStringField;
    TZAM_Title: TStringField;
    TZAM_Born_date: TDateField;
    TZAM_Born_numb: TStringField;
    TZAM_Born_city: TStringField;
    TZAM_Rod_stav: TStringField;
    TZAM_Pohlavie: TStringField;
    TZAM_Narodnost: TStringField;
    TZAM_C_op: TStringField;
    TZAM_C_pasu: TStringField;
    TZAM_C_vodicaku: TStringField;
    TZAM_Predcislo_u: TStringField;
    TZAM_Cislo_u: TStringField;
    TZAM_Banka_u: TStringField;
    TZAM_SSym_u: TStringField;
    TZAM_Tp_street: TStringField;
    TZAM_Tp_city: TStringField;
    TZAM_Tp_zip: TStringField;
    TZAM_Pp_street: TStringField;
    TZAM_Pp_city: TStringField;
    TZAM_Pp_zip: TStringField;
    TZAM_Education: TStringField;
    TZAM_Zamestnanie: TStringField;
    TZAM_KZP: TSmallintField;
    TZAM_ZPS: TBooleanField;
    TZAM_Nastup: TDateField;
    TZAM_Vystup: TDateField;
    TZAM_VYHL: TBooleanField;
    TZAM_RZP: TBooleanField;
    TZAM_MV_plat: TCurrencyField;
    TZAM_V_sadzba: TCurrencyField;
    TZAM_Pouz_auto: TCurrencyField;
    TZAM_Nc_minimum: TCurrencyField;
    TZAM_Ne_zaloha: TCurrencyField;
    TZAM_Ne_pozicky: TCurrencyField;
    TZAM_Ne_odborar: TCurrencyField;
    TZAM_Ne_poistovna: TCurrencyField;
    TZAM_Ne_exekucia: TCurrencyField;
    TZAM_Spor_plat: TSmallintField;
    TZAM_Sporenie: TCurrencyField;
    TZAM_U_zdrav: TSmallintField;
    TZAM_U_nemoc: TSmallintField;
    TZAM_U_dochod: TSmallintField;
    TZAM_U_fondzam: TSmallintField;
    QZAM_pocet: TIntegerField;
    TZAM_SID: TSmallintField;
    TZAM_CALC_STREDISKO: TStringField;
    TDET_DAT_NAR: TDateField;
    TDET_PD: TBooleanField;
    TZAM_Fz_typzam: TStringField;
    TZAM_CALC_FZ_UVAZOK: TStringField;
    TZAM_CALC_FZ_TYPZAM: TStringField;
    TZAM_Fz_uvazok: TStringField;
    QDET_: TQuery;
    TDET_CALC_POTREBA: TCurrencyField;
    TDET_CALC_VEK: TStringField;
    TDET_CALC_PRIDAVKY1: TCurrencyField;
    TDET_CALC_PRIDAVKY2: TCurrencyField;
    TZAM_Dan_zrazkou: TBooleanField;
    TZAM_F_doba: TFloatField;
    TZAM_Fixny_mv_plat: TBooleanField;
    TZAM_Fz_hlavne: TBooleanField;
    TDET_ZTP: TBooleanField;
    QDET_pocet: TIntegerField;
    QDET_pocet1: TIntegerField;
    TZAM_F_sadzba_premii: TFloatField;
    TZRZ_: TTable;
    DS_ZRZ: TDataSource;
    DS_ZRZG: TDataSource;
    TZRZ_Code_emp: TIntegerField;
    TZRZ_ZRID: TAutoIncField;
    TZRZ_Typ: TStringField;
    TZRZ_Datum_od: TDateField;
    TZRZ_Datum_do: TDateField;
    TZRZ_Obdobie_od: TIntegerField;
    TZRZ_Obdobie_do: TIntegerField;
    TZRZ_Predcislo_u: TStringField;
    TZRZ_Cislo_u: TStringField;
    TZRZ_Banka_u: TStringField;
    TZRZ_Ssym_u: TStringField;
    TZRZ_Vsym: TStringField;
    TZRZ_Ksym: TStringField;
    TZRZ_Spp: TStringField;
    TZRZ_Suma: TCurrencyField;
    TZRZ_Poznamka: TStringField;
    QZRZ_: TQuery;
    QZRZ_code_emp: TIntegerField;
    QZRZ_ZRID: TIntegerField;
    QZRZ_Typ: TStringField;
    QZRZ_Datum_od: TDateField;
    QZRZ_Datum_do: TDateField;
    QZRZ_Obdobie_od: TIntegerField;
    QZRZ_Obdobie_do: TIntegerField;
    QZRZ_Predcislo_u: TStringField;
    QZRZ_Cislo_u: TStringField;
    QZRZ_Banka_u: TStringField;
    QZRZ_Ssym_u: TStringField;
    QZRZ_Vsym: TStringField;
    QZRZ_Ksym: TStringField;
    QZRZ_Spp: TStringField;
    QZRZ_Suma: TCurrencyField;
    QZRZ_Poznamka: TStringField;
    TZRZ_Prijemca: TStringField;
    QZRZ_Prijemca: TStringField;
    TNEP_: TTable;
    DS_NEP: TDataSource;
    DS_NEPG: TDataSource;
    TZAM_Holiday_old: TFloatField;
    TZAM_Code_emp: TIntegerField;
    QCODE1_: TQuery;
    QCODE1_max_code_emp: TIntegerField;
    QCODE2_: TQuery;
    QCODE2_max_code_emp: TIntegerField;
    SQL1: TQuery;
    TZAM_ZTP: TBooleanField;
    TZAM_Zvys_ostatne: TCurrencyField;
    TZAM_U_sviatky: TBooleanField;
    TZAM_Holiday: TFloatField;
    TZAM_N_ddp: TCurrencyField;
    TNEP_Calc_kal_dni: TIntegerField;
    TZRZ_Typ_sumy: TSmallintField;
    QZRZ_Typ_sumy: TSmallintField;
    TZAM_Vsym_u: TStringField;
    TZAM_Ksym_u: TStringField;
    TZAM_Dan_nerezident: TBooleanField;
    TNEP_Calc_typ_nep: TStringField;
    TZAM_N_sadzba_ddp: TFloatField;
    TZAM_Nz_ddp: TCurrencyField;
    TZAM_Nz_sadzba_ddp: TFloatField;
    TZAM_KDP: TSmallintField;
    TZAM_L_KDP: TStringField;
    TZAM_U_invalid: TSmallintField;
    TZAM_U_uraz: TSmallintField;
    TZAM_U_rezerva: TSmallintField;
    TZAM_U_garancne: TSmallintField;
    TZAM_PN_DENNE: TFloatField;
    QDET2_: TQuery;
    QDET2_pocet1: TIntegerField;
    QDET2_pocet2: TIntegerField;
    TDET_DAN_BONUS: TBooleanField;
    TDET_ZNIZ_POISTNE: TBooleanField;
    QDET2_pocet3: TIntegerField;
    TZAM_VYNIMKA_VZ: TStringField;
    TZAM_L_VVZ: TStringField;
    TZAM_Code_numb: TIntegerField;
    TZAM_CALC_AKTROK: TIntegerField;
    TZAM_Miera_poklesu: TFloatField;
    TZAM_W_holiday: TFloatField;
    TZAM_Stat_obcan: TStringField;
    TZAM_Stat_tp: TStringField;
    TZAM_Stat_pp: TStringField;
    TZAM_L_STAT_OBCAN: TStringField;
    TZAM_L_STAT_TP: TStringField;
    TZAM_L_STAT_PP: TStringField;
    TZAM_Tp_zip2: TStringField;
    TZAM_Pp_zip2: TStringField;
    TZAM_SSN: TStringField;
    TZAM_CPP: TStringField;
    TNEP_L_PRERUS1: TStringField;
    TNEP_L_TYPRL: TStringField;
    TZAM_PMT2: TStringField;
    TZAM_TYPZEC: TSmallintField;
    TZAM_L_TYPZEC: TStringField;
    TZAM_L_ROD_STAV: TStringField;
    DS_NEP2: TDataSource;
    TNEP_Datum_od: TDateField;
    TNEP_NID: TAutoIncField;
    TNEP_Datum_do: TDateField;
    TNEP_Prerusenie: TSmallintField;
    TNEP_V_obdobie: TIntegerField;
    TNEP_Prac_dni: TSmallintField;
    TNEP_Dovod: TStringField;
    TNEP_Typ: TSmallintField;
    TNEP_TypRL: TStringField;
    TNEP_TypRL2: TSmallintField;
    TNEP_L_TYPRL2: TStringField;
    TZAM_Tel1: TStringField;
    TZAM_Tel2: TStringField;
    TZAM_Fax: TStringField;
    TZAM_Mail: TStringField;
    TDOCH_: TTable;
    TDOCH_Code_emp: TIntegerField;
    TDOCH_Typ: TSmallintField;
    TDOCH_Datum_od: TDateField;
    TDOCH_Datum_do: TDateField;
    DS_DOCH: TDataSource;
    TDOCH_L_DOCH: TStringField;
    TZAM_SSN_STATP: TStringField;
    TNEP_Code_emp: TIntegerField;
    TNEP_L_ZAM: TStringField;
    TELDP_: TTable;
    DS_ELDP: TDataSource;
    TELDP_Code_emp: TIntegerField;
    TELDP_Datum_od: TDateField;
    TELDP_Datum_do: TDateField;
    TELDP_Znak: TStringField;
    TELDP_VZ: TCurrencyField;
    TELDP_Vyluka_VZ: TCurrencyField;
    TELDP_Vyluka_dni: TSmallintField;
    TELDP_L_ZNAK: TStringField;
    TZAM_Banka2_u: TStringField;
    TZAM_U_sds: TSmallintField;
    TZP2_: TTable;
    TZP1_: TTable;
    TZP1_Code_emp: TIntegerField;
    TZP1_V_rok: TSmallintField;
    TZP1_KZP: TSmallintField;
    TZP1_Typ_zuctovania: TSmallintField;
    TZP1_Datum_ziadosti: TDateField;
    TZP1_Datum_vykonania: TDateField;
    TZP1_Datum_doklad: TDateField;
    TZP1_Pocet_zamtelov: TSmallintField;
    TZP1_Zamnec_od: TDateField;
    TZP1_Zamnec_do: TDateField;
    TZP1_Uhrn_prijmov: TCurrencyField;
    TZP1_Uhrn_preddav_zamnec: TCurrencyField;
    TZP1_Uhrn_preddav_zamtel: TCurrencyField;
    TZP1_Uhrn_minim_zakladov: TCurrencyField;
    TZP1_Preddavky_dan_uzn: TCurrencyField;
    DS_ZP1: TDataSource;
    DS_ZP2: TDataSource;
    TZP2_Code_emp: TIntegerField;
    TZP2_Datum_od: TDateField;
    TZP2_Datum_do: TDateField;
    TZP2_Dovod: TStringField;
    TZP1_L_TYP_ZUCT: TStringField;
    TZP1_L_KZP: TStringField;
    TZP1_ROK: TSmallintField;
    TZP3_: TTable;
    TZP4_: TTable;
    DS_ZP4: TDataSource;
    TZP4_Code_emp: TIntegerField;
    TZP4_V_rok: TSmallintField;
    TZP4_V_mesiac: TSmallintField;
    TZP4_Typ: TSmallintField;
    TZP4_X1: TCurrencyField;
    TZP4_X2: TCurrencyField;
    TZP4_X3: TCurrencyField;
    TZP4_X4: TCurrencyField;
    TZP4_X5: TCurrencyField;
    TZP4_X6: TCurrencyField;
    TZP4_X7: TCurrencyField;
    TZP4_X8: TCurrencyField;
    TZP4_X9: TCurrencyField;
    TZP4_C1: TIntegerField;
    TZP4_C2: TIntegerField;
    TZP4_C3: TIntegerField;
    TZP4_C4: TIntegerField;
    TZP4_C5: TIntegerField;
    DS_ZP3: TDataSource;
    TZP3_Code_emp: TIntegerField;
    TZP3_V_rok: TSmallintField;
    TZP3_Typ: TStringField;
    TZP3_Rok: TSmallintField;
    TZP3_X1: TCurrencyField;
    TZP3_X2: TCurrencyField;
    TZP3_X3: TCurrencyField;
    TZP3_X4: TCurrencyField;
    TZP3_X5: TCurrencyField;
    TZP3_X6: TCurrencyField;
    TZP3_X7: TCurrencyField;
    TZP3_X8: TCurrencyField;
    TZP3_X9: TCurrencyField;
    TZP3_X10: TCurrencyField;
    TZP3_X11: TCurrencyField;
    TZP3_X12: TCurrencyField;
    TZP3_X13: TCurrencyField;
    TZP3_X14: TCurrencyField;
    TZP3_X15: TCurrencyField;
    TZP3_X16: TCurrencyField;
    TZP3_X17: TCurrencyField;
    TZP3_X18: TCurrencyField;
    TZP3_X19: TCurrencyField;
    TZP3_X20: TCurrencyField;
    TZP3_X21: TCurrencyField;
    TZP3_X22: TCurrencyField;
    TZP3_X23: TCurrencyField;
    TZP3_X24: TCurrencyField;
    TZP3_X25: TCurrencyField;
    TZP3_X26: TCurrencyField;
    TZP3_X28: TCurrencyField;
    TZP3_X29: TCurrencyField;
    TZP3_X30: TCurrencyField;
    TZP3_X31: TCurrencyField;
    TZP3_X32: TCurrencyField;
    TZP3_X33: TCurrencyField;
    TZP3_X34: TCurrencyField;
    TZP3_X35: TCurrencyField;
    TZP3_X36: TCurrencyField;
    TZP3_X37: TCurrencyField;
    TZP3_X38: TCurrencyField;
    TZP3_X39: TCurrencyField;
    TZP3_X40: TCurrencyField;
    TZP3_X41: TCurrencyField;
    TZP3_X42: TCurrencyField;
    TZP3_X43: TCurrencyField;
    TZP3_X44: TCurrencyField;
    TZP3_X45: TCurrencyField;
    TZP3_X46: TCurrencyField;
    TZP3_X47: TCurrencyField;
    TZP3_X48: TCurrencyField;
    TZP3_X49: TCurrencyField;
    TZP3_X50: TCurrencyField;
    TZP3_X51: TCurrencyField;
    TZP3_X52: TCurrencyField;
    TZP3_X53: TCurrencyField;
    TZP3_X54: TCurrencyField;
    TZP3_X55: TCurrencyField;
    TZP3_X56: TCurrencyField;
    TZP3_X57: TCurrencyField;
    TZP3_X58: TCurrencyField;
    TZP3_X59: TCurrencyField;
    TZP3_X60: TCurrencyField;
    TZP3_X61: TCurrencyField;
    TZP3_X62: TCurrencyField;
    TZP3_X63: TCurrencyField;
    TZP3_X64: TCurrencyField;
    TZP3_X65: TCurrencyField;
    TZP3_X66: TCurrencyField;
    TZP3_X67: TCurrencyField;
    TZP3_X68: TCurrencyField;
    TZP3_X69: TCurrencyField;
    TZP3_X70: TCurrencyField;
    TZP3_D1: TDateField;
    TZP3_D2: TDateField;
    TZP3_D3: TDateField;
    TZP3_D4: TDateField;
    TZP3_D5: TDateField;
    TZP3_D6: TDateField;
    TZP3_D7: TDateField;
    TZP3_D8: TDateField;
    TZP3_D9: TDateField;
    TZP3_D10: TDateField;
    TZP3_A1: TStringField;
    TZP3_A2: TStringField;
    TZP3_A3: TStringField;
    TZP3_A4: TStringField;
    TZP3_A5: TStringField;
    TZP3_A6: TStringField;
    TZP3_A7: TStringField;
    TZP3_A8: TStringField;
    TZP3_A9: TStringField;
    TZP3_A10: TStringField;
    TZP3_PO_NAZOV: TStringField;
    TZP3_PO_ZPCPP: TStringField;
    TZP3_FO_RC: TStringField;
    TZP3_FO_CPP: TStringField;
    TZP3_ICO: TStringField;
    TZP3_DIC: TStringField;
    TZP3_ADR_ULICA: TStringField;
    TZP3_ADR_PSC: TStringField;
    TZP3_ADR_OBEC: TStringField;
    TZP3_ADR_TEL: TStringField;
    TZP3_ADR_FAX: TStringField;
    TZP5_: TTable;
    TZP5_Code_emp: TIntegerField;
    TZP5_ID: TAutoIncField;
    TZP5_Kod_zmeny: TStringField;
    TZP5_Platnost_zmeny: TStringField;
    TZP5_Datum_zmeny: TDateField;
    TZP5_Id_cislo: TStringField;
    DS_ZP5: TDataSource;
    TZP5_V_rok: TSmallintField;
    TZP5_V_mesiac: TSmallintField;
    TZP5_KZP: TSmallintField;
    QBOOL_: TQuery;
    QBOOL_name: TStringField;
    QBOOL_code: TBooleanField;
    DS_BOOL: TDataSource;
    TNEP_Typzec: TSmallintField;
    TNEP_L_TYPZEC: TStringField;
    TNEP_Zmena1: TBooleanField;
    TNEP_Zmena2: TBooleanField;
    TNEP_Zmena3: TBooleanField;
    TNEP_Zmena4: TBooleanField;
    TNEP_ZacMD: TDateField;
    TNEP_KonMD: TDateField;
    TNEP_ZacRD: TDateField;
    TNEP_KonRD: TDateField;
    TNEP_DatVznikPV: TDateField;
    TNEP_TypPracPomeru: TSmallintField;
    TZAM_Title_after: TStringField;
    TZAM_Born_name: TStringField;
    TZAM_Tp_ulica: TStringField;
    TZAM_Tp_ocislo: TStringField;
    TZAM_Tp_supcislo: TIntegerField;
    TZAM_Pp_ulica: TStringField;
    TZAM_Pp_ocislo: TStringField;
    TZAM_Pp_supcislo: TIntegerField;
    QZAM1_: TQuery;
    IntegerField1: TIntegerField;
    TZAM_IBAN: TStringField;
    TZRZ_IBAN: TStringField;
    QZRZ_IBAN: TStringField;
    TZAM_Statutar_Od_50_percent: TBooleanField;
    TZAM_Par7ods2: TBooleanField;
    procedure TZAM_CalcFields(DataSet: TDataSet);
    procedure DS_ZAM1StateChange(Sender: TObject);
    procedure DMZCreate(Sender: TObject);
    procedure TZAM_BeforeDelete(DataSet: TDataSet);
    procedure TZAM_PohlavieValidate(Sender: TField);
    procedure DS_DETIDataChange(Sender: TObject; Field: TField);
    procedure TDET_NewRecord(DataSet: TDataSet);
    procedure TDET_CalcFields(DataSet: TDataSet);
    procedure Predcislo_Validate(Sender: TField);
    procedure Abo_Validate(Sender: TField);
    procedure TZAM_NewRecord(DataSet: TDataSet);
    procedure CisloValidate(Sender: TField);
    procedure TZAM_Code_numbValidate(Sender: TField);
    procedure TZAM_BeforePost(DataSet: TDataSet);
    procedure TZAM_SIDValidate(Sender: TField);
    procedure TZAM_Fz_uvazokValidate(Sender: TField);
    procedure TZAM_Fz_typzamValidate(Sender: TField);
    procedure DS_ZRZDataChange(Sender: TObject; Field: TField);
    procedure TZRZ_NewRecord(DataSet: TDataSet);
    procedure TZRZ_BeforePost(DataSet: TDataSet);
    procedure TZRZ_TypValidate(Sender: TField);
    procedure TNEP_NewRecord(DataSet: TDataSet);
    procedure TNEP_BeforePost(DataSet: TDataSet);
    procedure TZAM_U_PoistenieValidate(Sender: TField);
    procedure TZAM_U_Poistenie2Validate(Sender: TField);
    procedure TZAM_ZTPValidate(Sender: TField);
    procedure DS_ZAMFDataChange(Sender: TObject; Field: TField);
    procedure TZAM_TMPGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure TZAM_TMPSetText(Sender: TField; const Text: String);
    procedure TZAM_PMTGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure TNEP_CalcFields(DataSet: TDataSet);
    procedure DS_NEPDataChange(Sender: TObject; Field: TField);
    procedure TDET_BeforePost(DataSet: TDataSet);
    procedure TZAM_Pd_osobyGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure TZAM_Pd_osobySetText(Sender: TField; const Text: String);
    procedure Akcia_prerusenie_validate(Sender: TField);
    procedure TNEP_TypRLValidate(Sender: TField);
    procedure TDOCH_Datum_doValidate(Sender: TField);
    procedure TZAM_AfterScroll(DataSet: TDataSet);
    procedure TELDP_BeforePost(DataSet: TDataSet);
    procedure TZAM_Born_numbValidate(Sender: TField);
    procedure TZP1_NewRecord(DataSet: TDataSet);
    procedure TZP2_NewRecord(DataSet: TDataSet);
    procedure TZP1_BeforePost(DataSet: TDataSet);
    procedure TZP2_BeforePost(DataSet: TDataSet);
    procedure TZP1_BeforeInsert(DataSet: TDataSet);
    procedure TZP4_BeforeInsert(DataSet: TDataSet);
    procedure TZP2_BeforeDelete(DataSet: TDataSet);
    procedure TZP1_BeforeDelete(DataSet: TDataSet);
    procedure TZP3_NewRecord(DataSet: TDataSet);
    procedure TZP3_BeforePost(DataSet: TDataSet);
    procedure TZP5_NewRecord(DataSet: TDataSet);
    procedure TZP5_BeforePost(DataSet: TDataSet);
    procedure TZP5_Kod_zmenyValidate(Sender: TField);
    procedure TNEP_BeforeDelete(DataSet: TDataSet);
    procedure TNEP_BeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    REC_PRIDAVKY: TPridavky;
    REZIM_ZP3: String[32];
    OLD_FILTER:String;
    PRIEZVISKO_FILTER: String;
    procedure SET_FILTER(const s: string);
    function GET_FILTER(const s: char;iDoplnok: string):string;
    procedure SAVE_FILTER;
    procedure RESTORE_FILTER;
    function DIETA_VEK(const datnar_yyyymm:string):string;
    function DIETA_POTREBA(const vek:string; var P1,P2:double):double;
    function NEZD_CIASTKA_NA_DETI:double;
    procedure POCTY_DETI(var oPoist,oBonus,oPridavky:integer);
    function MAX_CODE_EMP:longint;
    function  EXISTUJE_ZAM(xCode_numb:integer):boolean;
    function  EXISTUJE_ZAM_ANK(xCode_numb:longint;xDohodaId:longint):boolean;
    procedure ZDR_VYPOCET_DOKLADU;
  end;

var
  DMZ: TDMZ;

implementation

uses Dm_vypl, MyConsts, Dm_main, Main, DM_sql, MainVyp;

{$R *.DFM}

procedure TDMZ.TZAM_PMTGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text:=
    Copy(
    Trim(TZAM_Surname.Value)+' '+
    Trim(TZAM_Name.Value)+' '+
    Trim(TZAM_Title.Value),
    1,100);
end;

procedure TDMZ.TZAM_TMPGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text:=
    Copy(
    Trim(TZAM_Title.Value)+' '+
    Trim(TZAM_Name.Value)+' '+
    Trim(TZAM_Surname.Value),1,100);
end;

procedure TDMZ.TZAM_TMPSetText(Sender: TField; const Text: string);
begin
  Sender.Value:=Text;
end;

procedure TDMZ.TZAM_CalcFields(DataSet: TDataSet);
var Nazov:string;
begin
  if DM.ExistujeStredisko(TZAM_SID.Value,Nazov)
    then TZAM_CALC_STREDISKO.Value:=Nazov
    else TZAM_CALC_STREDISKO.Value:='';

  TZAM_TMP.Text:=
    Trim(TZAM_Title.Value)+' '+
    Trim(TZAM_Name.Value)+' '+
    Trim(TZAM_Surname.Value);

  TZAM_PMT.Text:=
    Trim(TZAM_Surname.Value)+' '+
    Trim(TZAM_Name.Value)+' '+
    Trim(TZAM_Title.Value);

  TZAM_PMT2.Text:=
    Trim(TZAM_Surname.Value)+' '+
    Trim(TZAM_Name.Value)+' '+
    Trim(TZAM_Title.Value);
  if TZAM_Vystup.AsString<>'' then
    TZAM_PMT2.Text:=TZAM_PMT2.Text+'(zruš.)';
  TZAM_PMT2.Text:=TZAM_PMT2.Text+','+TZAM_Code_numb.AsString;

  TZAM_CALC_SUBJ.Value :=
    TZAM_TMP.Value+', bytom '+
    TZAM_tp_street.Value+', '+
    TZAM_tp_zip.Value+' '+
    TZAM_tp_city.Value+', nar. '+
    TZAM_born_date.AsString+', (ïalej pracovník),';

  TZAM_CALC_ADRESA.Value :=
    TZAM_tp_street.Value+', '+
    TZAM_tp_zip.Value+' '+
    TZAM_tp_city.Value;

  TZAM_CALC_POHLAVIE.Value := TEXT_POHLAVIE(StrToChar(TZAM_Pohlavie.AsString));
  TZAM_CALC_FZ_UVAZOK.Value:= TEXT_FZ_UVAZOK(StrToChar(TZAM_FZ_Uvazok.Value));
  TZAM_CALC_FZ_TYPZAM.Value:= TEXT_FZ_TYPZAM(StrToChar(TZAM_FZ_TypZam.Value));

  TZAM_CALC_AKTROK.Value := DM.AktRok;
end;

procedure TDMZ.DS_ZAM1StateChange(Sender: TObject);
begin
  if TZAM_.State in [dsInsert,dsEdit] then
  begin
    DS_ZGRID.Enabled := False;
    DS_ZAMF.Enabled := False;
  end else
  begin
    DS_ZGRID.Enabled := True;
    DS_ZAMF.Enabled := True;
  end;
end;

procedure TDMZ.DMZCreate(Sender: TObject);
begin
  TZAM_.Close;
end;

procedure TDMZ.TZAM_BeforeDelete(DataSet: TDataSet);
begin
  if DMV.POCET_VYPLAT_ZAM(TZAM_Code_emp.Value)>0 then begin
    raise EMyError.Create(SMyZamMaUrobeneVyplaty);
  end;
  if MyOtazka(SMyZamVymazatPracovnika) then
  if MyOtazka(SMyZamBudeDefinitivneZruseny) then exit;
  raise EMyError.Create(SMyZamVymazanieBoloZastavene);
end;

procedure TDMZ.TZAM_PohlavieValidate(Sender: TField);
begin
  if not (StrToChar(Sender.AsString) in ['Z','M']) then
  raise EMyError.Create(SMyZamPohlavieNotValid);
end;

procedure TDMZ.DS_DETIDataChange(Sender: TObject; Field: TField);
begin with DMZ do begin
  if TDET_.State in [dsInsert,dsEdit] then
  begin
    DS_DGRID.Enabled := False;
  end else
  begin
    DS_DGRID.Enabled := True;
  end;
end;end;

procedure TDMZ.TDET_NewRecord(DataSet: TDataSet);
begin
  TDET_Code_emp.Value := TZAM_Code_emp.Value;
  TDET_MES_OD.Value := DM.AktMesiac;
  TDET_MES_DO.Value := 12;
  TDET_ZTP.Value:= False;
  TDET_DAN_BONUS.Value:= False;
  {NC,PD a ZNIZ_POISTNE boli platne len do roku 2004}
  TDET_NC.Value := False;
  TDET_PD.Value := False;
  TDET_ZNIZ_POISTNE.Value := False;
end;

procedure TDMZ.TDET_CalcFields(DataSet: TDataSet);
var P1,P2:double;
begin with DM do begin
  TDET_CALC_MP.Value :=
    TDET_Meno.Value + ' ' + TDET_Priezvisko.Value;

  TDET_DAT_NAR.DisplayFormat:='yyyymm';
  TDET_CALC_VEK.Value := DIETA_VEK(TDET_DAT_NAR.DisplayText);
  TDET_DAT_NAR.DisplayFormat:='';
  TDET_CALC_POTREBA.Value := DIETA_POTREBA(TDET_CALC_VEK.Value,P1,P2);
  TDET_CALC_PRIDAVKY1.Value := P1;
  TDET_CALC_PRIDAVKY2.Value := P2;
end;end;

procedure TDMZ.Predcislo_Validate(Sender: TField);
begin
  Kontrola_predcisla(Sender.Text);
end;

procedure TDMZ.Abo_Validate(Sender: TField);
begin
  Kontrola_abo(Sender.Text);
end;

procedure TDMZ.TZAM_NewRecord(DataSet: TDataSet);
begin
  TZAM_Code_emp.Value := MAX_CODE_EMP + 1;
  TZAM_Pohlavie.Value:='M';
  TZAM_Rod_stav.Value:='1';
  TZAM_Stat_obcan.Value:='703'; {Slovensko}
  TZAM_Stat_tp.Value:='703'; {Slovensko}
  TZAM_TYPZEC.Value:=1;  {zamestnanec}
  TZAM_Narodnost.Value:='Slovenská';
  TZAM_ZPS.Value:=False;
  TZAM_ZTP.Value:=False;
  TZAM_Miera_poklesu.Value:=0;
  TZAM_VYHL.Value:=True;
  TZAM_RZP.Value:=False;
  TZAM_DAN_ZRAZKOU.Value:=False;
  TZAM_F_DOBA.Value:=DM.TINF_F_Doba.Value;
  TZAM_Fixny_mv_plat.Value:=False;
  TZAM_Fz_hlavne.Value:=True;
  TZAM_U_sviatky.Value:=False;
  TZAM_Dan_nerezident.Value:=False;
  TZAM_PN_DENNE.Value:=0;
  TZAM_VYNIMKA_VZ.Value:='0';
  TZAM_U_SDS.Value:=0;
  TZAM_Statutar_Od_50_percent.Value:=false;
  TZAM_Par7ods2.Value:=false;
  if not DM.AktVelkyZavod then TZAM_SID.Value := 1;
  if DM.AktSid<>0 then TZAM_SID.Value := DM.AktSid;
end;

procedure TDMZ.CisloValidate(Sender: TField);
begin
  if Sender.Text='' then exit;
  StrToDouble(Sender.Text);
end;

procedure TDMZ.TZAM_Code_numbValidate(Sender: TField);
begin
  if NOT (TZAM_.State in [dsInsert,dsEdit]) then exit;
  if QZAM_.Active then QZAM_.Close;
  QZAM_.ParamByName('P1').Value:=Sender.Value;
  QZAM_.Open;
  if QZAM_Pocet.Value>0 then
    raise EAlreadyExist.Create(Format(SMyZamUzExistuje,[TZAM_Code_numb.AsString]));
  QZAM_.Close;
end;

function TDMZ.DIETA_VEK(const datnar_yyyymm:string):string;
var Pom,Vek:Longint;
begin
  try
  Pom:=StrToInt(datnar_yyyymm);
  Vek:=DM.AktObdobie-Pom;
  if Vek<0 then begin Result:=''; exit; end;
  Vek:=Vek div 100;
  if (Vek>=0) and (Vek<100)
   then Result := IntToStr(Vek)
    else Result:= '';
  except
    Result:= '';
  end;
end;

function TDMZ.DIETA_POTREBA(const vek:string; var P1,P2:double):double;
var Zaklad:double;
begin with DM do begin
  if vek='' then begin Result:=0; exit; end;
  Zaklad := 0;
  try
  if DM.AktObdobie < Zakon_2003_01 then
    Zaklad := 0
  else
    Zaklad := VratHodnotu('PRIDAV_NA_DIETA');
  QCIS3a_.Close;
  QCIS3a_.ParamByName('P1').Value := StrToInt(vek);
  QCIS3a_.Open;
  Result:= QCIS3a_POTREBA.Value;
  P1:= Zaklad + QCIS3a_PRIDAVKY1.Value;
  P2:= Zaklad + QCIS3a_PRIDAVKY2.Value;
  QCIS3a_.Close;
    except on E:Exception do begin
    Result:=0; P1:=Zaklad; P2:=Zaklad;
  end;
  end;
end;end;

procedure TDMZ.SET_FILTER(const s: string);
begin
  if (TZAM_.Filter<>s) or (TZAM_.Filtered=False) then
  begin
    TZAM_.Filtered:=False;
    TZAM_.Filter:=s;
    TZAM_.FilterOptions := [foCaseInsensitive];
    TZAM_.Filtered:=True;
  end;
end;

function TDMZ.GET_FILTER(const s: char;iDoplnok: string):string;
var MojDoplnok,VYSL_FILTER:string;
begin with DM do begin
  MojDoplnok := PRIEZVISKO_FILTER;
  if iDoplnok<>'' then MojDoplnok:=' and '+iDoplnok else MojDoplnok:='';
  case s of
  'S': VYSL_FILTER :=
              '(Vystup=null or Vystup>='''+DateToStr(EncodeDate(AktRok,AktMesiac,1))+''')'
               +MojDoplnok;
  'R': VYSL_FILTER :=
              '(Vystup=null or Vystup>='''+DateToStr(EncodeDate(AktRok,1,1))+''')'
               +MojDoplnok;
  'V': VYSL_FILTER :=
              '(Vystup<>null and Vystup<'''+DateToStr(EncodeDate(AktRok,AktMesiac,1))+''') and '
               +'Nastup<='''+DateToStr(LastDayDate(AktRok,AktMesiac,31))+CHAR(39)+MojDoplnok;

  'A': VYSL_FILTER := iDoplnok;
  else VYSL_FILTER := '';
  end;
  if PRIEZVISKO_FILTER<>'' then begin
    if VYSL_FILTER <> ''
      then VYSL_FILTER := VYSL_FILTER +' and '+PRIEZVISKO_FILTER
        else VYSL_FILTER := PRIEZVISKO_FILTER;
  end;
  GET_FILTER := VYSL_FILTER;
end;end;


procedure TDMZ.SAVE_FILTER;
begin
  OLD_FILTER := TZAM_.Filter;
end;

procedure TDMZ.RESTORE_FILTER;
begin
  if TZAM_.Filter <> OLD_FILTER then TZAM_.Filter := OLD_FILTER;
end;

procedure TDMZ.TZAM_BeforePost(DataSet: TDataSet);
  var s,s1,s2:string;
begin
  {--Naplnenie spojenej ulice pre TRVALY POBYT--}
  if (TZAM_Tp_ulica.Value<>'') and (TZAM_Tp_ocislo.Value<>'') and (TZAM_Tp_supcislo.AsString<>'')  then
    TZAM_Tp_street.Value := TZAM_Tp_ulica.Value + ' ' + TZAM_Tp_supcislo.AsString + '/' + TZAM_Tp_ocislo.Value
  else if (TZAM_Tp_ulica.Value<>'') and (TZAM_Tp_ocislo.Value<>'') and (TZAM_Tp_supcislo.AsString='') then
    TZAM_Tp_street.Value := TZAM_Tp_ulica.Value + ' ' + TZAM_Tp_ocislo.Value
  else if (TZAM_Tp_ulica.Value<>'') and (TZAM_Tp_ocislo.Value='') and (TZAM_Tp_supcislo.AsString<>'')  then
    TZAM_Tp_street.Value := TZAM_Tp_supcislo.AsString
  else if (TZAM_Tp_ulica.Value<>'') and (TZAM_Tp_ocislo.Value='') and (TZAM_Tp_supcislo.AsString='')  then
    TZAM_Tp_street.Value := TZAM_Tp_ulica.AsString
  else
    TZAM_Tp_street.Value := TZAM_Tp_supcislo.AsString;
  {--Naplnenie spojenej ulice pre KORESPONDENCNU ADRESU--}
  if (TZAM_Pp_ulica.Value<>'') and (TZAM_Pp_ocislo.Value<>'') and (TZAM_Pp_supcislo.AsString<>'')  then
    TZAM_Pp_street.Value := TZAM_Pp_ulica.Value + ' ' + TZAM_Pp_supcislo.AsString + '/' + TZAM_Pp_ocislo.Value
  else if (TZAM_Pp_ulica.Value<>'') and (TZAM_Pp_ocislo.Value<>'') and (TZAM_Pp_supcislo.AsString='') then
    TZAM_Pp_street.Value := TZAM_Pp_ulica.Value + ' ' + TZAM_Pp_ocislo.Value
  else if (TZAM_Pp_ulica.Value<>'') and (TZAM_Pp_ocislo.Value='') and (TZAM_Pp_supcislo.AsString<>'')  then
    TZAM_Pp_street.Value := TZAM_Pp_supcislo.AsString
  else if (TZAM_Pp_ulica.Value<>'') and (TZAM_Pp_ocislo.Value='') and (TZAM_Pp_supcislo.AsString='')  then
    TZAM_Pp_street.Value := TZAM_Pp_ulica.AsString
  else
    TZAM_Pp_street.Value := TZAM_Pp_supcislo.AsString;
(*
  {--kontrola rodneho cisla--}
  if (TZAM_.State in [dsInsert]) and (TZAM_Born_numb.Value<>'') then
  begin
    s1:=TZAM_Born_numb.Value;
    s2:=s1;
    while Pos('/',s2) > 0 do Delete(s2,Pos('/',s2),1);
    s:=Format('select code_numb,surname,name from ":pam98_data:zam" z where z.born_numb=''%s'' or z.born_numb=''%s''',[s1,s2]);
    DMSQL.ExecuteSql(s);
    if DMSQL.Results[1]<>'' then
      if not MyOtazka(Format(SMyZamRcUzExistuje,[s1,DMSQL.Results[1],DMSQL.Results[2]+' '+DMSQL.Results[3]]))
        then Abort;
  end;
  {--koniec kontroly}
*)
  if (TZAM_U_zdrav.Value > 0) and (TZAM_KZP.Value=0) then
  begin
    FormMain.NX_ZAM.ActivePage:=FormMain.PAGE_UDAJE;
    FormMain.NY_ZAM.ActivePage:=FormMain.PAGE_OSOBNE;
    if FormMain.DBLookupComboBox2.CanFocus then FormMain.DBLookupComboBox2.SetFocus;
    raise EMyError.Create(SMyZamKZPMusiBytVyplneny);
  end;
  if (NVL(TZAM_MV_plat.AsString)<>'0') and
     (NVL(TZAM_V_sadzba.AsString)<>'0')
  then begin
    FormMain.NX_ZAM.ActivePage:=FormMain.PAGE_UDAJE;
    FormMain.NY_ZAM.ActivePage:=FormMain.PAGE_PRACOVNE;
    TZAM_MV_plat.FocusControl;
    raise EMyError.Create(SMyZamNemozeMatObidve);
  end;
  {--Kontrola statutara a garancneho poistenia}

  if (TZAM_Statutar_Od_50_percent.Value) and (TZAM_U_garancne.Value=1)
     and (DM.AktObdobie >= ZAKON_2014_01) then
  begin
    if FormMain.DBE_U_Garancne.CanFocus then FormMain.DBE_U_Garancne.SetFocus;
    raise EMyError.Create(SMyAppStatutarNeplatiGarancneOd_01jan2014);
  end;
end;

procedure TDMZ.TZAM_SIDValidate(Sender: TField);
var Nazov:string;
begin
  if not DM.ExistujeStredisko(Sender.Value,Nazov) then begin
    MyError(SMyZamSidNotFound);
    Abort;
  end;
end;

procedure TDMZ.TZAM_Fz_uvazokValidate(Sender: TField);
begin
  if not (StrToChar(Sender.AsString) in [' ','0','1','2','3']) then
  raise EMyError.Create(SMyZamFzUvazokNotValid);
end;

procedure TDMZ.TZAM_Fz_typzamValidate(Sender: TField);
begin
  if not (StrToChar(Sender.AsString) in [' ','O','Z','D']) then
  raise EMyError.Create(SMyZamFzTypZamNotValid);
end;

function TDMZ.NEZD_CIASTKA_NA_DETI:double;
var pocd1,pocd2,maxd:integer;suma1,suma2:double;
begin with DM do begin
  try
  maxd:=VratHodnotuInt('NEZD_DIETA_MAXP');
  suma1:=VratHodnotu('NEZD_DIETA');
  suma2:=VratHodnotu('NEZD_DIETA_ZTP');
  QDET_.Close;
  QDET_.ParamByName('P1').AsInteger := TZAM_Code_emp.Value;
  QDET_.Open;
  pocd1:=QDET_Pocet.Value;
  pocd2:=QDET_Pocet1.Value;
  if pocd1>maxd then pocd1:=maxd;
  if pocd2>maxd then pocd2:=maxd;
  if pocd1+pocd2>maxd then pocd1:=maxd-pocd2;
  Result:=(pocd1*suma1)+(pocd2*suma2);
  except Result:=0; end;
end;end;

procedure TDMZ.POCTY_DETI(var oPoist,oBonus,oPridavky:integer);
begin with DM do begin
  try
  oPoist :=0;
  oBonus :=0;
  oPridavky :=0;
  QDET2_.Close;
  QDET2_.ParamByName('P1').AsInteger := TZAM_Code_emp.Value;
  QDET2_.Open;
  oPoist    :=QDET2_Pocet1.Value;
  oBonus    :=QDET2_Pocet2.Value;
  oPridavky :=QDET2_Pocet3.Value;
  except end;
end;end;

procedure TDMZ.DS_ZRZDataChange(Sender: TObject; Field: TField);
begin with DMZ do begin
  if TZRZ_.State in [dsInsert,dsEdit] then
  begin
    DS_ZRZG.Enabled := False;
  end else
  begin
    DS_ZRZG.Enabled := True;
  end;
end;end;

procedure TDMZ.TZRZ_NewRecord(DataSet: TDataSet);
begin
  TZRZ_Code_emp.Value := TZAM_Code_emp.Value;
  TZRZ_Suma.Value := 0;
  TZRZ_Typ_Sumy.Value := 0;
end;

procedure TDMZ.TZRZ_BeforePost(DataSet: TDataSet);
var YY,MM,DD:word;
begin
  DecodeDate(TZRZ_Datum_od.Value,YY,MM,DD);
  TZRZ_Obdobie_od.Value:=YY*100+MM;
  if TZRZ_Datum_do.AsString='' then TZRZ_Obdobie_do.Value:=999999
  else begin
    DecodeDate(TZRZ_Datum_do.Value,YY,MM,DD);
    TZRZ_Obdobie_do.Value:=YY*100+MM;
  end;  
end;

procedure TDMZ.TZRZ_TypValidate(Sender: TField);
begin
  if not (StrToChar(Sender.AsString) in ['P','O','Y','X','S']) then
  raise EMyError.Create(SMyZamTypZrazkyNotValid);
end;

procedure TDMZ.TNEP_NewRecord(DataSet: TDataSet);
begin with Main.FormMain do begin
  TNEP_Code_emp.Value := TZAM_Code_emp.Value;
  TNEP_Typ.Value := 0;
  if PC_NEP.ActivePage = TAB_NEP_SP_PRIHLASKA       then TNEP_TypRl.Value := 'PA'
  else if PC_NEP.ActivePage = TAB_NEP_SP_ODHLASKA   then TNEP_TypRl.Value := 'OD'
  else if PC_NEP.ActivePage = TAB_NEP_SP_PRERUSENIE then TNEP_TypRl.Value := 'PE'
  else if PC_NEP.ActivePage = TAB_NEP_SP_ZMENA      then TNEP_TypRl.Value := 'ZM'
  else if PC_NEP.ActivePage = TAB_NEP_SP_ZRUSENIE   then TNEP_TypRl.Value := 'ZP'
  else if PC_NEP.ActivePage = TAB_NEP_INE           then TNEP_TypRl.Value := '00'
  else if PC_NEP.ActivePage = TAB_NEP_PN            then begin TNEP_TypRl.Value := '10'; TNEP_Typ.Value:=1; end
  else if PC_NEP.ActivePage = TAB_NEP_OCR           then begin TNEP_TypRl.Value := '11'; TNEP_Typ.Value:=2; end;
  TNEP_Zmena1.Value := true;
  TNEP_Zmena2.Value := true;
  TNEP_Zmena3.Value := true;
  TNEP_Zmena4.Value := true;
  TNEP_Typzec.Value := TZAM_Typzec.Value;
end;end;

procedure TDMZ.TNEP_BeforePost(DataSet: TDataSet);
var YY1,MM1,DD1,YY2,MM2,DD2:word;Obd1,Obd2:longint;
begin
  {
  Hodnoty položky TypRL2
  1 obdobie
  2 vznik (zaèiatok)
  3 zánik (ukonèenie)

  Hodnoty položky TypRL
  00	Neuvedený
  10    PN
  11    OÈR
  OD	SP-odhláška
  PA	SP-prihláška
  PE	SP-prerušenie
  ZM	SP-zmena
  ZP	SP-zrušenie prihlášky
  MD    SP-materská dovolenka
  RD    SP-rodièovská dovolenka
  }
(*
  if TNEP_TypRL.Value = 'OD' then TNEP_TYPRL2.Value := 1
  else if TNEP_TypRL.Value = 'PA' then TNEP_TYPRL2.Value := 2
  else if TNEP_TypRL.Value = 'ZM' then TNEP_TYPRL2.Value := 2
  else if TNEP_TypRL.Value <> 'PE' then TNEP_TYPRL2.Value := 1;
*)
(*
  if TNEP_TYPRL2.AsString=''
     then raise EMyError.Create(Format(SMyAppItemIsRequired,[TNEP_TypRL2.DisplayLabel]));
*)
     {--kontroly--}
(*
  if TNEP_TYPRL2.Value=2 then TNEP_DATUM_DO.Value:=TNEP_DATUM_OD.Value;
  if TNEP_TYPRL2.Value=3 then TNEP_DATUM_OD.Value:=TNEP_DATUM_DO.Value;
*)
  if (TNEP_Prerusenie.AsString='') and (TNEP_TypRL.Value='PE') (*and (TNEP_TypRL2.AsInteger IN [1,2]) *)
     then raise EMyError.Create(SMyAppDovodPreruseniaMusiBytVyplneny);
{--dodatocne kontroly---}
  if (TNEP_Datum_od.AsString<>'') and (TNEP_Datum_do.AsString<>'') then
  begin
    if TNEP_Datum_od.Value < TNEP_Datum_od.Value then
    raise EMyError.Create(SMyAppNesuhlasDatumovehoIntervalu);
(*
    DecodeDate(TNEP_Datum_od.Value,YY1,MM1,DD1);
    DecodeDate(TNEP_Datum_do.Value,YY2,MM2,DD2);
    Obd1:=YY1*100+MM1;
    Obd2:=YY2*100+MM2;
    if (MyRok(Obd1)<>DM.AktRok) and (TNEP_TypRL.Value<>'OD') then
      raise EMyError.Create(SMyZamNepMusiZacinatVAktRoku);
    if MyRok(Obd2)<>DM.AktRok then
      raise EMyError.Create(SMyZamNepMusiKoncitVAktRoku);
*)
  end;
  if (TNEP_TypRL.Value = 'OD') and (TNEP_Typzec.Value = 2) and (DateToRRRRMMDD(TNEP_Datum_do.Value)>20121231) then
   raise EMyError.Create(SMyNepDatZanikuPoistMusiBytDoKoncaRoka2012);
  if (TNEP_TypRL.Value = 'OD') and (TNEP_Typzec.Value in [1,2,3]) and (TNEP_Datum_od.AsString='') then
   raise EMyError.Create(SMyNepNevyplnenyUdajDatumVznikuPoistenia);
  if (TNEP_TypRL.Value = 'OD') and (TNEP_Datum_do.AsString='') then
   raise EMyError.Create(SMyNepNevyplnenyUdajDatumZanikuPoistenia);
  if (TNEP_TypRL.Value = 'OD') and (TNEP_Typzec.Value = 1) and (not(TNEP_TypPracPomeru.Value in [1,2])) then
   raise EMyError.Create(SMyNepNespravnaHodnotaPrePracovnyPomer);

end;

function TDMZ.MAX_CODE_EMP:longint;
var MAX1,MAX2:longint;
begin
  if QCODE1_.Active then QCODE1_.Close;
  QCODE1_.Open;
  if QCODE1_.RecordCount=1 then
   MAX1:=QCODE1_MAX_CODE_EMP.Value
  else
   MAX1:=0;
  QCODE1_.Close;
  {--}
  if QCODE2_.Active then QCODE2_.Close;
  QCODE2_.Open;
  if QCODE2_.RecordCount=1 then
   MAX2:=QCODE2_MAX_CODE_EMP.Value
  else
   MAX2:=0;
  QCODE2_.Close;
  {--}
  if MAX2>MAX1 Then Result:=MAX2 Else Result:=MAX1;
end;

procedure TDMZ.TZAM_U_PoistenieValidate(Sender: TField);
begin
 if not (Sender.AsInteger in SetOf_PoistenieValid) then
   raise EMyError.Create(SMyAppInvalidValue+' '+SMyAppHintPoistenie);
end;

procedure TDMZ.TZAM_U_Poistenie2Validate(Sender: TField);
begin
 if not (Sender.AsInteger in SetOf_Poistenie2Valid) then
   raise EMyError.Create(SMyAppInvalidValue+' '+SMyAppHintPoistenie2);
end;

procedure TDMZ.TZAM_ZTPValidate(Sender: TField);
begin
 if (Sender.Value=True) AND (TZAM_ZPS.Value=False) then
      raise EMyError.Create(SMyZamNemozeBytZtpBezZps);
end;


procedure TDMZ.DS_ZAMFDataChange(Sender: TObject; Field: TField);
begin
  FormMain.UpdatePanelHotova;
  if APP_VYPLATY then
    FormMainVyp.UpdatePanelHotova;
end;

procedure TDMZ.TNEP_CalcFields(DataSet: TDataSet);
var FF:string;
begin
  try
  FF:=TZAM_.Filter;
  if TNEP_Code_emp.Value <> TZAM_Code_emp.Value then
  begin
    TZAM_.Filter:='code_emp='+TNEP_Code_emp.AsString;
  end;
  TNEP_L_ZAM.Value := TZAM_PMT2.Value;
  if FF<>TZAM_.Filter then TZAM_.Filter:=FF;
  except
  if FF<>TZAM_.Filter then TZAM_.Filter:=FF;
  raise;
  end;
  if (TNEP_Datum_od.AsString <> '') AND (TNEP_Datum_do.AsString <> '')
  then
    TNEP_Calc_Kal_Dni.Value :=
      Trunc(TNEP_Datum_do.Value - TNEP_Datum_od.Value)+1
  else
    TNEP_Calc_Kal_Dni.Value := 0;

  TNEP_Calc_Typ_Nep.Value := TEXT_TYP_NEPRITOMNOSTI(TNEP_Typ.Value);
end;

procedure TDMZ.DS_NEPDataChange(Sender: TObject; Field: TField);
begin with DMZ do begin

  if TNEP_.State in [dsInsert,dsEdit] then
  begin
    DS_NEPG.Enabled := False;
  end else
  begin
    DS_NEPG.Enabled := True;
  end;
end;end;

procedure TDMZ.TDET_BeforePost(DataSet: TDataSet);
begin
  if TDET_MES_OD.AsString<>'' then
    if TDET_MES_DO.AsString='' then
      raise EMyError.Create(SMyDetMesDoExpected);
  if TDET_MES_DO.AsString<>'' then
    if TDET_MES_OD.AsString='' then
      raise EMyError.Create(SMyDetMesOdExpected);
end;

function  TDMZ.EXISTUJE_ZAM(xCode_numb:integer):boolean;
begin
  TZAM_.First;
  TZAM_.SetRange([xCode_Numb,0],[xCode_Numb+1,0]);
  TZAM_.ApplyRange;
  Result := TZAM_Code_numb.AsString=IntToStr(xCode_numb);
  TZAM_.CancelRange;
end;

function  TDMZ.EXISTUJE_ZAM_ANK(xCode_numb:longint;xDohodaId:longint):boolean;
{Cislo dohody je ulozene ako cislo pasu}
  var s,doh:string; found:boolean;
begin
(*
  s:= 'select count(xxxx) from ":pam98_data:zam" where code_numb='''+IntToStr(xCode_numb)+''' and c_pasu='''+LongToStr(xDohodaId)+'''';
  DMSQL.ExecuteSql(s);
  Result := (StrToInt(DMSQL.Results[1])<>0);
*)
  found := false;
  doh := IntToStr(xDohodaid);
  TZAM_.SetRange([xCode_Numb,0],[xCode_Numb+1,0]);
  TZAM_.ApplyRange;
  TZAM_.First;
  while not TZAM_.EOF do begin
    if TZAM_C_pasu.Value = doh then begin
      found := true;
      break;
    end;
    TZAM_.Next;
  end;
  Result := found;
  TZAM_.CancelRange;
end;

procedure TDMZ.TZAM_Pd_osobyGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender.AsString='255' then Text:='1' else Text:='0';
end;

procedure TDMZ.TZAM_Pd_osobySetText(Sender: TField; const Text: String);
begin
  if Text='1' then Sender.Value:=255 else Sender.Value:=0;
end;

procedure TDMZ.Akcia_prerusenie_validate(Sender: TField);
begin
 if (Sender.AsString<>'') and (TNEP_TypRL.Value<>'PE')
   then raise EMyError.Create(SMyAppDovodPreruseniaNemaBytVyplneny);
end;

procedure TDMZ.TNEP_TypRLValidate(Sender: TField);
begin
(*
 if Sender.Value = 'PA' then begin
   TNEP_Datum_od.Value:=TZAM_Nastup.Value;
   TNEP_Datum_do.Value:=TZAM_Nastup.Value;
 end else
 if Sender.Value = 'OD' then begin
   if TZAM_Vystup.AsString = '' then
     raise EMyError.Create(SMyZamNemaUkoncenyPomer);
   TNEP_Datum_od.Value:=TZAM_Nastup.Value;
   TNEP_Datum_do.Value:=TZAM_Vystup.Value;
 end;
*)
end;

procedure TDMZ.TDOCH_Datum_doValidate(Sender: TField);
begin
  if Sender.Value<TDOCH_Datum_od.Value then
     raise EMyError.Create(SMyAppNesuhlasDatumovehoIntervalu);
end;

procedure TDMZ.TZAM_AfterScroll(DataSet: TDataSet);
begin
 if TNEP_.MasterSource=DS_ZAM1 then begin
   TNEP_.Last;
   TDOCH_.Last;
 end;
end;

procedure TDMZ.TELDP_BeforePost(DataSet: TDataSet);
begin
  if TELDP_Datum_od.Value > TELDP_Datum_do.Value then
     raise EMyError.Create(SMyAppNesuhlasDatumovehoIntervalu);
end;

procedure TDMZ.TZAM_Born_numbValidate(Sender: TField);
begin
  RC_Validate(Sender.Value);
end;

procedure TDMZ.TZP1_NewRecord(DataSet: TDataSet);
var rok:integer;
begin
  rok := DM.AktRok;
  if rok < MyRok(ZAKON_2006_01) then
    raise EMyError.Create(SMyAppRocneZuctZpAzOdRoku2006);
  TZP1_Code_emp.Value := TZAM_Code_emp.Value;
  TZP1_V_rok.Value := rok;
  TZP1_rok.Value := rok-1;
  TZP1_kzp.Value := TZAM_KZP.Value;
end;

procedure TDMZ.TZP2_NewRecord(DataSet: TDataSet);
begin
  TZP2_Code_emp.Value := TZAM_Code_emp.Value;
end;

procedure TDMZ.TZP1_BeforePost(DataSet: TDataSet);
begin
 if TZP1_Zamnec_od.Value > TZP1_Zamnec_do.Value
  then raise EMyError.Create(SMyAppNesuhlasDatumovehoIntervalu);
 if (TZP1_Zamnec_od.AsString<>'') and
    (FormatDateTime('yyyy',TZP1_Zamnec_od.Value)<>TZP1_ROK.AsString)
  then raise EMyError.Create(Format(SMyAppRocneZuctZlyRok,[TZP1_Zamnec_od.DisplayLabel]));
 if (TZP1_Zamnec_do.AsString<>'') and
    (FormatDateTime('yyyy',TZP1_Zamnec_do.Value)<>TZP1_ROK.AsString)
  then raise EMyError.Create(Format(SMyAppRocneZuctZlyRok,[TZP1_Zamnec_do.DisplayLabel]));
end;

procedure TDMZ.TZP2_BeforePost(DataSet: TDataSet);
begin
 if TZP2_Datum_od.Value > TZP2_Datum_do.Value then
     raise EMyError.Create(SMyAppNesuhlasDatumovehoIntervalu);
end;

procedure TDMZ.TZP1_BeforeInsert(DataSet: TDataSet);
begin
  if (TZP1_Code_emp.Value = TZAM_Code_emp.Value) and
     (TZP1_V_rok.Value = DM.AktRok)
  then Abort;
end;

procedure TDMZ.ZDR_VYPOCET_DOKLADU;
var i,v_fmes,v_pn,v_mesiac:integer;s:string;f_doba,oz_zdravot,o_zdravot,min_vz,min_vz_cast,x1,x2:double;DS:char;
    pom_obdobie:longint;YY,MM,DD:word;KAL_DNI:integer;
begin
  case DM.AktRok of
  2005: min_vz := 6500;
  2006: min_vz := 6900;
  2007: min_vz := 7600;
  2008: min_vz := 8100;
  2009: min_vz := 8100;
  2010: min_vz := 295.50;
  else  min_vz:= 0;
  end;
  if not MyOtazka(SMyZdrVypPodkladovPreDoklad) then exit;
  try
  s:=Format('delete from ":pam98_data:zp_tab" where code_emp=%d and v_rok=%d and typ=1',[TZAM_Code_emp.Value,DM.AktRok-1]);
  DMSQL.ExecuteSql(s);
  for i:=1 to 12 do begin
    s:=Format('insert into ":pam98_data:zp_tab" (code_emp,v_rok,v_mesiac,typ,X1,X2,X3,X4,X5) values (%d,%d,%d,1,0,0,0,0,0);',[TZAM_Code_emp.Value,DM.AktRok-1,i]);
    DMSQL.ExecuteSql(s);
  end;
  s:=Format('select v_mesiac,n_prijem_zp,f_zdravot,o_zdravot,oz_zdravot,f_doba,v_fmes,v_nahrada_pn1+v_nahrada_pn2 from ":pam98_datx:vyp" v where v.v_rok=%d and v.code_emp=%d;',[DM.AktRok-1,TZAM_Code_emp.Value]);
  DMSQL.ExecuteSql(s);
  if DMSQL.Akt_rows > 0 then begin
    try
    for i:=1 to DMSQL.Akt_Rows do begin
        v_mesiac:=StrToInt(DMSQL.Hodnoty[i,1]);
        f_doba:=StrToFloat(DMSQL.Hodnoty[i,6]);
        x1:=StrToFloat(DMSQL.Hodnoty[i,2]);
        x2:=StrToFloat(DMSQL.Hodnoty[i,3]);
        v_pn:=StrToInt(DMSQL.Hodnoty[i,8]);
        if f_doba>8 then f_doba:=8;
        o_zdravot:=StrToFloat(DMSQL.Hodnoty[i,4]);
        pom_obdobie := (DM.AktRok-1)*100 + v_mesiac;
        KAL_DNI := MyConsts.KAL_DNI(pom_obdobie);
        v_fmes :=  KAL_DNI - v_pn;
        if TZAM_Nastup.AsString<>'' then begin
           DecodeDate(TZAM_Nastup.Value,YY,MM,DD);
          if YY*100+MM = pom_obdobie then Dec(v_fmes,DD-1);
        end;
        if TZAM_Vystup.AsString<>'' then begin
          DecodeDate(TZAM_Vystup.Value,YY,MM,DD);
         if YY*100+MM = pom_obdobie then Dec(v_fmes,KAL_DNI-DD);
        end;
        if v_fmes<0 then v_fmes := 0;
        if DM.AktRok < 2010 then begin
           oz_zdravot:=Round(StrToFloat(DMSQL.Hodnoty[i,5]));
           min_vz_cast := ZAOKRUHLI(min_vz*v_fmes/KAL_DNI*f_doba/8,0,0);
        end else
        if DM.AktRok >= 2010 then begin
          oz_zdravot:=StrToFloat(DMSQL.Hodnoty[i,5]);
          min_vz_cast := ZAOKRUHLI(min_vz*v_fmes/KAL_DNI*f_doba/8,-2,0);
        end;
        DS:=DecimalSeparator;
        try
        DecimalSeparator:='.';
        s:=Format('update ":pam98_data:zp_tab" set X1="%0.2f",X2="%0.2f",X3="%0.2f",X4="%0.2f",X5="%0.2f" where code_emp=%d and v_rok=%d and v_mesiac=%s and typ=1',
          [x1,x2,min_vz_cast,o_zdravot,oz_zdravot,TZAM_Code_emp.Value,DM.AktRok-1,DMSQL.Hodnoty[i,1]]);
        finally
        DecimalSeparator:=DS;
        end;
        DMSQL2.ExecuteSql(s);
    end;
    finally
    end;
  end;
  finally
  TZP4_.Refresh;
  end;
  MyMessage(SMyZdrVypPodkladovPreDokladHotovo);
end;


procedure TDMZ.TZP4_BeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure TDMZ.TZP2_BeforeDelete(DataSet: TDataSet);
begin
  if MyOtazka(SMyCisDeleteQuestion) then exit;
  raise EMyError.Create(SMyCisDeleteStopped);
end;

procedure TDMZ.TZP1_BeforeDelete(DataSet: TDataSet);
begin
  if MyOtazka(SMyCisDeleteQuestion) then exit;
  raise EMyError.Create(SMyCisDeleteStopped);
end;


procedure TDMZ.TZP3_NewRecord(DataSet: TDataSet);
var s:string;
begin
if REZIM_ZP3='PAGE_ZP' then
begin
  TZP3_Code_emp.Value := TZAM_Code_emp.Value;
  TZP3_V_rok.Value := DM.AktRok;
  TZP3_Rok.Value := DM.AktRok - 1;
  TZP3_Typ.Value := 'VV';
  TZP3_A1.Value := '1';
end else
if REZIM_ZP3='PAGE_DAVKA601' then
begin
end
end;

procedure TDMZ.TZP3_BeforePost(DataSet: TDataSet);
begin
  if TZP3_TYP.Value = 'VV' then
  begin
    if TZP3_A1.Value <> '3' then TZP3_A2.Value := '';
  end;
end;

procedure TDMZ.TZP5_NewRecord(DataSet: TDataSet);
begin
  TZP5_Code_emp.Value := TZAM_Code_emp.Value;
  TZP5_Datum_zmeny.Value := Now;
  TZP5_KZP.AsString := LPAD(TZAM_KZP.AsString,2,'0');
end;

procedure TDMZ.TZP5_BeforePost(DataSet: TDataSet);
begin
  TZP5_Code_emp.Value := TZAM_Code_emp.Value;
  TZP5_Platnost_Zmeny.Value := Uppercase(TZP5_Platnost_Zmeny.Value);
  TZP5_V_rok.AsString := FormatDateTime('yyyy',TZP5_Datum_zmeny.Value);
  TZP5_V_mesiac.AsString := FormatDateTime('m',TZP5_Datum_zmeny.Value);
  if StrToInt(FormatDateTime('yyyy',TZP5_Datum_zmeny.Value))<>DM.AktRok then
    raise EMyError.Create(SMyZamDatumMusiZacinatVAktRoku);
end;

procedure TDMZ.TZP5_Kod_zmenyValidate(Sender: TField);
begin
  if (Length(Sender.Value)=1) and (Sender.Value<>'2') then
    raise EMyError.Create(SMyAppInvalidValue)
  else if (Length(Sender.Value)=2) and ((Copy(Sender.Value,2,1)<'A') or (Copy(Sender.Value,2,1)>'U')) then
    raise EMyError.Create(SMyAppInvalidValue);
end;

procedure TDMZ.TNEP_BeforeDelete(DataSet: TDataSet);
begin
  if MyOtazka(SMyCisDeleteQuestion) then exit;
  raise EMyError.Create(SMyCisDeleteStopped);
end;



procedure TDMZ.TNEP_BeforeInsert(DataSet: TDataSet);
begin
  if MyOtazka(SMyAppUserWantInsert) then exit;
  raise EMyError.Create(SMyAppStopUserWantInsert);
end;


end.

