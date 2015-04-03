unit PZ2005;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportPZ2005 = class(TQuickRep)
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
    QRLabel48: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QR_Vykaz_zostavil_text: TQRLabel;
    QR_telefon: TQRLabel;
    Q0_n_ddp: TCurrencyField;
    Q0_CALC_NC_INE: TCurrencyField;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    QRShape46: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel60: TQRLabel;
    QRShape51: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape70: TQRShape;
    QRLabel62: TQRLabel;
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
    QDET_ZTP: TBooleanField;
    QRLabel67: TQRLabel;
    QRLabel76: TQRLabel;
    QRShape71: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QINF_DIC: TStringField;
    QRMemo1: TQRMemo;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel73: TQRLabel;
    QR_Vykaz_dna: TQRLabel;
    QRLabel75: TQRLabel;
    QDET_DAT_NAR: TDateField;
    QINF_ADR_CISLO: TStringField;
    QRLabel79: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
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
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel51: TQRLabel;
    QRDBText23: TQRDBText;
    Q0_CALC_BONUS_CELKOM: TCurrencyField;
    QRLabel55: TQRLabel;
    QRMemo2: TQRMemo;
    QRShape69: TQRShape;
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
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape66: TQRShape;
    QRLabel26: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape22: TQRShape;
    QRShape37: TQRShape;
    QRShape39: TQRShape;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRShape45: TQRShape;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape72: TQRShape;
    QRLabel42: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape65: TQRShape;
    QRShape73: TQRShape;
    QRLabel43: TQRLabel;
    QRLabel45: TQRLabel;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRLabel46: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel49: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape78: TQRShape;
    QR_R10: TQRLabel;
    QDDP_: TQuery;
    QDDP_code_emp: TIntegerField;
    QDDP_n_ddp: TCurrencyField;
    Q0_CALC_DDP: TStringField;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure QINF_CalcFields(DataSet: TDataSet);
    procedure ReportPZ2005BeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    first_preview:boolean;
  public
    procedure ShowReport;
  end;

var
  ReportPZ2005: TReportPZ2005;

  procedure RunReportPZ2005(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportPZ2005.ShowReport;
begin
  try
  first_preview:=true;
  QRL_obdobie.Caption:=IntToStr(X.AktObdobie div 100);
  QR_Vykaz_zostavil.Caption := X.Vykaz_zostavil;
  QR_Vykaz_dna.Caption := X.Vykaz_dna;
  QR_Telefon.Caption := X.Telefon;
  QR_R10.Caption := X.Nc_text;
  QINF_.Close;
  QINF_.Open;
  QDDP_.Close;
  QDDP_.ParamByName('OBDOBIE1').AsInteger := (MyRok(X.AktObdobie)-1)*100 + 12;
  QDDP_.ParamByName('OBDOBIE2').AsInteger := (MyRok(X.AktObdobie)+0)*100 + 11;
  QDDP_.Open;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.Code_emp1;
  Q0_.ParamByName('P2').AsInteger := X.Code_emp2;
  Q0_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q0_.ParamByName('OBDOBIE1').AsInteger := (X.AktObdobie div 100)*100 + 1;
  Q0_.ParamByName('OBDOBIE2').AsInteger := (X.AktObdobie div 100)*100 + 12;
  Q0_.Open;
  if (Q0_.Active) and (Q0_.RecordCount>0) then Preview
  else MyError(SMyAppReportIsEmpty);
  finally
  QDDP_.Close;
  QINF_.Close;
  Q0_.Close;
  end;
end;

procedure TReportPZ2005.Q0_CalcFields(DataSet: TDataSet);
var i:byte;
    bonus_dieta: double;

function bonus_dieta_celkom(nMesOd,nMesDo:integer;nBonusDieta:double):double;
var xxx:double;i:integer;
begin
  if (X.AktObdobie div 100)<>2005 then
    bonus_dieta_celkom:= (nMesDo-nMesOd+1)* nBonusDieta
  else begin {--specialita pre rok 2005}
    xxx:=0;
    for i:=nMesOd to nMesDo do
      if i<=8 then xxx:=xxx+400 else xxx:=xxx+450;
    bonus_dieta_celkom:= xxx;
  end;
end;

begin
  if Trim(X.Nc_ine2)<>''
  then Q0_CALC_DDP.Value := Trim(X.Nc_ine2)
  else if QDDP_n_ddp.AsString<>'' then Q0_CALC_DDP.Value := Format('%0.0f',[QDDP_n_ddp.Value])
  else Q0_CALC_DDP.Value := '';

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
  Q0_CALC_BONUS_CELKOM.Value:=0;
  for i:=1 to 10 do begin
    if QDET_.EOF then break;
    bonus_dieta := PARAMETRE[28].Hodnota;
    Q0_CALC_BONUS_CELKOM.Value:=
      Q0_CALC_BONUS_CELKOM.Value +
      bonus_dieta_celkom(QDET_MES_OD.Value,QDET_MES_DO.Value,bonus_dieta);
    case i of
    1:begin
      Q0_CALC_MES1.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA1.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC1.Value :=
        bonus_dieta_celkom(QDET_MES_OD.Value,QDET_MES_DO.Value,bonus_dieta);
      end;
    2:begin
      Q0_CALC_MES2.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA2.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC2.Value :=
        bonus_dieta_celkom(QDET_MES_OD.Value,QDET_MES_DO.Value,bonus_dieta);
      end;
    3:begin
      Q0_CALC_MES3.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA3.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC3.Value :=
        bonus_dieta_celkom(QDET_MES_OD.Value,QDET_MES_DO.Value,bonus_dieta);
      end;
    4:begin
      Q0_CALC_MES4.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA4.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC4.Value :=
        bonus_dieta_celkom(QDET_MES_OD.Value,QDET_MES_DO.Value,bonus_dieta);
      end;
    5:begin
      Q0_CALC_MES5.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA5.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC5.Value :=
        bonus_dieta_celkom(QDET_MES_OD.Value,QDET_MES_DO.Value,bonus_dieta);
      end;
    6:begin
      Q0_CALC_MES6.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA6.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC6.Value :=
        bonus_dieta_celkom(QDET_MES_OD.Value,QDET_MES_DO.Value,bonus_dieta);
      end;
    7:begin
      Q0_CALC_MES7.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA7.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC7.Value :=
        bonus_dieta_celkom(QDET_MES_OD.Value,QDET_MES_DO.Value,bonus_dieta);
      end;
    8:begin
      Q0_CALC_MES8.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA8.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC8.Value :=
        bonus_dieta_celkom(QDET_MES_OD.Value,QDET_MES_DO.Value,bonus_dieta);
      end;
    9:begin
      Q0_CALC_MES9.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA9.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC9.Value :=
        bonus_dieta_celkom(QDET_MES_OD.Value,QDET_MES_DO.Value,bonus_dieta);
      end;
   10:begin
      Q0_CALC_MES10.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA10.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' , ' + QDET_Dat_nar.DisplayText;
      Q0_CALC_NC10.Value :=
        bonus_dieta_celkom(QDET_MES_OD.Value,QDET_MES_DO.Value,bonus_dieta);
      end;
    end;
    QDET_.Next;
  end;
  QDET_.Close;
  except end;
end;

procedure RunReportPZ2005(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportPZ2005:=TReportPZ2005.Create(Application);
    if X.DisableShape then QRDisableShape(ReportPZ2005);
    if X.DisableLabel then QRDisableLabel(ReportPZ2005);
    Screen.Cursor:=crDefault;
    ReportPZ2005.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportPZ2005.Free;
  end;
end;

procedure TReportPZ2005.QINF_CalcFields(DataSet: TDataSet);
begin
  QINF_CALC_ADRESA.Value :=
    'DIÈ: '+QINF_DIC.Value+#13#10+QINF_Nazov.Value+','+
    MyAdresa(
    QINF_adr_ulica.Value,
    QINF_adr_cislo.Value,
    QINF_adr_psc.Value,
    QINF_adr_mesto.Value );
end;

procedure TReportPZ2005.ReportPZ2005BeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
 if first_preview then begin
   first_preview := False;
   QRSetShapeWidth(Sender,2)
 end else
   QRSetShapeWidth(Sender,7);
end;


end.
