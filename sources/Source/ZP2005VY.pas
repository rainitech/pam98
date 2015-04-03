unit ZP2005VY;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick, QRPRNTR;

type
  TReportZP2005VY = class(TQuickRep)
    Q0_: TQuery;
    Q0_kzp: TSmallintField;
    QV_: TQuery;
    DS0: TDataSource;
    DetailBand1: TQRBand;
    QRShape22: TQRShape;
    QRShape9: TQRShape;
    QRLabelZam1: TQRLabel;
    QRShape5: TQRShape;
    QRLabel7: TQRLabel;
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
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRLabel11: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRShape12: TQRShape;
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
    V7A: TQRLabel;
    V8A: TQRLabel;
    V9: TQRLabel;
    V10: TQRLabel;
    V11: TQRLabel;
    V12: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText1: TQRDBText;
    QRShape3: TQRShape;
    QRLabel17: TQRLabel;
    QRShape28: TQRShape;
    QRLabel19: TQRLabel;
    QRShape30: TQRShape;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
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
    QRDBText3: TQRDBText;
    Q1_CALC_CISLO_UCTU: TStringField;
    QRDBText4: TQRDBText;
    QRLabel21: TQRLabel;
    QR_Vykaz_zostavil: TQRLabel;
    QR_telefon: TQRLabel;
    QR_vykaz_dna: TQRLabel;
    Q1_ADR_CISLO: TStringField;
    QRLabel4: TQRLabel;
    QRShape41: TQRShape;
    QRDBText6: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel92: TQRLabel;
    QRShape53: TQRShape;
    QRLabel93: TQRLabel;
    QRShape54: TQRShape;
    QRLabel3: TQRLabel;
    QRShape25: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRMemo1: TQRMemo;
    QRLabel16: TQRLabel;
    QRLabel28: TQRLabel;
    QRMemo2: TQRMemo;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape46: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape1: TQRShape;
    QRShape7: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    V13: TQRLabel;
    V14: TQRLabel;
    V15A: TQRLabel;
    V16A: TQRLabel;
    V17: TQRLabel;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    V18: TQRLabel;
    QRShape75: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    V15B: TQRLabel;
    V16B: TQRLabel;
    V7B: TQRLabel;
    V8B: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel33: TQRLabel;
    Q1_ADR_EMAIL: TStringField;
    QRDBText7: TQRDBText;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRLabel32: TQRLabel;
    QRShape86: TQRShape;
    QRLabel34: TQRLabel;
    QRShape87: TQRShape;
    QRLabel35: TQRLabel;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    Q1_NAZOV_BANKY: TStringField;
    QRShape88: TQRShape;
    QCBU_: TQuery;
    QCBU_BUID_TYP: TStringField;
    QCBU_BUID_KOD: TSmallintField;
    QCBU_OLD_PREDCISLO_U: TStringField;
    QCBU_OLD_CISLO_U: TStringField;
    QCBU_BANKA_U: TStringField;
    QCBU_SSYM_U: TStringField;
    QCBU_KSYM: TStringField;
    QCBU_VSYM: TStringField;
    QCBU_PRIJEMCA: TStringField;
    QCBU_SPP: TStringField;
    QCBU_CISLO_U: TStringField;
    QRLabel36: TQRLabel;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRMemo3: TQRMemo;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRShape34: TQRShape;
    QRShape80: TQRShape;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    Q1_OKEC: TStringField;
    Q1_F_HOLIDAY: TSmallintField;
    Q1_F_NEMOCD: TSmallintField;
    Q1_F_ODSTUPM: TSmallintField;
    Q1_F_ODSTUP: TSmallintField;
    Q1_HOLKVART: TSmallintField;
    Q1_F_ND_POCITA: TSmallintField;
    Q1_F_DOBA: TFloatField;
    Q1_F_TYP_PRIPL: TSmallintField;
    Q1_F_NADCAS: TFloatField;
    Q1_F_SOBOTA: TFloatField;
    Q1_F_NEDELA: TFloatField;
    Q1_F_SVIATOK: TFloatField;
    Q1_F_NOC: TFloatField;
    Q1_F_SKOD: TFloatField;
    Q1_FZ_UCET: TStringField;
    Q1_FZ_VS: TStringField;
    Q1_FZ_DEN: TSmallintField;
    Q1_OUP_NAZOV: TStringField;
    Q1_OUP_ULICA: TStringField;
    Q1_OUP_MESTO: TStringField;
    Q1_OUP_PSC: TStringField;
    Q1_F_POISTNE: TFloatField;
    Q1_F_TYP_PREMII: TSmallintField;
    Q1_F_FIRMA_ZPS: TBooleanField;
    Q1_F_TYP_PRIPL2: TSmallintField;
    Q1_F_PRIPLAT1: TFloatField;
    Q1_F_PRIPLAT2: TFloatField;
    Q1_F_PRIPLAT3: TFloatField;
    Q1_F_PRIPLAT4: TFloatField;
    Q1_F_PRIPLAT5: TFloatField;
    Q1_F_PRIPLAT1_TEXT: TStringField;
    Q1_F_PRIPLAT2_TEXT: TStringField;
    Q1_F_PRIPLAT3_TEXT: TStringField;
    Q1_F_PRIPLAT4_TEXT: TStringField;
    Q1_F_PRIPLAT5_TEXT: TStringField;
    Q1_DATUM_UZAV: TDateField;
    Q1_F_SOCFOND: TFloatField;
    Q1_F_TYP_ULAVY_SP: TSmallintField;
    Q1_F_TYP_ULAVY_FZ: TSmallintField;
    Q1_F_NEMOHOL: TFloatField;
    Q1_DIC: TStringField;
    Q1_ADR_TELEFON: TStringField;
    Q1_ADR_FAX: TStringField;
    Q1_ICZ: TStringField;
    Q1_RIADENIE: TSmallintField;
    Q1_TYP_ZEL: TStringField;
    Q1_ADR_STAT: TStringField;
    Q1_ADR_ZIP: TStringField;
    Q1_FO_RC: TStringField;
    Q1_FO_CPP: TStringField;
    Q1_FO_Surname: TStringField;
    Q1_FO_Name: TStringField;
    Q1_FO_Titul_pred: TStringField;
    Q1_FO_Titul_za: TStringField;
    Q1_KA_ULICA: TStringField;
    Q1_KA_MESTO: TStringField;
    Q1_KA_PSC: TStringField;
    Q1_KA_ZIP: TStringField;
    Q1_KA_STAT: TStringField;
    Q1_ADR_ULICA1: TStringField;
    QRDBText10: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    Q1_L_PRAV_FORMA: TStringField;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRLabel69: TQRLabel;
    QRDBText22: TQRDBText;
    Q1_L_ADR_STAT: TStringField;
    Q1_CALC_DEN_NA_VYPL: TDateField;
    QRDBText23: TQRDBText;
    QCBU_POBOCKA_ZP: TSmallintField;
    Q0_nazov_zp: TStringField;
    QV_dni_poist: TSmallintField;
    QV_sid: TSmallintField;
    QV_u_zdrav: TSmallintField;
    QV_miera_poklesu: TFloatField;
    QV_o_zdravot: TCurrencyField;
    QV_oz_zdravot: TCurrencyField;
    QV_n_zaklad_zp: TCurrencyField;
    QV_v_obdobie: TIntegerField;
    QV_ztp: TBooleanField;
    QV_n_prijem_zp: TCurrencyField;
    QV_typzec: TSmallintField;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Q1_CalcFields(DataSet: TDataSet);
    procedure ReportZP2005VYBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    first_preview:boolean;
  public
    procedure ShowReportStart;
    procedure ShowReportEnd;
    procedure SpracujStredisko;
    procedure Spracuj_Jednu_ZP;
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
    pocet_plati:integer;
    pocet_plati1:integer;
    pocet_kdni :integer;
    pocet_kdni1:integer;
    prijem     :double;
    prijem1    :double;
  end;
  TMySadzby=record
    f_zdravot  :double;
    f_zdravot1 :double;
    fz_zdravot :double;
    fz_zdravot1:double;
  end;
  TMyOdvodyZam=record
    rc:string;
    pocet_kdni :integer;
    prijem     :double;
    z_zdravot :double;
    fz_zdravot :double;
    f_zdravot  :double;
    oz_zdravot :double;
    o_zdravot  :double;
  end;
  TMyPocty=record
    pocet: longint;
    pocet_zvyh: longint;
    zam: array[1..2] of TMyOdvodyZam;
  end;
var
  ReportZP2005VY: TReportZP2005VY;
  MyOdvody:array[0..99] of TMyOdvody;
  MySadzby:TMySadzby;
  MyPocty:TMyPocty;

procedure PocetPrihlasenych(kzp:integer;var iMyPocty:TMyPocty);
procedure PocetPrihlasenychVsetkyZP(X1: TMyReportParam;var iMyPocty:TMyPocty);
procedure PocetPrihlasenychVsetkyZP_Zlucene(X1: TMyReportParam;var iMyPocty:TMyPocty);
procedure RunReportZP2005VY(const MyReportParam: TMyReportParam);
procedure RunReportZP2005VY_RTF(const MyReportParam: TMyReportParam);
procedure RunReportZP2005VY_PDF(const MyReportParam: TMyReportParam);

implementation

uses Dm_main, Dm_vypl, ZP2005PR;

{$R *.DFM}

var X: TMyReportParam;

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
    pocet_plati:=0;
    pocet_plati1:=0;
    pocet_kdni :=0;
    pocet_kdni1:=0;
    prijem     :=0;
    prijem1    :=0;
  end;
  with MySadzby do begin
    fz_zdravot :=0;
    fz_zdravot1:=0;
  end;
end;

procedure TReportZP2005VY.ShowReportStart;
begin
  first_preview:=true;
  try
  V7A.Caption := Format('%2.0n',[DM.TSET_Fz_zdravot.Value]);
  V8A.Caption := Format('%2.0n',[DM.TSET_F_zdravot.Value]);
  V15A.Caption:= Format('%2.0n',[DM.TSET_Fz_zdravot1.Value]);
  V16A.Caption:= Format('%2.0n',[DM.TSET_F_zdravot1.Value]);
  QR_Vykaz_zostavil.Caption := X.Vykaz_zostavil;
  QR_Vykaz_dna.Caption := X.Vykaz_dna;
  QR_Telefon.Caption := X.Telefon;
  V7A.Caption := DM.TSET_Fz_zdravot.DisplayText+' %';
  V8A.Caption := DM.TSET_F_zdravot.DisplayText+' %';
  V15A.Caption :=DM.TSET_Fz_zdravot1.DisplayText+' %';
  V16A.Caption :=DM.TSET_F_zdravot1.DisplayText+' %';
  Q1_.Close;
  QCBU_.Close;
  Q0_.Close;
  Q0_.Open;
  Q0_.Filtered := False;
  Q0_.First;
  Q0_.Filter := 'kzp='+IntToStr(X.Kod_ZP);
  Q0_.Filtered := True;
  QCBU_.Open;
  Q1_.Open;
  finally
  end;
end;

procedure TReportZP2005VY.ShowReportEnd;
begin
  QCBU_.Close;
  Q0_.Close;
  Q1_.Close;
end;

procedure TReportZP2005VY.SpracujStredisko;
var sid: byte;
begin
sid:=QV_SID.Value;
with MyOdvody[sid],MySadzby do begin
  {zdravotne zabezpecenie}
  if ((QV_u_zdrav.Value in (PoiPlatiZam+PoiPlatiFir)) (*or (QV_typzec.Value in DlhodoboNezamestnany)*)) then
  begin
    if DMV.Zvyhodneny_ZP(QV_Miera_Poklesu.Value,QV_V_obdobie.Value,QV_ZTP.Value) then
    begin
      cz_zdravot1:=cz_zdravot1+ QV_n_zaklad_zp.Value;
      if QV_u_zdrav.Value in PoiPlatiZam then o_zdravot1:=o_zdravot1+ QV_o_zdravot.Value;
      if QV_u_zdrav.Value in PoiPlatiFir then oz_zdravot1:=oz_zdravot1+ QV_oz_zdravot.Value;
      if QV_u_zdrav.Value in PoiPlatiFir then z_zdravot1:=z_zdravot1+ QV_n_zaklad_zp.Value;
      inc(pocet1);
      if QV_n_zaklad_zp.Value>0 then begin
        inc(pocet_plati1);
        inc(pocet_kdni1,trunc(QV_dni_poist.Value));
        prijem1 := prijem1 + QV_n_prijem_zp.Value;
      end;
    end
    else begin
      cz_zdravot :=cz_zdravot + QV_n_zaklad_zp.Value;
      if QV_u_zdrav.Value in PoiPlatiZam then o_zdravot :=o_zdravot + QV_o_zdravot.Value;
      if QV_u_zdrav.Value in PoiPlatiFir then oz_zdravot :=oz_zdravot + QV_oz_zdravot.Value;
      if QV_u_zdrav.Value in PoiPlatiFir then z_zdravot :=z_zdravot + QV_n_zaklad_zp.Value;
      inc(pocet);
      if QV_n_zaklad_zp.Value>0 then begin
        inc(pocet_plati);
        inc(pocet_kdni,trunc(QV_dni_poist.Value));
        prijem := prijem + QV_n_prijem_zp.Value;
      end;
    end;
  end;
end;end;

procedure TReportZP2005VY.Spracuj_Jednu_ZP;
var i:byte;
    SQL_BACKUP: string;
begin
  InitMyPremenne;
  try
  QV_.Close;
  SQL_BACKUP := QV_.SQL.Text;
  Q_SET_INT(QV_,':kzp',Q0_KZP.Value);
  Q_SET_INT(QV_,':p1',X.AktMinSid);
  Q_SET_INT(QV_,':p2',X.AktMaxSid);
  Q_SET(QV_,':v_obdobie',IntToStr(X.AktObdobie)+' + 0');
(*
  QV_.ParamByName('P1').AsInteger := X.AktMinSid;
  QV_.ParamByName('P2').AsInteger := X.AktMaxSid;
  QV_.ParamByName('V_OBDOBIE').AsInteger := X.AktObdobie;
*)
  QV_.Open;
  {except MyError(SMyRepExecError);
  end;}
  if QV_.Active AND (QV_.RecordCount>0) then
  begin
   while not QV_.EOF do begin
     SpracujStredisko;
     QV_.Next;
   end;
  end;
  finally
  QV_.Close;
  QV_.SQL.Text := SQL_BACKUP;
  end;
{-----------------------------------}
  for i:=1 to 99 do
  with MyOdvody[i],MySadzby do
  begin
    inc(MyOdvody[0].pocet,pocet);
    inc(MyOdvody[0].pocet1,pocet1);
    inc(MyOdvody[0].pocet_plati,pocet_plati);
    inc(MyOdvody[0].pocet_plati1,pocet_plati1);
    inc(MyOdvody[0].pocet_kdni,pocet_kdni);
    inc(MyOdvody[0].pocet_kdni1,pocet_kdni1);
    MyOdvody[0].o_zdravot    :=MyOdvody[0].o_zdravot  +o_zdravot;
    MyOdvody[0].o_zdravot1   :=MyOdvody[0].o_zdravot1 +o_zdravot1;
    MyOdvody[0].oz_zdravot   :=MyOdvody[0].oz_zdravot +oz_zdravot;
    MyOdvody[0].oz_zdravot1  :=MyOdvody[0].oz_zdravot1+oz_zdravot1;
    MyOdvody[0].z_zdravot    :=MyOdvody[0].z_zdravot  +z_zdravot;
    MyOdvody[0].z_zdravot1   :=MyOdvody[0].z_zdravot1 +z_zdravot1;
    MyOdvody[0].cz_zdravot   :=MyOdvody[0].cz_zdravot +cz_zdravot;
    MyOdvody[0].cz_zdravot1  :=MyOdvody[0].cz_zdravot1+cz_zdravot1;
    MyOdvody[0].prijem       :=MyOdvody[0].prijem     +prijem;
    MyOdvody[0].prijem1      :=MyOdvody[0].prijem1    +prijem1;
  end;
  if X.AktObdobie>= ZAKON_2009_01 then begin
    MyOdvody[0].oz_zdravot := ZAOKRUHLI(MyOdvody[0].oz_zdravot,-2,1);
    MyOdvody[0].oz_zdravot1 := ZAOKRUHLI(MyOdvody[0].oz_zdravot1,-2,1);
  end else begin
    MyOdvody[0].oz_zdravot := ZAOKRUHLI(ZAOKRUHLI(MyOdvody[0].oz_zdravot,-2,1),0,0); //na celÈ koruny nahor
    MyOdvody[0].oz_zdravot1 := ZAOKRUHLI(ZAOKRUHLI(MyOdvody[0].oz_zdravot1,-2,1),0,0); //na celÈ koruny nahor
  end;
end;

procedure TReportZP2005VY.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Spracuj_Jednu_ZP;
  with MyOdvody[0],MySadzby do begin
    V1.Caption := IntToStr(pocet+pocet1);
    V2.Caption := IntToStr(pocet);
    V3.Caption := IntToStr(pocet_plati);
    V4.Caption := IntToStr(pocet_kdni);
    V5.Caption := Format('%10.0n',[prijem]);
    V6.Caption := Format('%10.0n',[cz_zdravot]);
    V7B.Caption := Format('%10.0n',[oz_zdravot]);
    V8B.Caption := Format('%10.0n',[o_zdravot]);
    V9.Caption := Format('%10.0n',[oz_zdravot+o_zdravot]);
    V10.Caption := IntToStr(pocet1);
    V11.Caption := IntToStr(pocet_plati1);
    V12.Caption := IntToStr(pocet_kdni1);
    V13.Caption := Format('%10.0n',[prijem1]);
    V14.Caption := Format('%10.0n',[cz_zdravot1]);
   V15B.Caption := Format('%10.0n',[oz_zdravot1]);
   V16B.Caption := Format('%10.0n',[o_zdravot1]);
   V17.Caption := Format('%10.0n',[oz_zdravot1+o_zdravot1]);
   V18.Caption := Format('%10.0n',[oz_zdravot+o_zdravot+oz_zdravot1+o_zdravot1]);
  end;
end;

procedure TReportZP2005VY.Q1_CalcFields(DataSet: TDataSet);
var PomObdobie:longint;
begin
  Q1_CALC_ADRESA.Value :=
    MyAdresa(
    Q1_adr_ulica.Value,
    Q1_adr_cislo.Value,
    Q1_adr_psc.Value,
    Q1_adr_mesto.Value );

  Q1_CALC_CISLO_UCTU.Value :=
    Q1_Nazov_Banky.Value + '  ' +
    LongCisloU(Q1_Predcislo_u.Value,Q1_Cislo_u.Value)+' / '+
    Q1_Banka_u.Value;

  PomObdobie := Obdobie_Add_MM(X.AktObdobie,1);
  Q1_CALC_DEN_NA_VYPL.Value := LastDayDate(MyRok(PomObdobie),MyMesiac(PomObdobie),DM.TINF_FZ_DEN.Value);
end;

procedure TReportZP2005VY.SetX(const MyReportParam:TMyReportParam);
begin
  X:=MyReportParam;
end;

procedure RunReportZP2005VY(const MyReportParam: TMyReportParam);
begin
  exit; //Od 1.1.2007 QuickReportov˝ v˝kaz uû nie je podporovan˝, zostal funkËn˝ len v˝kaz v RTF form·te
with ReportZP2005VY do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportZP2005VY:=TReportZP2005VY.Create(Application);
    if X.DisableShape then QRDisableShape(ReportZP2005VY);
    if X.DisableLabel then QRDisableLabel(ReportZP2005VY);
    Screen.Cursor:=crDefault;
    ReportZP2005VY.ShowReportStart;
    if Q0_.Active AND (Q0_.RecordCount>0) then
    begin
     ReportZP2005VY.Preview;
    end;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportZP2005VY.ShowReportEnd;
    ReportZP2005VY.Free;
  end;
end;end;

procedure PocetPrihlasenych(kzp:integer;var iMyPocty:TMyPocty);
var i:integer;
begin
  i := 0;
  iMyPocty.pocet := 0;
  iMyPocty.pocet_zvyh := 0;
  try
  ReportZP2005PR:=TReportZP2005PR.Create(Application);
  ReportZP2005PR.SetX(X);
  ReportZP2005PR.ShowReportStart;
  iMyPocty.pocet := ReportZP2005PR.Q00_.RecordCount;
  iMyPocty.pocet_zvyh :=0;
  while not ReportZP2005PR.Q00_.EOF do begin
    if (ReportZP2005PR.Q00_CALC_Zvyhodneny_ZP.Value) then Inc(iMyPocty.pocet_zvyh);
    Inc(i);
    if i<=2 then begin
      iMyPocty.zam[i].rc            :=  ReportZP2005PR.Q00_CALC_Born_numb.Value;
      iMyPocty.zam[i].pocet_kdni    :=  ReportZP2005PR.Q00_CALC_Dni_Poist.Value;
      iMyPocty.zam[i].prijem        :=  ReportZP2005PR.Q00_CALC_N_prijem_zp.Value;
      iMyPocty.zam[i].z_zdravot     :=  ReportZP2005PR.Q00_CALC_N_zaklad_zp.Value;
      iMyPocty.zam[i].fz_zdravot    :=  ReportZP2005PR.Q00_CALC_Fz_zdravot.Value;
      iMyPocty.zam[i].f_zdravot     :=  ReportZP2005PR.Q00_CALC_F_zdravot.Value;
      iMyPocty.zam[i].oz_zdravot    :=  ReportZP2005PR.Q00_CALC_Oz_zdravot.Value;
      iMyPocty.zam[i].o_zdravot     :=  ReportZP2005PR.Q00_CALC_O_zdravot.Value;
    end;
    ReportZP2005PR.Q00_.Next;
  end;
  ReportZP2005PR.ShowReportEnd;
  finally
  ReportZP2005PR.Free;
  end;
end;

procedure PocetPrihlasenychVsetkyZP(X1: TMyReportParam;var iMyPocty:TMyPocty);
begin
  iMyPocty.pocet := 0;
  iMyPocty.pocet_zvyh := 0;
  try
  ReportZP2005PR:=TReportZP2005PR.Create(Application);
  ReportZP2005PR.SetX(X1);
  ReportZP2005PR.ShowReportStart;
  iMyPocty.pocet := ReportZP2005PR.Q00A_.RecordCount;
  iMyPocty.pocet_zvyh :=0;
  ReportZP2005PR.ShowReportEnd;
  finally
  ReportZP2005PR.Free;
  end;
end;

procedure PocetPrihlasenychVsetkyZP_Zlucene(X1: TMyReportParam;var iMyPocty:TMyPocty);
begin
  iMyPocty.pocet := 0;
  iMyPocty.pocet_zvyh := 0;
  try
  ReportZP2005PR:=TReportZP2005PR.Create(Application);
  ReportZP2005PR.SetX(X1);
  ReportZP2005PR.ShowReportStart514_Zlucene;
  iMyPocty.pocet := ReportZP2005PR.Q01A_.RecordCount;
  iMyPocty.pocet_zvyh :=0;
  ReportZP2005PR.ShowReportEnd;
  finally
  ReportZP2005PR.Free;
  end;
end;


procedure RunReportZP2005VY_RTF(const MyReportParam: TMyReportParam);
var PomObdobie:longint;
    cSumFrm : string;
begin with DM,ReportZP2005VY,MyOdvody[0],MySadzby do begin
  X:= MyReportParam;
  if X.AktObdobie >= Zakon_2009_01
    then cSumFrm := '%0.2f'
    else cSumFrm := '%0.0f';
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportZP2005VY:=TReportZP2005VY.Create(Application);
    if X.DisableShape then QRDisableShape(ReportZP2005VY);
    if X.DisableLabel then QRDisableLabel(ReportZP2005VY);
    Screen.Cursor:=crDefault;
    ReportZP2005VY.ShowReportStart;
    if X.AktObdobie >= Zakon_2009_01 then
    X.rtf_sablona := MyFrmPath + 'Vykaz_preddavky_zam_2009.rtf'
    else
    X.rtf_sablona := MyFrmPath + 'Vykaz_preddavky_zam.rtf';
    if not Q0_.EOF then
    begin
      Spracuj_Jednu_ZP;
      X.rtf_subor := MyRepPath1 + 'zp' + Q0_Kzp.AsString + '_vykaz_' + IntToStr(X.AktObdobie)+'.rtf';
      Rtf_Open(X);
      if X.Rtf_prepisat then
      begin
        Rtf_InitKeyWord;
        Rtf_SetKeyWord('$KZP',Q0_Kzp.AsString,0,' ');
        Rtf_SetKeyWord('$NAZOV_ZP',Q0_Nazov_zp.Value,0,' ');
        PomObdobie:= Obdobie_ADD_MM(X.AktObdobie,1);
        Rtf_SetKeyWord('$DEN_VYP',FormatDateTime('d.m.yyyy',LastDayDate(MyRok(PomObdobie),MyMesiac(PomObdobie),TINF_FZ_Den.Value)),0,' ');
        Rtf_SetKeyWord('$PRAV_FORMA',TINF_L_TYP_ZEL.Value,0,' ');
        Rtf_SetKeyWord('$RODNE_CISLO',TINF_FO_RC.Value,0,' ');
        Rtf_SetKeyWord('$CPP',TINF_FO_CPP.Value,0,' ');
        Rtf_SetKeyWord('$CIS_PLAT',QCBU_Old_cislo_u.Value,0,' ');
        Rtf_SetKeyWord('$ICO',Q1_ICO.Value,48,' ');
        Rtf_SetKeyWord('$DIC',TINF_DIC.Value,48,' ');
        Rtf_SetKeyWord('$SIDLO_OBEC',TINF_ADR_Mesto.Value,48,' ');
        Rtf_SetKeyWord('$SIDLO_ULICA',TINF_ADR_Ulica.Value,48,' ');
        Rtf_SetKeyWord('$SIDLO_PSC',TINF_ADR_PSC.Value,48,' ');
        Rtf_SetKeyWord('$SIDLO_STAT','Slovensko',48,' ');
        Rtf_SetKeyWord('$SIDLO_CISLO',TINF_ADR_Cislo.Value,48,' ');
        Rtf_SetKeyWord('$F_EMAIL',TINF_ADR_EMAIL.Value,48,' ');
        Rtf_SetKeyWord('$F_TELEFON',TINF_ADR_TELEFON.Value,48,' ');
        Rtf_SetKeyWord('$F_FAX',TINF_ADR_FAX.Value,48,' ');
        Rtf_SetKeyWord('$F_NAZOV_BANKY',TINF_NAZOV_BANKY.Value,48,' ');
        Rtf_SetKeyWord('$F_PREDC_U',TINF_Predcislo_u.Value,48,' ');
        Rtf_SetKeyWord('$F_CISLO_U',TINF_Cislo_u.Value,48,' ');
        Rtf_SetKeyWord('$F_BANKA_U',TINF_Banka_u.Value,48,' ');
        Rtf_SetKeyWord('$POC','1',48,' ');
        Rtf_SetKeyWord('$OBDOBIE',ObdobieToMMRRRR(X.AktObdobie),0,' ');
        Rtf_SetKeyWord('$F_MENO',X.AktFirmaStr,48,' ');
        Rtf_SetKeyWord('$PSC',Q1_ADR_PSC.Value,48,' ');
        PocetPrihlasenych(X.Kod_ZP,MyPocty);
        Rtf_SetKeyWord('$RR01',IntToStr(MyPocty.pocet),0,' ');
        Rtf_SetKeyWord('$RR02',IntToStr(MyPocty.pocet-MyPocty.pocet_zvyh),0,' ');
        Rtf_SetKeyWord('$RR03',IntToStr(pocet_plati),0,' ');
        Rtf_SetKeyWord('$RR04',IntToStr(pocet_kdni),0,' ');
        Rtf_SetKeyWord('$RRRR',Format(cSumFrm,[prijem]),0,' ');
        Rtf_SetKeyWord('$RR06',Format(cSumFrm,[cz_zdravot]),0,' ');
        Rtf_SetKeyWord('$RR07A',Format(cSumFrm,[DM.TSET_Fz_zdravot.Value]),0,' ');
        Rtf_SetKeyWord('$RR07B',Format(cSumFrm,[oz_zdravot]),0,' ');
        Rtf_SetKeyWord('$RR08A',Format(cSumFrm,[DM.TSET_F_zdravot.Value]),0,' ');
        Rtf_SetKeyWord('$RR08B',Format(cSumFrm,[o_zdravot]),0,' ');
        Rtf_SetKeyWord('$RR09',Format(cSumFrm,[oz_zdravot+o_zdravot]),0,' ');
        Rtf_SetKeyWord('$RR10',IntToStr(MyPocty.pocet_zvyh),0,' ');
        Rtf_SetKeyWord('$RR11',IntToStr(pocet_plati1),0,' ');
        Rtf_SetKeyWord('$RR12',IntToStr(pocet_kdni1),0,' ');
        Rtf_SetKeyWord('$RR13',Format(cSumFrm,[prijem1]),0,' ');
        Rtf_SetKeyWord('$RR14',Format(cSumFrm,[cz_zdravot1]),0,' ');
        Rtf_SetKeyWord('$RR15A',Format('%2.0n',[DM.TSET_Fz_zdravot1.Value]),0,' ');
        Rtf_SetKeyWord('$RR15B',Format(cSumFrm,[oz_zdravot1]),0,' ');
        Rtf_SetKeyWord('$RR16A',Format('%2.0n',[DM.TSET_F_zdravot1.Value]),0,' ');
        Rtf_SetKeyWord('$RR16B',Format(cSumFrm,[o_zdravot1]),0,' ');
        Rtf_SetKeyWord('$RR17',Format(cSumFrm,[oz_zdravot1+o_zdravot1]),0,' ');
        Rtf_SetKeyWord('$RR18',Format(cSumFrm,[oz_zdravot+o_zdravot+oz_zdravot1+o_zdravot1]),0,' ');
        Rtf_SetKeyWord('$TELEFON',X.Telefon,42,' ');
        Rtf_SetKeyWord('$VYPLNIL',X.Vykaz_Zostavil,42,' ');
        Rtf_SetKeyWord('$DNA',X.Vykaz_dna,24,' ');
        Rtf_Replace(X);
        ReportZP2005VY.ShowReportEnd;
        Rtf_Zobraz(X);
      end;
    end
    else
      raise EMyError.Create(Format(SMyAppNotFoundVykazZP,[X.Kod_ZP]));
    ReportZP2005VY.ShowReportEnd;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportZP2005VY.Free;
  end;
end;end;

procedure TReportZP2005VY.ReportZP2005VYBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,8);
end;

procedure RunReportZP2005VY_PDF(const MyReportParam: TMyReportParam);
var  ObdVyplatenia: longint;
    PocetVsetkychZam: TMyPocty;
    PomObdobie: longint;
    i:integer;
const cSumFrm:string = '%0.2f';
function idx(iPage:integer; iHod: integer): string;
begin
  idx := IntToStr((iPage-1)*18+iHod) + ']';
end;
begin with DM,ReportZP2005VY,MyOdvody[0],MySadzby  do begin
  X:=MyReportParam;
  if ((X.Kod_ZP<>24) AND (X.Kod_ZP<>25)) then begin
    MyError('PDF v˝kaz je podporovan˝ len pre poisùovne VäZP a DÙveru');
    exit;
  end;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportZP2005VY:=TReportZP2005VY.Create(Application);
    if X.DisableShape then QRDisableShape(ReportZP2005VY);
    if X.DisableLabel then QRDisableLabel(ReportZP2005VY);
    Screen.Cursor:=crDefault;
    ReportZP2005VY.ShowReportStart;
    if X.Kod_ZP = 24 {Dovera} then
      X.rtf_sablona := MyFrmPath + 'Dovera_MesVyk.pdf'
    else {VSZP}
      X.rtf_sablona := MyFrmPath + 'Vszp_MesVyk.pdf';
    ObdVyplatenia := Obdobie_ADD_MM (X.AktObdobie, 1);
    {repeat}
    if not Q0_.EOF then
    begin
      Spracuj_Jednu_ZP;
      if X.Kod_ZP = 24 {Dovera} then
        X.rtf_subor :=  MyRepPath1 + 'Dovera_MesVyk_'+IntToStr(X.AktObdobie)+X.AktSidListSuffix+'.xfdf'
      else {VSZP}
        X.rtf_subor :=  MyRepPath1 + 'Vszp_MesVyk_'+IntToStr(X.AktObdobie)+X.AktSidListSuffix+'.xfdf';
      Rtf_Open(X);
      if X.Rtf_prepisat then
      begin
        PocetPrihlasenych(X.Kod_ZP,MyPocty);
        PocetPrihlasenychVsetkyZP(X,PocetVsetkychZam);
        MyXML := '';
        E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
        E_TEXT('<xfdf xmlns="http://ns.adobe.com/xfdf/" xml:space="preserve">');
        E_TAGZ('fields');
        E_XFDF('Kod1',Copy(QCBU_Pobocka_ZP.AsString,1,1));
        E_XFDF('Kod2',Copy(QCBU_Pobocka_ZP.AsString,2,1));
        PomObdobie:= Obdobie_ADD_MM(X.AktObdobie,1);
        E_XFDF('Den_urc',FormatDateTime('d.m.yyyy',LastDayDate(MyRok(PomObdobie),MyMesiac(PomObdobie),TINF_FZ_Den.Value)));
        E_XFDF('4',FormatDateTime('d.m.yyyy',LastDayDate(MyRok(PomObdobie),MyMesiac(PomObdobie),TINF_FZ_Den.Value)));
        E_XFDF('Druh','N');
        E_XFDF('Obdobie',ObdobieToMMRRRR(X.AktObdobie));
        E_XFDF('3',ObdobieToMMRRRR(X.AktObdobie));
        {Cislo Platitela Poistneho}
        E_XFDF('1',QCBU_Old_cislo_u.Value);
        E_XFDF('CP.0',Copy(QCBU_Old_cislo_u.Value,1,1));
        E_XFDF('CP.1',Copy(QCBU_Old_cislo_u.Value,2,1));
        E_XFDF('CP.2',Copy(QCBU_Old_cislo_u.Value,3,1));
        E_XFDF('CP.3',Copy(QCBU_Old_cislo_u.Value,4,1));
        E_XFDF('CP.4',Copy(QCBU_Old_cislo_u.Value,5,1));
        E_XFDF('CP.5',Copy(QCBU_Old_cislo_u.Value,6,1));
        E_XFDF('CP.6',Copy(QCBU_Old_cislo_u.Value,7,1));
        E_XFDF('CP.7',Copy(QCBU_Old_cislo_u.Value,8,1));
        E_XFDF('CP.8',Copy(QCBU_Old_cislo_u.Value,9,1));
        E_XFDF('CP.9',Copy(QCBU_Old_cislo_u.Value,10,1));
        {DIC}
        E_XFDF('9',TINF_DIC.Value);
        E_XFDF('DIC.0',Copy(TINF_DIC.Value,1,1));
        E_XFDF('DIC.1',Copy(TINF_DIC.Value,2,1));
        E_XFDF('DIC.2',Copy(TINF_DIC.Value,3,1));
        E_XFDF('DIC.3',Copy(TINF_DIC.Value,4,1));
        E_XFDF('DIC.4',Copy(TINF_DIC.Value,5,1));
        E_XFDF('DIC.5',Copy(TINF_DIC.Value,6,1));
        E_XFDF('DIC.6',Copy(TINF_DIC.Value,7,1));
        E_XFDF('DIC.7',Copy(TINF_DIC.Value,8,1));
        E_XFDF('DIC.8',Copy(TINF_DIC.Value,9,1));
        E_XFDF('DIC.9',Copy(TINF_DIC.Value,10,1));
        {ICO}
        E_XFDF('10',TINF_ICO.Value);
        E_XFDF('ICO.0',Copy(TINF_ICO.Value,1,1));
        E_XFDF('ICO.1',Copy(TINF_ICO.Value,2,1));
        E_XFDF('ICO.2',Copy(TINF_ICO.Value,3,1));
        E_XFDF('ICO.3',Copy(TINF_ICO.Value,4,1));
        E_XFDF('ICO.4',Copy(TINF_ICO.Value,5,1));
        E_XFDF('ICO.5',Copy(TINF_ICO.Value,6,1));
        E_XFDF('ICO.6',Copy(TINF_ICO.Value,7,1));
        E_XFDF('ICO.7',Copy(TINF_ICO.Value,8,1));
        E_XFDF('ICO.8',Copy(TINF_ICO.Value,9,1));
        E_XFDF('ICO.9',Copy(TINF_ICO.Value,10,1));
        {Rodne cislo}
        E_XFDF('7',TINF_FO_RC.Value);
        E_XFDF('RC.0',Copy(TINF_FO_RC.Value,1,1));
        E_XFDF('RC.1',Copy(TINF_FO_RC.Value,2,1));
        E_XFDF('RC.2',Copy(TINF_FO_RC.Value,3,1));
        E_XFDF('RC.3',Copy(TINF_FO_RC.Value,4,1));
        E_XFDF('RC.4',Copy(TINF_FO_RC.Value,5,1));
        E_XFDF('RC.5',Copy(TINF_FO_RC.Value,6,1));
        E_XFDF('RC.6',Copy(TINF_FO_RC.Value,7,1));
        E_XFDF('RC.7',Copy(TINF_FO_RC.Value,8,1));
        E_XFDF('RC.8',Copy(TINF_FO_RC.Value,9,1));
        E_XFDF('RC.9',Copy(TINF_FO_RC.Value,10,1));
        {other}
        E_XFDF('Ulica',TINF_ADR_Ulica.Value);
        E_XFDF('79',TINF_ADR_Ulica.Value);
        E_XFDF('Cislo_pov',TINF_FO_CPP.Value);
        E_XFDF('8',TINF_FO_CPP.Value);
        {E_XFDF('Supis_cis.0',TINF_ADR_Cislo.Value);}
        E_XFDF('13',StrReplaceX(TINF_ADR_PSC.Value,' ',''));
        E_XFDF('PSC.0',Copy(StrReplaceX(TINF_ADR_PSC.Value,' ',''),1,1));
        E_XFDF('PSC.1',Copy(StrReplaceX(TINF_ADR_PSC.Value,' ',''),2,1));
        E_XFDF('PSC.2',Copy(StrReplaceX(TINF_ADR_PSC.Value,' ',''),3,1));
        E_XFDF('PSC.3',Copy(StrReplaceX(TINF_ADR_PSC.Value,' ',''),4,1));
        E_XFDF('PSC.4',Copy(StrReplaceX(TINF_ADR_PSC.Value,' ',''),5,1));
        E_XFDF('Cislo.0',TINF_ADR_Cislo.Value);
        E_XFDF('12',TINF_ADR_Cislo.Value);
        E_XFDF('Stat','Slovensko');
        E_XFDF('14','Slovensko');
        E_XFDF('Pocet_zam',IntToStr(MyPocty.pocet));
        E_XFDF('15',IntToStr(MyPocty.pocet));
        E_XFDF('Pocet_vs_zam',IntToStr(PocetVsetkychZam.pocet));
        E_XFDF('15_1',IntToStr(PocetVsetkychZam.pocet));
        E_XFDF('Pocet_zam_pred',IntToStr(pocet_plati));
        E_XFDF('16',IntToStr(pocet_plati));
        E_XFDF('Pocet_kal_dni',IntToStr(pocet_kdni));
        E_XFDF('17',IntToStr(pocet_kdni));
        E_XFDF('Celk_prijem',Format(cSumFrm,[prijem]));
        E_XFDF('18',Format(cSumFrm,[prijem]));
        E_XFDF('Vym_zaklad',Format(cSumFrm,[cz_zdravot]));
        E_XFDF('19',Format(cSumFrm,[cz_zdravot]));
        E_XFDF('Suma_pred',Format(cSumFrm,[oz_zdravot+o_zdravot]));
        E_XFDF('22',Format(cSumFrm,[oz_zdravot+o_zdravot]));
        E_XFDF('Pocet_zam_pred2',IntToStr(pocet_plati1));
        E_XFDF('23',IntToStr(pocet_plati1));
        E_XFDF('Pocet_kal_dni2',IntToStr(pocet_kdni1));
        E_XFDF('24',IntToStr(pocet_kdni1));
        E_XFDF('Celk_prijem2',Format(cSumFrm,[prijem1]));
        E_XFDF('25',Format(cSumFrm,[prijem1]));
        E_XFDF('Vym_zaklad2',Format(cSumFrm,[cz_zdravot1]));
        E_XFDF('26',Format(cSumFrm,[cz_zdravot1]));
        E_XFDF('Suma_pred2',Format(cSumFrm,[oz_zdravot1+o_zdravot1]));
        E_XFDF('29',Format(cSumFrm,[oz_zdravot1+o_zdravot1]));
        E_XFDF('Vylpnil.0',X.Vykaz_zostavil);
        E_XFDF('31',X.Vykaz_zostavil);
        E_XFDF('Telefon',X.Telefon);
        E_XFDF('32',X.Telefon);
        E_XFDF('Fax',X.Fax);
        E_XFDF('33',X.Fax);
        E_XFDF('Email',X.Mail);
        E_XFDF('34',X.Mail);
        E_XFDF('Suma_spolu',Format(cSumFrm,[oz_zdravot+o_zdravot+oz_zdravot1+o_zdravot1]));
        E_XFDF('30',Format(cSumFrm,[oz_zdravot+o_zdravot+oz_zdravot1+o_zdravot1]));
        if MyPocty.pocet>=1 then begin
          E_XFDF('Rodne_cislo1',MyPocty.zam[1].rc);
          E_XFDF('35_0',MyPocty.zam[1].rc);
          E_XFDF('Pocet_dni1',IntToStr(MyPocty.zam[1].pocet_kdni));
          E_XFDF('35_1',IntToStr(MyPocty.zam[1].pocet_kdni));
          E_XFDF('Cel_vyska_prijmu1',Format(cSumFrm,[MyPocty.zam[1].prijem]));
          E_XFDF('35_2',Format(cSumFrm,[MyPocty.zam[1].prijem]));
          E_XFDF('Vymer_zaklad1',Format(cSumFrm,[MyPocty.zam[1].z_zdravot]));
          E_XFDF('35_3',Format(cSumFrm,[MyPocty.zam[1].z_zdravot]));
          E_XFDF('Sazdba_zam1',Format(cSumFrm,[MyPocty.zam[1].fz_zdravot]));
          E_XFDF('35_4',Format(cSumFrm,[MyPocty.zam[1].fz_zdravot]));
          E_XFDF('Sadzba_poi1',Format(cSumFrm,[MyPocty.zam[1].f_zdravot]));
          E_XFDF('35_5',Format(cSumFrm,[MyPocty.zam[1].f_zdravot]));
          E_XFDF('Suma_pred_zam1',Format(cSumFrm,[MyPocty.zam[1].oz_zdravot]));
          E_XFDF('35_6',Format(cSumFrm,[MyPocty.zam[1].oz_zdravot]));
          E_XFDF('Suma_pred_poi1',Format(cSumFrm,[MyPocty.zam[1].o_zdravot]));
          E_XFDF('35_7',Format(cSumFrm,[MyPocty.zam[1].o_zdravot]));
          E_XFDF('Pred_spolu1',Format(cSumFrm,[MyPocty.zam[1].oz_zdravot+MyPocty.zam[1].o_zdravot]));
          E_XFDF('35_8',Format(cSumFrm,[MyPocty.zam[1].oz_zdravot+MyPocty.zam[1].o_zdravot]));
        end;
        if MyPocty.pocet>=2 then begin
          E_XFDF('Rodne_cislo2',MyPocty.zam[2].rc);
          E_XFDF('36_0',MyPocty.zam[2].rc);
          E_XFDF('Pocet_dni2',IntToStr(MyPocty.zam[2].pocet_kdni));
          E_XFDF('36_1',IntToStr(MyPocty.zam[2].pocet_kdni));
          E_XFDF('Cel_vyska_prijmu2',Format(cSumFrm,[MyPocty.zam[2].prijem]));
          E_XFDF('36_2',Format(cSumFrm,[MyPocty.zam[2].prijem]));
          E_XFDF('Vymer_zaklad2',Format(cSumFrm,[MyPocty.zam[2].z_zdravot]));
          E_XFDF('36_3',Format(cSumFrm,[MyPocty.zam[2].z_zdravot]));
          E_XFDF('Sazdba_zam2',Format(cSumFrm,[MyPocty.zam[2].fz_zdravot]));
          E_XFDF('36_4',Format(cSumFrm,[MyPocty.zam[2].fz_zdravot]));
          E_XFDF('Sadzba_poi2',Format(cSumFrm,[MyPocty.zam[2].f_zdravot]));
          E_XFDF('36_5',Format(cSumFrm,[MyPocty.zam[2].f_zdravot]));
          E_XFDF('Suma_pred_zam2',Format(cSumFrm,[MyPocty.zam[2].oz_zdravot]));
          E_XFDF('36_6',Format(cSumFrm,[MyPocty.zam[2].oz_zdravot]));
          E_XFDF('Suma_pred_poi2',Format(cSumFrm,[MyPocty.zam[2].o_zdravot]));
          E_XFDF('36_7',Format(cSumFrm,[MyPocty.zam[2].o_zdravot]));
          E_XFDF('Pred_spolu2',Format(cSumFrm,[MyPocty.zam[2].oz_zdravot+MyPocty.zam[2].o_zdravot]));
          E_XFDF('36_8',Format(cSumFrm,[MyPocty.zam[2].oz_zdravot+MyPocty.zam[2].o_zdravot]));
        end;
        E_XFDF('Datum_vypl',FormatDateTime('dd.mm.yyyy',X.Vykaz_dna_DT));
        E_XFDF('37',FormatDateTime('dd.mm.yyyy',X.Vykaz_dna_DT));
        E_XFDF('Obec.0',TINF_ADR_Mesto.Value);
        E_XFDF('78',TINF_ADR_Mesto.Value);
        E_XFDF('Prav_forma',TINF_L_TYP_ZEL.Value);
        E_XFDF('6',TINF_L_TYP_ZEL.Value);
        E_XFDF('Nazov',X.AktFirmaStr);
        E_XFDF('5',X.AktFirmaStr);
        E_XFDF('Predd1',Format(cSumFrm,[oz_zdravot]));
        E_XFDF('20',Format(cSumFrm,[oz_zdravot]));
        E_XFDF('Predd2',Format(cSumFrm,[o_zdravot]));
        E_XFDF('21',Format(cSumFrm,[o_zdravot]));
        E_XFDF('Sadzba1',StrReplaceX(Format('%0.0n',[DM.TSET_Fz_zdravot.Value]),'.',','));
        E_XFDF('Sadzba2',StrReplaceX(Format('%0.0n',[DM.TSET_F_zdravot.Value]),'.',','));
        E_XFDF('Sadzba1_2',StrReplaceX(Format('%0.0n',[DM.TSET_Fz_zdravot1.Value]),'.',','));
        E_XFDF('Sadzba2_2',StrReplaceX(Format('%0.0n',[DM.TSET_F_zdravot1.Value]),'.',','));
        E_XFDF('Predd_2',Format(cSumFrm,[oz_zdravot1]));
        E_XFDF('27',Format(cSumFrm,[oz_zdravot1]));
        E_XFDF('Predd2_2',Format(cSumFrm,[o_zdravot1]));
        E_XFDF('28',Format(cSumFrm,[o_zdravot1]));
        {--}
        E_XFDF('2','N');
     end;
        E_TAGK('fields');
        E_ATTRZ('href',X.rtf_sablona);
        E_TAGA('f',MyAttr);
        E_TAGK('xfdf');
        Rtf_Uloz_XML(X);
      end;
    ReportZP2005VY.ShowReportEnd;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
 end;
 finally
    Screen.Cursor:=crDefault;
    ReportZP2005VY.Free;
 end;
  Rtf_zobraz(X);
end;end;

end.
