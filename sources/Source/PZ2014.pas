unit PZ2014;

interface

{ NEW SELECT

select
  b.code_emp code_emp,
  max(a.name) name,
  max(a.surname) surname,
  max(a.title) title,
  max(a.born_numb) born_numb,
  max(a.tp_zip) tp_zip,
  max(a.tp_street) tp_street,
  max(a.tp_city) tp_city,
  max(b.v_rok) v_rok,
  sum(b.d_ciastzd-b.d_ciastzd2+b.n_poist)  n_brutto,
  sum(b.d_ciastzd) d_ciastzd,
  sum(b.n_poist) n_poist,
  sum(b.o_zdravot) xx_o_zdravot,
  sum(b.n_ddp) n_ddp,
  sum(b.nz_ddp) nz_ddp,
  0 n_ddp_uplat,
  sum(b.dopravne+b.dopravne_mimoriadne) dopravne,
  sum(b.d_preddavok) d_preddavok,
  sum(b.nc_minimum) nc_minimum,
  sum(b.d_bonus_cerpany) d_bonus_cerpany
from vyp b
join zam a
on a.code_emp=b.code_emp
where
  b.v_obdobie between :obdobie1 and :obdobie2 and
  b.dan_vyrovnana=0  and
  a.code_emp between :p1 and :p2 and
  a.sid between :p3 and :p4
group by b.code_emp
order by a.surname,a.name
}

{ OLD SELECT
select
  a.code_emp code_emp,
  max(a.name) name,
  max(a.surname) surname,
  max(a.title) title,
  max(a.born_numb) born_numb,
  max(a.tp_zip) tp_zip,
  max(a.tp_street) tp_street,
  max(a.tp_city) tp_city,
  max(b.v_rok) v_rok,
  sum(b.d_ciastzd-b.d_ciastzd2+b.n_poist)  n_brutto,
  sum(b.d_ciastzd) d_ciastzd,
  sum(b.n_poist) n_poist,
  sum(b.o_zdravot) xx_o_zdravot,
  sum(b.n_ddp) n_ddp,
  sum(b.nz_ddp) nz_ddp,
  0 n_ddp_uplat,
  sum(b.dopravne+b.dopravne_mimoriadne) dopravne,
  sum(b.d_preddavok) d_preddavok,
  sum(b.nc_minimum) nc_minimum,
  sum(b.d_bonus_cerpany) d_bonus_cerpany
from zam a
left outer join vyp b
on a.code_emp=b.code_emp and
  b.v_obdobie between :obdobie1 and :obdobie2 and
  b.dan_vyrovnana=0
where
  a.code_emp between :p1 and :p2
 and
  a.sid between :p3 and :p4 and
  a.code_emp in  (select distinct code_emp from vyp c
                            where c.v_obdobie between :obdobie1 and :obdobie2
                                and c.code_emp is not null)
group by code_emp
order by a.surname,a.name


}

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportPZ2014 = class(TQuickRep)
    Q0_: TQuery;
    Q0_ADR: TStringField;
    Q0_TMP: TStringField;
    QPOM_: TQuery;
    DS0: TDataSource;
    Q0_CALC_MESIACE: TStringField;
    QDET_: TQuery;
    QDET_Priezvisko: TStringField;
    QDET_Meno: TStringField;
    QDET_MES_OD: TSmallintField;
    QDET_MES_DO: TSmallintField;
    Q0_CALC_MES1: TStringField;
    Q0_CALC_MES2: TStringField;
    Q0_CALC_MES3: TStringField;
    Q0_CALC_MES4: TStringField;
    Q0_CALC_MES5: TStringField;
    Q0_CALC_MES6: TStringField;
    Q0_CALC_DIETA1: TStringField;
    Q0_CALC_DIETA2: TStringField;
    Q0_CALC_DIETA3: TStringField;
    Q0_CALC_DIETA4: TStringField;
    Q0_CALC_DIETA5: TStringField;
    Q0_CALC_DIETA6: TStringField;
    QINF_: TQuery;
    QINF_NAZOV: TStringField;
    QINF_ADR_ULICA: TStringField;
    QINF_ADR_MESTO: TStringField;
    QINF_ADR_PSC: TStringField;
    QINF_CALC_ADRESA: TStringField;
    Q0_CALC_NC_INE: TCurrencyField;
    Q0_CALC_MES_NC_MIN: TStringField;
    Q0_CALC_NC1: TCurrencyField;
    Q0_CALC_NC2: TCurrencyField;
    Q0_CALC_NC3: TCurrencyField;
    Q0_CALC_NC4: TCurrencyField;
    Q0_CALC_NC5: TCurrencyField;
    Q0_CALC_NC6: TCurrencyField;
    QINF_DIC: TStringField;
    QDET_DAT_NAR: TDateField;
    QINF_ADR_CISLO: TStringField;
    Q0_CALC_DIETA7: TStringField;
    Q0_CALC_DIETA8: TStringField;
    Q0_CALC_DIETA9: TStringField;
    Q0_CALC_DIETA10: TStringField;
    Q0_CALC_NC7: TCurrencyField;
    Q0_CALC_NC8: TCurrencyField;
    Q0_CALC_NC9: TCurrencyField;
    Q0_CALC_NC10: TCurrencyField;
    Q0_CALC_MES7: TStringField;
    Q0_CALC_MES8: TStringField;
    Q0_CALC_MES9: TStringField;
    Q0_CALC_MES10: TStringField;
    Q0_CALC_BONUS_CELKOM: TCurrencyField;
    Q0_CALC_DDP: TStringField;
    Q0_xx_o_zdravot: TCurrencyField;
    Q00_: TQuery;
    Q00_n_brutto: TCurrencyField;
    Q00_d_ciastzd2: TCurrencyField;
    Q00_n_poist: TCurrencyField;
    Q00_xx_o_zdravot: TCurrencyField;
    Q00_CALC_d_dan: TCurrencyField;
    Q0_CALC_NZ_DDP: TStringField;
    Q0_nz_ddp: TCurrencyField;
    Q0_CALC_R13: TCurrencyField;
    Q0_CALC_R14A: TCurrencyField;
    Q0_CALC_R14B: TCurrencyField;
    Q0_CALC_R15: TCurrencyField;
    Q00_xx_d_dan: TCurrencyField;
    Q00_vyrovnanie_zp: TCurrencyField;
    QBON_: TQuery;
    QBON_d_bonus_cerpany: TCurrencyField;
    QBON_v_mesiac: TSmallintField;
    Q0_CALC_ZDRAVOTNICI: TCurrencyField;
    Q0_PP1: TStringField;
    Q0_PP2: TStringField;
    Q0_PP3: TStringField;
    Q0_PP4: TStringField;
    Q0_PP5: TStringField;
    Q0_PP6: TStringField;
    Q0_PP7: TStringField;
    Q0_PP8: TStringField;
    Q0_PP9: TStringField;
    Q0_PP10: TStringField;
    Q0_PP11: TStringField;
    Q0_PP12: TStringField;
    Q0_PP13: TStringField;
    Q0_DH1: TStringField;
    Q0_DH2: TStringField;
    Q0_DH3: TStringField;
    Q0_DH4: TStringField;
    Q0_DH5: TStringField;
    Q0_DH6: TStringField;
    Q0_DH7: TStringField;
    Q0_DH8: TStringField;
    Q0_DH9: TStringField;
    Q0_DH10: TStringField;
    Q0_DH11: TStringField;
    Q0_DH12: TStringField;
    Q0_DH13: TStringField;
    QPOM1_: TQuery;
    QPOM1_n_brutto: TCurrencyField;
    QPOM1_n_dohody_ovp: TCurrencyField;
    QPOM1_n_dohody_opc: TCurrencyField;
    QPOM1_n_mzda: TCurrencyField;
    QPOM1_v_mesiac: TSmallintField;
    QPOM1_n_zaklad_dp: TCurrencyField;
    DetailBand1: TQRBand;
    QRShape46: TQRShape;
    QRShape71: TQRShape;
    QRLabel60: TQRLabel;
    QRShape7: TQRShape;
    QRLabel32: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape13: TQRShape;
    QRShape38: TQRShape;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape3: TQRShape;
    QRLabel6: TQRLabel;
    QRShape5: TQRShape;
    QRLabel12: TQRLabel;
    QRShape14: TQRShape;
    QRDBText2: TQRDBText;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape21: TQRShape;
    QRLabel21: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QR_Vykaz_zostavil_text: TQRLabel;
    QR_telefon: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape51: TQRShape;
    QRShape53: TQRShape;
    QRDBText9: TQRDBText;
    QR_Vykaz_zostavil: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel76: TQRLabel;
    QR_Vykaz_dna: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel55: TQRLabel;
    QRMemo2: TQRMemo;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape66: TQRShape;
    QRLabel26: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape72: TQRShape;
    QRLabel41: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape55: TQRShape;
    QRDBText24: TQRDBText;
    QRLabel56: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape50: TQRShape;
    QRShape60: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRShape107: TQRShape;
    QRShape108: TQRShape;
    QRShape109: TQRShape;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    QRShape116: TQRShape;
    QRShape117: TQRShape;
    QRMemo4: TQRMemo;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRShape22: TQRShape;
    QRShape37: TQRShape;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRShape39: TQRShape;
    QRDBText34: TQRDBText;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRLabel35: TQRLabel;
    QRShape44: TQRShape;
    QRExpr1: TQRExpr;
    Q0_CALC_DOHODY: TCurrencyField;
    QPOM1_d_ciastzd: TCurrencyField;
    QPOM1_d_ciastzd2: TCurrencyField;
    QPOM1_n_poist: TCurrencyField;
    QRDBText35: TQRDBText;
    QPOM1_typzec: TSmallintField;
    QRLabel46: TQRLabel;
    QRShape220: TQRShape;
    QRShape221: TQRShape;
    QRShape222: TQRShape;
    QRExpr5: TQRExpr;
    Q00_born_numb: TStringField;
    QDET_rc: TStringField;
    QBON_born_numb: TStringField;
    QPOM_born_numb: TStringField;
    QPOM_v_mesiac: TSmallintField;
    Q0_name: TStringField;
    Q0_surname: TStringField;
    Q0_title: TStringField;
    Q0_tp_zip: TStringField;
    Q0_tp_street: TStringField;
    Q0_tp_city: TStringField;
    Q0_v_rok: TSmallintField;
    Q0_n_brutto: TCurrencyField;
    Q0_d_ciastzd: TCurrencyField;
    Q0_n_poist: TCurrencyField;
    Q0_n_ddp: TCurrencyField;
    Q0_n_ddp_uplat: TFloatField;
    Q0_dopravne: TCurrencyField;
    Q0_d_preddavok: TCurrencyField;
    Q0_nc_minimum: TCurrencyField;
    Q0_d_bonus_cerpany: TCurrencyField;
    Q0_born: TStringField;
    QPOM1_born_numb: TStringField;
    QSTITKY_: TQuery;
    QSTITKY_born: TStringField;
    QSTITKY_name: TStringField;
    QSTITKY_surname: TStringField;
    QSTITKY_title: TStringField;
    QSTITKY_tp_zip: TStringField;
    QSTITKY_tp_street: TStringField;
    QSTITKY_tp_city: TStringField;
    QDET_born_numb: TStringField;
    QRShape223: TQRShape;
    QRLabel174: TQRLabel;
    QRShape224: TQRShape;
    QRShape225: TQRShape;
    QRLabel175: TQRLabel;
    QRLabel176: TQRLabel;
    QRLabel177: TQRLabel;
    QRShape226: TQRShape;
    QRLabel48: TQRLabel;
    QRLabel54: TQRLabel;
    QRShape227: TQRShape;
    QRShape228: TQRShape;
    QRShape229: TQRShape;
    QRShape230: TQRShape;
    QRShape231: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel74: TQRLabel;
    QRShape6: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape40: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRDBText117: TQRDBText;
    QRDBText118: TQRDBText;
    QRDBText119: TQRDBText;
    QRDBText120: TQRDBText;
    QRDBText121: TQRDBText;
    QRDBText122: TQRDBText;
    QRShape59: TQRShape;
    QRShape232: TQRShape;
    QRShape233: TQRShape;
    QRShape234: TQRShape;
    QRDBText123: TQRDBText;
    QRDBText124: TQRDBText;
    QRDBText125: TQRDBText;
    QRDBText126: TQRDBText;
    QRShape235: TQRShape;
    QRShape236: TQRShape;
    QRShape237: TQRShape;
    QRShape238: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape54: TQRShape;
    QRLabel14: TQRLabel;
    QRMemo1: TQRMemo;
    QRMemo7: TQRMemo;
    QRShape52: TQRShape;
    QRMemo8: TQRMemo;
    QRMemoObdobie: TQRMemo;
    QRShape70: TQRShape;
    QRLabel9: TQRLabel;
    QRShape239: TQRShape;
    QRLabel11: TQRLabel;
    QRMemo10: TQRMemo;
    QRShape240: TQRShape;
    QRShape241: TQRShape;
    QRShape242: TQRShape;
    QRLabel13: TQRLabel;
    QRMemo11: TQRMemo;
    QRShape45: TQRShape;
    QRShape243: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape244: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText127: TQRDBText;
    QRShape245: TQRShape;
    QRShape246: TQRShape;
    QRShape247: TQRShape;
    QRShape248: TQRShape;
    QRShape249: TQRShape;
    QRShape250: TQRShape;
    QRShape251: TQRShape;
    QRShape252: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText128: TQRDBText;
    QRDBText129: TQRDBText;
    QRDBText130: TQRDBText;
    QRDBText131: TQRDBText;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QINF_CALC_NAZOV_DIC: TStringField;
    Q0_tp_ulica: TStringField;
    Q0_tp_ocislo: TStringField;
    Q0_tp_supcislo: TIntegerField;
    Q0_CALC_TP_CISLO_DOMU: TStringField;
    Q0_stat_tp: TStringField;
    Q0_CALC_STAT_TP: TStringField;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape112: TQRShape;
    QRShape113: TQRShape;
    QR_Miesto: TQRLabel;
    QRShape114: TQRShape;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure QINF_CalcFields(DataSet: TDataSet);
    procedure ReportPZ2014BeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure Q00_CalcFields(DataSet: TDataSet);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    first_preview:boolean;
    pole_bonus:array[1..12] of double;
    pole_bonus_deti:array[1..12] of double;
    pole_mesiace:TMesiace;
    progress_page: longint;
  public
    procedure ShowReport;
  end;

var
  ReportPZ2014: TReportPZ2014;

  procedure RunReportPZ2014(const MyReportParam: TMyReportParam);

implementation

uses DM_sql;

{$R *.DFM}

var X: TMyReportParam;
var PriznakyPP: array[1..12] of boolean;
var PriznakyDH: array[1..12] of boolean;
var SL_BONUS: TStringList;

procedure TReportPZ2014.ShowReport;
var SL: TStringList;
  s: string;
begin
  {try}
  first_preview:=true;
  QRMemoObdobie.Lines[2]:= '             neskorších predpisov (ïalej len „zákon"), za zdaòovacie obdobie '+IntToStr(X.AktObdobie div 100);
  QR_Vykaz_zostavil.Caption := X.Vykaz_zostavil;
  QR_Vykaz_dna.Caption := X.Vykaz_dna;
  QR_Telefon.Caption := X.Telefon;
  QR_Miesto.Caption := X.Vykaz_miesto;
  if X.AktObdobie >= ZAKON_2009_01 then begin
    QRDBText1.Mask := '0.00';
    QRDBText2.Mask := '0.00';
    QRDBText24.Mask := '0.00';
    QRDBText5.Mask := '0.00';
    QRDBText9.Mask := '0.00';
    QRDBText26.Mask := '0.00';
    QRDBText27.Mask := '0.00';
    QRDBText28.Mask := '0.00';
    QRDBText29.Mask := '0.00';
    QRDBText30.Mask := '0.00';
    QRDBText3.Mask := '0.00';
    QRDBText32.Mask := '0.00';
    QRDBText33.Mask := '0.00';
    QRDBText34.Mask := '0.00';
    QRDBText35.Mask := '0.00';
    QRExpr1.Mask := '0.00';
    QRExpr2.Mask := '0.00';
    QRExpr5.Mask := '0.00';
  end else begin
    QRDBText1.Mask := '0';
    QRDBText2.Mask := '0';
    QRDBText24.Mask := '0';
    QRDBText5.Mask := '0';
    QRDBText9.Mask := '0';
    QRDBText26.Mask := '0';
    QRDBText27.Mask := '0';
    QRDBText28.Mask := '0';
    QRDBText29.Mask := '0';
    QRDBText30.Mask := '0';
    QRDBText32.Mask := '0';
    QRDBText3.Mask := '0';
    QRDBText33.Mask := '0';
    QRDBText34.Mask := '0';
    QRDBText35.Mask := '0';
    QRExpr1.Mask := '0';
    QRExpr2.Mask := '0';
    QRExpr5.Mask := '0';
  end;
  QINF_.Close;
  QINF_.Open;
{
  QDDP_.Close;
  QDDP_.ParamByName('OBDOBIE1').AsInteger := (MyRok(X.AktObdobie)-1)*100 + 12;
  QDDP_.ParamByName('OBDOBIE2').AsInteger := (MyRok(X.AktObdobie)+0)*100 + 11;
  QDDP_.Open;
  if (X.AktObdobie >= 200901) and (X.AktObdobie<=200912) then
  begin
  QDDP2008_.Close;
  QDDP2008_.Open;
  end;
}

  QPOM_.Close;
  Q_SET_INT(QPOM_,':obdobie1',(X.AktObdobie div 100)*100 + 1);
  Q_SET_INT(QPOM_,':obdobie2',(X.AktObdobie div 100)*100 + 12);
  QPOM_.Open;

  QPOM1_.Close;
  Q_SET_INT(QPOM1_,':obdobie1',(X.AktObdobie div 100)*100 + 1);
  Q_SET_INT(QPOM1_,':obdobie2',(X.AktObdobie div 100)*100 + 12);
  QPOM1_.Open;

  Q00_.Close;
  Q_SET_INT(Q00_,':obdobie1',(X.AktObdobie div 100)*100 + 1);
  Q_SET_INT(Q00_,':obdobie2',(X.AktObdobie div 100)*100 + 12);
  Q00_.Open;
  QBON_.Close;
  Q_SET_INT(QBON_,':obdobie1',(X.AktObdobie div 100)*100 + 1);
  Q_SET_INT(QBON_,':obdobie2',(X.AktObdobie div 100)*100 + 12);
  QBON_.Open;

  QDET_.Close;
  QDET_.Open;

  Q0_.Close;
  if (x.Code_emp1 = X.Code_emp2) then begin
     s:= 'select born_numb from ":pam98_data:zam" where code_emp='+IntToStr(X.Code_emp1);
     DMSQL.ExecuteSql(s);
     Q_SET(Q0_,'1=1','a.born_numb = '+CHAR(39)+DMSQL.Results[1]+CHAR(39));
  end;
{}
(*
  Q0_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q0_.ParamByName('OBDOBIE1').AsInteger := (X.AktObdobie div 100)*100 + 1;
  Q0_.ParamByName('OBDOBIE2').AsInteger := (X.AktObdobie div 100)*100 + 12;
*)
  Q_SET_INT(Q0_,':p3',X.AktMinSid);
  Q_SET_INT(Q0_,':p4',X.AktMaxSid);
  Q_SET_INT(Q0_,':obdobie1',(X.AktObdobie div 100)*100 + 1);
  Q_SET_INT(Q0_,':obdobie2',(X.AktObdobie div 100)*100 + 12);

  Q0_.Prepare;
  Q0_.Open;

  QSTITKY_.Close;
  Q_SET_INT(QSTITKY_,':p3',X.AktMinSid);
  Q_SET_INT(QSTITKY_,':p4',X.AktMaxSid);
  Q_SET_INT(QSTITKY_,':obdobie1',(X.AktObdobie div 100)*100 + 1);
  Q_SET_INT(QSTITKY_,':obdobie2',(X.AktObdobie div 100)*100 + 12);

  if (Q0_.Active) and (Q0_.RecordCount>0) and (Q0_Born.AsString<>'') then Preview
  else begin MyError(SMyAppReportIsEmpty); exit; end;


  SL := TStringList.Create;
  SL.Add('Zoznam adries pre zaslanie potvrdení o zdanite¾nej mzde');
  SL.Add('Meno;Priezvisko;Titul;Ulica;Mesto;PSC;');

  if X.Code_emp1 <> X.Code_emp2 then if MyOtazka(SMyAppGenerovatAdresneStitky) then begin
    QSTITKY_.Open;
    progress_page := 1;

    while not QSTITKY_.EOF do begin
      progress_page := progress_page + 1;
      Progress(Trunc(progress_page/QSTITKY_.RecordCount*100));
      SL.Add(QSTITKY_Name.Value+';'+
             QSTITKY_Surname.Value+';'+
             QSTITKY_Title.Value+';'+
             QSTITKY_Tp_street.Value+';'+
             QSTITKY_Tp_city.Value+';'+
             QSTITKY_Tp_zip.Value+';'
             );
      QSTITKY_.Next;
    end;
    SL.SaveToFile(MyRepPath1 + MenoTlacPZ + IntToStr(X.AktSid) + '.csv');
    SL.Clear;
    Progress(100);
    QSTITKY_.Close;
    MyMessage(Format(SMyAppAdresneStitkyHotovo,[MenoTlacPZ + IntToStr(X.AktSid) + '.csv',MyRepPath1]));
  end;

  if SL_BONUS.Count > 0 then begin
    SL_BONUS.SaveToFile(MyRepPath1 + MenoTlacPZ_Bonus + IntToStr(X.AktSid) + '.csv');
    SL_BONUS.Clear;
    MyMessage(Format(SMyAppKontrolaBonusuHotovo,[MenoTlacPZ_Bonus + IntToStr(X.AktSid) + '.csv',MyRepPath1]));
  end;
try
  finally
  SL.Free;
{
  QDDP2008_.Close;
  QDDP_.Close;
}
  QINF_.Close;
  Q0_.Close;
  QBON_.Close;
  Q00_.Close;
  QPOM1_.Close;
  QPOM_.Close;
  QDET_.Close;
  end;
end;

procedure TReportPZ2014.Q0_CalcFields(DataSet: TDataSet);
var i,j,jj,pp99,dh99:byte;
    bonus_dieta,bonus_vypocet,bonus_check,ddp,dh99suma: double;
    mesiace_vypocet,numfrm,PPXX,DHXX: string;
procedure Vrat_Priznaky(var PP:string; var DH:string);
begin
  PP:='';
  DH:='';
  if (QPOM1_n_dohody_ovp.Value > 0) or (QPOM1_n_dohody_opc.Value > 0) then
  begin
    DH:='X';
    inc(DH99);
  end;
  if (QPOM1_N_mzda.Value > 0) and (QPOM1_N_zaklad_dp.Value>0) then
  begin
    PP:='X';
    inc(PP99);
  end
  else if (QPOM1_N_mzda.Value > 0) and (QPOM1_N_zaklad_dp.Value = 0) then
  begin
    DH:='X';
    inc(DH99);
  end;
end;
function TOX(b:boolean):string;
begin
  if b then Result := 'X' else Result := '';
end;
function bonus_dieta_celkom(nMesOd,nMesDo:integer;nBonusDieta:double):double;
var xxx,hhh:double;i,j:integer;
begin
  for j:=1 to 12 do pole_mesiace[j]:=0;
  if (X.AktObdobie div 100)=2005 then {--specialita pre rok 2005}
  begin
    xxx:=0;
    for i:=nMesOd to nMesDo do
      if i<=8 then xxx:=xxx+400 else xxx:=xxx+450;
    bonus_dieta_celkom:= xxx;
  end
  else
  if (X.AktObdobie div 100)=2007 then {--specialita pre rok 2007}
  begin
    xxx:=0;
    for i:=nMesOd to nMesDo do
    begin
      if (i<1) or (i>12) then continue;
      if i<=6 then hhh:=540 else hhh:=555;
      if pole_bonus[i]>0 then begin
        if pole_bonus[i]<hhh then hhh:=pole_bonus[i];
        xxx:=xxx+hhh;
        pole_bonus[i]:=pole_bonus[i]-hhh;
        pole_mesiace[i]:=1;
      end;
    end;
    bonus_dieta_celkom:= xxx;
  end else
  if (X.AktObdobie div 100)>2007 then {--standard pre roky > 2007}
  begin
    xxx:=0;
    for i:=nMesOd to nMesDo do
    begin
      if (i<1) or (i>12) then continue;
      hhh:=PARAMETRE_M[28,i].Hodnota;
      xxx:=xxx+hhh;
      pole_mesiace[i]:=1;
      pole_bonus_deti[i] := pole_bonus_deti[i] + hhh;
    end;
    bonus_dieta_celkom:= xxx;
  end
  else
  begin
    bonus_dieta_celkom:= (nMesDo-nMesOd+1)* nBonusDieta
  end;
end;

begin

  {--Napln cislo domu pre TRVALY POBYT--}
  if (Q0_Tp_ocislo.Value<>'') and (Q0_Tp_supcislo.AsString<>'')  then
    Q0_CALC_TP_CISLO_DOMU.Value := Q0_Tp_supcislo.AsString + '/' + Q0_Tp_ocislo.Value
  else if (Q0_Tp_ocislo.Value<>'') and (Q0_Tp_supcislo.AsString='') then
    Q0_CALC_TP_CISLO_DOMU.Value := Q0_Tp_ocislo.Value
  else if (Q0_Tp_ocislo.Value='') and (Q0_Tp_supcislo.AsString<>'')  then
    Q0_CALC_TP_CISLO_DOMU.Value := Q0_Tp_supcislo.AsString
  else
    Q0_CALC_TP_CISLO_DOMU.Value := '';
  {--Pokracuj--}
  Q0_CALC_ZDRAVOTNICI.Value := 0;
  if Q0_V_rok.Value >= 2009 then numfrm:='%0.2f' else numfrm:='%0.0f';
  QBON_.Filtered := False;
  QBON_.Filter := 'born_numb='+Q0_Born.AsString;
  QBON_.Filtered := True;
{
  QDDP_.Filtered := False;
  QDDP_.Filter := 'code_emp='+Q0_Code_emp.AsString;
  QDDP_.Filtered := True;
  QDDP2008_.Filtered := False;
  QDDP2008_.Filter := 'code_emp='+Q0_Code_emp.AsString;
  QDDP2008_.Filtered := True;
  ddp:=0;
  if QDDP_n_ddp.AsString<>'' then ddp:=ddp+QDDP_n_ddp.Value;
  if (QDDP2008_n_ddp.AsString<>'') and (Q0_V_rok.Value=2009) then ddp:=ddp+KonverziaSKK_EUR_nahor(QDDP2008_n_ddp.Value);
  if Trim(X.Nc_ine2)<>''
  then Q0_CALC_DDP.Value := StrReplaceX(Trim(X.Nc_ine2),'.',',')
  else if ddp>0
    then Q0_CALC_DDP.Value := Format(numfrm,[ddp])
   else Q0_CALC_DDP.Value := '';

  if Trim(X.YY[1])<>''
  then Q0_CALC_NZ_DDP.Value := Trim(X.YY[1])
  else if Q0_nz_ddp.AsString<>''
    then Q0_CALC_NZ_DDP.Value := Format(numfrm,[Q0_nz_ddp.Value])
  else Q0_CALC_NZ_DDP.Value := '0';
}
  Q0_CALC_NC_INE.Value := X.Nc_ine;

  Q0_TMP.Value:= Copy(
    Trim(Q0_Title.Value)+' '+
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value),1,100);

  if Q0_tp_street.Value <> ''
  then Q0_ADR.Value := Q0_tp_street.Value + ', ' + Q0_tp_city.Value
  else Q0_ADR.Value := Q0_tp_city.Value;

  Q0_CALC_MESIACE.Value:='';
  Q0_CALC_MES_NC_MIN.Value:='';
  (*
  try
  QPOM_.Close;
  QPOM_.ParamByName('OBDOBIE1').AsInteger := (X.AktObdobie div 100)*100 + 1;
  QPOM_.ParamByName('OBDOBIE2').AsInteger := (X.AktObdobie div 100)*100 + 12;
*)
  QPOM_.Filtered := false;
  QPOM_.Filter := 'born_numb='+Q0_Born.Value;
  QPOM_.Filtered := true;
  QPOM_.First;
{  QPOM_.Open;}
  while not QPOM_.EOF do begin
    Q0_CALC_MESIACE.Value :=
      Q0_CALC_MESIACE.Value + QPOM_V_Mesiac.AsString;
    if Q0_NC_MINIMUM.Value > 0 then
      Q0_CALC_MES_NC_MIN.Value :=
        Q0_CALC_MES_NC_MIN.Value + QPOM_V_Mesiac.AsString;
    QPOM_.Next;
    if NOT QPOM_.EOF then
      Q0_CALC_MESIACE.Value := Q0_CALC_MESIACE.Value + ',';
    if NOT QPOM_.EOF AND (Q0_NC_MINIMUM.Value > 0) then
      Q0_CALC_MES_NC_MIN.Value := Q0_CALC_MES_NC_MIN.Value + ',';
  end;
{  except end;
   QPOM_.Close;}

  if Q0_CALC_MESIACE.Value = '1,2,3,4,5,6,7,8,9,10,11,12'
   then Q0_CALC_MESIACE.Value := '          1 - 12';
  if Q0_CALC_MES_NC_MIN.Value = '1,2,3,4,5,6,7,8,9,10,11,12'
   then Q0_CALC_MES_NC_MIN.Value := '          1 - 12';
  for i:=1 to 12 do pole_bonus[i]:=0;
  QBON_.First;
  while not QBON_.EOF do begin
    if (QBON_V_mesiac.Value>=1)and (QBON_V_mesiac.Value<=12)
      then pole_bonus[QBON_V_mesiac.Value]:=QBON_D_bonus_cerpany.Value;
    QBON_.Next;
  end;

  for i:=1 to 12 do pole_bonus_deti[i]:=0;
  QDET_.Filtered := false;
  QDET_.Filter := 'born_numb='+Q0_Born.Value;
  QDET_.Filtered := true;
  QDET_.First;
  Q0_CALC_BONUS_CELKOM.Value:=0;
  for i:=1 to 10 do begin
    if QDET_.EOF then break;
    bonus_dieta := PARAMETRE[28].Hodnota;
    bonus_vypocet:=bonus_dieta_celkom(QDET_MES_OD.Value,QDET_MES_DO.Value,bonus_dieta);
    mesiace_vypocet:=VratMesiace(pole_mesiace);
    if mesiace_vypocet = '1,2,3,4,5,6,7,8,9,10,11,12'
     then mesiace_vypocet := '          1 - 12';
    Q0_CALC_BONUS_CELKOM.Value:=
      Q0_CALC_BONUS_CELKOM.Value + bonus_vypocet;

    case i of
    1:begin
      Q0_CALC_MES1.Value := mesiace_vypocet;
      Q0_CALC_DIETA1.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC1.Value := bonus_vypocet;
      end;
    2:begin
      Q0_CALC_MES2.Value := mesiace_vypocet;
      Q0_CALC_DIETA2.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC2.Value := bonus_vypocet;
      end;
    3:begin
      Q0_CALC_MES3.Value := mesiace_vypocet;
      Q0_CALC_DIETA3.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC3.Value := bonus_vypocet;

      end;
    4:begin
      Q0_CALC_MES4.Value := mesiace_vypocet;
      Q0_CALC_DIETA4.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC4.Value := bonus_vypocet;

      end;
    5:begin
      Q0_CALC_MES5.Value := mesiace_vypocet;
      Q0_CALC_DIETA5.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC5.Value := bonus_vypocet;

      end;
    6:begin
      Q0_CALC_MES6.Value := mesiace_vypocet;
      Q0_CALC_DIETA6.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC6.Value := bonus_vypocet;
      end;
    7:begin
      Q0_CALC_MES7.Value := mesiace_vypocet;
      Q0_CALC_DIETA7.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC7.Value := bonus_vypocet;
      end;
    8:begin
      Q0_CALC_MES8.Value := mesiace_vypocet;
      Q0_CALC_DIETA8.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC8.Value := bonus_vypocet;
      end;
    9:begin
      Q0_CALC_MES9.Value := mesiace_vypocet;
      Q0_CALC_DIETA9.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC9.Value := bonus_vypocet;
      end;
   10:begin
      Q0_CALC_MES10.Value := mesiace_vypocet;
      Q0_CALC_DIETA10.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC10.Value := bonus_vypocet;
      end;
    end;
    QDET_.Next;
  end;

  QPOM1_.Filtered := false;
  QPOM1_.Filter := 'born_numb = '+Q0_Born.Value;
  QPOM1_.Filtered := true;
  QPOM1_.First;
  {try
  QPOM1_.Close;
  QPOM1_.ParamByName('OBDOBIE1').AsInteger := (X.AktObdobie div 100)*100 + 1;
  QPOM1_.ParamByName('OBDOBIE2').AsInteger := (X.AktObdobie div 100)*100 + 12;
  QPOM1_.Open;}
  pp99:=0;dh99:=0;dh99suma:=0;
  Q0_CALC_DOHODY.Value := 0;
  for i:=1 to 12 do begin
    PriznakyPP[i] := false;
    PriznakyDH[i] := false;
  end;

  while not QPOM1_.EOF do begin
    if QPOM1_Typzec.Value in [2,10,11,12,13,14,15,16,17,18,19] then begin
      PriznakyDH[QPOM1_V_mesiac.Value] := true;
      Q0_CALC_DOHODY.Value := Q0_CALC_DOHODY.Value + QPOM1_D_ciastzd.Value + QPOM1_D_ciastzd2.Value + QPOM1_N_poist.Value;
    end else PriznakyPP[QPOM1_V_mesiac.Value] := true;
    QPOM1_.Next;
  end;
  {except end; }
  for i:=1 to 12 do begin
    if PriznakyPP[i] then inc(pp99);
    if PriznakyDH[i] then inc(dh99);
    case i of
      1:begin Q0_PP1.Value:=TOX(PriznakyPP[i]); Q0_DH1.Value:=TOX(PriznakyDH[i]);  end;
      2:begin Q0_PP2.Value:=TOX(PriznakyPP[i]); Q0_DH2.Value:=TOX(PriznakyDH[i]);  end;
      3:begin Q0_PP3.Value:=TOX(PriznakyPP[i]); Q0_DH3.Value:=TOX(PriznakyDH[i]);  end;
      4:begin Q0_PP4.Value:=TOX(PriznakyPP[i]); Q0_DH4.Value:=TOX(PriznakyDH[i]);  end;
      5:begin Q0_PP5.Value:=TOX(PriznakyPP[i]); Q0_DH5.Value:=TOX(PriznakyDH[i]);  end;
      6:begin Q0_PP6.Value:=TOX(PriznakyPP[i]); Q0_DH6.Value:=TOX(PriznakyDH[i]);  end;
      7:begin Q0_PP7.Value:=TOX(PriznakyPP[i]); Q0_DH7.Value:=TOX(PriznakyDH[i]);  end;
      8:begin Q0_PP8.Value:=TOX(PriznakyPP[i]); Q0_DH8.Value:=TOX(PriznakyDH[i]);  end;
      9:begin Q0_PP9.Value:=TOX(PriznakyPP[i]); Q0_DH9.Value:=TOX(PriznakyDH[i]);  end;
     10:begin Q0_PP10.Value:=TOX(PriznakyPP[i]); Q0_DH10.Value:=TOX(PriznakyDH[i]);  end;
     11:begin Q0_PP11.Value:=TOX(PriznakyPP[i]); Q0_DH11.Value:=TOX(PriznakyDH[i]);  end;
     12:begin Q0_PP12.Value:=TOX(PriznakyPP[i]); Q0_DH12.Value:=TOX(PriznakyDH[i]);  end;
    end;
  end;
  {QPOM1_.Close;}
  if pp99=12 then begin
   Q0_PP1.Value:='';Q0_PP2.Value:='';Q0_PP3.Value:='';Q0_PP4.Value:='';
   Q0_PP5.Value:='';Q0_PP6.Value:='';Q0_PP7.Value:='';Q0_PP8.Value:='';
   Q0_PP9.Value:='';Q0_PP10.Value:='';Q0_PP11.Value:='';Q0_PP12.Value:='';
   Q0_PP13.Value := 'X';
  end;
  if dh99=12 then begin
   Q0_DH1.Value:='';Q0_DH2.Value:='';Q0_DH3.Value:='';Q0_DH4.Value:='';
   Q0_DH5.Value:='';Q0_DH6.Value:='';Q0_DH7.Value:='';Q0_DH8.Value:='';
   Q0_DH9.Value:='';Q0_DH10.Value:='';Q0_DH11.Value:='';Q0_DH12.Value:='';
   Q0_DH13.Value := 'X';
  end;
  {--}
  Q00_.Filtered := False;
  Q00_.Filter := 'born_numb='+Q0_Born.AsString;
  Q00_.Filtered := True;
  Q0_CALC_R13.Value := Q00_n_brutto.Value;
  if (MyRok(X.AktObdobie)=2006) and (Q00_vyrovnanie_zp.Value>0)
   then Q0_CALC_R13.Value := Q0_CALC_R13.Value + Q00_vyrovnanie_zp.Value;
  Q0_CALC_R14A.Value := Q00_n_poist.Value;
  Q0_CALC_R14B.Value := Q00_xx_o_zdravot.Value;
  Q0_CALC_R15.Value := Q00_xx_d_dan.Value;
  Q00_.Filtered := False;
{
  QDDP_.Filtered := False;
  QDDP2008_.Filtered := False;
}
  if MyRok(X.AktObdobie)>=2007 then
  begin
    Bonus_Check:=0;
    for i:=1 to 12 do if pole_bonus[i]<>pole_bonus_deti[i] then
      SL_Bonus.Add(Format(SMyBonusNesuhlasi,[Q0_TMP.Value,i,pole_bonus_deti[i],pole_bonus[i]
      ]));
  end;
end;

procedure RunReportPZ2014(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportPZ2014:=TReportPZ2014.Create(Application);
    if X.DisableShape then QRDisableShape(ReportPZ2014);
    if X.DisableLabel then QRDisableLabel(ReportPZ2014);
    Screen.Cursor:=crDefault;
    ReportPZ2014.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportPZ2014.Free;
  end;
end;

procedure TReportPZ2014.QINF_CalcFields(DataSet: TDataSet);
begin
  QINF_CALC_NAZOV_DIC.Value :=
    QINF_Nazov.Value+' / '+ QINF_DIC.Value;
  QINF_CALC_ADRESA.Value :=
    MyAdresa(
    QINF_adr_ulica.Value,
    QINF_adr_cislo.Value,
    QINF_adr_psc.Value,
    QINF_adr_mesto.Value );
end;

procedure TReportPZ2014.ReportPZ2014BeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
 progress_page := 0;
 if first_preview then begin
   first_preview := False;
   QRSetShapeWidth(Sender,2)
 end else
   QRSetShapeWidth(Sender,6);
end;

procedure TReportPZ2014.Q00_CalcFields(DataSet: TDataSet);
begin
  if Q00_D_ciastzd2.AsString<>'' then
  Q00_Calc_d_dan.Value := ZAOKRUHLI (
    Q00_D_ciastzd2.Value * 0.19, 0,0)
  else
  Q00_Calc_d_dan.Value := 0;
end;

procedure TReportPZ2014.DetailBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  progress_page := progress_page + 1;
  Progress(Trunc(progress_page/Q0_.RecordCount*100));
end;





















































































initialization

SL_BONUS := TStringList.Create;
SL_BONUS.Sorted := true;
SL_BONUS.Duplicates := dupIgnore;

finalization

SL_Bonus.Free;


end.
