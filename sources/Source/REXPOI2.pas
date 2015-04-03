unit REXPOI2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,MyConsts, MyQuick, Db,
  DBTables;

type
  TReportPOI2 = class(TQuickRep)
    Q0_: TQuery;
    Q0_CALC_POISTNE: TCurrencyField;
    Q0_CALC_CISLO_U: TStringField;
    Q0_pocet: TIntegerField;
    Q0_n_brutto: TCurrencyField;
    Q0_f_poistne: TFloatField;
    Q0_ico: TStringField;
    Q0_okec: TStringField;
    Q0_nazov: TStringField;
    Q0_adr_ulica: TStringField;
    Q0_adr_mesto: TStringField;
    Q0_adr_psc: TStringField;
    Q0_predcislo_u: TStringField;
    Q0_cislo_u: TStringField;
    Q0_banka_u: TStringField;
    Q0_CALC_BANKA_CISLO: TStringField;
    QRBand1: TQRBand;
    QRMemo1: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLab_Rok: TQRLabel;
    QRLab_stvrtrok: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel11: TQRLabel;
    QRShape9: TQRShape;
    QRLabel12: TQRLabel;
    QRShape10: TQRShape;
    QRLabel13: TQRLabel;
    QRMemo2: TQRMemo;
    QRShape11: TQRShape;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRMemo5: TQRMemo;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel24: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel25: TQRLabel;
    QRShape23: TQRShape;
    QRDBText14: TQRDBText;
    QRLabel26: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel27: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRLabel28: TQRLabel;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape31: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape32: TQRShape;
    QRDBText10: TQRDBText;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRLabel35: TQRLabel;
    QRShape35: TQRShape;
    QRLabel36: TQRLabel;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLab_M: TQRLabel;
    QRLab_T: TQRLabel;
    QRLab_J: TQRLabel;
    QRLab_S1: TQRLabel;
    QRLab_S2: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape38: TQRShape;
    QRLab_M2: TQRLabel;
    QRShape39: TQRShape;
    QRLab_T2: TQRLabel;
    QRShape40: TQRShape;
    QRLab_J2: TQRLabel;
    QRLabel47: TQRLabel;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRLabel51: TQRLabel;
    QRShape44: TQRShape;
    QRLab_M3: TQRLabel;
    QRShape45: TQRShape;
    QRLab_T3: TQRLabel;
    QRShape46: TQRShape;
    QRLab_J3: TQRLabel;
    QRLabel55: TQRLabel;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel56: TQRLabel;
    QR_Vykaz_Zostavil: TQRLabel;
    QR_Telefon: TQRLabel;
    QR_Vykaz_Dna: TQRLabel;
    Q0_adr_cislo: TStringField;
    procedure Q0_CalcFields(DataSet: TDataSet);
  private
    X: TMyReportParam;

  public
    procedure ShowReport;
    procedure SetX(const MyReportParam:TMyReportParam);

  end;

var
  ReportPOI2: TReportPOI2;

type
 TCislo=record
     M: string;
     T: string;
     J: string;
 end;

procedure RunReportPOI2(const MyReportParam: TMyReportParam);
function RozdelSumu(suma: longint): TCislo;

implementation

{$R *.DFM}

procedure TReportPOI2.ShowReport;
var POM,MM,RR,Stvrtrok:integer;
  POMLONG:longint;
  rok:string;
begin
  MM := MyMesiac(X.AktObdobie);
  RR := MyRok(X.AktObdobie);
  if not (MM in [3,6,9,12]) then begin
    MyError(SMyAppLenPoslednyMesiacStvrtroka);
    exit;
  end;
  POM:=(MM - 1) div 3;
  case POM of
  0:Stvrtrok:=1;
  1:Stvrtrok:=2;
  2:Stvrtrok:=3;
  3:Stvrtrok:=4;
  else exit;
  end;
  QRLab_stvrtrok.Caption:=IntToStr(Stvrtrok);
  rok:=IntToStr(RR);
  QRLab_rok.Caption:=rok[length(rok)];
  Q0_.Close;
  POMLONG := RR * 100 + (Stvrtrok-1)*3+1;
  Q0_.ParamByName('P1').AsInteger := POMLONG;
  Q0_.ParamByName('P2').AsInteger := POMLONG + 2;
  Q0_.Open;
  Preview;
  Q0_.Close;
end;

function RozdelSumu(suma: longint): TCislo;
var i: integer;
    pom1, pom2, pom3: string;
    cis: TCislo;
begin
  i:=suma div 1000000;
  if i>0 then pom1:=IntToStr(i) else pom1:='';
  suma:=suma mod 1000000;
  i:=suma div 1000;
  if i>0 then pom2:=IntToStr(i) else pom2:='';
  if pom1<>'' then
  begin
   for i:=1 to 3-length(pom2) do pom2:='0'+pom2;
  end;
  i:=suma mod 1000;
  if i>0 then pom3:=IntToStr(i) else pom3:='';
  if pom2<>'' then
  begin
   for i:=1 to 3-length(pom3) do pom3:='0'+pom3;
  end;
  cis.M:=pom1;
  cis.T:=pom2;
  cis.J:=pom3;
  RozdelSumu:=cis;
end;


procedure TReportPOI2.Q0_CalcFields(DataSet: TDataSet);
var pom1:string;
    r: real;
    medzera:longint;
    i:integer;
    cis: TCislo;
begin
  Q0_CALC_POISTNE.Value := INT(
    Q0_N_BRUTTO.Value *
    Q0_F_POISTNE.Value /
    1000);
  if Q0_CALC_POISTNE.Value < PARAMETRE[18].Hodnota
    then Q0_CALC_POISTNE.Value := PARAMETRE[18].Hodnota;
  if Trim(Q0_PREDCISLO_U.Value) <> ''
    then Q0_CALC_CISLO_U.Value := Trim(Q0_PREDCISLO_U.Value) + ' - '
    else Q0_CALC_CISLO_U.Value := '';
  Q0_CALC_CISLO_U.Value :=Q0_CALC_CISLO_U.Value + Q0_CISLO_U.Value;
  Q0_CALC_BANKA_CISLO.Value:=Q0_BANKA_U.Value;
  //rozdelenie vymeriavacieho zakladu
   medzera:=Q0_n_brutto.AsInteger;
   cis:=RozdelSumu(medzera);
   QRLab_M.Caption:=cis.M;
   QRLab_T.Caption:=cis.T;
   QRLab_J.Caption:=cis.J;
  //rozdelenie sadzby poistneho
  i:=Q0_F_POISTNE.AsInteger;
  QRLab_S1.Caption:=IntToStr(i);
  r:=Q0_F_POISTNE.value;
  r:=r-i;
  r:=r*100;
  pom1:=FloatToStrF(r,ffFixed,0,0);
  for i:=1 to 2-length(pom1) do pom1:='0'+pom1;
  QRLab_S2.Caption:=pom1;
  //rozdelenie poistneho
   medzera:=Q0_CALC_POISTNE.AsInteger;
   cis:=RozdelSumu(medzera);
   QRLab_M2.Caption:=cis.M;
   QRLab_T2.Caption:=cis.T;
   QRLab_J2.Caption:=cis.J;
   QRLab_M3.Caption:=cis.M;
   QRLab_T3.Caption:=cis.T;
   QRLab_J3.Caption:=cis.J;
   //spodok
   QR_Vykaz_zostavil.Caption := X.Vykaz_zostavil;
   QR_Vykaz_dna.Caption := X.Vykaz_dna;
   QR_Telefon.Caption := X.Telefon;
end;

procedure RunReportPOI2(const MyReportParam: TMyReportParam);
begin
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportPOI2:=TReportPOI2.Create(Application);
    ReportPOI2.SetX(MyReportParam);
    if ReportPOI2.X.DisableShape then QRDisableShape(ReportPOI2);
    if ReportPOI2.X.DisableLabel then QRDisableLabel(ReportPOI2);
    Screen.Cursor:=crDefault;
    ReportPOI2.ShowReport;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportPOI2.Free;
  end;
end;

procedure TReportPOI2.SetX(const MyReportParam:TMyReportParam);
begin
  X:=MyReportParam;
end;









































end.
