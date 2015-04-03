unit RexZP;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick, QRPRNTR;

type
  TReportZP = class(TQuickRep)
    Q0_: TQuery;
    Q0_kzp: TSmallintField;
    Q0_v_obdobie: TIntegerField;
    Q0_pocet: TIntegerField;
    Q0_ca_obdobie: TStringField;
    Q0_ca_nadpis1: TStringField;
    QV_: TQuery;
    DS0: TDataSource;
    QCIS_: TQuery;
    QCIS_nazov_zp: TStringField;
    QV_Code_emp: TIntegerField;
    QV_v_obdobie: TIntegerField;
    QV_SID: TSmallintField;
    QV_V_rok: TSmallintField;
    QV_V_mesiac: TSmallintField;
    QV_V_fmes: TSmallintField;
    QV_V_sviatok: TSmallintField;
    QV_V_holiday: TFloatField;
    QV_V_absencia: TFloatField;
    QV_V_pn1: TSmallintField;
    QV_V_pn2: TSmallintField;
    QV_V_uraz: TSmallintField;
    QV_V_hodina: TFloatField;
    QV_MV_plat: TCurrencyField;
    QV_V_plat: TCurrencyField;
    QV_V_sadzba: TCurrencyField;
    QV_N_mzda: TCurrencyField;
    QV_N_brutto: TCurrencyField;
    QV_N_holiday: TCurrencyField;
    QV_N_premie: TCurrencyField;
    QV_N_odmeny: TCurrencyField;
    QV_N_dohody_ovp: TCurrencyField;
    QV_N_dohody_opc: TCurrencyField;
    QV_N_doplatok: TCurrencyField;
    QV_Vh_nadcas: TFloatField;
    QV_Vp_nadcas: TCurrencyField;
    QV_Vh_sobota: TFloatField;
    QV_Vp_sobota: TCurrencyField;
    QV_Vh_nedela: TFloatField;
    QV_Vp_nedela: TCurrencyField;
    QV_Vh_sviatok: TFloatField;
    QV_Vp_sviatok: TCurrencyField;
    QV_Vh_noc: TFloatField;
    QV_Vp_noc: TCurrencyField;
    QV_Vh_skod: TFloatField;
    QV_Vp_skod: TCurrencyField;
    QV_N_priplat: TCurrencyField;
    QV_O_zdravot: TCurrencyField;
    QV_O_nemoc: TCurrencyField;
    QV_O_dochod: TCurrencyField;
    QV_O_fondzam: TCurrencyField;
    QV_N_poist: TCurrencyField;
    QV_Dopravne: TCurrencyField;
    QV_Pouz_auto: TCurrencyField;
    QV_Nc_minimum: TCurrencyField;
    QV_Nc_deti: TCurrencyField;
    QV_Nc_ine: TCurrencyField;
    QV_Nc_spolu: TCurrencyField;
    QV_Nd_materska: TCurrencyField;
    QV_Nd_pridavky: TCurrencyField;
    QV_Nd_ine: TCurrencyField;
    QV_Nd_spolu: TCurrencyField;
    QV_Dan_vyrovnana: TSmallintField;
    QV_D_ciastzd: TCurrencyField;
    QV_D_zdanmzda: TCurrencyField;
    QV_D_preddavok: TCurrencyField;
    QV_D_dan: TCurrencyField;
    QV_N_netto: TCurrencyField;
    QV_Ne_zaloha: TCurrencyField;
    QV_Ne_pozicky: TCurrencyField;
    QV_Ne_odborar: TCurrencyField;
    QV_Ne_poistovna: TCurrencyField;
    QV_Ne_exekucia: TCurrencyField;
    QV_Ne_spolu: TCurrencyField;
    QV_Spor_plat: TSmallintField;
    QV_Sporenie: TCurrencyField;
    QV_Vyplata: TCurrencyField;
    QV_V_priemer1: TCurrencyField;
    QV_V_priemer2: TCurrencyField;
    QV_V_pn: TSmallintField;
    QV_N_sviatok: TCurrencyField;
    QV_N_pn1: TCurrencyField;
    QV_N_pn2: TCurrencyField;
    QV_N_ocr: TCurrencyField;
    QV_kzp: TSmallintField;
    QV_ZPS: TBooleanField;
    QV_F_doba: TFloatField;
    QV_F_pn_dni: TSmallintField;
    QV_F_pn1: TSmallintField;
    QV_F_pn2: TSmallintField;
    QV_F_ocr: TSmallintField;
    QV_F_uraz: TSmallintField;
    QV_F_nemmax: TCurrencyField;
    QV_F_zdravot: TFloatField;
    QV_F_nemoc: TFloatField;
    QV_F_dochod: TFloatField;
    QV_F_fondz: TFloatField;
    QV_Fz_zdravot: TFloatField;
    QV_Fz_nemoc: TFloatField;
    QV_Fz_dochod: TFloatField;
    QV_Fz_fondz: TFloatField;
    QV_F_poistmax: TCurrencyField;
    QV_F_min_mzda: TCurrencyField;
    QV_F_nd_pocita: TSmallintField;
    QV_u_zdrav: TSmallintField;
    QV_U_nemoc: TSmallintField;
    QV_U_dochod: TSmallintField;
    QV_U_fondzam: TSmallintField;
    QV_u_zdrav1: TSmallintField;
    QV_U_nemoc1: TSmallintField;
    QV_U_dochod1: TSmallintField;
    QV_U_fondzam1: TSmallintField;
    QV_u_zdrav2: TSmallintField;
    QV_U_nemoc2: TSmallintField;
    QV_U_dochod2: TSmallintField;
    QV_U_fondzam2: TSmallintField;
    QV_F_dan_sadzba1: TFloatField;
    QV_F_dan_maximum1: TCurrencyField;
    DetailBand1: TQRBand;
    QRShape22: TQRShape;
    QRLabel14: TQRLabel;
    QRShape9: TQRShape;
    QRLabelZam1: TQRLabel;
    QRShape5: TQRShape;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRShape23: TQRShape;
    QRLabel15: TQRLabel;
    QRShape24: TQRShape;
    QRShape13: TQRShape;
    QRLabel1: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel8: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel10: TQRLabel;
    QRShape18: TQRShape;
    QRShape2: TQRShape;
    Shapexx: TQRShape;
    QRShape4: TQRShape;
    QRLabelZam2: TQRLabel;
    QRShape6: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel5: TQRLabel;
    QRShape7: TQRShape;
    QRLabel6: TQRLabel;
    QRShape8: TQRShape;
    QRLabel11: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRShape12: TQRShape;
    QRDBText16: TQRDBText;
    QRShape19: TQRShape;
    QRLabel13: TQRLabel;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    V1: TQRLabel;
    V2: TQRLabel;
    V3: TQRLabel;
    V4: TQRLabel;
    V5: TQRLabel;
    V6: TQRLabel;
    V7: TQRLabel;
    V8: TQRLabel;
    V9: TQRLabel;
    V10: TQRLabel;
    V11: TQRLabel;
    V12: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    Q0_CALC_FIRMA: TStringField;
    QRDBText1: TQRDBText;
    QV_V_den: TFloatField;
    QV_N_zaklad_zp: TCurrencyField;
    QV_F_firma_zps: TBooleanField;
    QV_ZPS1: TBooleanField;
    QRShape3: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape28: TQRShape;
    QRLabel19: TQRLabel;
    QRShape30: TQRShape;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    Q1_: TQuery;
    Q1_NAZOV: TStringField;
    Q1_ADR_ULICA: TStringField;
    Q1_ADR_MESTO: TStringField;
    Q1_ADR_PSC: TStringField;
    Q1_ICO: TStringField;
    Q1_PREDCISLO_U: TStringField;
    Q1_CISLO_U: TStringField;
    Q1_BANKA_U: TStringField;
    Q1_SSYM_U: TStringField;
    Q1_KSYM_U: TStringField;
    Q1_CALC_ADRESA: TStringField;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    Q1_CALC_CISLO_UCTU: TStringField;
    QRDBText4: TQRDBText;
    QRShape39: TQRShape;
    QRLabel20: TQRLabel;
    QRShape40: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QR_Vykaz_zostavil: TQRLabel;
    QR_telefon: TQRLabel;
    QR_fax: TQRLabel;
    QR_vykaz_dna: TQRLabel;
    QR_kontakt_osoba: TQRLabel;
    Q1_ADR_CISLO: TStringField;
    QV_Oz_zdravot: TCurrencyField;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Q1_CalcFields(DataSet: TDataSet);
  private
    X: TMyReportParam;
  public
    procedure ShowReport;
    procedure SpracujStredisko;
    procedure SetX(const MyReportParam:TMyReportParam);
  end;

type
  TMyOdvody=record
    pocet      :integer;
    pocet1     :integer;
    o_zdravot  :double;
    o_zdravot1 :double;
    oz_zdravot :double;
    oz_zdravot1:double;
    z_zdravot  :double;
    z_zdravot1 :double;
    cz_zdravot :double;
    cz_zdravot1:double;
  end;
  TMySadzby=record
    f_zdravot  :double;
    f_zdravot1 :double;
    fz_zdravot :double;
    fz_zdravot1:double;
  end;

var
  ReportZP: TReportZP;
  MyOdvody:array[0..99] of TMyOdvody;
  MySadzby:TMySadzby;

procedure RunReportZP(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

procedure InitMyPremenne;
var i:integer;
begin
  for i:=0 to 99 do
  with MyOdvody[i] do
  begin
    pocet      :=0;
    pocet1     :=0;
    o_zdravot  :=0;
    o_zdravot1 :=0;
    oz_zdravot :=0;
    oz_zdravot1:=0;
    z_zdravot  :=0;
    z_zdravot1 :=0;
    cz_zdravot :=0;
    cz_zdravot1:=0;
  end;
  with MySadzby do begin
    fz_zdravot :=0;
    fz_zdravot1:=0;
  end;
end;

procedure TReportZP.ShowReport;
begin
  try
  QR_Vykaz_zostavil.Caption := X.Vykaz_zostavil;
  QR_Vykaz_dna.Caption := X.Vykaz_dna;
  QR_Telefon.Caption := X.Telefon;
  QR_Fax.Caption := X.Fax;
  QR_Kontakt_osoba.Caption := X.Ucto_Meno + ' ' + X.Ucto_Priezvisko;
  if X.AktObdobie>=200100 then
  begin
    QRLabelZam1.Caption := 'zamestnanec  4,0%';
    QRLabelZam2.Caption := 'zamestnanec  4,0%';
  end else
  begin
    QRLabelZam1.Caption := 'zamestnanec  3,7%';
    QRLabelZam2.Caption := 'zamestnanec  3,7%';
  end;
  Q1_.Close;
  QCIS_.Close;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q0_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q0_.Open;
  QCIS_.Open;
  Q1_.Open;
  if Q0_.Active AND (Q0_.RecordCount>0) then
  begin
   ReportZP.Preview;
  end;
  finally
  QCIS_.Close;
  Q0_.Close;
  Q1_.Close;
  end;
end;

procedure TReportZP.Q0_CalcFields(DataSet: TDataSet);
var s: string;
begin
 Q0_CALC_FIRMA.Value := X.AktFirmaStr;

 s:=IntToStr(Q0_V_obdobie.Value);
 Q0_Ca_obdobie.Value:=
    'za mesiac  '+Copy(s,5,2)+' / '+Copy(s,1,4);
 Q0_ca_nadpis1.Value:='kód zdravotnej poisovne : '+
    LPAD(Q0_kzp.AsString,2,'0');
end;

procedure TReportZP.SpracujStredisko;
var sid: byte;
begin
sid:=QV_SID.Value;
with MyOdvody[sid],MySadzby do begin
  {zdravotne zabezpecenie}
  if (QV_u_zdrav.Value in (PoiPlatiZam+PoiPlatiFir)) then begin
    if NOT QV_zps.Value then begin
      cz_zdravot :=cz_zdravot + QV_n_zaklad_zp.Value;
      if QV_u_zdrav.Value in PoiPlatiZam then o_zdravot :=o_zdravot + QV_o_zdravot.Value;
      if QV_f_zdravot.Value > f_zdravot then f_zdravot := QV_f_zdravot.Value;
      inc(pocet);
    end
    else begin
      cz_zdravot1:=cz_zdravot1+ QV_n_zaklad_zp.Value;
      if QV_u_zdrav.Value in PoiPlatiZam then o_zdravot1:=o_zdravot1+ QV_o_zdravot.Value;
      if QV_f_zdravot.Value > f_zdravot1 then f_zdravot1 := QV_f_zdravot.Value;
      inc(pocet1);
    end;
    if (QV_u_zdrav.Value in PoiPlatiFir) then begin
      if NOT QV_zps.Value then begin
        z_zdravot :=z_zdravot + QV_n_zaklad_zp.Value;
        if QV_u_zdrav.Value in PoiPlatiFir then oz_zdravot :=oz_zdravot + QV_oz_zdravot.Value;
        if QV_fz_zdravot.Value > fz_zdravot then fz_zdravot := QV_fz_zdravot.Value;
      end
      else begin
        z_zdravot1:=z_zdravot1+ QV_n_zaklad_zp.Value;
        if QV_u_zdrav.Value in PoiPlatiFir then oz_zdravot1:=oz_zdravot1+ QV_oz_zdravot.Value;
        if QV_fz_zdravot.Value >fz_zdravot1 then fz_zdravot1 := QV_fz_zdravot.Value;
      end;
    end;
  end;
end;end;

procedure TReportZP.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var i:byte;
begin
  InitMyPremenne;
  try
  QV_.Close;
  QV_.ParamByName('P1').AsInteger := X.AktMinSid;
  QV_.ParamByName('P2').AsInteger := X.AktMaxSid;
  QV_.Open;
  except MyError(SMyRepExecError);
  end;
  if QV_.Active AND (QV_.RecordCount>0) then
  begin
   while not QV_.EOF do begin
     SpracujStredisko;
     QV_.Next;
   end;
  end;
  QV_.Close;
{-----------------------------------}
  for i:=1 to 99 do
  with MyOdvody[i],MySadzby do
  begin
    inc(MyOdvody[0].pocet,pocet);
    inc(MyOdvody[0].pocet1,pocet1);
    MyOdvody[0].o_zdravot    :=MyOdvody[0].o_zdravot  +o_zdravot;
    MyOdvody[0].o_zdravot1   :=MyOdvody[0].o_zdravot1 +o_zdravot1;
    MyOdvody[0].oz_zdravot   :=MyOdvody[0].oz_zdravot +oz_zdravot;
    MyOdvody[0].oz_zdravot1  :=MyOdvody[0].oz_zdravot1+oz_zdravot1;
    MyOdvody[0].z_zdravot    :=MyOdvody[0].z_zdravot  +z_zdravot;
    MyOdvody[0].z_zdravot1   :=MyOdvody[0].z_zdravot1 +z_zdravot1;
    MyOdvody[0].cz_zdravot   :=MyOdvody[0].cz_zdravot +cz_zdravot;
    MyOdvody[0].cz_zdravot1  :=MyOdvody[0].cz_zdravot1+cz_zdravot1;
  end;
  with MyOdvody[0],MySadzby do begin
{    S1.Caption := Format('%5.2f',[fz_zdravot])+'%';
    S2.Caption := Format('%5.2f',[f_zdravot])+'%';
    S3.Caption := Format('%5.2f',[fz_zdravot1])+'%';
    S4.Caption := Format('%5.2f',[f_zdravot1])+'%';
}
    V1.Caption := IntToStr(pocet+pocet1);
    V2.Caption := IntToStr(pocet);
    V3.Caption := Format('%10.2n',[cz_zdravot]);
    if MyRok(X.AktObdobie)<=2004 then
      oz_zdravot:=ZAOKRUHLI(z_zdravot*fz_zdravot/100,0,0);
    V4.Caption := Format('%10.2n',[oz_zdravot+o_zdravot]);
    V5.Caption := Format('%10.2n',[oz_zdravot]);
    V6.Caption := Format('%10.2n',[o_zdravot]);
    V7.Caption := IntToStr(pocet1);
    if MyRok(X.AktObdobie)<=2004 then
      oz_zdravot1:=ZAOKRUHLI(z_zdravot1*fz_zdravot1/100,0,0);
    V8.Caption := Format('%10.2n',[cz_zdravot1]);
    V9.Caption := Format('%10.2n',[oz_zdravot1+o_zdravot1]);
   V10.Caption := Format('%10.2n',[oz_zdravot1]);
   V11.Caption := Format('%10.2n',[o_zdravot1]);
   V12.Caption := Format('%10.2n',[oz_zdravot+o_zdravot+oz_zdravot1+o_zdravot1]);
  end;
end;

procedure TReportZP.Q1_CalcFields(DataSet: TDataSet);
begin
  Q1_CALC_ADRESA.Value :=
    MyAdresa(
    Q1_adr_ulica.Value,
    Q1_adr_cislo.Value,
    Q1_adr_psc.Value,
    Q1_adr_mesto.Value );

  Q1_CALC_CISLO_UCTU.Value :=
    LongCisloU(Q1_Predcislo_u.Value,Q1_Cislo_u.Value)+' / '+
    Q1_Banka_u.Value;

end;

procedure TReportZP.SetX(const MyReportParam:TMyReportParam);
begin
  X:=MyReportParam;
end;

procedure RunReportZP(const MyReportParam: TMyReportParam);
begin
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportZP:=TReportZP.Create(Application);
    ReportZP.SetX(MyReportParam);
    if ReportZP.X.DisableShape then QRDisableShape(ReportZP);
    if ReportZP.X.DisableLabel then QRDisableLabel(ReportZP);
    Screen.Cursor:=crDefault;
    ReportZP.ShowReport;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportZP.Free;
  end;
end;

end.
