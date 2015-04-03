unit REXVYK;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick, Dm_main;

type
  TReportVYK = class(TQuickRep)
    Q1_: TQuery;
    Q1_CALC_OBDOBIE: TStringField;
    Q1_CALC_TMP: TStringField;
    Q1_CALC_ZRAZKY: TCurrencyField;
    DetailBand1: TQRBand;
    QRShape15: TQRShape;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel48: TQRLabel;
    QRLabel62: TQRLabel;
    Q1_surname: TStringField;
    Q1_name: TStringField;
    Q1_title: TStringField;
    Q1_V_obdobie: TIntegerField;
    Q1_CALC_FIRMA: TStringField;
    QRDBText64: TQRDBText;
    Q1_CALC_STREDISKO: TStringField;
    Q1_sid: TSmallintField;
    Q1_born_numb: TStringField;
    QRDBText67: TQRDBText;
    Q1_CALC_OS_CISLO: TStringField;
    Q1_CALC_RODNE_CISLO: TStringField;
    QRDBText68: TQRDBText;
    QRLabel60: TQRLabel;
    QRLabel7: TQRLabel;
    Q2_: TQuery;
    DS1: TDataSource;
    Q1_CALC_DOVOLENKA: TStringField;
    Q1_CALC_CENA_PRACE: TCurrencyField;
    Q1_CALC_TEXT_DOPLATKY: TStringField;
    Q1_CALC_OCR: TCurrencyField;
    Q1_N_ukolova: TCurrencyField;
    QRLabel43: TQRLabel;
    Q2_V_obdobie: TIntegerField;
    Q2_Code_emp: TIntegerField;
    Q2_HSUID: TIntegerField;
    Q2_UKID: TIntegerField;
    Q2_Pocet: TFloatField;
    Q2_Suma1: TCurrencyField;
    Q2_Suma: TCurrencyField;
    QRSubDetail1: TQRSubDetail;
    DS2: TDataSource;
    QRDBText37: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText76: TQRDBText;
    QRDBText113: TQRDBText;
    QRDBText110: TQRDBText;
    Q2_LKP_POPIS: TStringField;
    GroupFooterBand1: TQRBand;
    QRShape8: TQRShape;
    QRLabel1: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel74: TQRLabel;
    QRShape1: TQRShape;
    Q1_code_numb: TIntegerField;
    Q2_Code_numb: TIntegerField;
    Q1_v_mesiac: TSmallintField;
    Q1_v_rok: TSmallintField;
    procedure Q1_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

var
  ReportVYK: TReportVYK;

procedure RunReportVYK(const MyReportParam: TMyReportParam);

implementation

uses REXVP, Dm_vypl;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportVYK.ShowReport;
begin
  Q1_.Close;
  Q1_.ParamByName('P1').AsInteger := X.Code_emp1;
  Q1_.ParamByName('P2').AsInteger := X.Code_emp2;
  Q1_.ParamByName('P3').AsInteger := X.AktObdobie;
  Q1_.ParamByName('P4').AsInteger := X.AktMinSid;
  Q1_.ParamByName('P5').AsInteger := X.AktMaxSid;
  Q1_.Open;
  Q2_.Close;
  Q2_.Open;
  ReportVYK.Preview;
  Q1_.Close;
  Q2_.Close;
end;

procedure TReportVYK.Q1_CalcFields(DataSet: TDataSet);
begin with DM do begin
  Q1_CALC_FIRMA.Text := 'FIRMA: '+X.AktFirmaStr;
  Q1_CALC_STREDISKO.Text := 'Stredisko: '+Q1_SID.AsString;

  Q1_CALC_TMP.Text:=Trim(Q1_Title.Value);
  if Q1_CALC_TMP.Text<>'' then
    Q1_CALC_TMP.Text:=Q1_CALC_TMP.Text+' ';
  Q1_CALC_TMP.Text:=
    Q1_CALC_TMP.Text+
    Trim(Q1_Name.Value)+' '+
    Trim(Q1_Surname.Value);

  Q1_CALC_OS_CISLO.Text:=
   'Osobné èíslo: '+Trim(Q1_Code_numb.AsString);
  Q1_CALC_RODNE_CISLO.Text:=
    'Rodné èíslo: '+Trim(Q1_Born_numb.AsString);

 Q1_CALC_OBDOBIE.Text:=
   'VÝKAZ ODPRACOVANÝCH VÝKONOV ZA MESIAC '+
   Mesiac(Q1_V_Mesiac.Value,true)+' '+Q1_V_rok.AsString;
end;end;

procedure RunReportVYK(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportVYK:=TReportVYK.Create(Application);
    if X.DisableShape then QRDisableShape(ReportVYK);
    if X.DisableLabel then QRDisableLabel(ReportVYK);
    Screen.Cursor:=crDefault;
    ReportVYK.ShowReport;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportVYK.Free;
  end;
end;































































end.
