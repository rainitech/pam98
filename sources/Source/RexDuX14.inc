procedure RocnyStlpecC4_2014(var cast,str,stlp,poc_str:integer;var bonus_ponizeny:double);
var i,j,_str:integer;
  A1,A2,A3,pom,uv:string;
  pomBonus: double;
  vyplateny_bonus: double;
  dohody:double;
begin with ReportVD2009B,DM do begin
  dohody := QSUM2012_N_dohody_ovp.Value + QSUM2012_L_N_dohody.Value;
  _str:=((str-1) div R13C4page)+1;
  if stlp=1 then begin
    poc_str := poc_str + 1;
    if str>1 then E_TEXT('</cast'+IntToStr(cast)+'>');
    E_TEXT('<cast'+IntToStr(cast)+'>');
    E_TEXT('<strana>');
    E_TAG_DATA('aktualna',IntToStr(str));
    E_TAG_DATA('celkovo','%%pocetStranC'+IntToStr(cast)+'%%');
    E_TEXT('</strana>');
  end;
  E_TEXT('<stlpec'+IntToStr(stlp)+'>');
  E_TAG('rodneCislo',QSUM2012_Born_Numb.Value);
  E_TAG('datumNarodenia',QSUM2012_Born_Date.AsString);
  E_TAG('priezvisko',QSUM2012_Surname.AsString);
  E_TAG('meno',QSUM2012_Name.Value);
  E_TAG('ulica',QSUM2012_TP_Ulica.Value);
  if (QSUM2012_TP_supcislo.AsString<>'') and (QSUM2012_TP_ocislo.Value<>'') then
    E_TAG('cislo',QSUM2012_TP_supcislo.AsString + '/' + QSUM2012_TP_ocislo.Value)
  else if QSUM2012_TP_supcislo.AsString<>'' then
    E_TAG('cislo',QSUM2012_TP_supcislo.AsString)
  else
    E_TAG('cislo',QSUM2012_TP_ocislo.Value);
  E_TAG('psc',QSUM2012_TP_zip.Value);
  E_TAG('obec',QSUM2012_TP_city.Value);
  E_TAG('stat',QSUM2012_Stat_Nazov.Value);
  E_TAG('kodStatu',QSUM2012_Stat_TP.Value);
 E_TAG('r3a',Format('%0.2f',[QSUM2012_N_brutto.Value]));
 E_TAG('r3b',Format('%0.2f',[dohody]));
 E_TEXT('       <r4>');
 E_TEXT('         <box00><![CDATA[1]]></box00>');
 E_TEXT('         <box01><![CDATA[0]]></box01>');
 E_TEXT('         <box02><![CDATA[0]]></box02>');
 E_TEXT('         <box03><![CDATA[0]]></box03>');
 E_TEXT('         <box04><![CDATA[0]]></box04>');
 E_TEXT('         <box05><![CDATA[0]]></box05>');
 E_TEXT('         <box06><![CDATA[0]]></box06>');
 E_TEXT('         <box07><![CDATA[0]]></box07>');
 E_TEXT('         <box08><![CDATA[0]]></box08>');
 E_TEXT('         <box09><![CDATA[0]]></box09>');
 E_TEXT('         <box10><![CDATA[0]]></box10>');
 E_TEXT('         <box11><![CDATA[0]]></box11>');
 E_TEXT('         <box12><![CDATA[0]]></box12> ');
 E_TEXT('       </r4>');

 E_TAG('r5a',Format('%0.2f',[QSUM2012_N_poist.Value - QSUM2012_O_zdravot.Value]));
 E_TAG('r5b',Format('%0.2f',[QSUM2012_O_zdravot.Value]));
 E_TAG('r6',Format('%0.2f',[QSUM2012_D_preddavok.Value]));
 E_TAG('r7suma',Format('%0.2f',[QSUM2012_D_bonus_cerpany.Value]));
 (*
 E_TEXT('<r7>');
 if QSUM2012_VYHL.Value>0
    then E_TEXT('         <box1><![CDATA[1]]></box1>')
    else E_TEXT('         <box1><![CDATA[0]]></box1>');
 if QSUM2_L_RZP.Value > 0
   then E_TEXT('         <box2><![CDATA[1]]></box2>')
   else E_TEXT('         <box2><![CDATA[0]]></box2>');
 E_TEXT('</r7>');
 E_TEXT('<r8>');
 vyplateny_bonus := QSUM2_D_bonus_cerpany.Value;
 if X.BoloRocneZuctovanie then  vyplateny_bonus := vyplateny_bonus + QSUM2_L_BONUS.Value;
 E_TAG('a',Format('%0.2f',[vyplateny_bonus]));
 if ((vyplateny_bonus > 0) and (Bonus_ponizeny >0)) then begin
   pomBonus :=  vyplateny_bonus;
   if pomBonus > Bonus_ponizeny then pomBonus := Bonus_ponizeny;
   E_TAG('b',Format('%0.2f',[pomBonus]));
   Bonus_Ponizeny := Bonus_Ponizeny - pomBonus;
 end else
   E_TAG('b',Format('%0.2f',[0.0]));
 E_TEXT('</r8>');
 E_TEXT('<r9>');
 if X.BoloRocneZuctovanie
  then E_TAG('suma',Format('%0.2f',[QSUM2012_L_premia.Value]))
  else E_TAG('suma',Format('%0.2f',[0.0]));
 *)
 QDET_.Filtered := False;
 QDET_.Filter := 'code_emp = '+QSUM2012_Code_emp.AsString;
 QDET_.Filtered := True;
 E_TAG('r7deti',IntToStr(QDET_Pocet_deti.Value));
 QDET_.Filtered := False;
 if QSUM2012_VYHL.Value > 0 then begin
    E_TAG('r8ano','1');
    E_TAG('r8pm','12');
 end else begin
    E_TAG('r8ano','0');
    E_TAG('r8pm','');
 end;
 E_TAG('r9',IntToStr(0));
  E_TEXT('</stlpec'+IntToStr(stlp)+'>');
  stlp:=stlp+1;
  if stlp>R13C4page then begin
    stlp:=1;
  end;
end;end;

procedure RocnyStlpecC5_2014(var cast,str,stlp,poc_str:integer;var bonus_ponizeny:double);
var i,j,_str:integer;
  A1,A2,A3,pom,uv:string;
  pomBonus: double;
  vyplateny_bonus: double;
  dohody:double;
begin with ReportVD2009B,DM do begin
  dohody := QSUM2012_N_dohody_ovp.Value + QSUM2012_L_N_dohody.Value;
  _str:=((str-1) div R13C5page)+1;
  if stlp=1 then begin
    poc_str := poc_str + 1;
    if str>1 then E_TEXT('</cast'+IntToStr(cast)+'>');
    E_TEXT('<cast'+IntToStr(cast)+'>');
    E_TEXT('<c5strana>');
    E_TAG_DATA('c5aktualna',IntToStr(str));
    E_TAG_DATA('c5celkovo','%%pocetStranC'+IntToStr(cast)+'%%');
    E_TEXT('</c5strana>');
  end;
  E_TEXT('<c5stlpec'+IntToStr(stlp)+'>');
  E_TAG('c5rodneCislo',QSUM2012_Born_Numb.Value);
  E_TAG('c5datumNarodenia',QSUM2012_Born_Date.AsString);
  E_TAG('c5priezvisko',QSUM2012_Surname.AsString);
  E_TAG('c5meno',QSUM2012_Name.Value);
  E_TAG('c5ulica',QSUM2012_TP_Ulica.Value);
  if (QSUM2012_TP_supcislo.AsString<>'') and (QSUM2012_TP_ocislo.Value<>'') then
    E_TAG('c5cislo',QSUM2012_TP_supcislo.AsString + '/' + QSUM2012_TP_ocislo.Value)
  else if QSUM2012_TP_supcislo.AsString<>'' then
    E_TAG('c5cislo',QSUM2012_TP_supcislo.AsString)
  else
    E_TAG('c5cislo',QSUM2012_TP_ocislo.Value);
  E_TAG('c5psc',QSUM2012_TP_zip.Value);
  E_TAG('c5obec',QSUM2012_TP_city.Value);
  E_TAG('c5stat',QSUM2012_Stat_Nazov.Value);
  E_TAG('c5kodStatu',QSUM2012_Stat_TP.Value);
  E_TAG('c5r3a',Format('%0.2f',[QSUM2012_N_brutto.Value]));
  E_TAG('c5r3b',Format('%0.2f',[dohody]));
  E_TAG('c5r3c',Format('%0.2f',[QSUM2012_N_brutto.Value]));
  E_TAG('c5r4a',Format('%0.2f',[QRZP_Poistne.Value - QRZP_DDP.Value]));
  E_TAG('c5r4b',Format('%0.2f',[QRZP_DDP.Value]));
  if QRZP_Premia_suma.Value <> 0 then
    E_TAG('c5r5',Format('%0.2f',[0.0]))
     else E_TAG('c5r5',Format('%0.2f',[QRZP_Nc_minimum.Value]));
  E_TAG('c5r6',Format('%0.2f',[QRZP_Uhrn_preddavkov.Value]));
  E_TAG('c5r7suma',Format('%0.2f',[QRZP_Nc_partner.Value]));
  QDET_.Filtered := False;
  QDET_.Filter := 'code_emp = '+QSUM2012_Code_emp.AsString;
  QDET_.Filtered := True;
  E_TAG('c5r7deti',IntToStr(QDET_Pocet_deti.Value));
  QDET_.Filtered := False;
  if QRZP_Premia_suma.Value <> 0 then
    E_TAG('c5r8',Format('%0.2f',[0.0]))
     else E_TAG('c5r8',Format('%0.2f',[QRZP_Prispevky_DS.Value]));
  if QRZP_Premia_suma.Value <> 0 then
    E_TAG('c5r9',Format('%0.2f',[0.0]))
     else E_TAG('c5r9',Format('%0.2f',[QRZP_Prispevky_DDS.Value])); {nezdanitelna ciastka na zaplateny prispevok DDS}
  E_TAG('c5r10suma',Format('%0.2f',[QRZP_Premia_suma.Value]));
  E_TAG('c5r10pm',IntToStr(QRZP_Premia_mesiacov.Value));
  E_TAG('c5r11suma',Format('%0.2f',[QSUM2012_D_bonus_cerpany.Value]));
  E_TAG('c5r11pm',IntToStr(Trunc(QSUM2012_D_bonus_cerpany.Value/21.41)));
  E_TAG('c5r12',Format('%0.2f',[-QRZP_Preplatok.Value]));
  E_TEXT('</c5stlpec'+IntToStr(stlp)+'>');
  stlp:=stlp+1;
  if stlp>R13C5page then begin
    stlp:=1;
  end;
end;end;

{------------------ Od 1.1.2014 -------------------}

function VytvorXml_DuMesVyk_2014:AnsiString;
var pc,i:integer;
    Year, Month, Day: Word;
    U1,U2,U3,cSumFrm: string;
    oldDecimalSeparator: char;
    H:array[0..20] of double;
    pomH4,pomH14,zostalo_z_preddavkov: double;
  j,_str:integer;
  A1,A2,A3,pom,uv:string;
  sum,celkovo,aktualna,ss,poc_str:integer;
  px:longint;
  cast5_isopen: boolean;
  PomObdobie:longint;
begin with DM, ReportVD2009B do begin
  cast5_isopen := false;
  oldDecimalSeparator := DecimalSeparator;
  DecimalSeparator := '.';
  try
  cSumFrm := '%0.2f';
  pc:=0;
  MyXML := '';
  for i:=0 to 20 do h[i]:=0;

    ReportVD2009B:=TReportVD2009B.Create(Application);
    ReportVD2009B.SetX(X);
    QSUMRZP_.ParamByName('v_rok').AsInteger:=MyRok(X.AktObdobie)-1;
    QSUMRZP_.ParamByName('bolo_rzp').AsBoolean:=X.BoloRocneZuctovanie;
    QSUMRZP_.Open;
    QEXRZP_.ParamByName('v_rok').AsInteger:=MyRok(X.AktObdobie)-1;
    QEXRZP_.ParamByName('bolo_rzp').AsBoolean:=X.BoloRocneZuctovanie;
    QEXRZP_.Open;
    QSUM2_.ParamByName('obdobie1').AsInteger:=X.AktObdobie;
    QSUM2_.ParamByName('obdobie2').AsInteger:=X.AktObdobie;
    QSUM2_.Open;
    poc_str:=((ReportVD2009B.QSUM2_.RecordCOunt -1) div 4) + 1;

E_TEXT('<?xml version="1.0" encoding="utf-8"?>');
E_TEXT('<dokument xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="universal.xsd">');
E_TEXT('<hlavicka>');
E_TAG('dic',TINF_DIC.Value);
E_TAG('danovyUrad',TINF_DANOVY_URAD.Value);
E_TEXT('<druhPrehladu>');
E_TEXT('<riadny><![CDATA[1]]></riadny>');
E_TEXT('<opravny><![CDATA[0]]></opravny>');
E_TAGK('druhPrehladu');
E_TEXT('<zdanovacieObdobie>');
E_TAG_DATA('mesiac',IntToStr(MyMesiac(X.AktObdobie)));
E_TAG_DATA('rok',IntToStr(MyRok(X.AktObdobie)));
E_TAGK('zdanovacieObdobie');
E_TEXT('<datumZisteniaOP/>');
E_TEXT('<fo>');
E_TAG('priezvisko',TINF_FO_Surname.Value);
E_TAG('meno',TINF_FO_Name.Value);
E_TAG('titul',TINF_FO_Titul_pred.Value);
E_TEXT('</fo>');
E_TEXT('<po>');
E_TAG('obchodneMeno',TINF_NAZOV.Value);
E_TEXT('<pravnaForma/>');
E_TEXT('</po>');
  E_TAGZ('sidlo');
  MyRozdelUlicuExt(TINF_ADR_Ulica1.Value,U1,U2,U3);
  if U1<>'' then
  begin
    E_TAG('ulica',U1);
    E_TAG('cislo',U2);
  end else
  begin
    E_TAG('cislo',U2);
  end;
  E_TAG('psc',TINF_ADR_PSC.Value);
  E_TAG('obec',TINF_ADR_MESTO.Value);
  E_TAG('stat',TINF_ADR_STAT.Value);
E_TEXT('<tel>');
E_TEXT('<predcislie/>');
E_TAG('cislo',StrReplaceAll(StrReplaceAll(TINF_ADR_TELEFON.Value,' ',''),'/',''));
E_TEXT('</tel>');
E_TEXT('<fax>');
E_TEXT('<predcislie/>');
E_TAG('cislo',StrReplaceAll(StrReplaceAll(TINF_ADR_FAX.Value,' ',''),'/',''));
E_TEXT('</fax>');

  E_TAGK('sidlo');
E_TEXT('<vyhotovil>');
E_TAG('meno',X.Vykaz_zostavil);
E_TEXT('<tel>');
E_TEXT('<predcislie/>');
E_TAG('cislo',StrReplaceAll(StrReplaceAll(X.Telefon,' ',''),'/',''));
E_TEXT('</tel>');

DecodeDate(now, Year, Month, Day);
  E_TAG_DATA('datumVyhotovenia',LPAD(IntToStr(Day),2,'0')+'.'
                               +LPAD(IntToStr(Month),2,'0')+'.'
                               +IntToStr(Year));
E_TEXT('</vyhotovil>');
E_TEXT('</hlavicka>');

  ReportVL3:=TReportVL3.Create(Application);
  ReportVL3.SetX(X);
  ReportVL3.Q1_.Close;
(*
  Q_SET_INT(ReportVL3.Q1_,':p1',X.Obdobie1);
  Q_SET_INT(ReportVL3.Q1_,':p1x',X.Obdobie2);
  Q_SET_INT(ReportVL3.Q1_,':p2',X.AktMinSid);
  Q_SET_INT(ReportVL3.Q1_,':p3',X.AktMaxSid);
  SysLog(ReportVL3.Q1_.SQL.TEXT);
*)
  ReportVL3.Q1_.ParamByName('P1').AsInteger := X.Obdobie1;
  ReportVL3.Q1_.ParamByName('P1X').AsInteger := X.Obdobie2;
  ReportVL3.Q1_.ParamByName('P2').AsInteger := X.AktMinSid;
  ReportVL3.Q1_.ParamByName('P3').AsInteger := X.AktMaxSid;
  ReportVL3.Q1_.Open;
  ReportVL3.Q2a_.Close;
  ReportVL3.Q2a_.ParamByName('P1').AsInteger := X.Obdobie1;
  ReportVL3.Q2a_.ParamByName('P1X').AsInteger := X.Obdobie2;
  ReportVL3.Q2a_.ParamByName('P2').AsInteger := X.AktMinSid;
  ReportVL3.Q2a_.ParamByName('P3').AsInteger := X.AktMaxSid;
  ReportVL3.Q2a_.Open;
  ReportVL3.Q2b_.Close;
  ReportVL3.Q2b_.ParamByName('P1').AsInteger := X.Obdobie1;
  ReportVL3.Q2b_.ParamByName('P1X').AsInteger := X.Obdobie2;
  ReportVL3.Q2b_.ParamByName('P2').AsInteger := X.AktMinSid;
  ReportVL3.Q2b_.ParamByName('P3').AsInteger := X.AktMaxSid;
  ReportVL3.Q2b_.Open;

    H[0]:=ReportVL3.Q1_N_brutto.Value;
    H[1]:=ReportVL3.Q1_D_Preddavok.Value;
    if X.BoloRocneZuctovanie then
      H[2]:=-QSUMRZP_D_neu_preplatok.Value
    else H[2]:=0;
    {H[2]:=ReportVL3.Q2a_D_Nedoplatok.Value - ReportVL3.Q2b_D_Preplatok.Value;  }
    H[3]:=0;
    H[4]:=H[1]+H[2]+H[3];
    pomH4:=H[4];
    if pomH4<0 then pomH4:=0;
    H[10]:=ReportVL3.Q1_D_bonus_cerpany.Value;
    H[5]:=-ReportVL3.Q1_D_bonus_cerpany.Value;
    if X.BoloRocneZuctovanie then begin
      H[10]:=H[10]+QSUMRZP_D_Bonus.Value;
      H[5]:=H[5]-QSUMRZP_D_Bonus.Value;
      H[6]:=-QSUMRZP_Premia_suma.Value;
      H[13]:=QSUMRZP_Premia_suma.Value;
    end;
    H[7]:=H[4]+H[5]+H[6];
    zostalo_z_preddavkov := H[4];
    if H[10]<zostalo_z_preddavkov then begin
       H[11]:=H[10];H[12]:=0;zostalo_z_preddavkov:=zostalo_z_preddavkov-H[10];
    end else begin
      H[11]:=zostalo_z_preddavkov;H[12]:=H[10]-H[11];zostalo_z_preddavkov:=0;
    end;
    if H[14]<zostalo_z_preddavkov then begin
       H[14]:=H[13];H[15]:=0;zostalo_z_preddavkov:=zostalo_z_preddavkov-H[13];
    end else begin
      H[14]:=zostalo_z_preddavkov;H[15]:=H[13]-H[14];zostalo_z_preddavkov:=0;
    end;
    H[19]:=H[11];
    ReportVL3.Q1_.Close;
    ReportVL3.Q2a_.Close;
    ReportVL3.Q2b_.Close;

E_TEXT('<telo>');
E_TEXT('    <cast1>');
E_TAG('r00',Format('%0.2f',[H[0]]));
E_TEXT('      <r01>');
PomObdobie := Obdobie_Add_MM(X.AktObdobie,1);
E_TAG('datum',FormatDateTime('dd.mm.yyyy',LastDayDate(MyRok(PomObdobie),MyMesiac(PomObdobie),DM.TINF_FZ_DEN.Value)));
E_TAG('suma',Format('%0.2f',[H[1]]));
E_TEXT('      </r01>');
E_TAG('r02',Format('%0.2f',[H[2]]));
E_TAG('r03',Format('%0.2f',[H[3]]));
E_TAG('r04',Format('%0.2f',[H[4]]));
E_TAG('r05',Format('%0.2f',[H[5]]));
E_TAG('r06',Format('%0.2f',[H[6]]));
E_TAG('r07',Format('%0.2f',[H[7]]));
E_TEXT('      <r08>');
E_TEXT('        <datum/>');
E_TEXT('        <suma/>');
E_TEXT('      </r08>');
E_TEXT('    </cast1>');
E_TEXT('    <cast2>');
E_TAG('rA',Format('%0.2f',[H[10]]));
E_TAG('rB',Format('%0.2f',[H[11]]));
E_TAG('rC',Format('%0.2f',[H[12]]));
E_TAG('rD',Format('%0.2f',[H[13]]));
E_TAG('rE',Format('%0.2f',[H[14]]));
E_TAG('rF',Format('%0.2f',[H[15]]));
E_TEXT('    </cast2>');
E_TEXT('    <cast3>');
E_TEXT('      <poukazat><![CDATA[0]]></poukazat>');
E_TEXT('      <stvrtrok/>');
E_TEXT('      <sposobPlatby>');
E_TEXT('        <poukazka><![CDATA[0]]></poukazka>');
E_TEXT('        <ucet><![CDATA[0]]></ucet>');
E_TEXT('      </sposobPlatby>');
E_TEXT('      <suma/>');
E_TEXT('      <bankovyUcet>');
E_TEXT('        <cisloUctu/>');
E_TEXT('        <kodBanky/>');
E_TEXT('      </bankovyUcet>');
E_TEXT('    </cast3>');
E_TEXT('    <cast4>');
E_TEXT('      <poukazat><![CDATA[0]]></poukazat>');
E_TEXT('      <rok/>');
E_TEXT('      <sposobPlatby>');
E_TEXT('        <poukazka><![CDATA[0]]></poukazka>');
E_TEXT('        <ucet><![CDATA[0]]></ucet>');
E_TEXT('      </sposobPlatby>');
E_TEXT('      <suma/>');
E_TEXT('      <bankovyUcet>');
E_TEXT('        <cisloUctu/>');
E_TEXT('        <kodBanky/>');
E_TEXT('     </bankovyUcet>');
E_TEXT('    </cast4>');
E_TEXT('  </telo>');
E_TEXT('</dokument>');
  finally
    DecimalSeparator := oldDecimalSeparator;
    Screen.Cursor:=crDefault;
    QSUMRZP_.Close;
    QSUM2_.Close;
    QEXRZP_.Close;
    ReportVD2009B.Free;
    ReportVL3.Free;
    Progress(100);
  end;
  Result := MyXml;
end;end;

{------------------ Rocny Vykaz 2014 -------------------}

function VytvorXml_DuRokVyk_2014:AnsiString;
var cast,pc,i,ii:integer;
    Year, Month, Day: Word;
    U1,U2,U3,cSumFrm: string;
    oldDecimalSeparator: char;
    H:array[0..99] of double;
    pomH4,pomH14,zostalo_z_preddavkov: double;
  j,_str:integer;
  A1,A2,A3,pom,uv:string;
  sum,celkovo,aktualna,ss,poc_str,poc_zaz_c4,poc_zaz_c5:integer;
  px:longint;
  cast5_isopen: boolean;
  PomObdobie:longint;
procedure PrazdnyStlpecC4;
begin
E_TEXT('        <rodneCislo/>');
E_TEXT('        <datumNarodenia/>');
E_TEXT('        <priezvisko/>');
E_TEXT('        <meno/>');
E_TEXT('        <ulica/>');
E_TEXT('        <cislo/>');
E_TEXT('        <psc/>');
E_TEXT('        <obec/>');
E_TEXT('        <stat/>');
E_TEXT('        <kodStatu/>');
E_TEXT('        <r3a/>');
E_TEXT('        <r3b/>');
E_TEXT('       <r4>');
E_TEXT('          <box00><![CDATA[0]]></box00>');
E_TEXT('          <box01><![CDATA[0]]></box01>');
E_TEXT('          <box02><![CDATA[0]]></box02>');
E_TEXT('          <box03><![CDATA[0]]></box03>');
E_TEXT('          <box04><![CDATA[0]]></box04>');
E_TEXT('          <box05><![CDATA[0]]></box05>');
E_TEXT('          <box06><![CDATA[0]]></box06>');
E_TEXT('          <box07><![CDATA[0]]></box07>');
E_TEXT('          <box08><![CDATA[0]]></box08>');
E_TEXT('          <box09><![CDATA[0]]></box09>');
E_TEXT('          <box10><![CDATA[0]]></box10>');
E_TEXT('          <box11><![CDATA[0]]></box11>');
E_TEXT('          <box12><![CDATA[0]]></box12>');
E_TEXT('        </r4>');
E_TEXT('        <r5a/>');
E_TEXT('        <r5b/>');
E_TEXT('        <r6/>');
E_TEXT('       <r7suma/>');
E_TEXT('        <r7deti/>');
E_TEXT('        <r8ano><![CDATA[0]]></r8ano>');
E_TEXT('        <r8pm/>');
E_TEXT('        <r9/>');
end;
procedure PrazdnyStlpecC5;
begin
E_TEXT('        <c5rodneCislo/>');
E_TEXT('        <c5datumNarodenia/>');
E_TEXT('        <c5priezvisko/>');
E_TEXT('        <c5meno/>');
E_TEXT('        <c5ulica/>');
E_TEXT('        <c5cislo/>');
E_TEXT('        <c5psc/>');
E_TEXT('        <c5obec/>');
E_TEXT('        <c5stat/>');
E_TEXT('        <c5kodStatu/>');
E_TEXT('        <c5r3a/>');
E_TEXT('        <c5r3b/>');
E_TEXT('        <c5r3c/>');
E_TEXT('        <c5r4a/>');
E_TEXT('        <c5r4b/>');
E_TEXT('        <c5r5/>');
E_TEXT('        <c5r6/>');
E_TEXT('        <c5r7suma/>');
E_TEXT('        <c5r7deti/>');
E_TEXT('        <c5r8/>');
E_TEXT('        <c5r9/>');
E_TEXT('        <c5r10suma/>');
E_TEXT('        <c5r10pm/>');
E_TEXT('        <c5r11suma/>');
E_TEXT('        <c5r11pm/>');
E_TEXT('        <c5r12/>');
end;
begin with DM, ReportVD2009B do begin
  cast5_isopen := false;
  oldDecimalSeparator := DecimalSeparator;
  DecimalSeparator := '.';
  try
  cSumFrm := '%0.2f';
  pc:=0;
  MyXML := '';

    ReportVL3:=TReportVL3.Create(Application);
    ReportVD2009B:=TReportVD2009B.Create(Application);
    ReportVD2009B.SetX(X);
    QDET_.Open;
    QSUM2012D_.ParamByName('obdobie1').AsInteger:=(MyRok(X.AktObdobie)-1)*100+1;
    QSUM2012D_.ParamByName('obdobie2').AsInteger:=(MyRok(X.AktObdobie)-1)*100+12;
    QSUM2012D_.Open;
    QSUM2012_.ParamByName('obdobie1').AsInteger:=(MyRok(X.AktObdobie)-1)*100+1;
    QSUM2012_.ParamByName('obdobie2').AsInteger:=(MyRok(X.AktObdobie)-1)*100+12;
    QSUM2012_.Open;
    QRZP_.ParamByName('v_rok').AsInteger:=MyRok(X.AktObdobie)-1;
    QRZP_.Open;
    QSUMRZP_.ParamByName('v_rok').AsInteger:=MyRok(X.AktObdobie)-1;
    QSUMRZP_.ParamByName('bolo_rzp').AsBoolean:=True;
    QSUMRZP_.Open;
(*
    QSUM2_.ParamByName('obdobie1').AsInteger:=X.AktObdobie;
    QSUM2_.ParamByName('obdobie2').AsInteger:=X.AktObdobie;
    QSUM2_.Open;
    poc_str:=((ReportVD2009B.QSUM2_.RecordCOunt -1) div 4) + 1;
*)
E_TEXT('<?xml version="1.0" encoding="utf-8"?>');
E_TEXT('<dokument xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="universal.xsd">');
E_TEXT('<hlavicka>');
E_TAG('dic',TINF_DIC.Value);
E_TAG('danovyUrad',TINF_DANOVY_URAD.Value);
E_TEXT('<druhHlasenia>');
E_TEXT('<rh><![CDATA[1]]></rh>');
E_TEXT('<oh><![CDATA[0]]></oh>');
E_TEXT('<dh><![CDATA[0]]></dh>');
E_TAGK('druhHlasenia');
E_TEXT('<zdanovacieObdobie>');
E_TAG_DATA('rok',IntToStr(MyRok(X.AktObdobie)-1));
E_TEXT('<datumDDP/>');
E_TAGK('zdanovacieObdobie');
if DM.TINF_TYP_ZEL.Value = 'FO' then begin
  E_TEXT('<fo>');
  E_TAG('priezvisko',TINF_FO_Surname.Value);
  E_TAG('meno',TINF_FO_Name.Value);
  E_TAG('titul',TINF_FO_Titul_pred.Value);
  E_TAG('titulZa','');
  E_TEXT('</fo>');
  E_TEXT('<po>');
  E_TAG('obchodneMeno','');
  E_TEXT('<pravnaForma/>');
  E_TEXT('</po>');
end else begin
  E_TEXT('<fo>');
  E_TAG('priezvisko','');
  E_TAG('meno','');
  E_TAG('titul','');
  E_TAG('titulZa','');
  E_TEXT('</fo>');
  E_TEXT('<po>');
  E_TAG('obchodneMeno',TINF_NAZOV.Value);
  E_TEXT('<pravnaForma/>');
  E_TEXT('</po>');
end;
  E_TAGZ('sidlo');
  MyRozdelUlicuExt(TINF_ADR_Ulica1.Value,U1,U2,U3);
  if U1<>'' then
  begin
    E_TAG('ulica',U1);
    E_TAG('cislo',U2);
  end else
  begin
    E_TAG('cislo',U2);
  end;
  E_TAG('psc',TINF_ADR_PSC.Value);
  E_TAG('obec',TINF_ADR_MESTO.Value);
  E_TAG('stat',TINF_ADR_MESTO.Value);
E_TAG('tel',StrReplaceAll(StrReplaceAll(TINF_ADR_TELEFON.Value,' ',''),'/',''));
E_TAG('email',TINF_ADR_EMAIL.Value);
  E_TAGK('sidlo');
E_TEXT('<datumZuctovania/>');
E_TEXT('<vypracoval>');
E_TAG('kto',X.Vykaz_zostavil);
DecodeDate(now, Year, Month, Day);
E_TAG('dna',IntToStr(Day)+'.'+IntToStr(Month)+'.'+IntToStr(Year));
E_TAG('tel',StrReplaceAll(StrReplaceAll(X.Telefon,' ',''),'/',''));
E_TEXT('</vypracoval>');
E_TEXT('    <pocetStranC4>%%pocetStranC4%%</pocetStranC4>');
E_TEXT('    <pocetStranC5>%%pocetStranC5%%</pocetStranC5>');
E_TEXT('    <pocetZamC4>%%pocetZamC4%%</pocetZamC4>');
E_TEXT('    <pocetZamC5>%%pocetZamC5%%</pocetZamC5>');
E_TAG('datumVyhlasenia',IntToStr(Day)+'.'+IntToStr(Month)+'.'+IntToStr(Year));
E_TEXT('    <dedicZastupca>');
E_TEXT('    <priezvisko></priezvisko>');
E_TEXT('    <meno></meno>');
E_TEXT('    <titul></titul>');
E_TEXT('    <titulZa></titulZa>');
E_TEXT('    <rodneCislo></rodneCislo>');
E_TEXT('    <ulica></ulica>');
E_TEXT('    <cislo></cislo>');
E_TEXT('    <psc></psc>');
E_TEXT('    <obec></obec>');
E_TEXT('    <stat></stat>');
E_TEXT('    <tel></tel>');
E_TEXT('    <email/>');
E_TEXT('    </dedicZastupca>');
E_TEXT('</hlavicka>');

  for i:=0 to 99 do h[i]:=0;

  X.Obdobie1 := (MyRok(X.AktObdobie)-1)*100+1;
  X.Obdobie2 := (MyRok(X.AktObdobie)-1)*100+12;

  ReportVL3.SetX(X);
  ReportVL3.Q1_.Close;
  ReportVL3.Q1_.ParamByName('P1').AsInteger := X.Obdobie1;
  ReportVL3.Q1_.ParamByName('P1X').AsInteger := X.Obdobie2;
  ReportVL3.Q1_.ParamByName('P2').AsInteger := X.AktMinSid;
  ReportVL3.Q1_.ParamByName('P3').AsInteger := X.AktMaxSid;
  ReportVL3.Q1_.Open;
  ReportVL3.Q2a_.Close;
  ReportVL3.Q2a_.ParamByName('P1').AsInteger := X.Obdobie1;
  ReportVL3.Q2a_.ParamByName('P1X').AsInteger := X.Obdobie2;
  ReportVL3.Q2a_.ParamByName('P2').AsInteger := X.AktMinSid;
  ReportVL3.Q2a_.ParamByName('P3').AsInteger := X.AktMaxSid;
  ReportVL3.Q2a_.Open;
  ReportVL3.Q2b_.Close;
  ReportVL3.Q2b_.ParamByName('P1').AsInteger := X.Obdobie1;
  ReportVL3.Q2b_.ParamByName('P1X').AsInteger := X.Obdobie2;
  ReportVL3.Q2b_.ParamByName('P2').AsInteger := X.AktMinSid;
  ReportVL3.Q2b_.ParamByName('P3').AsInteger := X.AktMaxSid;
  ReportVL3.Q2b_.Open;

    H[0]:=ReportVL3.Q1_N_brutto.Value;
    H[1]:=ReportVL3.Q1_D_Preddavok.Value;
    H[2]:=-QSUMRZP_D_neu_preplatok.Value;
    H[3]:=0;
    H[4]:=H[1]+H[2]+H[3];
    pomH4:=H[4];
    if pomH4<0 then pomH4:=0;
    H[20]:=ReportVL3.Q1_D_bonus_cerpany.Value;
    H[5]:=-ReportVL3.Q1_D_bonus_cerpany.Value;
    H[20]:=H[20]+QSUMRZP_D_Bonus.Value;
    H[5]:=H[5]-QSUMRZP_D_Bonus.Value;
    H[6]:=-QSUMRZP_Premia_suma.Value;
    H[23]:=QSUMRZP_Premia_suma.Value;
    zostalo_z_preddavkov := H[4];
    if H[20]<zostalo_z_preddavkov then begin
       H[21]:=H[20];H[22]:=0;zostalo_z_preddavkov:=zostalo_z_preddavkov-H[20];
    end else begin
      H[21]:=zostalo_z_preddavkov;H[22]:=H[20]-H[21];zostalo_z_preddavkov:=0;
    end;
    if H[24]<zostalo_z_preddavkov then begin
       H[24]:=H[23];H[25]:=0;zostalo_z_preddavkov:=zostalo_z_preddavkov-H[23];
    end else begin
      H[24]:=zostalo_z_preddavkov;H[25]:=H[23]-H[24];zostalo_z_preddavkov:=0;
    end;
    H[29]:=H[21];
    H[5]:=-H[21]; {absolutna hodnota riadku 5 a riadku B sa musi rovnat}
    H[7]:=H[4]+H[5]+H[6]; if H[7] < 0 then H[7]:=0;
    H[8] := 0; {H[1];}
    if H[7]-H[8]<0 then begin H[9]:= ABS(H[7]-H[8]); H[10]:=0; end
                   else begin H[10]:= ABS(H[7]-H[8]); H[9]:=0; end;
    ReportVL3.Q1_.Close;
    ReportVL3.Q2a_.Close;
    ReportVL3.Q2b_.Close;

    E_TEXT('<telo>');
E_TEXT('    <cast1>');
E_TAG('r00',Format('%0.2f',[H[0]]));
E_TAG('r01',Format('%0.2f',[H[1]]));
E_TAG('r02',Format('%0.2f',[H[2]]));
E_TAG('r03',Format('%0.2f',[H[3]]));
E_TAG('r04',Format('%0.2f',[H[4]]));
E_TAG('r05',Format('%0.2f',[H[5]]));
E_TAG('r06',Format('%0.2f',[H[6]]));
E_TAG('r07',Format('%0.2f',[H[7]]));
E_TAG('r08',Format('%0.2f',[H[8]]));
E_TAG('r09',Format('%0.2f',[H[9]]));
E_TAG('r10',Format('%0.2f',[H[10]]));
E_TEXT('    </cast1>');
E_TEXT('    <cast2>');
E_TAG('r11','');
E_TAG('r12','');
E_TEXT('    </cast2>');
E_TEXT('    <cast3>');
E_TAG('rA',Format('%0.2f',[H[20]]));
E_TAG('rB',Format('%0.2f',[H[21]]));
E_TAG('rC',Format('%0.2f',[H[22]]));
E_TAG('rD',Format('%0.2f',[H[23]]));
E_TAG('rE',Format('%0.2f',[H[24]]));
E_TAG('rF',Format('%0.2f',[H[25]]));
E_TEXT('    </cast3>');
E_TEXT('    <medium5c><![CDATA[0]]></medium5c>');
 {--------------------- CAST 4 ---------------------------}
    cast:=4;
    poc_str := 0;
    poc_zaz_c4 := 0;
    ss:=1;
    pc:=0;
    px:=ReportVD2009B.QSUM2012_.RecordCOunt;
    Progress(0);
    while not ReportVD2009B.QSUM2012_.EOF do
    begin
      Progress(pc * 100 div px);
      if QRZP_Code_emp.AsString = '' then begin
        poc_zaz_c4 := poc_zaz_c4 + 1;
        aktualna := ((poc_zaz_c4-1) div R13C4page) + 1;
        RocnyStlpecC4_2014(cast,aktualna,ss,poc_str,H[19]);
      end;
      inc(pc);
      ReportVD2009B.QSUM2012_.Next;
    end;
    Progress(100);
    if ss > 1 then
    for i:=ss to R13C4page do begin
    E_TEXT('    <stlpec'+IntToStr(i)+'>');
    PrazdnyStlpecC4;
    E_TEXT('</stlpec'+IntToStr(i)+'>');
    end;
    if poc_zaz_c4 = 0 then begin
      E_TEXT('    <cast'+IntToStr(cast)+'>');
      E_TEXT('    <strana>');
      E_TEXT('    <aktualna><![CDATA[1]]></aktualna>');
      E_TEXT('    <celkovo><![CDATA[1]]></celkovo>');
      E_TEXT('    </strana>');
      for i:=1 to R13C4page do begin
        E_TEXT('    <stlpec'+IntToStr(i)+'>');
        PrazdnyStlpecC4;
        E_TEXT('</stlpec'+IntToStr(i)+'>');
      end;
    end;
    E_TEXT('    </cast'+IntToStr(cast)+'>');

     {--------------------- CAST 5 ---------------------------}
    cast:=5;
    poc_str := 0;
    poc_zaz_c5 := 0;
    ss:=1;
    pc:=0;
    px:=ReportVD2009B.QSUM2012_.RecordCOunt;
    Progress(0);
    ReportVD2009B.QSUM2012_.First;
    while not ReportVD2009B.QSUM2012_.EOF do
    begin
      Progress(pc * 100 div px);
      if QRZP_Code_emp.AsString <> '' then begin
        poc_zaz_c5 := poc_zaz_c5 + 1;
        aktualna := ((poc_zaz_c5-1) div R13C5page) + 1;
        RocnyStlpecC5_2014(cast,aktualna,ss,poc_str,H[19]);
      end;
      inc(pc);
      ReportVD2009B.QSUM2012_.Next;
    end;
    Progress(100);
    if ss > 1 then
    for i:=ss to R13C5page do begin
    E_TEXT('    <c5stlpec'+IntToStr(i)+'>');
    PrazdnyStlpecC5;
    E_TEXT('    </c5stlpec'+IntToStr(i)+'>');
    end;
    if poc_zaz_c5 = 0 then begin
      E_TEXT('    <cast'+IntToStr(cast)+'>');
      E_TEXT('    <c5strana>');
      E_TEXT('    <c5aktualna><![CDATA[1]]></c5aktualna>');
      E_TEXT('    <c5celkovo><![CDATA[1]]></c5celkovo>');
      E_TEXT('    </c5strana>');
      for i:=1 to 2 do begin
       E_TEXT('    <c5stlpec'+IntToStr(i)+'>');
       PrazdnyStlpecC5;
       E_TEXT('    </c5stlpec'+IntToStr(i)+'>');
      end;
    end;
    E_TEXT('    </cast'+IntToStr(cast)+'>');

   {--------------------- KONIEC DOKUMENTU ---------------------------}
    E_TEXT('  </telo>');
    E_TEXT('</dokument>');

    MyXml := StrReplaceX(MyXml,'%%pocetZamC4%%',IntToStr(poc_zaz_c4));
    MyXml := StrReplaceX(MyXml,'%%pocetZamC5%%',IntToStr(poc_zaz_c5));
    if poc_zaz_c4 = 0 then
      MyXml := StrReplaceAll(MyXml,'%%pocetStranC4%%','1')
    else
      MyXml := StrReplaceAll(MyXml,'%%pocetStranC4%%',IntToStr(((poc_zaz_c4-1) div R13C4page)+1));
    if poc_zaz_c5 = 0 then
      MyXml := StrReplaceAll(MyXml,'%%pocetStranC5%%','1')
    else
      MyXml := StrReplaceAll(MyXml,'%%pocetStranC5%%',IntToStr(((poc_zaz_c5-1) div R13C5page)+1));

  finally
    DecimalSeparator := oldDecimalSeparator;
    Screen.Cursor:=crDefault;
    QRZP_.Close;
    QDET_.Close;
    QSUM2012D_.Close;
    QSUM2012_.Close;
    QSUMRZP_.Close;
    QSUM2_.Close;
    ReportVL3.Free;
    ReportVD2009B.Free;
    Progress(100);
  end;
  Result := MyXml;
end;end;


