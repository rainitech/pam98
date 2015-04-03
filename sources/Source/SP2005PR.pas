unit SP2005PR;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportSP2005PR = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    Q0_: TQuery;
    T0_: TTable;
    QRSysData2: TQRSysData;
    QRDBText3: TQRDBText;
    T0_NAZOV: TStringField;
    T0_ICO: TStringField;
    T0_OKEC: TStringField;
    T0_PREDCISLO_U: TStringField;
    T0_CISLO_U: TStringField;
    T0_BANKA_U: TStringField;
    T0_SSYM_U: TStringField;
    T0_KSYM_U: TStringField;
    T0_F_HOLIDAY: TSmallintField;
    T0_F_NEMOCD: TSmallintField;
    T0_F_ODSTUPM: TSmallintField;
    T0_F_ODSTUP: TSmallintField;
    T0_HOLKVART: TSmallintField;
    T0_F_ND_POCITA: TSmallintField;
    T0_F_DOBA: TFloatField;
    T0_FZ_UCET: TStringField;
    T0_FZ_VS: TStringField;
    T0_FZ_DEN: TSmallintField;
    T0_OUP_NAZOV: TStringField;
    T0_OUP_ULICA: TStringField;
    T0_OUP_MESTO: TStringField;
    T0_OUP_PSC: TStringField;
    T0_F_POISTNE: TFloatField;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel43: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QR_Nadpis: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel49: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRShape5: TQRShape;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRShape6: TQRShape;
    QRLabel4: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
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
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRShape19: TQRShape;
    QRDBText18: TQRDBText;
    QRLabel28: TQRLabel;
    QRShape20: TQRShape;
    QRDBText19: TQRDBText;
    QRLabel29: TQRLabel;
    QRShape21: TQRShape;
    QRDBText20: TQRDBText;
    QRLabel30: TQRLabel;
    T0_ICZ: TStringField;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape15: TQRShape;
    QRLabel33: TQRLabel;
    QRShape22: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel34: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel35: TQRLabel;
    QRShape26: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    Q0_CALC_MESIAC: TStringField;
    Q0_CALC_MPT: TStringField;
    Q0_CALC_U_INVALID: TStringField;
    Q0_CALC_BORN_NUMB: TStringField;
    Q0_surname: TStringField;
    Q0_name: TStringField;
    Q0_title: TStringField;
    Q0_born_numb: TStringField;
    Q0_fz_uvazok: TStringField;
    Q0_fz_typzam: TStringField;
    Q0_v_rok: TSmallintField;
    Q0_v_mesiac: TSmallintField;
    Q0_n_zaklad_np: TCurrencyField;
    Q0_n_zaklad_dp: TCurrencyField;
    Q0_n_zaklad_ip: TCurrencyField;
    Q0_n_zaklad_up: TCurrencyField;
    Q0_poc_nezaop_deti: TSmallintField;
    Q0_o_nemoc: TCurrencyField;
    Q0_o_dochod: TCurrencyField;
    Q0_o_invalid: TCurrencyField;
    Q0_o_fondzam: TCurrencyField;
    Q0_oz_nemoc: TCurrencyField;
    Q0_oz_dochod: TCurrencyField;
    Q0_oz_invalid: TCurrencyField;
    Q0_oz_fondzam: TCurrencyField;
    Q0_oz_uraz: TCurrencyField;
    Q0_u_invalid: TSmallintField;
    Q0_vynimka_vz: TStringField;
    Q0_v_dni: TSmallintField;
    QRShape27: TQRShape;
    QRDBText21: TQRDBText;
    QRLabel38: TQRLabel;
    Q0_CALC_U_FONDZAM: TStringField;
    Q0_u_fondzam: TSmallintField;
    QRShape53: TQRShape;
    QRLabel92: TQRLabel;
    QRShape54: TQRShape;
    QRLabel93: TQRLabel;
    QRLabel99: TQRLabel;
    Q1_: TQuery;
    Q1_CALC_FIRMA: TStringField;
    Q1_CALC_OBDOBIE: TStringField;
    Q1_CALC_CISLO_UCTU: TStringField;
    Q1_NAZOV: TStringField;
    Q1_ADR_ULICA: TStringField;
    Q1_ADR_MESTO: TStringField;
    Q1_ADR_PSC: TStringField;
    Q1_ICO: TStringField;
    Q1_PREDCISLO_U: TStringField;
    Q1_CISLO_U: TStringField;
    Q1_BANKA_U: TStringField;
    Q1_FZ_DEN: TSmallintField;
    Q1_OKEC: TStringField;
    Q1_ADR_FAX: TStringField;
    Q1_ADR_CISLO: TStringField;
    Q1_ADR_TELEFON: TStringField;
    Q1_ICZ: TStringField;
    Q1_ADR_EMAIL: TStringField;
    Q1_NAZOV_BANKY: TStringField;
    Q0_CALC_U_NEMOC: TStringField;
    Q0_u_nemoc: TSmallintField;
    Q0_CALC_ROZSAH_SP: TStringField;
    Q0_u_dochod: TSmallintField;
    Q0_u_uraz: TSmallintField;
    Q0_n_zaklad_gp: TCurrencyField;
    Q0_u_rezerva: TSmallintField;
    Q0_CALC_DNI: TIntegerField;
    Q0_typzec: TSmallintField;
    Q0_n_zaklad_fz: TCurrencyField;
    Q0_n_zaklad_rf: TCurrencyField;
    Q0_oz_garancne: TCurrencyField;
    Q0_oz_rezerva: TCurrencyField;
    Q1_DIC: TStringField;
    Q2_: TQuery;
    Q2_CALC_MESIAC: TStringField;
    Q2_CALC_MPT: TStringField;
    Q2_CALC_BORN_NUMB: TStringField;
    Q2_CALC_ROZSAH_SP: TStringField;
    Q2_CALC_DNI: TIntegerField;
    Q2_code_emp: TIntegerField;
    Q2_surname: TStringField;
    Q2_name: TStringField;
    Q2_title: TStringField;
    Q2_born_numb: TStringField;
    Q2_fz_uvazok: TStringField;
    Q2_fz_typzam: TStringField;
    Q2_v_obdobie: TIntegerField;
    Q2_v_obdobie_vyp: TIntegerField;
    Q2_v_mesiac_vyp: TSmallintField;
    Q2_n_zaklad_np: TCurrencyField;
    Q2_n_zaklad_dp: TCurrencyField;
    Q2_n_zaklad_ip: TCurrencyField;
    Q2_n_zaklad_up: TCurrencyField;
    Q2_n_zaklad_gp: TCurrencyField;
    Q2_n_zaklad_fz: TCurrencyField;
    Q2_n_zaklad_rf: TCurrencyField;
    Q2_o_nemoc: TCurrencyField;
    Q2_o_dochod: TCurrencyField;
    Q2_o_invalid: TCurrencyField;
    Q2_o_fondzam: TCurrencyField;
    Q2_oz_nemoc: TCurrencyField;
    Q2_oz_dochod: TCurrencyField;
    Q2_oz_invalid: TCurrencyField;
    Q2_oz_fondzam: TCurrencyField;
    Q2_oz_uraz: TCurrencyField;
    Q2_oz_garancne: TCurrencyField;
    Q2_oz_rezerva: TCurrencyField;
    Q2_kal_dni: TSmallintField;
    Q2_vynimka_vz: TStringField;
    Q2_sid: TSmallintField;
    Q0_vyptypzec: TSmallintField;
    Q0_pocDniStrajku: TSmallintField;
    Q0_f_vyplata: TFloatField;
    Q0_poSkonceni: TBooleanField;
    Q2_poSkonceni: TBooleanField;
    Q2_typzec: TSmallintField;
    Q2_PocDniStrajku: TSmallintField;
    Q2_PocDniObdobia: TSmallintField;
    Q2_VylucDobyObdobieOd: TDateField;
    Q2_VylucDobyObdobieDo: TDateField;
    Q2_VylucDobyTrva: TBooleanField;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure ReportSP2005PRBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure Q1_CalcFields(DataSet: TDataSet);
    procedure Q2_CalcFields(DataSet: TDataSet);
  private
    first_preview: boolean;
  public
    procedure ShowReportStart_PP;
    procedure ShowReportStart_NP;
    procedure ShowReportEnd;
    procedure SetX(const MyReportParam:TMyReportParam);
  end;

var
  ReportSP2005PR: TReportSP2005PR;

procedure RunReportSP2005PR(const MyReportParam: TMyReportParam);
procedure RunReportSP2005PR_PDF(const MyReportParam: TMyReportParam);

implementation

uses Dm_main;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportSP2005PR.SetX(const MyReportParam:TMyReportParam);
begin
  X:=MyReportParam;
end;

procedure TReportSP2005PR.ShowReportStart_PP;
{
 7=7 filter na typ zamestnanca s pravidelnym prijmom zz.typzec
 8=8 filter na obdobie, vo vnorenom selecte sa neda vyhodnotit cez parameter
 9=9 filter na typ zamestnanca s pravidelnym prijmom v.typzec


}
begin
  first_preview:=true;
  Q0_.Close;
  if X.AktSidList<>'' then begin
    Q0_.SQL.Text := StrReplaceX(Q0_.SQL.Text,'UNION',StrReplaceX(X.AktSidList,'sid','v.sid')+' '+CHR(10)+' UNION ');
    Q0_.SQL.Text := StrReplaceX(Q0_.SQL.Text,'1=:gfk','1=:gfk '+X.AktSidList+' ');
  end;
  Q0_.SQL.Text := StrReplaceX(Q0_.SQL.Text,'8=8','vv.v_obdobie = '+IntToStr(X.AktObdobie));
  if X.AktObdobie >= ZAKON_2013_01
    then Q0_.SQL.Text := StrReplaceX(Q0_.SQL.Text,'9=9','v.typzec '+ Condition_Typzec_PP + ' and not(v.poSkonceni=true)');
  if X.AktObdobie >= ZAKON_2013_01
    then Q0_.SQL.Text := StrReplaceX(Q0_.SQL.Text,'7=7','zz.typzec '+ Condition_Typzec_PP)
    else Q0_.SQL.Text := StrReplaceX(Q0_.SQL.Text,'7=7','zz.typzec<>3');
  Q1_.Close;
  Q0_.ParamByName('P1').Value := X.AktObdobie;
  Q0_.ParamByName('P2').Value := X.AktMinSid;
  Q0_.ParamByName('P3').Value := X.AktMaxSid;
  if PARAMETRE[40].Hodnota = 1
   then Q0_.ParamByName('GFK').Value := 0
     else Q0_.ParamByName('GFK').Value := 1;
  Q0_.Open;
  T0_.Open;
  Q1_.Open;
end;

procedure TReportSP2005PR.ShowReportStart_NP;
{
 7=7 filter na typ zamestnanca s pravidelnym prijmom zz.typzec
 8=8 filter na obdobie, vo vnorenom selecte sa neda vyhodnotit cez parameter
 9=9 filter na typ zamestnanca s pravidelnym prijmom v.typzec


}
begin
  first_preview:=true;
  Q2_.Close;
(*
  Q2_.SQL.Text := StrReplaceX(Q2_.SQL.Text,'4=4','x.sid between '+IntToStr(X.AktMinSid)+' and '+IntToStr(X.AktMaxSid));
  Q2_.SQL.Text := StrReplaceX(Q2_.SQL.Text,':p1',IntToStr(X.AktObdobie));
*)
  Q2_.ParamByName('P1').Value := X.AktObdobie;
  Q2_.ParamByName('P2').Value := X.AktMinSid;
  Q2_.ParamByName('P3').Value := X.AktMaxSid;
  if X.AktSidList<>'' then begin
    Q2_.SQL.Text := StrReplaceX(Q2_.SQL.Text,'and 3=3',StrReplaceX(X.AktSidList,'sid','x.sid'));
  end;
  Q2_.Open;

  Q0_.Close;
  if X.AktSidList<>'' then begin
    Q0_.SQL.Text := StrReplaceX(Q0_.SQL.Text,'and 3=3',StrReplaceX(X.AktSidList,'sid','v.sid'));
    Q0_.SQL.Text := StrReplaceX(Q0_.SQL.Text,'and 4=4',StrReplaceX(X.AktSidList,'sid','zz.sid'));
  end;
  Q0_.SQL.Text := StrReplaceX(Q0_.SQL.Text,'8=8','vv.v_obdobie = '+IntToStr(X.AktObdobie));
  if X.AktObdobie >= ZAKON_2013_01
    then Q0_.SQL.Text := StrReplaceX(Q0_.SQL.Text,'9=9','(v.poSkonceni=true or v.typzec '+ Condition_Typzec_NP+') and (N_Jednoraz1=0) ');
  if X.AktObdobie >= ZAKON_2013_01
    then Q0_.SQL.Text := StrReplaceX(Q0_.SQL.Text,'7=7','7=8')
    else Q0_.SQL.Text := StrReplaceX(Q0_.SQL.Text,'7=7','7=8');
  Q1_.Close;
  Q0_.ParamByName('P1').Value := X.AktObdobie;
  Q0_.ParamByName('P2').Value := X.AktMinSid;
  Q0_.ParamByName('P3').Value := X.AktMaxSid;
  if PARAMETRE[40].Hodnota = 1
   then Q0_.ParamByName('GFK').Value := 0
     else Q0_.ParamByName('GFK').Value := 1;
  Q0_.Open;
  T0_.Open;
  Q1_.Open;
end;

procedure TReportSP2005PR.ShowReportEnd;
begin
  Q2_.Close;
  Q0_.Close;
  Q1_.Close;
  T0_.Close;
end;

procedure TReportSP2005PR.Q0_CalcFields(DataSet: TDataSet);
var s,rozsahSP:string;
begin
  Q0_CALC_MESIAC.Value:=
    Q0_V_MESIAC.AsString+' / '+Q0_V_ROK.AsString;

  Q0_CALC_MPT.Value:=COPY(
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value)+' '+
    Trim(Q0_Title.Value),
    1,100);

  if Q0_U_invalid.Value = 0
    then Q0_CALC_U_INVALID.Value := 'X'
      else Q0_CALC_U_INVALID.Value := '';

  if Q0_U_fondzam.Value = 0
    then Q0_CALC_U_fondzam.Value := 'X'
      else Q0_CALC_U_fondzam.Value := '';

  if Q0_U_nemoc.Value = 0
    then Q0_CALC_U_NEMOC.Value := 'X'
      else Q0_CALC_U_NEMOC.Value := '';

  rozsahSP:='';
(*
  if Q0_U_nemoc.Value IN PoiPlatiZam then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q0_U_dochod.Value IN PoiPlatiZam then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q0_U_invalid.Value IN PoiPlatiZam then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q0_U_fondzam.Value IN PoiPlatiZam then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q0_U_uraz.Value=1 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q0_N_zaklad_gp.Value>0 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q0_U_rezerva.Value=1 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
*)
  if Q0_N_zaklad_np.Value > 0 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q0_N_zaklad_dp.Value > 0 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q0_N_zaklad_ip.Value > 0 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q0_N_zaklad_fz.Value > 0 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q0_N_zaklad_up.Value > 0 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q0_N_zaklad_gp.Value > 0 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q0_N_zaklad_rf.Value > 0 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  Q0_CALC_ROZSAH_SP.Value := rozsahSP;

  if Q0_F_vyplata.Value = 0
   then Q0_CALC_DNI.Value := KAL_DNI(X.AktObdobie)
    else Q0_CALC_DNI.Value := Q0_V_dni.Value;

  s:=Q0_Born_Numb.Value;
  while Pos('/',s)<>0 do Delete(s,Pos('/',s),1);
  while Pos(' ',s)<>0 do Delete(s,Pos(' ',s),1);
  Q0_CALC_Born_Numb.Value := s;
end;

procedure RunReportSP2005PR(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportSP2005PR:=TReportSP2005PR.Create(Application);
    if X.DisableShape then QRDisableShape(ReportSP2005PR);
    if X.DisableLabel then QRDisableLabel(ReportSP2005PR);
    Screen.Cursor:=crDefault;
    ReportSP2005PR.ShowReportStart_PP;
    ReportSP2005PR.Preview;
    ReportSP2005PR.ShowReportEnd;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportSP2005PR.Free;
  end;
end;

procedure TReportSP2005PR.ReportSP2005PRBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,5);
end;

procedure RunReportSP2005PR_PDF_2011(const MyReportParam: TMyReportParam);
var PC,PG,PCMAX:integer;
    prefix: string;
function idx(iPage:integer; iHod: integer): string;
begin
  idx := IntToStr((iPage-1)*18+iHod) + ']';
end;
begin with ReportSP2005PR do begin
  prefix := 'form1[0].#subform[0].';
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportSP2005PR:=TReportSP2005PR.Create(Application);
    if X.DisableShape then QRDisableShape(ReportSP2005PR);
    if X.DisableLabel then QRDisableLabel(ReportSP2005PR);
    Screen.Cursor:=crDefault;
    ReportSP2005PR.ShowReportStart_PP;
    X.rtf_sablona := MyFrmPath + 'MesVykPRI_1101.pdf';
    PCMAX:=6;
    PG:=1;
    repeat
      X.rtf_subor :=  MyRepPath1 + 'MesVykPRI_'+IntToStr(X.AktObdobie)+X.AktSidListSuffix+'_str'+IntToStr(PG)+'.xfdf';
      Rtf_Open(X);
      if X.Rtf_prepisat then
      begin
        MyXML := '';
        E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
        E_TEXT('<xfdf xmlns="http://ns.adobe.com/xfdf/" xml:space="preserve">');
        E_TAGZ('fields');
        E_XFDF(prefix+'DateTimeFieldZaObdobie[0]', ObdobieToMMRRRR(X.AktObdobie));
        E_XFDF(prefix+'TextFieldId[0]',Q1_ICZ.Value);
        if DM.TINF_SP_IDENTIFIKATOR.Value = 1 then
        begin
          E_XFDF(prefix+'RBListIcoDic[0]','1');
          E_XFDF(prefix+'TextFieldId[1]',Q1_ICO.Value);
        end else begin
          E_XFDF(prefix+'RBListIcoDic[0]','2');
          E_XFDF(prefix+'TextFieldId[1]',Q1_DIC.Value);
        end;
        if X.Vykaz_Riadny='R'
          then E_XFDF(prefix+'RadioButtonList[0]','0')
          else E_XFDF(prefix+'RadioButtonList[0]','1');
        E_XFDF(prefix+'NumericFieldCisloStrany[0]',IntToStr(PG));
        E_XFDF(prefix+'DateTimeField[0]',FormatDateTime('dd.mm.yyyy',X.Vykaz_dna_DT));
        E_XFDF(prefix+'TextFieldFormularVyplnil[0]',X.Vykaz_zostavil);
        for pc:=1 to 6 do begin
         if not Q0_.EOF then begin
           E_XFDF(prefix+'TextFieldPorCislo['+idx(1,pc-1),IntToStr(((PG-1)*6)+PC));
           E_XFDF(prefix+'TextFieldRodneCislo['+idx(1,pc-1),Q0_CALC_Born_Numb.Value);
           E_XFDF(prefix+'NumericFieldPocetKalDni['+idx(1,pc-1),Q0_CALC_dni.AsString);
           if (Q0_typzec.Value = 2) or (Q0_typzec.Value = 3)
            then E_XFDF(prefix+'CheckBox1['+idx(1,pc-1),'1')
            else E_XFDF(prefix+'CheckBox1['+idx(1,pc-1),'0');
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,0),Format('%d',[Trunc(Q0_N_zaklad_np.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,1),Format('%d',[Trunc(Q0_N_zaklad_dp.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,2),Format('%d',[Trunc(Q0_N_zaklad_ip.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,3),Format('%d',[Trunc(Q0_N_zaklad_fz.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,4),Format('%d',[Trunc(Q0_N_zaklad_up.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,5),Format('%d',[Trunc(Q0_N_zaklad_gp.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,6),Format('%d',[Trunc(Q0_N_zaklad_rf.Value)]));
           // poistne za zamestnavatela
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,7),Format('%d',[Trunc(Q0_oz_nemoc.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,8),Format('%d',[Trunc(Q0_oz_dochod.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,9),Format('%d',[Trunc(Q0_oz_invalid.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,10),Format('%d',[Trunc(Q0_oz_fondzam.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,11),Format('%d',[Trunc(Q0_oz_uraz.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,12),Format('%d',[Trunc(Q0_oz_garancne.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,13),Format('%d',[Trunc(Q0_oz_rezerva.Value)]));
           // poistne za zamestnanca
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,14),Format('%d',[Trunc(Q0_o_nemoc.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,15),Format('%d',[Trunc(Q0_o_dochod.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,16),Format('%d',[Trunc(Q0_o_invalid.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,17),Format('%d',[Trunc(Q0_o_fondzam.Value)]));
           //desatinna cast
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,0),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_N_zaklad_np.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,1),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_N_zaklad_dp.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,2),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_N_zaklad_ip.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,3),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_N_zaklad_fz.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,4),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_N_zaklad_up.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,5),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_N_zaklad_gp.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,6),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_N_zaklad_rf.Value)*100,0,1))]));
           // poistne za zamestnavatela
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,7),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_oz_nemoc.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,8),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_oz_dochod.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,9),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_oz_invalid.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,10),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_oz_fondzam.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,11),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_oz_uraz.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,12),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_oz_garancne.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,13),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_oz_rezerva.Value)*100,0,1))]));
           // poistne za zamestnanca
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,14),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_o_nemoc.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,15),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_o_dochod.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,16),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_o_invalid.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,17),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_o_fondzam.Value)*100,0,1))]));
           //
           Q0_.Next;
         end;
        end;
        E_TAGK('fields');
        E_ATTRZ('href',X.rtf_sablona);
        E_TAGA('f',MyAttr);
        E_TAGK('xfdf');
        Rtf_Uloz_XML(X);
      end;
      INC(PG);
    until Q0_.EOF;
    ReportSP2005PR.ShowReportEnd;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
 end;
 finally
    Screen.Cursor:=crDefault;
    ReportSP2005PR.Free;
 end;
  VyberSuboru(X.RTF_subor,'MesVykPri'+IntToStr(X.AktObdobie)+' files(*.XFDF)|MesVykPRI_'+IntToStr(X.AktObdobie)+'*.XFDF'+'|*.XFDF|*.XFDF');
end;end;

procedure RunReportSP2005PR_PDF_2011_NP(const MyReportParam: TMyReportParam);
var PC,PG,PCMAX:integer;
    prefix: string;
    ObdVyplatenia: longint;
function idx(iPage:integer; iHod: integer): string;
begin
  idx := IntToStr((iPage-1)*18+iHod) + ']';
end;
begin with ReportSP2005PR do begin
  prefix := 'form1[0].#subform[0].';
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportSP2005PR:=TReportSP2005PR.Create(Application);
    if X.DisableShape then QRDisableShape(ReportSP2005PR);
    if X.DisableLabel then QRDisableLabel(ReportSP2005PR);
    Screen.Cursor:=crDefault;
    ReportSP2005PR.ShowReportStart_NP;
    Q2_.Close;
    Q2_.ParamByName('P1').Value := X.AktObdobie;
    Q2_.Open;
    X.rtf_sablona := MyFrmPath + 'MesVykNPP_1101.pdf';
    ObdVyplatenia := Obdobie_ADD_MM (X.AktObdobie, 1);
    PCMAX:=6;
    PG:=1;
    repeat
      X.rtf_subor :=  MyRepPath1 + 'MesVykNPP_'+IntToStr(X.AktObdobie)+'_str'+IntToStr(PG)+X.AktSidListSuffix+'.xfdf';
      Rtf_Open(X);
      if X.Rtf_prepisat then
      begin
        MyXML := '';
        E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
        E_TEXT('<xfdf xmlns="http://ns.adobe.com/xfdf/" xml:space="preserve">');
        E_TAGZ('fields');
        E_XFDF(prefix+'DateTimeFieldPrijmyVyplateneVMesiaci[0]', ObdobieToMMRRRR(ObdVyplatenia));
        E_XFDF(prefix+'TextFieldId[0]',Q1_ICZ.Value);
        if DM.TINF_SP_IDENTIFIKATOR.Value = 1 then
        begin
          E_XFDF(prefix+'RBListIcoDic[0]','1');
          E_XFDF(prefix+'TextFieldId[1]',Q1_ICO.Value);
        end else begin
          E_XFDF(prefix+'RBListIcoDic[0]','2');
          E_XFDF(prefix+'TextFieldId[1]',Q1_DIC.Value);
        end;
        if X.Vykaz_Riadny='R'
          then E_XFDF(prefix+'RadioButtonList[0]','0')
          else E_XFDF(prefix+'RadioButtonList[0]','1');
        E_XFDF(prefix+'NumericFieldCisloStrany[0]',IntToStr(PG));
        E_XFDF(prefix+'DateTimeField[0]',FormatDateTime('dd.mm.yyyy',X.Vykaz_dna_DT));
        E_XFDF(prefix+'TextFieldFormularVyplnil[0]',X.Vykaz_zostavil);
        for pc:=1 to 6 do begin
         if not Q2_.EOF then begin
           E_XFDF(prefix+'DateTimeFieldObdobie['+idx(1,pc-1), ObdobieToMMRRRR(X.AktObdobie));
           E_XFDF(prefix+'TextFieldPorCislo['+idx(1,pc-1),IntToStr(((PG-1)*6)+PC));
           E_XFDF(prefix+'TextFieldRodneCislo['+idx(1,pc-1),Q2_CALC_Born_Numb.Value);
           E_XFDF(prefix+'NumericFieldPocetKalDni['+idx(1,pc-1),Q2_Kal_dni.AsString);
           if ((Q2_typzec.Value = 2) or (Q2_typzec.Value = 3))
            then E_XFDF(prefix+'RadioButtonPravNepravPrijem['+idx(1,pc-1),'3')
            else E_XFDF(prefix+'RadioButtonPravNepravPrijem['+idx(1,pc-1),'0');
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,0),Format('%d',[Trunc(Q2_N_zaklad_np.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,1),Format('%d',[Trunc(Q2_N_zaklad_dp.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,2),Format('%d',[Trunc(Q2_N_zaklad_ip.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,3),Format('%d',[Trunc(Q2_N_zaklad_fz.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,4),Format('%d',[Trunc(Q2_N_zaklad_up.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,5),Format('%d',[Trunc(Q2_N_zaklad_gp.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,6),Format('%d',[Trunc(Q2_N_zaklad_rf.Value)]));
           // poistne za zamestnavatela
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,7),Format('%d',[Trunc(Q2_oz_nemoc.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,8),Format('%d',[Trunc(Q2_oz_dochod.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,9),Format('%d',[Trunc(Q2_oz_invalid.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,10),Format('%d',[Trunc(Q2_oz_fondzam.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,11),Format('%d',[Trunc(Q2_oz_uraz.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,12),Format('%d',[Trunc(Q2_oz_garancne.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,13),Format('%d',[Trunc(Q2_oz_rezerva.Value)]));
           // poistne za zamestnanca
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,14),Format('%d',[Trunc(Q2_o_nemoc.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,15),Format('%d',[Trunc(Q2_o_dochod.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,16),Format('%d',[Trunc(Q2_o_invalid.Value)]));
           E_XFDF(prefix+'NumericFieldSumaCelaCast['+idx(pc,17),Format('%d',[Trunc(Q2_o_fondzam.Value)]));
           //desatinna cast
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,0),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q2_N_zaklad_np.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,1),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q2_N_zaklad_dp.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,2),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q2_N_zaklad_ip.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,3),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q2_N_zaklad_fz.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,4),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q2_N_zaklad_up.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,5),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q2_N_zaklad_gp.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,6),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q2_N_zaklad_rf.Value)*100,0,1))]));
           // poistne za zamestnavatela
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,7),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q2_oz_nemoc.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,8),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q2_oz_dochod.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,9),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q2_oz_invalid.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,10),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q2_oz_fondzam.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,11),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q2_oz_uraz.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,12),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q2_oz_garancne.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,13),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q2_oz_rezerva.Value)*100,0,1))]));
           // poistne za zamestnanca
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,14),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q2_o_nemoc.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,15),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q2_o_dochod.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,16),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q2_o_invalid.Value)*100,0,1))]));
           E_XFDF(prefix+'NumericFieldSumaDesMiesta['+idx(pc,17),Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q2_o_fondzam.Value)*100,0,1))]));
           //
           Q2_.Next;
         end;
        end;
        E_TAGK('fields');
        E_ATTRZ('href',X.rtf_sablona);
        E_TAGA('f',MyAttr);
        E_TAGK('xfdf');
        Rtf_Uloz_XML(X);
      end;
      INC(PG);
    until Q2_.EOF;
    Q2_.Close;
    ReportSP2005PR.ShowReportEnd;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
 end;
 finally
    Screen.Cursor:=crDefault;
    ReportSP2005PR.Free;
 end;
  VyberSuboru(X.RTF_subor,'MesVykNPP'+IntToStr(X.AktObdobie)+' files(*.XFDF)|MesVykNPP_'+IntToStr(X.AktObdobie)+'*.XFDF'+'|*.XFDF|*.XFDF');
end;end;

procedure RunReportSP2005PR_PDF(const MyReportParam: TMyReportParam);
var PC,PG,PCMAX:integer;StrPC:string;
begin with ReportSP2005PR do begin
  X:=MyReportParam;
  if X.AktObdobie >= ZAKON_2011_01 then begin
   if X.Typ='SP_PDF_PR' then RunReportSP2005PR_PDF_2011(MyReportParam)
   else if X.Typ='SP_PDF_PR/NP' then RunReportSP2005PR_PDF_2011_NP(MyReportParam);
   exit;
  end;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportSP2005PR:=TReportSP2005PR.Create(Application);
    if X.DisableShape then QRDisableShape(ReportSP2005PR);
    if X.DisableLabel then QRDisableLabel(ReportSP2005PR);
    Screen.Cursor:=crDefault;
    ReportSP2005PR.ShowReportStart_PP;
    if X.AktObdobie >= ZAKON_2011_01 then
      begin X.rtf_sablona := MyFrmPath + 'MesVykPRI_1101.pdf'; PCMAX:=6; end
    else if X.AktObdobie >= ZAKON_2009_01 then
      begin X.rtf_sablona := MyFrmPath + 'MesVykPRI_0901.pdf'; PCMAX:=6; end
    else if X.AktObdobie >= ZAKON_2008_07 then
      begin X.rtf_sablona := MyFrmPath + 'MesVykPRI_0807.pdf'; PCMAX:=6; end
    else
      begin X.rtf_sablona := MyFrmPath + 'file_ext_document_278.pdf'; PCMAX:=8; end;
    PG:=1;
    repeat
      X.rtf_subor :=  MyRepPath1 + 'MesVykPRI_'+IntToStr(X.AktObdobie)+X.AktSIdListSuffix+'_str'+IntToStr(PG)+'.xfdf';
      Rtf_Open(X);
      if X.Rtf_prepisat then
      begin
        MyXML := '';
        E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
        E_TEXT('<xfdf xmlns="http://ns.adobe.com/xfdf/" xml:space="preserve">');
        E_TAGZ('fields');
        E_XFDF('b12c96nfobdobie', ObdobieToMMRRRR(X.AktObdobie));
        if X.AktObdobie >= ZAKON_2011_01 then begin
          E_XFDF('TextFieldId_0',Q1_ICZ.Value);
        end
        else if X.AktObdobie >= ZAKON_2008_07 then begin
          E_XFDF('b12c96nfICZ',Q1_ICZ.Value);
          if DM.TINF_SP_IDENTIFIKATOR.Value = 1 then
          begin
            E_XFDF('b12c96nfChoice_23','1');
            E_XFDF('b12c96nfidentifikator',Q1_ICO.Value);
          end else begin
            E_XFDF('b12c96nfChoice_23','2');
            E_XFDF('b12c96nfidentifikator',Q1_DIC.Value);
          end;
         if X.Vykaz_Riadny='R'
          then E_XFDF('b12c96nftypReg','1')
          else E_XFDF('b12c96nftypReg','2');
        E_XFDF('b12c96nfCisStr',IntToStr(PG));
       end else if X.AktObdobie < ZAKON_2008_07 then begin
          E_XFDF('b12c96nfZamNaz',Q1_Nazov.Value);
          E_XFDF('b12c96nfZamNaz_2','');
          E_XFDF('b12c96nfZamNaz_3','');
          E_XFDF('b12c96nfick',Q1_ICZ.Value);
          E_XFDF('b12c96nfidentifikator',Q1_ICO.Value);
          E_XFDF('b12c96nfobec',Q1_ADR_Mesto.Value);
          E_XFDF('b12c96nfpsc',Q1_ADR_PSC.Value);
          E_XFDF('b12c96nfstat','');
          E_XFDF('b12c96nftypVykazu',X.Vykaz_riadny);
          E_XFDF('b12c96nfulica',Q1_ADR_ULICA.Value);
          E_XFDF('b12c96nfsupCislo_oCislo',Q1_ADR_Cislo.Value);
          E_XFDF('b12c96nftel',Q1_ADR_TELEFON.Value);
          E_XFDF('b12c96nffax',Q1_ADR_FAX.Value);
          E_XFDF('b12c96nfmail',Q1_ADR_EMAIL.Value);
          E_XFDF('b12c96nfCisStrany',IntToStr(PG));
        end;
        E_XFDF('b12c96nfcislo_kod_uctu',Q1_CALC_CISLO_UCTU.Value);
        E_XFDF('b12c96nfnazovSidloBanky',Q1_Nazov_banky.Value);
        E_XFDF('b12c96nfPocStr','1');
        {E_XFDF('b12c96nfDatVyp',X.Vykaz_dna);}
        E_XFDF('b12c96nfDatVyp',FormatDateTime('dd.mm.yyyy',X.Vykaz_dna_DT));
        E_XFDF('b12c96nfFormVyp',X.Vykaz_zostavil);
        if X.AktObdobie >= ZAKON_2008_07 then
        for pc:=1 to 6 do begin
          if pc=1 then StrPC :='' else StrPC := '_'+IntToStr(PC);
          if not Q0_.EOF then begin
            E_XFDF('b12c96nfPorCis'+StrPC,IntToStr(((PG-1)*6)+PC));
            E_XFDF('b12c96nfRC'+StrPC,Q0_CALC_Born_Numb.Value);
            E_XFDF('b12c96nfPocDni'+StrPC,Q0_CALC_dni.AsString);
            if Q0_typzec.Value = 2
             then E_XFDF('chb'+IntToStr(PC),'Yes')
             else E_XFDF('chb'+IntToStr(PC),'0');
            E_XFDF('b12c96nfVymZakNP'+StrPC,Format('%d',[Trunc(Q0_N_zaklad_np.Value)]));
            E_XFDF('b12c96nfVymZakSPaSDS'+StrPC,Format('%d',[Trunc(Q0_N_zaklad_dp.Value)]));
            E_XFDF('b12c96nfVymZakIP'+StrPC,Format('%d',[Trunc(Q0_N_zaklad_ip.Value)]));
            E_XFDF('b12c96nfVymZakPvN'+StrPC,Format('%d',[Trunc(Q0_N_zaklad_fz.Value)]));
            E_XFDF('b12c96nfVymZakUP'+StrPC,Format('%d',[Trunc(Q0_N_zaklad_up.Value)]));
            E_XFDF('b12c96nfVymZakGP'+StrPC,Format('%d',[Trunc(Q0_N_zaklad_gp.Value)]));
            E_XFDF('b12c96nfVymZakRFS'+StrPC,Format('%d',[Trunc(Q0_N_zaklad_rf.Value)]));
            // poistne za zamestnavatela
            E_XFDF('b12c96nfzamestnavatelNP'+StrPC,Format('%d',[Trunc(Q0_oz_nemoc.Value)]));
            E_XFDF('b12c96nfzamestnavatelSPaSDS'+StrPC,Format('%d',[Trunc(Q0_oz_dochod.Value)]));
            E_XFDF('b12c96nfzamestnavatelIP'+StrPC,Format('%d',[Trunc(Q0_oz_invalid.Value)]));
            E_XFDF('b12c96nfzamestnavatelPvN'+StrPC,Format('%d',[Trunc(Q0_oz_fondzam.Value)]));
            E_XFDF('b12c96nfzamestnavatelUP'+StrPC,Format('%d',[Trunc(Q0_oz_uraz.Value)]));
            E_XFDF('b12c96nfzamestnavatelGP'+StrPC,Format('%d',[Trunc(Q0_oz_garancne.Value)]));
            E_XFDF('b12c96nfzamestnavatelRFS'+StrPC,Format('%d',[Trunc(Q0_oz_rezerva.Value)]));
            // poistne za zamestnanca
            E_XFDF('b12c96nfzamestnanecNP'+StrPC,Format('%d',[Trunc(Q0_o_nemoc.Value)]));
            E_XFDF('b12c96nfzamestnanecSPaSSD'+StrPC,Format('%d',[Trunc(Q0_o_dochod.Value)]));
            E_XFDF('b12c96nfzamestnanecIP'+StrPC,Format('%d',[Trunc(Q0_o_invalid.Value)]));
            E_XFDF('b12c96nfzamestnanecPvN'+StrPC,Format('%d',[Trunc(Q0_o_fondzam.Value)]));
            if X.AktObdobie >= ZAKON_2009_01 then begin
              E_XFDF('b12c96nfDesatina_0'+StrPC,Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_N_zaklad_np.Value)*100,0,1))]));
              E_XFDF('b12c96nfDesatina_1'+StrPC,Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_N_zaklad_dp.Value)*100,0,1))]));
              E_XFDF('b12c96nfDesatina_2'+StrPC,Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_N_zaklad_ip.Value)*100,0,1))]));
              E_XFDF('b12c96nfDesatina_3'+StrPC,Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_N_zaklad_fz.Value)*100,0,1))]));
              E_XFDF('b12c96nfDesatina_4'+StrPC,Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_N_zaklad_up.Value)*100,0,1))]));
              E_XFDF('b12c96nfDesatina_5'+StrPC,Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_N_zaklad_gp.Value)*100,0,1))]));
              E_XFDF('b12c96nfDesatina_6'+StrPC,Format('%.2d',[Trunc(ZAOKRUHLI(Frac(Q0_N_zaklad_rf.Value)*100,0,1))]));
              // poistne za zamestnavatela
              E_XFDF('b12c96nfDesatina_7'+StrPC,Format('%d',[Trunc(ZAOKRUHLI(Frac(Q0_oz_nemoc.Value)*10,0,1))]));
              E_XFDF('b12c96nfDesatina_8'+StrPC,Format('%d',[Trunc(ZAOKRUHLI(Frac(Q0_oz_dochod.Value)*10,0,1))]));
              E_XFDF('b12c96nfDesatina_9'+StrPC,Format('%d',[Trunc(ZAOKRUHLI(Frac(Q0_oz_invalid.Value)*10,0,1))]));
              E_XFDF('b12c96nfDesatina_10'+StrPC,Format('%d',[Trunc(ZAOKRUHLI(Frac(Q0_oz_fondzam.Value)*10,0,1))]));
              E_XFDF('b12c96nfDesatina_11'+StrPC,Format('%d',[Trunc(ZAOKRUHLI(Frac(Q0_oz_uraz.Value)*10,0,1))]));
              E_XFDF('b12c96nfDesatina_12'+StrPC,Format('%d',[Trunc(ZAOKRUHLI(Frac(Q0_oz_garancne.Value)*10,0,1))]));
              E_XFDF('b12c96nfDesatina_13'+StrPC,Format('%d',[Trunc(ZAOKRUHLI(Frac(Q0_oz_rezerva.Value)*10,0,1))]));
              // poistne za zamestnanca
              E_XFDF('b12c96nfDesatina_14'+StrPC,Format('%d',[Trunc(ZAOKRUHLI(Frac(Q0_o_nemoc.Value)*10,0,1))]));
              E_XFDF('b12c96nfDesatina_15'+StrPC,Format('%d',[Trunc(ZAOKRUHLI(Frac(Q0_o_dochod.Value)*10,0,1))]));
              E_XFDF('b12c96nfDesatina_16'+StrPC,Format('%d',[Trunc(ZAOKRUHLI(Frac(Q0_o_invalid.Value)*10,0,1))]));
              E_XFDF('b12c96nfDesatina_17'+StrPC,Format('%d',[Trunc(ZAOKRUHLI(Frac(Q0_o_fondzam.Value)*10,0,1))]));
            end;
            Q0_.Next;
          end;
        end else
        for pc:=0 to 7 do begin
          if not Q0_.EOF then begin
            E_XFDF('b12c96nfFOPorCis.0.'+IntToStr(PC),IntToStr(((PG-1)*8)+PC+1));
            E_XFDF('b12c96nfFORC.0.'+IntToStr(PC),Q0_CALC_Born_Numb.Value);
            E_XFDF('b12c96nfVymZakNP.0.'+IntToStr(PC),Format('%0.0f',[Q0_N_zaklad_np.Value]));
            E_XFDF('b12c96nfVymZakSP.0.'+IntToStr(PC),Format('%0.0f',[Q0_N_zaklad_dp.Value]));
            E_XFDF('b12c96nfVymZakUP.0.'+IntToStr(PC),Format('%0.0f',[Q0_N_zaklad_up.Value]));
            // nastavenie buttonov
            if not (Q0_U_fondzam.Value in PoiPlatiZam)
              then E_XFDF('b12c96nfPvNneplati.0.'+IntToStr(PC),'PvN');
            if not (Q0_U_invalid.Value in PoiPlatiZam)
              then E_XFDF('b12c96nfIPneplaticb.0.'+IntToStr(PC),'IP');
            if not (Q0_U_nemoc.Value in PoiPlatiZam)
              then E_XFDF('b12c96nfNPneplaticb.0.'+IntToStr(PC),'NP');
            E_XFDF('b12c96nfFOPocDni.0.'+IntToStr(PC),Q0_CALC_dni.AsString);
            E_XFDF('b12c96nfZamNP.0.'+IntToStr(PC),Format('%0.0f',[Q0_oz_nemoc.Value]));
            E_XFDF('b12c96nfZamSP.0.'+IntToStr(PC),Format('%0.0f',[Q0_oz_dochod.Value]));
            E_XFDF('b12c96nfZamIP.0.'+IntToStr(PC),Format('%0.0f',[Q0_oz_invalid.Value]));
            E_XFDF('b12c96nfZamPvN.0.'+IntToStr(PC),Format('%0.0f',[Q0_oz_fondzam.Value]));
            E_XFDF('b12c96nfZamUP.0.'+IntToStr(PC),Format('%0.0f',[Q0_oz_uraz.Value]));
            E_XFDF('b12c96nfFONP.0.'+IntToStr(PC),Format('%0.0f',[Q0_o_nemoc.Value]));
            E_XFDF('b12c96nfFOSP.0.'+IntToStr(PC),Format('%0.0f',[Q0_o_dochod.Value]));
            E_XFDF('b12c96nfFOIP.0.'+IntToStr(PC),Format('%0.0f',[Q0_o_invalid.Value]));
            E_XFDF('b12c96nfFOPvN.0.'+IntToStr(PC),Format('%0.0f',[Q0_o_fondzam.Value]));
            Q0_.Next;
          end;
        end;
        E_TAGK('fields');
        E_ATTRZ('href',X.rtf_sablona);
        E_TAGA('f',MyAttr);
        E_TAGK('xfdf');
        Rtf_Uloz_XML(X);
      end;
      INC(PG);
    until Q0_.EOF;
    ReportSP2005PR.ShowReportEnd;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
 end;
 finally
    Screen.Cursor:=crDefault;
    ReportSP2005PR.Free;
 end;
  VyberSuboru(X.RTF_subor,'MesVykPri'+IntToStr(X.AktObdobie)+' files(*.XFDF)|MesVykPRI_'+IntToStr(X.AktObdobie)+'*.XFDF'+'|*.XFDF|*.XFDF');
end;end;


procedure TReportSP2005PR.Q1_CalcFields(DataSet: TDataSet);
var s:string;
begin
  Q1_CALC_FIRMA.Value := 'FIRMA: '+X.AktFirmaStr;

  s:=IntToStr(X.AktObdobie);
  Q1_CALC_OBDOBIE.Value:=
    'za mesiac  '+Copy(s,5,2)+' / '+Copy(s,1,4);
  Q1_CALC_CISLO_UCTU.Value:=
    LongCisloU(Q1_predcislo_u.Value,Q1_cislo_u.Value)+' / '+
    Q1_banka_u.Value;
end;

procedure TReportSP2005PR.Q2_CalcFields(DataSet: TDataSet);
var s,rozsahSP:string;
begin
  Q2_CALC_MESIAC.Value:=
    LPAD(IntToStr(MyMesiac(Q2_V_Obdobie.Value)),2,'0')+' / '+
    IntToStr(MyRok(Q2_V_Obdobie.Value));

  Q2_CALC_MPT.Value:=COPY(
    Trim(Q2_Name.Value)+' '+
    Trim(Q2_Surname.Value)+' '+
    Trim(Q2_Title.Value),
    1,100);

  rozsahSP:='';
  if Q2_N_zaklad_np.Value > 0 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q2_N_zaklad_dp.Value > 0 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q2_N_zaklad_ip.Value > 0 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q2_N_zaklad_fz.Value > 0 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q2_N_zaklad_up.Value > 0 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q2_N_zaklad_gp.Value > 0 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  if Q2_N_zaklad_rf.Value > 0 then rozsahSP:=rozsahSP+'1' else rozsahSP:=rozsahSP+'0';
  Q2_CALC_ROZSAH_SP.Value := rozsahSP;

  if (Q2_Kal_dni.Value = 0) and (Q2_typzec.Value=2)
   then Q2_CALC_DNI.Value := KAL_DNI(X.AktObdobie)
    else Q2_CALC_DNI.Value := Q2_Kal_dni.Value;

  s:=Q2_Born_Numb.Value;
  while Pos('/',s)<>0 do Delete(s,Pos('/',s),1);
  while Pos(' ',s)<>0 do Delete(s,Pos(' ',s),1);
  Q2_CALC_Born_Numb.Value := s;
end;



end.
