unit PR2007;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportPR2007 = class(TQuickRep)
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    v: TQRBand;
    QRGroup2: TQRGroup;
    QRDBText1: TQRDBText;
    QRShape69: TQRShape;
    QRLabel19: TQRLabel;
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
    QRShape48: TQRShape;
    QRLabel25: TQRLabel;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRLabel26: TQRLabel;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape68: TQRShape;
    QRLabel33: TQRLabel;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRLabel34: TQRLabel;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
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
    AA: TQRLabel;
    BA: TQRLabel;
    CA: TQRLabel;
    QRLabelFirma: TQRLabel;
    QRLabelRok: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape8: TQRShape;
    QRLabel24: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel27: TQRLabel;
    QRShape12: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRLabel28: TQRLabel;
    QRShape54: TQRShape;
    QRLabel31: TQRLabel;
    QRShape55: TQRShape;
    QRLabel35: TQRLabel;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRLabel36: TQRLabel;
    QRShape59: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRLabel40: TQRLabel;
    QRShape77: TQRShape;
    QRLabel51: TQRLabel;
    QRShape78: TQRShape;
    QRShape85: TQRShape;
    QRLabel52: TQRLabel;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRLabel53: TQRLabel;
    QRShape94: TQRShape;
    QRLabel54: TQRLabel;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRLabel55: TQRLabel;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRLabel56: TQRLabel;
    QRShape87: TQRShape;
    QRLabel45: TQRLabel;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRLabel47: TQRLabel;
    QRShape90: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRLabel48: TQRLabel;
    AB: TQRLabel;
    BB: TQRLabel;
    CB: TQRLabel;
    AC: TQRLabel;
    BC: TQRLabel;
    CC: TQRLabel;
    CD: TQRLabel;
    A4: TQRLabel;
    B4: TQRLabel;
    C4: TQRLabel;
    A5: TQRLabel;
    B5: TQRLabel;
    C5: TQRLabel;
    A6: TQRLabel;
    B6: TQRLabel;
    C6: TQRLabel;
    QRShape86: TQRShape;
    QRShape102: TQRShape;
    QRLabel11: TQRLabel;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRShape107: TQRShape;
    QRShape108: TQRShape;
    QRLabel41: TQRLabel;
    QRShape109: TQRShape;
    QRShape110: TQRShape;
    QRLabel42: TQRLabel;
    QRShape111: TQRShape;
    QRShape112: TQRShape;
    QRShape113: TQRShape;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape114: TQRShape;
    QRShape115: TQRShape;
    QRShape116: TQRShape;
    QRShape117: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape36: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabelDic: TQRLabel;
    Q0_: TQuery;
    A8: TQRLabel;
    B8: TQRLabel;
    C8: TQRLabel;
    A9: TQRLabel;
    B9: TQRLabel;
    C9: TQRLabel;
    A10: TQRLabel;
    B10: TQRLabel;
    C10: TQRLabel;
    procedure ReportPR2007BeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    first_preview:boolean;

  public
    procedure ShowReport;

  end;

var
  ReportPR2007: TReportPR2007;

procedure RunReportPR2007(const MyReportParam: TMyReportParam);

implementation

uses REXVL3, Dm_main;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportPR2007.ShowReport;
var POM:longint;i:integer;
  H:array[0..3,1..25] of double;
  rz_nedoplatok,rz_preplatok:double;
  pomBonus: double;
  cSumFrm: string;
begin
  if X.AktObdobie >= ZAKON_2009_01
    then cSumFrm := '%0.2f'
    else cSumFrm := '%5.0f';
  first_preview:=true;
  FillChar(H,SizeOf(H),0);
(*  QR_Vykaz_zostavil.Caption := X.Vykaz_zostavil;
  QR_Vykaz_dna.Caption := X.Vykaz_dna;
  QR_Telefon.Caption := X.Telefon;
*)
  ReportVL3:=TReportVL3.Create(Application);
  try
  POM:=(((MyMesiac(X.AktObdobie) - 1) div 3)*3)+1;
  QRLabelFirma.Caption := X.AktFirmaStr;
  QRLabelRok.Caption := 'Rok '+IntToStr(MyRok(X.AktObdobie));
  QRLabelDic.Caption := DM.TINF_DIC.Value;
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
    ReportVL3.Q3_.Close;
    ReportVL3.Q3_.ParamByName('P1').AsInteger := Obdobie_Add_MM(MyRok(X.AktObdobie)*100+POM+i-1,-1);
    ReportVL3.Q3_.ParamByName('P1X').AsInteger := Obdobie_Add_MM(MyRok(X.AktObdobie)*100+POM+i-1,-1);
    ReportVL3.Q3_.ParamByName('P2').AsInteger := X.AktMinSid;
    ReportVL3.Q3_.ParamByName('P3').AsInteger := X.AktMaxSid;
    ReportVL3.Q3_.Open;
    {--}
    H[i,1]:=ReportVL3.Q1_D_Preddavok.Value;
    H[i,2]:=-ReportVL3.Q1_D_vyrovnanie.Value; {???znamienko}
    H[i,20]:=ReportVL3.Q1_D_bonus_cerpany.Value;
    pomBonus:=H[i,20]+H[i-1,23];
    H[i,3]:=0;
    rz_nedoplatok := ReportVL3.Q2a_D_Nedoplatok.Value; {H[2]}
    rz_preplatok  := ReportVL3.Q2b_D_Preplatok.Value; {H[3]}
    H[i,4]:=H[i,1]+H[i,2]+H[i,3];
    //
    if H[i,4]<=0 then H[i,5]:=0
    else if pomBonus<=H[i,4]
    then H[i,5]:=-pomBonus
    else H[i,5]:=-H[i,4];
    pomBonus:=pomBonus+H[i,5];
    H[i,6]:=H[i,4]+H[i,5];
    //
    if PARAMETRE[32].Hodnota = 1
    then H[i,8]:=ReportVL3.Q3_D_dan.Value
    else H[i,8]:=ReportVL3.Q1_D_dan.Value;
    if H[i,8]<=0 then H[i,9]:=0
    else if pomBonus<=H[i,8]
    then H[i,9]:=-pomBonus
    else H[i,9]:=-H[i,8];
    pomBonus:=pomBonus+H[i,9];
    H[i,10]:=H[i,8]+H[i,9];
    //
    H[i,21]:=-H[i,5]-H[i,9];
    H[i,22]:=pomBonus;
    H[i,23]:=H[i,22];
    if i=1 then begin
      A1.Caption:=Format(cSumFrm,[H[i,1]]);
      A2.Caption:=Format(cSumFrm,[H[i,2]]);
      A3.Caption:=Format(cSumFrm,[H[i,3]]);
      A4.Caption:=Format(cSumFrm,[H[i,4]]);
      A5.Caption:=Format(cSumFrm,[H[i,5]]);
      A6.Caption:=Format(cSumFrm,[H[i,6]]);
      A8.Caption:=Format(cSumFrm,[H[i,8]]);
      A9.Caption:=Format(cSumFrm,[H[i,9]]);
      A10.Caption:=Format(cSumFrm,[H[i,10]]);
      AA.Caption:=Format(cSumFrm,[H[i,20]]);
      AB.Caption:=Format(cSumFrm,[H[i,21]]);
      AC.Caption:=Format(cSumFrm,[H[i,22]]);
    end else if i=2 then begin
      B1.Caption:=Format(cSumFrm,[H[i,1]]);
      B2.Caption:=Format(cSumFrm,[H[i,2]]);
      B3.Caption:=Format(cSumFrm,[H[i,3]]);
      B4.Caption:=Format(cSumFrm,[H[i,4]]);
      B5.Caption:=Format(cSumFrm,[H[i,5]]);
      B6.Caption:=Format(cSumFrm,[H[i,6]]);
      B8.Caption:=Format(cSumFrm,[H[i,8]]);
      B9.Caption:=Format(cSumFrm,[H[i,9]]);
      B10.Caption:=Format(cSumFrm,[H[i,10]]);
      BA.Caption:=Format(cSumFrm,[H[i,20]]);
      BB.Caption:=Format(cSumFrm,[H[i,21]]);
      BC.Caption:=Format(cSumFrm,[H[i,22]]);
    end else if i=3 then begin
      C1.Caption:=Format(cSumFrm,[H[i,1]]);
      C2.Caption:=Format(cSumFrm,[H[i,2]]);
      C3.Caption:=Format(cSumFrm,[H[i,3]]);
      C4.Caption:=Format(cSumFrm,[H[i,4]]);
      C5.Caption:=Format(cSumFrm,[H[i,5]]);
      C6.Caption:=Format(cSumFrm,[H[i,6]]);
      C8.Caption:=Format(cSumFrm,[H[i,8]]);
      C9.Caption:=Format(cSumFrm,[H[i,9]]);
      C10.Caption:=Format(cSumFrm,[H[i,10]]);
      CA.Caption:=Format(cSumFrm,[H[i,20]]);
      CB.Caption:=Format(cSumFrm,[H[i,21]]);
      CC.Caption:=Format(cSumFrm,[H[i,22]]);
      CD.Caption:=Format(cSumFrm,[H[i,23]]);
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


procedure RunReportPR2007(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportPR2007:=TReportPR2007.Create(Application);
    if X.DisableShape then QRDisableShape(ReportPR2007);
    if X.DisableLabel then QRDisableLabel(ReportPR2007);
    ReportPR2007.ShowReport;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportPR2007.Free;
  end;
end;

procedure TReportPR2007.ReportPR2007BeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,6);
end;





end.
