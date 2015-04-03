unit REXML2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportML2 = class(TQuickRep)
    Q0_: TQuery;
    Q0_Name: TStringField;
    Q0_Surname: TStringField;
    Q0_Prev_name: TStringField;
    Q0_Title: TStringField;
    Q0_Born_date: TDateField;
    Q0_Born_numb: TStringField;
    Q0_Born_city: TStringField;
    Q0_Rod_stav: TStringField;
    Q0_Pohlavie: TStringField;
    Q0_Narodnost: TStringField;
    Q0_C_op: TStringField;
    Q0_C_pasu: TStringField;
    Q0_C_vodicaku: TStringField;
    Q0_Tp_street: TStringField;
    Q0_Tp_city: TStringField;
    Q0_Tp_zip: TStringField;
    Q0_Pp_street: TStringField;
    Q0_Pp_city: TStringField;
    Q0_Pp_zip: TStringField;
    Q0_Education: TStringField;
    Q0_Zamestnanie: TStringField;
    DS0: TDataSource;
    Q0_Nastup: TDateField;
    Q0_Vystup: TDateField;
    Q0_CALC_MPT: TStringField;
    Q0_CALC_ADRESA_TP: TStringField;
    Q0_CALC_ADRESA_PP: TStringField;
    Q0_CALC_STAV: TStringField;
    Q0_code_emp: TIntegerField;
    Q0_CALC_FIRMA: TStringField;
    QRSubDetail1: TQRSubDetail;
    Q1_: TQuery;
    Q1_code_emp: TIntegerField;
    Q1_v_obdobie: TIntegerField;
    Q1_NID: TIntegerField;
    Q1_Datum_od: TDateField;
    Q1_Datum_do: TDateField;
    Q1_Prac_dni: TSmallintField;
    Q1_Dovod: TStringField;
    QRShape48: TQRShape;
    QRShape50: TQRShape;
    QRShape129: TQRShape;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText49: TQRDBText;
    GroupHeaderBand1: TQRBand;
    QRShape16: TQRShape;
    QRLabel62: TQRLabel;
    QRShape49: TQRShape;
    QRLabel28: TQRLabel;
    GroupFooterBand1: TQRBand;
    QRShape10: TQRShape;
    QRDBText5: TQRDBText;
    QRShape11: TQRShape;
    QRDBText6: TQRDBText;
    QRLabel1: TQRLabel;
    QRShape12: TQRShape;
    QRLabel2: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape17: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel13: TQRLabel;
    QRL_ROK: TQRLabel;
    Q1_Calc_Kal_Dni: TIntegerField;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel15: TQRLabel;
    QRDBText2: TQRDBText;
    Q1_Calc_Typ_nep: TStringField;
    Q1_Typ: TSmallintField;
    Q0_Code_numb: TIntegerField;
    Q1_TypRL: TStringField;
    Q1_L_TYPRL: TStringField;
    Q1_Prerusenie: TSmallintField;
    Q1_L_PRERUS1: TStringField;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
    Q1_Calc_prerus: TStringField;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel16: TQRLabel;
    QRExpr2: TQRExpr;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure Q1_CalcFields(DataSet: TDataSet);
    procedure ReportML2BeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    first_preview: boolean;
  public
    procedure ShowReport;

  end;

var
  ReportML2: TReportML2;

procedure RunReportML2(const MyReportParam: TMyReportParam);

implementation

uses Dm_main;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportML2.ShowReport;
var RR:word;
begin
  first_preview := true;
  RR:=X.AktObdobie div 100;
  QRL_ROK.Caption:=IntToStr(RR);
  Q1_.Close;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.Code_emp1;
  Q0_.ParamByName('P2').AsInteger := X.Code_emp2;
  Q0_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q1_.ParamByName('Datum_od').Value := EncodeDate(RR,1,1);
  Q1_.ParamByName('Datum_do').Value := EncodeDate(RR,12,31);
  Q0_.Open;
  Q1_.Open;
  ReportML2.Preview;
  Q1_.Close;
  Q0_.Close;
end;


procedure TReportML2.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_CALC_FIRMA.Value:= X.AktFirmaStr;

  Q0_CALC_MPT.Value:=COPY(
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value)+' '+
    Trim(Q0_Title.Value),
    1,100);

  if Q0_tp_street.Value <> ''
    then Q0_CALC_ADRESA_TP.Value :=
           Q0_tp_street.Value + ', ' +
           Q0_tp_zip.Value + ' ' + Q0_tp_city.Value
    else Q0_CALC_ADRESA_TP.Value :=
           Q0_tp_zip.Value + ' ' + Q0_tp_city.Value;

  if Q0_pp_street.Value <> ''
    then Q0_CALC_ADRESA_PP.Value :=
           Q0_pp_street.Value + ', ' +
           Q0_pp_zip.Value + ' ' + Q0_pp_city.Value
    else Q0_CALC_ADRESA_PP.Value :=
           Q0_pp_zip.Value + ' ' + Q0_pp_city.Value;

  Q0_CALC_STAV.Value := RODINNY_STAV(Q0_Rod_stav.Value[1],Q0_Pohlavie.Value[1]);
end;

procedure RunReportML2(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportML2:=TReportML2.Create(Application);
    if X.DisableShape then QRDisableShape(ReportML2);
    if X.DisableLabel then QRDisableLabel(ReportML2);
    Screen.Cursor:=crDefault;
    ReportML2.ShowReport;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportML2.Free;
  end;
end;

procedure TReportML2.Q1_CalcFields(DataSet: TDataSet);
begin
  if (Q1_Datum_od.AsString <> '') AND (Q1_Datum_do.AsString <> '')
  then
    Q1_Calc_Kal_Dni.Value :=
      Trunc(Q1_Datum_do.Value - Q1_Datum_od.Value)+1
  else
    Q1_Calc_Kal_Dni.Value := 0;

  Q1_Calc_Typ_Nep.Value := TEXT_TYP_NEPRITOMNOSTI(Q1_Typ.Value);
  if (Q1_TypRL.Value='PE')
   then Q1_Calc_Prerus.Value := Q1_L_PRERUS1.Value
    else Q1_Calc_Prerus.Value := Q1_L_TYPRL.Value;

end;

procedure TReportML2.ReportML2BeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,8);
end;









end.
