unit REXHP2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportHP2 = class(TQuickRep)
    Q0_: TQuery;
    PageHeaderBand1: TQRBand;
    QRLabel46: TQRLabel;
    SummaryBand1: TQRBand;
    QRShape12: TQRShape;
    QRLabel6: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    Q0_HPID: TIntegerField;
    Q0_POR_CISLO: TIntegerField;
    Q0_CISLO_U: TStringField;
    Q0_BANKA_U: TStringField;
    Q0_DATUM_SPLATNOSTI: TDateField;
    DS0: TDataSource;
    THP2_: TTable;
    THP2_HPID: TIntegerField;
    THP2_SEQID: TAutoIncField;
    THP2_SUMA: TCurrencyField;
    THP2_CISLO_U: TStringField;
    THP2_BANKA_U: TStringField;
    THP2_SSYM: TStringField;
    THP2_KSYM: TStringField;
    THP2_VSYM: TStringField;
    QRShape1: TQRShape;
    QRShape14: TQRShape;
    QRShape4: TQRShape;
    QRDBText16: TQRDBText;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    Q0_CALC_CISLO_U: TStringField;
    THP2_CALC_CISLO_U: TStringField;
    QRShape22: TQRShape;
    QRShape21: TQRShape;
    QRShape8: TQRShape;
    QRDBText3: TQRDBText;
    QRShape13: TQRShape;
    QRLabel7: TQRLabel;
    QRShape20: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape9: TQRShape;
    QRDBText4: TQRDBText;
    QRSysPage: TQRSysData;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRShape6: TQRShape;
    QRLabel2: TQRLabel;
    QRShape10: TQRShape;
    QRLabel3: TQRLabel;
    QRShape11: TQRShape;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRGroup1: TQRGroup;
    THP2_STRANA: TSmallintField;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape18: TQRShape;
    QRLabel12: TQRLabel;
    QRShape19: TQRShape;
    QRLabel13: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel17: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRLabel18: TQRLabel;
    QRShape28: TQRShape;
    QRLabel19: TQRLabel;
    QRShape29: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText6: TQRDBText;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure THP2_CalcFields(DataSet: TDataSet);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    procedure ShowReport;
  end;

var
  ReportHP2: TReportHP2;

type
  TParReportHP = record
    tlacit_a,tlacit_b,tlacit_c,tlacit_mena:boolean;
    spp:string;
  end;

var
  ParReportHP: TParReportHP;

procedure RunReportHP2(const MyReportParam: TMyReportParam);

implementation

uses RexNz, ParHP, DM_sql;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportHP2.ShowReport;
var p,s:integer;pmax:double;
begin
  Screen.Cursor:=crHourGlass;
  Q0_.ParamByName('HPID').AsInteger := X.HPID;
  Q0_.Open;
  THP2_.Open;
  p:=0;pmax:=PARAMETRE[17].Hodnota;s:=1;
  while not THP2_.EOF do begin
    inc(p);
    if p>pmax then begin
      p:=1;inc(s);
    end;
    THP2_.Edit;
    THP2_Strana.Value := s;
    THP2_.Next;
  end;
  THP2_.First;
  Screen.Cursor:=crDefault;
  Preview;
  THP2_.Close;
  Q0_.Close;
end;

procedure TReportHP2.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_CALC_CISLO_U.Value :=
    Q0_CISLO_U.Value;
end;

procedure TReportHP2.THP2_CalcFields(DataSet: TDataSet);
begin
  THP2_CALC_CISLO_U.Value :=
    THP2_CISLO_U.Value;
end;

procedure TReportHP2.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  DMSQL.ExecuteSql('select sum(suma) from ":pam98_data:hp2"'+
   ' where hpid='+IntToStr(X.HPID)+' and strana='+IntToStr(PageNumber));
  QrLabel7.Caption := FloatToStrF(StrToFloat(DMSQL.results[1]),ffFixed,15,2);
end;

procedure RunReportHP2(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportHP2:=TReportHP2.Create(Application);
    if X.DisableShape then QRDisableShape(ReportHP2);
    if X.DisableLabel then QRDisableLabel(ReportHP2);
    Screen.Cursor:=crDefault;
    if X.HPID>0
      then ReportHP2.ShowReport
      else MyError(SMyAppHpidIsNull);
  except MyError(SMyAppReportShowFailed);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportHP2.Free;
  end;
end;

end.
