unit REXSPV;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportSPV = class(TQuickRep)
    Q0_: TQuery;
    DS0: TDataSource;
    DetailBand1: TQRBand;
    GroupFooterBand1: TQRBand;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRLabel14: TQRLabel;
    Q0_Code_emp: TIntegerField;
    Q0_v_obdobie: TIntegerField;
    Q0_sid: TSmallintField;
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
    Q0_F_dan_sadzba1: TFloatField;
    Q0_F_dan_maximum1: TCurrencyField;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText11: TQRDBText;
    QRShape12: TQRShape;
    QRShape11: TQRShape;
    QRShape10: TQRShape;
    QRLabel9: TQRLabel;
    QRShape8: TQRShape;
    QRShape7: TQRShape;
    QRShape6: TQRShape;
    QRShape5: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape20: TQRShape;
    QRShape19: TQRShape;
    QRShape18: TQRShape;
    QRLabel13: TQRLabel;
    QRShape16: TQRShape;
    QRShape15: TQRShape;
    QRShape22: TQRShape;
    QRLabel11: TQRLabel;
    QRShape21: TQRShape;
    QRLabel10: TQRLabel;
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape28: TQRShape;
    QRLabel18: TQRLabel;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel20: TQRLabel;
    L1: TQRLabel;
    L2: TQRLabel;
    L3: TQRLabel;
    L4: TQRLabel;
    L5: TQRLabel;
    L6: TQRLabel;
    V1: TQRLabel;
    V2: TQRLabel;
    V3: TQRLabel;
    V4: TQRLabel;
    V5: TQRLabel;
    V6: TQRLabel;
    V7: TQRLabel;
    Q1_: TQuery;
    Q1_CALC_OBDOBIE: TStringField;
    Q1_CALC_FIRMA: TStringField;
    Q0_V_den: TFloatField;
    Q0_N_zaklad_dp: TCurrencyField;
    Q0_N_zaklad_np: TCurrencyField;
    Q0_ZPS1: TBooleanField;
    Q0_N_pn: TCurrencyField;
    Q0_Nd_rodic: TCurrencyField;
    QRShape9: TQRShape;
    QRShape17: TQRShape;
    QRShape25: TQRShape;
    QRShape29: TQRShape;
    QRLabel8: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape43: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape42: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape75: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape86: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape87: TQRShape;
    QRShape89: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    A1: TQRLabel;
    A2: TQRLabel;
    B1: TQRLabel;
    B2: TQRLabel;
    C1: TQRLabel;
    C2: TQRLabel;
    G1A: TQRLabel;
    G2: TQRLabel;
    I1: TQRLabel;
    I2: TQRLabel;
    QRLabel45: TQRLabel;
    QRShape71: TQRShape;
    QRShape76: TQRShape;
    QRLabel46: TQRLabel;
    QRShape84: TQRShape;
    J1: TQRLabel;
    QRShape85: TQRShape;
    J2: TQRLabel;
    K2: TQRLabel;
    X2: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    Q1_NAZOV: TStringField;
    Q1_ADR_ULICA: TStringField;
    Q1_ADR_MESTO: TStringField;
    Q1_ADR_PSC: TStringField;
    Q1_ICO: TStringField;
    Q1_PREDCISLO_U: TStringField;
    Q1_CISLO_U: TStringField;
    Q1_BANKA_U: TStringField;
    Q1_CALC_CISLO_UCTU: TStringField;
    Q1_CALC_NAZOV_ADRESA: TStringField;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    Q2_: TQuery;
    Q2_vsym: TStringField;
    Q1_FZ_DEN: TSmallintField;
    Q1_OKEC: TStringField;
    QRShape34: TQRShape;
    QRShape36: TQRShape;
    QRShape38: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel49: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel48: TQRLabel;
    QRShape33: TQRShape;
    QRDBText6: TQRDBText;
    QRLabel50: TQRLabel;
    QRLabel52: TQRLabel;
    QRShape35: TQRShape;
    QRLabel51: TQRLabel;
    POC: TQRLabel;
    QRShape37: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape74: TQRShape;
    QRShape88: TQRShape;
    QRShape90: TQRShape;
    QRLabel15: TQRLabel;
    Z1: TQRLabel;
    Z2: TQRLabel;
    QRLabel53: TQRLabel;
    Z4: TQRLabel;
    Z5: TQRLabel;
    QRLabel54: TQRLabel;
    Q1_ADR_CISLO: TStringField;
    procedure GroupFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Q1_AfterOpen(DataSet: TDataSet);
    procedure Q1_CalcFields(DataSet: TDataSet);
  private
  public
    procedure ShowReport;
    procedure SpracujStredisko;

  end;

type
  TMyOdvody=record
    pocet      :integer;
    o_nemoc    :double;
    o_nemoc1   :double;
    o_dochod   :double;
    o_dochod1  :double;
    z_nemoc    :double;
    z_nemoc1   :double;
    z_dochod   :double;
    z_dochod1  :double;
    zak_nemoc  :double;
    zak_nemoc1 :double;
    zak_dochod :double;
    zak_dochod1:double;
{--}
    n_pn       :double;
    n_ocr      :double;
    nd_materska:double;
    nd_rodic   :double;
    nd_pridavky:double;
    nd_ine     :double;
    nd_spolu   :double;
    p_pn       :integer;
    p_ocr      :integer;
    pd_materska:integer;
    pd_rodic   :integer;
    pd_pridavky:integer;
    pd_ine     :integer;
    pd_spolu   :integer;
  end;
  TMySadzby=record
    f_nemoc    :double;
    f_dochod   :double;
    fz_nemoc   :double;
    fz_nemoc1  :double;
    fz_dochod  :double;
    fz_dochod1 :double;
  end;

var
  ReportSPV: TReportSPV;
  MyOdvody:array[0..99] of TMyOdvody;
  MySadzby:TMySadzby;

procedure RunReportSPV(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure InitMyPremenne;
var i:integer;
begin
  for i:=0 to 99 do
  with MyOdvody[i] do
  begin
    pocet      :=0;
    o_nemoc    :=0;
    o_nemoc1   :=0;
    o_dochod   :=0;
    o_dochod1  :=0;
    z_nemoc    :=0;
    z_nemoc1   :=0;
    z_dochod   :=0;
    z_dochod1  :=0;
    zak_nemoc  :=0;
    zak_nemoc1 :=0;
    zak_dochod :=0;
    zak_dochod1:=0;    
    n_pn       :=0;
    n_ocr      :=0;
    nd_materska:=0;
    nd_rodic   :=0;
    nd_pridavky:=0;
    nd_ine     :=0;
    nd_spolu   :=0;
    p_pn       :=0;
    p_ocr      :=0;
    pd_materska:=0;
    pd_rodic   :=0;
    pd_pridavky:=0;
    pd_ine     :=0;
    pd_spolu   :=0;
  end;
  with MySadzby do begin
    fz_nemoc   :=0;
    fz_nemoc1  :=0;
    fz_dochod  :=0;
    fz_dochod1 :=0;
  end;
end;

procedure TReportSPV.ShowReport;
begin
{  QRLabelCalcFirma.Caption := 'FIRMA: '+X.AktFirmaStr;}
  if X.AktObdobie>=200100 then
  begin
    L6.Caption := '6,4';
  end else
  begin
    L6.Caption := '5,9';
  end;
  try
  Q1_.Close;
  Q1_.Open;
  Q2_.Close;
  Q2_.Open;
  except MyError(SMyRepExecError);
  end;
  if Q1_.Active AND (Q1_.RecordCount>0) then
  begin
   Preview;
  end;
  Q1_.Close;
  Q2_.Close;
end;

procedure TReportSPV.GroupFooterBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vysledok:double;
begin
  with MyOdvody[0],MySadzby do begin
    if (Copy(Q1_CALC_NAZOV_ADRESA.value,1,6)='T.M.K.') and
       (X.AktObdobie = 200001) and
       (z_nemoc=12947) then z_nemoc:=12948;

    vysledok := z_nemoc+z_nemoc1+o_nemoc+z_dochod+z_dochod1+o_dochod;
{
    L1.Caption := Format('%5.2f',[fz_nemoc]);
    L2.Caption := Format('%5.2f',[fz_nemoc1]);
    L3.Caption := Format('%5.2f',[f_nemoc]);
    L4.Caption := Format('%5.2f',[fz_dochod]);
    L5.Caption := Format('%5.2f',[fz_dochod1]);
    L6.Caption := Format('%5.2f',[f_dochod]);
}    
    V1.Caption := Format('%10.2n',[z_nemoc]);
    V2.Caption := Format('%10.2n',[z_nemoc1]);
    V3.Caption := Format('%10.2n',[o_nemoc]);
    V4.Caption := Format('%10.2n',[z_dochod]);
    V5.Caption := Format('%10.2n',[z_dochod1]);
    V6.Caption := Format('%10.2n',[o_dochod]);
    V7.Caption := Format('%10.2n',[vysledok]);
    Z1.Caption := Format('%10.2n',[zak_nemoc]);
    Z2.Caption := Format('%10.2n',[zak_nemoc1]);
    Z4.Caption := Format('%10.2n',[zak_dochod]);
    Z5.Caption := Format('%10.2n',[zak_dochod1]);    
    POC.Caption:= IntToStr(pocet);
    A1.Caption:=IntToStr(p_pn);
    B1.Caption:=IntToStr(p_ocr);
    C1.Caption:=IntToStr(pd_materska);
    G1A.Caption:=IntToStr(pd_pridavky);
    I1.Caption:=IntToStr(pd_rodic);
    J1.Caption:=IntToStr(pd_ine);
    A2.Caption := Format('%10.2n',[n_pn]);
    B2.Caption := Format('%10.2n',[n_ocr]);
    C2.Caption := Format('%10.2n',[nd_materska]);
    G2.Caption := Format('%10.2n',[nd_pridavky]);
    I2.Caption := Format('%10.2n',[nd_rodic]);
    J2.Caption := Format('%10.2n',[nd_ine]);
    K2.Caption := Format('%10.2n',[nd_spolu]);
    X2.Caption := Format('%10.2n',[vysledok-nd_spolu]);
    if vysledok-nd_spolu>0 then X2.Caption:='+'+X2.Caption;
  end;
end;

procedure TReportSPV.Q1_AfterOpen(DataSet: TDataSet);
var i:byte;
begin
  InitMyPremenne;
  try
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q0_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P3').AsInteger := X.AktMaxSid;
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
  for i:=1 to 99 do
  with MyOdvody[i],MySadzby do
  begin
    inc(MyOdvody[0].pocet,pocet);
    MyOdvody[0].o_nemoc    :=MyOdvody[0].o_nemoc  +o_nemoc;
    MyOdvody[0].o_nemoc1   :=MyOdvody[0].o_nemoc1 +o_nemoc1;
    MyOdvody[0].o_dochod   :=MyOdvody[0].o_dochod +o_dochod;
    MyOdvody[0].o_dochod1  :=MyOdvody[0].o_dochod1+o_dochod1;
   if fz_nemoc<>0 then begin
      MyOdvody[0].z_nemoc    :=MyOdvody[0].z_nemoc  +ZAOKRUHLI(z_nemoc*fz_nemoc/100,0,0);
      MyOdvody[0].zak_nemoc  :=MyOdvody[0].zak_nemoc+ z_nemoc;
    end;  
    if fz_nemoc1<>0 then begin
      MyOdvody[0].z_nemoc1   :=MyOdvody[0].z_nemoc1 +ZAOKRUHLI(z_nemoc1*fz_nemoc1/100,0,0);
      MyOdvody[0].zak_nemoc1 :=MyOdvody[0].zak_nemoc1 + z_nemoc;
    end;  
    if fz_dochod<>0 then begin
      MyOdvody[0].z_dochod   :=MyOdvody[0].z_dochod +ZAOKRUHLI(z_dochod*fz_dochod/100,0,0);
      MyOdvody[0].zak_dochod :=MyOdvody[0].zak_dochod + z_dochod;
    end;  
    if fz_dochod1<>0 then begin
      MyOdvody[0].z_dochod1  :=MyOdvody[0].z_dochod1+ZAOKRUHLI(z_dochod1*fz_dochod1/100,0,0);
      MyOdvody[0].zak_dochod1:=MyOdvody[0].zak_dochod1 + z_dochod;
    end;  
    {--}
    MyOdvody[0].n_pn       :=MyOdvody[0].n_pn  + n_pn;
    MyOdvody[0].n_ocr      :=MyOdvody[0].n_ocr + n_ocr;
    MyOdvody[0].nd_materska:=MyOdvody[0].nd_materska + nd_materska;
    MyOdvody[0].nd_rodic   :=MyOdvody[0].nd_rodic + nd_rodic;
    MyOdvody[0].nd_pridavky:=MyOdvody[0].nd_pridavky + nd_pridavky;
    MyOdvody[0].nd_ine     :=MyOdvody[0].nd_ine + nd_ine;
    MyOdvody[0].nd_spolu   :=MyOdvody[0].nd_spolu + nd_spolu;
    {--}
    MyOdvody[0].p_pn       :=MyOdvody[0].p_pn  + p_pn;
    MyOdvody[0].p_ocr      :=MyOdvody[0].p_ocr + p_ocr;
    MyOdvody[0].pd_materska:=MyOdvody[0].pd_materska + pd_materska;
    MyOdvody[0].pd_rodic   :=MyOdvody[0].pd_rodic + pd_rodic;
    MyOdvody[0].pd_pridavky:=MyOdvody[0].pd_pridavky + pd_pridavky;
    MyOdvody[0].pd_ine     :=MyOdvody[0].pd_ine + pd_ine;
    MyOdvody[0].pd_spolu   :=MyOdvody[0].pd_spolu + pd_spolu;
  end;
end;

procedure TReportSPV.SpracujStredisko;
var sid: byte; plati:boolean;
begin
sid:=Q0_SID.Value;
plati:=false;
with MyOdvody[sid],MySadzby do begin
  {nemocenske zabezpecenie}
  if (Q0_u_nemoc.Value in (PoiPlatiZam+PoiPlatiFir)) then begin
    plati:=true;
    if NOT Q0_zps.Value then begin
      if Q0_u_nemoc.Value in PoiPlatiZam then o_nemoc :=o_nemoc + Q0_o_nemoc.Value;
      if Q0_f_nemoc.Value > f_nemoc then f_nemoc := Q0_f_nemoc.Value;
    end
    else begin
      if Q0_u_nemoc.Value in PoiPlatiZam then o_nemoc:=o_nemoc+ Q0_o_nemoc.Value;
      if Q0_f_nemoc.Value > f_nemoc then f_nemoc := Q0_f_nemoc.Value;
    end;
    if NOT Q0_zps1.Value then begin
      if Q0_u_nemoc.Value in PoiPlatiFir then z_nemoc :=z_nemoc + Q0_n_zaklad_np.Value;
      if Q0_fz_nemoc.Value > fz_nemoc then fz_nemoc := Q0_fz_nemoc.Value;
    end
    else begin
      if Q0_u_nemoc.Value in PoiPlatiFir then z_nemoc1:=z_nemoc1+ Q0_n_zaklad_np.Value;
      if Q0_fz_nemoc.Value >fz_nemoc1 then fz_nemoc1 := Q0_fz_nemoc.Value;
    end;
  end;
  {dochodkove zabezpecenie}
  if (Q0_u_dochod.Value in (PoiPlatiZam+PoiPlatiFir)) then begin
    plati:=true;
    if NOT Q0_zps.Value then begin
      if Q0_u_dochod.Value in PoiPlatiZam then o_dochod :=o_dochod + Q0_o_dochod.Value;
      if Q0_f_dochod.Value > f_dochod then f_dochod := Q0_f_dochod.Value;
    end
    else begin
      if Q0_u_dochod.Value in PoiPlatiZam then o_dochod:=o_dochod+ Q0_o_dochod.Value;
      if Q0_f_dochod.Value > f_dochod then f_dochod := Q0_f_dochod.Value;
    end;
    if NOT Q0_zps1.Value then begin
      if Q0_u_dochod.Value in PoiPlatiFir then z_dochod :=z_dochod + Q0_n_zaklad_dp.Value;
      if Q0_fz_dochod.Value > fz_dochod then fz_dochod := Q0_fz_dochod.Value;
    end
    else begin
      if Q0_u_dochod.Value in PoiPlatiFir then z_dochod1:=z_dochod1+ Q0_n_zaklad_dp.Value;
      if Q0_fz_dochod.Value > fz_dochod1 then fz_dochod1 := Q0_fz_dochod.Value;
    end;
  end;
  if plati then inc(pocet);
  if Q0_N_pn.Value > 0 then begin
    n_pn := n_pn + Q0_N_pn.Value;
    p_pn := p_pn + 1;
  end;
  if Q0_N_ocr.Value > 0 then begin
    n_ocr := n_ocr + Q0_N_ocr.Value;
    p_ocr := p_ocr + 1;
  end;
  if Q0_nd_materska.Value > 0 then begin
    nd_materska := nd_materska + Q0_nd_materska.Value;
    pd_materska := pd_materska + 1;
  end;
  if Q0_nd_rodic.Value > 0 then begin
    nd_rodic := nd_rodic + Q0_nd_rodic.Value;
    pd_rodic := pd_rodic + 1;
  end;
  if Q0_nd_pridavky.Value > 0 then begin
    nd_pridavky := nd_pridavky + Q0_nd_pridavky.Value;
    pd_pridavky := pd_pridavky + 1;
  end;
  if Q0_nd_ine.Value > 0 then begin
    nd_ine := nd_ine + Q0_nd_ine.Value;
    pd_ine := pd_ine + 1;
  end;
  if Q0_nd_spolu.Value > 0 then begin
    nd_spolu := nd_spolu + Q0_nd_spolu.Value;
    pd_spolu := pd_spolu + 1;
  end;
end;end;

procedure TReportSPV.Q1_CalcFields(DataSet: TDataSet);
var s:string;
begin
  Q1_CALC_FIRMA.Value := 'FIRMA: '+X.AktFirmaStr;

  s:=IntToStr(X.AktObdobie);
  Q1_CALC_OBDOBIE.Value:=
    'za mesiac  '+Copy(s,5,2)+' / '+Copy(s,1,4);
  Q1_CALC_CISLO_UCTU.Value:=
    LongCisloU(Q1_predcislo_u.Value,Q1_cislo_u.Value)+' / '+
    Q1_banka_u.Value;
  Q1_CALC_NAZOV_ADRESA.Value:=
    X.AktFirmaStr + ', ' +
    MyAdresa(
    Q1_adr_ulica.Value,
    Q1_adr_cislo.Value,
    Q1_adr_psc.Value,
    Q1_adr_mesto.Value );
end;

procedure RunReportSPV(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportSPV:=TReportSPV.Create(Application);
    if X.DisableShape then QRDisableShape(ReportSPV);
    if X.DisableLabel then QRDisableLabel(ReportSPV);
    Screen.Cursor:=crDefault;
    ReportSPV.ShowReport;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportSPV.Free;
  end;
end;

end.
