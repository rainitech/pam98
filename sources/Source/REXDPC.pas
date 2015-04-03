unit REXDPC;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportDPC = class(TQuickRep)
    Q0_: TQuery;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
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
    QRDBText9: TQRDBText;
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
    procedure Q0_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

var
  ReportDPC: TReportDPC;

procedure RunReportDPC(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportDPC.ShowReport;
begin
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.PID;
  Q0_.Open;
  Preview;
  Q0_.Close;
end;

procedure TReportDPC.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_CALC_ADRESA.Value :=
    Q0_adr_ulica.Value+', '+
    Q0_adr_psc.Value+' '+
    Q0_adr_mesto.Value;

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

procedure RunReportDPC(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportDPC:=TReportDPC.Create(Application);
    if X.DisableShape then QRDisableShape(ReportDPC);
    if X.DisableLabel then QRDisableLabel(ReportDPC);
    Screen.Cursor:=crDefault;
    ReportDPC.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
   Screen.Cursor:=crDefault;
   ReportDPC.Free;
  end;
end;


end.
