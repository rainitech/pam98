unit PZ2012;

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
  TReportPZ2012 = class(TQuickRep)
    Q0_: TQuery;
    Q0_ADR: TStringField;
    Q0_TMP: TStringField;
    Q0_Name: TStringField;
    Q0_Surname: TStringField;
    Q0_Title: TStringField;
    Q0_born_numb: TStringField;
    Q0_tp_street: TStringField;
    Q0_tp_city: TStringField;
    Q0_tp_zip: TStringField;
    Q0_n_poist: TCurrencyField;
    Q0_dopravne: TCurrencyField;
    Q0_d_preddavok: TCurrencyField;
    Q0_n_brutto: TCurrencyField;
    Q0_d_ciastzd: TCurrencyField;
    QPOM_: TQuery;
    DS0: TDataSource;
    QPOM_v_mesiac: TSmallintField;
    Q0_CALC_MESIACE: TStringField;
    Q0_v_rok: TSmallintField;
    QDET_: TQuery;
    QDET_DID: TIntegerField;
    QDET_Priezvisko: TStringField;
    QDET_Meno: TStringField;
    QDET_nc: TBooleanField;
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
    QDET_code_emp: TIntegerField;
    QINF_: TQuery;
    QINF_NAZOV: TStringField;
    QINF_ADR_ULICA: TStringField;
    QINF_ADR_MESTO: TStringField;
    QINF_ADR_PSC: TStringField;
    QINF_CALC_ADRESA: TStringField;
    Q0_n_ddp: TCurrencyField;
    Q0_CALC_NC_INE: TCurrencyField;
    Q0_nc_minimum: TCurrencyField;
    Q0_CALC_MES_NC_MIN: TStringField;
    Q0_CALC_NC1: TCurrencyField;
    Q0_CALC_NC2: TCurrencyField;
    Q0_CALC_NC3: TCurrencyField;
    Q0_CALC_NC4: TCurrencyField;
    Q0_CALC_NC5: TCurrencyField;
    Q0_CALC_NC6: TCurrencyField;
    QDET_ZTP: TBooleanField;
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
    Q0_n_ddp_uplat: TFloatField;
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
    Q00_code_emp: TIntegerField;
    Q00_xx_d_dan: TCurrencyField;
    Q00_vyrovnanie_zp: TCurrencyField;
    QBON_: TQuery;
    QBON_d_bonus_cerpany: TCurrencyField;
    QBON_code_emp: TIntegerField;
    QBON_v_mesiac: TSmallintField;
    Q0_code_emp: TIntegerField;
    Q0_d_bonus_cerpany: TCurrencyField;
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
    QRShape6: TQRShape;
    QRShape46: TQRShape;
    QRShape54: TQRShape;
    QRLabel16: TQRLabel;
    QRShape71: TQRShape;
    QRLabel60: TQRLabel;
    QRShape7: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRL_obdobie: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
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
    QRLabel54: TQRLabel;
    QR_Vykaz_zostavil_text: TQRLabel;
    QR_telefon: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape51: TQRShape;
    QRShape53: TQRShape;
    QRShape70: TQRShape;
    QRLabel62: TQRLabel;
    QRShape52: TQRShape;
    QRDBText9: TQRDBText;
    QRDBText25: TQRDBText;
    QR_Vykaz_zostavil: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel73: TQRLabel;
    QR_Vykaz_dna: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape4: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel24: TQRLabel;
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
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape72: TQRShape;
    QRLabel42: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape55: TQRShape;
    QRDBText24: TQRDBText;
    QRLabel56: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel30: TQRLabel;
    QRMemo1: TQRMemo;
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
    QRShape112: TQRShape;
    QRShape113: TQRShape;
    QRShape114: TQRShape;
    QRShape115: TQRShape;
    QRShape116: TQRShape;
    QRShape117: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    QRMemo4: TQRMemo;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel74: TQRLabel;
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
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRShape22: TQRShape;
    QRShape37: TQRShape;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRShape39: TQRShape;
    QRDBText34: TQRDBText;
    QRShape40: TQRShape;
    QRLabel10: TQRLabel;
    QRShape41: TQRShape;
    QRLabel31: TQRLabel;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRLabel35: TQRLabel;
    QRShape44: TQRShape;
    QRExpr1: TQRExpr;
    QRShape45: TQRShape;
    QRLabel15: TQRLabel;
    Q0_CALC_DOHODY: TCurrencyField;
    QPOM1_d_ciastzd: TCurrencyField;
    QPOM1_d_ciastzd2: TCurrencyField;
    QPOM1_n_poist: TCurrencyField;
    QRDBText35: TQRDBText;
    QRLabel43: TQRLabel;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure QINF_CalcFields(DataSet: TDataSet);
    procedure ReportPZ2012BeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure Q00_CalcFields(DataSet: TDataSet);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    first_preview:boolean;
    pole_bonus:array[1..12] of double;
    pole_mesiace:TMesiace;
    progress_page: longint;
  public
    procedure ShowReport;
  end;

var
  ReportPZ2012: TReportPZ2012;

  procedure RunReportPZ2012(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportPZ2012.ShowReport;
var SL: TStringList;
begin
  try
  first_preview:=true;
  QRL_obdobie.Caption:=IntToStr(X.AktObdobie div 100);
  QR_Vykaz_zostavil.Caption := X.Vykaz_zostavil;
  QR_Vykaz_dna.Caption := X.Vykaz_dna;
  QR_Telefon.Caption := X.Telefon;
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
  Q00_.Close;
  Q00_.ParamByName('OBDOBIE1').AsInteger := (X.AktObdobie div 100)*100 + 1;
  Q00_.ParamByName('OBDOBIE2').AsInteger := (X.AktObdobie div 100)*100 + 12;
  Q00_.Open;
  QBON_.Close;
  QBON_.ParamByName('OBDOBIE1').AsInteger := (X.AktObdobie div 100)*100 + 1;
  QBON_.ParamByName('OBDOBIE2').AsInteger := (X.AktObdobie div 100)*100 + 12;
  QBON_.Open;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.Code_emp1;
  Q0_.ParamByName('P2').AsInteger := X.Code_emp2;
  Q0_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q0_.ParamByName('OBDOBIE1').AsInteger := (X.AktObdobie div 100)*100 + 1;
  Q0_.ParamByName('OBDOBIE2').AsInteger := (X.AktObdobie div 100)*100 + 12;
  Q0_.Open;
  if (Q0_.Active) and (Q0_.RecordCount>0) and (Q0_Code_emp.AsString<>'') then Preview
  else MyError(SMyAppReportIsEmpty);
  SL := TStringList.Create;
  SL.Add('Zoznam adries pre zaslanie potvrdení o zdanite¾nej mzde');
  SL.Add('Meno;Priezvisko;Titul;Ulica;Mesto;PSC;');
  Q0_.First;
  while not Q0_.EOF do begin
    SL.Add(Q0_Name.Value+';'+
           Q0_Surname.Value+';'+
           Q0_Title.Value+';'+
           Q0_Tp_street.Value+';'+
           Q0_Tp_city.Value+';'+
           Q0_Tp_zip.Value+';'
           );
    Q0_.Next;
  end;
  SL.SaveToFile(MyRepPath1 + MenoTlacPZ + IntToStr(X.AktSid) + '.csv');
  finally
  SL.Free;
{
  QDDP2008_.Close;
  QDDP_.Close;
}
  QINF_.Close;
  QBON_.Close;
  Q00_.Close;
  Q0_.Close;
  end;
end;

procedure TReportPZ2012.Q0_CalcFields(DataSet: TDataSet);
var i,j,pp99,dh99:byte;
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
      hhh:=PARAMETRE_M[28,i].Hodnota;
      if pole_bonus[i]>0 then begin
        if pole_bonus[i]<hhh then hhh:=pole_bonus[i];
        xxx:=xxx+hhh;
        pole_bonus[i]:=pole_bonus[i]-hhh;
        pole_mesiace[i]:=1;
      end;
    end;
    bonus_dieta_celkom:= xxx;
  end
  else
  begin
    bonus_dieta_celkom:= (nMesDo-nMesOd+1)* nBonusDieta
  end;
end;

begin
  Q0_CALC_ZDRAVOTNICI.Value := 0;
  if Q0_V_rok.Value >= 2009 then numfrm:='%0.2f' else numfrm:='%0.0f';
  QBON_.Filtered := False;
  QBON_.Filter := 'code_emp='+Q0_Code_emp.AsString;
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
  try
  QPOM_.Close;
  QPOM_.ParamByName('OBDOBIE1').AsInteger := (X.AktObdobie div 100)*100 + 1;
  QPOM_.ParamByName('OBDOBIE2').AsInteger := (X.AktObdobie div 100)*100 + 12;
  QPOM_.Open;
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
  except end;
  QPOM_.Close;

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

  try
  QDET_.Close;
  QDET_.Open;
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
  QDET_.Close;
  except end;
  try
  QPOM1_.Close;
  QPOM1_.ParamByName('OBDOBIE1').AsInteger := (X.AktObdobie div 100)*100 + 1;
  QPOM1_.ParamByName('OBDOBIE2').AsInteger := (X.AktObdobie div 100)*100 + 12;
  QPOM1_.Open;
  pp99:=0;dh99:=0;dh99suma:=0;
  while not QPOM1_.EOF do begin
    if QPOM1_N_zaklad_dp.Value > 0
      then dh99suma := dh99suma + QPOM1_N_dohody_ovp.Value +  QPOM1_N_dohody_opc.Value
      else dh99suma := dh99suma + QPOM1_D_ciastzd.Value + QPOM1_N_poist.Value;
    case QPOM1_v_mesiac.Value of
      1:begin Vrat_Priznaky(PPXX,DHXX); Q0_PP1.Value:=PPXX; Q0_DH1.Value:=DHXX;end;
      2:begin Vrat_Priznaky(PPXX,DHXX); Q0_PP2.Value:=PPXX; Q0_DH2.Value:=DHXX;end;
      3:begin Vrat_Priznaky(PPXX,DHXX); Q0_PP3.Value:=PPXX; Q0_DH3.Value:=DHXX;end;
      4:begin Vrat_Priznaky(PPXX,DHXX); Q0_PP4.Value:=PPXX; Q0_DH4.Value:=DHXX;end;
      5:begin Vrat_Priznaky(PPXX,DHXX); Q0_PP5.Value:=PPXX; Q0_DH5.Value:=DHXX;end;
      6:begin Vrat_Priznaky(PPXX,DHXX); Q0_PP6.Value:=PPXX; Q0_DH6.Value:=DHXX;end;
      7:begin Vrat_Priznaky(PPXX,DHXX); Q0_PP7.Value:=PPXX; Q0_DH7.Value:=DHXX;end;
      8:begin Vrat_Priznaky(PPXX,DHXX); Q0_PP8.Value:=PPXX; Q0_DH8.Value:=DHXX;end;
      9:begin Vrat_Priznaky(PPXX,DHXX); Q0_PP9.Value:=PPXX; Q0_DH9.Value:=DHXX;end;
      10:begin Vrat_Priznaky(PPXX,DHXX); Q0_PP10.Value:=PPXX; Q0_DH10.Value:=DHXX;end;
      11:begin Vrat_Priznaky(PPXX,DHXX); Q0_PP11.Value:=PPXX; Q0_DH11.Value:=DHXX;end;
      12:begin Vrat_Priznaky(PPXX,DHXX); Q0_PP12.Value:=PPXX; Q0_DH12.Value:=DHXX;end;
    end;
    QPOM1_.Next;
  end;
  except end;
  Q0_CALC_DOHODY.Value := dh99suma;
  QPOM1_.Close;
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
  Q00_.Filter := 'code_emp='+Q0_Code_emp.AsString;
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
    for i:=1 to 12 do Bonus_Check:=Bonus_Check+pole_bonus[i];
    if Bonus_Check<>0 then
      MyError(Format(SMyBonusNesuhlasi,[Q0_TMP.Value]));
  end;
end;

procedure RunReportPZ2012(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportPZ2012:=TReportPZ2012.Create(Application);
    if X.DisableShape then QRDisableShape(ReportPZ2012);
    if X.DisableLabel then QRDisableLabel(ReportPZ2012);
    Screen.Cursor:=crDefault;
    ReportPZ2012.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportPZ2012.Free;
  end;
end;

procedure TReportPZ2012.QINF_CalcFields(DataSet: TDataSet);
begin
  QINF_CALC_ADRESA.Value :=
    'DIÈ: '+QINF_DIC.Value+#13#10+QINF_Nazov.Value+','+
    MyAdresa(
    QINF_adr_ulica.Value,
    QINF_adr_cislo.Value,
    QINF_adr_psc.Value,
    QINF_adr_mesto.Value );
end;

procedure TReportPZ2012.ReportPZ2012BeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
 progress_page := 0;
 if first_preview then begin
   first_preview := False;
   QRSetShapeWidth(Sender,2)
 end else
   QRSetShapeWidth(Sender,6);
end;

procedure TReportPZ2012.Q00_CalcFields(DataSet: TDataSet);
begin
  if Q00_D_ciastzd2.AsString<>'' then
  Q00_Calc_d_dan.Value := ZAOKRUHLI (
    Q00_D_ciastzd2.Value * 0.19, 0,0)
  else
  Q00_Calc_d_dan.Value := 0;
end;

procedure TReportPZ2012.DetailBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  progress_page := progress_page + 1;
  Progress(Trunc(progress_page/Q0_.RecordCount*100));
end;







end.
