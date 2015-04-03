unit REXPP;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportPP = class(TQuickRep)
    QRGroup1: TQRGroup;
    QRShape2: TQRShape;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    QRShape5: TQRShape;
    QRLabel16: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
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
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText16: TQRDBText;
    QRSubDetail5: TQRSubDetail;
    QRShape13: TQRShape;
    QRShape17: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape14: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape28: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    GroupFooterBand1: TQRBand;
    QRShape30: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRLabel25: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRLabel30: TQRLabel;
    Q0_: TQuery;
    Q0_cislo: TSmallintField;
    Q0_Name: TStringField;
    Q0_Surname: TStringField;
    Q0_Title: TStringField;
    Q0_Born_date: TDateField;
    Q0_TMP: TStringField;
    Q0_MES: TStringField;
    Q1_: TQuery;
    Q1_v_hodina: TFloatField;
    Q1_v_absencia: TFloatField;
    Q1_n_hrprijem: TCurrencyField;
    Q1_n_holiday: TCurrencyField;
    Q1_n_sviatok: TCurrencyField;
    Q1_premie: TCurrencyField;
    Q1_ospr_dni: TFloatField;
    Q1_ospr_hod: TFloatField;
    Q1_neospr_hod: TFloatField;
    Q1_vp_nadcas: TCurrencyField;
    Q1_prekazky: TCurrencyField;
    DS0: TDataSource;
    Q0_code_emp: TIntegerField;
    Q1_v_den: TFloatField;
    procedure Q0_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

var
  ReportPP: TReportPP;

procedure RunReportPP(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportPP.ShowReport;
begin
  QRLABEL16.Caption:='POTVRDENIE O PRÍJME V ROKU '+IntToStr(X.AktObdobie div 100);
  Q1_.Close;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.Code_emp1;
  Q0_.ParamByName('P2').AsInteger := X.Code_emp2;
  Q0_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q1_.ParamByName('ROK').AsInteger := X.AktObdobie div 100;
  Q0_.Open;
  Q1_.Open;
  ReportPP.Preview;
  Q1_.Close;
  Q0_.Close;
end;

procedure TReportPP.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_TMP.Value:= Copy(
    Trim(Q0_Title.Value)+' '+
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value),1,100);
  Q0_MES.Value:=Mesiac(Q0_cislo.Value,false);
end;

procedure RunReportPP(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportPP:=TReportPP.Create(Application);
    if X.DisableShape then QRDisableShape(ReportPP);
    if X.DisableLabel then QRDisableLabel(ReportPP);
    Screen.Cursor:=crDefault;
    ReportPP.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportPP.Free;
  end;
end;


end.
