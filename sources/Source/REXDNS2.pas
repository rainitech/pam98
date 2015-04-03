unit REXDNS2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportDNS2 = class(TQuickRep)
    Q0_: TQuery;
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    PageHeaderBand1: TQRBand;
    QRGroup2: TQRGroup;
    QRDBText1: TQRDBText;
    QRShape69: TQRShape;
    QRLabel19: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape25: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape3: TQRShape;
    QRShape21: TQRShape;
    QRLabel7: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel8: TQRLabel;
    QRShape26: TQRShape;
    QRLabel9: TQRLabel;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel10: TQRLabel;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRLabel11: TQRLabel;
    QRShape5: TQRShape;
    QRLabel12: TQRLabel;
    QRShape11: TQRShape;
    QRShape32: TQRShape;
    QRLabel13: TQRLabel;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel14: TQRLabel;
    QRShape40: TQRShape;
    QRLabel18: TQRLabel;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRLabel20: TQRLabel;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRLabel21: TQRLabel;
    QRShape8: TQRShape;
    QRLabel22: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel23: TQRLabel;
    QRShape12: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRLabel24: TQRLabel;
    QRShape48: TQRShape;
    QRLabel25: TQRLabel;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRLabel26: TQRLabel;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRLabel27: TQRLabel;
    QRShape54: TQRShape;
    QRLabel28: TQRLabel;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape6: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape36: TQRShape;
    QRShape7: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRLabel16: TQRLabel;
    QRShape68: TQRShape;
    QRLabel33: TQRLabel;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRLabel34: TQRLabel;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRLabel35: TQRLabel;
    QRShape75: TQRShape;
    QRLabel36: TQRLabel;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape58: TQRShape;
    QRLabel29: TQRLabel;
    QRShape60: TQRShape;
    QRLabel30: TQRLabel;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRLabel32: TQRLabel;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape79: TQRShape;
    QRLabel37: TQRLabel;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRLabel38: TQRLabel;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRLabel39: TQRLabel;
    QRShape59: TQRShape;
    QRShape85: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    A1: TQRLabel;
    B1: TQRLabel;
    C1: TQRLabel;
    M1: TQRLabel;
    M2: TQRLabel;
    M3: TQRLabel;
    A2: TQRLabel;
    B2: TQRLabel;
    C2: TQRLabel;
    A3: TQRLabel;
    B3: TQRLabel;
    C3: TQRLabel;
    A9: TQRLabel;
    B9: TQRLabel;
    C9: TQRLabel;
    QRLabelFirma: TQRLabel;
    QRLabelRok: TQRLabel;
    QRLabel43: TQRLabel;
    QR_Vykaz_zostavil: TQRLabel;
    QR_Telefon: TQRLabel;
    QR_Vykaz_dna: TQRLabel;
    QR_Vykaz_miesto: TQRLabel;
  private

  public
    procedure ShowReport;

  end;

var
  ReportDNS2: TReportDNS2;

procedure RunReportDNS2(const MyReportParam: TMyReportParam);

implementation

uses REXVL3;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportDNS2.ShowReport;
var POM:longint;i:integer;
  H:array[1..10] of double;
begin
  QR_Vykaz_zostavil.Caption := X.Vykaz_zostavil;
  QR_Vykaz_dna.Caption := X.Vykaz_dna;
  QR_Vykaz_miesto.Caption := X.Vykaz_miesto;
  QR_Telefon.Caption := X.Telefon;
  ReportVL3:=TReportVL3.Create(Application);
  try
  POM:=(((MyMesiac(X.AktObdobie) - 1) div 3)*3)+1;
  QRLabelFirma.Caption := X.AktFirmaStr;
  QRLabelRok.Caption := 'Rok '+IntToStr(MyRok(X.AktObdobie));
  M1.Caption := LPAD(IntToStr(POM),2,'0');
  M2.Caption := LPAD(IntToStr(POM+1),2,'0');
  M3.Caption := LPAD(IntToStr(POM+2),2,'0');
  for i:=1 to 3 do begin
    ReportVL3.Q1_.Close;
    ReportVL3.Q1_.ParamByName('P1').AsInteger := MyRok(X.AktObdobie)*100+POM+i-1;
    ReportVL3.Q1_.ParamByName('P1X').AsInteger := MyRok(X.AktObdobie)*100+POM+i-1;
    ReportVL3.Q1_.ParamByName('P2').AsInteger := X.AktMinSid;
    ReportVL3.Q1_.ParamByName('P3').AsInteger := X.AktMaxSid;
    ReportVL3.Q1_.Open;
    {--}
    ReportVL3.Q2a_.Close;
    ReportVL3.Q2a_.ParamByName('P1').AsInteger := MyRok(X.AktObdobie)*100+POM+i-1;
    ReportVL3.Q2a_.ParamByName('P1X').AsInteger := MyRok(X.AktObdobie)*100+POM+i-1;
    ReportVL3.Q2a_.ParamByName('P2').AsInteger := X.AktMinSid;
    ReportVL3.Q2a_.ParamByName('P3').AsInteger := X.AktMaxSid;
    ReportVL3.Q2a_.Open;
    {--}
    ReportVL3.Q2b_.Close;
    ReportVL3.Q2b_.ParamByName('P1').AsInteger := MyRok(X.AktObdobie)*100+POM+i-1;
    ReportVL3.Q2b_.ParamByName('P1X').AsInteger := MyRok(X.AktObdobie)*100+POM+i-1;
    ReportVL3.Q2b_.ParamByName('P2').AsInteger := X.AktMinSid;
    ReportVL3.Q2b_.ParamByName('P3').AsInteger := X.AktMaxSid;
    ReportVL3.Q2b_.Open;
    {--}
    H[1]:=ReportVL3.Q1_D_Preddavok.Value;
    H[2]:=ReportVL3.Q2a_D_Nedoplatok.Value;
    H[3]:=ReportVL3.Q2b_D_Preplatok.Value;
    H[4]:=ReportVL3.Q1_D_dan.Value;
    if i=1 then begin
      A1.Caption:=Format('%5.2f',[H[1]]);
      A2.Caption:=Format('%5.2f',[H[2]]);
      A3.Caption:=Format('%5.2f',[H[3]]);
      A9.Caption:=Format('%5.2f',[H[4]]);
    end else if i=2 then begin
      B1.Caption:=Format('%5.2f',[H[1]]);
      B2.Caption:=Format('%5.2f',[H[2]]);
      B3.Caption:=Format('%5.2f',[H[3]]);
      B9.Caption:=Format('%5.2f',[H[4]]);
    end else if i=3 then begin
      C1.Caption:=Format('%5.2f',[H[1]]);
      C2.Caption:=Format('%5.2f',[H[2]]);
      C3.Caption:=Format('%5.2f',[H[3]]);
      C9.Caption:=Format('%5.2f',[H[4]]);
    end;
    ReportVL3.Q1_.Close;
    ReportVL3.Q2a_.Close;
    ReportVL3.Q2b_.Close;
  end;
  finally
    ReportVL3.Free;
  end;
  Q0_.Close;
  Q0_.Open;
  Screen.Cursor:=crDefault;
  Preview;
  Q0_.Close;
end;


procedure RunReportDNS2(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportDNS2:=TReportDNS2.Create(Application);
    if X.DisableShape then QRDisableShape(ReportDNS2);
    if X.DisableLabel then QRDisableLabel(ReportDNS2);
    ReportDNS2.ShowReport;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportDNS2.Free;
  end;
end;









end.
