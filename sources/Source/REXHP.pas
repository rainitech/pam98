unit REXHP;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportHP = class(TQuickRep)
    Q0_: TQuery;
    DetailBand1: TQRBand;
    QRDBText16: TQRDBText;
    QRShape45: TQRShape;
    QRDBText47: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel46: TQRLabel;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    Q0_sporenie: TCurrencyField;
    Q0_predcislo_u: TStringField;
    Q0_cislo_u: TStringField;
    Q0_banka_u: TStringField;
    Q0_ssym_u: TStringField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    Q0_CALC_CISLO_U: TStringField;
    QRLabel1: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape14: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRShape6: TQRShape;
    QRLabel4: TQRLabel;
    SummaryBand1: TQRBand;
    QRShape12: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    QRGroup1: TQRGroup;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel10: TQRLabel;
    QRShape10: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape13: TQRShape;
    QRLabel17: TQRLabel;
    QRShape11: TQRShape;
    QRLabel18: TQRLabel;
    QRShape16: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape17: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    Q0_title: TStringField;
    Q0_name: TStringField;
    Q0_surname: TStringField;
    Q0_CALC_TMP: TStringField;
    QRDBText10: TQRDBText;
    QRDBText9: TQRDBText;
    Q0_spp: TStringField;
    QRDBText11: TQRDBText;
    Q0_vsym: TStringField;
    Q0_ksym: TStringField;
    Q0_CALC_PRIJEMCA: TStringField;
    Q0B_: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    CurrencyField1: TCurrencyField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    Q0C_: TQuery;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    CurrencyField2: TCurrencyField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    Q0A_: TQuery;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    CurrencyField3: TCurrencyField;
    StringField35: TStringField;
    StringField36: TStringField;
    StringField37: TStringField;
    StringField38: TStringField;
    StringField39: TStringField;
    StringField40: TStringField;
    StringField41: TStringField;
    StringField42: TStringField;
    StringField43: TStringField;
    StringField44: TStringField;
    Q0_poradie: TStringField;
    Q0C_poradie: TStringField;
    Q0C_prijemca: TStringField;
    Q0A_poradie: TStringField;
    Q0A_prijemca: TStringField;
    Q0_prijemca: TStringField;
    Q0B_poradie: TStringField;
    Q0B_prijemca: TStringField;
    Q0_CALC_SPP: TStringField;
    procedure Q0_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

var
  ReportHP: TReportHP;

procedure RunReportHP(const MyReportParam: TMyReportParam);

implementation

uses RexNz, ParHP;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportHP.ShowReport;
var suma:double;
  function pridaj(const s1,s2:string):string;
  begin
    if s1='' then result:=s2 else result:=#13+'union'+#13+s2;
  end;
begin with ParHP.MyParam do begin
{-- Typ: A(poistné+daò) B(výplaty) C(zrážky) --}
  Application.CreateForm(TFormParHP, FormParHP);
  try
  FormParHP.MyExecute;
  finally
  FormParHP.Release;
  FormParHP:=nil;
  end;
{--}
  if not(tlacit_a or tlacit_b or tlacit_c) then begin
    MyError(SMyVypTlacHPNotSelected);
    exit;
  end;
  Screen.Cursor:=crHourGlass;
  if tlacit_a then begin
    ReportNZ:=TReportNZ.Create(Application);
    ReportNZ.VytvorPomocnuDatabazu(X,True);
    ReportNZ.Free;
  end;
  Q0_.SQL.Clear;
  if tlacit_a then Q0_.SQL.Add(pridaj(Q0_.SQL.Text,Q0A_.SQL.Text));
  if tlacit_b then Q0_.SQL.Add(pridaj(Q0_.SQL.Text,Q0B_.SQL.Text));
  if tlacit_c then Q0_.SQL.Add(pridaj(Q0_.SQL.Text,Q0C_.SQL.Text));
  Q0_.Prepare;
  if (tlacit_b or tlacit_c) then begin
    Q0_.ParamByName('P1').AsInteger := X.AktObdobie;
    Q0_.ParamByName('P2').AsInteger := X.AktMinSid;
    Q0_.ParamByName('P3').AsInteger := X.AktMaxSid;
  end;
  Q0_.Open;
  Q0_.First;
  suma:=0;
  while not Q0_.EOF do begin
    Suma:=Suma+Q0_Sporenie.Value;
    Q0_.Next;
  end;
  Q0_.First;
  QRLabel7.Caption:=FloatToStrF(Suma,ffFixed,15,2);
  Screen.Cursor:=crDefault;
  Preview;
  Q0_.Close;
end;end;

procedure TReportHP.Q0_CalcFields(DataSet: TDataSet);
begin with ParHP.MyParam do begin
  if Trim(Q0_Predcislo_u.Value)=''
  then Q0_CALC_CISLO_U.Value:=Q0_Cislo_u.Value
  else Q0_CALC_CISLO_U.Value:=Q0_Predcislo_u.Value+'-'+
                              Q0_Cislo_u.Value;

  Q0_CALC_TMP.Text:=
    Trim(Q0_Title.Value)+' '+
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value);

  if Q0_Poradie.Value='1' then begin
    if tlacit_mena
      then Q0_CALC_PRIJEMCA.Value := Q0_CALC_TMP.Text
      else Q0_CALC_PRIJEMCA.Value := '';
  end
  else Q0_CALC_PRIJEMCA.Value := Q0_Prijemca.Value;

  if Q0_Poradie.Value='1' 
    then Q0_CALC_SPP.Value:=spp
    else Q0_CALC_SPP.Value:=Q0_SPP.Value;
end;end;

procedure RunReportHP(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportHP:=TReportHP.Create(Application);
    if X.DisableShape then QRDisableShape(ReportHP);
    if X.DisableLabel then QRDisableLabel(ReportHP);
    Screen.Cursor:=crDefault;
    ReportHP.ShowReport;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
  Screen.Cursor:=crDefault;
  ReportHP.Free;
  end;
end;


end.
