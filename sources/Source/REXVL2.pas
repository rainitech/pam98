unit REXVL2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportVL2 = class(TQuickRep)
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
    Q0_Vyplata: TCurrencyField;
    QRDBText47: TQRDBText;
    QRSysData1: TQRSysData;
    PageHeaderBand1: TQRBand;
    QRLabel47: TQRLabel;
    QRSysData2: TQRSysData;
    QRExprVypl: TQRExpr;
    QRLabel3: TQRLabel;
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
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
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
    QRExprEur1: TQRExpr;
    QRExprEur2: TQRExpr;
    QRLabelEuroKonv: TQRLabel;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure GroupFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ReportVL2BeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    first_preview: boolean;
  public
    procedure ShowReport;

  end;

var
  ReportVL2: TReportVL2;

procedure RunReportVL2(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

const
  H:array[1..11] of integer =
  (5000,1000,500,200,100,50,20,10,5,2,1);
var
  M:array[1..11] of longint;

procedure TReportVL2.ShowReport;
begin
  first_preview := true;
  if X.Abeceda
   then Q0_.SQL.Add('order by z.surname,z.name;')
     else Q0_.SQL.Add('order by z.code_emp;');
  QRLabel47.Caption := 'VÝPLATNÁ LISTINA K VÝPLATE V HOTOVOSTI ZA ' +
     Mesiac(X.AktObdobie mod 100,true)+' '+IntToStr(X.AktObdobie div 100);
  if (X.AktObdobie >= Zakon_Euro_Dual_Od) and
     (X.AktObdobie <= Zakon_Euro_Dual_Do) then
  begin
   QRDBTextVypl.Top:=3;
   QRExprVypl.Top:=3;
   QRExprEur1.Width:=105;
   QRExprEur2.Width:=105;
   if X.AktObdobie >= ZAKON_2009_01 then begin
     QRExprEur1.Mask := '0.00 Sk';
     QRExprEur1.Expression := 'SUM(Q0_.Vyplata)*30.126'
   end else
   begin
     QRExprEur1.Mask := '0.00 EUR';
     QRExprEur1.Expression := 'SUM(Q0_.Vyplata)/30.126'
   end;
   QRLabelEuroKonv.Caption := KonvKurzEuroTxt;
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


procedure TReportVL2.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_CALC_FIRMA.Value := 'FIRMA:  '+X.AktFirmaStr;

  Q0_CALC_MPT.Value:=
    COPY(PMT(Q0_Surname.Value,Q0_Name.Value,Q0_Title.Value),1,100);
end;


procedure TReportVL2.GroupFooterBand1BeforePrint(Sender: TQRCustomBand;
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
end;

procedure TReportVL2.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var HH:double;i,P:longint;
begin
  HH:=Q0_Vyplata.Value;
  for i:=1 to 11 do begin
    if HH>=H[i] then begin
      P:=Trunc(HH/H[i]);
      HH:=HH-P*H[i];
      M[i]:=M[i] + P;
    end;
  end;
end;

procedure TReportVL2.ReportVL2BeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
var i:integer;
begin
  for i:=1 to 11 do M[i]:=0;
  if first_preview then begin
   first_preview := False;
   QRSetShapeWidth(Sender,1)
 end else
   QRSetShapeWidth(Sender,8);
end;

procedure RunReportVL2(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportVL2:=TReportVL2.Create(Application);
    if X.DisableShape then QRDisableShape(ReportVL2);
    if X.DisableLabel then QRDisableLabel(ReportVL2);
    Screen.Cursor:=crDefault;
    ReportVL2.ShowReport;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportVL2.Free;
  end;
end;




end.
