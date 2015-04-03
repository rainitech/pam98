unit Dm_main;

interface

{$INCLUDE DEFINE.INC}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB, ExtCtrls, DBCtrls, DBConsts,
  MyConsts,IniFiles, UnicodeUtils;

type
  TCBU = record
    CisloPlatitelaZP: string;
    PobockaZP: integer;
    ICO: string;
  end;
  TDM = class(TDataModule)
    TSET_: TTable;
    DS_SETUP: TDataSource;
    TDZP_: TTable;
    DS_DZP: TDataSource;
    DS_DZPG: TDataSource;
    TDZP_D_od: TCurrencyField;
    TDZP_D_sadzba: TFloatField;
    TDZP_D_sumaplus: TCurrencyField;
    TSYS_: TTable;
    TINF_: TTable;
    DS_INF: TDataSource;                   
    TXYZ_: TTable;
    TINF_CALC_SUBJ: TStringField;
    TINF_CALC_ADRESA: TStringField;
    TSET_JAN: TSmallintField;
    TSET_FEB: TSmallintField;
    TSET_MAR: TSmallintField;
    TSET_APR: TSmallintField;
    TSET_MAJ: TSmallintField;
    TSET_JUN: TSmallintField;
    TSET_JUL: TSmallintField;
    TSET_AUG: TSmallintField;
    TSET_SEP: TSmallintField;
    TSET_OKT: TSmallintField;
    TSET_NOV: TSmallintField;
    TSET_DEC: TSmallintField;
    TSET_F_PN_DNI: TSmallintField;
    TSET_F_PN1: TSmallintField;
    TSET_F_PN2: TSmallintField;
    TSET_F_OCR: TSmallintField;
    TSET_F_URAZ: TSmallintField;
    TSET_F_MIN_MZDA: TCurrencyField;
    TSET_F_NEMMAX: TCurrencyField;
    TSET_F_POISTMAX: TCurrencyField;
    TSET_F_ZDRAVOT: TFloatField;
    TSET_F_NEMOC: TFloatField;
    TSET_F_DOCHOD: TFloatField;
    TSET_F_FONDZ: TFloatField;
    TSET_FZ_ZDRAVOT: TFloatField;
    TSET_FZ_NEMOC: TFloatField;
    TSET_FZ_DOCHOD: TFloatField;
    TSET_FZ_FONDZ: TFloatField;
    TSET_F_ZDRAVOT1: TFloatField;
    TSET_F_NEMOC1: TFloatField;
    TSET_F_DOCHOD1: TFloatField;
    TSET_F_FONDZ1: TFloatField;
    TSET_FZ_ZDRAVOT1: TFloatField;
    TSET_FZ_NEMOC1: TFloatField;
    TSET_FZ_DOCHOD1: TFloatField;
    TSET_FZ_FONDZ1: TFloatField;
    TSET_F_ZAODVOD: TSmallintField;
    TSET_F_SMODVOD: TSmallintField;
    TSET_F_ZAFONDZ: TSmallintField;
    TSET_F_SMFONDZ: TSmallintField;
    TSET_F_ZADANZP: TSmallintField;
    TSET_F_SMDANZP: TSmallintField;
    TSET_F_DAN_SADZBA1: TFloatField;
    TSET_F_DAN_MAXIMUM1: TCurrencyField;
    TSET_F_MIN_POIST_SKODA: TCurrencyField;
    TXYZ_NAZOV: TStringField;
    DS_SYS: TDataSource;
    CIS1_: TTable;
    TSYS_CALC_SERIAL_NUM: TStringField;
    TINF_NAZOV: TStringField;
    TINF_ADR_ULICA: TStringField;
    TINF_ADR_MESTO: TStringField;
    TINF_ADR_PSC: TStringField;
    TINF_ICO: TStringField;
    TINF_OKEC: TStringField;
    TINF_PREDCISLO_U: TStringField;
    TINF_CISLO_U: TStringField;
    TINF_BANKA_U: TStringField;
    TINF_SSYM_U: TStringField;
    TINF_KSYM_U: TStringField;
    TINF_F_HOLIDAY: TSmallintField;
    TINF_F_NEMOCD: TSmallintField;
    TINF_F_ODSTUPM: TSmallintField;
    TINF_F_ODSTUP: TSmallintField;
    TINF_HOLKVART: TSmallintField;
    TINF_F_ND_POCITA: TSmallintField;
    TINF_F_DOBA: TFloatField;
    TINF_FZ_UCET: TStringField;
    TINF_FZ_VS: TStringField;
    TINF_FZ_DEN: TSmallintField;
    TINF_OUP_NAZOV: TStringField;
    TINF_OUP_ULICA: TStringField;
    TINF_OUP_MESTO: TStringField;
    TINF_OUP_PSC: TStringField;
    TINF_F_POISTNE: TFloatField;
    TINF_CALC_OBDOBIE: TStringField;
    TSYS_COMPANY_NAME: TStringField;
    TSYS_PRODUCT_NAME: TStringField;
    TSYS_REGISTERED: TBooleanField;
    TSYS_REG_KEY: TStringField;
    TSYS_VOLUME_SN: TStringField;
    TSYS_DUMMY_KEY: TStringField;
    TSYS_POCET_ZAM: TSmallintField;
    TSYS_POCET_FIRIEM: TSmallintField;
    TSYS_ADMIN: TStringField;
    TSYS_USER1: TStringField;
    TSYS_USER2: TStringField;
    TPRIV_: TTable;
    TPRIV_ROK: TSmallintField;
    TPRIV_MESIAC: TSmallintField;
    DS_PRIV: TDataSource;
    TSYS_CALC_VERZIA: TStringField;
    TPRIV_SID: TSmallintField;
    TPRIV_MIN_SID: TSmallintField;
    TPRIV_MAX_SID: TSmallintField;
    CIS2_: TTable;
    CIS2_ID: TSmallintField;
    CIS2_NAZOV: TStringField;
    CIS2_CALC_NAZOV: TStringField;
    CIS3_: TTable;
    CIS3_VEK_OD: TSmallintField;
    CIS3_POTREBA: TCurrencyField;
    CIS3_PRIDAVKY1: TCurrencyField;
    CIS3_PRIDAVKY2: TCurrencyField;
    CIS0_: TTable;
    QCIS3a_: TQuery;
    QCIS3a_vek_od: TSmallintField;
    QCIS3a_POTREBA: TCurrencyField;
    QCIS3a_PRIDAVKY1: TCurrencyField;
    QCIS3a_PRIDAVKY2: TCurrencyField;
    QCIS3b_: TQuery;
    SmallintField1: TSmallintField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    CurrencyField3: TCurrencyField;
    TSET_F_NEMMIN: TCurrencyField;
    TSET_F_ZAPREDDAV: TSmallintField;
    TSET_F_SMPREDDAV: TSmallintField;
    TSET_F_ZAZAKLPOIST: TSmallintField;
    TSET_F_SMZAKLPOIST: TSmallintField;
    TINF_F_TYP_PRIPL: TSmallintField;
    TINF_F_NADCAS: TFloatField;
    TINF_F_SOBOTA: TFloatField;
    TINF_F_NEDELA: TFloatField;
    TINF_F_SVIATOK: TFloatField;
    TINF_F_NOC: TFloatField;
    TINF_F_SKOD: TFloatField;
    TINF_F_TYP_PREMII: TSmallintField;
    TINF_CALC_TEXT_PREMII: TStringField;
    TINF_CALC_TYP_PRIPLATKOV: TStringField;
    CIS4_: TTable;
    CIS4_BUID_KOD: TSmallintField;
    CIS4_SSYM_U: TStringField;
    CIS4_KSYM: TStringField;
    CIS4_VSYM: TStringField;
    CIS4_SPP: TStringField;
    CIS4_CALC_INSTITUCIA: TStringField;
    CIS4_BANKA_U: TStringField;
    CIS4_PRIJEMCA: TStringField;
    TINF_F_FIRMA_ZPS: TBooleanField;
    TSET_ZAOKRUH1: TSmallintField;
    TSET_ZAOKRUH1SM: TSmallintField;
    TSET_ZAOKRUH2: TSmallintField;
    TSET_ZAOKRUH2SM: TSmallintField;
    TSET_ZAOKRUH3: TSmallintField;
    TSET_ZAOKRUH3SM: TSmallintField;
    TSET_ZAOKRUH4: TSmallintField;
    TSET_ZAOKRUH4SM: TSmallintField;
    TSET_ZAOKRUH5: TSmallintField;
    TSET_ZAOKRUH5SM: TSmallintField;
    TSET_ZAOKRUH6: TSmallintField;
    TSET_ZAOKRUH6SM: TSmallintField;
    TSET_ZAOKRUH7: TSmallintField;
    TSET_ZAOKRUH7SM: TSmallintField;
    TSET_ZAOKRUH8: TSmallintField;
    TSET_ZAOKRUH8SM: TSmallintField;
    TSET_ZAOKRUH9: TSmallintField;
    TSET_ZAOKRUH9SM: TSmallintField;
    CIS4_BUID_TYP: TStringField;
    CIS4_CISLO_U: TStringField;
    TINF_F_TYP_PRIPL2: TSmallintField;
    TINF_F_PRIPLAT1: TFloatField;
    TINF_F_PRIPLAT2: TFloatField;
    TINF_F_PRIPLAT3: TFloatField;
    TINF_F_PRIPLAT4: TFloatField;
    TINF_F_PRIPLAT1_TEXT: TStringField;
    TINF_F_PRIPLAT2_TEXT: TStringField;
    TINF_F_PRIPLAT3_TEXT: TStringField;
    TINF_F_PRIPLAT4_TEXT: TStringField;
    TINF_CALC_TYP_PRIPLATKOV2: TStringField;
    TINF_F_PRIPLAT5: TFloatField;
    TINF_F_PRIPLAT5_TEXT: TStringField;
    TSET_JAN1: TSmallintField;
    TSET_FEB1: TSmallintField;
    TSET_MAR1: TSmallintField;
    TSET_APR1: TSmallintField;
    TSET_MAJ1: TSmallintField;
    TSET_JUN1: TSmallintField;
    TSET_JUL1: TSmallintField;
    TSET_AUG1: TSmallintField;
    TSET_SEP1: TSmallintField;
    TSET_OKT1: TSmallintField;
    TSET_NOV1: TSmallintField;
    TSET_DEC1: TSmallintField;
    TSET_U_ZDRAV1: TSmallintField;
    TSET_U_ZDRAV2: TSmallintField;
    TSET_U_NEMOC1: TSmallintField;
    TSET_U_NEMOC2: TSmallintField;
    TSET_U_DOCHOD1: TSmallintField;
    TSET_U_DOCHOD2: TSmallintField;
    TSET_U_FONDZAM1: TSmallintField;
    TSET_U_FONDZAM2: TSmallintField;
    TDZP_D_presah: TCurrencyField;
    TSET_FZ_GARFOND: TFloatField;
    TSET_FZ_GARFOND1: TFloatField;
    TINF_DATUM_UZAV: TDateField;
    TINF_F_SOCFOND: TFloatField;
    TINF_F_TYP_ULAVY_SP: TSmallintField;
    TINF_F_TYP_ULAVY_FZ: TSmallintField;
    TINF_F_NEMOHOL: TFloatField;
    TSET_ZAOKRUH10: TSmallintField;
    TSET_ZAOKRUH10SM: TSmallintField;
    TSET_ZAOKRUH11: TSmallintField;
    TSET_ZAOKRUH12: TSmallintField;
    TSET_ZAOKRUH12SM: TSmallintField;
    TSET_ZAOKRUH11SM: TSmallintField;
    TINF_DIC: TStringField;
    QDDP_: TQuery;
    QDDP_BUID_TYP: TStringField;
    QDDP_BUID_KOD: TSmallintField;
    QDDP_OLD_PREDCISLO_U: TStringField;
    QDDP_OLD_CISLO_U: TStringField;
    QDDP_BANKA_U: TStringField;
    QDDP_SSYM_U: TStringField;
    QDDP_KSYM: TStringField;
    QDDP_VSYM: TStringField;
    QDDP_PRIJEMCA: TStringField;
    QDDP_SPP: TStringField;
    QDDP_CISLO_U: TStringField;
    QDDP_CALC_INSTITUCIA: TStringField;
    CIS0X_: TTable;
    TSET_F_INVALID: TFloatField;
    TSET_FZ_INVALID: TFloatField;
    TSET_FZ_URAZ: TFloatField;
    TSET_FZ_REZERVA: TFloatField;
    TINF_ADR_CISLO: TStringField;
    TINF_ADR_TELEFON: TStringField;
    TINF_ADR_FAX: TStringField;
    TINF_ADR_EMAIL: TStringField;
    TINF_ICZ: TStringField;
    TINF_NAZOV_BANKY: TStringField;
    CIS5_: TTable;
    CIS5_ID: TStringField;
    CIS5_PERCENTO: TFloatField;
    CIS5_TEXT: TStringField;
    CIS5_CALC_ID: TStringField;
    CISPUX_: TTable;
    CISPUX_ID: TFloatField;
    CISPUX_CISLO: TIntegerField;
    CISPUX_DOPLNOK: TStringField;
    CISPUX_TEXT: TStringField;
    CISPUX_MD_SY: TStringField;
    CISPUX_MD_AN: TStringField;
    CISPUX_DAL_SY: TStringField;
    CISPUX_DAL_AN: TStringField;
    CISPUX_SUMA: TCurrencyField;
    CISPUX_CALC_NAZOV: TStringField;
    TPOM_: TTable;
    CIS4_OLD_CISLO_U: TStringField;
    CIS6_: TTable;
    CIS6_KOD3: TStringField;
    CIS6_AKRONYM: TStringField;
    CIS6_NAZOV: TStringField;
    CIS6_DAT_VZNIKU: TDateField;
    CIS6_DAT_ZANIKU: TDateField;
    CIS7_: TTable;
    CIS7_ID: TSmallintField;
    CIS7_POPIS: TStringField;
    CIS8_: TTable;
    CIS8_Typ: TStringField;
    CIS8_Popis: TStringField;
    TINF_TYP_ZEL: TStringField;
    CIS9_: TTable;
    CIS9_Typ: TStringField;
    CIS9_Popis: TStringField;
    TINF_L_TYP_ZEL: TStringField;
    TINF_ADR_STAT: TStringField;
    TINF_L_ADR_STAT: TStringField;
    CIS10_: TTable;
    CIS10_TYP: TSmallintField;
    CIS10_POPIS: TStringField;
    CIS11_: TTable;
    CIS11_ID: TStringField;
    CIS11_POPIS: TStringField;
    CIS12_: TTable;
    CIS12_ID: TSmallintField;
    CIS12_POPIS: TStringField;
    CIS13_: TTable;
    CIS13_TYP: TSmallintField;
    CIS13_POPIS: TStringField;
    TTLA_: TTable;
    DS_TLA: TDataSource;
    TTLA_VYKAZ_ZOSTAVIL: TStringField;
    TTLA_TELEFON: TStringField;
    TTLA_FAX: TStringField;
    TTLA_MAIL: TStringField;
    TTLA_DEN: TDateField;
    TTLA_MIESTO: TStringField;
    CIS14_: TTable;
    CIS14_Znak: TStringField;
    CIS14_Popis: TStringField;
    DS_CIS1: TDataSource;
    CIS1_ID: TSmallintField;
    CIS1_TEXT: TStringField;
    CIS1_CALC_NAZOV: TStringField;
    TINF_ADR_ZIP: TStringField;
    TINF_FO_RC: TStringField;
    TINF_FO_CPP: TStringField;
    TINF_FO_Surname: TStringField;
    TINF_FO_Name: TStringField;
    TINF_FO_Titul_pred: TStringField;
    TINF_FO_Titul_za: TStringField;
    TINF_KA_ULICA: TStringField;
    TINF_KA_MESTO: TStringField;
    TINF_KA_PSC: TStringField;
    TINF_KA_ZIP: TStringField;
    TINF_KA_STAT: TStringField;
    TINF_L_KA_STAT: TStringField;
    TINF_ADR_ULICA1: TStringField;
    THLD_: TTable;
    THLD_Code_emp: TIntegerField;
    THLD_Prijmy: TCurrencyField;
    THLD_Zaklad_dane: TCurrencyField;
    THLD_Preddavky: TCurrencyField;
    THLD_Prijmy_nepenazne: TCurrencyField;
    THLD_Vyplateny_bonus: TCurrencyField;
    THLD_Pocet_deti: TSmallintField;
    THLD_Mesiace: TStringField;
    TINF_DANOVY_URAD: TStringField;
    TINF_DATUM_RZP: TDateField;
    CIS15_: TTable;
    CIS15_ID: TSmallintField;
    CIS15_TEXT: TStringField;
    TINF_L_ADR_STAT_AAA: TStringField;
    DS_CIS5: TDataSource;
    CIS4_POBOCKA_ZP: TSmallintField;
    CIS4_ICO: TStringField;
    TSYS_CALC_STAV_REG: TStringField;
    DS_CIS7: TDataSource;
    CIS7_CALC_TEXT: TStringField;
    DS_CIS13: TDataSource;
    CIS13_CALC_TEXT: TStringField;
    CIS0_ID: TSmallintField;
    CIS0_MESIAC_OD: TSmallintField;
    CIS0_MESIAC_DO: TSmallintField;
    CIS0_SKRATKA: TStringField;
    CIS0_HODNOTA: TCurrencyField;
    CIS0_POPIS: TStringField;
    CIS0_CALC_POPIS: TStringField;
    TINF_SP_IDENTIFIKATOR: TSmallintField;
    CIS10_CALC_POPIS: TStringField;
    TINF_SMTP_SERVER: TStringField;
    TINF_SMTP_USER: TStringField;
    TINF_SMTP_PWD: TStringField;
    TINF_SMTP_FROM: TStringField;
    TINF_SMTP_PORT: TIntegerField;
    TINF_IBAN: TStringField;
    CIS4_IBAN: TStringField;
    TTLA_UCTO_PRIEZVISKO: TStringField;
    TTLA_UCTO_MENO: TStringField;
    TTLA_UCTO_TEL: TStringField;
    TTLA_UCTO_MAIL: TStringField;
    procedure DMCreate(Sender: TObject);
    procedure DS_DZPDataChange(Sender: TObject; Field: TField);
    procedure TDZP_BeforeDelete(DataSet: TDataSet);
    procedure TINF_CalcFields(DataSet: TDataSet);
    procedure CIS1_PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure CIS1_BeforeDelete(DataSet: TDataSet);
    procedure CIS1_BeforeInsert(DataSet: TDataSet);
    procedure CIS1_CalcFields(DataSet: TDataSet);
    procedure TSYS_CalcFields(DataSet: TDataSet);
    procedure TINF_BeforePost(DataSet: TDataSet);
    procedure TPRIV_CalcFields(DataSet: TDataSet);
    procedure CIS2_CalcFields(DataSet: TDataSet);
    procedure CIS2_BeforeDelete(DataSet: TDataSet);
    procedure CIS2_BeforeInsert(DataSet: TDataSet);
    procedure CIS2_PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure CIS3_BeforeInsert(DataSet: TDataSet);
    procedure CIS3_BeforeDelete(DataSet: TDataSet);
    procedure CIS3_PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure CIS0_BeforeDelete(DataSet: TDataSet);
    procedure CIS0_BeforeInsert(DataSet: TDataSet);
    procedure CIS4_CalcFields(DataSet: TDataSet);
    procedure CIS4_BeforeDelete(DataSet: TDataSet);
    procedure CIS4_BeforeInsert(DataSet: TDataSet);
    procedure CIS4_PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure CIS4_BeforePost(DataSet: TDataSet);
    procedure CIS4_NewRecord(DataSet: TDataSet);
    procedure CIS4_BUID_TYPValidate(Sender: TField);
    procedure TDZP_NewRecord(DataSet: TDataSet);
    procedure QDDP_CalcFields(DataSet: TDataSet);
    procedure CIS5_CalcFields(DataSet: TDataSet);
    procedure CISPUX_CalcFields(DataSet: TDataSet);
    procedure CISPUX_BeforeDelete(DataSet: TDataSet);
    procedure CISPUX_BeforeInsert(DataSet: TDataSet);
    procedure CISPUX_NewRecord(DataSet: TDataSet);
    procedure TTLA_BeforeInsert(DataSet: TDataSet);
    procedure TTLA_BeforeDelete(DataSet: TDataSet);
    procedure TINF_FO_RCValidate(Sender: TField);
    procedure CIS7_CalcFields(DataSet: TDataSet);
    procedure CIS13_CalcFields(DataSet: TDataSet);
    procedure CIS0_CalcFields(DataSet: TDataSet);
    procedure CIS10_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    VYNIMKY_SPRAC: byte;
    {0--sposobom platnym do 31.7.2006, alebo po 1.1.2007
     1--sposobom platnym od 1.8.2006, zuzeny pocet vynimiek
    }
  public
    NEW_TYP_PRIPLATKOV: string[8];
    NEW_TYP_PRIPLATKOV2: string[8];
    { Public declarations }
    function AktVelkyZavod: boolean;
    function AktFirmaStr: string;
    function AktMesiac: byte;
    function AktRok: integer;
    function AktObdobie: longint;
    function AktSid: byte;
    function AktMinSid: byte;
    function AktMaxSid: byte;
    function AktSidFilter: string;
    function AktObdobieStr(up:boolean): string;
    function AktObdobieStr2: string;
    function AktStrediskoStr: string;
    function AktStrediskoStr2: string;
    function AktTypPremiiStr: string;
    function DemoVerzia: boolean;
    function PripustneObdobiePreDemo: boolean;
    function KontrolaVstupnehoHesla(const Heslo: string): boolean;
    procedure NastavNoveHeslo(const Heslo: string);
    function ExistujeStredisko(Sid:byte; var Nazov: string):boolean;
    {
    function VratHodnotu(const Skratka:string):double;
    function VratHodnotuInt(const Skratka:string):integer;
    }
    function VratPismenoDiskety:string;
    {
    procedure NacitajParametre;
    }
    procedure NaplnMyReportParam(var X: TMyReportParam);
    procedure DanovePasmaToIniFile(const FN:string);
    procedure IniFileToDanovePasma(const FN:string);
    procedure IniFileToParametre(const FN:string);
    procedure IniFileToSetup(const FN:string);
    function NAZOV_ZP(iKodZP:integer):string;
    function CISLO_PLATITELA_ZP(iKodZP:integer):string;
    procedure NAPLN_UDAJE_ZP(iKodZP:integer);
    procedure NASTAV_VYNIMKY_SPRACOVANIE(iKodVynimky:byte);
    procedure VYNIMKY_TO_STRINGLIST(ioSL: TStrings);
    function  STAT(iStat:string):string;
    function  NasaMena:string;
end;

var
  DM: TDM;
  CBU:TCBU;
  SYS_StavRegistracie : string;

implementation

uses Main, DM_sql, Dm_vypl, ParPU;

{$R *.DFM}

procedure TDM.DMCreate(Sender: TObject);
begin
  VYNIMKY_SPRAC := 0;
  TSYS_.Close;
  TINF_.Close;
  TSET_.Close;
  TDZP_.Close;
end;

procedure TDM.DS_DZPDataChange(Sender: TObject; Field: TField);
begin
  if TDZP_.State in [dsInsert,dsEdit]
  then DS_DZPG.Enabled := False
  else DS_DZPG.Enabled := True;
end;

procedure TDM.TDZP_BeforeDelete(DataSet: TDataSet);
begin
  if MyOtazka('Vymaza položku ?') then
  if MyOtazka('Položka bude definitívne zrušená.') then exit;
  raise EMyError.Create('Vymazanie položky bolo zastavené');
end;

procedure TDM.TINF_CalcFields(DataSet: TDataSet);
begin
  TINF_CALC_ADRESA.Value :=
    MyAdresa (
    TINF_adr_ulica.Value,
    TINF_adr_cislo.Value,
    TINF_adr_psc.Value,
    TINF_adr_mesto.Value );

  TINF_CALC_SUBJ.Value :=
    TINF_nazov.Value+','+TINF_CALC_ADRESA.Value;

  TINF_CALC_OBDOBIE.Value :=
    AktObdobieStr(TRUE);

  TINF_CALC_TEXT_PREMII.Value:=
    AktTypPremiiStr;

  TINF_CALC_TYP_PRIPLATKOV.Value:=
    TYP_PRIPL_TO_STRING(TINF_F_TYP_PRIPL.Value);

  TINF_CALC_TYP_PRIPLATKOV2.Value:=
    TYP_PRIPL2_TO_STRING(TINF_F_TYP_PRIPL2.Value);
end;

procedure TDM.CIS1_PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  if E.Message=SMyCisKeyViolation then begin
    MyError(SMyCisDuplicitnyZaznam);
    Action := daAbort;
  end;
end;

procedure TDM.CIS1_BeforeDelete(DataSet: TDataSet);
begin
  if MyOtazka(SMyCisDeleteQuestion) then exit;
  raise EMyError.Create(SMyCisDeleteStopped);
end;

procedure TDM.CIS1_BeforeInsert(DataSet: TDataSet);
begin
  if MyOtazka(SMyAppUserWantInsert) then exit;
  raise EMyError.Create(SMyAppStopUserWantInsert);
end;

procedure TDM.CIS1_CalcFields(DataSet: TDataSet);
begin
  CIS1_CALC_NAZOV.Value :=
    Format('%2d',[CIS1_ID.Value])+' - '+
    CIS1_TEXT.Value;
end;

procedure TDM.TSYS_CalcFields(DataSet: TDataSet);
begin
  if DemoVerzia then
  TSYS_CALC_SERIAL_NUM.Value := ''
  else
  TSYS_CALC_SERIAL_NUM.Value :=
    TSYS_REG_KEY.Value;

  TSYS_CALC_VERZIA.Value :=
    MyVerzia+TSYS_POCET_ZAM.AsString;
  if TSYS_POCET_FIRIEM.Value > 1 then
    TSYS_CALC_VERZIA.Value := TSYS_CALC_VERZIA.Value + ' multi';

  if DemoVerzia then
  TSYS_CALC_STAV_REG.Value := 'DEMO VERZIA'
  else begin
    case TSYS_POCET_ZAM.Value of
    5: TSYS_CALC_STAV_REG.Value := 'do 5 zamestnancov';
    20: TSYS_CALC_STAV_REG.Value := 'do 20 zamestnancov';
    50: TSYS_CALC_STAV_REG.Value := 'do 50 zamestnancov';
    else TSYS_CALC_STAV_REG.Value := 'nad 50 zamestnancov';
    end;
  end;
end;

procedure TDM.TINF_BeforePost(DataSet: TDataSet);
var A1,A2:string;
begin
  MyRozdelUlicu(TINF_ADR_Ulica1.Value,A1,A2);
  TINF_ADR_ULICA.Value := A1;
  TINF_ADR_CISLO.Value := A2;
  if (NEW_TYP_PRIPLATKOV<>'') and (length(NEW_TYP_PRIPLATKOV)=8) then
    TINF_F_TYP_PRIPL.Value:= TYP_PRIPL_TO_BYTE(NEW_TYP_PRIPLATKOV);
  if (NEW_TYP_PRIPLATKOV2<>'') and (length(NEW_TYP_PRIPLATKOV2)=8) then
    TINF_F_TYP_PRIPL2.Value:= TYP_PRIPL2_TO_BYTE(NEW_TYP_PRIPLATKOV2);
  FormMain.UpdateStatus;
end;

function TDM.AktVelkyZavod: boolean;
begin
  Result:=TINF_F_ND_POCITA.Value <> 0;
end;

function TDM.AktFirmaStr: string;
begin
  if AktSid=0
    then Result:=TINF_Nazov.Value
    else Result:=TINF_Nazov.Value+', stredisko: '+IntToStr(AktSid);
end;

function TDM.AktMesiac: byte;
begin
  Result:=TPRIV_Mesiac.Value;
end;

function TDM.AktRok: integer;
begin
  Result:=TPRIV_Rok.Value;
end;

function TDM.AktObdobie: longint;
begin
  AktObdobie:=AktRok * 100 + AktMesiac;
end;

function TDM.AktSid: byte;
begin
  AktSid:=TPRIV_SID.Value;
end;

function TDM.AktMinSid: byte;
begin
  AktMinSid:=TPRIV_MIN_SID.Value;
end;

function TDM.AktMaxSid: byte;
begin
  AktMaxSid:=TPRIV_MAX_SID.Value;
end;

function TDM.AktSidFilter: string;
begin
  Result:=IntToStr(AktMinSid)+'<=sid and sid<='+IntToStr(AktMaxSid);
end;

function TDM.AktObdobieStr(up:boolean): string;
begin
  Result:= MESIAC(AktMesiac,up)+' '+IntToStr(AktRok);
end;

function TDM.AktObdobieStr2: string;
begin
  Result:= IntToStr(AktMesiac)+'.'+IntToStr(AktRok);
end;

function TDM.AktStrediskoStr: string;
var Pom:byte;Nazov:string;
begin
  Pom:=AktSid;
  if Pom<>0 then begin
    ExistujeStredisko(Pom,Nazov);
    Result:= Nazov;
  end
  else Result:=MenoCelaFirma;
end;

function TDM.AktStrediskoStr2: string;
var Pom:byte;Nazov:string;
begin
  Pom:=AktSid;
  if Pom<>0 then begin
    Result:= 'stredisko è.'+IntToStr(Pom);
  end
  else Result:='celá frima';
end;

function TDM.AktTypPremiiStr: string;
begin
  Result:=TEXT_TYP_PREMII(TINF_F_typ_premii.Value);
end;

function TDM.DemoVerzia: boolean;
begin
{$IFDEF TEST}
 Result:= False;
 exit;
{$ENDIF}
  Result:= NOT TSYS_Registered.Value;
end;

function TDM.PripustneObdobiePreDemo: boolean;
begin
  if not DemoVerzia
   then Result:=true
   else Result:=(AktMesiac in Demo_Mesiace);
end;

function TDM.KontrolaVstupnehoHesla(const Heslo: string): boolean;
begin
  Result := (TSYS_ADMIN.Value = Heslo) OR (UpperCase(Heslo)='ADMIN_PAM98');
end;

procedure TDM.NastavNoveHeslo(const Heslo: string);
begin
  TSYS_.Edit;
  TSYS_ADMIN.Value := Heslo;
  TSYS_.Post;
end;

procedure TDM.TPRIV_CalcFields(DataSet: TDataSet);
var Stredisko:byte;
begin
  Stredisko:=AktSid;
  if Stredisko = 0 then begin
    TPRIV_MIN_SID.Value := 1;
    TPRIV_MAX_SID.Value := 99;
  end else
  begin
    TPRIV_MIN_SID.Value := Stredisko;
    TPRIV_MAX_SID.Value := Stredisko;
  end;
end;

function TDM.ExistujeStredisko(Sid:byte; var Nazov: string):boolean;
begin
  CIS2_.Filtered:=false;
  CIS2_.Filter:='id='+inttostr(sid);
  CIS2_.Filtered:=true;
  if CIS2_.EOF then begin
    ExistujeStredisko:=false;
    Nazov:='';
  end else
  begin
    ExistujeStredisko:=true;
    Nazov:=CIS2_.FieldByName('Nazov').Value;
  end;
end;


procedure TDM.CIS2_CalcFields(DataSet: TDataSet);
begin
  CIS2_CALC_NAZOV.Value := IntToStr(CIS2_ID.VALUE)+' - '+
    CIS2_NAZOV.Value;
end;

procedure TDM.CIS2_BeforeDelete(DataSet: TDataSet);
begin
  if CIS2_ID.Value = 1 then
  raise EMyError.Create(SMyCisStrediskoJednaMusiZostat);
  if MyOtazka(SMyCisDeleteQuestion) then exit;
  raise EMyError.Create(SMyCisDeleteStopped);
end;

procedure TDM.CIS2_BeforeInsert(DataSet: TDataSet);
begin
  if MyOtazka(SMyAppUserWantInsert) then exit;
  raise EMyError.Create(SMyAppStopUserWantInsert);
end;

procedure TDM.CIS2_PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  if E.Message=SMyCisKeyViolation then begin
    MyError(SMyCisDuplicitnyZaznam);
    Action := daAbort;
  end;
end;


procedure TDM.CIS3_BeforeInsert(DataSet: TDataSet);
begin
  if MyOtazka(SMyAppUserWantInsert) then exit;
  raise EMyError.Create(SMyAppStopUserWantInsert);
end;

procedure TDM.CIS3_BeforeDelete(DataSet: TDataSet);
begin
  if MyOtazka(SMyCisDeleteQuestion) then exit;
  raise EMyError.Create(SMyCisDeleteStopped);
end;

procedure TDM.CIS3_PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  if E.Message=SMyCisKeyViolation then begin
    MyError(SMyCisDuplicitnyZaznam);
    Action := daAbort;
  end;
end;

procedure TDM.CIS0_BeforeDelete(DataSet: TDataSet);
begin
  raise EMyError.Create(SMyCisDeleteNotAllowed);
end;

procedure TDM.CIS0_BeforeInsert(DataSet: TDataSet);
begin
  raise EMyError.Create(SMyCisInsertNotAllowed);
end;
{
function TDM.VratHodnotu(const Skratka:string):double;
begin
  CIS0_.Filter:='Skratka='''+UpperCase(Skratka)+'''';
  CIS0_.Filtered:=True;
  Result:=CIS0_Hodnota.Value;
end;

function TDM.VratHodnotuInt(const Skratka:string):integer;
begin
  Result:=Round(VratHodnotu(Skratka));
end;
}
function TDM.VratPismenoDiskety:string;
var pom:integer;
begin
  result:='';
  try pom:=VratHodnotuInt('ZALOHOVANIE');
  case pom of
   1:result:='A';
   2:result:='B';
  end;
  except
  end;
end;

procedure TDM.CIS4_CalcFields(DataSet: TDataSet);
begin
 CIS4_CALC_INSTITUCIA.Value :=
   TEXT_INSTITUCIE(CIS4_BUID_TYP.Value,CIS4_BUID_KOD.Value);
end;

procedure TDM.CIS4_BeforeDelete(DataSet: TDataSet);
begin
  if MyOtazka(SMyCisDeleteQuestion) then exit;
  raise EMyError.Create(SMyCisDeleteStopped);
end;

procedure TDM.CIS4_BeforeInsert(DataSet: TDataSet);
begin
  if MyOtazka(SMyAppUserWantInsert) then exit;
  raise EMyError.Create(SMyAppStopUserWantInsert);
end;

procedure TDM.CIS4_PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  if E.Message=SMyCisKeyViolation then begin
    MyError(SMyCisDuplicitnyZaznam);
    Action := daAbort;
  end;
end;

procedure TDM.CIS4_BeforePost(DataSet: TDataSet);
begin
 if (CIS4_BUID_TYP.Value<>'Z') and (CIS4_BUID_TYP.Value<>'Y')
   then CIS4_BUID_KOD.Value:=0;
 if (CIS4_BUID_TYP.Value<>'Z')
   then CIS4_Pobocka_ZP.Value:=0;
end;

procedure TDM.CIS4_NewRecord(DataSet: TDataSet);
begin
  CIS4_BUID_KOD.Value := 0;
end;

procedure TDM.CIS4_BUID_TYPValidate(Sender: TField);
var c:char;
begin
  c:=' '; if length(Sender.AsString)>0 then c:=Sender.AsString[1];
  if not (c in SetOf_InstituciaValid)
    then raise EMyError.Create(SMyCisInstituciaNotValid);
end;

{procedure TDM.NacitajParametre;
begin
  CIS0_.Filtered:=False;
  CIS0_.First;
  while not CIS0_.EOF do begin
    PARAMETRE[CIS0_ID.Value].hodnota:=CIS0_Hodnota.Value;
    PARAMETRE[CIS0_ID.Value].popis:=CIS0_Popis.Value;
    CIS0_.Next;
  end;
end;
}

procedure TDM.NaplnMyReportParam(var X: TMyReportParam);
begin
  X.Typ:='';
  X.AktObdobie:=DM.AktObdobie;
  X.Obdobie1:=DM.AktObdobie;
  X.Obdobie2:=DM.AktObdobie;
  X.AktObdobieStrT:=DM.AktObdobieStr(True);
  X.AktObdobieStrF:=DM.AktObdobieStr(False);
  X.AktFirmaStr:=DM.AktFirmaStr;
  X.AktIbaFirmaStr:=DM.TINF_Nazov.Value;
  X.AktMinSid:=DM.AktMinSid;
  X.AktSid:=DM.AktSId;
  X.AktMaxSid:=DM.AktMaxSid;
  X.Code_emp1:=1;
  X.Code_emp2:=MaxCodeEmp;
  X.DisableShape:=False;
  X.DisableLabel:=False;
  X.Silent:=False;
  X.PID:=0;
  X.HPID:=0;
  X.Abeceda:=True;
  X.JedenPracovnik:=False;
  X.RTF_sablona:='';
  X.RTF_subor:='';
  X.RTF_prepisat:=False;
  X.RTF_existuje:=False;
  X.Vyber_ZP:=False;
  X.Kod_zp:=0;
  X.Nc_text:='';
  X.Bullzip := False;
end;

procedure TDM.DanovePasmaToIniFile(const FN:string);
var F:TIniFile;i:integer;j:string;
begin
  F:=TIniFile.Create(MyAppPath+FN);
  F.EraseSection(coDanOd);
  F.EraseSection(coDanSadzba);
  F.EraseSection(coDanSumaPlus);
  i:=0;
  try
    TDZP_.First;
    while not TDZP_.EOF do
    begin
      Inc(i);j:=IntToStr(i);
      F.WriteString(coDanOd,'PASMO_'+j,FloatToStr(TDZP_D_OD.Value));
      F.WriteString(coDanSadzba,'PASMO_'+j,FloatToStr(TDZP_D_SADZBA.Value));
      F.WriteString(coDanSumaPlus,'PASMO_'+j,FloatToStr(TDZP_D_SUMAPLUS.Value));
      TDZP_.Next;
    end;
  finally
    F.Free;
  end;
end;

procedure TDM.IniFileToDanovePasma(const FN:string);
var F:TIniFile;i,code:integer;j,s:string;od,sadzba,sumaplus:double;
begin
  F:=TIniFile.Create(MyAppPath+FN);
  s:=F.ReadString(coDanOd,'PASMO_1','');
  if s='' then raise EMyError.Create(Format(SMyAppDanovePasmaNotFound,[FN]));
  s:=F.ReadString(coDanSadzba,'PASMO_1','');
  if s='' then raise EMyError.Create(Format(SMyAppDanovePasmaNotFound,[FN]));
  s:=F.ReadString(coDanSumaPlus,'PASMO_1','');
  if s='' then raise EMyError.Create(Format(SMyAppDanovePasmaNotFound,[FN]));
  i:=0;
  try
    TDZP_.Close;
    DMSQL.ExecuteSql('delete from ":pam98_comm:dzp"');
    TDZP_.Open;
    repeat
      Inc(i);j:=IntToStr(i);
      s:=F.ReadString(coDanOd,'PASMO_'+j,'');Val(s,od,code);
      s:=F.ReadString(coDanSadzba,'PASMO_'+j,'');Val(s,sadzba,code);
      s:=F.ReadString(coDanSumaPlus,'PASMO_'+j,'');Val(s,sumaplus,code);
      if s<>'' then
      begin
        TDZP_.Insert;
        TDZP_D_od.Value := od;
        TDZP_D_sadzba.Value := sadzba;
        TDZP_D_sumaplus.Value := sumaplus;
        TDZP_.Post;
        {TDZP_.InsertRecord([od,sadzba,od,sumaplus]);}
      end;
    until s='';
  finally
    F.Free;
  end;
end;

procedure TDM.IniFileToParametre(const FN:string);
var F:TIniFile;i,code:integer;s:string;hod:double;SL:TStringList;
begin
  F:=TIniFile.Create(MyAppPath+FN);
  try
  SL:=TStringList.Create;
  F.ReadSection('PARAMETRE_NUM',SL);
  for i:=0 to SL.Count-1 do
  begin
    s:=F.ReadString('PARAMETRE_NUM',SL.Strings[i],'');Val(s,hod,code);
    if CIS0_.FindKey([SL.Strings[i]]) then
    begin
      CIS0_.Edit;
{      CIS0_HODNOTA.Value := hod;}
      CIS0_.Post;
    end;
  end;
  SL.Free;
  finally
    F.Free;
  end;
end;

procedure TDM.IniFileToSetup(const FN:string);
var F:TIniFile;i,code:integer;s:string;DS:char;hod:double;SL:TStringList;
begin
  DS:=DecimalSeparator;
  DecimalSeparator:='.';
  F:=TIniFile.Create(MyAppPath+FN);
  try
  SL:=TStringList.Create;
  F.ReadSection('SETUP',SL);
  for i:=0 to SL.Count-1 do
  begin
    s:=F.ReadString('SETUP',SL.Strings[i],'');Val(s,hod,code);
    if code<>0 then MyMessage('blb');
    TSET_.Edit;
    TSET_.FieldByName(SL.Strings[i]).Value:=hod;
    TSET_.Post;
  end;
  SL.Free;
  finally
    F.Free;
    DecimalSeparator := DS;
  end;
end;


procedure TDM.TDZP_NewRecord(DataSet: TDataSet);
begin
  TDZP_D_presah.Value := 0;
end;

procedure TDM.QDDP_CalcFields(DataSet: TDataSet);
begin
 QDDP_CALC_INSTITUCIA.Value :=
   TEXT_INSTITUCIE(QDDP_BUID_TYP.Value,QDDP_BUID_KOD.Value)
   +' '+QDDP_Prijemca.Value;
end;

procedure TDM.CIS5_CalcFields(DataSet: TDataSet);
begin
  case VYNIMKY_SPRAC of
  0: CIS5_CALC_ID.Value := CIS5_ID.Value + '-' + CIS5_TEXT.Value;
  1: case CIS5_ID.Value[1] of
     '0':CIS5_CALC_ID.Value := CIS5_ID.Value + '-' + CIS5_TEXT.Value;
     '1':CIS5_CALC_ID.Value := CIS5_ID.Value + '-zamestnanec s viacerými pracovnými pomermi a maximálnym vym.základom (zamestnávate¾ odvádza v plnej výške, zamestnanec žiadne alebo nižšie odvody ako je èiastka stanovená zákonom)';
     '2':CIS5_CALC_ID.Value := CIS5_ID.Value + '-náhrada mzdy z neplatného skonèenia pracovného pomeru';
     'A':CIS5_CALC_ID.Value := CIS5_ID.Value + '-75% vymer.základu - zamestnanec, ktorý je poberate¾om invalid. dôchodku, pokles zárob.èinnosti najviac o 70% alebo mladistvý starší ako 16 rokov (§138 ods. 12, písm. a))';
     'B':CIS5_CALC_ID.Value := CIS5_ID.Value + '-50% vymer.základu - zamestnanec, ktorý je poberate¾om invalid. dôchodku, pokles zárob.èinnosti o viac ako o 70%, alebo mladší ako 18 rokov, ktorý je invalidný, alebo mladší ako 16 rokov (§138 ods. 12, písm. b))';
     'C':CIS5_CALC_ID.Value := CIS5_ID.Value + '-Suma príjmu zodpovedajúca kratšiemu pracovnému èasu zamestnanca, ktorý má dohodnutý pracovný pomer na kratší pracovný èas pod¾a osobitného predpisu (§138 ods. 12, písm. c))';
     'D':CIS5_CALC_ID.Value := CIS5_ID.Value + '-Suma náhrady mzdy, poskytnutá z dôvodu prekážok v práci na strane zamestnávate¾a pod¾a osobitného predpisu (§138 ods. 12, písm. d))';
     'E':CIS5_CALC_ID.Value := CIS5_ID.Value + '-Suma pracovnej odmeny fyzickej osoby vo výkone väzby a fyzickej osoby vo výkone trestu odòatia slobody, ak sú zaradené do práce';
     else
     CIS5_CALC_ID.Value := CIS5_ID.Value + '-neplatná hodnota';
     end;
  end;
end;

function TDM.NAZOV_ZP(iKodZP:integer):string;
begin
    CIS1_.First;
    if CIS1_.FindKey([iKodZP])
      then begin
        if Trim(CIS1_TEXT.Value)<>'' then
          Result:=CIS1_TEXT.Value
        else
          Result:=CIS1_CALC_NAZOV.Value
      end
      else Result:=TEXT_INSTITUCIE('Z',iKodZP);
end;

function TDM.CISLO_PLATITELA_ZP(iKodZP:integer):string;
begin
    CIS4_.First;
    if CIS4_.FindKey(['Z',iKodZP])
      then Result:=CIS4_OLD_CISLO_U.Value
        else Result:=TINF_ICO.Value;
end;

procedure TDM.NAPLN_UDAJE_ZP(iKodZP:integer);
begin with CBU do begin
 CisloPlatitelaZP:='';
 ICO:='';
 PobockaZP:=0;
 CIS4_.First;
 if CIS4_.FindKey(['Z',iKodZP]) then begin
   CisloPlatitelaZP := CIS4_OLD_CISLO_U.Value;
   PobockaZP := CIS4_POBOCKA_ZP.Value;
   ICO := CIS4_ICO.Value;
 end;
end;end;

procedure TDM.CISPUX_CalcFields(DataSet: TDataSet);
begin
 CISPUX_CALC_NAZOV.Value := CISPUX_TEXT.Value;
 if CISPUX_CISLO.AsString<>'' then
   CISPUX_CALC_NAZOV.Value := CISPUX_CALC_NAZOV.Value + CISPUX_CISLO.AsString;
 if UpperCase(CISPUX_DOPLNOK.Value) = 'Z' then
   CISPUX_CALC_NAZOV.Value := CISPUX_CALC_NAZOV.Value + ' - zam.';
 if UpperCase(CISPUX_DOPLNOK.Value) = 'F' then
   CISPUX_CALC_NAZOV.Value := CISPUX_CALC_NAZOV.Value + ' - firma ';
end;

procedure TDM.CISPUX_BeforeDelete(DataSet: TDataSet);
begin
  if NOT (CISPUX_ID.AsInteger IN SetOf_PU_poistovne) then
    raise EMyError.Create(SMyCisDeleteNotAllowed);
end;

procedure TDM.CISPUX_BeforeInsert(DataSet: TDataSet);
begin
  Application.CreateForm(TFormParPU, FormParPU);
  try
  FormParPU.ShowModal;
  if FormParPU.ModalResult=mrCANCEL then Abort;
  finally
  FormParPU.Release;
  FormParPU:=nil;
  end;
end;

procedure TDM.CISPUX_NewRecord(DataSet: TDataSet);
begin
  CISPUX_ID.Value := ParPU.MyParam.id;
  CISPUX_DOPLNOK.Value := ParPU.MyParam.znak;
  CISPUX_CISLO.Value := ParPU.MyParam.kod;
  if (CISPUX_ID.Value = 29) or (CISPUX_ID.Value = 35) then
    CISPUX_TEXT.Value:='zdrav. poistenie ZP è.'
  else
    CISPUX_TEXT.Value:='DDP è.';
end;

procedure TDM.TTLA_BeforeInsert(DataSet: TDataSet);
begin
 Abort;
end;

procedure TDM.TTLA_BeforeDelete(DataSet: TDataSet);
begin
 Abort;
end;

procedure TDM.TINF_FO_RCValidate(Sender: TField);
begin
  RC_Validate(Sender.Value);
end;

procedure TDM.NASTAV_VYNIMKY_SPRACOVANIE(iKodVynimky:byte);
begin
  VYNIMKY_SPRAC := iKodVynimky;
  case iKodVynimky of
  0: begin
      CIS5_.Filter:='';
      CIS5_.Filtered:=False;
     end;
  1: begin
      CIS5_.Filter:='(ID >=''0'' AND ID<=''2'') OR (ID>=''A'' AND ID<=''E'')';
      CIS5_.Filtered:=False;
     end
  end;
  CIS5_.Refresh;
end;

procedure TDM.VYNIMKY_TO_STRINGLIST(ioSL: TStrings);
begin
  if ioSL=nil then exit;
  ioSL.Clear;
  CIS5_.FIrst;
  while not CIS5_.EOF do begin
    ioSL.Add(CIS5_CALC_ID.Value);
    CIS5_.Next;
  end;
end;

function TDM.STAT(iStat:string):string;
{konverzia 3-znakoveho statu na 2-znakovy akronym}
var s:string;
begin
  if iStat='' then begin Result:='';exit;end;
  s:= 'select akronym from ":pam98_comm:cis_stat" where kod3="'+iStat+'"';
  DMSQL.ExecuteSql(s);
  Result:=DMSQL.Results[1];
end;


procedure TDM.CIS7_CalcFields(DataSet: TDataSet);
begin
  CIS7_CALC_TEXT.Value := CIS7_ID.AsString + '-'+CIS7_POPIS.Value;
end;


procedure TDM.CIS13_CalcFields(DataSet: TDataSet);
begin
  CIS13_CALC_TEXT.Value := CIS13_TYP.AsString + '-' + CIS13_POPIS.Value;
end;

procedure TDM.CIS0_CalcFields(DataSet: TDataSet);
var MM_OD,MM_DO,i: integer;
    datum_od,datum_do: TDateTime;
begin
  CIS0_CALC_POPIS.Value := CIS0_POPIS.Value;
  MM_OD := CIS0_Mesiac_od.Value;
  MM_DO := CIS0_Mesiac_do.Value;
  if (MM_OD<1) or (MM_OD>12) then MM_OD:=1;
  if (MM_DO<1) or (MM_DO>12) then MM_DO:=12;
  datum_od := EncodeDate(DM.AktRok,MM_OD,1);
  datum_do := LastDayDate(DM.AktRok,MM_DO,31);
  if MM_OD>1 then
    CIS0_CALC_POPIS.Value :=
      CIS0_POPIS.Value + ' od '+DateToStr(datum_od);
  if MM_DO<12 then begin
    CIS0_CALC_POPIS.Value :=
      CIS0_POPIS.Value + ' do '+DateToStr(datum_do);
  end;
end;

function  TDM.NasaMena:string;
begin
  if DM.AktObdobie >= ZAKON_2009_01 then
    Result := 'EUR'
  else
    Result := 'SKK';
end;
procedure TDM.CIS10_CalcFields(DataSet: TDataSet);
begin
  if DM.AktRok < 2013 then
    CIS10_CALC_POPIS.Value :=  CIS10_POPIS.Value
  else begin
    case CIS10_TYP.Value of
     1:CIS10_CALC_POPIS.Value := 'Zamestnanec - pravidelný príjem';
     2:CIS10_CALC_POPIS.Value := 'Dohoda do 31.12.2012';
     3:CIS10_CALC_POPIS.Value := 'Zamestnanec - nepravidelný príjem';
    10:CIS10_CALC_POPIS.Value := 'DoVP (Dohoda o vykonaní práce) – pravidelný príjem';
    11:CIS10_CALC_POPIS.Value := 'DoVP - nepravidelný príjem';
    12:CIS10_CALC_POPIS.Value := 'DoPÈ (Dohoda o pracovnej èinnosti) – pravidelný príjem';
    13:CIS10_CALC_POPIS.Value := 'DoPÈ – nepravidelný príjem';
    14:CIS10_CALC_POPIS.Value := 'DoBPŠ (Dohoda o brigádnickej práci študentov) – pravidelný príjem';
    15:CIS10_CALC_POPIS.Value := 'DoBPŠ – nepravidelný príjem';
    16:CIS10_CALC_POPIS.Value := 'DoBPŠ bez dôchodkového poistenia - pravidelný príjem';
    17:CIS10_CALC_POPIS.Value := 'DoBPŠ bez dôchodkového poistenia - nepravidelný príjem';
    18:CIS10_CALC_POPIS.Value := 'DoBPŠ len na dôchodkové poistenie - pravidelný príjem';
    19:CIS10_CALC_POPIS.Value := 'DoBPŠ len na dôchodkové poistenie - nepravidelný príjem';
    20:CIS10_CALC_POPIS.Value := 'Zamestnanec - dlhodobo nezamestnaný UP,GP';
    21:CIS10_CALC_POPIS.Value := 'Zamestnanec - dlhodobo nezamestnaný len na DP';
    22:CIS10_CALC_POPIS.Value := 'Zamestnanec - dlhodobo nezamestnaný len na NP,DP,PvN';
    23:CIS10_CALC_POPIS.Value := 'Zamestnanec - dlhodobo nezamestnaný DP,UP,GP';
    end;
  end;
end;

end.
