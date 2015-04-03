unit REXODVDP;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportOdvDp = class(TQuickRep)
    GroupFooterBand1: TQRBand;
    Q1_: TQuery;
    Q1_CALC_MPT: TStringField;
    DetailBand1: TQRBand;
    QRDBText47: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel47: TQRLabel;
    Q1_CALC_FIRMA: TStringField;
    QRShape6: TQRShape;
    QRDBText2: TQRDBText;
    Q0_: TQuery;
    QRSubDetail1: TQRSubDetail;
    QRShape19: TQRShape;
    QRShape61: TQRShape;
    QRDBText25: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText38: TQRDBText;
    Q0_v_obdobie: TIntegerField;
    Q0_pocet: TIntegerField;
    Q0_CA_OBDOBIE: TStringField;
    Q0_CA_NADPIS1: TStringField;
    DS0: TDataSource;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape9: TQRShape;
    QRLabel3: TQRLabel;
    QRShape10: TQRShape;
    QRLabel16: TQRLabel;
    SummaryBand1: TQRBand;
    QRShape71: TQRShape;
    QRGroup2: TQRGroup;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRShape16: TQRShape;
    QRLabel14: TQRLabel;
    QRShape17: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape4: TQRShape;
    QRExpr4: TQRExpr;
    QRShape15: TQRShape;
    QRShape23: TQRShape;
    Q1_CALC_ZAKLAD1: TCurrencyField;
    Q1_CALC_ZAKLAD2: TCurrencyField;
    Q1_v_obdobie: TIntegerField;
    Q1_v_rok: TSmallintField;
    Q1_v_mesiac: TSmallintField;
    Q1_code_emp: TIntegerField;
    Q1_surname: TStringField;
    Q1_name: TStringField;
    Q1_title: TStringField;
    Q0_kdp: TSmallintField;
    Q1_kdp: TSmallintField;
    Q1_n_ddp: TCurrencyField;
    Q1_nz_ddp: TCurrencyField;
    Q1_n_sadzba_ddp: TFloatField;
    Q1_nz_sadzba_ddp: TFloatField;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRExpr1: TQRExpr;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    Q1_n_ddpx: TCurrencyField;
    QRDBText4: TQRDBText;
    QRShape8: TQRShape;
    QRExpr2: TQRExpr;
    procedure Q1_CalcFields(DataSet: TDataSet);
    procedure Q0_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

var
  ReportOdvDp: TReportOdvDp;

procedure RunReportOdvDp(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportOdvDp.ShowReport;
begin
  QRLabel47.Caption := 'ROZPIS ODVODOV DOPLNKOV…HO D‘CHODKOV…HO POISTENIA ZA ' +
     Mesiac(X.AktObdobie mod 100,true)+' '+IntToStr(X.AktObdobie div 100);
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


procedure TReportOdvDp.Q1_CalcFields(DataSet: TDataSet);
begin
  Q1_CALC_FIRMA.Value := 'FIRMA:  '+X.AktFirmaStr;

  Q1_CALC_MPT.Value:=COPY(
    Trim(Q1_Name.Value)+' '+
    Trim(Q1_Surname.Value)+' '+
    Trim(Q1_Title.Value),
    1,100);
end;

procedure RunReportOdvDp(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportOdvDp:=TReportOdvDp.Create(Application);
    if X.DisableShape then QRDisableShape(ReportOdvDp);
    if X.DisableLabel then QRDisableLabel(ReportOdvDp);
    Screen.Cursor:=crDefault;
    ReportOdvDp.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportOdvDp.Free;
  end;
end;



procedure TReportOdvDp.Q0_CalcFields(DataSet: TDataSet);
var s: string;
begin
 s:=IntToStr(Q0_V_obdobie.Value);
 Q0_Ca_obdobie.Value:=
    'za mesiac  '+Copy(s,5,2)+' / '+Copy(s,1,4);
 Q0_ca_nadpis1.Value:='kÛd doplnkovej dÙchodkovej poisùovne : '+
    LPAD(Q0_kdp.AsString,2,'0');
end;

























































end.
