unit VD2009B;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, MyConsts, MyQuick, Db,
  DBTables;

type
  TReportVD2009B = class(TQuickRep)
    Q1_: TQuery;
    Q1_born_numb: TStringField;
    Q1_surname: TStringField;
    Q1_name: TStringField;
    Q1_title: TStringField;
    Q1_tp_street: TStringField;
    Q1_tp_city: TStringField;
    Q1_tp_zip: TStringField;
    Q1_code_emp: TIntegerField;
    Q1_born_date: TDateField;
    Q0_: TQuery;
    Q0_code_emp: TIntegerField;
    Q0_n_brutto: TCurrencyField;
    Q0_d_ciastzd: TCurrencyField;
    Q0_d_preddavky: TCurrencyField;
    Q0_zuct_zac: TSmallintField;
    Q0_zuct_kon: TSmallintField;
    Q0_d_bonus_cerpany: TCurrencyField;
    Q0_poc_deti: TSmallintField;
    DS0: TDataSource;
    Q0_CALC_ZUCTOVANE: TStringField;
    Q0_CALC_DIC: TStringField;
    Q1_stat_tp: TStringField;
    Q1_L_STAT_TP: TStringField;
    QSUM_: TQuery;
    QSUM_code_emp: TIntegerField;
    QSUM_d_ciastzd: TCurrencyField;
    QSUM_d_preddavok: TCurrencyField;
    QSUM_n_brutto: TCurrencyField;
    QSUM_d_osobitna: TCurrencyField;
    QSUM_d_dan: TCurrencyField;
    QSUM_d_bonus_narok: TCurrencyField;
    QSUM_d_bonus_cerpany: TCurrencyField;
    QSUM_nepenazny_prijem: TCurrencyField;
    QMES_: TQuery;
    QMES_code_emp: TIntegerField;
    QMES_v_mesiac: TSmallintField;
    QVYSL_: TQuery;
    QVYSL_Code_emp: TIntegerField;
    QVYSL_Prijmy: TCurrencyField;
    QVYSL_Zaklad_dane: TCurrencyField;
    QVYSL_Preddavky: TCurrencyField;
    QVYSL_Prijmy_nepenazne: TCurrencyField;
    QVYSL_Vyplateny_bonus: TCurrencyField;
    QVYSL_Pocet_deti: TSmallintField;
    QVYSL_Mesiace: TStringField;
    QVYSL_Name: TStringField;
    QVYSL_Surname: TStringField;
    QVYSL_Title: TStringField;
    QVYSL_Born_date: TDateField;
    QVYSL_Tp_street: TStringField;
    QVYSL_Tp_city: TStringField;
    QVYSL_Tp_zip: TStringField;
    QVYSL_Stat_tp: TStringField;
    QVYSL_Born_numb: TStringField;
    QVYSL_L_TP_STAT: TStringField;
    QSUM_pocet_deti: TIntegerField;
    DetailBand1: TQRBand;
    QRShape9: TQRShape;
    QRShape8: TQRShape;
    QRA2: TQRLabel;
    QRA31: TQRLabel;
    QRA32: TQRLabel;
    QRA33: TQRLabel;
    QRA34: TQRLabel;
    QRA35: TQRLabel;
    QRA36: TQRLabel;
    QRA4: TQRLabel;
    QRA37: TQRLabel;
    QRLabel4: TQRLabel;
    QRA5: TQRLabel;
    QRA6: TQRLabel;
    QRA7: TQRLabel;
    QRA81: TQRLabel;
    QRA82: TQRLabel;
    QRB1: TQRLabel;
    QRB2: TQRLabel;
    QRB31: TQRLabel;
    QRB32: TQRLabel;
    QRB33: TQRLabel;
    QRB34: TQRLabel;
    QRB35: TQRLabel;
    QRB37: TQRLabel;
    QRB36: TQRLabel;
    QRB4: TQRLabel;
    QRLabel5: TQRLabel;
    QRB5: TQRLabel;
    QRB6: TQRLabel;
    QRB7: TQRLabel;
    QRB81: TQRLabel;
    QRB82: TQRLabel;
    QRA1: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape20: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRC1: TQRLabel;
    QRC2: TQRLabel;
    QRC31: TQRLabel;
    QRC32: TQRLabel;
    QRC33: TQRLabel;
    QRC34: TQRLabel;
    QRC35: TQRLabel;
    QRC36: TQRLabel;
    QRC4: TQRLabel;
    QRC6: TQRLabel;
    QRC7: TQRLabel;
    QRC81: TQRLabel;
    QRC82: TQRLabel;
    QRD1: TQRLabel;
    QRD2: TQRLabel;
    QRD31: TQRLabel;
    QRD32: TQRLabel;
    QRD33: TQRLabel;
    QRD34: TQRLabel;
    QRD36: TQRLabel;
    QRD4: TQRLabel;
    QRD6: TQRLabel;
    QRD7: TQRLabel;
    QRD81: TQRLabel;
    QRD37: TQRLabel;
    QRD82: TQRLabel;
    QRLabel67: TQRLabel;
    QRC37: TQRLabel;
    QRC5: TQRLabel;
    QRLabel70: TQRLabel;
    QRD5: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel7: TQRLabel;
    QRShape21: TQRShape;
    QRLabel10: TQRLabel;
    QRShape22: TQRShape;
    QRLabel12: TQRLabel;
    QRShape23: TQRShape;
    QRLabel13: TQRLabel;
    QRShape24: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape4: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel20: TQRLabel;
    QRShape29: TQRShape;
    QRLabel21: TQRLabel;
    QRShape30: TQRShape;
    QRLabel22: TQRLabel;
    QRShape31: TQRShape;
    QRLabel23: TQRLabel;
    QRShape32: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRD35: TQRLabel;
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
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel68: TQRLabel;
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
    QRLabel69: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRShape111: TQRShape;
    QRShape112: TQRShape;
    QRLabel74: TQRLabel;
    QRShape113: TQRShape;
    QRLabel75: TQRLabel;
    QRShape114: TQRShape;
    QRLabel76: TQRLabel;
    QRShape115: TQRShape;
    QRLabel77: TQRLabel;
    QRShape116: TQRShape;
    QRShape5: TQRShape;
    QRShape25: TQRShape;
    QRMemo1: TQRMemo;
    QRShape6: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape7: TQRShape;
    QRLabel_rok: TQRLabel;
    QRPage: TQRLabel;
    QSUM2_: TQuery;
    CurrencyField4: TCurrencyField;
    CurrencyField5: TCurrencyField;
    CurrencyField6: TCurrencyField;
    CurrencyField8: TCurrencyField;
    QSUM2_Born_numb: TStringField;
    QSUM2_Name: TStringField;
    QSUM2_Surname: TStringField;
    QSUM2_Title: TStringField;
    QSUM2_Tp_street: TStringField;
    QSUM2_Tp_city: TStringField;
    QSUM2_Tp_zip: TStringField;
    QSUM2_n_poist: TCurrencyField;
    QSUM2_o_zdravot: TCurrencyField;
    QSUM2_n_brutto: TCurrencyField;
    QSUM2_d_preddavok: TCurrencyField;
    QSUM2_pocet_deti: TIntegerField;
    QSUM2_Stat_tp: TStringField;
    QSUM2_L_STAT_TP: TStringField;
    QSUM2_VYHL: TBooleanField;
    QSUM2_d_bonus_cerpany: TCurrencyField;
    QEXRZP_: TQuery;
    QEXRZP_code_emp: TIntegerField;
    QSUM2_L_RZP: TIntegerField;
    QEXRZP_premia_suma: TCurrencyField;
    QSUM2_L_PREMIA: TCurrencyField;
    QSUMRZP_: TQuery;
    QSUMRZP_premia_suma: TCurrencyField;
    QSUMRZP_preplatok: TCurrencyField;
    QSUMRZP_d_bonus: TCurrencyField;
    Q1_typzec: TSmallintField;
    QSUM2_n_dohody_ovp: TCurrencyField;
    QEXRZP_d_bonus: TCurrencyField;
    QSUM2_L_BONUS: TFloatField;
    QSUMRZP_d_neu_preplatok: TCurrencyField;
    QSUM2012_: TQuery;
    QDET_: TQuery;
    QDET_code_emp: TIntegerField;
    QDET_pocet_deti: TIntegerField;
    QSUM2012_code_emp: TIntegerField;
    QSUM2012_born_numb: TStringField;
    QSUM2012_name: TStringField;
    QSUM2012_surname: TStringField;
    QSUM2012_VYHL: TIntegerField;
    QSUM2012_d_ciastzd: TCurrencyField;
    QSUM2012_d_preddavok: TCurrencyField;
    QSUM2012_n_brutto: TCurrencyField;
    QSUM2012_d_osobitna: TCurrencyField;
    QSUM2012_d_dan: TCurrencyField;
    QSUM2012_d_bonus_narok: TCurrencyField;
    QSUM2012_d_bonus_cerpany: TCurrencyField;
    QSUM2012_nepenazny_prijem: TCurrencyField;
    QSUM2012_n_poist: TCurrencyField;
    QSUM2012_o_zdravot: TCurrencyField;
    QSUM2012_n_dohody_ovp: TCurrencyField;
    QSUM2012D_: TQuery;
    IntegerField4: TIntegerField;
    QSUM2012D_n_dohody: TCurrencyField;
    QSUM2012_L_N_DOHODY: TCurrencyField;
    QSUM2012_born_date: TDateField;
    QEXRZP_nc_minimum: TCurrencyField;
    QEXRZP_nc_partner: TCurrencyField;
    QEXRZP_uhrn_preddavkov: TCurrencyField;
    QEXRZP_premia_mesiacov: TSmallintField;
    QEXRZP_poistne: TCurrencyField;
    QEXRZP_ddp: TCurrencyField;
    DS_SUM2012: TDataSource;
    QRZP_: TQuery;
    QRZP_code_emp: TIntegerField;
    QRZP_premia_suma: TCurrencyField;
    QRZP_premia_mesiacov: TSmallintField;
    QRZP_d_bonus: TCurrencyField;
    QRZP_nc_minimum: TCurrencyField;
    QRZP_nc_partner: TCurrencyField;
    QRZP_uhrn_preddavkov: TCurrencyField;
    QRZP_poistne: TCurrencyField;
    QRZP_ddp: TCurrencyField;
    QRZP_preplatok: TCurrencyField;
    QSUM2012_tp_ulica: TStringField;
    QSUM2012_tp_ocislo: TStringField;
    QSUM2012_tp_supcislo: TIntegerField;
    QSUM2012_tp_zip: TStringField;
    QSUM2012_tp_city: TStringField;
    QSUM2012_stat_tp: TStringField;
    QSUM2012_stat_nazov: TStringField;
    QSUM2_Code_emp: TIntegerField;
    QSUM2_d_ciastzd: TCurrencyField;
    QRZP_prispevky_ds: TCurrencyField;
    QRZP_prispevky_dds: TCurrencyField;
    procedure ReportVD2009BNeedData(Sender: TObject;
      var MoreData: Boolean);
    procedure ReportVD2009BBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure Q0_CalcFields(DataSet: TDataSet);
  private
    first_preview : boolean;
  public
    pocet_stran: longint;
    treba_tlacit: boolean;
    aktual_strana: longint;
    procedure ShowReport;
    procedure SetX(const MyReportParam:TMyReportParam);

  end;

var
  ReportVD2009B: TReportVD2009B;

procedure RunReportVD2009B(const MyReportParam: TMyReportParam);
procedure RunReportVD2009B_PDF(const MyReportParam: TMyReportParam);

implementation

uses Dm_main, REXVD2, DM_sql, M_Pomoc;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportVD2009B.SetX(const MyReportParam:TMyReportParam);
begin
  X:=MyReportParam;
end;

procedure TReportVD2009B.ShowReport;
var rok: integer;
begin
  first_preview := true;
  rok:=MyRok(X.AktObdobie);
  QRLabel_rok.Caption := 'za rok '+IntToStr(rok);
  Q0_.ParamByName('p1').Value:=rok*100+1;
  Q0_.ParamByName('p2').Value:=rok*100+12;
  Q0_.Open;
  Pocet_stran := ((Q0_.Recordcount-1) div 4) + 1;
  Q1_.Open;
  Preview;
  Q1_.Close;
  Q0_.Close;
end;

procedure RunReportVD2009B(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportVD2009B:=TReportVD2009B.Create(Application);
    if X.DisableShape then QRDisableShape(ReportVD2009B);
    if X.DisableLabel then QRDisableLabel(ReportVD2009B);
    Screen.Cursor:=crDefault;
    ReportVD2009B.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportVD2009B.Q0_.Close;
    ReportVD2009B.Free;
  end;
end;

procedure TReportVD2009B.ReportVD2009BNeedData(Sender: TObject;
  var MoreData: Boolean);
var ulica,cislo:string;
begin
  Inc(aktual_strana);
  QRPage.Caption := 'Strana è. ' + IntToStr(aktual_strana) + ' / ' + IntToStr(pocet_stran);
{--nulovanie}
  QRA1.Caption  := '';
  QRA2.Caption  := '';
  QRA31.Caption := '';
  QRA32.Caption := '';
  QRA33.Caption := '';
  QRA34.Caption := '';
  QRA35.Caption := '';
  QRA36.Caption := '';
  QRA37.Caption := '';
  QRA4.Caption  := '';
  QRA5.Caption  := '';
  QRA6.Caption  := '';
  QRA7.Caption  := '';
  QRA81.Caption := '';
  QRA82.Caption := '';

  QRB1.Caption  := '';
  QRB2.Caption  := '';
  QRB31.Caption := '';
  QRB32.Caption := '';
  QRB33.Caption := '';
  QRB34.Caption := '';
  QRB35.Caption := '';
  QRB36.Caption := '';
  QRB37.Caption := '';
  QRB4.Caption  := '';
  QRB5.Caption  := '';
  QRB6.Caption  := '';
  QRB7.Caption  := '';
  QRB81.Caption := '';
  QRB82.Caption := '';

  QRC1.Caption  := '';
  QRC2.Caption  := '';
  QRC31.Caption := '';
  QRC32.Caption := '';
  QRC33.Caption := '';
  QRC34.Caption := '';
  QRC35.Caption := '';
  QRC36.Caption := '';
  QRC37.Caption := '';
  QRC4.Caption  := '';
  QRC5.Caption  := '';
  QRC6.Caption  := '';
  QRC7.Caption  := '';
  QRC81.Caption := '';
  QRC82.Caption := '';

  QRD1.Caption  := '';
  QRD2.Caption  := '';
  QRD31.Caption := '';
  QRD32.Caption := '';
  QRD33.Caption := '';
  QRD34.Caption := '';
  QRD35.Caption := '';
  QRD36.Caption := '';
  QRD37.Caption := '';
  QRD4.Caption  := '';
  QRD5.Caption  := '';
  QRD6.Caption  := '';
  QRD7.Caption  := '';
  QRD81.Caption := '';
  QRD82.Caption := '';
treba_tlacit := false;
{--prvy zaznam}
if not Q0_.EOF then
begin
  treba_tlacit := true;
  MyRozdelUlicu(Q1_TP_street.Value,ulica,cislo);
  QRA1.Caption := Q1_Born_numb.Value;
  QRA2.Caption := Q1_Born_date.AsString;
  QRA31.Caption := Uppercase(Q1_Surname.Value);
  QRA32.Caption := Uppercase(Q1_Name.Value);
  QRA33.Caption := Uppercase(ulica);
  QRA34.Caption := Uppercase(cislo);
  QRA35.Caption := Uppercase(Q1_TP_city.Value);
  QRA36.Caption := Uppercase(Q1_L_STAT_TP.Value);
  QRA37.Caption := Uppercase(Q1_TP_zip.Value);
  QRA4.Caption := Format('%0.2f',[Q0_N_brutto.Value]);
  QRA5.Caption := Q0_CALC_Zuctovane.AsString;
  QRA6.Caption := Format('%0.2f',[Q0_D_ciastzd.Value]);
  QRA7.Caption := Format('%0.2f',[Q0_D_preddavky.Value]);
  QRA81.Caption := Format('%0.2f',[Q0_D_bonus_cerpany.Value]);
  QRA82.Caption := Q0_Poc_deti.AsString;
  Q0_.Next;
end;
{--druhy zaznam}
if not Q0_.EOF then
begin
  MyRozdelUlicu(Q1_TP_street.Value,ulica,cislo);
  QRB1.Caption := Q1_Born_numb.Value;
  QRB2.Caption := Q1_Born_date.AsString;
  QRB31.Caption := Uppercase(Q1_Surname.Value);
  QRB32.Caption := Uppercase(Q1_Name.Value);
  QRB33.Caption := Uppercase(ulica);
  QRB34.Caption := Uppercase(cislo);
  QRB35.Caption := Uppercase(Q1_TP_city.Value);
  QRB36.Caption := Uppercase(Q1_L_STAT_TP.Value);
  QRB37.Caption := Uppercase(Q1_TP_zip.Value);
  QRB4.Caption  := Format('%0.2f',[Q0_N_brutto.Value]);
  QRB5.Caption  := Q0_CALC_Zuctovane.AsString;
  QRB6.Caption  := Format('%0.2f',[Q0_D_ciastzd.Value]);
  QRB7.Caption  := Format('%0.2f',[Q0_D_preddavky.Value]);
  QRB81.Caption := Format('%0.2f',[Q0_D_bonus_cerpany.Value]);
  QRB82.Caption := Q0_Poc_deti.AsString;
  Q0_.Next;
end;
{--treti zaznam}
if not Q0_.EOF then
begin
  MyRozdelUlicu(Q1_TP_street.Value,ulica,cislo);
  QRC1.Caption := Q1_Born_numb.Value;
  QRC2.Caption := Q1_Born_date.AsString;
  QRC31.Caption := Uppercase(Q1_Surname.Value);
  QRC32.Caption := Uppercase(Q1_Name.Value);
  QRC33.Caption := Uppercase(ulica);
  QRC34.Caption := Uppercase(cislo);
  QRC35.Caption := Uppercase(Q1_TP_city.Value);
  QRC36.Caption := Uppercase(Q1_L_STAT_TP.Value);
  QRC37.Caption := Uppercase(Q1_TP_zip.Value);
  QRC4.Caption  := Format('%0.2f',[Q0_N_brutto.Value]);
  QRC5.Caption  := Q0_CALC_Zuctovane.AsString;
  QRC6.Caption  := Format('%0.2f',[Q0_D_ciastzd.Value]);
  QRC7.Caption  := Format('%0.2f',[Q0_D_preddavky.Value]);
  QRC81.Caption := Format('%0.2f',[Q0_D_bonus_cerpany.Value]);
  QRC82.Caption := Q0_Poc_deti.AsString;
  Q0_.Next;
end;
{--stvrty zaznam}
if not Q0_.EOF then
begin
  MyRozdelUlicu(Q1_TP_street.Value,ulica,cislo);
  QRD1.Caption := Q1_Born_numb.Value;
  QRD2.Caption := Q1_Born_date.AsString;
  QRD31.Caption := Uppercase(Q1_Surname.Value);
  QRD32.Caption := Uppercase(Q1_Name.Value);
  QRD33.Caption := Uppercase(ulica);
  QRD34.Caption := Uppercase(cislo);
  QRD35.Caption := Uppercase(Q1_TP_city.Value);
  QRD36.Caption := Uppercase(Q1_L_STAT_TP.Value);
  QRD37.Caption := Uppercase(Q1_TP_zip.Value);
  QRD4.Caption  := Format('%0.2f',[Q0_N_brutto.Value]);
  QRD5.Caption  := Q0_CALC_Zuctovane.AsString;
  QRD6.Caption  := Format('%0.2f',[Q0_D_ciastzd.Value]);
  QRD7.Caption  := Format('%0.2f',[Q0_D_preddavky.Value]);
  QRD81.Caption := Format('%0.2f',[Q0_D_bonus_cerpany.Value]);
  QRD82.Caption := Q0_Poc_deti.AsString;
  Q0_.Next;
end;
{--zistenie, ci treba tlacit }
  MoreData := treba_tlacit; //not Q0_.EOF;
  if not MoreData then begin
    exit;
  end;
end;

procedure TReportVD2009B.ReportVD2009BBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  Q0_.First;
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,4);
  aktual_strana:=0;
  PrintReport := Q0_.RecordCount > 0;
end;

procedure TReportVD2009B.Q0_CalcFields(DataSet: TDataSet);
var zac, kon, i: byte;
begin
    if Q0_Zuct_zac.value=null then
       Q0_CALC_ZUCTOVANE.Value:=''
    else begin
         zac:=Q0_Zuct_zac.value;
         kon:=Q0_Zuct_kon.value;
         if (zac=1) and (kon=12) then
         begin
           Q0_CALC_ZUCTOVANE.Value:='  X  ';
         end else
         begin
           Q0_CALC_ZUCTOVANE.Value:='    ';
           for i:=1 to 12 do begin
             if (i>=zac) and (i<=kon) then
               Q0_CALC_ZUCTOVANE.Value:=Q0_CALC_ZUCTOVANE.Value+' X '
             else
               Q0_CALC_ZUCTOVANE.Value:=Q0_CALC_ZUCTOVANE.Value+'   '
           end;
         end;
    end;

  Q0_CALC_DIC.Value := DM.TINF_DIC.Value;
end;

procedure Stlpec(var str,stlp,poc_str:integer);
var i,j,_str:integer;
  A1,A2,A3,pom,uv:string;
begin with ReportVD2009B,DM do begin
  _str:=((str-1) div 4)+1;
  if stlp=1 then begin
    X.rtf_sablona := MyFrmPath + 'rh2004_3.pdf';
    X.rtf_subor :=  MyRepPath1 + 'RH3_'+IntToStr(MyRok(X.AktObdobie))+'_'+LPAD(IntToStr(str),3,'0')+'.xfdf';
    X.rtf_prepisat:= True;
    Rtf_Open(X);
    MyXML := '';
    E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
    E_TEXT('<xfdf xmlns="http://ns.adobe.com/xfdf/" xml:space="preserve">');
    E_TEXT('<fields>');
    E_XFDF('DIC',TINF_DIC.Value);
    E_XFDF(IntToStr(1)+'.Strana',IntToStr(str));
    E_XFDF('pocet',IntToStr(QVYSL_.RecordCount));
    E_XFDF('PocetStran',IntToStr(poc_str));
  end;
  uv:=IntToStr(1)+'.'+IntToStr(stlp)+'.';
  E_XFDF(uv+'RC-a',Copy(RC_BEZ(QVYSL_born_numb.Value),1,6));
  E_XFDF(uv+'RC-b',Copy(RC_BEZ(QVYSL_born_numb.Value),7,4));
  if QVYSL_born_numb.AsString='' then begin
    E_XFDF(uv+'DN-den',FormatDateTime('dd',QVYSL_born_date.Value));
    E_XFDF(uv+'DN-mes',FormatDateTime('mm',QVYSL_born_date.Value));
    E_XFDF(uv+'DN-rok',FormatDateTime('yyyy',QVYSL_born_date.Value));
  end;
  E_XFDF(uv+'Priezvisko',QVYSL_Surname.Value);
  E_XFDF(uv+'Meno',QVYSL_Name.Value);
  MyRozdelUlicuExt(QVYSL_Tp_street.Value,A1,A2,A3);
  E_XFDF(uv+'Ulica',A1);
  E_XFDF(uv+'Cislo',A2);
  E_XFDF(uv+'Obec',QVYSL_Tp_city.Value);
  E_XFDF(uv+'PSC',QVYSL_Tp_zip.Value);
  E_XFDF(uv+'Stat',NVL1(QVYSL_L_tp_stat.Value,'Slovensko'));
  E_XFDF(uv+'UhrnPrijmov',Format('%0.0f',[QVYSL_PRIJMY.Value]));  {uhrn prijmov}
  j:=0;for i:=2 to 13 do if Copy(QVYSL_Mesiace.Value,i,1)='1' then j:=j+1;
  if j=12 then E_XFDF(uv+'M-1-12','1')
  else for i:=2 to 13 do
    if Copy(QVYSL_Mesiace.Value,i,1)='1'
      then E_XFDF(uv+'M-'+LPAD(IntToStr(i-1),2,'0'),'X')
      else E_XFDF(uv+'M-'+LPAD(IntToStr(i-1),2,'0'),' ');
  E_XFDF(uv+'ZakladDane',Format('%0.0f',[QVYSL_ZAKLAD_DANE.Value]));  {zaklad dane}
  E_XFDF(uv+'ZrazenePreddavky',Format('%0.0f',[QVYSL_PREDDAVKY.Value]));  {preddavky bez bonusu}
  E_XFDF(uv+'Nedoplatok',Format('%0.0f',[QVYSL_VYPLATENY_BONUS.Value]));
  E_XFDF(uv+'Preddavky-N','');
  if QVYSL_Prijmy_nepenazne.Value > 0
   then E_XFDF(uv+'Preddavky-NP','X')
   else E_XFDF(uv+'Preddavky-NP','');
  E_XFDF(uv+'PocetDeti',IntToStr(QVYSL_Pocet_deti.Value));      {pocet deti}
  stlp:=stlp+1;
  if stlp>4 then begin
    stlp:=1;
    E_TAGK('fields');
    E_ATTRZ('href',X.rtf_sablona);
    E_TAGA('f',MyAttr);
    E_TAGK('xfdf');
    Rtf_Uloz_XML(X);
    MyXml:='';
  end;
end;end;

procedure RunReportVD2009B_PDF(const MyReportParam: TMyReportParam);
var pom:string[13];i,sum,celkovo,aktualna,ss,poc_str:integer;
  pc,px:longint;
begin with ReportVD2009B,DM do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportVD2009B:=TReportVD2009B.Create(Application);
    {strana3}
    DMSQL.ExecuteSql('delete from ":pam98_priv:hld"');
    THLD_.Open;
    QSUM_.Params[1].Value:=MyRok(X.AktObdobie);
    QSUM_.Open;
    QMES_.Params[1].Value:=MyRok(X.AktObdobie);
    QMES_.Open;
    while not QSUM_.EOF do begin
      THLD_.Insert;
      THLD_Code_emp.Value := QSUM_Code_emp.Value;
      THLD_Prijmy.Value := QSUM_N_brutto.Value;
      THLD_Zaklad_dane.Value := QSUM_D_ciastzd.Value;
      THLD_Preddavky.Value := QSUM_D_preddavok.Value {+ QSUM_D_bonus_cerpany.Value};
      THLD_Prijmy_nepenazne.Value := QSUM_Nepenazny_prijem.Value;
      THLD_Vyplateny_bonus.Value := QSUM_D_bonus_cerpany.Value;
      THLD_Pocet_deti.AsString := QSUM_Pocet_deti.AsString;
      QMES_.Filter:='Code_emp='+QSUM_Code_emp.AsString;
      QMES_.Filtered:=True;
      QMES_.First;
      {1.znak vyjadruje, ze vyplata bola zuctovana v mesiacoch 1-12
       2.znak az 13.znak vyjadruje, ze vyplata bola zuctovan v (i-1).mesiaci}
      pom:='0000000000000';sum:=0;
      while not QMES_.EOF do begin
        pom[QMES_V_mesiac.Value+1]:='1';
        QMES_.Next;
      end;
      sum:=0;for i:=2 to 13 do sum:=sum+StrToInt(pom[i]);
      if sum=12 then pom[1]:='1';
      THLD_Mesiace.Value := pom;
      THLD_.Post;
      QSUM_.Next;
    end;
    QVYSL_.Open;
    ss:=1;
    poc_str:=((QVYSL_.RecordCOunt -1) div 4) + 1;
    pc:=0;
    px:=QVYSL_.RecordCOunt;
    Progress(0);
    while not QVYSL_.EOF do
    begin
      Progress(pc * 100 div px);
      aktualna := ((QVYSL_.RecNo -1) div 4) + 1;
      Stlpec(aktualna,ss,poc_str);
      inc(pc);
      QVYSL_.Next;
    end;
    {/strana3}
    if MyXml<>'' then begin
      E_TAGK('fields');
      E_ATTRZ('href',X.rtf_sablona);
      E_TAGA('f',MyAttr);
      E_TAGK('xfdf');
      Rtf_Uloz_XML(X);
    end;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    QVYSL_.Close;
    QSUM_.Close;
    QMES_.Close;
    ReportVD2009B.Free;
    Progress(100);
  end;
  MyMessage(Format(SMyAppVD_PDF_Hotovo,[poc_str,'RH3_*.XFDF',MyRepPath1]));
  FormMenuPomoc.VyberTlacovehoSuboruClick(nil);
end;end;


end.
