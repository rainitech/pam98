unit ZP2005PR;
(*
{ Q0_CALC_FIRMA.Value := X.AktFirmaStr;}

 s:=IntToStr(X.AktObdobie);
 Q0_Ca_obdobie.Value:=
    'za obdobie  '+Copy(s,5,2)+' / '+Copy(s,1,4);
 Q0_ca_nadpis1.Value:='kód zdravotnej poisovne : '+
    LPAD(Q0_kzp.AsString,2,'0');

 Q0_CALC_SS.Value := RPAD(IntToStr(MyMesiac(X.AktObdobie)),2,'0') +
                     RPAD(IntToStr(MyRok(X.AktObdobie)),2,'0');

 Q0_CALC_ICO.Value := DM.TINF_ICO.Value;
*)
interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportZP2005PR = class(TQuickRep)
    GroupFooterBand1: TQRBand;
    Q1_: TQuery;
    Q1_CALC_MPT: TStringField;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    Q1_CALC_FIRMA: TStringField;
    DS00: TDataSource;
    SummaryBand1: TQRBand;
    Q1_CALC_ZAKLAD1: TCurrencyField;
    Q1_CALC_ZAKLAD2: TCurrencyField;
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
    Q1_oz_zdravot: TCurrencyField;
    Q1_born_numb: TStringField;
    QRSubDetail1: TQRSubDetail;
    QRShape12: TQRShape;
    QRDBText24: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape28: TQRShape;
    QRShape31: TQRShape;
    QRShape34: TQRShape;
    QRShape36: TQRShape;
    QRShape38: TQRShape;
    QRShape41: TQRShape;
    QRExpr6: TQRExpr;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    PageFooterBand1: TQRBand;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRExpr1: TQRExpr;
    QRLabel47: TQRLabel;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel5: TQRLabel;
    QRShape15: TQRShape;
    QRMemo1: TQRMemo;
    QRShape16: TQRShape;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    QRMemo5: TQRMemo;
    QRLabel10: TQRLabel;
    QRMemo6: TQRMemo;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape9: TQRShape;
    QRShape35: TQRShape;
    QRShape37: TQRShape;
    QRLabel7: TQRLabel;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape39: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel13: TQRLabel;
    QRMemo7: TQRMemo;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRMemo8: TQRMemo;
    QRMemo9: TQRMemo;
    Q1_n_brutto: TCurrencyField;
    QRDBText7: TQRDBText;
    QRLabel92: TQRLabel;
    QRShape53: TQRShape;
    QRLabel93: TQRLabel;
    QRShape54: TQRShape;
    QRLabel16: TQRLabel;
    QRShape2: TQRShape;
    QRDBText9: TQRDBText;
    Q1_n_prijem_zp: TCurrencyField;
    QRLabel_KZP: TQRLabel;
    GroupFooterBand2: TQRBand;
    QR_Vykaz_zostavil: TQRLabel;
    QR_vykaz_dna: TQRLabel;
    Q1_dni_poist: TSmallintField;
    Q1A_: TQuery;
    Q1A_Code_emp: TIntegerField;
    Q1A_ID: TIntegerField;
    Q1A_V_rok: TSmallintField;
    Q1A_V_mesiac: TSmallintField;
    Q1A_Kod_zmeny: TStringField;
    Q1A_Platnost_zmeny: TStringField;
    Q1A_Datum_zmeny: TDateField;
    Q1A_Id_cislo: TStringField;
    Q1A_surname: TStringField;
    Q1A_name: TStringField;
    Q1A_title: TStringField;
    Q1A_born_numb: TStringField;
    Q0A_: TQuery;
    DS0A: TDataSource;
    Q0A_kzp: TSmallintField;
    Q1A_KZP: TSmallintField;
    Q1_miera_poklesu: TFloatField;
    Q1_CALC_ZVYHODNENY_ZP: TBooleanField;
    Q00_: TQuery;
    Q00_code_emp: TIntegerField;
    Q2_: TQuery;
    Q00_CALC_born_numb: TStringField;
    Q00_CALC_dni_poist: TIntegerField;
    Q00_CALC_N_prijem_zp: TCurrencyField;
    Q00_CALC_N_zaklad_zp: TCurrencyField;
    Q00_CALC_fz_zdravot: TFloatField;
    Q00_CALC_F_zdravot: TFloatField;
    Q00_CALC_Oz_zdravot: TCurrencyField;
    Q00_CALC_O_zdravot: TCurrencyField;
    Q00_CA_OBDOBIE: TStringField;
    Q00_CALC_FIRMA: TStringField;
    Q00_CALC_ICO: TStringField;
    Q01_CALC_born_numb: TStringField;
    Q01_CALC_dni_poist: TIntegerField;
    Q01_CALC_N_prijem_zp: TCurrencyField;
    Q01_CALC_N_zaklad_zp: TCurrencyField;
    Q01_CALC_fz_zdravot: TFloatField;
    Q01_CALC_F_zdravot: TFloatField;
    Q01_CALC_Oz_zdravot: TCurrencyField;
    Q01_CALC_O_zdravot: TCurrencyField;
    Q01_CA_OBDOBIE: TStringField;
    Q01_CALC_FIRMA: TStringField;
    Q01_CALC_ICO: TStringField;
    Q2_CALC_dni_poist: TIntegerField;
    Q2_CALC_Fz_zdravot: TFloatField;
    Q2_CALC_F_zdravot: TFloatField;
    Q2_code_emp: TIntegerField;
    Q2_surname: TStringField;
    Q2_name: TStringField;
    Q2_title: TStringField;
    Q2_born_numb: TStringField;
    Q2_miera_poklesu: TFloatField;
    Q2_kzp: TSmallintField;
    Q2_zps: TBooleanField;
    Q2_ztp: TBooleanField;
    Q2_u_zdrav: TSmallintField;
    Q2_nastup: TDateField;
    Q2_vystup: TDateField;
    Q00_CALC_ZVYHODNENY_ZP: TBooleanField;
    Q01_CALC_ZVYHODNENY_ZP: TBooleanField;
    Q00A_: TQuery;
    Q00A_code_emp: TIntegerField;
    Q00RZP_: TQuery;
    Q1RZP_: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    BooleanField1: TBooleanField;
    Q2RZP_: TQuery;
    QCBU_: TQuery;
    QCBU_BUID_TYP: TStringField;
    QCBU_BUID_KOD: TSmallintField;
    QCBU_OLD_PREDCISLO_U: TStringField;
    QCBU_OLD_CISLO_U: TStringField;
    QCBU_BANKA_U: TStringField;
    QCBU_SSYM_U: TStringField;
    QCBU_KSYM: TStringField;
    QCBU_VSYM: TStringField;
    QCBU_PRIJEMCA: TStringField;
    QCBU_SPP: TStringField;
    QCBU_CISLO_U: TStringField;
    QCBU_POBOCKA_ZP: TSmallintField;
    Q00RZP_code_emp: TIntegerField;
    Q1RZP_code_emp: TIntegerField;
    Q1RZP_surname: TStringField;
    Q1RZP_name: TStringField;
    Q1RZP_title: TStringField;
    Q1RZP_born_numb: TStringField;
    Q1RZP_miera_poklesu: TFloatField;
    Q1RZP_kzp: TSmallintField;
    Q1RZP_n_zaklad_zp: TCurrencyField;
    Q1RZP_zps: TBooleanField;
    Q1RZP_zps1: TBooleanField;
    Q1RZP_ztp: TBooleanField;
    Q1RZP_o_zdravot: TCurrencyField;
    Q1RZP_oz_zdravot: TCurrencyField;
    Q1RZP_f_zdravot: TFloatField;
    Q1RZP_fz_zdravot: TFloatField;
    Q1RZP_u_zdrav: TSmallintField;
    Q1RZP_n_brutto: TCurrencyField;
    Q1RZP_dni_poist: TSmallintField;
    Q1RZP_n_prijem_zp: TCurrencyField;
    Q1RZP_v_obdobie: TIntegerField;
    Q2RZP_code_emp: TIntegerField;
    Q2RZP_surname: TStringField;
    Q2RZP_name: TStringField;
    Q2RZP_title: TStringField;
    Q2RZP_born_numb: TStringField;
    Q2RZP_miera_poklesu: TFloatField;
    Q2RZP_kzp: TSmallintField;
    Q2RZP_zps: TBooleanField;
    Q2RZP_ztp: TBooleanField;
    Q2RZP_u_zdrav: TSmallintField;
    Q2RZP_nastup: TDateField;
    Q2RZP_vystup: TDateField;
    Q2RZP_CALC_Fz_zdravot: TFloatField;
    Q2RZP_CALC_F_zdravot: TFloatField;
    Q2RZP_CALC_Dni_poist: TIntegerField;
    Q01_: TQuery;
    Q01_born_numb: TStringField;
    Q01A_: TQuery;
    Q01A_born_numb: TStringField;
    procedure Q1_CalcFields(DataSet: TDataSet);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ReportZP2005PRBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure Q00_CalcFields(DataSet: TDataSet);
    procedure Q2_CalcFields(DataSet: TDataSet);
    procedure Q2RZP_CalcFields(DataSet: TDataSet);
    procedure Q01_CalcFields(DataSet: TDataSet);
  private
    first_preview:boolean;
  public
    procedure ShowReportStart;
    procedure ShowReportStart514_Zlucene;
    procedure ShowReportEnd;
    procedure SetX(const MyReportParam:TMyReportParam);
  end;

var
  ReportZP2005PR: TReportZP2005PR;

procedure RunReportZP2005PR(const MyReportParam: TMyReportParam);
//procedure RunReportZP2005PR_RTF(const MyReportParam: TMyReportParam);

implementation

uses RexZP, Dm_main, Dm_vypl;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportZP2005PR.ShowReportStart;
begin
  first_preview:=true;
  QR_Vykaz_zostavil.Caption := X.Vykaz_zostavil;
  QR_Vykaz_dna.Caption := X.Vykaz_dna;
  if X.AktObdobie >= Zakon_2006_01 then begin
    Q1_Oz_zdravot.DisplayFormat:='0';
    QRExpr6.Mask:='0';
  end;
  if X.AktObdobie >= Zakon_2009_01 then begin
    QRDBText7.Mask:='0.00';
    QRDBText24.Mask:='0.00';
    QRDBText5.Mask:='0.00';
    QRDBText33.Mask:='0.00';
    QRExpr6.Mask:='0.00';
    Q1_Oz_zdravot.DisplayFormat:='0.00';
    QRLabel10.Caption := 'Suma preddavku v €';
    QRMemo2.Lines[1] := 'Príjem v €';
    QRMemo3.Lines[1] := 'základ v €';
    QRMemo6.Lines[1] := 'spolu v €';
  end;
  Q1_.Close;
  Q1_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q1_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q1_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q1_.ParamByName('KZP').AsInteger := X.Kod_Zp;
  Q1_.Open;
  {--}
  Q2_.Close;
  Q2_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q2_.ParamByName('KZP').AsInteger := X.Kod_Zp;
  Q2_.Open;
  {--}
  Q00_.Close;
  Q00_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q00_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q00_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q00_.ParamByName('KZP').AsInteger := X.Kod_Zp;
  Q00_.Open;
  {--}
  Q00A_.Close;
  Q00A_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q00A_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q00A_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q00A_.Open;
  {--}
  Q01_.Close;
  Q01_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q01_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q01_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q01_.ParamByName('KZP').AsInteger := X.Kod_Zp;
  Q01_.Open;
  {--}
end;

procedure TReportZP2005PR.ShowReportStart514_Zlucene;
begin
  first_preview:=true;
  QR_Vykaz_zostavil.Caption := X.Vykaz_zostavil;
  QR_Vykaz_dna.Caption := X.Vykaz_dna;
  if X.AktObdobie >= Zakon_2006_01 then begin
    Q1_Oz_zdravot.DisplayFormat:='0';
    QRExpr6.Mask:='0';
  end;
  if X.AktObdobie >= Zakon_2009_01 then begin
    QRDBText7.Mask:='0.00';
    QRDBText24.Mask:='0.00';
    QRDBText5.Mask:='0.00';
    QRDBText33.Mask:='0.00';
    QRExpr6.Mask:='0.00';
    Q1_Oz_zdravot.DisplayFormat:='0.00';
    QRLabel10.Caption := 'Suma preddavku v €';
    QRMemo2.Lines[1] := 'Príjem v €';
    QRMemo3.Lines[1] := 'základ v €';
    QRMemo6.Lines[1] := 'spolu v €';
  end;
  Q1_.Close;
  Q1_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q1_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q1_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q1_.ParamByName('KZP').AsInteger := X.Kod_Zp;
  Q1_.Open;
  {--}
  Q2_.Close;
  Q2_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q2_.ParamByName('KZP').AsInteger := X.Kod_Zp;
  Q2_.Open;
  {--}
  Q01_.Close;
  Q01_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q01_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q01_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q01_.ParamByName('KZP').AsInteger := X.Kod_Zp;
  Q01_.Open;
  {--}
  Q01A_.Close;
  Q01A_.ParamByName('P1').AsInteger := X.AktObdobie;
  Q01A_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q01A_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q01A_.Open;
end;

procedure TReportZP2005PR.ShowReportEnd;
begin
  Q00A_.Close;
  Q01A_.Close;
  Q00_.Close;
  Q01_.Close;
  Q2_.Close;
  Q1_.Close;
end;



procedure TReportZP2005PR.Q1_CalcFields(DataSet: TDataSet);
begin
  Q1_CALC_FIRMA.Value := 'Názov:  '+X.AktFirmaStr;

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
  end;
  Q1_CALC_ZVYHODNENY_ZP.Value := DMV.Zvyhodneny_ZP(Q1_Miera_poklesu.Value,X.AktObdobie,Q1_ZTP.Value);
end;

procedure RunReportZP2005PR(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportZP2005PR:=TReportZP2005PR.Create(Application);
    if X.DisableShape then QRDisableShape(ReportZP2005PR);
    if X.DisableLabel then QRDisableLabel(ReportZP2005PR);
    Screen.Cursor:=crDefault;
    ReportZP2005PR.ShowReportStart;
    ReportZP2005PR.Preview;
    ReportZP2005PR.ShowReportEnd;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportZP2005PR.Free;
  end;
end;

procedure TReportZP2005PR.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 QRExpr1.Reset;
end;

procedure TReportZP2005PR.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 QRLabel_KZP.Caption := IntToStr(X.Kod_ZP);
end;

procedure TReportZP2005PR.ReportZP2005PRBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  Q00_.First;
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,5);
end;

procedure TReportZP2005PR.SetX(const MyReportParam:TMyReportParam);
begin
  X:=MyReportParam;
end;

(*
procedure RunReportZP2005PR_RTF(const MyReportParam: TMyReportParam);
var PomObdobie:longint;riadok:string(2);strana:integer;
begin with DM,ReportZP2005PR do begin
  X:= MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportZP2005PR:=TReportZP2005PR.Create(Application);
    if X.DisableShape then QRDisableShape(ReportZP2005PR);
    if X.DisableLabel then QRDisableLabel(ReportZP2005PR);
    Screen.Cursor:=crDefault;
    ReportZP2005PR.ShowReportStart;
    X.rtf_sablona := MyFrmPath + 'priloha_preddavok_zam.rtf';
    Q0_.First;
    Q0_.Filter:='kzp='+IntToStr(X.Kod_ZP);
    Q0_.Filtered:=True;
    if not Q0_.EOF then
    begin
      if X.Rtf_prepisat then
      begin
        PomObdobie:= Obdobie_ADD_MM(X.AktObdobie,1);
        strana:=0;
        while not Q1_.EOF do begin
          strana:=strana+1;
          X.rtf_subor := MyRepPath1 + 'zp' + Q0_Kzp.AsString + '_priloha_' + IntToStr(X.AktObdobie)+'.rtf';
          Rtf_Open(X);
          Rtf_SetKeyWord('$ICO',Q1_ICO.Value,48,' ');
          Rtf_SetKeyWord('$OBDOBIE',ObdobieToMMRRRR(X.AktObdobie),0,' ');
          Rtf_SetKeyWord('$NAZOV',Q0_CALC_FIRMA.Value,48,' ');
          Rtf_SetKeyWord('$VYPLNIL',X.Vykaz_Zostavil,42,' ');
          Rtf_SetKeyWord('$DATUM',X.Vykaz_dna,24,' ');
          for i:=1 to 22 do if not Q1_.EOF then begin
            riadok:=LPAD(IntToStr(i),2,'0');
            Rtf_SetKeyWord('$RC'+riadok,Q1_born_numb.Value,0,' ');
            Rtf_SetKeyWord('$P'+riadok,InToStr((strana-1)*22+i),0,' ');
            Rtf_SetKeyWord('$PR'+riadok,Format('%0.0f',[Q1_N_prijem_zp.Value]),0,' ');
            Rtf_SetKeyWord('$VZ'+riadok,Format('%0.0f',[Q1_N_zaklad_zp.Value]),0,' ');
            Rtf_SetKeyWord('$LS'+riadok,Format('%2.0n',[Q1_Fz_zdravot.Value]),0,' ');
            Rtf_SetKeyWord('$CS'+riadok,Format('%2.0n',[Q1_F_zdravot.Value]),0,' ');
            Rtf_SetKeyWord('$LP'+riadok,Format('%0.0f',[Q1_Oz_zdravot.Value]),0,' ');
            Rtf_SetKeyWord('$CP'+riadok,Format('%0.0f',[Q1_O_zdravot.Value]),0,' ');
            Rtf_SetKeyWord('$PS'+riadok,Format('%0.0f',[Q1_Oz_zdravot.Value+Q1_O_zdravot.Value]),0,' ');
          end;
          if not Q1.EOF then Q1_.Next;
        end;
        Rtf_Replace(X);
        ReportZP2005PR.ShowReportEnd;
        Rtf_Zobraz(X);
      end;
    end
    else
      raise EMyError.Create(Format(SMyAppNotFoundVykazZP,[X.Kod_ZP]));
    ReportZP2005PR.ShowReportEnd;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportZP2005PR.Free;
  end;
end;end;
*)


procedure TReportZP2005PR.Q00_CalcFields(DataSet: TDataSet);
var s:string;
begin
  Q1_.Filtered := False;
  Q1_.Filter   := 'code_emp='+Q00_code_emp.AsString;
  Q1_.Filtered := True;
  Q2_.Filtered := False;
  Q2_.Filter   := 'code_emp='+Q00_code_emp.AsString;
  Q2_.Filtered := True;
  if Q00_Code_emp.Value = Q1_Code_emp.Value then begin
    Q00_Calc_born_numb.Value := RC_BEZ(Q1_born_numb.Value);
    Q00_Calc_dni_poist.Value := Q1_dni_poist.Value;
    Q00_Calc_n_prijem_zp.Value := Q1_n_prijem_zp.Value;
    Q00_Calc_n_zaklad_zp.Value := Q1_n_zaklad_zp.Value;
    Q00_Calc_fz_zdravot.Value := Q1_fz_zdravot.Value;
    Q00_Calc_f_zdravot.Value := Q1_f_zdravot.Value;
    Q00_Calc_oz_zdravot.Value := Q1_oz_zdravot.Value;
    Q00_Calc_o_zdravot.Value := Q1_o_zdravot.Value;
    Q00_Calc_zvyhodneny_ZP.Value :=
      DMV.Zvyhodneny_ZP( Q1_Miera_poklesu.Value, X.AktObdobie, Q1_Ztp.Value);
  end
  else {if Q00_Code_emp.Value = Q2_Code_emp.Value then} begin
    Q00_Calc_born_numb.Value := RC_BEZ(Q2_born_numb.Value);
    Q00_Calc_dni_poist.Value := Q2_Calc_dni_poist.Value;
    Q00_Calc_n_prijem_zp.Value := 0; // Q1_n_prijem_zp.Value;
    Q00_Calc_n_zaklad_zp.Value := 0; //Q1_n_zaklad_zp.Value;
    Q00_Calc_fz_zdravot.Value := Q2_Calc_fz_zdravot.Value;
    Q00_Calc_f_zdravot.Value := Q2_Calc_f_zdravot.Value;
    Q00_Calc_oz_zdravot.Value := 0; //Q1_oz_zdravot.Value;
    Q00_Calc_o_zdravot.Value := 0; //Q1_o_zdravot.Value;
    Q00_Calc_zvyhodneny_ZP.Value :=
      DMV.Zvyhodneny_ZP( Q2_Miera_poklesu.Value, X.AktObdobie, Q2_Ztp.Value);
  end;

  Q00_CALC_FIRMA.Value := X.AktFirmaStr;
  s:=IntToStr(X.AktObdobie);
  Q00_Ca_obdobie.Value:=
    'za obdobie  '+Copy(s,5,2)+' / '+Copy(s,1,4);
  Q00_CALC_ICO.Value := DM.TINF_ICO.Value;
end;

procedure TReportZP2005PR.Q2_CalcFields(DataSet: TDataSet);
var YY,MM,DD:word;DNI:integer;
begin
  if (Q2_Miera_Poklesu.Value >= PARAMETRE[29].Hodnota) or Q2_ZTP.Value then
  begin
     Q2_Calc_F_zdravot.Value := DM.TSET_F_zdravot1.Value;
     Q2_Calc_Fz_zdravot.Value := DM.TSET_Fz_zdravot1.Value;
  end
  else begin
     Q2_Calc_F_zdravot.Value := DM.TSET_F_zdravot.Value;
     Q2_Calc_Fz_zdravot.Value := DM.TSET_Fz_zdravot.Value;
  end;
  DNI := KAL_DNI(X.AktObdobie);
  if Q2_Nastup.AsString<>'' then begin
    DecodeDate(Q2_Nastup.Value,YY,MM,DD);
    if YY*100+MM = X.AktObdobie then Dec(DNI,DD-1);
  end;
  if Q2_Vystup.AsString<>'' then begin
    DecodeDate(Q2_Vystup.Value,YY,MM,DD);
    if YY*100+MM = X.AktObdobie then Dec(DNI,KAL_DNI(X.AktObdobie)-DD);
  end;
  Q2_Calc_dni_poist.Value := 0; //tyka sa tych co su na materskej a podobne
end;


procedure TReportZP2005PR.Q2RZP_CalcFields(DataSet: TDataSet);
var YY,MM,DD:word;DNI:integer;
begin
  if (Q2RZP_Miera_Poklesu.Value >= PARAMETRE[29].Hodnota) or Q2RZP_ZTP.Value then
  begin
     Q2RZP_Calc_F_zdravot.Value := DM.TSET_F_zdravot1.Value;
     Q2RZP_Calc_Fz_zdravot.Value := DM.TSET_Fz_zdravot1.Value;
  end
  else begin
     Q2RZP_Calc_F_zdravot.Value := DM.TSET_F_zdravot.Value;
     Q2RZP_Calc_Fz_zdravot.Value := DM.TSET_Fz_zdravot.Value;
  end;
  DNI := KAL_DNI(X.AktObdobie);
  if Q2RZP_Nastup.AsString<>'' then begin
    DecodeDate(Q2_Nastup.Value,YY,MM,DD);
    if YY*100+MM = X.AktObdobie then Dec(DNI,DD-1);
  end;
  if Q2RZP_Vystup.AsString<>'' then begin
    DecodeDate(Q2_Vystup.Value,YY,MM,DD);
    if YY*100+MM = X.AktObdobie then Dec(DNI,KAL_DNI(X.AktObdobie)-DD);
  end;
  Q2RZP_Calc_dni_poist.Value := 0; //tyka sa tych co su na materskej a podobne
end;


procedure TReportZP2005PR.Q01_CalcFields(DataSet: TDataSet);
var s:string;
begin
  Q1_.Filtered := False;
  Q1_.Filter   := 'born_numb='+Q01_born_numb.AsString;
  Q1_.Filtered := True;
  Q2_.Filtered := False;
  Q2_.Filter   := 'born_numb='+Q01_born_numb.AsString;
  Q2_.Filtered := True;
  Q1_.First;
  Q2_.First;
  Q01_Calc_dni_poist.Value   := 0;
  Q01_Calc_n_prijem_zp.Value := 0;
  Q01_Calc_n_zaklad_zp.Value := 0;
  Q01_Calc_oz_zdravot.Value  := 0;
  Q01_Calc_o_zdravot.Value   := 0;
  if Q01_Born_numb.Value = Q1_Born_numb.Value then begin
    Q01_Calc_born_numb.Value := RC_BEZ(Q1_born_numb.Value);
    Q01_Calc_fz_zdravot.Value := Q1_fz_zdravot.Value;
    Q01_Calc_f_zdravot.Value := Q1_f_zdravot.Value;
    Q01_Calc_zvyhodneny_ZP.Value :=
      DMV.Zvyhodneny_ZP( Q1_Miera_poklesu.Value, X.AktObdobie, Q1_Ztp.Value);
   while not Q1_.EOF do begin
    Q01_Calc_dni_poist.Value   := Q01_Calc_dni_poist.Value   + Q1_dni_poist.Value;
    Q01_Calc_n_prijem_zp.Value := Q01_Calc_n_prijem_zp.Value + Q1_n_prijem_zp.Value;
    Q01_Calc_n_zaklad_zp.Value := Q01_Calc_n_zaklad_zp.Value + Q1_n_zaklad_zp.Value;
    Q01_Calc_oz_zdravot.Value  := Q01_Calc_oz_zdravot.Value  + Q1_oz_zdravot.Value;
    Q01_Calc_o_zdravot.Value   := Q01_Calc_o_zdravot.Value   + Q1_o_zdravot.Value;
    Q1_.Next;
   end;
  end
  else {if Q01_Born_numb.Value = Q2_Born_numb.Value then} begin
    Q01_Calc_born_numb.Value := RC_BEZ(Q2_born_numb.Value);
    Q01_Calc_fz_zdravot.Value := Q2_Calc_fz_zdravot.Value;
    Q01_Calc_f_zdravot.Value := Q2_Calc_f_zdravot.Value;
    Q01_Calc_zvyhodneny_ZP.Value :=
      DMV.Zvyhodneny_ZP( Q2_Miera_poklesu.Value, X.AktObdobie, Q2_Ztp.Value);
    Q1_.First;
    Q2_.First;
    Q01_Calc_dni_poist.Value   := 0;
    Q01_Calc_n_prijem_zp.Value := 0; // Q1_n_prijem_zp.Value;
    Q01_Calc_n_zaklad_zp.Value := 0; //Q1_n_zaklad_zp.Value;
    Q01_Calc_oz_zdravot.Value := 0; //Q1_oz_zdravot.Value;
    Q01_Calc_o_zdravot.Value := 0; //Q1_o_zdravot.Value;
   while not Q2_.EOF do begin
    Q01_Calc_dni_poist.Value   := Q01_Calc_dni_poist.Value   + Q2_Calc_dni_poist.Value;
    Q01_Calc_n_prijem_zp.Value := 0;
    Q2_.Next;
   end;
  end;

  Q01_CALC_FIRMA.Value := X.AktFirmaStr;
  s:=IntToStr(X.AktObdobie);
  Q01_Ca_obdobie.Value:=
    'za obdobie  '+Copy(s,5,2)+' / '+Copy(s,1,4);
  Q01_CALC_ICO.Value := DM.TINF_ICO.Value;
end;


end.
