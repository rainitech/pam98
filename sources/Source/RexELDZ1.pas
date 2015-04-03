unit RexELDZ1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportELDZ1 = class(TQuickRep)
    GroupFooterBand1: TQRBand;
    Q0_: TQuery;
    Q0_CALC_MPT: TStringField;
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRShape14: TQRShape;
    QRShape17: TQRShape;
    QRShape31: TQRShape;
    QRShape45: TQRShape;
    QRDBText47: TQRDBText;
    QRSysData1: TQRSysData;
    QRShape12: TQRShape;
    QRShape38: TQRShape;
    QRLabel1: TQRLabel;
    QRShape6: TQRShape;
    QRLabel5: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRLabel47: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel46: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    Q0_surname: TStringField;
    Q0_name: TStringField;
    Q0_title: TStringField;
    Q0_code_emp: TIntegerField;
    QRShape1: TQRShape;
    Q0_CALC_FIRMA: TStringField;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    Q1_: TQuery;
    QRSubDetail1: TQRSubDetail;
    QRDBText7: TQRDBText;
    Q1_v_rok: TSmallintField;
    Q1_n_brutto: TCurrencyField;
    QRDBText8: TQRDBText;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    Q0_nastup: TDateField;
    Q0_vystup: TDateField;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    Q1_n_zaklad_np: TCurrencyField;
    Q1_v_den: TFloatField;
    Q1_CALC_dni: TWordField;
    QRShape15: TQRShape;
    QRDBText4: TQRDBText;
    QRShape16: TQRShape;
    QRDBText5: TQRDBText;
    Q1_code_emp: TIntegerField;
    QRShape2: TQRShape;
    QRDBText6: TQRDBText;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    Q1_n_zaklad_dp: TCurrencyField;
    procedure Q0_CalcFields(DataSet: TDataSet);
    procedure Q1_CalcFields(DataSet: TDataSet);
    procedure Q0_AfterScroll(DataSet: TDataSet);
    procedure Q0_AfterOpen(DataSet: TDataSet);
  private

  public
    procedure ShowReport;

  end;

  TVypocetDovolenky = record
    narok_minuly:double;
    narok_sucasny:integer;
    vycerpana:integer;
    zostava_minula:integer;
    zostava_sucasna:integer;
  end;

var
  ReportELDZ1: TReportELDZ1;

procedure RunReportELDZ1(const MyReportParam: TMyReportParam);
procedure RunReportELDP_PDF(const MyReportParam: TMyReportParam);

implementation

uses Dm_zam, Dm_main;

{$R *.DFM}

var X: TMyReportParam;

procedure TReportELDZ1.ShowReport;
begin
  QRLabel47.Caption := 'Údaje k evid.listu na dôch.zab.ku koncu mesiaca ' +
     X.AktObdobieStrT;
  Q1_.Close;
  Q0_.Close;
  Q0_.ParamByName('P1').AsInteger := X.Code_emp1;
  Q0_.ParamByName('P2').AsInteger := X.Code_emp2;
  Q0_.ParamByName('P3').AsInteger := X.AktMinSid;
  Q0_.ParamByName('P4').AsInteger := X.AktMaxSid;
{  Q1_.ParamByName('V_OBDOBIE1').AsInteger := 1995;}
  Q1_.ParamByName('V_OBDOBIE2').AsInteger := X.AktObdobie;
  Q0_.Open;
  Q1_.Open;
  Preview;
  Q1_.Close;
  Q0_.Close;
end;


procedure TReportELDZ1.Q0_CalcFields(DataSet: TDataSet);
begin
  Q0_CALC_FIRMA.value := X.AktFirmaStr;

  Q0_CALC_MPT.Value:=COPY(
    Trim(Q0_Name.Value)+' '+
    Trim(Q0_Surname.Value)+' '+
    Trim(Q0_Title.Value),
    1,100);
end;

procedure RunReportELDZ1(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportELDZ1:=TReportELDZ1.Create(Application);
    if X.DisableShape then QRDisableShape(ReportELDZ1);
    if X.DisableLabel then QRDisableLabel(ReportELDZ1);
    Screen.Cursor:=crDefault;
    ReportELDZ1.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
   Screen.Cursor:=crDefault;
   ReportELDZ1.Free;
  end;
end;

procedure TReportELDZ1.Q1_CalcFields(DataSet: TDataSet);
var
  Y1,M1,D1: Word;
  Y2,M2,D2: Word;
  Y3,M3,D3: Word; {nastup}
  Y4,M4,D4: Word; {vystup}
  Y5,M5,D5: Word; {aktualny datum}
  Dat1,Dat2,Dat5: TDate;
  i:integer;
begin
  Y1:=Q1_V_rok.Value;
  Y2:=Y1;
  M1:=1;
  D1:=1;
  M2:=12;
  D2:=31;
  Dat2 := EncodeDate(Y2,M2,D2);
  if Q0_Nastup.AsString<>'' then
  begin
      DecodeDate(Q0_Nastup.Value, Y3, M3, D3);
      if Y3=Y1 then begin
        M1:=M3;
        D1:=D3;
      end;
  end;
  Y4:=0;
  if Q0_Vystup.AsString<>'' then
  begin
      DecodeDate(Q0_Vystup.Value, Y4, M4, D4);
      if Y4=Y2 then begin
        M2:=M4;
        D2:=D4;
        Dat2 := EncodeDate(Y2,M2,D2);
      end;
  end;
  if Y2=MyRok(X.AktObdobie) then 
  begin
    Y5:=Y2;
    M5:=MyMesiac(X.AktObdobie);
    for i:=31 downto 28 do
    try
      D5:=i;
      Dat5 := EncodeDate(Y5,M5,D5);
      if Dat5<Dat2 then Dat2:=Dat5;
      break;
    except
    end;
  end;
  Dat1 := EncodeDate(Y1,M1,D1);
  if Dat2<Dat1 then Dat2:=Dat1;
  Q1_CALC_DNI.Value := Trunc(Dat2 - Dat1 + 1);
end;

procedure TReportELDZ1.Q0_AfterScroll(DataSet: TDataSet);
begin
  Q1_.Filtered:=False;
  Q1_.Filter:= 'code_emp='+IntToStr(Q0_code_emp.Value);
  Q1_.Filtered:=True;
end;

procedure TReportELDZ1.Q0_AfterOpen(DataSet: TDataSet);
begin
  Q1_.Filter:= 'code_emp='+IntToStr(Q0_code_emp.Value);
  Q1_.Filtered:=True;
end;

procedure RunReportELDP_PDF(const MyReportParam: TMyReportParam);
var pc:integer;
    oUlica,orCislo,supCislo:string;
function ADD_PC(iText:string):string;
begin
  if pc<=1 then Result:=iText
  else Result:=iText+'_'+IntToStr(pc);
end;
function ADD_PX(iText:string):string;
begin
  Result:=iText+'_'+IntToStr(pc);
end;
begin with DM,DMZ do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
    X.rtf_sablona := MyFrmPath + 'eldp_form_1.5.pdf';
    X.rtf_subor :=  MyRepPath1 + 'ELDP_'+
                    RC_BEZ(TZAM_Born_numb.Value)+'_'
                 + TZAM_Surname.Value +'_' + TZAM_Name.Value + '.xfdf';
    Rtf_Open(X);
    if X.Rtf_prepisat then
    begin
      MyXML := '';
      E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
      E_TEXT('<xfdf xmlns="http://ns.adobe.com/xfdf/" xml:space="preserve">');
      E_TAGZ('fields');
      TELDP_.First;
      pc:=1;
      while not TELDP_.EOF do
      begin
        E_XFDF(ADD_PC('b12c96nfod_poist_den'), FormatDateTime('dd',TELDP_Datum_od.Value));
        E_XFDF(ADD_PC('b12c96nfdo_poist_den'), FormatDateTime('dd',TELDP_Datum_do.Value));
        E_XFDF(ADD_PC('b12c96nfod_poist_mes'), FormatDateTime('mm',TELDP_Datum_od.Value));
        E_XFDF(ADD_PC('b12c96nfdo_poist_mes'), FormatDateTime('mm',TELDP_Datum_do.Value));
        //E_XFDF(ADD_PC('b12c96nfkal_rok'),      FormatDateTime('yyyy',TELDP_Datum_od.Value));
        E_XFDF(ADD_PX('rok'),                  FormatDateTime('yyyy',TELDP_Datum_od.Value));
        //E_XFDF(ADD_PC('b12c96nfznak_poist'),   TELDP_Znak.Value);
        E_XFDF(ADD_PC('b12c96nfznak_poist'),   TELDP_Znak.Value);
        E_XFDF(ADD_PC('b12c96nfkal_dni_vd'),   MyFormatField('%d',TELDP_Vyluka_dni));
        if FormatDateTime('yyyy',TELDP_Datum_od.Value)>='2009' then begin
          E_XFDF(ADD_PX('b12c96nfvz_poist'),     Format('%0.2f',[TELDP_VZ.Value]));
          E_XFDF(ADD_PX('b12c96nfvz_vd_poist'),  MyFormatField('%0.2f',TELDP_Vyluka_VZ));
        end else begin
          E_XFDF(ADD_PX('b12c96nfvz_poist'),     Format('%0.0f',[TELDP_VZ.Value]));
          E_XFDF(ADD_PX('b12c96nfvz_vd_poist'),  MyFormatField('%0.0f',TELDP_Vyluka_VZ));
        end;
        TELDP_.Next;
        inc(pc);
      end;
      E_XFDF('b12c96nfcorrection_report','');
      E_XFDF('b12c96nfdate_send',FormatDateTime('ddmmyyyy',X.Vykaz_dna_DT));
      E_XFDF('b12c96nfjob_start_date',FormatDateTime('ddmmyyyy',TZAM_Nastup.Value));
      E_XFDF('b12c96nfjob_end_date',FormatDateTime('ddmmyyyy',TZAM_Vystup.Value));
{      E_XFDF('b12c96nfemployer_number_type','0');}
      E_XFDF('b12c96nfemployer_number',TINF_ICO.Value);
      E_XFDF('b12c96nfemployer_name',TINF_NAZOV.Value);
      E_XFDF('b12c96nfemployer_name_2','');
      E_XFDF('b12c96nfemployer_street',TINF_ADR_ULICA.Value);
      E_XFDF('b12c96nfeployer_street_number',TINF_ADR_Cislo.Value);
      E_XFDF('b12c96nfemplyer_zip',TINF_ADR_PSC.Value);
      E_XFDF('b12c96nfemployer_city',TINF_ADR_MESTO.Value);
      {zamestnanec}
      E_XFDF('b12c96nfemplyoee_title',TZAM_title.Value);
      E_XFDF('b12c96nfemployee_name',TZAM_name.Value);
      E_XFDF('b12c96nfemployee_surname',TZAM_Surname.Value);
      E_XFDF('b12c96nfemployee_surname_2',NVL1(TZAM_Prev_name.Value,TZAM_Surname.Value));
      E_XFDF('b12c96nfemployee_surname_3',NVL1(TZAM_Prev_name.Value,TZAM_Surname.Value));
      E_XFDF('b12c96nfemployee_birthplace',TZAM_Born_city.Value);
      E_XFDF('b12c96nfemployee_birthnumber',TZAM_Born_numb.Value);
      E_XFDF('b12c96nfemployee_birthdate',FormatDateTime('ddmmyyyy',TZAM_Born_date.Value));
      E_XFDF('b12c96nfemployee_zip',TZAM_tp_zip.Value);
      MyRozdelUlicuExt(TZAM_tp_street.Value,oUlica,orCislo,supCislo);
      E_XFDF('b12c96nfemployee_street',oUlica);
      E_XFDF('b12c96nfemployee_street_number',orCislo);
      E_XFDF('b12c96nfemployee_city',TZAM_tp_city.Value);
      E_TAGK('fields');
      E_ATTRZ('href',X.rtf_sablona);
      E_TAGA('f',MyAttr);
      E_TAGK('xfdf');
      Rtf_Uloz_XML(X);
    end;
  finally
    Screen.Cursor:=crDefault;
  end;
  Rtf_zobraz(X);
end;end;

end.
