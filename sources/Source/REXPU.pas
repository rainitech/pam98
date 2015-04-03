unit REXPU;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportPU = class(TQuickRep)
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    PageHeaderBand1: TQRBand;
    QRLabel47: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel46: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel9: TQRLabel;
    DS0: TDataSource;
    T0_: TTable;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    T0_CALC_FIRMA: TStringField;
    QRShape3: TQRShape;
    T0_ID: TFloatField;
    T0_CISLO: TIntegerField;
    T0_DOPLNOK: TStringField;
    T0_TEXT: TStringField;
    T0_MD_SY: TStringField;
    T0_MD_AN: TStringField;
    T0_DAL_SY: TStringField;
    T0_DAL_AN: TStringField;
    T0_SUMA: TCurrencyField;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    T0_CALC_NAZOV: TStringField;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    procedure T0_CalcFields(DataSet: TDataSet);
    procedure ReportPUBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    X: TMyReportParam;
    first_preview : boolean;
  public
    CisloRiadku: integer;
    WriteToDb: boolean;
    procedure ShowReport;
    procedure SetX(const MyReportParam:TMyReportParam);
  end;

var
  ReportPU: TReportPU;

procedure RunReportPU(const MyReportParam: TMyReportParam);

implementation

uses RexSP, RexZP, RexFZ1, RexVL3, Dm_main, DM_sql, REXFZ1A, REXPOI, REXPOI2, DM_ALL,
  Dm_vypl, REXSP1, REXNZ;

{$R *.DFM}

procedure TReportPU.ShowReport;
var s:string;
begin
  QRLabel6.Caption := 'SUMA ' + DM.NasaMena;
  first_preview := True;
  s:='update ":pam98_data:cis_pu"  A set suma=null';
  DMSQL.ExecuteSQL(s);
  try
  ReportNZ:=TReportNZ.Create(Application);
  ReportNZ.SetX(X);
  ReportNZ.VytvorPomocnuDatabazu(X,True);
  finally
  ReportNZ.Free;
  end;
  s:='update ":pam98_data:cis_pu"  A set suma=(select suma from ":pam98_priv:nakl" B where B.ident_symbol=''+'' and B.ident_cislo=A.id)';
  DMSQL.ExecuteSQL(s);
  s:='update ":pam98_data:cis_pu"  A set suma=(select suma from ":pam98_priv:nakl" B where B.ident_symbol=''*'' and B.ident_cislo=A.id * 100) where id IN (17.50)';
  DMSQL.ExecuteSQL(s);
  s:='update ":pam98_data:cis_pu"  A set suma=(select suma from ":pam98_priv:nakl" B where B.ident_symbol=''['' and B.ident_cislo=A.cislo) where id=29';
  DMSQL.ExecuteSQL(s);
  s:='update ":pam98_data:cis_pu"  A set suma=(select suma from ":pam98_priv:nakl" B where B.ident_symbol='']'' and B.ident_cislo=A.cislo) where id=35';
  DMSQL.ExecuteSQL(s);
  s:='update ":pam98_data:cis_pu"  A set suma=(select suma from ":pam98_priv:nakl" B where B.ident_symbol=''('' and B.ident_cislo=A.cislo) where id=34';
  DMSQL.ExecuteSQL(s);
  s:='update ":pam98_data:cis_pu"  A set suma=(select suma from ":pam98_priv:nakl" B where B.ident_symbol='')'' and B.ident_cislo=A.cislo) where id=43';
  DMSQL.ExecuteSQL(s);
  s:='update ":pam98_data:cis_pu"  A set suma=(select sum(suma) from ":pam98_data:cis_pu" B where B.id BETWEEN 1 AND 11) where id=12';
  DMSQL.ExecuteSQL(s);
  QRLabel47.Caption := 'Vstupy do podvojného úètovníctva - ' +
     Mesiac(X.AktObdobie mod 100,true)+' '+IntToStr(X.AktObdobie div 100);
  T0_.Open;
  Preview;
  T0_.Close;
end;

procedure TReportPU.T0_CalcFields(DataSet: TDataSet);
begin
  T0_CALC_FIRMA.Value := X.AktFirmaStr;
  T0_CALC_NAZOV.Value := T0_TEXT.Value;
  if T0_CISLO.AsString<>'' then
    T0_CALC_NAZOV.Value := T0_CALC_NAZOV.Value + T0_CISLO.AsString;
  if UpperCase(T0_DOPLNOK.Value) = 'Z' then
    T0_CALC_NAZOV.Value := T0_CALC_NAZOV.Value + ' - zam.';
  if UpperCase(T0_DOPLNOK.Value) = 'F' then
    T0_CALC_NAZOV.Value := T0_CALC_NAZOV.Value + ' - firma ';
end;

procedure RunReportPU(const MyReportParam: TMyReportParam);
begin
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportPU:=TReportPU.Create(Application);
    ReportPU.SetX(MyReportParam);
    if ReportPU.X.DisableShape then QRDisableShape(ReportPU);
    if ReportPU.X.DisableLabel then QRDisableLabel(ReportPU);
    Screen.Cursor:=crDefault;
    ReportPU.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportPU.Free;
  end;
end;

procedure TReportPU.SetX(const MyReportParam:TMyReportParam);
begin
  X:=MyReportParam;
end;
















procedure TReportPU.ReportPUBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,8);
end;

end.
