unit REXPZ;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportPZ = class(TQuickRep)
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
    QDET_RC: TStringField;
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
    QRLabel34: TQRLabel;
    QRL_obdobie: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel57: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape13: TQRShape;
    QRShape38: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
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
    QRShape23: TQRShape;
    QRShape24: TQRShape;
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
    QRLabel22: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape37: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
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
    QR_Vykaz_zostavil: TQRLabel;
    QR_telefon: TQRLabel;
    QR_Vykaz_dna: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel2: TQRLabel;
    Q0_n_ddp: TCurrencyField;
    Q0_CALC_NC_INE: TCurrencyField;
    QRDBText25: TQRDBText;
    QRExpr2: TQRExpr;
    QINF_ADR_CISLO: TStringField;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure QINF_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;
  end;

var
  ReportPZ: TReportPZ;

  procedure RunReportPZ(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportPZ.ShowReport;
begin
  QRL_obdobie.Caption:='za zdaòovacie obdobie (kalendárny rok) '+
    IntToStr(X.AktObdobie div 100);
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

procedure TReportPZ.Q0_CalcFields(DataSet: TDataSet);
var i:byte;
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
  try
  QPOM_.Close;
  QPOM_.ParamByName('OBDOBIE1').AsInteger := (X.AktObdobie div 100)*100 + 1;
  QPOM_.ParamByName('OBDOBIE2').AsInteger := (X.AktObdobie div 100)*100 + 12;
  QPOM_.Open;
  while not QPOM_.EOF do begin
    Q0_CALC_MESIACE.Value :=
      Q0_CALC_MESIACE.Value +
      QPOM_V_Mesiac.AsString;
    QPOM_.Next;
    if NOT QPOM_.EOF
     then Q0_CALC_MESIACE.Value := Q0_CALC_MESIACE.Value + ', ';
  end;
  QPOM_.Close;
  except end;

  try
  QDET_.Close;
  QDET_.Open;
  for i:=1 to 6 do begin
    if QDET_.EOF then break;
    case i of
    1:begin
      Q0_CALC_MES1.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA1.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' - ' + QDET_RC.Value;
      end;
    2:begin
      Q0_CALC_MES2.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA2.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' - ' + QDET_RC.Value;
      end;
    3:begin
      Q0_CALC_MES3.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA3.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' - ' + QDET_RC.Value;
      end;
    4:begin
      Q0_CALC_MES4.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA4.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' - ' + QDET_RC.Value;
      end;
    5:begin
      Q0_CALC_MES5.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA5.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' - ' + QDET_RC.Value;
      end;
    6:begin
      Q0_CALC_MES6.Value := QDET_MES_OD.AsString + ' - ' + QDET_MES_DO.AsString;
      Q0_CALC_DIETA6.Value := QDET_Meno.Value + ' ' + QDET_Priezvisko.Value +
                              ' - ' + QDET_RC.Value;
      end;
    end;
    QDET_.Next;
  end;
  QDET_.Close;
  except end;
end;

procedure RunReportPZ(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportPZ:=TReportPZ.Create(Application);
    if X.DisableShape then QRDisableShape(ReportPZ);
    if X.DisableLabel then QRDisableLabel(ReportPZ);
    Screen.Cursor:=crDefault;
    ReportPZ.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportPZ.Free;
  end;
end;

procedure TReportPZ.QINF_CalcFields(DataSet: TDataSet);
begin
  QINF_CALC_ADRESA.Value :=
    MyAdresa(
    QINF_adr_ulica.Value,
    QINF_adr_cislo.Value,
    QINF_adr_psc.Value,
    QINF_adr_mesto.Value );
end;














end.
