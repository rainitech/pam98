unit REXZRAZ;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportZraz = class(TQuickRep)
    GroupFooterBand1: TQRBand;
    Q1_: TQuery;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    Q1_CALC_FIRMA: TStringField;
    Q0_: TQuery;
    QRSubDetail1: TQRSubDetail;
    QRShape19: TQRShape;
    QRDBText33: TQRDBText;
    QRDBText38: TQRDBText;
    DS0: TDataSource;
    QRShape9: TQRShape;
    QRLabel3: TQRLabel;
    QRShape10: TQRShape;
    QRLabel16: TQRLabel;
    SummaryBand1: TQRBand;
    QRShape71: TQRShape;
    QRGroup2: TQRGroup;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRDBText3: TQRDBText;
    Q1_v_obdobie: TIntegerField;
    Q1_code_emp: TIntegerField;
    Q1_surname: TStringField;
    Q1_name: TStringField;
    Q1_title: TStringField;
    Q1_Typ: TStringField;
    Q1_Suma: TCurrencyField;
    Q1_Poznamka: TStringField;
    Q1_CALC_TYP: TStringField;
    QRShape18: TQRShape;
    QRShape15: TQRShape;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText67: TQRDBText;
    QRDBText68: TQRDBText;
    QRLabel43: TQRLabel;
    Q0_code_emp: TIntegerField;
    Q1_CALC_OBDOBIE: TStringField;
    Q1_CALC_STREDISKO: TStringField;
    Q1_sid: TSmallintField;
    Q1_CALC_TMP: TStringField;
    Q1_CALC_OS_CISLO: TStringField;
    Q1_CALC_RODNE_CISLO: TStringField;
    Q1_born_numb: TStringField;
    QRLabel1: TQRLabel;
    Q1_code_numb: TIntegerField;
    procedure Q1_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

var
  ReportZraz: TReportZraz;

procedure RunReportZraz(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportZraz.ShowReport;
begin
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q0_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q0_.Open;
  Q1_.Close;
  Q1_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q1_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q1_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q1_.Open;
  Preview;
  Q1_.Close;
  Q0_.Close;
end;


procedure TReportZraz.Q1_CalcFields(DataSet: TDataSet);
begin
  Q1_CALC_FIRMA.Value := 'FIRMA:  '+X.AktFirmaStr;

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
   'ZRÁŽKY ZA OBDOBIE '+
   Mesiac(MyMesiac(Q1_V_Obdobie.Value),true)+' '+IntToStr(MyRok(Q1_V_Obdobie.Value));

  Q1_CALC_TYP.Value := TEXT_ZRAZKY(Q1_TYP.Value)+' /'+ Q1_TYP.Value + '/';
end;

procedure RunReportZraz(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportZraz:=TReportZraz.Create(Application);
    if X.DisableShape then QRDisableShape(ReportZraz);
    if X.DisableLabel then QRDisableLabel(ReportZraz);
    Screen.Cursor:=crDefault;
    ReportZraz.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportZraz.Free;
  end;
end;

end.
