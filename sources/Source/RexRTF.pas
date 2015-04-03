unit RexRTF;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportRTF = class(TQuickRep)
    DetailBand1: TQRBand;
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
    Q0_v_rok: TSmallintField;
    Q0_code_emp: TIntegerField;
    Q0_tel1: TStringField;
    Q0_KZP: TSmallintField;
    Q0_Typ_zuctovania: TSmallintField;
    Q0_Datum_ziadosti: TDateField;
    Q0_Datum_vykonania: TDateField;
    Q0_Datum_doklad: TDateField;
    Q0_Pocet_zamtelov: TSmallintField;
    Q0_Zamnec_od: TDateField;
    Q0_Zamnec_do: TDateField;
    Q0_Uhrn_prijmov: TCurrencyField;
    Q0_Uhrn_preddav_zamnec: TCurrencyField;
    Q0_Uhrn_preddav_zamtel: TCurrencyField;
    Q0_Uhrn_minim_zakladov: TCurrencyField;
    Q0_Preddavky_dan_uzn: TCurrencyField;
    Q0_stat_tp: TStringField;
    Q0_L_TP_STAT: TStringField;
    Q1_: TQuery;
    Q1_Code_emp: TIntegerField;
    Q1_V_rok: TSmallintField;
    Q1_V_mesiac: TSmallintField;
    Q1_Typ: TSmallintField;
    Q1_X1: TCurrencyField;
    Q1_X2: TCurrencyField;
    Q1_X3: TCurrencyField;
    Q1_X4: TCurrencyField;
    Q1_X5: TCurrencyField;
    Q1_X6: TCurrencyField;
    Q2_: TQuery;
    Q2_Code_emp: TIntegerField;
    Q2_Datum_od: TDateField;
    Q2_Datum_do: TDateField;
    Q2_Dovod: TStringField;
    Q3_: TQuery;
    ADR: TStringField;
    TMP: TStringField;
    Q3_Typ: TStringField;
    Q3_Rok: TSmallintField;
    Q3_X1: TCurrencyField;
    Q3_X2: TCurrencyField;
    Q3_X3: TCurrencyField;
    Q3_X4: TCurrencyField;
    Q3_X5: TCurrencyField;
    Q3_X6: TCurrencyField;
    Q3_X7: TCurrencyField;
    Q3_X8: TCurrencyField;
    Q3_X9: TCurrencyField;
    Q3_X10: TCurrencyField;
    Q3_X11: TCurrencyField;
    Q3_X12: TCurrencyField;
    Q3_X13: TCurrencyField;
    Q3_X14: TCurrencyField;
    Q3_X15: TCurrencyField;
    Q3_X16: TCurrencyField;
    Q3_X17: TCurrencyField;
    Q3_X18: TCurrencyField;
    Q3_X19: TCurrencyField;
    Q3_X20: TCurrencyField;
    Q3_X21: TCurrencyField;
    Q3_X22: TCurrencyField;
    Q3_X23: TCurrencyField;
    Q3_X24: TCurrencyField;
    Q3_X25: TCurrencyField;
    Q3_X26: TCurrencyField;
    Q3_X28: TCurrencyField;
    Q3_X29: TCurrencyField;
    Q3_X30: TCurrencyField;
    Q3_X31: TCurrencyField;
    Q3_X32: TCurrencyField;
    Q3_X33: TCurrencyField;
    Q3_X34: TCurrencyField;
    Q3_X35: TCurrencyField;
    Q3_X36: TCurrencyField;
    Q3_X37: TCurrencyField;
    Q3_X38: TCurrencyField;
    Q3_X39: TCurrencyField;
    Q3_X40: TCurrencyField;
    Q3_X41: TCurrencyField;
    Q3_X42: TCurrencyField;
    Q3_X43: TCurrencyField;
    Q3_X44: TCurrencyField;
    Q3_X45: TCurrencyField;
    Q3_X46: TCurrencyField;
    Q3_X47: TCurrencyField;
    Q3_X48: TCurrencyField;
    Q3_X49: TCurrencyField;
    Q3_X50: TCurrencyField;
    Q3_X51: TCurrencyField;
    Q3_X52: TCurrencyField;
    Q3_X53: TCurrencyField;
    Q3_X54: TCurrencyField;
    Q3_X55: TCurrencyField;
    Q3_X56: TCurrencyField;
    Q3_X57: TCurrencyField;
    Q3_X58: TCurrencyField;
    Q3_X59: TCurrencyField;
    Q3_X60: TCurrencyField;
    Q3_X61: TCurrencyField;
    Q3_X62: TCurrencyField;
    Q3_X63: TCurrencyField;
    Q3_X64: TCurrencyField;
    Q3_X65: TCurrencyField;
    Q3_X66: TCurrencyField;
    Q3_X67: TCurrencyField;
    Q3_X68: TCurrencyField;
    Q3_X69: TCurrencyField;
    Q3_X70: TCurrencyField;
    Q3_D1: TDateField;
    Q3_D2: TDateField;
    Q3_D3: TDateField;
    Q3_D4: TDateField;
    Q3_D5: TDateField;
    Q3_D6: TDateField;
    Q3_D7: TDateField;
    Q3_D8: TDateField;
    Q3_D9: TDateField;
    Q3_D10: TDateField;
    Q3_A1: TStringField;
    Q3_A2: TStringField;
    Q3_A3: TStringField;
    Q3_A4: TStringField;
    Q3_A5: TStringField;
    Q3_A6: TStringField;
    Q3_A7: TStringField;
    Q3_A8: TStringField;
    Q3_A9: TStringField;
    Q3_A10: TStringField;
    Q3_name: TStringField;
    Q3_surname: TStringField;
    Q3_title: TStringField;
    Q3_born_numb: TStringField;
    Q3_tp_zip: TStringField;
    Q3_tp_street: TStringField;
    Q3_stat_tp: TStringField;
    Q3_tel1: TStringField;
    Q3_tp_city: TStringField;
    Q3_V_rok: TSmallintField;
    Q3_PO_NAZOV: TStringField;
    Q3_PO_ZPCPP: TStringField;
    Q3_FO_RC: TStringField;
    Q3_FO_CPP: TStringField;
    Q3_ICO: TStringField;
    Q3_DIC: TStringField;
    Q3_ADR_ULICA: TStringField;
    Q3_ADR_PSC: TStringField;
    Q3_ADR_OBEC: TStringField;
    Q3_ADR_TEL: TStringField;
    Q3_ADR_FAX: TStringField;
    Q3_kzp: TSmallintField;
    Q3_L_TP_STAT: TStringField;
    Q3_code_emp: TIntegerField;
    Q4_: TQuery;
    Q4_Name: TStringField;
    Q4_Surname: TStringField;
    Q4_Title: TStringField;
    Q4_Tp_street: TStringField;
    Q4_Tp_city: TStringField;
    Q4_Tp_zip: TStringField;
    Q4_Born_numb: TStringField;
    Q4_CALC_ADRESA: TStringField;
    Q5A_: TQuery;
    Q5B_: TQuery;
    Q5A_code_emp: TIntegerField;
    Q5A_surname: TStringField;
    Q5A_name: TStringField;
    Q5A_nastup: TDateField;
    Q5A_vystup: TDateField;
    Q5A_CALC_ROKOV: TIntegerField;
    Q5A_CALC_DNI: TIntegerField;
    Q5A_Born_date: TDateField;
    Q5A_Tp_street: TStringField;
    Q5A_Tp_city: TStringField;
    Q5A_Tp_zip: TStringField;
    Q5A_CALC_ADRESA: TStringField;
    Q5A_CALC_TMP: TStringField;
    Q5A_Title: TStringField;
    Q5B_Datum_od: TDateField;
    Q5B_NID: TIntegerField;
    Q5B_Code_emp: TIntegerField;
    Q5B_Datum_do: TDateField;
    Q5B_V_obdobie: TIntegerField;
    Q5B_Prac_dni: TSmallintField;
    Q5B_Dovod: TStringField;
    Q5B_Typ: TSmallintField;
    Q5B_TypRL: TStringField;
    Q5B_TypRL2: TSmallintField;
    Q5B_Prerusenie: TSmallintField;
    Q6a_: TQuery;
    TDHD_: TTable;
    Q6b_: TQuery;
    QDHD_: TQuery;
    TDHD_Code_emp: TIntegerField;
    TDHD_V_obdobie: TIntegerField;
    QDHD_code_emp: TIntegerField;
    QDHD_name: TStringField;
    QDHD_surname: TStringField;
    QDHD_title: TStringField;
    QDHD_min_obdobie: TIntegerField;
    QDHD_max_obdobie: TIntegerField;
    Q6a_code_emp: TIntegerField;
    Q6a_v_obdobie: TIntegerField;
    Q6b_code_emp: TIntegerField;
    Q6b_v_obdobie: TIntegerField;
    QDHD_PMT: TStringField;
    QDHD_code_numb: TIntegerField;
    QDHD_born_numb: TStringField;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure ReportRTFBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure Q4_CalcFields(DataSet: TDataSet);
    procedure Q5A_CalcFields(DataSet: TDataSet);
    procedure QDHD_CalcFields(DataSet: TDataSet);
  private
    first_preview: boolean;
  public
    procedure ShowReportStart_ZDR_DOKLAD;
    procedure ShowReportStart_ZDR_OZNAM;
    procedure ShowReportStart_SP_PRIHLAS;
    procedure ShowReportStart_SP_ZAPOCET;
    procedure ShowReportStart_GfK_Dohodari;
    procedure ShowReportEnd;

  end;

var
  ReportRTF: TReportRTF;

procedure RunReport_ZDR_DOKLAD(const MyReportParam: TMyReportParam);
procedure RunReport_ZDR_OZNAM(const MyReportParam: TMyReportParam);
procedure RunReport_SP_PRIHLAS(const MyReportParam: TMyReportParam);
procedure RunReport_SP_ZAPOCET(const MyReportParam: TMyReportParam);
procedure RunReport_GfK_Dohodari(const MyReportParam: TMyReportParam);

implementation

uses Main, FmxUtils, Dm_main, Dm_zam;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportRTF.ShowReportStart_ZDR_DOKLAD;
{pouziva Q0_, Q1_ a Q2_ }
begin
  first_preview:=True;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.Code_Emp1;
  Q0_.ParamByName('P2').AsInteger := X.Code_Emp2;
  Q0_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q0_.ParamByName('ROK').AsInteger := MyRok(X.AktObdobie);
  Q0_.Open;
  Q1_.Close;
  Q1_.ParamByName('Code_emp').AsInteger := X.Code_Emp1;
  Q1_.ParamByName('ROK').AsInteger := MyRok(X.AktObdobie)-1;
  Q1_.Open;
  Q2_.Close;
  Q2_.ParamByName('Code_emp').AsInteger := X.Code_Emp1;
  Q2_.ParamByName('DATUM1').Value := EncodeDate(MyRok(X.AktObdobie)-1,1,1);
  Q2_.ParamByName('DATUM2').Value := EncodeDate(MyRok(X.AktObdobie)-1,12,31);
  Q2_.Open;
end;

procedure TReportRTF.ShowReportStart_ZDR_OZNAM;
{pouziva Q1_ a Q3_ }
begin
  first_preview:=True;
  Q1_.Close;
  Q1_.ParamByName('Code_emp').AsInteger := X.Code_Emp1;
  Q1_.ParamByName('ROK').AsInteger := MyRok(X.AktObdobie)-1;
  Q1_.Open;
  Q3_.Close;
  Q3_.ParamByName('P1').AsInteger := X.Code_Emp1;
  Q3_.ParamByName('P2').AsInteger := X.Code_Emp2;
  Q3_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q3_.ParamByName('P4').AsInteger := X.AktMaxSid;
  Q3_.ParamByName('ROK').AsInteger := MyRok(X.AktObdobie);
  Q3_.Open;
end;

procedure TReportRTF.ShowReportStart_SP_PRIHLAS;
{pouziva Q4_ }
begin
  first_preview:=True;
  Q4_.Close;
  Q4_.ParamByName('datum').Value := X.Vykaz_dna_DT;
  Q4_.Open;
end;

procedure TReportRTF.ShowReportStart_SP_ZAPOCET;
{pouziva Q5A_ }
begin
  first_preview:=True;
  Q5A_.Close;
  Q5A_.ParamByName('p1').Value := X.Code_emp1;
  Q5A_.Open;
  if Q5A_Vystup.AsString='' then
    raise EMyError.Create(SMyZamZapocetChybaVystup);
  if Q5A_Vystup.Value < Q5A_Nastup.Value then
    raise EMyError.Create(SMyZamZapocetChybnyVystup);
  Q5B_.Close;
  Q5B_.ParamByName('p1').Value := X.Code_emp1;
  Q5B_.Open;
end;

{aar.moravcik@gmail.com}

procedure TReportRTF.ShowReportStart_GfK_Dohodari;
{pouziva Q6A_ a Q6B_}
var i:longint;
begin
  first_preview:=True;
  TDHD_.EmptyTable;
  try
  TDHD_.Open;
  {--}
  Progress(0);
  i:=0;
  Q6A_.Open;
  while not Q6A_.EOF do begin
    inc(i);Progress(trunc(i/(Q6A_.FieldCount-1)*100));
    TDHD_.Insert;
    TDHD_Code_emp.Value := Q6A_Code_emp.Value;
    TDHD_V_obdobie.Value := Q6A_V_obdobie.Value;
    TDHD_.Post;
    Q6A_.Next;
  end;
  Q6A_.Close;
  {--}
  if MyDataSkk<>'' then begin
    Progress(0);
    i:=0;
    Q6B_.Open;
    while not Q6B_.EOF do begin
      inc(i);Progress(trunc(i/(Q6B_.FieldCount-1)*100));
      TDHD_.Insert;
      TDHD_Code_emp.Value := Q6B_Code_emp.Value;
      TDHD_V_obdobie.Value := Q6B_V_obdobie.Value;
      TDHD_.Post;
      Q6B_.Next;
    end;
    Q6B_.Close;
  end;
  Progress(100);
  QDHD_.ParamByName('P1').AsInteger := X.AktMinSid;
  QDHD_.ParamByName('P2').AsInteger := X.AktMaxSid;
  QDHD_.Open;
  finally;
end;end;

procedure TReportRTF.ShowReportEnd;
begin
  TDHD_.Close;
  QDHD_.Close;
  Q5A_.Close;
  Q5B_.Close;
  Q4_.Close;
  Q3_.Close;
  Q2_.Close;
  Q1_.Close;
  Q0_.Close;
end;

procedure TReportRTF.Q0_CalcFields(DataSet: TDataSet);
var bonus,dan,bb:double;
begin
  Q0_TMP.Value:= Copy(
    Trim(Q0_Title.Value)+' '+
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value),1,100);

  Q0_ADR.Value:=
    Q0_tp_street.Value+', '+Q0_tp_city.Value;
  {--}
 end;

procedure TReportRTF.ReportRTFBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,8);
end;

procedure RunReport_ZDR_DOKLAD(const MyReportParam: TMyReportParam);
var U1,U2: string; SUMA_UH,SUMA_MZ,SUMA_ZNEC,SUMA_ZTEL:double;i,j:integer;ZTP:array[1..13] of char;c:char;
begin with ReportRTF,DM do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportRTF:=TReportRTF.Create(Application);
    if X.DisableShape then QRDisableShape(ReportRTF);
    if X.DisableLabel then QRDisableLabel(ReportRTF);
    Screen.Cursor:=crDefault;
    ReportRTF.ShowReportStart_ZDR_DOKLAD;
    if ReportRTF.Q1_.Active AND (ReportRTF.Q1_.RecordCount=0) then
    begin
      MyError(Format(SMyZdrVypPodkladovChyba,[Q1_.ParamByName('ROK').AsString]));
      exit;
    end;
    if ReportRTF.Q0_.Active AND (ReportRTF.Q0_.RecordCount=0) then
    begin
      MyError(SMyZdrDokladNeexistuje);
      exit;
    end;
    X.rtf_sablona := MyFrmPath + 'Doklad_preddavkov_zp.rtf';
    X.rtf_subor :=
      MyRepPath1 + 'zdr1_' + RC_BEZ(Q0_Born_numb.Value)+'_'
                 + Q0_Surname.Value +'_' + Q0_Name.Value + '.rtf';
    Rtf_Open(X);
    if X.Rtf_prepisat then
    begin
      Rtf_InitKeyWord;
      Rtf_SetKeyWord('$ROK',IntToStr(MyRok(X.AktObdobie)-1),0,' ');
      Rtf_SetKeyWord('$KZP',Q0_KZP.AsString,0,' ');
      Rtf_SetKeyWord('$Z_RODCIS',Q0_Born_numb.Value,0,' ');
      Rtf_SetKeyWord('$Z_MENO',Q0_Name.Value,0,' ');
      Rtf_SetKeyWord('$Z_PRIEZVISKO',Q0_Surname.Value,0,' ');
      Rtf_SetKeyWord('$Z_TITUL',Q0_Title.Value,0,' ');
      {--}
      MyRozdelUlicu(Q0_Tp_street.Value,U1,U2);
      Rtf_SetKeyWord('$Z_ADR_ULICA',U1,0,' ');
      Rtf_SetKeyWord('$Z_ADR_CISLO',U2,0,' ');
      Rtf_SetKeyWord('$Z_ADR_PSC',Q0_Tp_zip.Value,0,' ');
      Rtf_SetKeyWord('$Z_ADR_OBEC',Q0_Tp_city.Value,0,' ');
      Rtf_SetKeyWord('$Z_ADR_STAT',Q0_L_tp_stat.Value,0,' ');
      {--}
      Rtf_SetKeyWord('$F_NAZOV',TINF_Nazov.Value,0,' ');
      Rtf_SetKeyWord('$F_CPP',TINF_FO_CPP.Value,0,' ');
      Rtf_SetKeyWord('$F_RODCIS',TINF_FO_RC.Value,0,' ');
      Rtf_SetKeyWord('$F_ADR_ULICA',TINF_Adr_ulica.Value,0,' ');
      Rtf_SetKeyWord('$F_ADR_CISLO',TINF_Adr_cislo.Value,0,' ');
      Rtf_SetKeyWord('$F_ADR_PSC',TINF_Adr_psc.Value,0,' ');
      Rtf_SetKeyWord('$F_ADR_OBEC',TINF_Adr_mesto.Value,0,' ');
      Rtf_SetKeyWord('$F_ADR_STAT',TINF_L_Adr_stat.Value,0,' ');
      Rtf_SetKeyWord('$ICO',TINF_ICO.Value,0,' ');
      Rtf_SetKeyWord('$DIC',TINF_DIC.Value,0,' ');
      Rtf_SetKeyWord('$F_TEL',TINF_ADR_TELEFON.Value,0,' ');
      Rtf_SetKeyWord('$F_FAX',TINF_ADR_FAX.Value,0,' ');
      Rtf_SetKeyWord('$F_EMAIL',TINF_ADR_EMAIL.Value,0,' ');
      {--}
      Rtf_SetKeyWord('$POIST_OD',Q0_ZAMNEC_OD.AsString,0,' ');
      Rtf_SetKeyWord('$POIST_DO',Q0_ZAMNEC_DO.AsString,0,' ');
      Rtf_SetKeyWord('$VYPRACOVAL',X.Vykaz_zostavil,0,' ');
      Rtf_SetKeyWord('$V_TEL',X.Telefon,43,' ');
      Rtf_SetKeyWord('$V_FAX',X.Fax,0,' ');
      Rtf_SetKeyWord('$DATUM',X.Vykaz_dna,0,' ');
      Rtf_SetKeyWord('$POC_PRILOH','',0,' ');
      for i:=1 to 13 do ZTP[i]:=' ';
      Q1_.First;
      While NOT Q1_.EOF do begin
        if Q1_X2.Value=2 then ZTP[Q1_V_mesiac.Value]:='X';
        Q1_.Next;
      end;
      ZTP[13]:=ZTP[1]; for i:=2 to 12 do
      begin
        if ZTP[i]<>ZTP[13] then ZTP[13]:='R';
      end;
      if ZTP[13]='X' then begin
        Rtf_SetKeyWord('$A1',' ',1,' ');
        Rtf_SetKeyWord('$A2','X',1,' ');
        for c:='A' to 'L' do Rtf_SetKeyWord('!'+c,' ',0,' ');
      end else begin
        Rtf_SetKeyWord('$A1','X',1,' ');
        Rtf_SetKeyWord('$A2',' ',1,' ');
        for c:='A' to 'L' do Rtf_SetKeyWord('!'+c,ZTP[ord(c)-ord('A')+1],0,' ');
      end;
      SUMA_UH:=0;SUMA_MZ:=0;SUMA_ZNEC:=0;SUMA_ZTEL:=0;
      Q1_.First;
      While NOT Q1_.EOF do begin
        SUMA_UH:=SUMA_UH+Q1_X1.Value;
        SUMA_MZ:=SUMA_MZ+Q1_X3.Value;
        SUMA_ZNEC:=SUMA_ZNEC+Q1_X4.Value;
        SUMA_ZTEL:=SUMA_ZTEL+Q1_X5.Value;
        Q1_.Next;
      end;
{      if SUMA_UH>78000 then begin
        for i:=1 to 13 do begin
          Rtf_SetKeyWord('$MZ'+LPAD(IntToStr(i),2,'0'),'_ _ _ _',0,' ');
          Rtf_SetKeyWord('$UH'+LPAD(IntToStr(i),2,'0'),'_ _ _ _ _ _ _ _ _, _ _',0,' ');
        end;
      end else }
      begin
        Q1_.First;
        While NOT Q1_.EOF do begin
          Rtf_SetKeyWord('$MZ'+LPAD(Q1_V_mesiac.AsString,2,'0'),Format('%0.2f',[Q1_X3.Value]),0,' ');
          Rtf_SetKeyWord('$UH'+LPAD(Q1_V_mesiac.AsString,2,'0'),Format('%0.2f',[Q1_X1.Value]),0,' ');
          Q1_.Next;
        end;
        Rtf_SetKeyWord('$MZ13',Format('%0.2f',[SUMA_MZ]),0,' ');
        Rtf_SetKeyWord('$UH13',Format('%0.2f',[SUMA_UH]),0,' ');
      end;
      Rtf_SetKeyWord('$UHRN_PRIJMOV',Format('%0.2f',[SUMA_UH]),0,' ');
      Rtf_SetKeyWord('$UHRN_PREDDAV_ZNEC',Format('%0.2f',[SUMA_ZNEC]),0,' ');
      Rtf_SetKeyWord('$UHRN_PREDDAV_ZTEL',Format('%0.2f',[SUMA_ZTEL]),0,' ');
      Q2_.First;i:=1;
      While NOT Q2_.EOF do begin
        Rtf_SetKeyWord('$OD'+LPAD(IntToStr(i),2,'0'),Q2_Datum_OD.AsString,0,' ');
        Rtf_SetKeyWord('$DO'+LPAD(IntToStr(i),2,'0'),Q2_Datum_DO.AsString,0,' ');
        Rtf_SetKeyWord('$DOVOD'+LPAD(IntToStr(i),2,'0'),Q2_DOVOD.AsString,0,' ');
        Q2_.Next;
        i:=i+1;
      end;
      j:=i;
      for i:=j to 13 do begin
        Rtf_SetKeyWord('$OD'+LPAD(IntToStr(i),2,'0'),'',0,' ');
        Rtf_SetKeyWord('$DO'+LPAD(IntToStr(i),2,'0'),'',0,' ');
        Rtf_SetKeyWord('$DOVOD'+LPAD(IntToStr(i),2,'0'),'',0,' ');
      end;
      Rtf_Replace(X);
    end;
    ReportRTF.ShowReportEnd;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportRTF.Free;
  end;
  Rtf_zobraz(X);
end;end;

procedure RunReport_ZDR_OZNAM(const MyReportParam: TMyReportParam);
var U1,U2: string; SUMA_UH,SUMA_MZ,SUMA_ZNEC,SUMA_ZTEL:double;i,j:integer;ZTP:array[1..13] of char;c:char;
begin with ReportRTF,DM do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportRTF:=TReportRTF.Create(Application);
    if X.DisableShape then QRDisableShape(ReportRTF);
    if X.DisableLabel then QRDisableLabel(ReportRTF);
    Screen.Cursor:=crDefault;
    ReportRTF.ShowReportStart_ZDR_OZNAM;
    if ReportRTF.Q1_.Active AND (ReportRTF.Q1_.RecordCount=0) then
    begin
      MyError(Format(SMyZdrVypPodkladovChyba,[Q1_.ParamByName('ROK').AsString]));
      exit;
    end;
    if ReportRTF.Q3_.Active AND (ReportRTF.Q3_.RecordCount=0) then
    begin
      MyError(SMyZdrOznamenieNeexistuje);
      exit;
    end;
    X.rtf_sablona := MyFrmPath + 'oznamenie_nedoplatku_zp.rtf';
    X.rtf_subor :=
      MyRepPath1 + 'zdr2_' + RC_BEZ(Q3_Born_numb.Value)+'_'
                 + Q3_Surname.Value +'_' + Q3_Name.Value + '.rtf';
    Rtf_Open(X);
    if X.Rtf_prepisat then
    begin
      Rtf_InitKeyWord;
      Rtf_SetKeyWord('$ROK',IntToStr(MyRok(X.AktObdobie)-1),0,' ');
      Rtf_SetKeyWord('$KZP',Q3_KZP.AsString,0,' ');
      Rtf_SetKeyWord('$Z_RODCIS',Q3_Born_numb.Value,0,' ');
      Rtf_SetKeyWord('$Z_MENO',Q3_Name.Value,0,' ');
      Rtf_SetKeyWord('$Z_PRIEZVISKO',Q3_Surname.Value,0,' ');
      Rtf_SetKeyWord('$Z_TITUL',Q3_Title.Value,0,' ');
      {--}
      MyRozdelUlicu(Q3_Tp_street.Value,U1,U2);
      Rtf_SetKeyWord('$Z_ADR_ULICA',U1,0,' ');
      Rtf_SetKeyWord('$Z_ADR_CISLO',U2,0,' ');
      Rtf_SetKeyWord('$Z_ADR_PSC',Q3_Tp_zip.Value,0,' ');
      Rtf_SetKeyWord('$Z_ADR_OBEC',Q3_Tp_city.Value,0,' ');
      Rtf_SetKeyWord('$Z_ADR_STAT',Q3_L_tp_stat.Value,0,' ');
      {--}
      Rtf_SetKeyWord('$F_NAZOV',TINF_Nazov.Value,0,' ');
      Rtf_SetKeyWord('$F_CPP',TINF_FO_CPP.Value,0,' ');
      Rtf_SetKeyWord('$F_RODCIS',TINF_FO_RC.Value,0,' ');
      Rtf_SetKeyWord('$F_ADR_ULICA',TINF_Adr_ulica.Value,0,' ');
      Rtf_SetKeyWord('$F_ADR_CISLO',TINF_Adr_cislo.Value,0,' ');
      Rtf_SetKeyWord('$F_ADR_PSC',TINF_Adr_psc.Value,0,' ');
      Rtf_SetKeyWord('$F_ADR_OBEC',TINF_Adr_mesto.Value,0,' ');
      Rtf_SetKeyWord('$F_ADR_STAT',TINF_L_Adr_stat.Value,0,' ');
      Rtf_SetKeyWord('$ICO',TINF_ICO.Value,0,' ');
      Rtf_SetKeyWord('$DIC',TINF_DIC.Value,0,' ');
      Rtf_SetKeyWord('$F_TEL',TINF_ADR_TELEFON.Value,0,' ');
      Rtf_SetKeyWord('$F_FAX',TINF_ADR_FAX.Value,0,' ');
      Rtf_SetKeyWord('$F_EMAIL',TINF_ADR_EMAIL.Value,0,' ');
      {--}
      Rtf_SetKeyWord('$VYPRACOVAL',X.Vykaz_zostavil,0,' ');
      Rtf_SetKeyWord('$V_TEL',X.Telefon,43,' ');
      Rtf_SetKeyWord('$V_FAX',X.Fax,0,' ');
      Rtf_SetKeyWord('$DATUM',X.Vykaz_dna,0,' ');

      SUMA_ZNEC:=0;SUMA_ZTEL:=0;
      if Q1_.RecordCount=0 then begin
        DMZ.ZDR_VYPOCET_DOKLADU;
         Q1_.Close;
         DMZ.TZP4_.Refresh;
         Q1_.Open;
      end;
      Q1_.First;
      While NOT Q1_.EOF do begin
        SUMA_ZNEC:=SUMA_ZNEC+Q1_X4.Value;
        SUMA_ZTEL:=SUMA_ZTEL+Q1_X5.Value;
        Q1_.Next;
      end;

      Rtf_SetKeyWord('$UHRN_PREDDAV_ZNEC',Format('%0.2f',[SUMA_ZNEC]),0,' ');
      Rtf_SetKeyWord('$POISTNE',Format('%0.2f',[Q3_X3.Value]),0,' ');
      Rtf_SetKeyWord('$NEDOPLATOK',Format('%0.2f',[Q3_X1.Value]),0,' ');
      Rtf_Replace(X);
    end;
    ReportRTF.ShowReportEnd;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportRTF.Free;
  end;
  Rtf_zobraz(X);
end;end;

procedure RunReport_SP_PRIHLAS(const MyReportParam: TMyReportParam);
var pc: string; i,j,k:integer;
begin with ReportRTF,DM do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportRTF:=TReportRTF.Create(Application);
    if X.DisableShape then QRDisableShape(ReportRTF);
    if X.DisableLabel then QRDisableLabel(ReportRTF);
    Screen.Cursor:=crDefault;
    ReportRTF.ShowReportStart_SP_PRIHLAS;
    X.rtf_sablona := MyFrmPath + 'prihlasenie_odhlasenie_zamestnanca.rtf';
    X.rtf_subor :=
      MyRepPath1 + 'SP_prihl_odhl_' + Q4_Surname.value + '_'+Q4_Name.Value+'.rtf';
    Rtf_Open(X);
    if X.Rtf_prepisat then
    begin
      Rtf_InitKeyWord;
      if TINF_FO_RC.Value='' then begin
        Rtf_SetKeyWord('$FO1','X',0,' ');
        Rtf_SetKeyWord('$PO1','',0,' ');
        Rtf_SetKeyWord('$FO_RC',TINF_FO_RC.Value,0,' ');
        Rtf_SetKeyWord('$FO_PRIEZ',TINF_FO_Surname.Value,0,' ');
        Rtf_SetKeyWord('$FO_MENO',TINF_FO_Name.Value,0,' ');
        Rtf_SetKeyWord('$FO_TITUL',TINF_FO_Titul_Pred.Value,0,' ');
        Rtf_SetKeyWord('$FO_ADRESA',TINF_CALC_ADRESA.Value,0,' ');
        Rtf_SetKeyWord('$PO_NAZOV','',0,' ');
        Rtf_SetKeyWord('$PO_ADRESA','',0,' ');
        Rtf_SetKeyWord('$ICZ','',0,' ');
        Rtf_SetKeyWord('$ICO_DIC','',0,' ');
      end else
      begin
        Rtf_SetKeyWord('$FO1','',0,' ');
        Rtf_SetKeyWord('$PO1','X',0,' ');
        Rtf_SetKeyWord('$FO_RC','',0,' ');
        Rtf_SetKeyWord('$FO_PRIEZ','',0,' ');
        Rtf_SetKeyWord('$FO_MENO','',0,' ');
        Rtf_SetKeyWord('$FO_TITUL','',0,' ');
        Rtf_SetKeyWord('$FO_ADRESA','',0,' ');
        Rtf_SetKeyWord('$PO_NAZOV',TINF_Nazov.Value,0,' ');
        Rtf_SetKeyWord('$PO_ADRESA',TINF_CALC_ADRESA.Value,0,' ');
        Rtf_SetKeyWord('$ICZ',TINF_ICZ.Value,0,' ');
        Rtf_SetKeyWord('$ICO_DIC',TINF_ICO.Value+' / '+TINF_DIC.Value,0,' ');
      end;
      k:=0;
      for i:=1 to 19 do begin if not Q4_.EOF then begin
      k:=i;
      pc:=LPAD(IntToStr(i),2,'0');
      Rtf_SetKeyWord('$a'+pc,IntToStr(i),0,' ');
      Rtf_SetKeyWord('$b'+pc,'X',0,' ');
      Rtf_SetKeyWord('$c'+pc,' ',0,' ');
      Rtf_SetKeyWord('$PRIEZ'+pc,Q4_Surname.Value,0,' ');
      Rtf_SetKeyWord('$MENO'+pc,Q4_Name.Value,0,' ');
      Rtf_SetKeyWord('$T'+pc,Q4_Title.Value,0,' ');
      Rtf_SetKeyWord('$RC'+pc,Q4_Born_numb.Value,0,' ');
      Rtf_SetKeyWord('$TP'+pc,Q4_Title.Value,0,' ');
      Q4_.Next;
      end;end;
      for j:=k+1 to 19 do begin
      pc:=LPAD(IntToStr(j),2,'0');
      Rtf_SetKeyWord('$a'+pc,'',0,' ');
      Rtf_SetKeyWord('$b'+pc,'',0,' ');
      Rtf_SetKeyWord('$c'+pc,'',0,' ');
      Rtf_SetKeyWord('$PRIEZ'+pc,'',0,' ');
      Rtf_SetKeyWord('$MENO'+pc,'',0,' ');
      Rtf_SetKeyWord('$T'+pc,'',0,' ');
      Rtf_SetKeyWord('$RC'+pc,'',0,' ');
      Rtf_SetKeyWord('$TP'+pc,'',0,' ');
      end;
      {--}
      Rtf_SetKeyWord('$VYPRACOVAL',X.Vykaz_zostavil,0,' ');
      Rtf_SetKeyWord('$DAT_VZNIK',X.Vykaz_dna,0,' ');
      Rtf_SetKeyWord('$DAT_ZANIK',X.Vykaz_dna,0,' ');
      Rtf_SetKeyWord('$DAT_ODOSL',X.Vykaz_dna,0,' ');
      Rtf_Replace(X);
    end;
    ReportRTF.ShowReportEnd;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportRTF.Free;
  end;
  Rtf_zobraz(X);
end;end;


procedure TReportRTF.Q4_CalcFields(DataSet: TDataSet);
begin
  Q4_CALC_ADRESA.Value :=
    Q4_tp_street.Value+', '+
    Q4_tp_zip.Value+' '+
    Q4_tp_city.Value;
end;

procedure RunReport_SP_ZAPOCET(const MyReportParam: TMyReportParam);
var pc: string; i,j,k:integer;
begin with ReportRTF,DM do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportRTF:=TReportRTF.Create(Application);
    if X.DisableShape then QRDisableShape(ReportRTF);
    if X.DisableLabel then QRDisableLabel(ReportRTF);
    Screen.Cursor:=crDefault;
    ReportRTF.ShowReportStart_SP_ZAPOCET;
    X.rtf_sablona := MyFrmPath + 'Zapoctovy_list.rtf';
    X.rtf_subor :=
      MyRepPath1 + 'Zapoctovy_list_'+Q5A_Surname.Value +'_'+Q5A_Name.Value + '.rtf';
    Rtf_Open(X);
    if X.Rtf_prepisat then
    begin
      Rtf_InitKeyWord;
      Rtf_SetKeyWord('$PP_OD',Q5A_Nastup.AsString,0,' ');
      Rtf_SetKeyWord('$PP_DO',Q5A_Vystup.AsString,0,' ');
      Rtf_SetKeyWord('$ZAP_ROKOV',Q5A_Calc_rokov.AsString,0,' ');
      Rtf_SetKeyWord('$ZAP_DNI',Q5A_Calc_dni.AsString,0,' ');
      Rtf_SetKeyWord('$MENO',Q5A_Calc_TMP.AsString,0,' ');
      Rtf_SetKeyWord('$ADRESA',Q5A_Calc_adresa.AsString,0,' ');
      Rtf_SetKeyWord('$DAT_NAR',Q5A_Born_date.AsString,0,' ');
      Rtf_SetKeyWord('$MIESTO',X.Vykaz_miesto,0,' ');
      Q5B_.First;
      for i:=1 to 6 do if not Q5B_.EOF then begin
        pc:=LPAD(IntToStr(i),1,'0');
        Rtf_SetKeyWord('$PN_OD'+pc,Q5B_Datum_od.AsString,0,' ');
        Rtf_SetKeyWord('$PN_DO'+pc,Q5B_Datum_do.AsString,0,' ');
        Rtf_SetKeyWord('$PN_DNI'+pc,IntToStr(MyDateDaysBetween(Q5B_Datum_od.Value,Q5B_Datum_do.Value)),0,' ');
        Q5B_.Next;
      end else begin
        pc:=LPAD(IntToStr(i),1,'0');
        Rtf_SetKeyWord('$PN_OD'+pc,'',0,' ');
        Rtf_SetKeyWord('$PN_DO'+pc,'',0,' ');
        Rtf_SetKeyWord('$PN_DNI'+pc,'',0,' ');
      end;
      {--}
      Rtf_SetKeyWord('$MIESTO',X.Vykaz_zostavil,0,' ');
      Rtf_SetKeyWord('$DATUM',X.Vykaz_dna,0,' ');
      Rtf_Replace(X);
    end;
    ReportRTF.ShowReportEnd;
  except on E:Exception do begin
    MyError(SMyAppReportShowFailed+E.Message);
    exit;
  end;  
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportRTF.Free;
  end;
  Rtf_zobraz(X);
end;end;

procedure TReportRTF.Q5A_CalcFields(DataSet: TDataSet);
var
  Y1,M1,D1: Word; {nastup}
  Y2,M2,D2: Word; {vystup}
  Y3,M3,D3: Word; {Y2-1,M1,D1}
  Dat1,Dat2,Dat3: TDate;
  i,mm:integer;
  rokov,dni:longint;
  posledny_rok:integer;
begin
  Q5A_CALC_TMP.Text:=
    Trim(Q5A_Title.Value)+' '+
    Trim(Q5A_Name.Value)+' '+
    Trim(Q5A_Surname.Value);

  Q5A_CALC_ADRESA.Value :=
    Q5A_tp_street.Value+', '+
    Q5A_tp_zip.Value+' '+
    Q5A_tp_city.Value;

{zapocet rokov a dni }
  Q5A_CALC_DNI.Value := 0;
  Q5A_CALC_ROKOV.Value := 0;

  if (Q5A_Nastup.AsString<>'') and (Q5A_Vystup.AsString<>'') then
  begin
     DecodeDate(Q5A_Nastup.Value, Y1, M1, D1);
     DecodeDate(Q5A_Vystup.Value, Y2, M2, D2);
  end;
  if (M2<M1) or ((M2=M1) and (D2<D1)) then
  begin
    rokov:=Y2-Y1-1;dni:=0;
    POSLEDNY_ROK:=Y2-1;
    for mm:=M1+1 to 12 do dni:=dni+KAL_DNI(POSLEDNY_ROK*100+mm);
    for mm:=1 to M2-1 do dni:=dni+KAL_DNI(Y2*100+mm);
    if (Y1=Y2) and (M1=M2) then dni:=dni+D2-D1+1 else
    begin
      dni:=dni+KAL_DNI(POSLEDNY_ROK*100+M1)-D1+1;
      dni:=dni+D2;
    end
  end else begin
    rokov:=Y2-Y1;dni:=0;
    POSLEDNY_ROK:=Y2;
    for mm:=M1+1 to M2-1 do dni:=dni+KAL_DNI(POSLEDNY_ROK*100+mm);
    if (Y1=Y2) and (M1=M2) then dni:=dni+D2-D1+1 else
    begin
      dni:=dni+KAL_DNI(POSLEDNY_ROK*100+M1)-D1+1;
      dni:=dni+D2;
    end
  end;
  Q5A_CALC_DNI.Value := dni;
  Q5A_CALC_ROKOV.Value := rokov;
end;

procedure RunReport_GfK_DOHODARI(const MyReportParam: TMyReportParam);
var pc: string; i,j,k:integer;
  SL: TStringList;
begin with ReportRTF,DM do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    SL := TStringList.Create;
    ReportRTF:=TReportRTF.Create(Application);
    if X.DisableShape then QRDisableShape(ReportRTF);
    if X.DisableLabel then QRDisableLabel(ReportRTF);
    Screen.Cursor:=crDefault;
    X.rtf_subor :=
      MyRepPath1 + MenoTlacDHD;
    SL.Add('Report dohodárov');
    if X.AktMinSid=X.AktMaxSid then SL.Add('Stredisko è.' + IntToStr(X.AktMinSid));
    SL.Add('Meno;Priezvisko;Rodné èíslo; Mesiac Min;Rok Min;Mesiac Max;Rok Max');
    ReportRTF.ShowReportStart_GfK_DOHODARI;
    if QDHD_Code_emp.AsString <> '' then
    while not QDHD_.EOF do begin
      SL.Add(
             {QDHD_PMT.Value + ';' +}
             QDHD_Name.Value + ';' +
             QDHD_Surname.Value + ';' +
             QDHD_Born_numb.AsString + ';' +
             IntToStr(MyMesiac(QDHD_Min_obdobie.Value))+';'+
             IntToStr(MyRok(QDHD_Min_obdobie.Value))+';'+
             IntToStr(MyMesiac(QDHD_Max_obdobie.Value))+';'+
             IntToStr(MyRok(QDHD_Max_obdobie.Value))
      );
      QDHD_.Next;
    end;
    SL.SaveToFile(MyRepPath1 + MenoTlacDHD);
    ReportRTF.ShowReportEnd;
  except on E:Exception do begin
    MyError(SMyAppReportShowFailed+E.Message);
    exit;
  end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportRTF.Free;
    SL.Free;
    Rtf_zobraz(X);
end;end;
end;

procedure RunReport_GfK_DOHODARI_PO_MESIACOCH(const MyReportParam: TMyReportParam);
var pc: string; i,j,k:integer;
  SL: TStringList;
begin with ReportRTF,DM do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    SL := TStringList.Create;
    ReportRTF:=TReportRTF.Create(Application);
    if X.DisableShape then QRDisableShape(ReportRTF);
    if X.DisableLabel then QRDisableLabel(ReportRTF);
    Screen.Cursor:=crDefault;
    X.rtf_subor :=
      MyRepPath1 + MenoTlacDHD;
    SL.Add('Report dohodárov');
    if X.AktMinSid=X.AktMaxSid then SL.Add('Stredisko è.' + IntToStr(X.AktMinSid));
    SL.Add('Meno;Priezvisko;Rodné èíslo; Mesiac Min;Rok Min;Mesiac Max;Rok Max');
    ReportRTF.ShowReportStart_GfK_DOHODARI;
    if QDHD_Code_emp.AsString <> '' then
    while not QDHD_.EOF do begin
      SL.Add(
             {QDHD_PMT.Value + ';' +}
             QDHD_Name.Value + ';' +
             QDHD_Surname.Value + ';' +
             QDHD_Born_numb.AsString + ';' +
             IntToStr(MyMesiac(QDHD_Min_obdobie.Value))+';'+
             IntToStr(MyRok(QDHD_Min_obdobie.Value))+';'+
             IntToStr(MyMesiac(QDHD_Max_obdobie.Value))+';'+
             IntToStr(MyRok(QDHD_Max_obdobie.Value))
      );
      QDHD_.Next;
    end;
    SL.SaveToFile(MyRepPath1 + MenoTlacDHD);
    ReportRTF.ShowReportEnd;
  except on E:Exception do begin
    MyError(SMyAppReportShowFailed+E.Message);
    exit;
  end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportRTF.Free;
    SL.Free;
    Rtf_zobraz(X);
end;end;
end;

procedure TReportRTF.QDHD_CalcFields(DataSet: TDataSet);
begin
  QDHD_PMT.Text:=
    Trim(
    Trim(QDHD_Surname.Value)+' '+
    Trim(QDHD_Name.Value)+' '+
    Trim(QDHD_Title.Value)
    );
end;

end.
