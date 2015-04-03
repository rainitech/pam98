unit REXVD2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, MyConsts, MyQuick, Db,
  DBTables;

type
  TReportVD2 = class(TQuickRep)
    Q0_: TQuery;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRMemo1: TQRMemo;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    QRMemo5: TQRMemo;
    QRLabel5: TQRLabel;
    QRMemo6: TQRMemo;
    QRMemo7: TQRMemo;
    QRLabel6: TQRLabel;
    QRMemo8: TQRMemo;
    QRLabel7: TQRLabel;
    QRMemo9: TQRMemo;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
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
    QRMemo10: TQRMemo;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    Q0_CALC_MENO: TStringField;
    Q0_CALC_TP: TStringField;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRDBText1: TQRDBText;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    Q0_born_numb: TStringField;
    Q0_surname: TStringField;
    Q0_name: TStringField;
    Q0_title: TStringField;
    Q0_tp_street: TStringField;
    Q0_tp_city: TStringField;
    Q0_tp_zip: TStringField;
    Q1_: TQuery;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    Q0_CALC_PRIJMY: TCurrencyField;
    Q0_CALC_ZD: TCurrencyField;
    Q0_CALC_PREDDAVKY: TCurrencyField;
    Q0_CALC_NEDOPLATOK: TCurrencyField;
    Q0_code_emp: TIntegerField;
    QRDBText6: TQRDBText;
    QRSysData1: TQRSysData;
    QR_Vykaz_zostavil: TQRLabel;
    QR_Telefon: TQRLabel;
    QR_Miesto: TQRLabel;
    QRExpr1: TQRExpr;
    Q0_CALC_ZOBRAZ: TSmallintField;
    Q0_CALC_ZUCTOVANE: TStringField;
    QRDBText7: TQRDBText;
    Q0_born_date: TDateField;
    QSUM_: TQuery;
    QSUM_code_emp: TIntegerField;
    QSUM_d_ciastzd: TCurrencyField;
    QSUM_d_preddavok: TCurrencyField;
    QSUM_n_brutto: TCurrencyField;
    QSUM_d_osobitna: TCurrencyField;
    QSUM_d_dan: TCurrencyField;
    QSUM_d_bonus_narok: TCurrencyField;
    QSUM_d_bonus_cerpany: TCurrencyField;
    QSUM_nepenazny_prijem: TCurrencyField;
    QMES_: TQuery;
    QVYSL_: TQuery;
    QVYSL_Code_emp: TIntegerField;
    QVYSL_Prijmy: TCurrencyField;
    QVYSL_Zaklad_dane: TCurrencyField;
    QVYSL_Preddavky: TCurrencyField;
    QVYSL_Prijmy_nepenazne: TCurrencyField;
    QVYSL_Vyplateny_bonus: TCurrencyField;
    QVYSL_Pocet_deti: TSmallintField;
    QVYSL_Mesiace: TStringField;
    QVYSL_Name: TStringField;
    QVYSL_Surname: TStringField;
    QVYSL_Title: TStringField;
    QVYSL_Born_date: TDateField;
    QVYSL_Tp_street: TStringField;
    QVYSL_Tp_city: TStringField;
    QVYSL_Tp_zip: TStringField;
    QVYSL_Stat_tp: TStringField;
    QVYSL_Born_numb: TStringField;
    QVYSL_L_TP_STAT: TStringField;
    QMES_v_mesiac: TSmallintField;
    QMES_code_emp: TIntegerField;
    procedure Q0_CalcFields(DataSet: TDataSet);
  private

  public
    procedure ShowReportStart;
    procedure ShowReportEnd;
    procedure SetX(const MyReportParam:TMyReportParam);

  end;

var
  ReportVD2: TReportVD2;

procedure RunReportVD2(const MyReportParam: TMyReportParam);

implementation

uses Dm_main, REXVD, DM_sql;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportVD2.ShowReportStart;
var rok: integer;
begin
  rok:=MyRok(X.AktObdobie);
  Q0_.Params[0].Value:=EncodeDate(rok,12,31);
  Q0_.Params[1].Value:=EncodeDate(rok-1,12,31);
  Q0_.Open;
  QR_Vykaz_zostavil.caption:=X.Vykaz_Zostavil;
  QR_Miesto.Caption:=X.Vykaz_miesto;
  QR_Telefon.caption:=X.Telefon;
end;

procedure TReportVD2.ShowReportEnd;
begin
  Q0_.Close;
end;

procedure RunReportVD2(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportVD2:=TReportVD2.Create(Application);
    if X.DisableShape then QRDisableShape(ReportVD2);
    if X.DisableLabel then QRDisableLabel(ReportVD2);
    Screen.Cursor:=crDefault;
    ReportVD2.ShowReportStart;
    ReportVD2.Preview;
    ReportVD2.ShowReportEnd;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportVD2.Q0_.Close;
    ReportVD2.Free;
  end;
end;

procedure TReportVD2.Q0_CalcFields(DataSet: TDataSet);
var zac, kon: byte;
begin
    Q0_CALC_MENO.Text:=
    Trim(Q0_Title.Value)+' '+
    Trim(Q0_Surname.Value)+' '+
    Trim(Q0_Name.Value);

    Q0_CALC_TP.Value :=
    Q0_tp_street.Value+', '+
    Q0_tp_zip.Value+' '+
    Q0_tp_city.Value;

    Q1_.Close;
    Q1_.SQL.Strings[1]:=' sum(d_ciastzd1+n_poist+n_ddp) n_brutto, sum(d_ciastzd1) d_ciastzd, sum(d_preddavok1) d_preddavky, min(v_mesiac) zuct_zac, max(v_mesiac) zuct_kon';
    //Q1_.SQL.Strings[1]:=' sum(n_brutto) n_brutto, sum(d_ciastzd1) d_ciastzd, sum(d_preddavok1) d_preddavky';
    Q1_.SQL.Strings[2]:=' from vyp';
    Q1_.Params[0].Value:=Q0_Code_emp.Value;
    Q1_.Params[1].Value:=MyRok(X.AktObdobie);
    Q1_.Open;
    if Q1_.fields[0].value=null then
     Q0_CALC_PRIJMY.Value:=0
    else
     Q0_CALC_PRIJMY.Value:=Q1_.Fields[0].Value;
    if Q1_.fields[1].value=null then
     Q0_CALC_ZD.Value:=0
    else
     Q0_CALC_ZD.Value:=Q1_.Fields[1].Value;
    if Q1_.fields[2].value=null then
     Q0_CALC_PREDDAVKY.Value:=0
    else
     Q0_CALC_PREDDAVKY.Value:=Q1_.Fields[2].Value;
    if Q1_.fields[3].value=null then
       Q0_CALC_ZUCTOVANE.Value:=''
    else begin
         zac:=Q1_.fields[3].value;
         kon:=Q1_.fields[4].value;
         if kon=zac then
          Q0_CALC_ZUCTOVANE.Value:=IntToStr(zac)
         else
          Q0_CALC_ZUCTOVANE.Value:=IntToStr(zac)+' - '+IntToStr(kon);
    end;
    Q1_.Close;
    Q1_.SQL.Strings[1]:=' preplatok';
    Q1_.SQL.Strings[2]:=' from rzp';
    Q1_.Params[0].Value:=Q0_Code_emp.Value;
    Q1_.Params[1].Value:=MyRok(X.AktObdobie);
    Q1_.Open;
    if Q1_.fields[0].value=null then
     begin
      Q0_CALC_ZOBRAZ.Value:=0;
      Q0_CALC_NEDOPLATOK.Value:=0
     end
    else
     begin
      Q0_CALC_ZOBRAZ.Value:=1;
      Q0_CALC_NEDOPLATOK.Value:=Q1_.Fields[0].Value;
     end;
    Q1_.Close;
end;

procedure Mesiace;
begin
 E_TAG_DATA('box00','0');
 E_TAG_DATA('box01','1');
end;

procedure Stlpec(var ss:integer);
var i:integer; pom:string;
  A1,A2,A3:string;
begin with ReportVD2 do begin
  E_TEXT_RPAD(QVYSL_born_numb.Value,10,' ',false);
  E_TEXT_RPAD(QVYSL_Surname.Value,15,' ',false);
  E_TEXT_RPAD(QVYSL_Name.Value,15,' ',false);
  MyRozdelUlicuExt(QVYSL_Tp_street.Value,A1,A2,A3);
  E_TEXT_RPAD(A1,15,' ',false);
  E_TEXT_RPAD(A2,7,' ',false);
  E_TEXT_RPAD(QVYSL_Tp_city.Value,30,' ',false);
  E_TEXT_RPAD(QVYSL_Tp_zip.Value,5,' ',false);
  E_TEXT_RPAD(QVYSL_L_tp_stat.Value,15,' ',false);
  E_TEXT_LPAD(Format('%0.0f',[QVYSL_PRIJMY.Value]),10,' ',false);  {uhrn prijmov}
  pom:='';
  for i:=2 to 13 do begin
     if Copy(QVYSL_Mesiace.Value,i,1)='1' then begin
       if pom<>'' then pom:=pom+',';
       pom:=pom+IntToStr(i-1);
     end;
  end;
  E_TEXT_RPAD(pom,26,' ',false);
  E_TEXT_LPAD(Format('%0.0f',[QVYSL_ZAKLAD_DANE.Value]),10,' ',false);  {zaklad dane}
  E_TEXT_LPAD(Format('%0.0f',[QVYSL_PREDDAVKY.Value]),10,' ',false);  {preddavky bez bonusu}
  E_TEXT_RPAD('  ',0,' ',false);
  E_TEXT_LPAD(Format('%0.0f',[QVYSL_VYPLATENY_BONUS.Value]),6,' ',false);  {suma vyplateneho bonusu}
  E_TEXT_RPAD(FormatDateTime('dd.mm.yyyy',QVYSL_born_date.Value),10,' ',false);
  E_TEXT_LPAD('1',2,'0',true);      {pocet deti}
  ss:=ss+1;
  if ss>4 then ss:=1;
end;end;

procedure RunReportVD2_XML(const MyReportParam: TMyReportParam);
begin

end;

procedure TReportVD2.SetX(const MyReportParam:TMyReportParam);
begin
  X:=MyReportParam;
end;

end.
