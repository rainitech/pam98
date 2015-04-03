unit REXFZ2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportFZ2 = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLabel34: TQRLabel;
    QRShape25: TQRShape;
    QRShape38: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape39: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    DetailBand1: TQRBand;
    QRShape9: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRDBText1: TQRDBText;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    Q0_: TQuery;
    Q0_born_numb: TStringField;
    QRShape26: TQRShape;
    T0_: TTable;
    T0_CALC_NAZOVADRESA: TStringField;
    RC1: TQRLabel;
    RC2: TQRLabel;
    RC3: TQRLabel;
    RC4: TQRLabel;
    RC5: TQRLabel;
    RC6: TQRLabel;
    RC7: TQRLabel;
    RC8: TQRLabel;
    RC9: TQRLabel;
    RC10: TQRLabel;
    QRDBText2: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    Q0_CALC_MESIAC: TStringField;
    Q0_v_rok: TSmallintField;
    Q0_v_mesiac: TSmallintField;
    Q0_CALC_ZAKLAD: TCurrencyField;
    Q0_u_fondzam: TSmallintField;
    Q0_u_fondzam1: TSmallintField;
    Q0_u_fondzam2: TSmallintField;
    QRDBText3: TQRDBText;
    QRLabel9: TQRLabel;
    Q0_CALC_MPT: TStringField;
    Q0_surname: TStringField;
    Q0_name: TStringField;
    Q0_title: TStringField;
    QRLabel10: TQRLabel;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape15: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
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
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape14: TQRShape;
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
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRDBText4: TQRDBText;
    Q0_fz_uvazok: TStringField;
    Q0_fz_typzam: TStringField;
    QRDBText5: TQRDBText;
    Q0_n_zaklad_fz: TCurrencyField;
    T0_ADR_CISLO: TStringField;
    procedure T0_CalcFields(DataSet: TDataSet);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Q0_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

var
  ReportFZ2: TReportFZ2;

procedure RunReportFZ2(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportFZ2.ShowReport;
begin
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


procedure TReportFZ2.T0_CalcFields(DataSet: TDataSet);
begin
  T0_CALC_NAZOVADRESA.Value:=
    T0_NAZOV.Value + ', ' +
    MyAdresa(
    T0_ADR_ULICA.Value,
    T0_ADR_CISLO.Value,
    T0_ADR_PSC.Value,
    T0_ADR_MESTO.Value );
end;

procedure TReportFZ2.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var s:string;
begin
  s:=Q0_Born_Numb.Value;
  while Pos('/',s)<>0 do Delete(s,Pos('/',s),1);
  while Pos(' ',s)<>0 do Delete(s,Pos(' ',s),1);
  RC1.Caption := COPY(s,1,1);
  RC2.Caption := COPY(s,2,1);
  RC3.Caption := COPY(s,3,1);
  RC4.Caption := COPY(s,4,1);
  RC5.Caption := COPY(s,5,1);
  RC6.Caption := COPY(s,6,1);
  RC7.Caption := COPY(s,7,1);
  RC8.Caption := COPY(s,8,1);
  RC9.Caption := COPY(s,9,1);
  RC10.Caption:= COPY(s,10,1);
end;

procedure TReportFZ2.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_CALC_MESIAC.Value:=
    Q0_V_MESIAC.AsString+' / '+Q0_V_ROK.AsString;
{    MESIAC(Q0_V_MESIAC.Value,true);}

  if (Q0_U_fondzam.Value=1) or
     (Q0_U_fondzam1.Value=1) or
     (Q0_U_fondzam2.Value=1)
  then Q0_CALC_ZAKLAD.Value:=Q0_N_ZAKLAD_FZ.Value
  else Q0_CALC_ZAKLAD.Value:=0;

  Q0_CALC_MPT.Value:=COPY(
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value)+' '+
    Trim(Q0_Title.Value),
    1,100);
end;

procedure RunReportFZ2(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportFZ2:=TReportFZ2.Create(Application);
    if X.DisableShape then QRDisableShape(ReportFZ2);
    if X.DisableLabel then QRDisableLabel(ReportFZ2);
    Screen.Cursor:=crDefault;
    ReportFZ2.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportFZ2.Free;
  end;
end;

end.
