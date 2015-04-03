unit VD2007B;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, MyConsts, MyQuick, Db,
  DBTables;

type
  TReportVD2007B = class(TQuickRep)
    Q1_: TQuery;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRMemo1: TQRMemo;
    Q1_born_numb: TStringField;
    Q1_surname: TStringField;
    Q1_name: TStringField;
    Q1_title: TStringField;
    Q1_tp_street: TStringField;
    Q1_tp_city: TStringField;
    Q1_tp_zip: TStringField;
    Q1_code_emp: TIntegerField;
    QRSysData1: TQRSysData;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel16: TQRLabel;
    QRShape27: TQRShape;
    QRLabel8: TQRLabel;
    QRShape28: TQRShape;
    QRLabel17: TQRLabel;
    QRShape29: TQRShape;
    QRLabel18: TQRLabel;
    QRShape30: TQRShape;
    QRLabel19: TQRLabel;
    QRShape31: TQRShape;
    QRLabel20: TQRLabel;
    QRShape32: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape33: TQRShape;
    QRLabel23: TQRLabel;
    QRShape34: TQRShape;
    QRLabel24: TQRLabel;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRLabel26: TQRLabel;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRLabel28: TQRLabel;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRLabel30: TQRLabel;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRLabel32: TQRLabel;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRLabel34: TQRLabel;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    QRMemo5: TQRMemo;
    QRMemo6: TQRMemo;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    Q1_born_date: TDateField;
    QRA1: TQRLabel;
    QRA2: TQRLabel;
    QRA31: TQRLabel;
    QRA32: TQRLabel;
    QRA33: TQRLabel;
    QRA34: TQRLabel;
    QRA35: TQRLabel;
    QRA36: TQRLabel;
    QRA4: TQRLabel;
    QRA6: TQRLabel;
    QRA7: TQRLabel;
    QRA81: TQRLabel;
    QRA82: TQRLabel;
    QRB1: TQRLabel;
    QRB2: TQRLabel;
    QRB31: TQRLabel;
    QRB32: TQRLabel;
    QRB33: TQRLabel;
    QRB34: TQRLabel;
    QRB35: TQRLabel;
    QRB36: TQRLabel;
    QRB4: TQRLabel;
    QRB6: TQRLabel;
    QRB7: TQRLabel;
    QRB81: TQRLabel;
    QRB37: TQRLabel;
    QRB82: TQRLabel;
    QRMemo7: TQRMemo;
    QRMemo8: TQRMemo;
    QRLabel4: TQRLabel;
    QRA37: TQRLabel;
    QRA5: TQRLabel;
    QRLabel5: TQRLabel;
    QRB5: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    Q0_: TQuery;
    Q0_code_emp: TIntegerField;
    Q0_n_brutto: TCurrencyField;
    Q0_d_ciastzd: TCurrencyField;
    Q0_d_preddavky: TCurrencyField;
    Q0_zuct_zac: TSmallintField;
    Q0_zuct_kon: TSmallintField;
    Q0_d_bonus_cerpany: TCurrencyField;
    Q0_poc_deti: TSmallintField;
    DS0: TDataSource;
    Q0_CALC_ZUCTOVANE: TStringField;
    Q0_CALC_DIC: TStringField;
    QRShape7: TQRShape;
    QRLabel_rok: TQRLabel;
    Q1_stat_tp: TStringField;
    Q1_L_STAT_TP: TStringField;
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
    QMES_code_emp: TIntegerField;
    QMES_v_mesiac: TSmallintField;
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
    QSUM_pocet_deti: TIntegerField;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    procedure ReportVD2007BNeedData(Sender: TObject;
      var MoreData: Boolean);
    procedure ReportVD2007BBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure Q0_CalcFields(DataSet: TDataSet);
  private
    first_preview : boolean;
  public
    rep_pocet: longint;
    procedure ShowReport;
    function podmienka:boolean;
  end;

var
  ReportVD2007B: TReportVD2007B;

procedure RunReportVD2007B(const MyReportParam: TMyReportParam);
procedure RunReportVD2007B_PDF(const MyReportParam: TMyReportParam);

implementation

uses Dm_main, REXVD2, DM_sql, M_Pomoc;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportVD2007B.ShowReport;
var rok: integer;
begin
  first_preview := true;
  rok:=MyRok(X.AktObdobie);
  QRLabel_rok.Caption := 'za rok '+IntToStr(rok);
  Q0_.ParamByName('p1').Value:=rok*100+1;
  Q0_.ParamByName('p2').Value:=rok*100+12;
  Q0_.Open;
  Q1_.Open;
  Preview;
  Q1_.Close;
  Q0_.Close;
end;

procedure RunReportVD2007B(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportVD2007B:=TReportVD2007B.Create(Application);
    if X.DisableShape then QRDisableShape(ReportVD2007B);
    if X.DisableLabel then QRDisableLabel(ReportVD2007B);
    Screen.Cursor:=crDefault;
    ReportVD2007B.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportVD2007B.Q0_.Close;
    ReportVD2007B.Free;
  end;
end;

function TReportVD2007B.podmienka:boolean;
begin
Result :=
 (Q0_D_ciastzd.Value=0) and
 (Q0_D_bonus_cerpany.Value=0) and
 (not Q0_.EOF)
end;

procedure TReportVD2007B.ReportVD2007BNeedData(Sender: TObject;
  var MoreData: Boolean);
var ulica,cislo:string;
begin
{--nulovanie}
  QRA1.Caption  := '';
  QRA2.Caption  := '';
  QRA31.Caption := '';
  QRA32.Caption := '';
  QRA33.Caption := '';
  QRA34.Caption := '';
  QRA35.Caption := '';
  QRA36.Caption := '';
  QRA37.Caption := '';
  QRA4.Caption  := '';
  QRA5.Caption  := '';
  QRA6.Caption  := '';
  QRA7.Caption  := '';
  QRA81.Caption := '';
  QRA82.Caption := '';

  QRB1.Caption  := '';
  QRB2.Caption  := '';
  QRB31.Caption := '';
  QRB32.Caption := '';
  QRB33.Caption := '';
  QRB34.Caption := '';
  QRB35.Caption := '';
  QRB36.Caption := '';
  QRB37.Caption := '';
  QRB4.Caption  := '';
  QRB5.Caption  := '';
  QRB6.Caption  := '';
  QRB7.Caption  := '';
  QRB81.Caption := '';
  QRB82.Caption := '';
{--zistenie, ci treba tlacit }
  rep_pocet := rep_pocet + 2;
  MoreData := (not Q0_.EOF){ and (rep_pocet<=4)};
  if not MoreData then begin
    rep_pocet:=0;
    exit;
  end;
{--prvy zaznam}
if not Q0_.EOF then
begin
  MyRozdelUlicu(Q1_TP_street.Value,ulica,cislo);
  QRA1.Caption := Q1_Born_numb.Value;
  QRA2.Caption := Q1_Born_date.AsString;
  QRA31.Caption := Uppercase(Q1_Surname.Value);
  QRA32.Caption := Uppercase(Q1_Name.Value);
  QRA33.Caption := Uppercase(ulica);
  QRA34.Caption := Uppercase(cislo);
  QRA35.Caption := Uppercase(Q1_TP_city.Value);
  QRA36.Caption := Uppercase(Q1_L_STAT_TP.Value);
  QRA37.Caption := Uppercase(Q1_TP_zip.Value);
  QRA4.Caption := Q0_N_brutto.AsString;
  QRA5.Caption := Q0_CALC_Zuctovane.AsString;
  QRA6.Caption := Q0_D_ciastzd.AsString;
  QRA7.Caption := Q0_D_preddavky.AsString;
  QRA81.Caption := Q0_D_bonus_cerpany.AsString;
  QRA82.Caption := Q0_Poc_deti.AsString;
  Q0_.Next;
{  while podmienka do Q0_.Next;}
end;
{--druhy zaznam}
if not Q0_.EOF then
begin
  MyRozdelUlicu(Q1_TP_street.Value,ulica,cislo);
  QRB1.Caption := Q1_Born_numb.Value;
  QRB2.Caption := Q1_Born_date.AsString;
  QRB31.Caption := Uppercase(Q1_Surname.Value);
  QRB32.Caption := Uppercase(Q1_Name.Value);
  QRB33.Caption := Uppercase(ulica);
  QRB34.Caption := Uppercase(cislo);
  QRB35.Caption := Uppercase(Q1_TP_city.Value);
  QRB36.Caption := Uppercase(Q1_L_STAT_TP.Value);
  QRB37.Caption := Uppercase(Q1_TP_zip.Value);
  QRB4.Caption := Q0_N_brutto.AsString;
  QRB5.Caption := Q0_CALC_Zuctovane.AsString;
  QRB6.Caption := Q0_D_ciastzd.AsString;
  QRB7.Caption := Q0_D_preddavky.AsString;
  QRB81.Caption := Q0_D_bonus_cerpany.AsString;
  QRB82.Caption := Q0_Poc_deti.AsString;
  Q0_.Next;
{  while podmienka do Q0_.Next;}
end;
end;

procedure TReportVD2007B.ReportVD2007BBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,8);
  Q0_.First;
  while podmienka do Q0_.Next;
  rep_pocet:=0;
  PrintReport := not Q0_.EOF;
end;

procedure TReportVD2007B.Q0_CalcFields(DataSet: TDataSet);
var zac, kon, i: byte;
begin
    if Q0_Zuct_zac.value=null then
       Q0_CALC_ZUCTOVANE.Value:=''
    else begin
         zac:=Q0_Zuct_zac.value;
         kon:=Q0_Zuct_kon.value;
         if (zac=1) and (kon=12) then
         begin
           Q0_CALC_ZUCTOVANE.Value:='--X--';
         end else
         begin
           Q0_CALC_ZUCTOVANE.Value:='----';
           for i:=1 to 12 do begin
             if (i>=zac) and (i<=kon) then
               Q0_CALC_ZUCTOVANE.Value:=Q0_CALC_ZUCTOVANE.Value+'-X-'
             else
               Q0_CALC_ZUCTOVANE.Value:=Q0_CALC_ZUCTOVANE.Value+'---'
           end;
         end;
    end;

  Q0_CALC_DIC.Value := DM.TINF_DIC.Value;

end;

procedure Stlpec(var str,stlp,poc_str:integer);
var i,j,_str:integer;
  A1,A2,A3,pom,uv:string;
begin with ReportVD2007B,DM do begin
  _str:=((str-1) div 4)+1;
  if stlp=1 then begin
    X.rtf_sablona := MyFrmPath + 'rh2004_3.pdf';
    X.rtf_subor :=  MyRepPath1 + 'RH3_'+IntToStr(MyRok(X.AktObdobie))+'_'+LPAD(IntToStr(str),3,'0')+'.xfdf';
    X.rtf_prepisat:= True;
    Rtf_Open(X);
    MyXML := '';
    E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
    E_TEXT('<xfdf xmlns="http://ns.adobe.com/xfdf/" xml:space="preserve">');
    E_TEXT('<fields>');
    E_XFDF('DIC',TINF_DIC.Value);
    E_XFDF(IntToStr(1)+'.Strana',IntToStr(str));
    E_XFDF('pocet',IntToStr(QVYSL_.RecordCount));
    E_XFDF('PocetStran',IntToStr(poc_str));
  end;
  uv:=IntToStr(1)+'.'+IntToStr(stlp)+'.';
  E_XFDF(uv+'RC-a',Copy(RC_BEZ(QVYSL_born_numb.Value),1,6));
  E_XFDF(uv+'RC-b',Copy(RC_BEZ(QVYSL_born_numb.Value),7,4));
  if QVYSL_born_numb.AsString='' then begin
    E_XFDF(uv+'DN-den',FormatDateTime('dd',QVYSL_born_date.Value));
    E_XFDF(uv+'DN-mes',FormatDateTime('mm',QVYSL_born_date.Value));
    E_XFDF(uv+'DN-rok',FormatDateTime('yyyy',QVYSL_born_date.Value));
  end;
  E_XFDF(uv+'Priezvisko',QVYSL_Surname.Value);
  E_XFDF(uv+'Meno',QVYSL_Name.Value);
  MyRozdelUlicuExt(QVYSL_Tp_street.Value,A1,A2,A3);
  E_XFDF(uv+'Ulica',A1);
  E_XFDF(uv+'Cislo',A2);
  E_XFDF(uv+'Obec',QVYSL_Tp_city.Value);
  E_XFDF(uv+'PSC',QVYSL_Tp_zip.Value);
  E_XFDF(uv+'Stat',NVL1(QVYSL_L_tp_stat.Value,'Slovensko'));
  E_XFDF(uv+'UhrnPrijmov',Format('%0.0f',[QVYSL_PRIJMY.Value]));  {uhrn prijmov}
  j:=0;for i:=2 to 13 do if Copy(QVYSL_Mesiace.Value,i,1)='1' then j:=j+1;
  if j=12 then E_XFDF(uv+'M-1-12','1')
  else for i:=2 to 13 do
    if Copy(QVYSL_Mesiace.Value,i,1)='1'
      then E_XFDF(uv+'M-'+LPAD(IntToStr(i-1),2,'0'),'X')
      else E_XFDF(uv+'M-'+LPAD(IntToStr(i-1),2,'0'),' ');
  E_XFDF(uv+'ZakladDane',Format('%0.0f',[QVYSL_ZAKLAD_DANE.Value]));  {zaklad dane}
  E_XFDF(uv+'ZrazenePreddavky',Format('%0.0f',[QVYSL_PREDDAVKY.Value]));  {preddavky bez bonusu}
  E_XFDF(uv+'Nedoplatok',Format('%0.0f',[QVYSL_VYPLATENY_BONUS.Value]));
  E_XFDF(uv+'Preddavky-N','');
  if QVYSL_Prijmy_nepenazne.Value > 0
   then E_XFDF(uv+'Preddavky-NP','X')
   else E_XFDF(uv+'Preddavky-NP','');
  E_XFDF(uv+'PocetDeti',IntToStr(QVYSL_Pocet_deti.Value));      {pocet deti}
  stlp:=stlp+1;
  if stlp>4 then begin
    stlp:=1;
    E_TAGK('fields');
    E_ATTRZ('href',X.rtf_sablona);
    E_TAGA('f',MyAttr);
    E_TAGK('xfdf');
    Rtf_Uloz_XML(X);
    MyXml:='';
  end;
end;end;

procedure RunReportVD2007B_PDF(const MyReportParam: TMyReportParam);
var pom:string[13];i,sum,celkovo,aktualna,ss,poc_str:integer;
  pc,px:longint;
begin with ReportVD2007B,DM do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportVD2007B:=TReportVD2007B.Create(Application);
    {strana3}
    DMSQL.ExecuteSql('delete from ":pam98_priv:hld"');
    THLD_.Open;
    QSUM_.Params[1].Value:=MyRok(X.AktObdobie);
    QSUM_.Open;
    QMES_.Params[1].Value:=MyRok(X.AktObdobie);
    QMES_.Open;
    while not QSUM_.EOF do begin
      THLD_.Insert;
      THLD_Code_emp.Value := QSUM_Code_emp.Value;
      THLD_Prijmy.Value := QSUM_N_brutto.Value;
      THLD_Zaklad_dane.Value := QSUM_D_ciastzd.Value;
      THLD_Preddavky.Value := QSUM_D_preddavok.Value {+ QSUM_D_bonus_cerpany.Value};
      THLD_Prijmy_nepenazne.Value := QSUM_Nepenazny_prijem.Value;
      THLD_Vyplateny_bonus.Value := QSUM_D_bonus_cerpany.Value;
      THLD_Pocet_deti.AsString := QSUM_Pocet_deti.AsString;
      QMES_.Filter:='Code_emp='+QSUM_Code_emp.AsString;
      QMES_.Filtered:=True;
      QMES_.First;
      {1.znak vyjadruje, ze vyplata bola zuctovana v mesiacoch 1-12
       2.znak az 13.znak vyjadruje, ze vyplata bola zuctovan v (i-1).mesiaci}
      pom:='0000000000000';sum:=0;
      while not QMES_.EOF do begin
        pom[QMES_V_mesiac.Value+1]:='1';
        QMES_.Next;
      end;
      sum:=0;for i:=2 to 13 do sum:=sum+StrToInt(pom[i]);
      if sum=12 then pom[1]:='1';
      THLD_Mesiace.Value := pom;
      THLD_.Post;
      QSUM_.Next;
    end;
    QVYSL_.Open;
    ss:=1;
    poc_str:=((QVYSL_.RecordCOunt -1) div 4) + 1;
    pc:=0;
    px:=QVYSL_.RecordCOunt;
    Progress(0);
    while not QVYSL_.EOF do
    begin
      Progress(pc * 100 div px);
      aktualna := ((QVYSL_.RecNo -1) div 4) + 1;
      Stlpec(aktualna,ss,poc_str);
      inc(pc);
      QVYSL_.Next;
    end;
    {/strana3}
    if MyXml<>'' then begin
      E_TAGK('fields');
      E_ATTRZ('href',X.rtf_sablona);
      E_TAGA('f',MyAttr);
      E_TAGK('xfdf');
      Rtf_Uloz_XML(X);
    end;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    QVYSL_.Close;
    QSUM_.Close;
    QMES_.Close;
    ReportVD2007B.Free;
    Progress(100);
  end;
  MyMessage(Format(SMyAppVD_PDF_Hotovo,[poc_str,'RH3_*.XFDF',MyRepPath1]));
  FormMenuPomoc.VyberTlacovehoSuboruClick(nil);
end;end;



end.
