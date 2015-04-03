unit Rexdov;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportDOV = class(TQuickRep)
    GroupFooterBand1: TQRBand;
    Q0_: TQuery;
    Q0_CALC_MPT: TStringField;
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRShape14: TQRShape;
    QRShape17: TQRShape;
    QRShape31: TQRShape;
    QRDBText43: TQRDBText;
    QRShape45: TQRShape;
    QRDBText47: TQRDBText;
    QRSysData1: TQRSysData;
    QRShape12: TQRShape;
    QRShape38: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape6: TQRShape;
    QRLabel5: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRLabel47: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel46: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    Q0_surname: TStringField;
    Q0_name: TStringField;
    Q0_title: TStringField;
    Q0_code_emp: TIntegerField;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRDBText3: TQRDBText;
    Q0_CALC_FIRMA: TStringField;
    QRLabel2: TQRLabel;
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRDBText4: TQRDBText;
    QRShape8: TQRShape;
    QRDBText5: TQRDBText;
    QRShape9: TQRShape;
    QRLabel9: TQRLabel;
    QRShape10: TQRShape;
    QRDBText6: TQRDBText;
    Q0_CALC_ESTE_MINULA: TFloatField;
    Q0_CALC_ESTE_SPOLU: TFloatField;
    Q0_CALC_V_HOLIDAY: TFloatField;
    Q1_: TQuery;
    Q1_v_holiday: TFloatField;
    Q1_code_emp: TIntegerField;
    Q0_holiday_old: TFloatField;
    Q0_holiday_spolu: TFloatField;
    Q0_holiday: TFloatField;
    QRShape11: TQRShape;
    QRLabel10: TQRLabel;
    QRShape13: TQRShape;
    QRDBText7: TQRDBText;
    Q0_code_numb: TIntegerField;
    procedure Q0_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

  TVypocetDovolenky = record
    narok_minuly:double;
    narok_sucasny:integer;
    vycerpana:integer;
    zostava_minula:integer;
    zostava_sucasna:integer;
  end;

var
  ReportDOV: TReportDOV;

procedure RunReportDOV(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportDOV.ShowReport;
begin
  if X.Abeceda
   then Q0_.SQL.Add('order by z.surname,z.name;')
     else Q0_.SQL.Add('order by z.code_numb;');
  QRLabel47.Caption := 'PREH¼AD DOVOLENIEK KU KONCU MESIACA ' +
     X.AktObdobieStrT;
  Q1_.Close;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P2').AsInteger := X.AktMaxSid;
  Q1_.ParamByName('V_OBDOBIE1').AsInteger := X.AktObdobie - 12;
  Q1_.ParamByName('V_OBDOBIE2').AsInteger := X.AktObdobie;
  Q0_.Open;
 // Q0_.Filter:='Vystup = ""';
 // Q0_.Filtered:=True;
  Q1_.Open;
  Preview;
  Q1_.Close;
  Q0_.Close;
end;


procedure TReportDOV.Q0_CalcFields(DataSet: TDataSet);
var pom,cerpana:double;
begin
  Q0_CALC_FIRMA.value := X.AktFirmaStr;

  Q0_CALC_MPT.Value:=COPY(
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value)+' '+
    Trim(Q0_Title.Value),
    1,100);

  Q1_.Filter:='code_emp='+IntToStr(Q0_Code_emp.Value);
  Q1_.Filtered:=True;
  cerpana:=Q1_v_holiday.Value;
  Q0_CALC_V_HOLIDAY.Value:= cerpana;
  pom:=Q0_holiday_old.Value - cerpana;
  if pom<0 then pom:=0;
  Q0_CALC_ESTE_MINULA.Value:=pom;
  pom:=Q0_holiday_spolu.Value - cerpana;
  if pom<0 then pom:=0;
  Q0_CALC_ESTE_SPOLU.Value:=pom;
end;

procedure RunReportDOV(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportDOV:=TReportDOV.Create(Application);
    if X.DisableShape then QRDisableShape(ReportDOV);
    if X.DisableLabel then QRDisableLabel(ReportDOV);
    Screen.Cursor:=crDefault;
    ReportDOV.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
   Screen.Cursor:=crDefault;
   ReportDOV.Free;
  end;
end;





end.
