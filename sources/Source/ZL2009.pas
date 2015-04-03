unit ZL2009;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportZL2009 = class(TQuickRep)
    GroupFooterBand1: TQRBand;
    QRShape11: TQRShape;
    QRShape92: TQRShape;
    QRLabel61: TQRLabel;
    Q0_: TQuery;
    Q0_Name: TStringField;
    Q0_Surname: TStringField;
    Q0_Title: TStringField;
    Q0_CALC_MPT: TStringField;
    DetailBand1: TQRBand;
    QRShape14: TQRShape;
    QRShape17: TQRShape;
    QRShape31: TQRShape;
    QRDBTextVypl: TQRDBText;
    QRShape45: TQRShape;
    Q0_Ne_zaloha: TCurrencyField;
    QRDBText47: TQRDBText;
    QRSysData1: TQRSysData;
    PageHeaderBand1: TQRBand;
    QRLabel47: TQRLabel;
    QRSysData2: TQRSysData;
    QRExprVypl: TQRExpr;
    QRLabel3: TQRLabel;
    Q0_code_emp: TIntegerField;
    Q0_CALC_FIRMA: TStringField;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape21: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape6: TQRShape;
    QRDBText2: TQRDBText;
    QRGroup1: TQRGroup;
    QRShape15: TQRShape;
    QRShape13: TQRShape;
    QRShape10: TQRShape;
    QRShape9: TQRShape;
    QRShape8: TQRShape;
    QRShape7: TQRShape;
    QRShape5: TQRShape;
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    M1: TQRLabel;
    M2: TQRLabel;
    M3: TQRLabel;
    M4: TQRLabel;
    M5: TQRLabel;
    M6: TQRLabel;
    M7: TQRLabel;
    M8: TQRLabel;
    M9: TQRLabel;
    M10: TQRLabel;
    M11: TQRLabel;
    QRShape12: TQRShape;
    QRShape20: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    M12: TQRLabel;
    M13: TQRLabel;
    M14: TQRLabel;
    M15: TQRLabel;
    QRExprEur2: TQRExpr;
    QRExprEur1: TQRExpr;
    QRLabelEuroKonv: TQRLabel;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure GroupFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    procedure ShowReport;

  end;

var
  ReportZL2009: TReportZL2009;

procedure RunReportZL2009(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

const
  HSIZE=15;
  H:array[1..HSIZE] of double =
  (500,200,100,50,20,10,5,2,1,0.50,0.20,0.10,0.05,0.02,0.01);
var
  M:array[1..HSIZE] of longint;

procedure TReportZL2009.ShowReport;
begin
  if X.Abeceda
   then Q0_.SQL.Add('order by z.surname,z.name;')
     else Q0_.SQL.Add('order by z.code_emp;');
  QRLabel47.Caption := 'ZÁLOHOVÁ LISTINA ZA ' +
     Mesiac(X.AktObdobie mod 100,true)+' '+IntToStr(X.AktObdobie div 100);
  if (X.AktObdobie >= Zakon_Euro_Dual_Od) and
     (X.AktObdobie <= Zakon_Euro_Dual_Do) then
  begin
   QRDBTextVypl.Top:=3;
   QRExprVypl.Top:=3;
   QRExprEur1.Width:=105;
   QRExprEur2.Width:=105;
   QRLabelEuroKonv.Caption := KonvKurzEuroTxt;
   if X.AktObdobie >= ZAKON_2009_01 then begin
     QRExprEur1.Mask := '0.00 Sk';
     QRExprEur1.Expression := 'Q0_.Ne_zaloha*30.126';
     QRExprEur2.Mask := '0.00 Sk';
     QRExprEur2.Expression := 'SUM(Q0_.Ne_zaloha)*30.126';
   end else
   begin
     QRExprEur1.Mask := '0.00 EUR';
     QRExprEur1.Expression := 'Q0_.Ne_zaloha/30.126';
     QRExprEur2.Mask := '0.00 EUR';
     QRExprEur2.Expression := 'SUM(Q0_.Ne_zaloha)/30.126';
   end;
  end
  else begin
   QRDBTextVypl.Top:=10;
   QRExprVypl.Top:=10;
   QRExprEur1.Width:=0;
   QRExprEur2.Width:=0;
   QRLabelEuroKonv.Caption := '';
  end;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q0_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q0_.Open;
  Preview;
  Q0_.Close;
end;


procedure TReportZL2009.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_CALC_FIRMA.Value := 'FIRMA:  '+X.AktFirmaStr;

  Q0_CALC_MPT.Value:=COPY(
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value)+' '+
    Trim(Q0_Title.Value),
    1,100);
end;


procedure TReportZL2009.GroupFooterBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  M1.Caption := IntToStr(M[1]);
  M2.Caption := IntToStr(M[2]);
  M3.Caption := IntToStr(M[3]);
  M4.Caption := IntToStr(M[4]);
  M5.Caption := IntToStr(M[5]);
  M6.Caption := IntToStr(M[6]);
  M7.Caption := IntToStr(M[7]);
  M8.Caption := IntToStr(M[8]);
  M9.Caption := IntToStr(M[9]);
  M10.Caption:= IntToStr(M[10]);
  M11.Caption:= IntToStr(M[11]);
  M12.Caption:= IntToStr(M[12]);
  M13.Caption:= IntToStr(M[13]);
  M14.Caption:= IntToStr(M[14]);
  M15.Caption:= IntToStr(M[15]);
end;

procedure TReportZL2009.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var HH:double;i,P:longint;
begin
  HH:=Q0_Ne_zaloha.Value*100;
  for i:=1 to HSIZE do begin
    if HH>=(H[i]*100) then begin
      P:=Trunc(HH/(H[i]*100));
      HH:=HH-P*H[i]*100;
      M[i]:=M[i] + P;
    end;
  end;
end;

procedure TReportZL2009.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var i:integer;
begin
  for i:=1 to HSIZE do M[i]:=0;
end;

procedure RunReportZL2009(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportZL2009:=TReportZL2009.Create(Application);
    if X.DisableShape then QRDisableShape(ReportZL2009);
    if X.DisableLabel then QRDisableLabel(ReportZL2009);
    Screen.Cursor:=crDefault;
    ReportZL2009.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportZL2009.Free;
  end;
end;







end.
