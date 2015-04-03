unit REXPZ2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportPZ2 = class(TQuickRep)
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
    Q0_code_emp: TIntegerField;
    QDET_code_emp: TIntegerField;
    QINF_: TQuery;
    QINF_NAZOV: TStringField;
    QINF_ADR_ULICA: TStringField;
    QINF_ADR_MESTO: TStringField;
    QINF_ADR_PSC: TStringField;
    QINF_CALC_ADRESA: TStringField;
    DetailBand1: TQRBand;
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
    QRShape4: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape10: TQRShape;
    QRShape14: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
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
    QRShape22: TQRShape;
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
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRLabel21: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QR_Vykaz_zostavil_text: TQRLabel;
    QR_telefon: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    Q0_n_ddp: TCurrencyField;
    Q0_CALC_NC_INE: TCurrencyField;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape41: TQRShape;
    QRLabel23: TQRLabel;
    QRShape37: TQRShape;
    QRShape39: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape40: TQRShape;
    QRLabel36: TQRLabel;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel42: TQRLabel;
    QRShape46: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel60: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRLabel22: TQRLabel;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
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
    QRLabel26: TQRLabel;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRLabel27: TQRLabel;
    QRShape69: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel61: TQRLabel;
    QRShape70: TQRShape;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRShape52: TQRShape;
    Q0_nc_minimum: TCurrencyField;
    QRDBText9: TQRDBText;
    QRDBText25: TQRDBText;
    Q0_CALC_MES_NC_MIN: TStringField;
    QR_Vykaz_zostavil: TQRLabel;
    Q0_CALC_NC1: TCurrencyField;
    Q0_CALC_NC2: TCurrencyField;
    Q0_CALC_NC3: TCurrencyField;
    Q0_CALC_NC4: TCurrencyField;
    Q0_CALC_NC5: TCurrencyField;
    Q0_CALC_NC6: TCurrencyField;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRLabel24: TQRLabel;
    QDET_ZTP: TBooleanField;
    QRLabel67: TQRLabel;
    QRLabel76: TQRLabel;
    QRMemo2: TQRMemo;
    QRShape71: TQRShape;
    QRLabel1: TQRLabel;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRLabel31: TQRLabel;
    QRShape75: TQRShape;
    QRLabel46: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape12: TQRShape;
    QRShape42: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QINF_DIC: TStringField;
    QRDBText32: TQRDBText;
    QRMemo1: TQRMemo;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QR_Vykaz_dna: TQRLabel;
    QRShape9: TQRShape;
    QRLabel41: TQRLabel;
    Q0_CALC_ZTP1: TStringField;
    Q0_CALC_ZTP2: TStringField;
    Q0_CALC_ZTP3: TStringField;
    Q0_CALC_ZTP4: TStringField;
    Q0_CALC_ZTP5: TStringField;
    Q0_CALC_ZTP6: TStringField;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QDET_DAT_NAR: TDateField;
    QRShape72: TQRShape;
    QINF_ADR_CISLO: TStringField;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure QINF_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;
  end;

var
  ReportPZ2: TReportPZ2;

  procedure RunReportPZ2(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportPZ2.ShowReport;
begin
  QRL_obdobie.Caption:=IntToStr(X.AktObdobie div 100);
  QR_Vykaz_zostavil.Caption := X.Vykaz_zostavil;
  QR_Vykaz_dna.Caption := X.Vykaz_dna;
  QR_Telefon.Caption := X.Telefon;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.Code_emp1;
  Q0_.ParamByName('P2').AsInteger := X.Code_emp2;
  Q0_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q0_.ParamByName('OBDOBIE1').AsInteger := (X.AktObdobie div 100)*100 + 1;
  Q0_.ParamByName('OBDOBIE2').AsInteger := (X.AktObdobie div 100)*100 + 12;
  Q0_.Open;
  QINF_.Close;
  QINF_.Open;
  Preview;
  QINF_.Close;
  Q0_.Close;
end;

procedure TReportPZ2.Q0_CalcFields(DataSet: TDataSet);
var i:byte;
    nc_dieta: double;
begin
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
      Q0_CALC_MESIACE.Value := Q0_CALC_MESIACE.Value + ', ';
    if NOT QPOM_.EOF AND (Q0_NC_MINIMUM.Value > 0) then
      Q0_CALC_MES_NC_MIN.Value := Q0_CALC_MES_NC_MIN.Value + ',';
  end;
  QPOM_.Close;
  except end;

  try
  QDET_.Close;
  QDET_.Open;
  for i:=1 to 6 do begin
    if QDET_.EOF then break;
    if QDET_ZTP.Value=false
      then nc_dieta := X.Nc_ine
        else nc_dieta := X.Nc_ine * 2;
    case i of
    1:begin
      Q0_CALC_MES1.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA1.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC1.Value := (QDET_MES_DO.Value-QDET_MES_OD.Value+1)*
                nc_dieta;
      Q0_CALC_ZTP1.Value := QDET_ZTP.DisplayText;
      end;
    2:begin
      Q0_CALC_MES2.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA2.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' - ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC2.Value := (QDET_MES_DO.Value-QDET_MES_OD.Value+1)*
                nc_dieta;
      Q0_CALC_ZTP2.Value := QDET_ZTP.DisplayText;
      end;
    3:begin
      Q0_CALC_MES3.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA3.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' - ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC3.Value := (QDET_MES_DO.Value-QDET_MES_OD.Value+1)*
                nc_dieta;
      Q0_CALC_ZTP3.Value := QDET_ZTP.DisplayText;
      end;
    4:begin
      Q0_CALC_MES4.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA4.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' - ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC4.Value := (QDET_MES_DO.Value-QDET_MES_OD.Value+1)*
                nc_dieta;
      Q0_CALC_ZTP4.Value := QDET_ZTP.DisplayText;
      end;
    5:begin
      Q0_CALC_MES5.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA5.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' - ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC5.Value := (QDET_MES_DO.Value-QDET_MES_OD.Value+1)*
                nc_dieta;
      Q0_CALC_ZTP5.Value := QDET_ZTP.DisplayText;
      end;
    6:begin
      Q0_CALC_MES6.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA6.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' - ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC6.Value := (QDET_MES_DO.Value-QDET_MES_OD.Value+1)*
                nc_dieta;
      Q0_CALC_ZTP6.Value := QDET_ZTP.DisplayText;
      end;
    end;
    QDET_.Next;
  end;
  QDET_.Close;
  except end;
end;

procedure RunReportPZ2(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportPZ2:=TReportPZ2.Create(Application);
    if X.DisableShape then QRDisableShape(ReportPZ2);
    if X.DisableLabel then QRDisableLabel(ReportPZ2);
    Screen.Cursor:=crDefault;
    ReportPZ2.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportPZ2.Free;
  end;
end;

procedure TReportPZ2.QINF_CalcFields(DataSet: TDataSet);
begin
  QINF_CALC_ADRESA.Value :=
    MyAdresa(
    QINF_adr_ulica.Value,
    QINF_adr_cislo.Value,
    QINF_adr_psc.Value,
    QINF_adr_mesto.Value );
end;






































































































end.
