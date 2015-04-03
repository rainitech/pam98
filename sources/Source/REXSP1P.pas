unit REXSP1P;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportSP1P = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    Q0_: TQuery;
    T0_: TTable;
    QRSysData2: TQRSysData;
    QRDBText3: TQRDBText;
    T0_NAZOV: TStringField;
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
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel43: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QR_Nadpis: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel49: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRShape5: TQRShape;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRShape6: TQRShape;
    QRLabel4: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRShape19: TQRShape;
    QRDBText18: TQRDBText;
    QRLabel28: TQRLabel;
    QRShape20: TQRShape;
    QRDBText19: TQRDBText;
    QRLabel29: TQRLabel;
    QRShape21: TQRShape;
    QRDBText20: TQRDBText;
    QRLabel30: TQRLabel;
    T0_ICZ: TStringField;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape15: TQRShape;
    QRLabel33: TQRLabel;
    QRShape22: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel34: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel35: TQRLabel;
    QRShape26: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    Q0_CALC_MESIAC: TStringField;
    Q0_CALC_MPT: TStringField;
    Q0_CALC_U_INVALID: TStringField;
    Q0_CALC_BORN_NUMB: TStringField;
    Q0_surname: TStringField;
    Q0_name: TStringField;
    Q0_title: TStringField;
    Q0_born_numb: TStringField;
    Q0_fz_uvazok: TStringField;
    Q0_fz_typzam: TStringField;
    Q0_v_rok: TSmallintField;
    Q0_v_mesiac: TSmallintField;
    Q0_n_zaklad_np: TCurrencyField;
    Q0_n_zaklad_dp: TCurrencyField;
    Q0_n_zaklad_ip: TCurrencyField;
    Q0_n_zaklad_up: TCurrencyField;
    Q0_poc_nezaop_deti: TSmallintField;
    Q0_o_nemoc: TCurrencyField;
    Q0_o_dochod: TCurrencyField;
    Q0_o_invalid: TCurrencyField;
    Q0_o_fondzam: TCurrencyField;
    Q0_oz_nemoc: TCurrencyField;
    Q0_oz_dochod: TCurrencyField;
    Q0_oz_invalid: TCurrencyField;
    Q0_oz_fondzam: TCurrencyField;
    Q0_oz_uraz: TCurrencyField;
    Q0_u_invalid: TSmallintField;
    Q0_vynimka_vz: TStringField;
    Q0_v_dni: TSmallintField;
    Q0_u_nemoc: TSmallintField;
    Q0_u_dochod: TSmallintField;
    Q0_u_fondzam: TSmallintField;
    Q0_u_uraz: TSmallintField;
    Q0_u_garancne: TSmallintField;
    Q0_u_rezerva: TSmallintField;
    Q0_rezerva1: TCurrencyField;
    Q0_CALC_ROZSAH_SP: TStringField;
    Q0_n_zaklad_gp: TCurrencyField;
    procedure Q0_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;
    procedure SetX(const MyReportParam:TMyReportParam);

  end;

var
  ReportSP1P: TReportSP1P;

procedure RunReportSP1P(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportSP1P.SetX(const MyReportParam:TMyReportParam);
begin
  X:=MyReportParam;
end;

procedure TReportSP1P.ShowReport;
begin
  Q0_.Close;
  Q0_.ParamByName('P1').Value := X.AktObdobie;
  Q0_.ParamByName('P2').Value := X.AktMinSid;
  Q0_.ParamByName('P3').Value := X.AktMaxSid;
  Q0_.Open;
  T0_.Open;
  Preview;
  Q0_.Close;
  T0_.Close;
end;


procedure TReportSP1P.Q0_CalcFields(DataSet: TDataSet);
var s,rozsahSP:string;
begin
  Q0_CALC_MESIAC.Value:=
    Q0_V_MESIAC.AsString+' / '+Q0_V_ROK.AsString;

  Q0_CALC_MPT.Value:=COPY(
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value)+' '+
    Trim(Q0_Title.Value),
    1,100);

  if Q0_U_invalid.Value = 0
    then Q0_CALC_U_INVALID.Value := 'X'
      else Q0_CALC_U_INVALID.Value := '';

  s:=Q0_Born_Numb.Value;
  while Pos('/',s)<>0 do Delete(s,Pos('/',s),1);
  while Pos(' ',s)<>0 do Delete(s,Pos(' ',s),1);
  Q0_CALC_Born_Numb.Value := s;

  rozsahSP:='';
  if Q0_U_nemoc.Value IN PoiPlatiZam then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q0_U_dochod.Value IN PoiPlatiZam then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q0_U_invalid.Value IN PoiPlatiZam then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q0_U_fondzam.Value IN PoiPlatiZam then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q0_U_uraz.Value=1 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q0_N_zaklad_gp.Value>0 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q0_U_rezerva.Value=1 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  Q0_CALC_ROZSAH_SP.Value := rozsahSP;
end;

procedure RunReportSP1P(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportSP1P:=TReportSP1P.Create(Application);
    if X.DisableShape then QRDisableShape(ReportSP1P);
    if X.DisableLabel then QRDisableLabel(ReportSP1P);
    Screen.Cursor:=crDefault;
    ReportSP1P.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportSP1P.Free;
  end;
end;

end.
