unit REXPP2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportPP2 = class(TQuickRep)
    QRGroup1: TQRGroup;
    QRLabel16: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    Q0_: TQuery;
    Q0_cislo: TSmallintField;
    Q0_Name: TStringField;
    Q0_Surname: TStringField;
    Q0_Title: TStringField;
    Q0_Born_date: TDateField;
    Q0_PMT: TStringField;
    Q0_MES: TStringField;
    Q1_: TQuery;
    DS0: TDataSource;
    Q0_code_emp: TIntegerField;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape1: TQRShape;
    QRLabel20: TQRLabel;
    QRShape2: TQRShape;
    QRLabel21: TQRLabel;
    QR_Telefon: TQRLabel;
    QR_Vykaz_Dna: TQRLabel;
    QR_Vykaz_zostavil: TQRLabel;
    QINF_: TQuery;
    QINF_NAZOV: TStringField;
    QINF_ADR_ULICA: TStringField;
    QINF_ADR_MESTO: TStringField;
    QINF_ADR_PSC: TStringField;
    QINF_CALC_ADRESA: TStringField;
    QINF_DIC: TStringField;
    QINF_ADR_CISLO: TStringField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QINF_ICO: TStringField;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRMena1: TQRLabel;
    QRMena2: TQRLabel;
    Q0_ADR: TStringField;
    Q0_tp_street: TStringField;
    Q0_tp_city: TStringField;
    Q0_tp_zip: TStringField;
    Q0_rod_stav: TStringField;
    Q0_pohlavie: TStringField;
    Q0_CALC_ROD_STAV: TStringField;
    QRDBText4: TQRDBText;
    Q0_zamestnanie: TStringField;
    Q0_nastup: TDateField;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape5: TQRShape;
    QRLabel11: TQRLabel;
    Q1_n_netto: TCurrencyField;
    QRDBText7: TQRDBText;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure QINF_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

var
  ReportPP2: TReportPP2;

procedure RunReportPP2(const MyReportParam: TMyReportParam);

implementation

uses DM_sql;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportPP2.ShowReport;
begin
  QR_Vykaz_dna.Caption := X.Vykaz_dna;
  QR_Telefon.Caption := X.Telefon;
  QR_Vykaz_zostavil.Caption := X.Vykaz_zostavil;
  if X.AktObdobie>=ZAKON_2009_01 then begin
    QRMena1.Caption := 'EUR';
    QRMena2.Caption := 'EUR';
  end else begin
    QRMena1.Caption := 'Sk';
    QRMena2.Caption := 'Sk';
  end;
  Q1_.Close;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.Code_emp1;
  Q0_.ParamByName('P2').AsInteger := X.Code_emp2;
  Q0_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q1_.ParamByName('ROK').AsInteger := X.AktObdobie div 100;
  Q0_.Open;
  Q1_.Open;
  QINF_.Close;
  QINF_.Open;
  Preview;
  QINF_.Close;
  Q1_.Close;
  Q0_.Close;
end;

procedure TReportPP2.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_ADR.Value :=
    Q0_tp_street.Value+', '+
    Q0_tp_zip.Value+' '+
    Q0_tp_city.Value;

  Q0_CALC_ROD_STAV.Value := RODINNY_STAV(StrToChar(Q0_Rod_stav.Value),
                                           StrToChar(Q0_Pohlavie.Value));

  Q0_PMT.Value:= Copy(
    Trim(Q0_Surname.Value)+' '+
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Title.Value)
    ,1,100);

  Q0_MES.Value:=Mesiac(Q0_cislo.Value,false);
(*
  s:=Format('select code_numb,surname,name from ":pam98_data:zam" z where z.born_numb=''%s'' or z.born_numb=''%s''',[s1,s2]);
    DMSQL.ExecuteSql(s);
    if DMSQL.Results[1]<>'' then
      if not MyOtazka(Format(SMyZamRcUzExistuje,[s1,DMSQL.Results[1],DMSQL.Results[2]+' '+DMSQL.Results[3]]))
*)

end;

procedure RunReportPP2(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportPP2:=TReportPP2.Create(Application);
    if X.DisableShape then QRDisableShape(ReportPP2);
    if X.DisableLabel then QRDisableLabel(ReportPP2);
    Screen.Cursor:=crDefault;
    ReportPP2.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportPP2.Free;
  end;
end;

procedure TReportPP2.QINF_CalcFields(DataSet: TDataSet);
begin
  QINF_CALC_ADRESA.Value :=
    MyAdresa(
    QINF_adr_ulica.Value,
    QINF_adr_cislo.Value,
    QINF_adr_psc.Value,
    QINF_adr_mesto.Value );
end;

end.
