unit REXPOI;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportPOI = class(TQuickRep)
    Q0_: TQuery;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape2: TQRShape;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    Q0_CALC_POISTNE: TCurrencyField;
    QRDBText4: TQRDBText;
    QRLab_stvrtrok: TQRLabel;
    QRLab_rok: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    Q0_CALC_CISLO_U: TStringField;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    Q0_pocet: TIntegerField;
    Q0_n_brutto: TCurrencyField;
    Q0_f_poistne: TFloatField;
    Q0_ico: TStringField;
    Q0_okec: TStringField;
    Q0_nazov: TStringField;
    Q0_adr_ulica: TStringField;
    Q0_adr_mesto: TStringField;
    Q0_adr_psc: TStringField;
    Q0_predcislo_u: TStringField;
    Q0_cislo_u: TStringField;
    Q0_banka_u: TStringField;
    Q0_CALC_ULICA: TStringField;
    Q0_adr_cislo: TStringField;
    procedure Q0_CalcFields(DataSet: TDataSet);
  private
    X: TMyReportParam;

  public
    procedure ShowReport;
    procedure SetX(const MyReportParam:TMyReportParam);

  end;

var
  ReportPOI: TReportPOI;

procedure RunReportPOI(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

procedure TReportPOI.ShowReport;
var POM,MM,RR,Stvrtrok:integer;
  POMLONG:longint;
begin
  MM := MyMesiac(X.AktObdobie);
  RR := MyRok(X.AktObdobie);
  if not (MM in [3,6,9,12]) then begin
    MyError(SMyAppLenPoslednyMesiacStvrtroka);
    exit;
  end;  
  POM:=(MM - 1) div 3;
  case POM of
  0:Stvrtrok:=1;
  1:Stvrtrok:=2;
  2:Stvrtrok:=3;
  3:Stvrtrok:=4;
  else exit;
  end;
  QRLab_stvrtrok.Caption:=IntToStr(Stvrtrok);
  QRLab_rok.Caption:=IntToStr(RR);
  Q0_.Close;
  POMLONG := RR * 100 + (Stvrtrok-1)*3+1;
  Q0_.ParamByName('P1').AsInteger := POMLONG;
  Q0_.ParamByName('P2').AsInteger := POMLONG + 2;
  Q0_.Open;
  Preview;
  Q0_.Close;
end;


procedure TReportPOI.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_CALC_POISTNE.Value := INT(
    Q0_N_BRUTTO.Value *
    Q0_F_POISTNE.Value /
    1000);
  if Q0_CALC_POISTNE.Value < PARAMETRE[18].Hodnota
    then Q0_CALC_POISTNE.Value := PARAMETRE[18].Hodnota;
  if Trim(Q0_PREDCISLO_U.Value) <> ''
    then Q0_CALC_CISLO_U.Value := Trim(Q0_PREDCISLO_U.Value) + ' - '
    else Q0_CALC_CISLO_U.Value := '';
  Q0_CALC_CISLO_U.Value :=
    Q0_CALC_CISLO_U.Value +
    Q0_CISLO_U.Value + ' / ' +
    Q0_BANKA_U.Value;
  Q0_CALC_ULICA.Value :=
    MyUlica(Q0_ADR_ULICA.Value,Q0_ADR_CISLO.Value)

end;

procedure RunReportPOI(const MyReportParam: TMyReportParam);
begin
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportPOI:=TReportPOI.Create(Application);
    ReportPOI.SetX(MyReportParam);
    if ReportPOI.X.DisableShape then QRDisableShape(ReportPOI);
    if ReportPOI.X.DisableLabel then QRDisableLabel(ReportPOI);
    Screen.Cursor:=crDefault;
    ReportPOI.ShowReport;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportPOI.Free;
  end;
end;

procedure TReportPOI.SetX(const MyReportParam:TMyReportParam);
begin
  X:=MyReportParam;
end;

end.
