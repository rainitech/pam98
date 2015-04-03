unit REXDVP2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportDVP2 = class(TQuickRep)
    Q0_: TQuery;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText5: TQRDBText;
    Q0_CALC_ADRESA: TStringField;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    Q0_CALC_TMP: TStringField;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    Q0_CALC_TP: TStringField;
    QRDBText8: TQRDBText;
    Q0_CALC_STAV: TStringField;
    Q0_nazov: TStringField;
    Q0_adr_ulica: TStringField;
    Q0_adr_mesto: TStringField;
    Q0_adr_psc: TStringField;
    Q0_surname: TStringField;
    Q0_name: TStringField;
    Q0_title: TStringField;
    Q0_born_date: TDateField;
    Q0_born_numb: TStringField;
    Q0_rod_stav: TStringField;
    Q0_pohlavie: TStringField;
    Q0_c_op: TStringField;
    Q0_tp_street: TStringField;
    Q0_tp_city: TStringField;
    Q0_tp_zip: TStringField;
    Q0_zamestnanie: TStringField;
    Q0_code_emp: TIntegerField;
    Q0_pid: TIntegerField;
    Q0_NASTUP: TDateField;
    Q0_VYSTUP: TDateField;
    Q0_TYP: TSmallintField;
    Q0_R1: TStringField;
    Q0_R2: TStringField;
    Q0_R3: TStringField;
    Q0_R4: TStringField;
    Q0_R5: TStringField;
    Q0_R6: TStringField;
    Q0_R7: TStringField;
    Q0_R8: TStringField;
    Q0_MIESTO: TStringField;
    Q0_DATUM: TDateField;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText17: TQRDBText;
    Q0_CALC_V: TStringField;
    QRDBText18: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText2: TQRDBText;
    Q0_R9: TStringField;
    Q0_R10: TStringField;
    Q0_R11: TStringField;
    Q0_R12: TStringField;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText19: TQRDBText;
    Q0_adr_cislo: TStringField;
    procedure Q0_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

var
  ReportDVP2: TReportDVP2;

procedure RunReportDVP2(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportDVP2.ShowReport;
begin
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.PID;
  Q0_.Open;
  Preview;
  Q0_.Close;
end;

procedure TReportDVP2.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_CALC_ADRESA.Value :=
    MyAdresa(
    Q0_adr_ulica.Value,
    Q0_adr_cislo.Value,
    Q0_adr_psc.Value,
    Q0_adr_mesto.Value );

  Q0_CALC_TMP.Text:=
    Trim(Q0_Title.Value)+' '+
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value);

  Q0_CALC_TP.Value :=
    Q0_tp_street.Value+', '+
    Q0_tp_zip.Value+' '+
    Q0_tp_city.Value;

  Q0_CALC_STAV.Value :=
    RODINNY_STAV(Q0_ROd_stav.Value[1],Q0_Pohlavie.Value[1]);

  Q0_CALC_V.Value :=
    'V ' + Q0_MIESTO.Value + ' dòa ' + Q0_DATUM.AsString;
end;

procedure RunReportDVP2(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportDVP2:=TReportDVP2.Create(Application);
    if X.DisableShape then QRDisableShape(ReportDVP2);
    if X.DisableLabel then QRDisableLabel(ReportDVP2);
    Screen.Cursor:=crDefault;
    ReportDVP2.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
   Screen.Cursor:=crDefault;
   ReportDVP2.Free;
  end;
end;








end.
