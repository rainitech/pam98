unit VD2007A;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, MyConsts, MyQuick, Db,
  DBTables;

type
  TReportVD2007A = class(TQuickRep)
    Q0_: TQuery;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRMemo2: TQRMemo;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel6: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRMemo3: TQRMemo;
    QRShape20: TQRShape;
    QRMemo5: TQRMemo;
    QRShape21: TQRShape;
    QRLabel8: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel9: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel10: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRLabel11: TQRLabel;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel14: TQRLabel;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRLabel17: TQRLabel;
    rr1: TQRLabel;
    rr4: TQRLabel;
    rr7: TQRLabel;
    QRShape69: TQRShape;
    QRLabel35: TQRLabel;
    QRShape70: TQRShape;
    QRLabel36: TQRLabel;
    QRShape71: TQRShape;
    QRLabel37: TQRLabel;
    QRShape72: TQRShape;
    QRLabel38: TQRLabel;
    QRShape2: TQRShape;
    QRMemo13: TQRMemo;
    QRMemo14: TQRMemo;
    QRShape3: TQRShape;
    QRMemo15: TQRMemo;
    QRShape43: TQRShape;
    QRMemo16: TQRMemo;
    QRShape44: TQRShape;
    QRMemo6: TQRMemo;
    QRMemo7: TQRMemo;
    QRMemo17: TQRMemo;
    QRMemo18: TQRMemo;
    QRShape36: TQRShape;
    QRShape73: TQRShape;
    QRMemo19: TQRMemo;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRMemo20: TQRMemo;
    QRMemo21: TQRMemo;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRMemo1: TQRMemo;
    QRShape84: TQRShape;
    QRLabel2: TQRLabel;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    rr0: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape49: TQRShape;
    QRLabel13: TQRLabel;
    QRShape50: TQRShape;
    QRLabel15: TQRLabel;
    QRShape51: TQRShape;
    QRLabel18: TQRLabel;
    QRShape52: TQRShape;
    QRLabel19: TQRLabel;
    QRShape53: TQRShape;
    QRLabel21: TQRLabel;
    QRShape54: TQRShape;
    QRMemo10: TQRMemo;
    QRMemo11: TQRMemo;
    QRShape55: TQRShape;
    QRMemo12: TQRMemo;
    QRShape56: TQRShape;
    QRMemo22: TQRMemo;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape65: TQRShape;
    rr6: TQRLabel;
    rra: TQRLabel;
    rrb: TQRLabel;
    rrc: TQRLabel;
    rr2: TQRLabel;
    QRMemo23: TQRMemo;
    QRShape66: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel_DIC: TQRLabel;
    QRShape67: TQRShape;
    QRLabel_rok: TQRLabel;
    Q1_: TQuery;
    Q2A_: TQuery;
    Q2B_: TQuery;
    rr11: TQRLabel;
    rrd: TQRLabel;
    rr23: TQRLabel;
    rr24: TQRLabel;
    QRShape68: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRMemo24: TQRMemo;
    QRMemo25: TQRMemo;
    QRMemo26: TQRMemo;
    rr31a: TQRLabel;
    rr32: TQRLabel;
    rr31b: TQRLabel;
    QRShape64: TQRShape;
    Q1_d_preddavok: TCurrencyField;
    Q1_d_bonus_cerpany: TCurrencyField;
    Q1_d_vyrovnanie: TCurrencyField;
    QRLabel7: TQRLabel;
    QRMemo4: TQRMemo;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape17: TQRShape;
    QRShape45: TQRShape;
    QRLabel20: TQRLabel;
    QRMemo8: TQRMemo;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape92: TQRShape;
    QRLabel29: TQRLabel;
    QRMemo9: TQRMemo;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRLabel30: TQRLabel;
    QRMemo27: TQRMemo;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    rr12: TQRLabel;
    rr13: TQRLabel;
    rr14: TQRLabel;
    rr15: TQRLabel;
    Q1_d_dan: TCurrencyField;
    procedure ReportVD2007ABeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    first_preview: boolean;
    preddavok,dan,bonus,rzp_nedopl,rzp_prepl,d_ciastzd,
    bonus_vypl_z_prostr_firmy,celkovy_preplatok,x_rzp: currency;
    bonus_kryty_preddavkom: currency;
    bonus_kryty_zrazkou: currency;
    R1,R2,R3,R5,R6,R7,R10,R11: currency;
    R12,R13,R14,R15,RD: currency;
    skut_odvedene_preddavky,skut_odvedena_dan: currency;
    poc_zam,poc_zam_bonus:longint;

  public
    procedure ShowReportStart;
    procedure ShowReportEnd;

  end;

var
  ReportVD2007A: TReportVD2007A;

procedure RunReportVD2007A(const MyReportParam: TMyReportParam);
procedure RunReportVD2007A_PDF(const MyReportParam: TMyReportParam);

implementation

uses Dm_main;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportVD2007A.ShowReportStart;
var pom1,pom2:currency;
pom_bonus_kryty1,pom_bonus_kryty2:currency;
begin
  first_preview := true;
  QRLabel_rok.Caption := 'za rok '+IntToStr(MyRok(X.AktObdobie));
  QRLabel_dic.Caption := DM.TINF_DIC.Value;
  Q0_.Close;
  Q0_.Params[0].Value := MyRok(X.AktObdobie);
  Q0_.Open;
  preddavok := NVLC(Q0_.fields[0].value);
  dan := NVLC(Q0_.fields[1].value);
  bonus := NVLC(Q0_.fields[2].value);
  d_ciastzd := NVLC(Q0_.fields[3].value);
  R1:=preddavok;
  rr1.Caption := CurrToStr(R1);
  rr6.Caption := CurrToStr(R6);
  rr0.Caption := CurrToStr(d_ciastzd);
  Q0_.Close;
  Q0_.SQL.Clear;
  Q0_.SQL.Add('select -sum(d_vyrovnanie) d_nedoplatok from vyp');
  Q0_.SQL.Add(' where v_rok = :p1');
  Q0_.SQL.Add(' and d_vyrovnanie < 0');
  Q0_.Params[0].Value := MyRok(X.AktObdobie);
  Q0_.Open;
  rzp_nedopl := NVLC(Q0_.fields[0].value);
  Q0_.Close;
  Q0_.SQL.Clear;
  Q0_.SQL.Add('select sum(d_vyrovnanie) d_preplatok from vyp');
  Q0_.SQL.Add(' where v_rok = :p1');
  Q0_.SQL.Add(' and d_vyrovnanie > 0');
  Q0_.Params[0].Value := MyRok(X.AktObdobie);
  Q0_.Open;
  rzp_prepl := NVLC(Q0_.fields[0].value);
  Q0_.Close;
  bonus_kryty_preddavkom:= 0; {voci preddavkom}
  bonus_kryty_zrazkou:=0; {voci zrazkovej dani}
  x_rzp:=0;
  R2:=0;R3:=0;R11:=0;R12:=0;R13:=0;R14:=0;R15:=0;
  skut_odvedene_preddavky:=0;
  skut_odvedena_dan:=0;
  Q1_.Params[0].Value := MyRok(X.AktObdobie);
  Q1_.Open;
  while not Q1_.EOF do begin
    pom_bonus_kryty1:=0; {kryty preddavkami}
    pom_bonus_kryty2:=0; {kryty zrazkou}
    R12:=R12+Q1_D_dan.Value; {dan vybrana zrazkou}
    pom1:=Q1_d_vyrovnanie.Value;
    if pom1>0 then R3 := R3 + pom1
    else R2 := R2 + (-pom1);
    {--vyrovnanie bonusu voci preddavkom}
    pom1:=Q1_d_preddavok.Value-Q1_d_vyrovnanie.Value;
    pom2:=Q1_D_bonus_cerpany.Value;
    if (pom2-pom1>0) and (pom1>=0) then pom_bonus_kryty1:=pom2-pom1
    else if pom1>=0 then begin
      pom_bonus_kryty1:= pom2;
      skut_odvedene_preddavky:= skut_odvedene_preddavky +(pom1-pom2); {R11:=R11+(pom1-pom2);}
    end;
    {--vyrovnanie bonusu voci zrazkovej dani}
    {--rocne zuct. sa nevyrovnava voci zrazkovej dani}
    pom1:=Q1_d_dan.Value;
    pom2:=Q1_D_bonus_cerpany.Value-pom_bonus_kryty1;
    if (pom2-pom1>0) and (pom1>=0) then pom_bonus_kryty2:=pom2-pom1
    else if pom1>=0 then begin
      pom_bonus_kryty2:=pom2;
      skut_odvedena_dan := skut_odvedena_dan + (pom1-pom2);
    end;
    bonus_kryty_preddavkom:= bonus_kryty_preddavkom + pom_bonus_kryty1;
    bonus_kryty_zrazkou   := bonus_kryty_zrazkou + pom_bonus_kryty2;
    Q1_.Next;
  end;
  Q1_.Close;
  {--bonus vyplateny z prostriedkou zamestnavatela}
  bonus_vypl_z_prostr_firmy:=bonus-bonus_kryty_preddavkom-bonus_kryty_zrazkou;
  {--}
  Q2A_.Params[0].Value := MyRok(X.AktObdobie);
  Q2A_.Open;
  poc_zam:=Q2A_.RecordCount;
  Q2A_.Close;
  Q2B_.Params[0].Value := MyRok(X.AktObdobie);
  Q2B_.Open;
  poc_zam_bonus:=Q2B_.RecordCount;
  Q2B_.Close;
  R5:=R1+R2-R3;
  if bonus<=R5
    then R6:=-bonus
    else R6:=-R5;
  R7:=R5+R6;
  R10:=R7;
  rr2.Caption := CurrToStr(R2-R3);
  {rr3.Caption := CurrToStr(R3); rr3 bolo zlucene do rr2}
  rr4.Caption := CurrToStr(R5);
  celkovy_preplatok:=R10-R11;
  {rr5.Caption := CurrToStr(R5);}
  rr6.Caption := CurrToStr(R6);
  rr7.Caption := CurrToStr(R7);
  {rr10.Caption := CurrToStr(R10);}
  rr11.Caption := CurrToStr(R11);
  rr12.Caption := CurrToStr(R12);
  R13 := bonus_kryty_zrazkou;
  rr13.Caption := CurrToStr(bonus_kryty_zrazkou);
  rr14.Caption := CurrToStr(R12-R13);
  rr15.Caption := CurrToStr(skut_odvedena_dan);
  rra.Caption  := CurrToStr(bonus);
  rrb.Caption  := CurrToStr(bonus_kryty_preddavkom+bonus_kryty_zrazkou);
  rrc.Caption  := CurrToStr(bonus_vypl_z_prostr_firmy);
  rrd.Caption  := CurrToStr(bonus_vypl_z_prostr_firmy);
  {rr21.Caption  := CurrToStr(R10);}
  {rr22.Caption := CurrToStr(R11);}
  if celkovy_preplatok<0 then begin
    rr23.Caption := CurrToStr(-celkovy_preplatok);
    rr24.Caption := CurrToStr(0);
  end
  else begin
    rr23.Caption := CurrToStr(0);
    rr24.Caption := CurrToStr(celkovy_preplatok);
  end;
  rr31a.Caption := CurrToStr(poc_zam);
  rr31b.Caption := CurrToStr(poc_zam_bonus);
  rr32.Caption := CurrToStr(((poc_zam-1) div 4)+1);
end;

procedure TReportVD2007A.ShowReportEnd;
begin
end;

procedure RunReportVD2007A(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportVD2007A:=TReportVD2007A.Create(Application);
    if X.DisableShape then QRDisableShape(ReportVD2007A);
    if X.DisableLabel then QRDisableLabel(ReportVD2007A);
    Screen.Cursor:=crDefault;
    ReportVD2007A.ShowReportStart;
    ReportVD2007A.Preview;
    ReportVD2007A.ShowReportEnd;

  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportVD2007A.Free;
  end;
end;

procedure RunReportVD2007A_PDF(const MyReportParam: TMyReportParam);
var A1,A2:string;
begin with ReportVD2007A,DM do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportVD2007A:=TReportVD2007A.Create(Application);
    ReportVD2007A.ShowReportStart;
    X.rtf_sablona := MyFrmPath + 'rh2004.pdf';
    X.rtf_subor :=  MyRepPath1 + 'RH1_'+IntToStr(MyRok(X.AktObdobie))+'.xfdf';
    X.rtf_prepisat:= True;
    Rtf_Open(X);
    MyXML := '';
    E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
    E_TEXT('<xfdf xmlns="http://ns.adobe.com/xfdf/" xml:space="preserve">');
    E_TEXT('<fields>');
    E_XFDF('Druh_hlasenia_1','x');
    E_XFDF('Druh_hlasenia_2',' ');
    E_XFDF('Druh_hlasenia_3',' ');
    E_XFDF('DIC',TINF_DIC.Value);
    E_XFDF('Danovy_urad',TINF_DANOVY_URAD.Value);
    E_XFDF('za_rok',Copy(IntToStr(MyRok(X.AktObdobie)),4,1));
    { pre dodatocne danove priznanie, zatial nebudem vyplnat }
    E_XFDF('Datum_zistenia_den','');
    E_XFDF('Datum_zistenia_mesiac','');
    E_XFDF('Datum_zistenia_rok','');
    if Trim(TINF_TYP_ZEL.Value)='FO' then begin
      E_XFDF('FO_priezvisko',TINF_FO_Surname.Value);
      E_XFDF('FO_meno',TINF_FO_Name.Value);
      E_XFDF('FO_titul',TINF_FO_Titul_Pred.Value);
    end
    else begin
      E_XFDF('PO_meno',TINF_NAZOV.Value);
      E_XFDF('PO_pravna_forma','');
    end;
    E_XFDF('Sidlo_ulica',TINF_ADR_ULICA.Value);
    E_XFDF('Sidlo_cislo',TINF_ADR_CISLO.Value);
    E_XFDF('Sidlo_psc',TINF_ADR_PSC.Value);
    E_XFDF('Sidlo_obec',TINF_ADR_MESTO.Value);
    MyRozdelTel(TINF_ADR_TELEFON.Value,A1,A2);
    E_XFDF('Sidlo_tel_p',A1);
    E_XFDF('Sidlo_tel',A2);
    MyRozdelTel(TINF_ADR_FAX.Value,A1,A2);
    E_XFDF('Sidlo_fax_p',A1);
    E_XFDF('Sidlo_fax',A2);
    if TINF_DATUM_RZP.AsString<>'' then begin
      E_XFDF('Datum_zuctovania_den',FormatDateTime('dd',TINF_DATUM_RZP.Value));
      E_XFDF('Datum_zuctovania_mes',FormatDateTime('mm',TINF_DATUM_RZP.Value));
      E_XFDF('Datum_zuctovania_rok',Copy(FormatDateTime('yyyy',TINF_DATUM_RZP.Value),4,1));
    end;
    E_XFDF('C1_00',Format('%0.0f',[d_ciastzd]));
    E_XFDF('C1_01',Format('%0.0f',[R1]));
    E_XFDF('C1_02',Format('%0.0f',[R2]));
    E_XFDF('C1_03',Format('%0.0f',[R3]));
    E_XFDF('C1_04z',' ');
    E_XFDF('C1_04','0');
    E_XFDF('C1_05',Format('%0.0f',[R5]));
    if R6=0 then begin
      E_XFDF('C1_06z',' ');
      E_XFDF('C1_06',Format('%0.0f',[R6]));
    end
    else if R6 > 0 then  begin
      E_XFDF('C1_06z','+');
      E_XFDF('C1_06',Format('%0.0f',[R6]));
    end
    else begin
      E_XFDF('C1_06z','-');
      E_XFDF('C1_06',Format('%0.0f',[-R6]));
    end;
    E_XFDF('C1_07',Format('%0.0f',[R7]));
    E_XFDF('C1_08',Format('%0.0f',[0.0]));
    E_XFDF('C1_09',Format('%0.0f',[0.0]));
    E_XFDF('C1_10',Format('%0.0f',[R10]));
    E_XFDF('C1_11',Format('%0.0f',[R11]));
    E_XFDF('C1_A',Format('%0.0f',[bonus]));
    E_XFDF('C1_B',Format('%0.0f',[bonus_kryty_preddavkom+bonus_kryty_zrazkou]));
    E_XFDF('C1_C',Format('%0.0f',[bonus_vypl_z_prostr_firmy]));
    E_XFDF('C1_D',Format('%0.0f',[bonus_vypl_z_prostr_firmy]));
    E_XFDF('C2_1',Format('%0.0f',[R10]));
    E_XFDF('C2_2',Format('%0.0f',[R11]));
    if celkovy_preplatok<0 then begin
      E_XFDF('C2_3',Format('%0.0f',[-celkovy_preplatok]));
      E_XFDF('C2_4','0');
    end
    else begin
      E_XFDF('C2_3','0');
      E_XFDF('C2_4',Format('%0.0f',[celkovy_preplatok]));
    end;
    E_XFDF('pocet_zam',IntToStr(poc_zam));
    E_XFDF('pocet_zam_bonus',IntToStr(poc_zam_bonus));
    E_XFDF('pocet_stran',IntToStr(((poc_zam-1) div 4)+1));
    E_XFDF('Datum_den',FormatDateTime('d',X.Vykaz_dna_DT));
    E_XFDF('Datum_mes',FormatDateTime('m',X.Vykaz_dna_DT));
    E_XFDF('Datum_rok',Copy(FormatDateTime('yyyy',X.Vykaz_dna_DT),4,1));
    E_XFDF('Vypracoval',X.Vykaz_Zostavil);
    E_XFDF('Datum_vypr_den',FormatDateTime('d',X.Vykaz_dna_DT));
    E_XFDF('Datum_vypr_mes',FormatDateTime('m',X.Vykaz_dna_DT));
    E_XFDF('Datum_vypr_rok',Copy(FormatDateTime('yyyy',X.Vykaz_dna_DT),4,1));
    MyRozdelTel(X.telefon,A1,A2);
    E_XFDF('Tel_p',A1);
    E_XFDF('tel',A2);
    E_TAGK('fields');
    E_ATTRZ('href',X.rtf_sablona);
    E_TAGA('f',MyAttr);
    E_TAGK('xfdf');
    Rtf_Uloz_XML(X);
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportVD2007A.ShowReportEnd;
    ReportVD2007A.Free;
    Progress(100);
  end;
  Rtf_zobraz(X);
end;end;

procedure TReportVD2007A.ReportVD2007ABeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,8);
end;






















end.
