unit REXVL4;

(*

GFK objednavka na zostavu v tvare:

– zjednodusena vyplatna listina suhrnna

Jeden riadok s naledovnymi stlpcami

1/ Meno priezvisko
2/ Brutto mzda
3/ Daò
4/ Doplatky
5/ Netto

*)

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportVL4 = class(TQuickRep)
    GroupFooterBand1: TQRBand;
    QRShape11: TQRShape;
    QRShape104: TQRShape;
    QRShape122: TQRShape;
    QRShape123: TQRShape;
    QRExpr14: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr26: TQRExpr;
    QRLabel61: TQRLabel;
    Q0_: TQuery;
    Q0_Name: TStringField;
    Q0_Surname: TStringField;
    Q0_Title: TStringField;
    Q0_CALC_MPT: TStringField;
    QRGroup1: TQRGroup;
    Q0_v_obdobie: TIntegerField;
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
    Q0_F_dan_sadzba1: TFloatField;
    Q0_F_dan_maximum1: TCurrencyField;
    Q0_CALC_PREMIE: TCurrencyField;
    Q0_CALC_NAHRADY: TCurrencyField;
    PageHeaderBand1: TQRBand;
    QRShape84: TQRShape;
    QRLabel47: TQRLabel;
    QRDBText2: TQRDBText;
    Q0_code_emp: TIntegerField;
    Q0_CALC_FIRMA: TStringField;
    Q0_CALC_DAVKY_NP: TCurrencyField;
    Q0_V_den: TFloatField;
    Q0_CALC_OSTATNE_P: TCurrencyField;
    Q0_N_socfond: TCurrencyField;
    Q0_D_ciastzd2: TCurrencyField;
    Q0_D_zdanmzda2: TCurrencyField;
    Q0_D_vyrovnanie: TCurrencyField;
    Q0_N_clenovia_organov: TCurrencyField;
    Q0_Ne_stravne: TCurrencyField;
    Q0_CALC_OSTATNE_Z: TCurrencyField;
    Q0_n_jednoraz: TCurrencyField;
    Q0_N_odstupne: TCurrencyField;
    Q0_N_pohotovost: TCurrencyField;
    Q0_N_nahrada: TCurrencyField;
    QRSysData2: TQRSysData;
    Q0_N_nemohol: TCurrencyField;
    Q0_N_ddp: TCurrencyField;
    Q0_Nz_ddp: TCurrencyField;
    QRShape78: TQRShape;
    QRExpr34: TQRExpr;
    QRShape9: TQRShape;
    QRLabel13: TQRLabel;
    QRShape52: TQRShape;
    QRLabel30: TQRLabel;
    QRShape6: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape80: TQRShape;
    QRLabel42: TQRLabel;
    Q0_Oz_zdravot: TCurrencyField;
    Q0_Oz_nemoc: TCurrencyField;
    Q0_Oz_dochod: TCurrencyField;
    Q0_Oz_fondzam: TCurrencyField;
    Q0_O_invalid: TCurrencyField;
    Q0_Oz_invalid: TCurrencyField;
    Q0_Oz_uraz: TCurrencyField;
    Q0_Oz_rezerva: TCurrencyField;
    Q0_Oz_garancne: TCurrencyField;
    Q0_N_nahrada_pn: TCurrencyField;
    Q0_D_bonus_cerpany: TCurrencyField;
    Q0_N_mimo_poistne: TCurrencyField;
    QRShape57: TQRShape;
    Q0_Vyrovnanie_zp: TCurrencyField;
    Q0_Zvys_ostatne: TCurrencyField;
    DetailBand1: TQRBand;
    QRShape3: TQRShape;
    QRDBText12: TQRDBText;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRDBText16: TQRDBText;
    QRShape43: TQRShape;
    QRDBText41: TQRDBText;
    QRShape45: TQRShape;
    QRDBText47: TQRDBText;
    QRSysData1: TQRSysData;
    QRDBText8: TQRDBText;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure ReportVLBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    first_preview : boolean;
  public
    procedure ShowReport;

  end;

var
  ReportVL4: TReportVL4;

procedure RunReportVL4(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportVL4.ShowReport;
begin
  first_preview := true;
  if X.Abeceda
   then Q0_.SQL.Add('order by z.surname,z.name')
    else Q0_.SQL.Add('order by z.code_numb');
  QRLabel47.Caption := 'Výplatná listina súhrnná za ' +
     Mesiac(X.AktObdobie mod 100,false)+' '+IntToStr(X.AktObdobie div 100);
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q0_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q0_.Open;
  Preview;
  Q0_.Close;
end;


procedure TReportVL4.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_CALC_FIRMA.Value:='FIRMA: '+X.AktFirmaStr;

  Q0_CALC_MPT.Value:=
    COPY(PMT(Q0_Surname.Value,Q0_Name.Value,Q0_Title.Value),1,100);

(*
  Q0_CALC_PREMIE.Value :=
    Q0_N_Premie.Value +
    Q0_N_Odmeny.Value +
    Q0_N_Jednoraz.Value;

  Q0_CALC_NAHRADY.Value :=
    Q0_N_Nahrada.Value +
    Q0_N_nemohol.Value;

  Q0_CALC_DAVKY_NP.Value :=
    Q0_Nd_spolu.Value -
    Q0_Nd_materska.value -
    Q0_Nd_pridavky.Value -
    Q0_Nd_ine.Value;

  Q0_CALC_OSTATNE_P.Value :=
    Q0_N_SOCFOND.Value +
    Q0_N_clenovia_organov.Value+
    Q0_N_pohotovost.Value+
    Q0_N_odstupne.value;

  Q0_CALC_OSTATNE_Z.Value :=
    Q0_Ne_exekucia.Value;
*)
end;

procedure RunReportVL4(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportVL4:=TReportVL4.Create(Application);
    if X.DisableShape then QRDisableShape(ReportVL4);
    if X.DisableLabel then QRDisableLabel(ReportVL4);
    Screen.Cursor:=crDefault;
    ReportVL4.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportVL4.Free;
  end;
end;

procedure TReportVL4.ReportVLBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,8);
  Q0_.First;
end;






end.
