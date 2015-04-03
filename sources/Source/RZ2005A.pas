unit RZ2005A;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportRZ_2005 = class(TQuickRep)
    DetailBand1: TQRBand;
    QRLabel32: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape13: TQRShape;
    QRShape38: TQRShape;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel6: TQRLabel;
    QRShape5: TQRShape;
    QRLabel12: TQRLabel;
    QRShape14: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    Q0_: TQuery;
    Q0_ADR: TStringField;
    Q0_TMP: TStringField;
    Q0_Name: TStringField;
    Q0_Surname: TStringField;
    Q0_Title: TStringField;
    Q0_born_numb: TStringField;
    Q0_tp_street: TStringField;
    Q0_tp_city: TStringField;
    Q0_tp_zip: TStringField;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape6: TQRShape;
    QRLabel4: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel15: TQRLabel;
    QRShape27: TQRShape;
    QRLabel26: TQRLabel;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRLabel27: TQRLabel;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRLabel28: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    Q0_v_rok: TSmallintField;
    Q0_Ciastzd1: TCurrencyField;
    Q0_Ciastzd2: TCurrencyField;
    Q0_Ciastzd_spolu: TCurrencyField;
    Q0_Nc_minimum: TCurrencyField;
    Q0_Nc_deti: TCurrencyField;
    Q0_Nc_partner: TCurrencyField;
    Q0_Nc_invalid_ciast: TCurrencyField;
    Q0_Nc_invalid_ztp: TCurrencyField;
    Q0_Nc_dary: TCurrencyField;
    Q0_Nc_spolu: TCurrencyField;
    Q0_Zdanmzda: TCurrencyField;
    Q0_Zdanmzda_round: TCurrencyField;
    Q0_Dan: TCurrencyField;
    Q0_Uhrn_preddavkov: TCurrencyField;
    Q0_Preplatok: TCurrencyField;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText20: TQRDBText;
    Q0_code_emp: TIntegerField;
    QR_Vykaz_zostavil: TQRLabel;
    QR_Vykaz_dna: TQRLabel;
    QRShape41: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel61: TQRLabel;
    QR_Vykaz_zostavil_text: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel47: TQRLabel;
    QRDBText24: TQRDBText;
    QINF_: TQuery;
    QINF_NAZOV: TStringField;
    QINF_ADR_ULICA: TStringField;
    QINF_ADR_MESTO: TStringField;
    QINF_ADR_PSC: TStringField;
    QINF_CALC_ADRESA: TStringField;
    Q0_Uhrn_nepenaznych: TCurrencyField;
    Q0_Nedoplatok_nepenaznych: TCurrencyField;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRShape54: TQRShape;
    QRLabel75: TQRLabel;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape49: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel16: TQRLabel;
    Q0_Uhrn_brutto: TCurrencyField;
    Q0_Uhrn_osobitna: TCurrencyField;
    Q0_Dan_osobitna: TCurrencyField;
    Q0_Poistne: TCurrencyField;
    Q0_DDP: TCurrencyField;
    Q0_Uhrn_nepen2: TCurrencyField;
    Q0_Nedoplatok_nepen2: TCurrencyField;
    QRDBText1: TQRDBText;
    QRDBText23: TQRDBText;
    QRMemo1: TQRMemo;
    QRLabel50: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel76: TQRLabel;
    QINF_DIC: TStringField;
    QRDBText29: TQRDBText;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRMemo2: TQRMemo;
    QRMemo6: TQRMemo;
    QINF_ADR_CISLO: TStringField;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRMemo3: TQRMemo;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRShape10: TQRShape;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape11: TQRShape;
    QRLabel18: TQRLabel;
    QRShape12: TQRShape;
    QRShape15: TQRShape;
    QRDBText11: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape16: TQRShape;
    QRLabel21: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRDBText12: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape19: TQRShape;
    QRLabel30: TQRLabel;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRDBText13: TQRDBText;
    QRLabel31: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel59: TQRLabel;
    QRShape22: TQRShape;
    QRLabel62: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRDBText15: TQRDBText;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRShape25: TQRShape;
    QRLabel65: TQRLabel;
    QRShape26: TQRShape;
    QRShape42: TQRShape;
    QRDBText21: TQRDBText;
    QRLabel66: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QR_Telefon: TQRLabel;
    Q0_D_bonus_narok: TCurrencyField;
    Q0_D_bonus_cerpany: TCurrencyField;
    Q0_CALC_PREPL_BONUS: TCurrencyField;
    Q0_CALC_PREPL_BB: TCurrencyField;
    Q0_CALC_NEDOPL_BONUS: TCurrencyField;
    Q0_CALC_NEDOPL_BB: TCurrencyField;
    Q0_CALC_PREPL_DAN: TCurrencyField;
    Q0_CALC_NEDOPL_DAN: TCurrencyField;
    QRLabel57: TQRLabel;
    QRLabel79: TQRLabel;
    QRShape37: TQRShape;
    QRShape39: TQRShape;
    QRDBText19: TQRDBText;
    QRShape46: TQRShape;
    QRLabel82: TQRLabel;
    QRShape47: TQRShape;
    QRDBText26: TQRDBText;
    QRMemo4: TQRMemo;
    QRShape40: TQRShape;
    QRShape43: TQRShape;
    QRDBText22: TQRDBText;
    QRMemo5: TQRMemo;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRDBText25: TQRDBText;
    QRMemo7: TQRMemo;
    QRShape48: TQRShape;
    QRLabel41: TQRLabel;
    Q0_Nc_ucelove_sporenie: TCurrencyField;
    Q0_Nc_zivotne_poistenie: TCurrencyField;
    Q0_Nc_do_limitu: TCurrencyField;
    Q0_tel1: TStringField;
    QRLabel80: TQRLabel;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure QINF_CalcFields(DataSet: TDataSet);
    procedure ReportRZ_2005BeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    first_preview: boolean;
  public
    procedure ShowReportStart;
    procedure ShowReportEnd;

  end;

var
  ReportRZ_2005: TReportRZ_2005;

procedure RunReportRZ_2005(const MyReportParam: TMyReportParam);
procedure RunReport_NEZISK1(const MyReportParam: TMyReportParam);
procedure RunReport_NEZISK2(const MyReportParam: TMyReportParam);

implementation

uses Main, FmxUtils;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportRZ_2005.ShowReportStart;
begin
  first_preview:=True;
  QR_Vykaz_zostavil.Caption := X.Vykaz_zostavil;
  QR_Vykaz_dna.Caption := X.Vykaz_dna;
  QR_Telefon.Caption := X.Telefon;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.Code_Emp1;
  Q0_.ParamByName('P2').AsInteger := X.Code_Emp2;
  Q0_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q0_.ParamByName('ROK').AsInteger := MyRok(X.AktObdobie);
  Q0_.Open;
  QINF_.Open;
end;

procedure TReportRZ_2005.ShowReportEnd;
begin
  QINF_.Close;
  Q0_.Close;
end;

procedure TReportRZ_2005.Q0_CalcFields(DataSet: TDataSet);
var bonus,dan,bb:double;
begin
  Q0_TMP.Value:= Copy(
    Trim(Q0_Title.Value)+' '+
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value),1,100);

  Q0_ADR.Value:=
    Q0_tp_street.Value+', '+Q0_tp_city.Value;
  {--}
  Q0_CALC_PREPL_BONUS.Value :=0;
  Q0_CALC_NEDOPL_BONUS.Value :=0;
  bonus:=Q0_D_bonus_narok.Value - Q0_D_bonus_cerpany.Value;
  if bonus>0
    then Q0_CALC_PREPL_BONUS.Value := bonus
    else Q0_CALC_NEDOPL_BONUS.Value := -bonus;
  {--}
  Q0_CALC_PREPL_DAN.Value :=0;
  Q0_CALC_NEDOPL_DAN.Value :=0;
  dan:=Q0_Preplatok.Value;
  if dan>0
    then Q0_CALC_PREPL_DAN.Value := dan
    else Q0_CALC_NEDOPL_DAN.Value := -dan;
  {--}
  Q0_CALC_PREPL_BB.Value :=0;
  Q0_CALC_NEDOPL_BB.Value :=0;
  bb:=dan-bonus;
  if bb>0
    then Q0_CALC_PREPL_BB.Value := bb
    else Q0_CALC_NEDOPL_BB.Value := -bb;
 end;

procedure RunReportRZ_2005(const MyReportParam: TMyReportParam);
begin with ReportRZ_2005 do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportRZ_2005:=TReportRZ_2005.Create(Application);
    if X.DisableShape then QRDisableShape(ReportRZ_2005);
    if X.DisableLabel then QRDisableLabel(ReportRZ_2005);
    Screen.Cursor:=crDefault;
    ReportRZ_2005.ShowReportStart;
    if Q0_.Active AND (Q0_.RecordCount>0) then ReportRZ_2005.Preview;
    ReportRZ_2005.ShowReportEnd;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportRZ_2005.Free;
  end;
end;end;

procedure RunReport_NEZISK1(const MyReportParam: TMyReportParam);
begin with ReportRZ_2005 do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportRZ_2005:=TReportRZ_2005.Create(Application);
    if X.DisableShape then QRDisableShape(ReportRZ_2005);
    if X.DisableLabel then QRDisableLabel(ReportRZ_2005);
    Screen.Cursor:=crDefault;
    ReportRZ_2005.ShowReportStart;
    if ReportRZ_2005.Q0_.Active AND (ReportRZ_2005.Q0_.RecordCount=0) then
    begin
      MyError(Format(SMyRzpNeexistuje2,[MyRok(X.AktObdobie)-1,MyRok(X.AktObdobie)]));
      exit;
    end;
    X.rtf_sablona := MyFrmPath + 'Vyhlasenie_2%_vzor.rtf';
    X.rtf_subor :=
      MyRepPath1 + 'vyh1_' + RC_BEZ(Q0_Born_numb.Value)+'_'
                 + Q0_Surname.Value +'_' + Q0_Name.Value + '.rtf';
    Rtf_Open(X);
    if X.Rtf_prepisat then
    begin
      Rtf_InitKeyWord;
      Rtf_SetKeyWord('$ROK',Q0_V_rok.AsString,0,' ');
      Rtf_SetKeyWord('$PRIEZVISKO',Q0_Surname.Value,48,' ');
      Rtf_SetKeyWord('$MENO',Q0_Name.Value,48,' ');
      Rtf_SetKeyWord('$RC1',Copy(Q0_Born_numb.Value,1,1),0,' ');
      Rtf_SetKeyWord('$RC2',Copy(Q0_Born_numb.Value,2,1),0,' ');
      Rtf_SetKeyWord('$RC3',Copy(Q0_Born_numb.Value,3,1),0,' ');
      Rtf_SetKeyWord('$RC4',Copy(Q0_Born_numb.Value,4,1),0,' ');
      Rtf_SetKeyWord('$RC5',Copy(Q0_Born_numb.Value,5,1),0,' ');
      Rtf_SetKeyWord('$RC6',Copy(Q0_Born_numb.Value,6,1),0,' ');
      Rtf_SetKeyWord('$RC7',Copy(Q0_Born_numb.Value,7,1),0,' ');
      Rtf_SetKeyWord('$RC8',Copy(Q0_Born_numb.Value,8,1),0,' ');
      Rtf_SetKeyWord('$RC9',Copy(Q0_Born_numb.Value,9,1),0,' ');
      Rtf_SetKeyWord('$RC0',Copy(Q0_Born_numb.Value,10,1),0,' ');
      Rtf_SetKeyWord('$ADRESA',Q0_Tp_street.Value,48,' ');
      Rtf_SetKeyWord('$PSC',Q0_TP_zip.Value,48,' ');
      Rtf_SetKeyWord('$OBEC',Q0_TP_city.Value,48,' ');
      Rtf_SetKeyWord('$STAT','Slovensko',48,' ');
      Rtf_SetKeyWord('$TELEFON',Q0_Tel1.Value,48,' ');
      Rtf_SetKeyWord('$RR9',Format('%0.0f',[Q0_Dan.Value-Q0_D_bonus_narok.Value]),0,' ');
      Rtf_SetKeyWord('$RR10',Format('%0.0f',[ZAOKRUHLI((Q0_Dan.Value-Q0_D_bonus_narok.Value)*0.02,0,1)]),0,' ');
      Rtf_SetKeyWord('$MIESTO',X.Vykaz_Miesto,30,' ');
      Rtf_SetKeyWord('$DEN',X.Vykaz_dna,16,' ');
      Rtf_Replace(X);
    end;
    ReportRZ_2005.ShowReportEnd;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportRZ_2005.Free;
  end;
  Rtf_zobraz(X);
end;end;

procedure RunReport_NEZISK2(const MyReportParam: TMyReportParam);
begin with ReportRZ_2005 do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportRZ_2005:=TReportRZ_2005.Create(Application);
    if X.DisableShape then QRDisableShape(ReportRZ_2005);
    if X.DisableLabel then QRDisableLabel(ReportRZ_2005);
    Screen.Cursor:=crDefault;
    ReportRZ_2005.ShowReportStart;
    if ReportRZ_2005.Q0_.Active AND (ReportRZ_2005.Q0_.RecordCount=0) then
    begin
      MyError(Format(SMyRzpNeexistuje2,[MyRok(X.AktObdobie)-1,MyRok(X.AktObdobie)]));
      exit;
    end;
    X.rtf_sablona := MyFrmPath + 'Potvrd_dane_nezisk_sektor_vzor.rtf';
    X.rtf_subor :=
      MyRepPath1 + 'vyh2_' + RC_BEZ(Q0_Born_numb.Value)+'_'
                 + Q0_Surname.Value +'_' + Q0_Name.Value + '.rtf';
    Rtf_Open(X);
    if X.Rtf_prepisat then
    begin
      Rtf_InitKeyWord;    
      Rtf_SetKeyWord('$ROK',Q0_V_rok.AsString,0,' ');
      Rtf_SetKeyWord('$MENO',Q0_TMP.Value,0,' ');
      Rtf_SetKeyWord('$RODNE_CISLO',Q0_Born_numb.Value,0,' ');
      Rtf_SetKeyWord('$ADRESA',Q0_ADR.Value,0,' ');
      Rtf_SetKeyWord('$PSC',Q0_TP_zip.Value,0,' ');
      Rtf_SetKeyWord('$RR1',Format('%0.0f',[Q0_Dan.Value]),0,' ');
      Rtf_SetKeyWord('$RR2',Format('%0.0f',[Q0_D_bonus_narok.Value]),0,' ');
      Rtf_SetKeyWord('$RR3',Format('%0.0f',[Q0_Dan.Value-Q0_D_bonus_narok.Value]),0,' ');
      Rtf_SetKeyWord('$RR4',Format('%0.0f',[Q0_CALC_NEDOPL_DAN.Value]),0,' ');
      Rtf_SetKeyWord('$RR5',Format('%0.0f',[Q0_CALC_PREPL_DAN.Value]),0,' ');
      Rtf_SetKeyWord('$RR6A','',0,' ');
      Rtf_SetKeyWord('$RR6B','',0,' ');
      Rtf_SetKeyWord('$DIC',QINF_DIC.Value,0,' ');
      Rtf_SetKeyWord('$ZAMTEL',QINF_CALC_Adresa.Value,0,' ');
      Rtf_SetKeyWord('$SPRAVCA_DANE','',0,' ');
      Rtf_SetKeyWord('$VYPRACOVAL',X.Vykaz_Zostavil,43,' ');
      Rtf_SetKeyWord('$DEN',X.Vykaz_dna,0,' ');
      Rtf_Replace(X);
    end;
    ReportRZ_2005.ShowReportEnd;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportRZ_2005.Free;
  end;
  Rtf_zobraz(X);
end;end;

procedure TReportRZ_2005.QINF_CalcFields(DataSet: TDataSet);
begin
  QINF_CALC_ADRESA.Value :=
    QINF_nazov.Value + ', '+
    MyAdresa(
    QINF_adr_ulica.Value,
    QINF_adr_cislo.Value,
    QINF_adr_psc.Value,
    QINF_adr_mesto.Value );
end;

procedure TReportRZ_2005.ReportRZ_2005BeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,8);
end;


end.
