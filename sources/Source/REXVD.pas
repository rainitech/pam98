unit REXVD;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, MyConsts, MyQuick, Db,
  DBTables;

type
  TReportVD = class(TQuickRep)
    Q0_: TQuery;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRMemo1: TQRMemo;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape4: TQRShape;
    QRMemo2: TQRMemo;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    QRShape20: TQRShape;
    QRMemo5: TQRMemo;
    QRShape21: TQRShape;
    QRLabel8: TQRLabel;
    QRShape22: TQRShape;
    QRMemo6: TQRMemo;
    QRShape23: TQRShape;
    QRLabel9: TQRLabel;
    QRShape24: TQRShape;
    QRMemo7: TQRMemo;
    QRShape25: TQRShape;
    QRLabel10: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRLabel16: TQRLabel;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRLabel17: TQRLabel;
    QRMemo8: TQRMemo;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRLabel20: TQRLabel;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRMemo9: TQRMemo;
    QRLabel21: TQRLabel;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRLabel24: TQRLabel;
    QRMemo10: TQRMemo;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRLabel25: TQRLabel;
    QRMemo11: TQRMemo;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape68: TQRShape;
    QRLabel32: TQRLabel;
    QRMemo12: TQRMemo;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    d_preddavok: TQRLabel;
    d_nedoplatok: TQRLabel;
    d_preplatok: TQRLabel;
    d_dan: TQRLabel;
    odv_povinnost: TQRLabel;
    mal_odviest: TQRLabel;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRLabel22: TQRLabel;
    QRShape51: TQRShape;
    QRLabel23: TQRLabel;
  private

  public
    procedure ShowReportStart;
    procedure ShowReportEnd;
    procedure SetX(const MyReportParam:TMyReportParam);

  end;

var
  ReportVD: TReportVD;

procedure RunReportVD(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportVD.ShowReportStart;
var r1,r2,r3,r7,r9: currency;
begin
  Q0_.Close;
  Q0_.Params[0].Value := MyRok(X.AktObdobie);
  Q0_.Open;
  if Q0_.fields[0].value=null then
   r1:=0
  else
   r1:=Q0_.fields[0].value;
  if Q0_.fields[1].value=null then
   r9:=0
  else
   r9:=Q0_.fields[1].value;
  d_preddavok.caption:=CurrToStr(r1);
  d_dan.caption:=CurrToStr(r9);
  Q0_.Close;
  Q0_.SQL.Strings[0]:='select -sum(d_vyrovnanie) d_nedoplatok from vyp';
  Q0_.SQL.Add(' and d_vyrovnanie < 0');
  Q0_.Params[0].Value := MyRok(X.AktObdobie);
  Q0_.Open;
  if Q0_.fields[0].value=null then
   r2:=0
  else
   r2:=Q0_.fields[0].value;
  d_nedoplatok.caption:=CurrToStr(r2);
  Q0_.Close;
  Q0_.SQL.Strings[0]:='select sum(d_vyrovnanie) d_preplatok from vyp';
  Q0_.SQL.Strings[3]:=' and d_vyrovnanie > 0';
  Q0_.Params[0].Value := MyRok(X.AktObdobie);
  Q0_.Open;
  if Q0_.fields[0].value=null then
   r3:=0
  else
   r3:=Q0_.fields[0].value;
  d_preplatok.caption:=CurrToStr(r3);
  r7:=r1+r2-r3;
  odv_povinnost.caption:=CurrToStr(r7);
  mal_odviest.caption:=CurrToStr(r7+r9);
  Q0_.Close;
end;

procedure TReportVD.ShowReportEnd;
begin
end;

procedure RunReportVD(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportVD:=TReportVD.Create(Application);
    if X.DisableShape then QRDisableShape(ReportVD);
    if X.DisableLabel then QRDisableLabel(ReportVD);
    Screen.Cursor:=crDefault;
    ReportVD.ShowReportStart;
    ReportVD.Preview;
    ReportVD.ShowReportEnd;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportVD.Free;
  end;
end;

procedure TReportVD.SetX(const MyReportParam:TMyReportParam);
begin
  X:=MyReportParam;
end;

end.
