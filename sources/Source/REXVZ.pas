unit REXVZ;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportVZ = class(TQuickRep)
    QRGroup1: TQRGroup;
    QRLabel16: TQRLabel;
    QRShape23: TQRShape;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText15: TQRDBText;
    QRSubDetail5: TQRSubDetail;
    QRShape17: TQRShape;
    QRShape15: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape14: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    GroupFooterBand1: TQRBand;
    QRShape30: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    QRLabel25: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    Q0_: TQuery;
    Q0_cislo: TSmallintField;
    Q0_Name: TStringField;
    Q0_Surname: TStringField;
    Q0_Title: TStringField;
    Q0_Born_date: TDateField;
    Q0_TMP: TStringField;
    Q0_MES: TStringField;
    Q1_: TQuery;
    DS0: TDataSource;
    Q0_code_emp: TIntegerField;
    QRMemo1: TQRMemo;
    QRShape1: TQRShape;
    QRMemo2: TQRMemo;
    QRShape2: TQRShape;
    QRMemo3: TQRMemo;
    QRShape4: TQRShape;
    QRMemo4: TQRMemo;
    Q1_zaklad_np: TCurrencyField;
    Q1_zaklad_dp: TCurrencyField;
    Q1_zaklad_up: TCurrencyField;
    Q1_zaklad_zp: TCurrencyField;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    Q0_born_numb: TStringField;
    Q0_tp_street: TStringField;
    Q0_tp_city: TStringField;
    Q0_tp_zip: TStringField;
    Q0_rod_stav: TStringField;
    Q0_pohlavie: TStringField;
    Q0_zamestnanie: TStringField;
    Q0_nastup: TDateField;
    Q0_CALC_ROD_STAV: TStringField;
    QRLabel3: TQRLabel;
    QRDBText7: TQRDBText;
    Q0_ADR: TStringField;
    QRShape5: TQRShape;
    QRMemo5: TQRMemo;
    QRShape6: TQRShape;
    QRDBText8: TQRDBText;
    Q1_prijem_zp: TCurrencyField;
    QRShape7: TQRShape;
    QRExpr2: TQRExpr;
    procedure Q0_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

var
  ReportVZ: TReportVZ;

procedure RunReportVZ(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportVZ.ShowReport;
begin
{  QRLABEL16.Caption:='POTVRDENIE O PRÍJME V ROKU '+IntToStr(X.AktObdobie div 100);}
  Q1_.Close;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.Code_emp1;
  Q0_.ParamByName('P2').AsInteger := X.Code_emp2;
  Q0_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q1_.ParamByName('ROK').AsInteger := X.AktObdobie div 100;
  Q0_.Open;
  Q1_.Open;
  ReportVZ.Preview;
  Q1_.Close;
  Q0_.Close;
end;

procedure TReportVZ.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_TMP.Value:= Copy(
    Trim(Q0_Title.Value)+' '+
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value),1,100);
  Q0_MES.Value:=Mesiac(Q0_cislo.Value,false)+'/'+IntToStr(MyRok(X.Aktobdobie));

  Q0_CALC_ROD_STAV.Value := RODINNY_STAV(StrToChar(Q0_Rod_stav.Value),
                                           StrToChar(Q0_Pohlavie.Value));
  Q0_ADR.Value :=
    Q0_tp_street.Value+', '+
    Q0_tp_zip.Value+' '+
    Q0_tp_city.Value;
end;

procedure RunReportVZ(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportVZ:=TReportVZ.Create(Application);
    if X.DisableShape then QRDisableShape(ReportVZ);
    if X.DisableLabel then QRDisableLabel(ReportVZ);
    Screen.Cursor:=crDefault;
    ReportVZ.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportVZ.Free;
  end;
end;














end.
