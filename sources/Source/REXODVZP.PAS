unit REXODVZP;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportOdvZp = class(TQuickRep)
    GroupFooterBand1: TQRBand;
    Q1_: TQuery;
    Q1_CALC_MPT: TStringField;
    DetailBand1: TQRBand;
    QRDBText47: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel47: TQRLabel;
    Q1_CALC_FIRMA: TStringField;
    QRShape6: TQRShape;
    QRDBText2: TQRDBText;
    Q0_: TQuery;
    QRSubDetail1: TQRSubDetail;
    QRShape19: TQRShape;
    QRShape56: TQRShape;
    QRShape60: TQRShape;
    QRDBText24: TQRDBText;
    QRShape61: TQRShape;
    QRDBText25: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText38: TQRDBText;
    Q0_kzp: TSmallintField;
    Q0_v_obdobie: TIntegerField;
    Q0_pocet: TIntegerField;
    Q0_CA_OBDOBIE: TStringField;
    Q0_CA_NADPIS1: TStringField;
    DS0: TDataSource;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape10: TQRShape;
    QRLabel16: TQRLabel;
    SummaryBand1: TQRBand;
    QRShape71: TQRShape;
    QRGroup2: TQRGroup;
    QRShape5: TQRShape;
    QRExpr1: TQRExpr;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRLabel8: TQRLabel;
    QRShape14: TQRShape;
    QRLabel7: TQRLabel;
    QRShape16: TQRShape;
    QRLabel14: TQRLabel;
    QRExpr2: TQRExpr;
    QRShape17: TQRShape;
    QRShape20: TQRShape;
    QRExpr3: TQRExpr;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape4: TQRShape;
    QRExpr4: TQRExpr;
    QRShape8: TQRShape;
    QRShape15: TQRShape;
    QRShape18: TQRShape;
    QRShape21: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    Q1_CALC_ZAKLAD1: TCurrencyField;
    Q1_CALC_ZAKLAD2: TCurrencyField;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    Q1_v_obdobie: TIntegerField;
    Q1_v_rok: TSmallintField;
    Q1_v_mesiac: TSmallintField;
    Q1_kzp: TSmallintField;
    Q1_n_zaklad_zp: TCurrencyField;
    Q1_zps: TBooleanField;
    Q1_zps1: TBooleanField;
    Q1_ztp: TBooleanField;
    Q1_o_zdravot: TCurrencyField;
    Q1_f_zdravot: TFloatField;
    Q1_fz_zdravot: TFloatField;
    Q1_u_zdrav: TSmallintField;
    Q1_code_emp: TIntegerField;
    Q1_surname: TStringField;
    Q1_name: TStringField;
    Q1_title: TStringField;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape26: TQRShape;
    QRExpr5: TQRExpr;
    Q1_oz_zdravot: TCurrencyField;
    Q0_text: TStringField;
    Q1_born_numb: TStringField;
    QRShape12: TQRShape;
    QRShape28: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    procedure Q1_CalcFields(DataSet: TDataSet);
    procedure Q0_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

var
  ReportOdvZp: TReportOdvZp;

procedure RunReportODVZP(const MyReportParam: TMyReportParam);

implementation

uses RexZP;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportOdvZp.ShowReport;
begin
  QRLabel47.Caption := 'ROZPIS ODVODOV ZDRAVOTNÉHO POISTENIA ZA ' +
     Mesiac(X.AktObdobie mod 100,true)+' '+IntToStr(X.AktObdobie div 100);
  if X.AktObdobie >= ZAKON_2009_01 then begin
    QRExpr1.Mask := '0.00';
    QRExpr4.Mask := '0.00';
    QRExpr5.Mask := '0.00';
    QRExpr7.Mask := '0.00';
    QRExpr8.Mask := '0.00';
    QRDBText24.Mask := '0.00';
    QRDBText33.Mask := '0.00';
    QRDBText1.Mask := '0.00';
    QRDBText4.Mask := '0.00';
    QRDBText5.Mask := '0.00';
  end else begin
    QRExpr1.Mask := '0';
    QRExpr4.Mask := '0';
    QRExpr5.Mask := '0.00';
    QRExpr7.Mask := '0';
    QRExpr8.Mask := '0';
    QRDBText24.Mask := '0';
    QRDBText33.Mask := '0';
    QRDBText1.Mask := '0';
    QRDBText4.Mask := '0';
    QRDBText5.Mask := '0.00';
  end;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q0_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q0_.Open;
  Q1_.Close;
  Q1_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q1_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q1_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q1_.Open;
  Preview;
  Q1_.Close;
  Q0_.Close;
end;


procedure TReportOdvZp.Q1_CalcFields(DataSet: TDataSet);
begin
  Q1_CALC_FIRMA.Value := 'FIRMA:  '+X.AktFirmaStr;

  Q1_CALC_MPT.Value:=COPY(
    Trim(Q1_Name.Value)+' '+
    Trim(Q1_Surname.Value)+' '+
    Trim(Q1_Title.Value),
    1,100);

  Q1_CALC_ZAKLAD1.Value := 0;
  Q1_CALC_ZAKLAD2.Value := 0;
  if Q1_U_zdrav.Value in [1,3] then begin
    if Q1_Zps.Value then Q1_CALC_ZAKLAD2.Value := Q1_N_zaklad_zp.Value
                    else Q1_CALC_ZAKLAD1.Value := Q1_N_zaklad_zp.Value;
  end
end;

procedure RunReportODVZP(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportOdvZp:=TReportOdvZp.Create(Application);
    if X.DisableShape then QRDisableShape(ReportOdvZp);
    if X.DisableLabel then QRDisableLabel(ReportOdvZp);
    Screen.Cursor:=crDefault;
    ReportOdvZp.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportOdvZp.Free;
  end;
end;



procedure TReportOdvZp.Q0_CalcFields(DataSet: TDataSet);
var s: string;
begin
{ Q0_CALC_FIRMA.Value := X.AktFirmaStr;}

 s:=IntToStr(Q0_V_obdobie.Value);
 Q0_Ca_obdobie.Value:=
    'za mesiac  '+Copy(s,5,2)+' / '+Copy(s,1,4);
 Q0_ca_nadpis1.Value:= LPAD(Q0_kzp.AsString,2,'0') + ' - '+Q0_Text.Value;



end;

























































end.
