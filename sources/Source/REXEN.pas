unit REXEN;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportEN = class(TQuickRep)
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel47: TQRLabel;
    QRSysData2: TQRSysData;
    QRShape19: TQRShape;
    QRLabel20: TQRLabel;
    QRShape6: TQRShape;
    QRDBText2: TQRDBText;
    QRGroup1: TQRGroup;
    QRSubDetail1: TQRSubDetail;
    Q0_: TQuery;
    Q0_code_emp: TIntegerField;
    Q0_v_obdobie: TIntegerField;
    Q0_NID: TIntegerField;
    Q0_Datum_od: TDateField;
    Q0_Datum_do: TDateField;
    Q0_Prac_dni: TSmallintField;
    Q0_Dovod: TStringField;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRDBText47: TQRDBText;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRDBText1: TQRDBText;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRDBText7: TQRDBText;
    Q0_code_emp_1: TIntegerField;
    Q0_surname: TStringField;
    Q0_name: TStringField;
    Q0_title: TStringField;
    Q0_CALC_FIRMA: TStringField;
    Q0_CALC_PMT: TStringField;
    Q0_Calc_kal_dni: TIntegerField;
    QRLabel6: TQRLabel;
    QRShape15: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape17: TQRShape;
    Q0_Calc_typ_nep: TStringField;
    Q0_Typ: TSmallintField;
    Q0_code_numb: TIntegerField;
    procedure Q0_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

var
  ReportEN: TReportEN;

procedure RunReportEN(const MyReportParam: TMyReportParam);

implementation

{$R *.DFM}

var X: TMyReportParam;

procedure TReportEN.ShowReport;
var RR,MM,LASTDAY:word;
begin
  RR:=X.AktObdobie div 100;
  MM:=X.AktObdobie mod 100;
  QRLabel47.Caption := 'EVIDENCIA NEPRÍTOMNOSTI ZA ' +
     Mesiac(MM,true)+' '+IntToStr(RR);
  Q0_.Close;

  Q0_.ParamByName('Datum_od').Value := EncodeDate(RR,MM,1);
  if MM=12 then begin
    LastDay := Trunc(EncodeDate(RR+1,1,1) - EncodeDate(RR,MM,1));
  end
  else begin
    LastDay := Trunc(EncodeDate(RR,MM+1,1) - EncodeDate(RR,MM,1));
  end;
  Q0_.ParamByName('Datum_do').Value := EncodeDate(RR,MM,LastDay);
  Q0_.ParamByName('Sid1').AsInteger := X.AktMinSid;
  Q0_.ParamByName('Sid2').AsInteger := X.AktMaxSid;
  Q0_.ParamByName('Code_emp1').AsInteger := X.Code_emp1;
  Q0_.ParamByName('Code_emp2').AsInteger := X.Code_emp2;
  Q0_.Open;
  Preview;
  Q0_.Close;
end;


procedure TReportEN.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_CALC_FIRMA.Value := 'FIRMA:  '+X.AktFirmaStr;

  Q0_CALC_PMT.Value:=
    Copy(Spoj(
    Q0_Surname.Value,
    Q0_Name.Value,
    Q0_Title.Value),
    1,100);

  if (Q0_Datum_od.AsString <> '') AND (Q0_Datum_do.AsString <> '')
  then
    Q0_Calc_Kal_Dni.Value :=
      Trunc(Q0_Datum_do.Value - Q0_Datum_od.Value)+1
  else
    Q0_Calc_Kal_Dni.Value := 0;

  Q0_Calc_Typ_Nep.Value := TEXT_TYP_NEPRITOMNOSTI(Q0_Typ.Value);
end;

procedure RunReportEN(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportEN:=TReportEN.Create(Application);
    if X.DisableShape then QRDisableShape(ReportEN);
    if X.DisableLabel then QRDisableLabel(ReportEN);
    Screen.Cursor:=crDefault;
    ReportEN.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportEN.Free;
  end;
end;





end.
