unit REXFZ1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportFZ1 = class(TQuickRep)
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRLabel9: TQRLabel;
    QRShape3: TQRShape;
    QRLabel10: TQRLabel;
    QRShape4: TQRShape;
    QRLabel11: TQRLabel;
    QRShape5: TQRShape;
    QRLabel12: TQRLabel;
    QRShape6: TQRShape;
    QRLabel13: TQRLabel;
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
    Q0_: TQuery;
    QRShape18: TQRShape;
    QRLabel14: TQRLabel;
    QRShape19: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape20: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape22: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape27: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape28: TQRShape;
    QRLabel27: TQRLabel;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRLabel28: TQRLabel;
    QRShape32: TQRShape;
    QRLabel29: TQRLabel;
    QRShape33: TQRShape;
    QRLabel30: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape36: TQRShape;
    QRLabel34: TQRLabel;
    QRShape37: TQRShape;
    QRLabel35: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    Q0_pocet: TIntegerField;
    Q0_o_fondzam: TCurrencyField;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    Q0_MESIAC: TStringField;
    QRDBText7: TQRDBText;
    Q0_v_obdobie: TIntegerField;
    Q0_v_rok: TSmallintField;
    QRDBText8: TQRDBText;
    Q0_v_mesiac: TSmallintField;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape38: TQRShape;
    T0_: TTable;
    T0_CALC_NAZOVADRESA: TStringField;
    T0_CALC_CISLOUCTU: TStringField;
    VS1: TQRLabel;
    VS2: TQRLabel;
    VS3: TQRLabel;
    VS4: TQRLabel;
    VS5: TQRLabel;
    VS6: TQRLabel;
    VS7: TQRLabel;
    VS8: TQRLabel;
    VS9: TQRLabel;
    VS10: TQRLabel;
    VS11: TQRLabel;
    VS12: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    T0_CALC_OUP_PSCMESTO: TStringField;
    QRDBText12: TQRDBText;
    QRLabel36: TQRLabel;
    Q0_CALC_OZ_FONDZAM: TCurrencyField;
    Q0_CALC_O_SPOLU: TCurrencyField;
    T0_NAZOV: TStringField;
    T0_ADR_ULICA: TStringField;
    T0_ADR_MESTO: TStringField;
    T0_ADR_PSC: TStringField;
    T0_ICO: TStringField;
    T0_OKEC: TStringField;
    T0_PREDCISLO_U: TStringField;
    T0_CISLO_U: TStringField;
    T0_BANKA_U: TStringField;
    T0_SSYM_U: TStringField;
    T0_KSYM_U: TStringField;
    T0_F_HOLIDAY: TSmallintField;
    T0_F_NEMOCD: TSmallintField;
    T0_F_ODSTUPM: TSmallintField;
    T0_F_ODSTUP: TSmallintField;
    T0_HOLKVART: TSmallintField;
    T0_F_ND_POCITA: TSmallintField;
    T0_F_DOBA: TFloatField;
    T0_FZ_UCET: TStringField;
    T0_FZ_VS: TStringField;
    T0_FZ_DEN: TSmallintField;
    T0_OUP_NAZOV: TStringField;
    T0_OUP_ULICA: TStringField;
    T0_OUP_MESTO: TStringField;
    T0_OUP_PSC: TStringField;
    T0_F_POISTNE: TFloatField;
    QRLabel40: TQRLabel;
    QRShape39: TQRShape;
    QRDBText15: TQRDBText;
    QRLabel41: TQRLabel;
    Q0_CALC_OZ_FONDZAM1: TCurrencyField;
    Q1_: TQuery;
    Q1_fz_fondz: TFloatField;
    Q0_n_zaklad_fz: TCurrencyField;
    Q1_n_zaklad_fz: TCurrencyField;
    QRDBText17: TQRDBText;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape21: TQRShape;
    QRLabel39: TQRLabel;
    Q2_: TQuery;
    Q2_zps: TBooleanField;
    Q2_ztp: TBooleanField;
    Q2_pocet: TIntegerField;
    Q0_CALC_POCET_ZPS: TIntegerField;
    Q0_CALC_POCET_ZTP: TIntegerField;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    Q0_CALC_POCET: TIntegerField;
    QR_Vykaz_zostavil: TQRLabel;
    QR_telefon: TQRLabel;
    T0_ADR_CISLO: TStringField;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure T0_CalcFields(DataSet: TDataSet);
  private
    X: TMyReportParam;

  public
    procedure ShowReport;
    procedure SetX(const MyReportParam:TMyReportParam);
  end;

var
  ReportFZ1: TReportFZ1;

procedure RunReportFZ1(const MyReportParam: TMyReportParam);

implementation

uses REXFZ1A;

{$R *.DFM}

procedure TReportFZ1.ShowReport;
begin
  QR_Vykaz_zostavil.Caption := X.Vykaz_zostavil;
  QR_Telefon.Caption := X.Telefon;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q0_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q0_.Open;
  T0_.Open;
  VS1.Caption:=Copy(T0_FZ_VS.Value,1,1);
  VS2.Caption:=Copy(T0_FZ_VS.Value,2,1);
  VS3.Caption:=Copy(T0_FZ_VS.Value,3,1);
  VS4.Caption:=Copy(T0_FZ_VS.Value,4,1);
  VS5.Caption:=Copy(T0_FZ_VS.Value,5,1);
  VS6.Caption:=Copy(T0_FZ_VS.Value,6,1);
  VS7.Caption:=Copy(T0_FZ_VS.Value,7,1);
  VS8.Caption:=Copy(T0_FZ_VS.Value,8,1);
  VS9.Caption:=Copy(T0_FZ_VS.Value,9,1);
  VS10.Caption:=Copy(T0_FZ_VS.Value,10,1);
  VS11.Caption:=Copy(T0_FZ_VS.Value,11,1);
  VS12.Caption:=Copy(T0_FZ_VS.Value,12,1);
  Preview;
  Q0_.Close;
  T0_.Close;
end;

procedure TReportFZ1.Q0_CalcFields(DataSet: TDataSet);
var Zaklad1,Zaklad2,Sadzba1,Sadzba2:double;Pocet,PocetZPS,PocetZTP:integer;
begin
  Q0_MESIAC.Value:=MESIAC(Q0_V_mesiac.Value,true);

  Q1_.Close;
  Q1_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q1_.ParamByName('P2').AsBoolean := false;
  Q1_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q1_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q1_.Open;
  Zaklad1:=Q1_N_Zaklad_Fz.Value;
  Sadzba1:=Q1_Fz_fondz.Value;
  Q1_.Close;
  {--}
  Q1_.Close;
  Q1_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q1_.ParamByName('P2').AsBoolean := true;
  Q1_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q1_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q1_.Open;
  Zaklad2:=Q1_N_Zaklad_Fz.Value;
  Sadzba2:=Q1_Fz_fondz.Value;
  Q1_.Close;
  {--}
  Q2_.Close;
  Q2_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q2_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q2_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q2_.Open;
  Pocet:=0;PocetZPS:=0;PocetZTP:=0;
  while not Q2_.EOF do begin
    Pocet:=Pocet+Q2_Pocet.Value;
    if Q2_ZPS.Value=true then
    begin
      PocetZPS:=PocetZPS+Q2_Pocet.Value;
      if Q2_ZTP.Value=true then PocetZTP:=PocetZTP+Q2_Pocet.Value;
    end;
    Q2_.Next;
  end;
  Q2_.Close;
  {--}
  Q0_CALC_POCET_ZPS.Value := PocetZPS;
  Q0_CALC_POCET_ZTP.Value := PocetZTP;
  Q0_CALC_POCET.Value := Pocet;

  Q0_CALC_OZ_FONDZAM.Value := ZAOKRUHLI(
    Zaklad1 * Sadzba1 / 100,
    0,0);

  Q0_CALC_OZ_FONDZAM1.Value := ZAOKRUHLI(
    Zaklad2 * Sadzba2 / 100,
    0,0);

  Q0_CALC_O_SPOLU.Value :=
    Q0_O_Fondzam.Value + Q0_CALC_OZ_FONDZAM.Value + Q0_CALC_OZ_FONDZAM1.Value;
end;

procedure TReportFZ1.T0_CalcFields(DataSet: TDataSet);
begin
  T0_CALC_NAZOVADRESA.Value:=
    T0_NAZOV.Value + ', ' +
    MyAdresa(
    T0_ADR_ULICA.Value,
    T0_ADR_CISLO.Value,
    T0_ADR_PSC.Value,
    T0_ADR_MESTO.Value );

  if T0_PREDCISLO_U.Value<>'' then
    T0_CALC_CISLOUCTU.Value:=
      T0_PREDCISLO_U.Value + ' - '+
      T0_CISLO_U.Value + ' / ' +
      T0_BANKA_U.Value
  else
    T0_CALC_CISLOUCTU.Value:=
      T0_CISLO_U.Value + ' / ' +
      T0_BANKA_U.Value;

  T0_CALC_OUP_PSCMESTO.Value:=
    T0_OUP_PSC.Value + ' ' +
    T0_OUP_MESTO.Value;
end;

procedure RunReportFZ1(const MyReportParam: TMyReportParam);
begin
  if MyReportParam.AktObdobie >= Zakon_2000_05 then begin
    RunReportFZ1A(MyReportParam); exit;
  end;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportFZ1:=TReportFZ1.Create(Application);
    ReportFZ1.SetX(MyReportParam);
    if ReportFZ1.X.DisableShape then QRDisableShape(ReportFZ1);
    if ReportFZ1.X.DisableLabel then QRDisableLabel(ReportFZ1);
    Screen.Cursor:=crDefault;
    ReportFZ1.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportFZ1.Free;
  end;
end;

procedure TReportFZ1.SetX(const MyReportParam:TMyReportParam);
begin
  X:=MyReportParam;
end;

end.
