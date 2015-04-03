unit RexSpXml;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick, UnicodeUtils;

procedure RunReportSpXml(const MyReportParam: TMyReportParam);
procedure RunReportVppXml(const MyReportParam: TMyReportParam);
procedure VytvorConfSubor(iFPath,iFNameXML,iFNameConf:string);

implementation

uses DM_MAIN, REXSP1, REXSP1P, SP2005VY, SP2005PR;

var X: TMyReportParam;
 FNameXml: string;
 FPathXml: string;
 F:TextFile;

function VytvorXml_do20060731:AnsiString;
var pc:integer;
    Year, Month, Day: Word;
begin with DM do begin
  pc:=0;
  MyXML := '';
  E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
  E_TEXT('<!-- Vytvorene: dna '+DateToStr(Now)+' -->');
  E_TEXT('<spVykazPoistneho xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="SPVykazPoist_EZU_v2.4.1.xsd">');
  E_TAG('typDoc','MVP00001');
  E_TAG('obdobie',LPAD(IntToStr(X.Obdobie1 mod 100),2,'0')+IntToStr(X.Obdobie1 div 100));
  E_TAG('typVykazu',X.Vykaz_riadny);
  E_TAGZ('zamestnavatel');
  E_TAGZ('identifikacia');
  E_TAG('ick',TINF_ICZ.Value);
  E_TAGZ('identifikator');
  E_TAG('ico',TINF_ICO.Value);
  E_TAGK('identifikator');
  E_TAG('nazov',TINF_NAZOV.Value);
  E_TAGK('identifikacia');
  E_TAGZ('sidlo');
  E_TAG('ulica',TINF_ADR_ULICA.Value);
  E_TAG('oCislo',TINF_ADR_CISLO.Value);
  E_TAG('psc',TINF_ADR_PSC.Value);
  E_TAG('obec',TINF_ADR_MESTO.Value);
  E_TAG('tel',TINF_ADR_TELEFON.Value);
  E_TAG('fax',TINF_ADR_FAX.Value);
  E_TAG('mail',TINF_ADR_EMAIL.Value);
  E_TAG('stat','Slovenská republika');
  E_TAGK('sidlo');
  E_TAGZ('ucet');
  E_TAG('nazovSidloBanky',TINF_NAZOV_BANKY.Value);
  E_TAG('kodBanky',TINF_BANKA_U.Value);
  E_TAG('cisloUctu',LongCisloU(TINF_Predcislo_u.Value,TINF_Cislo_u.Value));
  E_TAGK('ucet');
  E_TAGK('zamestnavatel');
  {--}
  E_TAGZ('poistne');
  try
  ReportSP1:=TReportSP1.Create(Application);
  ReportSP1.SetX(X);
  ReportSP1.Q1_.Close;
  ReportSP1.Q0_.Close;
  ReportSP1.Q0_.Open;
  ReportSP1.Q1_.Open;

  E_TAGZ('np');
  E_TAG('pocZamNP',Format('%0.0f',[MyOdvody[0].p_nemoc]));
  E_TAG('npZamtel',Format('%0.0f',[MyOdvody[0].z_nemoc]));
  E_TAG('npZamnec',Format('%0.0f',[MyOdvody[0].o_nemoc]));
  E_TAGK('np');

  E_TAGZ('sp');
  E_TAG('pocZamSP',Format('%0.0f',[MyOdvody[0].p_dochod]));
  E_TAG('spZamtel',Format('%0.0f',[MyOdvody[0].z_dochod]));
  E_TAG('spZamnec',Format('%0.0f',[MyOdvody[0].o_dochod]));
  E_TAGK('sp');

  E_TAGZ('ip');
  E_TAG('pocZamIP',Format('%0.0f',[MyOdvody[0].p_invalid]));
  E_TAG('ipZamtel',Format('%0.0f',[MyOdvody[0].z_invalid]));
  E_TAG('ipZamnec',Format('%0.0f',[MyOdvody[0].o_invalid]));
  E_TAGK('ip');

  E_TAGZ('pvn');
  E_TAG('pocZamPvN',Format('%0.0f',[MyOdvody[0].p_fondzam]));
  E_TAG('pvnZamtel',Format('%0.0f',[MyOdvody[0].z_fondzam]));
  E_TAG('pvnZamnec',Format('%0.0f',[MyOdvody[0].o_fondzam]));
  E_TAGK('pvn');

  E_TAGZ('up');
  E_TAG('pocZamUP',Format('%0.0f',[MyOdvody[0].p_uraz]));
  E_TAG('upZamtel',Format('%0.0f',[MyOdvody[0].z_uraz]));
  E_TAGK('up');

  E_TAGZ('gp');
  E_TAG('pocZamGP',Format('%0.0f',[MyOdvody[0].p_garancne]));
  E_TAG('gpZamtel',Format('%0.0f',[MyOdvody[0].z_garancne]));
  E_TAGK('gp');

  E_TAGZ('pdRf');
  E_TAG('pocZamPdRF',Format('%0.0f',[MyOdvody[0].p_rezerva]));
  E_TAG('pdRfZamtel',Format('%0.0f',[MyOdvody[0].z_rezerva]));
  E_TAGK('pdRf');

  E_TAG('spoluPoistne',Format('%0.0f',[MyOdvody[0].p_spolu]));

  E_TAGK('poistne');

  {-- davkyNP }
  E_TAGZ('davkyNP');

  E_TAGZ('nemocenske');
  E_TAG('suma',Format('%0.0f',[MyOdvody[0].vy_pn]));
  E_TAG('pocetPripadov',Format('%0.0f',[MyOdvody[0].pp_pn]));
  E_TAG('pocetDni',Format('%0.0f',[MyOdvody[0].pd_pn]));
  E_TAG('pocetZamncov',Format('%0.0f',[MyOdvody[0].pz_pn]));
  E_TAGK('nemocenske');

  E_TAGZ('osetrovne');                                                ;

  E_TAG('suma',Format('%0.0f',[MyOdvody[0].vy_ocr]));
  E_TAG('pocetPripadov',Format('%0.0f',[MyOdvody[0].pp_ocr]));
  E_TAG('pocetDni',Format('%0.0f',[MyOdvody[0].pd_ocr]));
  E_TAG('pocetZamncov',Format('%0.0f',[MyOdvody[0].pz_ocr]));
  E_TAGK('osetrovne');

  E_TAGZ('materske');
  E_TAG('suma',Format('%0.0f',[MyOdvody[0].vy_materska]));
  E_TAG('pocetPripadov',Format('%0.0f',[MyOdvody[0].pp_materska]));
  E_TAG('pocetDni',Format('%0.0f',[MyOdvody[0].pd_materska]));
  E_TAG('pocetZamncov',Format('%0.0f',[MyOdvody[0].pz_materska]));
  E_TAGK('materske');

  E_TAGZ('vyrovnavaciaDavka');
  E_TAG('suma',Format('%0.0f',[MyOdvody[0].vy_vyrovdav]));
  E_TAG('pocetPripadov',Format('%0.0f',[MyOdvody[0].pp_vyrovdav]));
  E_TAG('pocetDni',Format('%0.0f',[MyOdvody[0].pd_vyrovdav]));
  E_TAG('pocetZamncov',Format('%0.0f',[MyOdvody[0].pz_vyrovdav]));
  E_TAGK('vyrovnavaciaDavka');

  E_TAG('spoluDavkyNP',Format('%0.0f',[MyOdvody[0].d_spolu]));

  E_TAGK('davkyNP');

  E_TAG('rozdielPoistneDavky',Format('%0.0f',[MyOdvody[0].r_spolu]));

  ReportSP1.Q0_.Close;
  ReportSP1.Q1_.Close;
  finally
  ReportSP1.Free;
  end;
  {--}
  E_TAGZ('vystavenie');
  E_TAG('zostavil',X.Vykaz_zostavil);
  DecodeDate(now, Year, Month, Day);
  E_TAG('datum',IntToStr(Year)+'-'
                +LPAD(IntToStr(Month),2,'0')+'-'
                +LPAD(IntToStr(Day),2,'0'));
  E_TAGK('vystavenie');
  {--}
  E_TAGZ('priloha');
  E_TAGZ('poistneZamestnancov');
  {--}
  try
  ReportSP1P:=TReportSP1P.Create(Application);
  ReportSP1P.SetX(X);
  ReportSP1P.T0_.Close;
  ReportSP1P.Q0_.Close;
  ReportSP1P.Q0_.ParamByName('P1').AsInteger := X.AktObdobie;
  ReportSP1P.Q0_.ParamByName('P2').AsInteger := X.AktMinSid;
  ReportSP1P.Q0_.ParamByName('P3').AsInteger := X.AktMaxSid;
  ReportSP1P.Q0_.Open;
  ReportSP1P.T0_.Open;
  while not ReportSP1P.Q0_.EOF do
  begin
    Inc(pc);
    E_ATTRZ('pc',IntToStr(pc));
    E_ATTR('rc',ReportSP1P.Q0_Calc_Born_numb.Value);
    E_ATTR('pocDeti',ReportSP1P.Q0_Poc_nezaop_deti.AsString);
    E_ATTR('pocDni',ReportSP1P.Q0_V_dni.AsString);
    E_ATTR('vynimkaVZ',ReportSP1P.Q0_Vynimka_vz.Value);
    if ReportSP1P.Q0_U_invalid.Value = 0
     then E_ATTR('ipNeplati','1')
      else E_ATTR('ipNeplati','0');
    E_ATTR('vzNpGp',IntToStr(ReportSP1P.Q0_N_zaklad_np.AsInteger));
    E_ATTR('vzSpIpPvnPdrf',IntToStr(ReportSP1P.Q0_N_zaklad_dp.AsInteger));
    E_ATTR('vzUp',IntToStr(ReportSP1P.Q0_N_zaklad_up.AsInteger));
    E_ATTR('npZamtel',IntToStr(ReportSP1P.Q0_oz_nemoc.AsInteger));
    E_ATTR('npZamnec',IntToStr(ReportSP1P.Q0_o_nemoc.AsInteger));
    E_ATTR('spZamtel',IntToStr(ReportSP1P.Q0_oz_dochod.AsInteger));
    E_ATTR('spZamnec',IntToStr(ReportSP1P.Q0_o_dochod.AsInteger));
    E_ATTR('ipZamtel',IntToStr(ReportSP1P.Q0_oz_invalid.AsInteger));
    E_ATTR('ipZamnec',IntToStr(ReportSP1P.Q0_o_invalid.AsInteger));
    E_ATTR('pvnZamtel',IntToStr(ReportSP1P.Q0_oz_fondzam.AsInteger));
    E_ATTR('pvnZamnec',IntToStr(ReportSP1P.Q0_o_fondzam.AsInteger));
    E_ATTR('upZamtel',IntToStr(ReportSP1P.Q0_oz_uraz.AsInteger));
    E_TAGA('poistneZamestnanca',MyAttr);
    ReportSP1P.Q0_.Next;
  end;
  ReportSP1P.T0_.Close;
  ReportSP1P.Q0_.Close;
  finally
  ReportSP1P.Free;
  end;
  E_TAGK('poistneZamestnancov');
  E_TAGK('priloha');
  E_TAGK('spVykazPoistneho');
  Result := MyXml;
end;end; {VytvorXml_do20060731}

function VytvorXml_od20060801:AnsiString;
var pc:integer;
    Year, Month, Day: Word;
    U1,U2,U3: string;
begin with DM do begin
  pc:=0;
  MyXML := '';
  E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
  E_TEXT('<!-- Vytvorene: dna '+DateToStr(Now)+' -->');
  E_TEXT('<spVykazPoistneho xmlns="http://socpoist.sk/xsd/mvp25" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://socpoist.sk/xsd/mvp25 SPVykazPoist-v2.5.xsd">');
  E_TAG('typDoc','MVP00001');
  E_TAG('obdobie',LPAD(IntToStr(X.Obdobie1 mod 100),2,'0')+IntToStr(X.Obdobie1 div 100));
  E_TAG('typVykazu',X.Vykaz_riadny);
  E_TAGZ('zamestnavatel');
  E_TAGZ('identifikacia');
  E_TAG('icz',TINF_ICZ.Value);
  E_TAGZ('identifikator');
  if TINF_SP_IDENTIFIKATOR.Value = 1 {1=ICO,2=DIC}
  then E_TAG('ico',TINF_ICO.Value)
  else E_TAG('dic',TINF_DIC.Value);
  E_TAGK('identifikator');
  E_TAG('nazov',TINF_NAZOV.Value);
  E_TAGK('identifikacia');
  E_TAGZ('korAdresa');
  E_TAGZ('adresa');
  MyRozdelUlicuExt(TINF_ADR_Ulica1.Value,U1,U2,U3);
  if U1<>'' then
  begin
    E_TAG('ulica',U1);
    if U3<>'' then
      E_TAG('supCislo',U3);
    E_TAG('oCislo',U2);
  end else
  begin
    E_TAG('supCislo',U2);
  end;
  E_TAG('obec',TINF_ADR_MESTO.Value);
  E_TAG('psc',TINF_ADR_PSC.Value);
  E_TAG('stat',TINF_L_ADR_STAT_AAA.Value);
  E_TAGK('adresa');
  E_TAG('tel',TINF_ADR_TELEFON.Value);
  E_TAG('fax',TINF_ADR_FAX.Value);
  E_TAG('mail',TINF_ADR_EMAIL.Value);
  E_TAGK('korAdresa');
  E_TAGZ('ucet');
  E_TAG('nazovSidloBanky',TINF_NAZOV_BANKY.Value);
  E_TAG('kodBanky',TINF_BANKA_U.Value);
  E_TAG('cisloUctu',LongCisloU(TINF_Predcislo_u.Value,TINF_Cislo_u.Value));
  E_TAGK('ucet');
  E_TAGK('zamestnavatel');
  {--}
  E_TAGZ('poistne');
  try
  ReportSP2005VY:=TReportSP2005VY.Create(Application);
  ReportSP2005VY.SetX(X);
  ReportSP2005VY.ShowReportStart;

  E_TAGZ('np');
  E_TAG('pocZamNP',Format('%0.0f',[MyOdvody[0].p_nemoc]));
  E_TAG('npZamtel',Format('%0.0f',[MyOdvody[0].z_nemoc]));
  E_TAG('npZamnec',Format('%0.0f',[MyOdvody[0].o_nemoc]));
  E_TAGK('np');

  E_TAGZ('sp');
  E_TAG('pocZamSP',Format('%0.0f',[MyOdvody[0].p_dochod]));
  E_TAG('spZamtel',Format('%0.0f',[MyOdvody[0].z_dochod]));
  E_TAG('spZamnec',Format('%0.0f',[MyOdvody[0].o_dochod]));
  E_TAGK('sp');

  E_TAGZ('ip');
  E_TAG('pocZamIP',Format('%0.0f',[MyOdvody[0].p_invalid]));
  E_TAG('ipZamtel',Format('%0.0f',[MyOdvody[0].z_invalid]));
  E_TAG('ipZamnec',Format('%0.0f',[MyOdvody[0].o_invalid]));
  E_TAGK('ip');

  E_TAGZ('pvn');
  E_TAG('pocZamPvN',Format('%0.0f',[MyOdvody[0].p_fondzam]));
  E_TAG('pvnZamtel',Format('%0.0f',[MyOdvody[0].z_fondzam]));
  E_TAG('pvnZamnec',Format('%0.0f',[MyOdvody[0].o_fondzam]));
  E_TAGK('pvn');

  E_TAGZ('up');
  E_TAG('pocZamUP',Format('%0.0f',[MyOdvody[0].p_uraz]));
  E_TAG('upZamtel',Format('%0.0f',[MyOdvody[0].z_uraz]));
  E_TAGK('up');

  E_TAGZ('gp');
  E_TAG('pocZamGP',Format('%0.0f',[MyOdvody[0].p_garancne]));
  E_TAG('gpZamtel',Format('%0.0f',[MyOdvody[0].z_garancne]));
  E_TAGK('gp');

  E_TAGZ('rfs');
  E_TAG('pocZamRfs',Format('%0.0f',[MyOdvody[0].p_rezerva]));
  E_TAG('rfsZamtel',Format('%0.0f',[MyOdvody[0].z_rezerva]));
  E_TAGK('rfs');

  E_TAG('spoluPoistne',Format('%0.0f',[MyOdvody[0].p_spolu]));

  E_TAGK('poistne');
  ReportSP2005VY.ShowReportEnd;
  finally
  ReportSP2005VY.Free;
  end;
  {--}
  E_TAGZ('vystavenie');
  E_TAG('zostavil',X.Vykaz_zostavil);
  DecodeDate(now, Year, Month, Day);
  E_TAG('datum',LPAD(IntToStr(Day),2,'0')+'.'
                +LPAD(IntToStr(Month),2,'0')+'.'
                +IntToStr(Year));
  E_TAGK('vystavenie');
  {--}
  E_TAGZ('priloha');
  E_TAGZ('poistneZamestnancov');
  {--}
  try
  ReportSP2005PR:=TReportSP2005PR.Create(Application);
  ReportSP2005PR.SetX(X);
  ReportSP2005PR.ShowReportStart_PP;
  while not ReportSP2005PR.Q0_.EOF do
  begin
    Inc(pc);
    E_ATTRZ('pc',IntToStr(pc));
    E_ATTR('rc',ReportSP2005PR.Q0_Calc_Born_numb.Value);
    E_ATTR('pocDni',ReportSP2005PR.Q0_CALC_dni.AsString);
    E_ATTR('vynimkaVZ',ReportSP2005PR.Q0_Vynimka_vz.Value);
    E_ATTR('rozsahSP',ReportSP2005PR.Q0_CALC_ROZSAH_SP.Value);
    E_ATTR('vzNpGp',IntToStr(ReportSP2005PR.Q0_N_zaklad_np.AsInteger));
    E_ATTR('vzSpIpPvn',IntToStr(ReportSP2005PR.Q0_N_zaklad_dp.AsInteger));
    E_ATTR('vzUp',IntToStr(ReportSP2005PR.Q0_N_zaklad_up.AsInteger));
    E_ATTR('npZamtel',IntToStr(ReportSP2005PR.Q0_oz_nemoc.AsInteger));
    E_ATTR('npZamnec',IntToStr(ReportSP2005PR.Q0_o_nemoc.AsInteger));
    E_ATTR('spZamtel',IntToStr(ReportSP2005PR.Q0_oz_dochod.AsInteger));
    E_ATTR('spZamnec',IntToStr(ReportSP2005PR.Q0_o_dochod.AsInteger));
    E_ATTR('ipZamtel',IntToStr(ReportSP2005PR.Q0_oz_invalid.AsInteger));
    E_ATTR('ipZamnec',IntToStr(ReportSP2005PR.Q0_o_invalid.AsInteger));
    E_ATTR('pvnZamtel',IntToStr(ReportSP2005PR.Q0_oz_fondzam.AsInteger));
    E_ATTR('pvnZamnec',IntToStr(ReportSP2005PR.Q0_o_fondzam.AsInteger));
    E_ATTR('upZamtel',IntToStr(ReportSP2005PR.Q0_oz_uraz.AsInteger));
    E_TAGA('poistneZamestnanca',MyAttr);
    ReportSP2005PR.Q0_.Next;
  end;
  ReportSP2005PR.ShowReportEnd;
  finally
  ReportSP2005PR.Free;
  end;
  E_TAGK('poistneZamestnancov');
  E_TAGK('priloha');
  E_TAGK('spVykazPoistneho');
  Result := MyXml;
end;end; {VytvorXml_od20060801}

function VytvorXml_v2_7:AnsiString; {platne od 1.7.2008}
var pc:integer;
    Year, Month, Day: Word;
    U1,U2,U3,cSumFrm,cPocFrm: string;
    oldDecimalSeparator: char;
begin with DM do begin
  oldDecimalSeparator := DecimalSeparator;
  DecimalSeparator := '.';
  try
  if X.Obdobie1 >= ZAKON_2009_01
    then cSumFrm := '%0.2f'
    else cSumFrm := '%0.0f';
  cPocFrm := '%0.0f';
  pc:=0;
  MyXML := '';
  E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
  E_TEXT('<!-- Vytvorene: dna '+DateToStr(Now)+' -->');
  E_TEXT('<spVykazPoistneho xmlns="http://socpoist.sk/xsd/mvp27" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://socpoist.sk/xsd/mvp27 SPVykazPoist-v2.7.xsd">');
  E_TAG('typDoc','MVP00001');
  E_TAG('obdobie',LPAD(IntToStr(X.Obdobie1 mod 100),2,'0')+IntToStr(X.Obdobie1 div 100));
  E_TAG('typVykazu',X.Vykaz_riadny);
  E_TAGZ('zamestnavatel');
  E_TAGZ('identifikacia');
  E_TAG('icz',TINF_ICZ.Value);
  E_TAGZ('identifikator');
  if TINF_SP_IDENTIFIKATOR.Value = 1 {1=ICO,2=DIC}
  then E_TAG('ico',TINF_ICO.Value)
  else E_TAG('dic',TINF_DIC.Value);
  E_TAGK('identifikator');
  E_TAG('nazov',TINF_NAZOV.Value);
  E_TAGK('identifikacia');
  E_TAGZ('korAdresa');
  E_TAGZ('adresa');
  MyRozdelUlicuExt(TINF_ADR_Ulica1.Value,U1,U2,U3);
  if U1<>'' then
  begin
    E_TAG('ulica',U1);
    if U3<>'' then
      E_TAG('supCislo',U3);
    E_TAG('oCislo',U2);
  end else
  begin
    E_TAG('supCislo',U2);
  end;
  E_TAG('obec',TINF_ADR_MESTO.Value);
  E_TAG('psc',TINF_ADR_PSC.Value);
  E_TAG('stat',TINF_L_ADR_STAT_AAA.Value);
  E_TAGK('adresa');
  E_TAG('tel',TINF_ADR_TELEFON.Value);
  E_TAG('fax',TINF_ADR_FAX.Value);
  E_TAG('mail',TINF_ADR_EMAIL.Value);
  E_TAGK('korAdresa');
  E_TAGZ('ucet');
  E_TAG('nazovSidloBanky',TINF_NAZOV_BANKY.Value);
  E_TAG('kodBanky',TINF_BANKA_U.Value);
  E_TAG('cisloUctu',LongCisloU(TINF_Predcislo_u.Value,TINF_Cislo_u.Value));
  E_TAGK('ucet');
  E_TAGK('zamestnavatel');
  {--}
  E_TAGZ('poistne');
  try
  ReportSP2005VY:=TReportSP2005VY.Create(Application);
  ReportSP2005VY.SetX(X);
  ReportSP2005VY.ShowReportStart;

  E_TAGZ('np');
  E_TAG('pocZamNP',Format(cPocFrm,[MyOdvody[0].p_nemoc]));
  E_TAG('npZamtel',Format(cSumFrm,[MyOdvody[0].z_nemoc]));
  E_TAG('npZamnec',Format(cSumFrm,[MyOdvody[0].o_nemoc]));
  E_TAGK('np');

  E_TAGZ('sp');
  E_TAG('pocZamSP',Format(cPocFrm,[MyOdvody[0].p_dochod]));
  E_TAG('spZamtel',Format(cSumFrm,[MyOdvody[0].z_dochod]));
  E_TAG('spZamnec',Format(cSumFrm,[MyOdvody[0].o_dochod]));
  E_TAGK('sp');

  E_TAGZ('ip');
  E_TAG('pocZamIP',Format(cPocFrm,[MyOdvody[0].p_invalid]));
  E_TAG('ipZamtel',Format(cSumFrm,[MyOdvody[0].z_invalid]));
  E_TAG('ipZamnec',Format(cSumFrm,[MyOdvody[0].o_invalid]));
  E_TAGK('ip');

  E_TAGZ('pvn');
  E_TAG('pocZamPvN',Format(cPocFrm,[MyOdvody[0].p_fondzam]));
  E_TAG('pvnZamtel',Format(cSumFrm,[MyOdvody[0].z_fondzam]));
  E_TAG('pvnZamnec',Format(cSumFrm,[MyOdvody[0].o_fondzam]));
  E_TAGK('pvn');

  E_TAGZ('up');
  E_TAG('pocZamUP',Format(cPocFrm,[MyOdvody[0].p_uraz]));
  E_TAG('upZamtel',Format(cSumFrm,[MyOdvody[0].z_uraz]));
  E_TAGK('up');

  E_TAGZ('gp');
  E_TAG('pocZamGP',Format(cPocFrm,[MyOdvody[0].p_garancne]));
  E_TAG('gpZamtel',Format(cSumFrm,[MyOdvody[0].z_garancne]));
  E_TAGK('gp');

  E_TAGZ('rfs');
  E_TAG('pocZamRfs',Format(cPocFrm,[MyOdvody[0].p_rezerva]));
  E_TAG('rfsZamtel',Format(cSumFrm,[MyOdvody[0].z_rezerva]));
  E_TAGK('rfs');

  E_TAG('spoluPoistne',Format(cSumFrm,[MyOdvody[0].p_spolu]));

  E_TAGK('poistne');
  ReportSP2005VY.ShowReportEnd;
  finally
  ReportSP2005VY.Free;
  end;
  {--}
  E_TAGZ('vystavenie');
  E_TAG('zostavil',X.Vykaz_zostavil);
  DecodeDate(now, Year, Month, Day);
  E_TAG('datum',LPAD(IntToStr(Day),2,'0')+'.'
                +LPAD(IntToStr(Month),2,'0')+'.'
                +IntToStr(Year));
  E_TAGK('vystavenie');
  {--}
  E_TAGZ('priloha');
  E_TAGZ('poistneZamestnancov');
  {--}
  try
  ReportSP2005PR:=TReportSP2005PR.Create(Application);
  ReportSP2005PR.SetX(X);
  ReportSP2005PR.ShowReportStart_PP;
  while not ReportSP2005PR.Q0_.EOF do
  begin
    Inc(pc);
    E_ATTRZ('pc',IntToStr(pc));
    E_ATTR('rc',ReportSP2005PR.Q0_Calc_Born_numb.Value);
    E_ATTR('pocDni',ReportSP2005PR.Q0_CALC_dni.AsString);
    if ReportSP2005PR.Q0_typzec.Value = 2  then E_ATTR('typZec','D') else E_ATTR('typZec','PP');
    E_ATTR('vynimkaVZ',ReportSP2005PR.Q0_Vynimka_vz.Value);
    E_ATTR('rozsahSP',ReportSP2005PR.Q0_CALC_ROZSAH_SP.Value);
    E_ATTR('vzNp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_np.Value]));
    E_ATTR('vzSp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_dp.Value]));
    E_ATTR('vzIp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_ip.Value]));
    E_ATTR('vzPvn',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_fz.Value]));
    E_ATTR('vzUp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_up.Value]));
    E_ATTR('vzGp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_gp.Value]));
    E_ATTR('vzRfs',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_rf.Value]));
    E_ATTR('npZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_nemoc.Value]));
    E_ATTR('npZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_nemoc.Value]));
    E_ATTR('spZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_dochod.Value]));
    E_ATTR('spZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_dochod.Value]));
    E_ATTR('ipZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_invalid.Value]));
    E_ATTR('ipZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_invalid.Value]));
    E_ATTR('pvnZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_fondzam.Value]));
    E_ATTR('pvnZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_fondzam.Value]));
    E_ATTR('upZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_uraz.Value]));
    E_ATTR('gpZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_garancne.Value]));
    E_ATTR('rfsZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_rezerva.Value]));
    E_TAGA('poistneZamestnanca',MyAttr);
    ReportSP2005PR.Q0_.Next;
  end;
  ReportSP2005PR.ShowReportEnd;
  finally
  ReportSP2005PR.Free;
  end;
  E_TAGK('poistneZamestnancov');
  E_TAGK('priloha');
  E_TAGK('spVykazPoistneho');
  finally
    DecimalSeparator := oldDecimalSeparator;
  end;
  Result := MyXml;
end;end; {VytvorXml_v2_7}

function VytvorXml_v2011:AnsiString; {platne od 1.1.2011}
var pc:integer;
    Year, Month, Day: Word;
    U1,U2,U3,cSumFrm,cPocFrm: string;
    oldDecimalSeparator: char;
begin with DM do begin
  oldDecimalSeparator := DecimalSeparator;
  DecimalSeparator := '.';
  try
  cSumFrm := '%0.2f';
  cPocFrm := '%0.0f';
  pc:=0;
  MyXML := '';
  E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
  E_TEXT('<!-- Vytvorene: dna '+DateToStr(Now)+' -->');
  E_TEXT('<mvpp   xmlns="http://socpoist.sk/xsd/mvpp2011" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://socpoist.sk/xsd/mvpp2011 MVPP-v2011.xsd">');
  E_TAG('typDoc','MVP00001');
  E_TAG('obdobie',LPAD(IntToStr(X.Obdobie1 mod 100),2,'0')+IntToStr(X.Obdobie1 div 100));
  E_TAG('typVykazu',X.Vykaz_riadny);
  E_TAGZ('zamestnavatel');
  E_TAGZ('identifikacia');
  E_TAG('icz',TINF_ICZ.Value);
  E_TAGZ('identifikator');
  if TINF_SP_IDENTIFIKATOR.Value = 1 {1=ICO,2=DIC}
  then E_TAG('ico',TINF_ICO.Value)
  else E_TAG('dic',TINF_DIC.Value);
  E_TAGK('identifikator');
  E_TAG('nazov',TINF_NAZOV.Value);
  E_TAGK('identifikacia');
  E_TAGZ('korAdresa');
  E_TAGZ('adresa');
  MyRozdelUlicuExt(TINF_ADR_Ulica1.Value,U1,U2,U3);
  if U1<>'' then
  begin
    E_TAG('ulica',U1);
    if U3<>'' then
      E_TAG('supCislo',U3);
    E_TAG('oCislo',U2);
  end else
  begin
    E_TAG('supCislo',U2);
  end;
  E_TAG('obec',TINF_ADR_MESTO.Value);
  E_TAG('psc',TINF_ADR_PSC.Value);
  E_TAG('stat',TINF_L_ADR_STAT_AAA.Value);
  E_TAGK('adresa');
  E_TAG('tel',TINF_ADR_TELEFON.Value);
  E_TAG('fax',TINF_ADR_FAX.Value);
  E_TAG('mail',TINF_ADR_EMAIL.Value);
  E_TAGK('korAdresa');
  E_TAGZ('ucet');
  E_TAG('nazovSidloBanky',TINF_NAZOV_BANKY.Value);
  E_TAG('kodBanky',TINF_BANKA_U.Value);
  E_TAG('cisloUctu',LongCisloU(TINF_Predcislo_u.Value,TINF_Cislo_u.Value));
  E_TAGK('ucet');
  E_TAGK('zamestnavatel');
  {--}
  E_TAGZ('poistne');
  try
  ReportSP2005VY:=TReportSP2005VY.Create(Application);
  ReportSP2005VY.SetX(X);
  ReportSP2005VY.ShowReportStart;

  E_TAGZ('np');
  E_TAG('pocZamNP',Format(cPocFrm,[MyOdvody[0].p_nemoc]));
  E_TAG('npZamtel',Format(cSumFrm,[MyOdvody[0].z_nemoc]));
  E_TAG('npZamnec',Format(cSumFrm,[MyOdvody[0].o_nemoc]));
  E_TAGK('np');

  E_TAGZ('sp');
  E_TAG('pocZamSP',Format(cPocFrm,[MyOdvody[0].p_dochod]));
  E_TAG('spZamtel',Format(cSumFrm,[MyOdvody[0].z_dochod]));
  E_TAG('spZamnec',Format(cSumFrm,[MyOdvody[0].o_dochod]));
  E_TAGK('sp');

  E_TAGZ('ip');
  E_TAG('pocZamIP',Format(cPocFrm,[MyOdvody[0].p_invalid]));
  E_TAG('ipZamtel',Format(cSumFrm,[MyOdvody[0].z_invalid]));
  E_TAG('ipZamnec',Format(cSumFrm,[MyOdvody[0].o_invalid]));
  E_TAGK('ip');

  E_TAGZ('pvn');
  E_TAG('pocZamPvN',Format(cPocFrm,[MyOdvody[0].p_fondzam]));
  E_TAG('pvnZamtel',Format(cSumFrm,[MyOdvody[0].z_fondzam]));
  E_TAG('pvnZamnec',Format(cSumFrm,[MyOdvody[0].o_fondzam]));
  E_TAGK('pvn');

  E_TAGZ('up');
  E_TAG('pocZamUP',Format(cPocFrm,[MyOdvody[0].p_uraz]));
  E_TAG('upZamtel',Format(cSumFrm,[MyOdvody[0].z_uraz]));
  E_TAGK('up');

  E_TAGZ('gp');
  E_TAG('pocZamGP',Format(cPocFrm,[MyOdvody[0].p_garancne]));
  E_TAG('gpZamtel',Format(cSumFrm,[MyOdvody[0].z_garancne]));
  E_TAGK('gp');

  E_TAGZ('rfs');
  E_TAG('pocZamRfs',Format(cPocFrm,[MyOdvody[0].p_rezerva]));
  E_TAG('rfsZamtel',Format(cSumFrm,[MyOdvody[0].z_rezerva]));
  E_TAGK('rfs');

  E_TAG('spoluPoistne',Format(cSumFrm,[MyOdvody[0].p_spolu]));

  E_TAGK('poistne');
  ReportSP2005VY.ShowReportEnd;
  finally
  ReportSP2005VY.Free;
  end;
  {--}
  E_TAGZ('vystavenie');
  E_TAG('zostavil',X.Vykaz_zostavil);
  DecodeDate(now, Year, Month, Day);
  E_TAG('datum',LPAD(IntToStr(Day),2,'0')+'.'
                +LPAD(IntToStr(Month),2,'0')+'.'
                +IntToStr(Year));
  E_TAGK('vystavenie');
  {--}
  E_TAGZ('priloha');
  E_TAGZ('poistneZamestnancov');
  {--}
  try
  ReportSP2005PR:=TReportSP2005PR.Create(Application);
  ReportSP2005PR.SetX(X);
  ReportSP2005PR.ShowReportStart_PP;
  while not ReportSP2005PR.Q0_.EOF do
  begin
    Inc(pc);
    E_ATTRZ('pc',IntToStr(pc));
    E_ATTR('rc',ReportSP2005PR.Q0_Calc_Born_numb.Value);
    E_ATTR('pocDni',ReportSP2005PR.Q0_CALC_dni.AsString);
    if ReportSP2005PR.Q0_typzec.Value = 2  then E_ATTR('typZec','D')
    else if ReportSP2005PR.Q0_typzec.Value = 3 then E_ATTR('typZec','NP')
    else E_ATTR('typZec','PP');
    E_ATTR('vynimkaVZ',ReportSP2005PR.Q0_Vynimka_vz.Value);
    E_ATTR('rozsahSP',ReportSP2005PR.Q0_CALC_ROZSAH_SP.Value);
    E_ATTR('vzNp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_np.Value]));
    E_ATTR('vzSp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_dp.Value]));
    E_ATTR('vzIp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_ip.Value]));
    E_ATTR('vzPvn',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_fz.Value]));
    E_ATTR('vzUp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_up.Value]));
    E_ATTR('vzGp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_gp.Value]));
    E_ATTR('vzRfs',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_rf.Value]));
    E_ATTR('npZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_nemoc.Value]));
    E_ATTR('npZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_nemoc.Value]));
    E_ATTR('spZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_dochod.Value]));
    E_ATTR('spZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_dochod.Value]));
    E_ATTR('ipZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_invalid.Value]));
    E_ATTR('ipZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_invalid.Value]));
    E_ATTR('pvnZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_fondzam.Value]));
    E_ATTR('pvnZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_fondzam.Value]));
    E_ATTR('upZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_uraz.Value]));
    E_ATTR('gpZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_garancne.Value]));
    E_ATTR('rfsZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_rezerva.Value]));
    E_TAGA('poistneZamestnanca',MyAttr);
    ReportSP2005PR.Q0_.Next;
  end;
  ReportSP2005PR.ShowReportEnd;
  finally
  ReportSP2005PR.Free;
  end;
  E_TAGK('poistneZamestnancov');
  E_TAGK('priloha');
  E_TAGK('mvpp');
  finally
    DecimalSeparator := oldDecimalSeparator;
  end;
  Result := MyXml;
end;end; {VytvorXml_v2011}

function VytvorXml_v2013:AnsiString; {platne od 1.1.2013}
var pc:integer;
    Year, Month, Day: Word;
    U1,U2,U3,cSumFrm,cPocFrm: string;
    oldDecimalSeparator: char;
begin with DM do begin
  oldDecimalSeparator := DecimalSeparator;
  DecimalSeparator := '.';
  try
  cSumFrm := '%0.2f';
  cPocFrm := '%0.0f';
  pc:=0;
  MyXML := '';
  E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
  E_TEXT('<!-- Vytvorene: dna '+DateToStr(Now)+' -->');
  E_TEXT('<mvpp   xmlns="http://socpoist.sk/xsd/mvpp2013" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://socpoist.sk/xsd/mvpp2013 MVPP-v2013.xsd">');
  E_TAG('typDoc','MVP00001');
  E_TAG('obdobie',LPAD(IntToStr(X.Obdobie1 mod 100),2,'0')+IntToStr(X.Obdobie1 div 100));
  E_TAG('typVykazu',X.Vykaz_riadny);
  E_TAGZ('zamestnavatel');
  E_TAGZ('identifikacia');
  E_TAG('icz',TINF_ICZ.Value);
  E_TAGZ('identifikator');
  if TINF_SP_IDENTIFIKATOR.Value = 1 {1=ICO,2=DIC}
  then E_TAG('ico',TINF_ICO.Value)
  else E_TAG('dic',TINF_DIC.Value);
  E_TAGK('identifikator');
  E_TAG('nazov',TINF_NAZOV.Value);
  EX_TAG('tel',TINF_ADR_TELEFON.Value);
  EX_TAG('mail',TINF_ADR_EMAIL.Value);
  E_TAGK('identifikacia');
  E_TAGZ('ucet');
  E_TAG('nazovSidloBanky',TINF_NAZOV_BANKY.Value);
  E_TAG('kodBanky',TINF_BANKA_U.Value);
  E_TAG('cisloUctu',LongCisloU(TINF_Predcislo_u.Value,TINF_Cislo_u.Value));
  E_TAGK('ucet');
  E_TAGK('zamestnavatel');
  {--}
  E_TAGZ('poistne');
  try
  ReportSP2005VY:=TReportSP2005VY.Create(Application);
  ReportSP2005VY.SetX(X);
  ReportSP2005VY.ShowReportStart;

  E_TAGZ('np');
  E_TAG('npZamtel',Format(cSumFrm,[MyOdvody[0].z_nemoc]));
  E_TAG('npZamnec',Format(cSumFrm,[MyOdvody[0].o_nemoc]));
  E_TAGK('np');

  E_TAGZ('sp');
  E_TAG('spZamtel',Format(cSumFrm,[MyOdvody[0].z_dochod]));
  E_TAG('spZamnec',Format(cSumFrm,[MyOdvody[0].o_dochod]));
  E_TAGK('sp');

  E_TAGZ('ip');
  E_TAG('ipZamtel',Format(cSumFrm,[MyOdvody[0].z_invalid]));
  E_TAG('ipZamnec',Format(cSumFrm,[MyOdvody[0].o_invalid]));
  E_TAGK('ip');

  E_TAGZ('pvn');
  E_TAG('pvnZamtel',Format(cSumFrm,[MyOdvody[0].z_fondzam]));
  E_TAG('pvnZamnec',Format(cSumFrm,[MyOdvody[0].o_fondzam]));
  E_TAGK('pvn');

  E_TAGZ('up');
  E_TAG('upZamtel',Format(cSumFrm,[MyOdvody[0].z_uraz]));
  E_TAG('upZamnec',Format(cSumFrm,[0.0])); {zatial sa nepouziva}
  E_TAGK('up');

  E_TAGZ('gp');
  E_TAG('gpZamtel',Format(cSumFrm,[MyOdvody[0].z_garancne]));
  E_TAG('gpZamnec',Format(cSumFrm,[0.0])); {zatial sa nepouziva}
  E_TAGK('gp');

  E_TAGZ('rfs');
  E_TAG('rfsZamtel',Format(cSumFrm,[MyOdvody[0].z_rezerva]));
  E_TAG('rfsZamnec',Format(cSumFrm,[0.0])); {zatial sa nepouziva}
  E_TAGK('rfs');

  E_TAG('spoluPoistne',Format(cSumFrm,[MyOdvody[0].p_spolu]));

  E_TAGK('poistne');
  ReportSP2005VY.ShowReportEnd;
  finally
  ReportSP2005VY.Free;
  end;
  {--}
  E_TAGZ('vystavenie');
  E_TAG('zostavil',X.Vykaz_zostavil);
  DecodeDate(now, Year, Month, Day);
  E_TAG('datum',LPAD(IntToStr(Day),2,'0')+'.'
                +LPAD(IntToStr(Month),2,'0')+'.'
                +IntToStr(Year));
  E_TAGK('vystavenie');
  {--}
  E_TAGZ('priloha');
  E_TAGZ('poistneZamestnancov');
  {--}
  try
  ReportSP2005PR:=TReportSP2005PR.Create(Application);
  ReportSP2005PR.SetX(X);
  ReportSP2005PR.ShowReportStart_PP;
  while not ReportSP2005PR.Q0_.EOF do
  begin
    Inc(pc);
    E_ATTRZ('pc',IntToStr(pc));
    E_ATTR('rc',ReportSP2005PR.Q0_Calc_Born_numb.Value);
    E_ATTR('pocDni',ReportSP2005PR.Q0_CALC_dni.AsString);
    {DM.CIS10_.FindKey([ReportSP2005PR.Q0_typzec.Value]);}
    if slTypZecCode[ReportSP2005PR.Q0_vyptypzec.Value] = 'ZECD' then E_ATTR('typZec','ZECD1')
    else if slTypZecCode[ReportSP2005PR.Q0_vyptypzec.Value] = 'ZECDDPP' then E_ATTR('typZec','ZECD3V')
    else if slTypZecCode[ReportSP2005PR.Q0_vyptypzec.Value] = 'ZECDDPN' then E_ATTR('typZec','ZECD3NV')
    else E_ATTR('typZec',slTypZecCode[ReportSP2005PR.Q0_vyptypzec.Value]);
    (*
    if ReportSP2005PR.Q0_typzec.Value = 2  then E_ATTR('typZec','D')
    else if ReportSP2005PR.Q0_typzec.Value = 3 then E_ATTR('typZec','NP')
    else E_ATTR('typZec','PP');
    *)
    E_ATTR('vynimkaVZ',ReportSP2005PR.Q0_Vynimka_vz.Value);
    E_ATTR('rozsahSP',ReportSP2005PR.Q0_CALC_ROZSAH_SP.Value);
    E_ATTR('vzNp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_np.Value]));
    E_ATTR('vzSp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_dp.Value]));
    E_ATTR('vzIp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_ip.Value]));
    E_ATTR('vzPvn',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_fz.Value]));
    E_ATTR('vzUp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_up.Value]));
    E_ATTR('vzGp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_gp.Value]));
    E_ATTR('vzRfs',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_rf.Value]));
    E_ATTR('vzZecNp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_np.Value]));
    E_ATTR('vzZecSp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_dp.Value]));
    E_ATTR('vzZecIp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_ip.Value]));
    E_ATTR('vzZecPvn',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_fz.Value]));
    E_ATTR('vzZecUp',Format(cSumFrm,[0.0]));
    E_ATTR('vzZecGp',Format(cSumFrm,[0.0]));
    E_ATTR('vzZecRfs',Format(cSumFrm,[0.0]));
    E_ATTR('npZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_nemoc.Value]));
    E_ATTR('npZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_nemoc.Value]));
    E_ATTR('spZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_dochod.Value]));
    E_ATTR('spZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_dochod.Value]));
    E_ATTR('ipZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_invalid.Value]));
    E_ATTR('ipZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_invalid.Value]));
    E_ATTR('pvnZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_fondzam.Value]));
    E_ATTR('pvnZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_fondzam.Value]));
    E_ATTR('upZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_uraz.Value]));
    E_ATTR('upZamnec',Format(cSumFrm,[0.0]));
    E_ATTR('gpZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_garancne.Value]));
    E_ATTR('gpZamnec',Format(cSumFrm,[0.0]));
    E_ATTR('rfsZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_rezerva.Value]));
    E_ATTR('rfsZamnec',Format(cSumFrm,[0.0]));
    if (ReportSP2005PR.Q0_pocDniStrajku.AsString<>'') and  (ReportSP2005PR.Q0_pocDniStrajku.AsString<>'0')
      then E_ATTR('pocDniStrajku',ReportSP2005PR.Q0_pocDniStrajku.AsString);
    E_TAGA('poistneZamestnanca',MyAttr);
    ReportSP2005PR.Q0_.Next;
  end;
  ReportSP2005PR.ShowReportEnd;
  finally
  ReportSP2005PR.Free;
  end;
  E_TAGK('poistneZamestnancov');
  E_TAGK('priloha');
  E_TAGK('mvpp');
  finally
    DecimalSeparator := oldDecimalSeparator;
  end;
  Result := MyXml;
end;end; {VytvorXml_v2013}

{---------------------------------------------------------}

function VytvorXml_v2014:AnsiString; {platne od 1.1.2014}
var pc:integer;
    Year, Month, Day: Word;
    U1,U2,U3,cSumFrm,cPocFrm: string;
    oldDecimalSeparator: char;
    obdobieNaslMesiac: longint;
    D1,D2: TDate;
begin with DM do begin
  oldDecimalSeparator := DecimalSeparator;
  DecimalSeparator := '.';
  try
  cSumFrm := '%0.2f';
  cPocFrm := '%0.0f';
  pc:=0;
  MyXML := '';
  E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
  E_TEXT('<mvpp xmlns="http://socpoist.sk/xsd/mvpp2014" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://socpoist.sk/xsd/mvpp2014 MVPP-v2014.xsd">');
  E_TAG('typDoc','MVP00001');
  E_TAG('obdobie',LPAD(IntToStr(X.Obdobie1 mod 100),2,'0')+IntToStr(X.Obdobie1 div 100));
  obdobieNaslMesiac := Obdobie_Add_MM(X.Obdobie1,1);
  {last datum}
  D1 := LastDayDate(obdobieNaslMesiac div 100, obdobieNaslMesiac mod 100,31);
  DecodeDate(D1, Year, Month, Day);
  if (DM.TINF_FZ_den.Value >= 1) and (DM.TINF_FZ_den.Value < Day) then Day := DM.TINF_FZ_den.Value;
  E_TAG('denVyplaty',LPAD(IntToStr(Day),2,'0')+'.'
                +LPAD(IntToStr(obdobieNaslMesiac mod 100),2,'0')+'.'
                +IntToStr(obdobieNaslMesiac div 100));
  E_TAG('typVykazu',X.Vykaz_riadny);
  E_TAGZ('zamestnavatel');
  E_TAGZ('identifikacia');
  E_TAG('variabilnySymbol',TINF_ICZ.Value);
  E_TAGZ('identifikator');
  if TINF_SP_IDENTIFIKATOR.Value = 1 {1=ICO,2=DIC}
  then E_TAG('ico',TINF_ICO.Value)
  else E_TAG('dic',TINF_DIC.Value);
  E_TAGK('identifikator');
  E_TAG('nazov',TINF_NAZOV.Value);
  EX_TAG('tel',TINF_ADR_TELEFON.Value);
  EX_TAG('mail',TINF_ADR_EMAIL.Value);
  E_TAGK('identifikacia');
  E_TAGZ('ucet');
  E_TAG('nazovSidloBanky',TINF_NAZOV_BANKY.Value);
  E_TAG('iban',TINF_IBAN.Value);
(*
  E_TAG('kodBanky',TINF_BANKA_U.Value);
  E_TAG('cisloUctu',LongCisloU(TINF_Predcislo_u.Value,TINF_Cislo_u.Value));
*)
  E_TAGK('ucet');
  E_TAGK('zamestnavatel');
  {--}
  E_TAGZ('poistne');
  try
  ReportSP2005VY:=TReportSP2005VY.Create(Application);
  ReportSP2005VY.SetX(X);
  ReportSP2005VY.ShowReportStart;

  E_TAGZ('np');
  E_TAG('npZamtel',Format(cSumFrm,[MyOdvody[0].z_nemoc]));
  E_TAG('npZamnec',Format(cSumFrm,[MyOdvody[0].o_nemoc]));
  E_TAGK('np');

  E_TAGZ('sp');
  E_TAG('spZamtel',Format(cSumFrm,[MyOdvody[0].z_dochod]));
  E_TAG('spZamnec',Format(cSumFrm,[MyOdvody[0].o_dochod]));
  E_TAGK('sp');

  E_TAGZ('ip');
  E_TAG('ipZamtel',Format(cSumFrm,[MyOdvody[0].z_invalid]));
  E_TAG('ipZamnec',Format(cSumFrm,[MyOdvody[0].o_invalid]));
  E_TAGK('ip');

  E_TAGZ('pvn');
  E_TAG('pvnZamtel',Format(cSumFrm,[MyOdvody[0].z_fondzam]));
  E_TAG('pvnZamnec',Format(cSumFrm,[MyOdvody[0].o_fondzam]));
  E_TAGK('pvn');

  E_TAGZ('up');
  E_TAG('upZamtel',Format(cSumFrm,[MyOdvody[0].z_uraz]));
  E_TAG('upZamnec',Format(cSumFrm,[0.0])); {zatial sa nepouziva}
  E_TAGK('up');

  E_TAGZ('gp');
  E_TAG('gpZamtel',Format(cSumFrm,[MyOdvody[0].z_garancne]));
  E_TAG('gpZamnec',Format(cSumFrm,[0.0])); {zatial sa nepouziva}
  E_TAGK('gp');

  E_TAGZ('rfs');
  E_TAG('rfsZamtel',Format(cSumFrm,[MyOdvody[0].z_rezerva]));
  E_TAG('rfsZamnec',Format(cSumFrm,[0.0])); {zatial sa nepouziva}
  E_TAGK('rfs');

  E_TAG('spoluPoistne',Format(cSumFrm,[MyOdvody[0].p_spolu]));

  E_TAGK('poistne');
  ReportSP2005VY.ShowReportEnd;
  finally
  ReportSP2005VY.Free;
  end;
  {--}
  E_TAGZ('fOsoba');
  E_TAG('priezvisko',X.Ucto_priezvisko);
  E_TAG('meno',X.Ucto_meno);
  E_TAG('tel',X.Ucto_Tel);
  E_TAG('mail',X.Ucto_Mail);
  E_TAGK('fOsoba');
  E_TAGZ('vystavenie');
  E_TAG('zostavil',X.Vykaz_zostavil);
  DecodeDate(now, Year, Month, Day);
  E_TAG('datum',LPAD(IntToStr(Day),2,'0')+'.'
                +LPAD(IntToStr(Month),2,'0')+'.'
                +IntToStr(Year));
  E_TAGK('vystavenie');
  {--}
  E_TAGZ('priloha');
  E_TAGZ('poistneZamestnancov');
  {--}
  try
  ReportSP2005PR:=TReportSP2005PR.Create(Application);
  ReportSP2005PR.SetX(X);
  ReportSP2005PR.ShowReportStart_PP;
  while not ReportSP2005PR.Q0_.EOF do
  begin
    Inc(pc);
    E_ATTRZ('pc',IntToStr(pc));
    E_ATTR('rc',ReportSP2005PR.Q0_Calc_Born_numb.Value);
    E_ATTR('pocDni',ReportSP2005PR.Q0_CALC_dni.AsString);
    {DM.CIS10_.FindKey([ReportSP2005PR.Q0_typzec.Value]);}
    if slTypZecCode[ReportSP2005PR.Q0_vyptypzec.Value] = 'ZECD' then E_ATTR('typZec','ZECD1')
    else if slTypZecCode[ReportSP2005PR.Q0_vyptypzec.Value] = 'ZECDDPP' then E_ATTR('typZec','ZECD3V')
    else if slTypZecCode[ReportSP2005PR.Q0_vyptypzec.Value] = 'ZECDDPN' then E_ATTR('typZec','ZECD3NV')
    else E_ATTR('typZec',slTypZecCode[ReportSP2005PR.Q0_vyptypzec.Value]);
    (*
    if ReportSP2005PR.Q0_typzec.Value = 2  then E_ATTR('typZec','D')
    else if ReportSP2005PR.Q0_typzec.Value = 3 then E_ATTR('typZec','NP')
    else E_ATTR('typZec','PP');
    *)
    E_ATTR('vynimkaVZ',ReportSP2005PR.Q0_Vynimka_vz.Value);
    E_ATTR('rozsahSP',ReportSP2005PR.Q0_CALC_ROZSAH_SP.Value);
    E_ATTR('vzNp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_np.Value]));
    E_ATTR('vzSp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_dp.Value]));
    E_ATTR('vzIp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_ip.Value]));
    E_ATTR('vzPvn',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_fz.Value]));
    E_ATTR('vzUp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_up.Value]));
    E_ATTR('vzGp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_gp.Value]));
    E_ATTR('vzRfs',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_rf.Value]));
    E_ATTR('vzZecNp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_np.Value]));
    E_ATTR('vzZecSp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_dp.Value]));
    E_ATTR('vzZecIp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_ip.Value]));
    E_ATTR('vzZecPvn',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_fz.Value]));
    E_ATTR('vzZecUp',Format(cSumFrm,[0.0]));
    E_ATTR('vzZecGp',Format(cSumFrm,[0.0]));
    E_ATTR('vzZecRfs',Format(cSumFrm,[0.0]));
    E_ATTR('npZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_nemoc.Value]));
    E_ATTR('npZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_nemoc.Value]));
    E_ATTR('spZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_dochod.Value]));
    E_ATTR('spZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_dochod.Value]));
    E_ATTR('ipZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_invalid.Value]));
    E_ATTR('ipZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_invalid.Value]));
    E_ATTR('pvnZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_fondzam.Value]));
    E_ATTR('pvnZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_fondzam.Value]));
    E_ATTR('upZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_uraz.Value]));
    E_ATTR('upZamnec',Format(cSumFrm,[0.0]));
    E_ATTR('gpZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_garancne.Value]));
    E_ATTR('gpZamnec',Format(cSumFrm,[0.0]));
    E_ATTR('rfsZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_rezerva.Value]));
    E_ATTR('rfsZamnec',Format(cSumFrm,[0.0]));
    if (ReportSP2005PR.Q0_pocDniStrajku.AsString<>'') and  (ReportSP2005PR.Q0_pocDniStrajku.AsString<>'0')
      then E_ATTR('pocDniStrajku',ReportSP2005PR.Q0_pocDniStrajku.AsString);
    E_TAGA('poistneZamestnanca',MyAttr);
    ReportSP2005PR.Q0_.Next;
  end;
  ReportSP2005PR.ShowReportEnd;
  finally
  ReportSP2005PR.Free;
  end;
  E_TAGK('poistneZamestnancov');
  E_TAGK('priloha');
  E_TAGK('mvpp');
  finally
    DecimalSeparator := oldDecimalSeparator;
  end;
  Result := MyXml;
end;end; {VytvorXml_v2014}

function VytvorXml:AnsiString;
begin
  if X.Typ='SPXML/v2014'
    then Result := VytvorXml_v2014
  else if X.Typ='SPXML/v2013'
    then Result := VytvorXml_v2013
  else if X.Typ='SPXML/v2011'
    then Result := VytvorXml_v2011
  else if X.Typ='SPXML/2.7'
    then Result := VytvorXml_v2_7
  else if X.Typ='SPXML/2.5'
    then Result := VytvorXml_od20060801
    else Result := VytvorXml_do20060731;
end;

procedure VytvorConfSubor(iFPath,iFNameXML,iFNameConf:string);
var
  fc:TextFile;fx:text;
  r:integer;i,sum:longint;
  z:word;
  t:WideString;
  s:string;
begin
  assignfile(fx,iFPath+'\'+iFNameXml);
  assignfile(fc,iFPath+'\'+iFNameConf);
{  assignfile(ft,iFPath+'\'+'pokus.txt');}
  reset(fx);
  rewrite(fc);
{  rewrite(ft);}
  writeln(fc,'PAM98 Personalistika a Mzdy');
  writeln(fc,MyVerziaNum);
  writeln(fc,'Rainitech, s.r.o');
  r:=0;sum:=0;
{
  t:=cp1250ToUTF16Char(ord('ž'));
  writeln(ft,ord(t[1]));
  t:=cp1250ToUTF16Char(ord('á'));
  writeln(ft,ord(t[1]));
  t:=cp1250ToUTF16Char(ord('a'));
  writeln(ft,ord(t[1]));
}
  repeat
    readln(fx,s);
{    write(ft,s);}
    t:=UTF8ToUTF16BEStr(s);
    for i:=1 to length(t) do
    begin
      z:=word(t[i]);
      sum:=sum+z;
{      write(ft,IntToStr(ord(Z))+' + ');}
    end;
    sum:=sum+23;
    inc(r);{writeln(ft);}
    if r=100 then
    begin
      writeln(fc,IntToStr(sum));
       sum:=0;r:=0;
    end;
  until eof(fx);
  {writeln(ft);}
  writeln(fc,IntToStr(sum));
{  CloseFile(ft);}
  CloseFile(fc);
  CloseFile(fx);
end;

function VytvorVpp_v2011:AnsiString; {platne od 1.1.2011}
var pc:integer;
    Year, Month, Day: Word;
    U1,U2,U3,cSumFrm,cPocFrm: string;
    oldDecimalSeparator: char;
    ObdVyplatenia: longint;
begin with DM do begin
  oldDecimalSeparator := DecimalSeparator;
  DecimalSeparator := '.';
  try
  cSumFrm := '%0.2f';
  cPocFrm := '%0.0f';
  pc:=0;
  ObdVyplatenia := Obdobie_ADD_MM(X.AktObdobie,1);
  MyXML := '';
  E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
  E_TEXT('<!-- Vytvorene: dna '+DateToStr(Now)+' -->');
  E_TEXT('<vpp   xmlns="http://socpoist.sk/xsd/vpp2011" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://socpoist.sk/xsd/vpp2011 VPP-v2011.xsd">');
  E_TAG('typDoc','VPP00001');
  E_TAG('cisloVykazu',LPAD(IntToStr(ObdVyplatenia mod 100),2,'0')+'99'+IntToStr(ObdVyplatenia div 100));
  E_TAG('obdobieVyplPrijmov',LPAD(IntToStr(ObdVyplatenia mod 100),2,'0')+IntToStr(ObdVyplatenia div 100));
  E_TAG('typVykazu',X.Vykaz_riadny);
  E_TAGZ('zamestnavatel');
  E_TAGZ('identifikacia');
  E_TAG('icz',TINF_ICZ.Value);
  E_TAGZ('identifikator');
  if TINF_SP_IDENTIFIKATOR.Value = 1 {1=ICO,2=DIC}
  then E_TAG('ico',TINF_ICO.Value)
  else E_TAG('dic',TINF_DIC.Value);
  E_TAGK('identifikator');
  E_TAG('nazov',TINF_NAZOV.Value);
  E_TAGK('identifikacia');
  E_TAGZ('korAdresa');
  E_TAGZ('adresa');
  MyRozdelUlicuExt(TINF_ADR_Ulica1.Value,U1,U2,U3);
  if U1<>'' then
  begin
    E_TAG('ulica',U1);
    if U3<>'' then
      E_TAG('supCislo',U3);
    E_TAG('oCislo',U2);
  end else
  begin
    E_TAG('supCislo',U2);
  end;
  E_TAG('obec',TINF_ADR_MESTO.Value);
  E_TAG('psc',TINF_ADR_PSC.Value);
  E_TAG('stat',TINF_L_ADR_STAT_AAA.Value);
  E_TAGK('adresa');
  E_TAG('tel',TINF_ADR_TELEFON.Value);
  E_TAG('fax',TINF_ADR_FAX.Value);
  E_TAG('mail',TINF_ADR_EMAIL.Value);
  E_TAGK('korAdresa');
  E_TAGZ('ucet');
  E_TAG('nazovSidloBanky',TINF_NAZOV_BANKY.Value);
  E_TAG('kodBanky',TINF_BANKA_U.Value);
  E_TAG('cisloUctu',LongCisloU(TINF_Predcislo_u.Value,TINF_Cislo_u.Value));
  E_TAGK('ucet');
  E_TAGK('zamestnavatel');
  {--}
  E_TAGZ('poistne');
  try
  ReportSP2005VY:=TReportSP2005VY.Create(Application);
  ReportSP2005VY.SetX(X);
  ReportSP2005VY.VypocitajOdvody('NP');

  E_TAGZ('np');
  E_TAG('pocZamNP',Format(cPocFrm,[MyOdvodyNP[0].p_nemoc]));
  E_TAG('npZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_nemoc]));
  E_TAG('npZamnec',Format(cSumFrm,[MyOdvodyNP[0].o_nemoc]));
  E_TAGK('np');

  E_TAGZ('sp');
  E_TAG('pocZamSP',Format(cPocFrm,[MyOdvodyNP[0].p_dochod]));
  E_TAG('spZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_dochod]));
  E_TAG('spZamnec',Format(cSumFrm,[MyOdvodyNP[0].o_dochod]));
  E_TAGK('sp');

  E_TAGZ('ip');
  E_TAG('pocZamIP',Format(cPocFrm,[MyOdvodyNP[0].p_invalid]));
  E_TAG('ipZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_invalid]));
  E_TAG('ipZamnec',Format(cSumFrm,[MyOdvodyNP[0].o_invalid]));
  E_TAGK('ip');

  E_TAGZ('pvn');
  E_TAG('pocZamPvN',Format(cPocFrm,[MyOdvodyNP[0].p_fondzam]));
  E_TAG('pvnZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_fondzam]));
  E_TAG('pvnZamnec',Format(cSumFrm,[MyOdvodyNP[0].o_fondzam]));
  E_TAGK('pvn');

  E_TAGZ('up');
  E_TAG('pocZamUP',Format(cPocFrm,[MyOdvodyNP[0].p_uraz]));
  E_TAG('upZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_uraz]));
  E_TAGK('up');

  E_TAGZ('gp');
  E_TAG('pocZamGP',Format(cPocFrm,[MyOdvodyNP[0].p_garancne]));
  E_TAG('gpZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_garancne]));
  E_TAGK('gp');

  E_TAGZ('rfs');
  E_TAG('pocZamRfs',Format(cPocFrm,[MyOdvodyNP[0].p_rezerva]));
  E_TAG('rfsZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_rezerva]));
  E_TAGK('rfs');

  E_TAG('spoluPoistne',Format(cSumFrm,[MyOdvodyNP[0].p_spolu]));

  E_TAGK('poistne');
  finally
  ReportSP2005VY.Free;
  end;
  {--}
  E_TAGZ('vystavenie');
  E_TAG('zostavil',X.Vykaz_zostavil);
  DecodeDate(now, Year, Month, Day);
  E_TAG('datum',LPAD(IntToStr(Day),2,'0')+'.'
                +LPAD(IntToStr(Month),2,'0')+'.'
                +IntToStr(Year));
  E_TAGK('vystavenie');
  {--}
  E_TAGZ('priloha');
  E_TAGZ('poistneZamestnancov');
  {--}
  try
  ReportSP2005PR:=TReportSP2005PR.Create(Application);
  ReportSP2005PR.SetX(X);
  ReportSP2005PR.ShowReportStart_NP;
(*
  ReportSP2005PR.Q2_.Close;
  ReportSP2005PR.Q2_.ParamByName('P1').Value := X.AktObdobie;
  ReportSP2005PR.Q2_.Open;
*)
  {--}
  while not ReportSP2005PR.Q2_.EOF do
  begin
    Inc(pc);
    E_ATTRZ('pc',IntToStr(pc));
    E_TAG('obdobie',LPAD(IntToStr(MyMesiac(ReportSP2005PR.Q2_V_obdobie_vyp.Value)),2,'0')+IntToStr(MyRok(ReportSP2005PR.Q2_V_obdobie_vyp.Value)));
    E_ATTR('rc',ReportSP2005PR.Q2_Calc_Born_numb.Value);
    E_ATTR('pocDni',ReportSP2005PR.Q2_Kal_dni.AsString);
    if ReportSP2005PR.Q2_typzec.Value = 2  then E_ATTR('typZec','D')
    else if ReportSP2005PR.Q2_typzec.Value = 3 then E_ATTR('typZec','NP')
    else E_ATTR('typZec','PP');
    E_ATTR('vynimkaVZ',ReportSP2005PR.Q2_Vynimka_vz.Value);
    E_ATTR('rozsahSP',ReportSP2005PR.Q2_CALC_ROZSAH_SP.Value);
    E_ATTR('vzNp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_np.Value]));
    E_ATTR('vzSp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_dp.Value]));
    E_ATTR('vzIp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_ip.Value]));
    E_ATTR('vzPvn',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_fz.Value]));
    E_ATTR('vzUp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_up.Value]));
    E_ATTR('vzGp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_gp.Value]));
    E_ATTR('vzRfs',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_rf.Value]));
    E_ATTR('npZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_nemoc.Value]));
    E_ATTR('npZamnec',Format(cSumFrm,[ReportSP2005PR.Q2_o_nemoc.Value]));
    E_ATTR('spZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_dochod.Value]));
    E_ATTR('spZamnec',Format(cSumFrm,[ReportSP2005PR.Q2_o_dochod.Value]));
    E_ATTR('ipZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_invalid.Value]));
    E_ATTR('ipZamnec',Format(cSumFrm,[ReportSP2005PR.Q2_o_invalid.Value]));
    E_ATTR('pvnZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_fondzam.Value]));
    E_ATTR('pvnZamnec',Format(cSumFrm,[ReportSP2005PR.Q2_o_fondzam.Value]));
    E_ATTR('upZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_uraz.Value]));
    E_ATTR('gpZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_garancne.Value]));
    E_ATTR('rfsZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_rezerva.Value]));
    E_TAGA('poistneZamestnanca',MyAttr);
    ReportSP2005PR.Q2_.Next;
  end;
  {--}
  while not ReportSP2005PR.Q2_.EOF do
  begin
    Inc(pc);
    E_ATTRZ('pc',IntToStr(pc));
    E_TAG('obdobie',LPAD(IntToStr(MyMesiac(ReportSP2005PR.Q2_V_obdobie_vyp.Value)),2,'0')+IntToStr(MyRok(ReportSP2005PR.Q2_V_obdobie_vyp.Value)));
    E_ATTR('rc',ReportSP2005PR.Q2_Calc_Born_numb.Value);
    E_ATTR('pocDni',ReportSP2005PR.Q2_Kal_dni.AsString);
    if ReportSP2005PR.Q2_typzec.Value = 2  then E_ATTR('typZec','D')
    else if ReportSP2005PR.Q2_typzec.Value = 3 then E_ATTR('typZec','NP')
    else E_ATTR('typZec','PP');
    E_ATTR('vynimkaVZ',ReportSP2005PR.Q2_Vynimka_vz.Value);
    E_ATTR('rozsahSP',ReportSP2005PR.Q2_CALC_ROZSAH_SP.Value);
    E_ATTR('vzNp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_np.Value]));
    E_ATTR('vzSp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_dp.Value]));
    E_ATTR('vzIp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_ip.Value]));
    E_ATTR('vzPvn',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_fz.Value]));
    E_ATTR('vzUp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_up.Value]));
    E_ATTR('vzGp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_gp.Value]));
    E_ATTR('vzRfs',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_rf.Value]));
    E_ATTR('npZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_nemoc.Value]));
    E_ATTR('npZamnec',Format(cSumFrm,[ReportSP2005PR.Q2_o_nemoc.Value]));
    E_ATTR('spZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_dochod.Value]));
    E_ATTR('spZamnec',Format(cSumFrm,[ReportSP2005PR.Q2_o_dochod.Value]));
    E_ATTR('ipZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_invalid.Value]));
    E_ATTR('ipZamnec',Format(cSumFrm,[ReportSP2005PR.Q2_o_invalid.Value]));
    E_ATTR('pvnZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_fondzam.Value]));
    E_ATTR('pvnZamnec',Format(cSumFrm,[ReportSP2005PR.Q2_o_fondzam.Value]));
    E_ATTR('upZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_uraz.Value]));
    E_ATTR('gpZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_garancne.Value]));
    E_ATTR('rfsZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_rezerva.Value]));
    E_TAGA('poistneZamestnanca',MyAttr);
    ReportSP2005PR.Q2_.Next;
  end;
  ReportSP2005PR.Q2_.Close;
  ReportSP2005PR.ShowReportEnd;
  finally
  ReportSP2005PR.Free;
  end;
  E_TAGK('poistneZamestnancov');
  E_TAGK('priloha');
  E_TAGK('vpp');
  finally
    DecimalSeparator := oldDecimalSeparator;
  end;
  Result := MyXml;
end;end; {VytvorVpp_v2011}

function VytvorVpp_v2013:AnsiString; {platne od 1.1.2013}
var pc:integer;
    Year, Month, Day: Word;
    U1,U2,U3,cSumFrm,cPocFrm: string;
    oldDecimalSeparator: char;
    ObdVyplatenia: longint;
begin with DM do begin
  oldDecimalSeparator := DecimalSeparator;
  DecimalSeparator := '.';
  try
  cSumFrm := '%0.2f';
  cPocFrm := '%0.0f';
  pc:=0;
  ObdVyplatenia := Obdobie_ADD_MM(X.AktObdobie,1);
  MyXML := '';
  E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
  E_TEXT('<!-- Vytvorene: dna '+DateToStr(Now)+' -->');
  E_TEXT('<vpp   xmlns="http://socpoist.sk/xsd/vpp2013" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://socpoist.sk/xsd/vpp2013 VPP-v2013.xsd">');
  E_TAG('typDoc','VPP00001');
  E_TAG('cisloVykazu',LPAD(IntToStr(ObdVyplatenia mod 100),2,'0')+'99'+IntToStr(ObdVyplatenia div 100));
  E_TAG('obdobieVyplPrijmov',LPAD(IntToStr(ObdVyplatenia mod 100),2,'0')+IntToStr(ObdVyplatenia div 100));
  E_TAG('typVykazu',X.Vykaz_riadny);
  E_TAGZ('zamestnavatel');
  E_TAGZ('identifikacia');
  E_TAG('icz',TINF_ICZ.Value);
  E_TAGZ('identifikator');
  if TINF_SP_IDENTIFIKATOR.Value = 1 {1=ICO,2=DIC}
  then E_TAG('ico',TINF_ICO.Value)
  else E_TAG('dic',TINF_DIC.Value);
  E_TAGK('identifikator');
  E_TAG('nazov',TINF_NAZOV.Value);
  EX_TAG('tel',TINF_ADR_TELEFON.Value);
  EX_TAG('mail',TINF_ADR_EMAIL.Value);
  E_TAGK('identifikacia');
  E_TAGZ('ucet');
  E_TAG('nazovSidloBanky',TINF_NAZOV_BANKY.Value);
  E_TAG('kodBanky',TINF_BANKA_U.Value);
  E_TAG('cisloUctu',LongCisloU(TINF_Predcislo_u.Value,TINF_Cislo_u.Value));
  E_TAGK('ucet');
  E_TAGK('zamestnavatel');
  {--}
  E_TAGZ('poistne');
  try
  ReportSP2005VY:=TReportSP2005VY.Create(Application);
  ReportSP2005VY.SetX(X);
  ReportSP2005VY.VypocitajOdvody('NP');

  E_TAGZ('np');
  E_TAG('npZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_nemoc]));
  E_TAG('npZamnec',Format(cSumFrm,[MyOdvodyNP[0].o_nemoc]));
  E_TAGK('np');

  E_TAGZ('sp');
  E_TAG('spZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_dochod]));
  E_TAG('spZamnec',Format(cSumFrm,[MyOdvodyNP[0].o_dochod]));
  E_TAGK('sp');

  E_TAGZ('ip');
  E_TAG('ipZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_invalid]));
  E_TAG('ipZamnec',Format(cSumFrm,[MyOdvodyNP[0].o_invalid]));
  E_TAGK('ip');

  E_TAGZ('pvn');
  E_TAG('pvnZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_fondzam]));
  E_TAG('pvnZamnec',Format(cSumFrm,[MyOdvodyNP[0].o_fondzam]));
  E_TAGK('pvn');

  E_TAGZ('up');
  E_TAG('upZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_uraz]));
  E_TAG('upZamnec',Format(cSumFrm,[0.0])); {zatial sa nepouziva}
  E_TAGK('up');

  E_TAGZ('gp');
  E_TAG('gpZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_garancne]));
  E_TAG('gpZamnec',Format(cSumFrm,[0.0])); {zatial sa nepouziva}
  E_TAGK('gp');

  E_TAGZ('rfs');
  E_TAG('rfsZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_rezerva]));
  E_TAG('rfsZamnec',Format(cSumFrm,[0.0])); {zatial sa nepouziva}
  E_TAGK('rfs');

  E_TAG('spoluPoistne',Format(cSumFrm,[MyOdvodyNP[0].p_spolu]));

  E_TAGK('poistne');
  finally
  ReportSP2005VY.Free;
  end;
  {--}
  E_TAGZ('vystavenie');
  E_TAG('zostavil',X.Vykaz_zostavil);
  DecodeDate(now, Year, Month, Day);
  E_TAG('datum',LPAD(IntToStr(Day),2,'0')+'.'
                +LPAD(IntToStr(Month),2,'0')+'.'
                +IntToStr(Year));
  E_TAGK('vystavenie');
  {--}
  E_TAGZ('priloha');
  E_TAGZ('poistneZamestnancov');
  {--}
  try
  ReportSP2005PR:=TReportSP2005PR.Create(Application);
  ReportSP2005PR.SetX(X);
  ReportSP2005PR.ShowReportStart_NP;
  {--}
  while not ReportSP2005PR.Q2_.EOF do
  begin
    Inc(pc);
    E_ATTRZ('pc',IntToStr(pc));
    E_ATTR('obdobie',LPAD(IntToStr(MyMesiac(ReportSP2005PR.Q2_V_obdobie_vyp.Value)),2,'0')+IntToStr(MyRok(ReportSP2005PR.Q2_V_obdobie_vyp.Value)));
    E_ATTR('rc',ReportSP2005PR.Q2_Calc_Born_numb.Value);
    E_ATTR('pocDni',ReportSP2005PR.Q2_Kal_dni.AsString);
    if slTypZecCode[ReportSP2005PR.Q2_typzec.Value] = 'ZECD' then E_ATTR('typZec','ZECD1')
    else if slTypZecCode[ReportSP2005PR.Q2_typzec.Value] = 'ZECDDPP' then E_ATTR('typZec','ZECD3V')
    else if slTypZecCode[ReportSP2005PR.Q2_typzec.Value] = 'ZECDDPN' then E_ATTR('typZec','ZECD3NV')
    else E_ATTR('typZec',slTypZecCode[ReportSP2005PR.Q2_typzec.Value]);
    E_ATTR('vynimkaVZ',ReportSP2005PR.Q2_Vynimka_vz.Value);
    E_ATTR('rozsahSP',ReportSP2005PR.Q2_CALC_ROZSAH_SP.Value);
    E_ATTR('vzNp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_np.Value]));
    E_ATTR('vzSp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_dp.Value]));
    E_ATTR('vzIp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_ip.Value]));
    E_ATTR('vzPvn',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_fz.Value]));
    E_ATTR('vzUp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_up.Value]));
    E_ATTR('vzGp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_gp.Value]));
    E_ATTR('vzRfs',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_rf.Value]));
    E_ATTR('vzZecNp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_np.Value]));
    E_ATTR('vzZecSp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_dp.Value]));
    E_ATTR('vzZecIp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_ip.Value]));
    E_ATTR('vzZecPvn',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_fz.Value]));
    E_ATTR('vzZecUp',Format(cSumFrm,[0.0]));
    E_ATTR('vzZecGp',Format(cSumFrm,[0.0]));
    E_ATTR('vzZecRfs',Format(cSumFrm,[0.0]));
    E_ATTR('npZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_nemoc.Value]));
    E_ATTR('npZamnec',Format(cSumFrm,[ReportSP2005PR.Q2_o_nemoc.Value]));
    E_ATTR('spZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_dochod.Value]));
    E_ATTR('spZamnec',Format(cSumFrm,[ReportSP2005PR.Q2_o_dochod.Value]));
    E_ATTR('ipZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_invalid.Value]));
    E_ATTR('ipZamnec',Format(cSumFrm,[ReportSP2005PR.Q2_o_invalid.Value]));
    E_ATTR('pvnZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_fondzam.Value]));
    E_ATTR('pvnZamnec',Format(cSumFrm,[ReportSP2005PR.Q2_o_fondzam.Value]));
    E_ATTR('upZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_uraz.Value]));
    E_ATTR('upZamnec',Format(cSumFrm,[0.0]));
    E_ATTR('gpZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_garancne.Value]));
    E_ATTR('gpZamnec',Format(cSumFrm,[0.0]));
    E_ATTR('rfsZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_rezerva.Value]));
    E_ATTR('rfsZamnec',Format(cSumFrm,[0.0]));
    E_TAGA('poistneZamestnanca',MyAttr);
    if (ReportSP2005PR.Q2_poSkonceni.Value)
      then E_ATTR('poSkonceni',LOWERCASE(ReportSP2005PR.Q2_poSkonceni.AsString));
    if (ReportSP2005PR.Q2_pocDniStrajku.AsString<>'') and  (ReportSP2005PR.Q2_pocDniStrajku.AsString<>'0')
      then E_ATTR('pocDniStrajku',ReportSP2005PR.Q2_pocDniStrajku.AsString);
    ReportSP2005PR.Q2_.Next;
  end;
  ReportSP2005PR.Q2_.Close;
{--}
  while not ReportSP2005PR.Q0_.EOF do
  begin
    Inc(pc);
    E_ATTRZ('pc',IntToStr(pc));
    E_ATTR('obdobie',LPAD(IntToStr(MyMesiac(X.AktObdobie)),2,'0')+IntToStr(MyRok(X.AktObdobie)));
    E_ATTR('rc',ReportSP2005PR.Q0_Calc_Born_numb.Value);
    E_ATTR('pocDni',ReportSP2005PR.Q0_CALC_dni.AsString);
    {DM.CIS10_.FindKey([ReportSP2005PR.Q0_typzec.Value]);}
    if slTypZecCode[ReportSP2005PR.Q0_vyptypzec.Value] = 'ZECD' then E_ATTR('typZec','ZECD1')
    else if slTypZecCode[ReportSP2005PR.Q0_vyptypzec.Value] = 'ZECDDPP' then E_ATTR('typZec','ZECD3V')
    else if slTypZecCode[ReportSP2005PR.Q0_vyptypzec.Value] = 'ZECDDPN' then E_ATTR('typZec','ZECD3NV')
    else E_ATTR('typZec',slTypZecCode[ReportSP2005PR.Q0_vyptypzec.Value]);
    (*
    if ReportSP2005PR.Q0_typzec.Value = 2  then E_ATTR('typZec','D')
    else if ReportSP2005PR.Q0_typzec.Value = 3 then E_ATTR('typZec','NP')
    else E_ATTR('typZec','PP');
    *)
    E_ATTR('vynimkaVZ',ReportSP2005PR.Q0_Vynimka_vz.Value);
    E_ATTR('rozsahSP',ReportSP2005PR.Q0_CALC_ROZSAH_SP.Value);
    E_ATTR('vzNp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_np.Value]));
    E_ATTR('vzSp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_dp.Value]));
    E_ATTR('vzIp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_ip.Value]));
    E_ATTR('vzPvn',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_fz.Value]));
    E_ATTR('vzUp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_up.Value]));
    E_ATTR('vzGp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_gp.Value]));
    E_ATTR('vzRfs',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_rf.Value]));
    E_ATTR('vzZecNp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_np.Value]));
    E_ATTR('vzZecSp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_dp.Value]));
    E_ATTR('vzZecIp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_ip.Value]));
    E_ATTR('vzZecPvn',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_fz.Value]));
    E_ATTR('vzZecUp',Format(cSumFrm,[0.0]));
    E_ATTR('vzZecGp',Format(cSumFrm,[0.0]));
    E_ATTR('vzZecRfs',Format(cSumFrm,[0.0]));
    E_ATTR('npZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_nemoc.Value]));
    E_ATTR('npZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_nemoc.Value]));
    E_ATTR('spZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_dochod.Value]));
    E_ATTR('spZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_dochod.Value]));
    E_ATTR('ipZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_invalid.Value]));
    E_ATTR('ipZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_invalid.Value]));
    E_ATTR('pvnZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_fondzam.Value]));
    E_ATTR('pvnZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_fondzam.Value]));
    E_ATTR('upZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_uraz.Value]));
    E_ATTR('upZamnec',Format(cSumFrm,[0.0]));
    E_ATTR('gpZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_garancne.Value]));
    E_ATTR('gpZamnec',Format(cSumFrm,[0.0]));
    E_ATTR('rfsZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_rezerva.Value]));
    E_ATTR('rfsZamnec',Format(cSumFrm,[0.0]));
    if (ReportSP2005PR.Q0_poSkonceni.Value)
      then E_ATTR('poSkonceni',LOWERCASE(ReportSP2005PR.Q0_poSkonceni.AsString));
    if (ReportSP2005PR.Q0_pocDniStrajku.AsString<>'') and  (ReportSP2005PR.Q0_pocDniStrajku.AsString<>'0')
      then E_ATTR('pocDniStrajku',ReportSP2005PR.Q0_pocDniStrajku.AsString);
    E_TAGA('poistneZamestnanca',MyAttr);
    ReportSP2005PR.Q0_.Next;
  end;
  ReportSP2005PR.ShowReportEnd;
  finally
  ReportSP2005PR.Free;
  end;
  E_TAGK('poistneZamestnancov');
  E_TAGK('priloha');
  E_TAGK('vpp');
  finally
    DecimalSeparator := oldDecimalSeparator;
  end;
  Result := MyXml;
end;end; {VytvorVpp_v2013}

{--------------------------------------------}
function VytvorVpp_v2014:AnsiString; {platne od 1.1.2013}
var pc:integer;
    Year, Month, Day: Word;
    U1,U2,U3,cSumFrm,cPocFrm: string;
    oldDecimalSeparator: char;
    ObdVyplatenia: longint;
begin with DM do begin
  oldDecimalSeparator := DecimalSeparator;
  DecimalSeparator := '.';
  try
  cSumFrm := '%0.2f';
  cPocFrm := '%0.0f';
  pc:=0;
  ObdVyplatenia := Obdobie_ADD_MM(X.AktObdobie,1);
  MyXML := '';
  E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
  E_TEXT('<vpp xmlns="http://socpoist.sk/xsd/vpp2014" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://socpoist.sk/xsd/vpp2014 VPP-v2014.xsd">');
  E_TAG('typDoc','VPP00001');
  E_TAG('cisloVykazu',LPAD(IntToStr(ObdVyplatenia mod 100),2,'0')+'99'+IntToStr(ObdVyplatenia div 100));
  E_TAG('obdobieVyplPrijmov',LPAD(IntToStr(ObdVyplatenia mod 100),2,'0')+IntToStr(ObdVyplatenia div 100));
  E_TAG('typVykazu',X.Vykaz_riadny);
  E_TAGZ('zamestnavatel');
  E_TAGZ('identifikacia');
  E_TAG('variabilnySymbol',TINF_ICZ.Value);
  E_TAGZ('identifikator');
  if TINF_SP_IDENTIFIKATOR.Value = 1 {1=ICO,2=DIC}
  then E_TAG('ico',TINF_ICO.Value)
  else E_TAG('dic',TINF_DIC.Value);
  E_TAGK('identifikator');
  E_TAG('nazov',TINF_NAZOV.Value);
  EX_TAG('tel',TINF_ADR_TELEFON.Value);
  EX_TAG('mail',TINF_ADR_EMAIL.Value);
  E_TAGK('identifikacia');
  E_TAGZ('ucet');
  E_TAG('nazovSidloBanky',TINF_NAZOV_BANKY.Value);
  E_TAG('iban',TINF_IBAN.Value);
(*
  E_TAG('kodBanky',TINF_BANKA_U.Value);
  E_TAG('cisloUctu',LongCisloU(TINF_Predcislo_u.Value,TINF_Cislo_u.Value));
*)
  E_TAGK('ucet');
  E_TAGK('zamestnavatel');
  {--}
  E_TAGZ('poistne');
  try
  ReportSP2005VY:=TReportSP2005VY.Create(Application);
  ReportSP2005VY.SetX(X);
  ReportSP2005VY.VypocitajOdvody('NP');

  E_TAGZ('np');
  E_TAG('npZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_nemoc]));
  E_TAG('npZamnec',Format(cSumFrm,[MyOdvodyNP[0].o_nemoc]));
  E_TAGK('np');

  E_TAGZ('sp');
  E_TAG('spZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_dochod]));
  E_TAG('spZamnec',Format(cSumFrm,[MyOdvodyNP[0].o_dochod]));
  E_TAGK('sp');

  E_TAGZ('ip');
  E_TAG('ipZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_invalid]));
  E_TAG('ipZamnec',Format(cSumFrm,[MyOdvodyNP[0].o_invalid]));
  E_TAGK('ip');

  E_TAGZ('pvn');
  E_TAG('pvnZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_fondzam]));
  E_TAG('pvnZamnec',Format(cSumFrm,[MyOdvodyNP[0].o_fondzam]));
  E_TAGK('pvn');

  E_TAGZ('up');
  E_TAG('upZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_uraz]));
  E_TAG('upZamnec',Format(cSumFrm,[0.0])); {zatial sa nepouziva}
  E_TAGK('up');

  E_TAGZ('gp');
  E_TAG('gpZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_garancne]));
  E_TAG('gpZamnec',Format(cSumFrm,[0.0])); {zatial sa nepouziva}
  E_TAGK('gp');

  E_TAGZ('rfs');
  E_TAG('rfsZamtel',Format(cSumFrm,[MyOdvodyNP[0].z_rezerva]));
  E_TAG('rfsZamnec',Format(cSumFrm,[0.0])); {zatial sa nepouziva}
  E_TAGK('rfs');

  E_TAG('spoluPoistne',Format(cSumFrm,[MyOdvodyNP[0].p_spolu]));

  E_TAGK('poistne');
  finally
  ReportSP2005VY.Free;
  end;
  {--}
  E_TAGZ('fOsoba');
  E_TAG('priezvisko',X.Ucto_priezvisko);
  E_TAG('meno',X.Ucto_meno);
  E_TAG('tel',X.Ucto_Tel);
  E_TAG('mail',X.Ucto_Mail);
  E_TAGK('fOsoba');
  {--}
  E_TAGZ('vystavenie');
  E_TAG('zostavil',X.Vykaz_zostavil);
  DecodeDate(now, Year, Month, Day);
  E_TAG('datum',LPAD(IntToStr(Day),2,'0')+'.'
                +LPAD(IntToStr(Month),2,'0')+'.'
                +IntToStr(Year));
  E_TAGK('vystavenie');
  {--}
  E_TAGZ('priloha');
  E_TAGZ('poistneZamestnancov');
  {--}
  try
  ReportSP2005PR:=TReportSP2005PR.Create(Application);
  ReportSP2005PR.SetX(X);
  ReportSP2005PR.ShowReportStart_NP;
  {--}
  while not ReportSP2005PR.Q2_.EOF do
  begin
    Inc(pc);
    E_ATTRZ('pc',IntToStr(pc));
    E_ATTR('obdobie',LPAD(IntToStr(MyMesiac(ReportSP2005PR.Q2_V_obdobie_vyp.Value)),2,'0')+IntToStr(MyRok(ReportSP2005PR.Q2_V_obdobie_vyp.Value)));
    E_ATTR('rc',ReportSP2005PR.Q2_Calc_Born_numb.Value);
    E_ATTR('pocDni',ReportSP2005PR.Q2_Kal_dni.AsString);
    if slTypZecCode[ReportSP2005PR.Q2_typzec.Value] = 'ZECD' then E_ATTR('typZec','ZECD1')
    else if slTypZecCode[ReportSP2005PR.Q2_typzec.Value] = 'ZECDDPP' then E_ATTR('typZec','ZECD3V')
    else if slTypZecCode[ReportSP2005PR.Q2_typzec.Value] = 'ZECDDPN' then E_ATTR('typZec','ZECD3NV')
    else E_ATTR('typZec',slTypZecCode[ReportSP2005PR.Q2_typzec.Value]);
    E_ATTR('vynimkaVZ',ReportSP2005PR.Q2_Vynimka_vz.Value);
    E_ATTR('rozsahSP',ReportSP2005PR.Q2_CALC_ROZSAH_SP.Value);
    E_ATTR('vzNp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_np.Value]));
    E_ATTR('vzSp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_dp.Value]));
    E_ATTR('vzIp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_ip.Value]));
    E_ATTR('vzPvn',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_fz.Value]));
    E_ATTR('vzUp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_up.Value]));
    E_ATTR('vzGp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_gp.Value]));
    E_ATTR('vzRfs',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_rf.Value]));
    E_ATTR('vzZecNp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_np.Value]));
    E_ATTR('vzZecSp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_dp.Value]));
    E_ATTR('vzZecIp',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_ip.Value]));
    E_ATTR('vzZecPvn',Format(cSumFrm,[ReportSP2005PR.Q2_N_zaklad_fz.Value]));
    E_ATTR('vzZecUp',Format(cSumFrm,[0.0]));
    E_ATTR('vzZecGp',Format(cSumFrm,[0.0]));
    E_ATTR('vzZecRfs',Format(cSumFrm,[0.0]));
    E_ATTR('npZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_nemoc.Value]));
    E_ATTR('npZamnec',Format(cSumFrm,[ReportSP2005PR.Q2_o_nemoc.Value]));
    E_ATTR('spZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_dochod.Value]));
    E_ATTR('spZamnec',Format(cSumFrm,[ReportSP2005PR.Q2_o_dochod.Value]));
    E_ATTR('ipZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_invalid.Value]));
    E_ATTR('ipZamnec',Format(cSumFrm,[ReportSP2005PR.Q2_o_invalid.Value]));
    E_ATTR('pvnZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_fondzam.Value]));
    E_ATTR('pvnZamnec',Format(cSumFrm,[ReportSP2005PR.Q2_o_fondzam.Value]));
    E_ATTR('upZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_uraz.Value]));
    E_ATTR('upZamnec',Format(cSumFrm,[0.0]));
    E_ATTR('gpZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_garancne.Value]));
    E_ATTR('gpZamnec',Format(cSumFrm,[0.0]));
    E_ATTR('rfsZamtel',Format(cSumFrm,[ReportSP2005PR.Q2_oz_rezerva.Value]));
    E_ATTR('rfsZamnec',Format(cSumFrm,[0.0]));
    if (ReportSP2005PR.Q2_poSkonceni.Value)
      then E_ATTR('poSkonceni',LOWERCASE(ReportSP2005PR.Q2_poSkonceni.AsString));
    if (ReportSP2005PR.Q2_pocDniStrajku.AsString<>'') and  (ReportSP2005PR.Q2_pocDniStrajku.AsString<>'0')
      then E_ATTR('pocDniStrajku',ReportSP2005PR.Q2_pocDniStrajku.AsString);
    if (ReportSP2005PR.Q2_pocDniObdobia.AsString<>'') and  (ReportSP2005PR.Q2_pocDniObdobia.AsString<>'0')
      then E_ATTR('pocDniObdobia',ReportSP2005PR.Q2_pocDniObdobia.AsString);

    if NOT(ReportSP2005PR.Q2_vylucDobyTrva.Value) then
    //Ak je oznacený príznak 'trvá' pre vylúcené doby, nemôže byt zároven vyplnený dátum 'OD' alebo 'DO'
    begin
       if (ReportSP2005PR.Q2_vylucDobyObdobieOd.AsString<>'') and  (ReportSP2005PR.Q2_vylucDobyObdobieOd.AsString<>'0')
         then begin
           DecodeDate(ReportSP2005PR.Q2_vylucDobyObdobieOd.Value, Year, Month, Day);
           E_ATTR('vylucDobyObdobieOd',LPAD(IntToStr(Day),2,'0')+'.'
                   +LPAD(IntToStr(Month),2,'0')+'.'
                   +IntToStr(Year));
         end;
       if (ReportSP2005PR.Q2_vylucDobyObdobieDo.AsString<>'') and  (ReportSP2005PR.Q2_vylucDobyObdobieDo.AsString<>'0')
         then begin
           DecodeDate(ReportSP2005PR.Q2_vylucDobyObdobieDo.Value, Year, Month, Day);
           E_ATTR('vylucDobyObdobieDo',LPAD(IntToStr(Day),2,'0')+'.'
                   +LPAD(IntToStr(Month),2,'0')+'.'
                   +IntToStr(Year));
         end;
    end;

    if (ReportSP2005PR.Q2_vylucDobyTrva.Value)
      then E_ATTR('vylucDobyTrva',LOWERCASE(ReportSP2005PR.Q2_vylucDobyTrva.AsString));
    E_TAGA('poistneZamestnanca',MyAttr);
    ReportSP2005PR.Q2_.Next;
  end;
  ReportSP2005PR.Q2_.Close;
{--}
  while not ReportSP2005PR.Q0_.EOF do
  begin
    Inc(pc);
    E_ATTRZ('pc',IntToStr(pc));
    E_ATTR('obdobie',LPAD(IntToStr(MyMesiac(X.AktObdobie)),2,'0')+IntToStr(MyRok(X.AktObdobie)));
    E_ATTR('rc',ReportSP2005PR.Q0_Calc_Born_numb.Value);
    E_ATTR('pocDni',ReportSP2005PR.Q0_CALC_dni.AsString);
    {DM.CIS10_.FindKey([ReportSP2005PR.Q0_typzec.Value]);}
    if slTypZecCode[ReportSP2005PR.Q0_vyptypzec.Value] = 'ZECD' then E_ATTR('typZec','ZECD1')
    else if slTypZecCode[ReportSP2005PR.Q0_vyptypzec.Value] = 'ZECDDPP' then E_ATTR('typZec','ZECD3V')
    else if slTypZecCode[ReportSP2005PR.Q0_vyptypzec.Value] = 'ZECDDPN' then E_ATTR('typZec','ZECD3NV')
    else E_ATTR('typZec',slTypZecCode[ReportSP2005PR.Q0_vyptypzec.Value]);
    (*
    if ReportSP2005PR.Q0_typzec.Value = 2  then E_ATTR('typZec','D')
    else if ReportSP2005PR.Q0_typzec.Value = 3 then E_ATTR('typZec','NP')
    else E_ATTR('typZec','PP');
    *)
    E_ATTR('vynimkaVZ',ReportSP2005PR.Q0_Vynimka_vz.Value);
    E_ATTR('rozsahSP',ReportSP2005PR.Q0_CALC_ROZSAH_SP.Value);
    E_ATTR('vzNp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_np.Value]));
    E_ATTR('vzSp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_dp.Value]));
    E_ATTR('vzIp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_ip.Value]));
    E_ATTR('vzPvn',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_fz.Value]));
    E_ATTR('vzUp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_up.Value]));
    E_ATTR('vzGp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_gp.Value]));
    E_ATTR('vzRfs',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_rf.Value]));
    E_ATTR('vzZecNp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_np.Value]));
    E_ATTR('vzZecSp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_dp.Value]));
    E_ATTR('vzZecIp',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_ip.Value]));
    E_ATTR('vzZecPvn',Format(cSumFrm,[ReportSP2005PR.Q0_N_zaklad_fz.Value]));
    E_ATTR('vzZecUp',Format(cSumFrm,[0.0]));
    E_ATTR('vzZecGp',Format(cSumFrm,[0.0]));
    E_ATTR('vzZecRfs',Format(cSumFrm,[0.0]));
    E_ATTR('npZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_nemoc.Value]));
    E_ATTR('npZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_nemoc.Value]));
    E_ATTR('spZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_dochod.Value]));
    E_ATTR('spZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_dochod.Value]));
    E_ATTR('ipZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_invalid.Value]));
    E_ATTR('ipZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_invalid.Value]));
    E_ATTR('pvnZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_fondzam.Value]));
    E_ATTR('pvnZamnec',Format(cSumFrm,[ReportSP2005PR.Q0_o_fondzam.Value]));
    E_ATTR('upZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_uraz.Value]));
    E_ATTR('upZamnec',Format(cSumFrm,[0.0]));
    E_ATTR('gpZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_garancne.Value]));
    E_ATTR('gpZamnec',Format(cSumFrm,[0.0]));
    E_ATTR('rfsZamtel',Format(cSumFrm,[ReportSP2005PR.Q0_oz_rezerva.Value]));
    E_ATTR('rfsZamnec',Format(cSumFrm,[0.0]));
    if (ReportSP2005PR.Q0_poSkonceni.Value)
      then E_ATTR('poSkonceni',LOWERCASE(ReportSP2005PR.Q0_poSkonceni.AsString));
    if (ReportSP2005PR.Q0_pocDniStrajku.AsString<>'') and  (ReportSP2005PR.Q0_pocDniStrajku.AsString<>'0')
      then E_ATTR('pocDniStrajku',ReportSP2005PR.Q0_pocDniStrajku.AsString);
    E_TAGA('poistneZamestnanca',MyAttr);
    ReportSP2005PR.Q0_.Next;
  end;
  ReportSP2005PR.ShowReportEnd;
  finally
  ReportSP2005PR.Free;
  end;
  E_TAGK('poistneZamestnancov');
  E_TAGK('priloha');
  E_TAGK('vpp');
  finally
    DecimalSeparator := oldDecimalSeparator;
  end;
  Result := MyXml;
end;end; {VytvorVpp_v2014}

function VytvorVppXml:AnsiString;
begin
  if X.Typ='VPPXML/v2014'
    then Result := VytvorVpp_v2014
  else if X.Typ='VPPXML/v2013'
    then Result := VytvorVpp_v2013
  else Result := VytvorVpp_v2011;
end;

procedure RunReportSpXml(const MyReportParam: TMyReportParam);
var POSLEDNY:integer;
begin with DM do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    FPathXML := MyAppPath+MenoXMLDir;
    CreateDir(MyAppPath+MenoXMLDir);
    if X.Typ='SPXML/v2013' then
    FNameXML := 'MVPP_'+TINF_ICO.Value+'_'+IntToStr(X.Obdobie1)+X.AktSidListSuffix+'_'
    else if X.Typ='SPXML/v2011' then
    FNameXML := 'MVPP_'+TINF_ICO.Value+'_'+IntToStr(X.Obdobie1)+X.AktSidListSuffix+'_'
    else if X.Typ='SPXML/2.7' then
    FNameXML := 'SPVykaz-v2.7_'+TINF_ICO.Value+'_'+IntToStr(X.Obdobie1)+X.AktSidListSuffix+'_'
    else if X.Typ='SPXML/2.5' then
    FNameXML := 'SPVykaz-v2.5_'+TINF_ICO.Value+'_'+IntToStr(X.Obdobie1)+X.AktSidListSuffix+'_'
    else
    FNameXML := 'SPVykaz_'+TINF_ICO.Value+'_'+IntToStr(X.Obdobie1)+X.AktSidListSuffix+'_';
    POSLEDNY := NajdiPosledny (FPathXML+'\'+FNameXML,'XML',3);
    if MyPoslednySubor <> '' then begin
      if not MyOtazka(Format(SMyAppVytvoritNovyXml,[MyPoslednySubor]))
        then exit;
    end;
    FNameXML := FNameXML + LPAD(IntToStr(POSLEDNY),3,'0')+'.xml';
    assignfile(F,FPathXML+'\'+FNameXML);
    rewrite(F);
    write(F,VytvorXML);
    CloseFile(F);
    if X.Obdobie1 <= ZAKON_2009_01 then
      VytvorConfSubor(FPathXML,FNameXml,Copy(FNameXml,1,LENGTH(FNameXml)-4)+'.txt');
    MyMessage(Format(SMyAppHPCompletedXml,[FPathXML+'\'+FNameXML]));
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
  end;
end;end;

procedure RunReportVppXml(const MyReportParam: TMyReportParam);
var POSLEDNY:integer;
begin with DM do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  try
  try
    FPathXML := MyAppPath+MenoXMLDir;
    CreateDir(MyAppPath+MenoXMLDir);
    FNameXML := 'VPP_'+TINF_ICO.Value+'_'+IntToStr(X.Obdobie1)+'_';
    POSLEDNY := NajdiPosledny (FPathXML+'\'+FNameXML,'XML',3);
    if MyPoslednySubor <> '' then begin
      if not MyOtazka(Format(SMyAppVytvoritNovyXml,[MyPoslednySubor]))
        then exit;
    end;
    FNameXML := FNameXML + LPAD(IntToStr(POSLEDNY),3,'0')+'.xml';
    assignfile(F,FPathXML+'\'+FNameXML);
    rewrite(F);
    write(F,VytvorVPPXml);
    CloseFile(F);
    MyMessage(Format(SMyAppHPCompletedXml,[FPathXML+'\'+FNameXML]));
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
  end;
end;end;

end.
