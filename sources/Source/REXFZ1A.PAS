unit REXFZ1A;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportFZ1A = class(TQuickRep)
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape3: TQRShape;
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
    QRLabel33: TQRLabel;
    QRShape36: TQRShape;
    QRLabel34: TQRLabel;
    QRShape37: TQRShape;
    QRLabel35: TQRLabel;
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
    Q0_n_zaklad_fz: TCurrencyField;
    QRDBText17: TQRDBText;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape21: TQRShape;
    QRLabel39: TQRLabel;
    Q0_CALC_POCET_ZPS: TIntegerField;
    Q0_CALC_POCET_ZTP: TIntegerField;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    Q0_CALC_POCET: TIntegerField;
    QRLabel6: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape23: TQRShape;
    QRDBText20: TQRDBText;
    QRLabel49: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRShape40: TQRShape;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    Q0_CALC_OZ_GARFOND: TCurrencyField;
    Q0_CALC_OZ_GARFOND1: TCurrencyField;
    Q0_CALC_ODVOD_FZ: TCurrencyField;
    Q0_CALC_ODVOD_SPOLU: TCurrencyField;
    QR_Vykaz_zostavil: TQRLabel;
    QR_telefon: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel67: TQRLabel;
    QRShape4: TQRShape;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape43: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText9: TQRDBText;
    Q1_U_fondzam: TSmallintField;
    Q1_N_zaklad_fz: TCurrencyField;
    Q1_Fz_fondz: TFloatField;
    Q1_Fz_garfond: TFloatField;
    Q1_F_firma_zps: TBooleanField;
    Q1_ZTP: TBooleanField;
    Q1_ZPS: TBooleanField;
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
  ReportFZ1A: TReportFZ1A;

procedure RunReportFZ1A(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

procedure TReportFZ1A.ShowReport;
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

procedure TReportFZ1A.Q0_CalcFields(DataSet: TDataSet);
var Zaklad1,Zaklad2,Sadzba1,Sadzba2,SadzbaG1,SadzbaG2,ZakladG1,ZakladG2:double;
    Pocet,PocetZPS,PocetZTP:integer;
begin
  Q0_MESIAC.Value:=MESIAC(Q0_V_mesiac.Value,true);

  Zaklad1:=0;Zaklad2:=0;
  ZakladG1:=0;ZakladG2:=0;
  Sadzba1:=0;Sadzba2:=0;
  SadzbaG1:=0;SadzbaG2:=0;
  Pocet:=0;PocetZPS:=0;PocetZTP:=0; 
  Q1_.Close;
  Q1_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q1_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q1_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q1_.Open;
  while not Q1_.EOF do begin
    case Q1_U_fondzam.Value of
      1,3:case Q1_F_firma_zps.Value of
            false:begin 
                    Zaklad1:= Zaklad1 + Q1_N_zaklad_fz.Value;
                    Sadzba1:= MAXD(Sadzba1,Q1_Fz_fondz.Value);
                    SadzbaG1:= MAXD(SadzbaG1,Q1_Fz_garfond.Value);
                  end;  
            true: begin
                    Zaklad2:= Zaklad2 + Q1_N_zaklad_fz.Value; 
                    Sadzba2:= MAXD(Sadzba2,Q1_Fz_fondz.Value);
                    SadzbaG2:= MAXD(SadzbaG2,Q1_Fz_garfond.Value);
                  end;
          end;{case}
        5:case Q1_F_firma_zps.Value of
            false:begin 
                    ZakladG1:= ZakladG1 + Q1_N_zaklad_fz.Value;
                    Sadzba1:= MAXD(Sadzba1,Q1_Fz_fondz.Value);
                    SadzbaG1:= MAXD(SadzbaG1,Q1_Fz_garfond.Value);
                  end;  
            true: begin
                    ZakladG2:= ZakladG2 + Q1_N_zaklad_fz.Value; 
                    Sadzba2:= MAXD(Sadzba2,Q1_Fz_fondz.Value);
                    SadzbaG2:= MAXD(SadzbaG2,Q1_Fz_garfond.Value);
                  end;  
          end;{case}
      end; {case vonkajsi}
      Pocet:=Pocet+1;
      if Q1_ZPS.Value=true then
      begin
        PocetZPS:=PocetZPS + 1;
        if Q1_ZTP.Value=true then PocetZTP:=PocetZTP + 1;
      end;
    Q1_.Next;
  end;
  Q1_.Close;
(*
  Q1_.Close;
  Q1_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q1_.ParamByName('P2').AsBoolean := false;
  Q1_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q1_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q1_.Open;
  Zaklad1:=Q1_N_Zaklad_Fz.Value;
  Sadzba1:=Q1_Fz_fondz.Value;
  SadzbaG1:=Q1_Fz_garfond.Value;
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
  SadzbaG2:=Q1_Fz_garfond.Value;
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
*)  
  Q0_CALC_POCET_ZPS.Value := PocetZPS;
  Q0_CALC_POCET_ZTP.Value := PocetZTP;
  Q0_CALC_POCET.Value := Pocet;

  Q0_CALC_OZ_FONDZAM.Value := ZAOKRUHLI(
    Zaklad1 * Sadzba1 / 100,
    0,0);

  Q0_CALC_OZ_FONDZAM1.Value := ZAOKRUHLI(
    Zaklad2 * Sadzba2 / 100,
    0,0);

  Q0_CALC_ODVOD_FZ.Value :=
    Q0_O_Fondzam.Value + Q0_CALC_OZ_FONDZAM.Value + Q0_CALC_OZ_FONDZAM1.Value;

  Q0_CALC_OZ_GARFOND.Value := ZAOKRUHLI(
    (Zaklad1+ZakladG1) * SadzbaG1 / 100,
    0,0);

  Q0_CALC_OZ_GARFOND1.Value := ZAOKRUHLI(
    (Zaklad2+ZakladG2) * SadzbaG2 / 100,
    0,0);

  Q0_CALC_ODVOD_SPOLU.Value :=
    Q0_CALC_ODVOD_FZ.Value +
    Q0_CALC_OZ_GARFOND.Value +
    Q0_CALC_OZ_GARFOND1.Value;  
end;

procedure TReportFZ1A.T0_CalcFields(DataSet: TDataSet);
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

procedure RunReportFZ1A(const MyReportParam: TMyReportParam);
begin
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportFZ1A:=TReportFZ1A.Create(Application);
    ReportFZ1A.SetX(MyReportParam);
    if ReportFZ1A.X.DisableShape then QRDisableShape(ReportFZ1A);
    if ReportFZ1A.X.DisableLabel then QRDisableLabel(ReportFZ1A);
    Screen.Cursor:=crDefault;
    ReportFZ1A.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportFZ1A.Free;
  end;
end;

procedure TReportFZ1A.SetX(const MyReportParam:TMyReportParam);
begin
  X:=MyReportParam;
end;

































end.
