unit MyConsts;
(*
        1 – zamestnanec - èerpanie pracovného vo¾na bez náhrady mzdy alebo sluobného vo¾na bez nároku na plat alebo sluobnı príjem,
        2 – zamestnanec - dlhodobé uvo¾nenie z pracovného pomeru, štátnozamestnaneckého pomeru alebo zo sluobného pomeru na vıkon verejnej funkcie alebo na vıkon odborovej funkcie pod¾a osobitnıch predpisov,
        3 – zamestnanec - neospravedlnená neprítomnos v práci,
        4 – zamestnanec/SZÈO - prerušenie od 11 . dòa potreby ošetrovania fyzickej osoby uvedenej v § 39 ods. 1 písm. a) zákona è. 461/2003 Z. z. o sociálnom poistení alebo prerušenie od 11 . dòa starostlivosti o diea uvedené v § 39 ods. 1 písm. b) zákona è. 461/2003 Z. z. o sociálnom poistení,
        5 – zamestnanec/SZÈO - vıkon väzby alebo vıkon trestu odòatia slobody,
        6 - zamestnanec  - èerpanie rodièovskú dovolenku,
        7 - SZÈO - nárok na rodièovskı príspevok,
        8 – zamestnanec/SZÈO - trvanie doèasnej pracovnej neschopnosti odo dòa nasledujúceho po uplynutí 52 tıdòov,
        9 – zamestnanec – neospravedlnená neprítomnos v práci z dôvodu jeho úèasti na štrajku,
        10 – SZÈO – pozastavené prevádzkovanie ivnosti, pozastavenı vıkon èinnosti alebo pozastavená èinnos
  *)
(* ----- 2003 Zmeny DM
   VYP.DB
   - rozsirit o typzec
   - pocDniStrajku integer
   - poSkonceni boolean ???
   ZAM.DB
   - titul za menom
   - rodne priezvisko versus predchadzajuce priezvisko
   - doplnit tp_ulica
   - doplnit tp_supcislo
   - doplnit tp_ocislo
   - doplnit pp_ulica
   - doplnit pp_supcislo
   - doplnit pp_ocislo

(*
Max. VZ pre poistne
--Max. VZ do 30.6.2004---
20267 Nemocenske a Garancne
40533 Dochodkove a Rezervny fond
--Max. VZ od 1.7.2004---
21548 Nemocenske a Garancne
43095 Dochodkove a Rezervny fond
--Max. VZ do 31.12.2004---
32000 Zdravotne
--Max. VZ od 1.1.2005---
43095 Zdravotne

*)

(* ZMENY OD 1.1.2005
Základ dane zniuje o nezdanite¾nú èas, ktorou je suma zodpovedajúca
19,2 násobku sumy ivotného  minima platného k 1. januáru príslušného
zdaòovacieho obdobia roène na daòovníka, teda od zdaòovanıch príjmov
bude moné odpoèíta nezdanite¾nú sumu 87 936 Sk. (6736->7328 Sk mesaène)

Príspevky daòovníka na doplnkové dôchodkové sporenie  a finanèné prostriedky
vynaloené daòovníkom na úèelové sporenie bude moné odpoèíta od základu dane
vo vıške preukázate¾ne zaplatenej v zdaòovacom období, v úhrne najviac
do vıšky 12 000 Sk.

Sadzba poistného je pre

a) zamestnanca 4 % z vymeriavacieho základu,
b) samostatne zárobkovo èinnú osobu 14 % z vymeriavacieho základu; ak je samostatne zárobkovo èinná osoba osoba so zdravotnım postihnutím, 40) sadzba poistného je 7 % z vymeriavacieho základu,
c) zamestnávate¾a 10 % z vymeriavacieho základu; ak zamestnáva osoby so zdravotnım postihnutím, 40) sadzba poistného je za tieto osoby 5 % z vymeriavacieho základu,
d) poistenca pod¾a § 11 ods. 2 14 % z vymeriavacieho základu,
e) štát 4 % z vymeriavacieho základu.

(12) Vymeriavací základ sa zaokrúh¾uje na celé koruny nahor.

ZAM.DB: vyhodit stlpce 54,70,71,72,78,85,87,88
*)
interface

uses
Math,
IniFiles,
MyOtazka,
SysUtils,
Windows,
Forms,
Menus,
Classes,
DB,
DBCTRLS,
UnicodeUtils,
FMXUtils;

type
EMyError = class(Exception);

TMyMenu = class(TMainMenu)
  public
  Hlavny:TMenuItem;
  Polozky:array[0..10] of TMenuItem;
end;

TMyMenuItem = class(TMenuItem)
  public
  DS:TDataSource;
  MM:TMyMenu;
  DBN1,DBN2:TDBNavigator;
end;

TMyReportParam = record
  Typ: string[64];
  AktObdobie: longint;
  Obdobie1: longint;
  Obdobie2: longint;
  AktObdobieStrT: string;
  AktObdobieStrF: string;
  AktFirmaStr: string;
  AktIbaFirmaStr: string;
  AktMinSid: integer;
  AktSid:    integer;
  AktMaxSid: integer;
  AktSidList:string; //string e.g.: sid in (1,2,3)
  AktSidListSuffix: string; //file name suffix
  Code_emp1: longint;
  Code_emp2: longint;
  DisableShape: boolean;
  DisableLabel: boolean;
  Silent: boolean;
  JedenPracovnik: boolean;
  PID: longint;
  HPID: longint;
  Kontakt_Osoba: string[128];
  Vykaz_Zostavil: string[128];
  Vykaz_dna: string[32];
  Vykaz_dna_DT: TDateTime;
  Vykaz_miesto: string[64];
  Vykaz_riadny:string[1];
  Telefon: string[64];
  Fax: string[64];
  Mail: string[64];
  Nc_text: string;
  Nc_ine: double;
  Nc_ine2: string;
  Abeceda: boolean;
  Veta: array[1..1000] of string;
  PocViet: longint;
  RTF_sablona:string;
  RTF_subor:string;
  RTF_prepisat:boolean;
  RTF_existuje:boolean;
  Vyber_ZP:boolean;
  Kod_ZP:integer;
  YY:array[1..99] of string;
  Bullzip: boolean;
  BoloRocneZuctovanie: boolean;
end;

type TMesiace = array[1..12] of byte;

type TVykazHlasenieDane = record
  r1_rodneCislo:string;
  r2_datumNaridenia:string;
  r3_priezvisko:string;
  r3_meno:string;
  r3_tp_ulica:string;
  r3_tp_cislo:string;
  r3_tp_psc:string;
  r3_tp_obec:string;
  r3_tp_stat:string;
  r4_prijmy:double;
  r5_mesiace:array[0..12] of boolean;
  r6_zaklad_dane:double;
  r7_preddavky:double;
  r7_len_nepenazny_prijem:boolean;
  r7_aj_nepenazny_prijem:boolean;
  r8_suma_vypl_bonusu:double;
  r8_pocetDeti:integer;
end;

TFSFlag = (FSCaseIsPreserved, FSCaseSensitive, FSUnicodeStoredOnDisk,
  FSPersistentACLS, FSVolIsCompressed, FSFileCompression);

TFSFlags = set of TFSFlag;

TVolumeInfo = record
  VolumeName: String;
  VolumeSN: DWord;
  MaxComponent: DWord;
  FSFlags: TFSFlags;
  FSName: String;
end;

  // The customer class definition
  TPriloha = class
    private
      // The data fields of this new class
    public
      // Properties to read these data values
    CALC_MESIAC: string;
    CALC_MPT: string;
    CALC_U_INVALID: string;
    CALC_BORN_NUMB: string;
    surname: string;
    name: string;
    title: string;
    born_numb: string;
    fz_uvazok: string;
    fz_typzam: string;
    v_rok: integer;
    v_mesiac: integer;
    n_zaklad_np: double;
    n_zaklad_dp: double;
    n_zaklad_ip: double;
    n_zaklad_up: double;
    poc_nezaop_deti: integer;
    o_nemoc: double;
    o_dochod: double;
    o_invalid: double;
    o_fondzam: double;
    oz_nemoc: double;
    oz_dochod: double;
    oz_invalid: double;
    oz_fondzam: double;
    oz_uraz: double;
    u_invalid: integer;
    vynimka_vz: string;
    v_dni: integer;
    CALC_U_FONDZAM: string;
    u_fondzam: integer;
    CALC_U_NEMOC: string;
    u_nemoc: integer;
    CALC_ROZSAH_SP: string;
    u_dochod: integer;
    u_uraz: integer;
    n_zaklad_gp: double;
    u_rezerva: integer;
    CALC_DNI: longint;
    typzec: integer;
    n_zaklad_fz: double;
    n_zaklad_rf: double;
    oz_garancne: double;
    oz_rezerva: double;
    vyptypzec: integer;
    pocDniStrajku: integer;
    f_vyplata: integer;

      // Constructor
      constructor Create;
  end;

const
{$IfDef TESTMODE}
  SysTest = 1;
  SysDebug = 1;
{$Else}
  SysTest = 0;
  SysDebug = 0;
{$EndIf}
  KonvKurzEuro : double = 30.126;
  KonvKurzEuroTxt = 'Konverznı kurz  1 EUR = 30,1260 SKK';
  MaxCodeEmp = 99999999;
  MenoTlacDir='excel';
  MenoXmlDir='vystupy';
  MenoImpDir='importy';
  MenoFrmDir='frm';
  MenoRepDir='vystupy';
  OutboxMessageBodyFile = 'outbox.conf\sprava.html';
  OutboxSubjectFile = 'outbox.conf\subjekt.txt';
  MenoTlacCsv='zostava';
  MenoTlacSlk='zostava';
  MenoTlacSp1p='priloha';
  MenoTlacVd2Slk='dan_rocne_hlasenie_';
  MenoTlacXml='tb';
  MenoTlacVub='vub';
  MenoTlacChyby1='chyby1_';
  MenoTlacChyby2='chyby2_';
  MenoTlacDHD = 'dohodari.csv';
  MenoTlacPZ = 'stitky_potvrd_';
  MenoVzorHlasenie='vzor1.rtf';
  MenoTlacHlasenie='hlasenie.rtf';
  MenoCelaFirma='spolu celá firma';
  MenoSub1999='ROK1999.INI';
  MenoSub2000='ROK2000.INI';
  MenoSub2001='ROK2001.INI';
  MenoSub2002='ROK2002.INI';
  MenoCopyright='Copyright 1996-2012 Rainitech, s.r.o';
  MyDbPassword='34566%YKF!=?N)&';
  MyVerziaEuro=1;
  MyVerziaNum='4.40A';
  MyProductName='P01V0320R';
  MyVerzia='Verzia '+MyVerziaNum+'.';
  MyWinCaption='PAM98 VERZIA '+MyVerziaNum;
  MyDbVerzia=0;
  PoiPlatiZam=[1,2,4,5];
  PoiPlatiFir=[1,3];
  Zakon_2000_05 = 200005;
  Zakon_2001_01 = 200101;
  Zakon_2002_01 = 200201;
  Zakon_2002_07 = 200207;
  Zakon_2003_01 = 200301;
  Zakon_2004_01 = 200401;
  Zakon_2005_01 = 200501;
  Zakon_2005_09 = 200509;
  Zakon_2006_01 = 200601;
  Zakon_2006_08 = 200608;
  Zakon_2007_01 = 200701;
  Zakon_2008_01 = 200801;
  Zakon_2008_07 = 200807;
  Zakon_2008_12 = 200812;
  Zakon_2009_01 = 200901;
  Zakon_2011_01 = 201101;
  Zakon_2011_05 = 201105;
  Zakon_2012_01 = 201201;
  Zakon_2013_01 = 201301;
  Zakon_Euro_Dual_Od = 200806;
  PriemernyPocetTyzdnov = 4.348;
  PriemernyPocetDni = 21.74;

  MenoArj='arj.exe';
  ParametreArj='a -re -v1440 ';
  MenoZip='zip.exe';
  ParametreZip='-j ';
  MenoUnzip='unzip.exe';
  ParametreUnzip='-o ';
  MenoSkladovehoSuboru='bkp';

  Alias_Common = 'PAM98_COMM';
  Alias_Data   = 'PAM98_DATA';
  Alias_Datx   = 'PAM98_DATX';
  Alias_Dskk   = 'PAM98_DSKK';
  Alias_Private= 'PAM98_PRIV';
  Alias_Upgrade= 'PAM98_UPG';

  Demo_Mesiace: set of byte = [1,2,3,4,5,6,7,8,9];
  {I designed my form in 1024x768 mode.}
  DesignScreenWidth: LongInt = 1024;
  DesignScreenHeight: LongInt = 768;

  SetOf_InstituciaValid=['D','E','F','P','S','U','X','Z','Y'];
  SetOf_PoistenieValid=[0,1,2,3,4,5];
  SetOf_Poistenie2Valid=[0,1];
  SetOf_VynimkaVzValid=['0'..'Z'];
  SetOf_PU_poistovne=[29,34,35,43];
  SetOf_PU_symboly=['+','(',')','[',']','*'];
  SetOf_Typzec_PP=[1,10,12,14,16,18];
  SetOf_Typzec_NP=[2,3,11,13,15,17,19];
  Condition_Typzec_PP='in (1,10,12,14,16,18)';
  Condition_Typzec_NP='in (2,3,11,13,15,17,19)';
  {Smer zaokruhlovania}
  Sm_hore=0;
  Sm_dole=1;
  Sm_normal=2;
  Sm_bez=3;

  {Danove sekcie}
  coDanOd       = 'DAN-OD';
  coDanSadzba   = 'DAN-SADZBA';
  coDanSumaPlus = 'DAN-SUMAPLUS';

  {Reportove Sekcie}
  coReportDoplnok = 'REPORT-DOPLNOK';

resourcestring

SMyAppSkratenyNazov=
  'PAM98';
SMyAppInvalidObdobie4Demo=
  'Momentálne pouívate DEMO verziu programu PAM98. '+
  'Vıplatné obdobie pre skúšobnú prevádzku programu ' +
  'bolo urèené na vıplatné mesiace január a september.';
SMyAppInvalidValue=
  'Nesprávna hodnota.';
SMyAppInvalid2Value=
  'Nesprávna hodnota - poloka %s.';
SMyAppOnlyForExtendedVersion =
  ' Táto funkcia je povolená len pre verziu PAM98 "EXTENDED".';
SMyAppNewPasswordNotSame=
  'Nesprávne zadané nové heslo, nezhoduje sa s kontrolnou hodnotou.';
SMyAppInvalidPassword='Nesprávny vstupnı kód.';
SMyAppPasswordSuccesfullyChanged='Vstupné heslo bolo úspešne zmenené.';
SMyAppPasswordNotChanged=
   'Heslo nebolo zmenené.';
SMyAppInvalidLogin=
  'Program bude ukonèenı, pretoe nebol úspešne prihlásenı oprávnenı '+
  'pouívate¾ programu.';
SMyAppInvalidLonginteger='Nesprávna èíselná hodnota.';
SMyAppNotRegistered=
  'Program bude ukonèenı, pretoe nebol riadne zaregistrovanı. '+
  'Oprávnenı pouívate¾ programu musí zada registraènı kód.';
SMyAppInvalidRegKey='Chybnı registraènı kód';
SMyAppMocVelaPokusov='Prekroèenı maximálny poèet pokusov.';
SMyAppZlePredcislo='Predèíslo nevyhovuje kontrole na modulo 11';
SMyAppZleAbo='Èíslo úètu nevyhovuje kontrole na modulo 11';
SMyAppCannotEdit='Neexistuje záznam pre vykonanie opravy';
SMyAppEditMode='Najskôr je potrebné dokonèi spracovanie zmien';
SMyAppZamCancel='Nie je dokonèené spracovanie údajov zamestnanca. Ignorova vykonané zmeny ?';
SMyAppZrvCancel='Nie je dokonèené spracovanie zráok zo mzdy. Ignorova vykonané zmeny ?';
SMyAppNepCancel='Nie je dokonèené spracovanie neprítomnosti. Ignorova vykonané zmeny ?';
SMyAppHsuCancel='Nie je dokonèené spracovanie vıkonovej mzdy. Ignorova vykonané zmeny ?';
SMyAppVypNpCancel='Nie je dokonèené spracovanie nepravidelnıch príjmov. Ignorova vykonané zmeny ?';
SMyAppVypNpZleObdobie='Mesiac do ktorého sa rozpoèítava príjem nesmie by väèší ako je mesiac aktuálneho vıplatného obdobia.';
SMyAppVypNpZmenaKalDni='Upozornenie: Bol prepoèítanı poèet kalendárnych dní pod¾a zadaného mesiaca.';
SMyAppVypNpDuplicitnyZaznam='Duplicitnı záznam. Pre danı mesiac u existuje záznam s nepravidelnım príjmom.';
SMyAppZrvAzPoZmeneVyp='Ak chcete pridáva alebo opravova zráky zo mzdy, musíte ma vıplatu v reime opráv alebo pridávania.';
SMyAppHsuAzPoZmeneVyp='Ak chcete pridáva alebo opravova vıkonovú mzdu, musíte ma vıplatu v reime opráv alebo pridávania.';
SMyAppCloseForm='Nie je dokonèené spracovanie zmien. Ignorova vykonané zmeny ?';
SMyAppTerminate='Naozaj ukonèi aplikáciu PAM98 ?';
SMyAppZlyhanieDB='Nepodarilo sa otvori súbor %s';
SMyAppLimitExceeded=
  'Ïalšiu vıplatu v tomto mesiaci nie je moné prida. '+
  'Táto verzia programu umoòuje v jednom mesiaci vytvori maximálne %s vıplat';
SMyAppDataNotFound='Program nenašiel ani jednu databázu.';
SMyAppUserWantInsert='Prida novı záznam ?';
SMyAppStopUserWantInsert='Pridávanie záznamu bolo zastavené.';
SMyAppReportInitFailed='Nepodarilo sa inicializova tlaèovú zostavu. ';
SMyAppReportIsEmpty='Tlaèová zostava neobsahuje iadne údaje, je prázdna.';
SMyAppReportShowFailed='Nastala chyba pri vytváraní tlaèovej zostavy. ';
SMyAppOnlyHalfValueAllowed='Desatinná èas nesmie by iná ako 0.5 !!!';
SMyAppNaozajSpustitGfkGarancne=
  'Nepouívajte túto funkciu bez súhlasu spoloènosti RAINITECH !!!. eláte si spusti nastavenie garanèného poistenia pre všetkıch zamestnancov ?';
SMyAppNaozajSpustitGfkZmenaNaDohodarov=
  'Nepouívajte túto funkciu bez súhlasu spoloènosti RAINITECH !!!. eláte si spusti zmenu všetkıch zamestnancov na dohodárov ?';
SMyAppGfkGarancneHotovo=
  'Garanèné poistenie bolo nastavené v zamestnancoch aj vo vıplatách v aktuálnom mesiaci.';
SMyAppXenon98NaozajSpustit=
  'eláte si spusti export údajov do súboru pre program Xenon 98 ?';
SMyAppXenon98Hotovo=
  'Export je ukonèenı. Exportované údaje boli uloené do súboru %s.';
SMyAppAccessImportNaozajSpustit=
  'eláte si spusti import údajov z Accessu ? Vıplaty v mesiaci %d/%d budú vymazané ! Pokraèova ?';
SMyAppAccessImportHotovo=
  'Import je ukonèenı. Poèet importovanıch vıplat: %d.';
SMyAppImportAnketarovNaozajSpustit=
  'eláte si spusti import údajov o anketároch zo súboru %s ?';
SMyAppImportVyplatNaozajSpustit=
  'eláte si spusti import údajov o vıplatách zo súboru %s ?';
SMyAppVymazVyplatAnketarov=
  'Budú vymazané všetky vıplaty za mesiac %d/%d v strediskách èíslo %s. '+
  'Pokraèova ?';
SMyAppVymazVyplatPriImporte=
  'Prvım krokom importu môe by je moné vymaza všetky vıplaty za mesiac %d/%d, ak si to eláte. '+#10#13+
  'Áno, znamená pokraèova s vymnazaním.'+#10#13+
  'Nie, znamená pokraèova bez vymazania.';
SMyAppRunZalohovanie=
  'Zálohovanie údajov do adresára %s.'+#10#13+
  'Spustenie zálohovania spôsobí zatvorenie databáz. Neskôr ich '+
  'môete otvori cez menu "Vıber firmy".'+#10#13+
  'Pokraèova ?';
SMyAppObnovaVyber=
  'Vıber súboru so zálonou kópiou';
SMyAppXmlVyber=
  'Vıber XML súboru pre sociálnu poisovòu';
SMyAppRunObnova=
  'POZOR! Obnovou údajov zo zálonej kópie budú definitívne vymazané aktuálne údaje firmy %s.'+#10#13+
  'Spustenie obnovy spôsobí zatvorenie databáz. Neskôr ich '+
  'môete otvori cez menu "Vıber firmy".'+#10#13+
  'Pokraèova ?';
SMyAppRunObnovaCommon=
  'POZOR! Obnovou údajov zo zálonej kópie budú definitívne vymazané súèasné nastavenia parametrov pre rok %d.'+#10#13+
  'Spustenie obnovy spôsobí zatvorenie databáz. Neskôr ich '+
  'môete otvori cez menu "Vıber firmy".'+#10#13+
  'Pokraèova ?';
SMyAppVlozDisketu=
  #10#13'Prosím vlote disketu do mechaniky %s.'+#10#13+
  'Pokraèova ?';
SMyAppIbaJednoStredisko=
  'V èíselníku stredísk nie sú zadefinované aspoò 2 strediská, preto '+
  'nie je moné zmeni stredisko.';
SMyAppNesuhlasDatumovehoIntervalu=
  '"Dátum do" musí by väèší ako "dátum od".';
SMyAppOtazkaZrusitRegistraciu=
 'Zrušením registrácie programu sa program ukonèí.'#13+
 'Pri novom spustení program budete potrebova novı registraènı kód.'#13+
 'Zruši registráciu programu ?';
SMyAppOtazkaNaozajZrusit=
 'Naozaj zruši %s ?';
SMyAppOtazkaTestovatEmaily=
 'eláte si vykona test a zasla emaily s vıplatnımi páskami'#13+
 'na testovaciu emailovu adresu %s ?';
SMyAppOtazkaPoslatEmaily=
 'Dôleité!'#13'eláte si posla email s vıplatnımi páskami zamestnancom práve teraz ?';
SMyAppEmailVysledok =
 'Vıslednı LOG zo zasielania emailov si skontrolujte v tomto súbore:'#13#13' %s.';
SMyAppRegistraciaZrusena=
 'Registrácia programu bola zrušená. Program bude ukonèenı.';
SMyAppRegistraciaNejdeZrusit=
 'Registrácia nemôe by zrušená. Program nie je zaregistrovanı.';
SMyAppPridanieFirmyUspech=
 'Pridanie novej firmy bolo úspešné. Poradové èíslo novej firmy je %d.';
SMyApppridanieFirmyNeuspech=
 'Chyba pri pridávaní novej firmy.';
SMyAppZrusenieFirmyPopis=
 'Upozornenie! Všetky údaje firmy %s budú nenávratne vymazané ! Pokraèova ?';
SMyAppZrusenieFirmyUspech=
 'Zrušenie firmy %s prebehlo úspešne.';
SMyAppZrusenieFirmyNeuspech=
 'Chyba pri rušení firmy %s.';
SMyAppZrusenieFirmyOtvorena=
 'Nie je moné zruši otvorenú firmu.';
SMyAppZrusenieTlacovychDefinicii=
 'Upozornenie! Všetky definície tlaèovıch zostáv budú vymazané ! Pokraèova ?';
SMyAppIbaMultiverzia=
 'Prevedenie príslušnej operácie je moné iba v multiverzii programu.';
SMyAppHintPoistenie=
 'Povolené hodnoty: 0=nie, 1=áno, 2=iba pracovník, 3=iba firma, 4=súèet sadzieb, 5=áno,ale firma len gar.fond';
SMyAppHintPoistenie2=
 'Povolené hodnoty: 0=nie, 1=áno';
SMyAppHintVynimkaVZ=
 'Povolené hodnoty: 0=bez vınimky, ostatné povolené hodnoty sú v èíselníku';
SMyAppChybaHlavickaHP=
'Najskôr je potrebné zada hlavièku hromadného príkazu.';
SMyAppOtazkaGenerujHP=
'eláte si spusti generovanie hromadného príkazu pod¾a vıplat za %s ?';
SMyAppGenerujHPNotSelected=
  'Nevybrali ste iadnu èas hromadného príkazu. Generovanie bolo zrušené.';
SMyAppGenerujHPCompleted=
  'Generovanie hromadného príkazu bolo dokonèené. '+
  #13#10#13#10+'!!! Sumu pre odvod preddavkov alebo dane na daòovı úrad je potrebné skontrolova a prípadne aj manuálne upravi !!!'+
  #13#10+'     Táto suma nezoh¾adòuje neuplatnené preplatky z minulıch mesiacov.'+
  #13#10#13#10+'!!! Doporuèujeme vdy kontrolova s vıkazmi !!!';
SMyAppHPCompletedXml=
  'Generovanie súboru %s bolo dokonèené.';
SMyAppOtazkaBoloRocneZuctovanieVTomtoMesiaci=
  'Pre benı vıkaz v mesiaci pouite ako odpoveï prednastavenú vo¾bu "Nie"'#10#13#10#13+
  'V mesiaci v ktorom ste vykonali a pripísali roèné zúètovanie preddavkov dane, pouite vo¾bu "Áno" a údaje z roèného zúètovania sa zahrnú do tohto mesaèného vıkazu.'+#10#13#10#13+
  'Bolo v tomto mesiaci vykonané roèné zúètovanie preddavkov dane?';
SMyAppDuMesVykCompletedXml=
  'Generovanie súboru %s bolo dokonèené.'+#10#13+
  'XML súbor je moné nahra do softvéru eDANE, ktorı poskytuje daòovı úrad na svojej web stránke.'+#10#13+
  'Po stlaèení OK sa otvorí Explorer v príslušnom adresári, kde bol vygenerovanı súbor.';
SMyAppHPCompletedVub=
  'Generovanie súboru %s bolo dokonèené.';
SMyAppHPBadCisloU=
  'Chybné èíslo úètu: %s !!!';
SMyAppHPNevyplnenyDatumSplatnosti=
  'Najskôr je potrebné vyplni dátum splatnosti hromadného príkazu.';
SMyAppPriznakUctovatInvalid=
'Nesprávna hodnota. Povolené hodnoty sú 0(nie) a 1(áno).';
SMyAppCreateFileFailed=
 'Nepodarilo sa vytvori súbor %s. Skontrolujte, èi súbor s uvedenım menom nepouíva iná aplikácia.';
SMyAppFileCreated=
 'Súbor %s bol úspešne vytvorenı. Tento súbor je moné otvori v Exceli.';
SMyAppRunExcel=
 'eláte si otvori vytvorenı súbor v Exceli ?';
SMyAppRunRTF=
 'eláte si otvori vytvorenı súbor %s ?';
SMyAppHpidIsNull=
 'Najskôr musíte vybra hromadnı príkaz na úhradu.';
SMyAppParameterNotFound=
 'Nenašiel sa parameter %s.';
SMyAppFileNotFound=
 'Neexistuje súbor %s.';
SMyAppDanovePasmaNotFound=
 'Súbor %s neobsahuje informácie o daòovıch pásmach.';
SMyAppNastavitDanovePasma=
 'Chcete nastavi daòové pásma pre rok %d zo súboru %s ?';
SMyAppNastavitParametreRoku=
 'Chcete nastavi parametre pre rok %d zo súboru %s ?';
SMyAppNaozajVymazatHromPrikaz=
 'Bude vymazaná hlavièka hromadného príkazu a tie všetky riadky hromadného príkazu. Pokraèova ?';
SMyAppZakazRobitZmeny=
 'Nie je moné vykona zmenu vıplaty staršej ako je dátum poslednej uzávierky (%s)';
SMyAppZakazRobitZmenyMimoAktMesiaca=
 'Nie je moné vykona zmenu vıplaty v inom ne aktuálnom období. V prípade, e chcete údaje zmeni, vykonajte zmenu vıplatného obdobia.';
SMyAppPreniestZmenyDoVyplat=
 'Vykonali ste zmeny v nastaveniach. Chcete tieto zmeny prenies do všetkıch vıplat v mesiaci %s ?';
SMyAppNaozajPrepocitatVyplaty=
 'Naozaj chcete prepoèíta všetky vıplaty za %s ?';
SMyAppNaozajRozdelitDan=
 'Pred vykonaním tejto operácie je doporuèené vykona zálohu údajov a po vykonaní akcie kontrolu údajov vo vıplatách. Naozaj chcete prepoèíta všetky vıplaty (%s) a rozdeli daò pod¾a príjmu na preddavkovú a zrákovú v mesiaci %s ?';
SMyAppZakazRobitHsv=
 'Nie je moné vykona hromadné spracovanie vıplat v mesiaci pred dátumom poslednej uzávierky (%s)';
SMyAppZakazRobitHsu=
 'Nie je moné vykona hromadné spracovanie úkonov v mesiaci pred dátumom poslednej uzávierky (%s)';
SMyAppLenPoslednyMesiacStvrtroka=
 'Uvedenı vıkaz je moné vytvára iba v mesiacoch 3,6,9 a 12, teda poslednı mesiac štvrroka.';
SMyAppZrusenaFunkcia=
  'Táto funkcia je od %s zrušená';
SMyAppVytvoritNovyXml=
  'Súbor %s u existuje. Touto operáciou vznikne novı XML súbor. Naozaj si eláte vytvori novı XML súbor ? ';
SMyAppExistujePrepisat=
  'Súbor %s u existuje. Touto operáciou vznikne novı súbor, prièom údaje v existujúcom súbore budú prepísané. Naozaj si eláte prepísa existujúci súbor a vytvori novı ? ';
SMyAppSpustitVypocetCDM=
  'eláte si vypoèíta dennı vymer.základ pre vıpoèet náhrad PN pre rok %d ?'+#10#13+
  'Pokraèova ?';
SMyAppOtazkaVymazatCDM=
  'eláte si vymaza údaj denného vymer.základu pre vıpoèet náhrad PN pre všetkıch platnıch zamestnancov ?';
SMyAppVypocetCDM_Hotovo=
  'Vıpoèet skonèil. Prosím skontrolujte poloku "Dennı vymer.zákl.pre náhr.PN" na kartách zamestnancov v záloke "Pracovné údaje".';
SMyAppTypRiadkuNieJeVybraty=
  'Nevybrali ste typ riadku. Najskôr musíte vybra typ riadku.';
SMyAppKodNieJeVyplneny=
  'Chyba. Kód poisovne musí by vyplnenı.';
SMyAppKodNieJeCislo=
  'Chyba. Kód poisovne musí by èíselná hodnota.';
SMyAppNedaSaNastavitRok=
  'Od roku 2005 je kadı rok evidovanı osobitne. Zmena roku znamená zmenu agendy a vykonáva sa cez menu Systém/Vıber firmy. V tejto obrazovke môete rok nastavi na hodnotu 2004 alebo menšiu';
SMyAppRokUzExistuje=
  'Zaloenie databáz roku %s nie je moné, pretoe databázy u existujú.';
SMyAppZalozenieRokuUspech=
 'Zaloenie databáz roku %d bolo úspešné. Databázy sú uloené v adresári %s.';
SMyAppZalozenieRokuNeuspech=
 'Zaloenie databáz roku %d skonèilo neúspešne.';
SMyAppOtazkaPridatRok=
  'eláte si zaloi databázy pre rok %s ? '+
  'Pokraèova ?';
SMyAppZauctovatPreplatkyDane=
  'eláte si do vıplaty za %s zaúètova vypoèítané preplatky a nedoplatky dane z roèného zúètovania preddavkov dane za rok %d ? '+
  'Pokraèova ?';
SMyAppZauctovatPreplatkyZP=
  'eláte si do vıplaty za %s zaúètova vypoèítané preplatky a nedoplatky zdrav.poistenia z roèného zúètovania preddavkov zdrav.poistenia za rok %d ? '+
  'Pokraèova ?';
SMyAppNeexistujeRZP=
  'V roku %d sa nenašli iadne vypoèítané roèné zúètovania preddavkov. '+
  'Zmeòte vıplatné obdobie na minulı rok a vykonajte roèné zúètovanie preddavkov.';
SMyAppChybaPriZauctovaniPreplatkovDane=
  'Zaúètovanie preplatkov/nedoplatkov dane skonèilo s chybami. Viac informácií nájdete v protokole zo spracovania.';
SMyAppChybaPriZauctovaniPreplatkovZP=
  'Zaúètovanie preplatkov/nedoplatkov zdrav.poistenia skonèilo s chybami. Viac informácií nájdete v protokole zo spracovania.';
SMyAppFilesGenerated=
  'Generovanie súborov v adresári %s bolo dokonèené.';
SMyAppZdravFilesGenerated=
  'Generovanie súborov %s v adresári %s a v podadresári príslušnej zdravotnej poisovne bolo dokonèené.';
SMyAppZdravRzpFilesGenerated=
  'Súbor %s s podkladmi pre roèné zúètovanie bol vytvorenı.'+CHR(13)+CHR(10)+
  'Program nedokáe generova obdobia poistenia OD DO pre zamestnancov, ktorı mali v priebehu roka prerušené poistenie.'+CHR(13)+CHR(10)+
  'Tieto obdobia je potrebné do súboru doplni manuálne v textovom editore.'+CHR(13)+CHR(10)+
  'Po stlaèení OK sa otvorí Explorer v príslušnom adresári, kde bol vygenerovanı súbor.';
SMyAppZdravFilesNotGenerated=
  'Súbory neboli vygenerované, nako¾ko nie sú pripravené iadne údaje pre export dát.'+CHR(13)+CHR(10)+
  'Najskôr je potrebné pripravi údaje v karte zamestnanca v záloke Zdr.poist.-typ dávky 601.';
SMyAppChybaRozdielneDatumy=
  'Nie je moné zada poadovanı typ udalosti, pretoe uvedenı typ vyaduje ma zadané rovnaké dátumy zaèiatku aj konca';
SMyAppDovodPreruseniaNemaBytVyplneny=
  'Dôvod prerušenia poistenia je moné zada len pre registraènı list SP-prerušenie';
SMyAppDovodPreruseniaMusiBytVyplneny=
  'Dôvod prerušenia poistenia musí by vyplnenı';
SMyAppNepripustnyTypRL2=
  'Neprípustnı typ udalosti pre zvolenı registraènı list.';
SMyAppNoRowNotSelected=
  'Nebol oznaèenı ani jeden riadok, aspoò jeden záznam je potrebné oznaèi.';
SMyAppShowRowSelected=
  'Bolo oznaèenıch %d riadkov na spracovanie. Pokraèova ?';
SMyAppBadRcLength=
  'Dåka rodného èísla musí by minimálne 9 a maximálne 10 znakov.';
SMyAppNotFoundVykazZP=
  'Vıkaz pre zdravotnú poisovòu è.%d je prázdny.';
SMyAppRocneZuctZpAzOdRoku2006=
  'Roèné zúètovanie zdravotného poistného sa 1.krát vykonáva a vo vıplatnom období roku 2006 za rok 2005. Je potrebné najskôr nastavi správne vıplatné obdobie.';
SMyAppRocneZuctZlyRok=
  'Nesprávny dátum %s - rok musí by zhodnı s rokom, za ktorı sa robí roèné zúètovanie.';
SMyAppVD_PDF_Hotovo=
  'Bolo vygenerovanıch %d súborov %s v adresári %s. Súbory je moné prezera v prehliadaèi Acrobat Reader 6.0 CE alebo vyššom. Prehliadaè sa otvorí automaticky po dvojkliknutí na danı súbor.';
SMyAppZalozitNovuFirmu=
  'Vybrali ste vo¾bu pre pridanie novej firmy do mzdovej evidencie. Pokraèova ?';
SMyAppItemIsRequired=
  'Poloka %s musí by vyplnená';
SMyAppCompleted=
  'Operácia bola úspešne dokonèená';
{--}
SMyCisDeleteQuestion='Vymaza poloku ?';
SMyCisDeleteStopped='Vymazanie poloky bolo zastavené';
SMyCisDeleteNotAllowed='Vymazanie poloky nie je dovolené';
SMyCisKeyViolation='Key violation.';
SMyCisDuplicitnyZaznam='Duplicitnı záznam.';
SMyCisInsertNotAllowed='Pridanie poloky nie je dovolené';
SMyCisInstituciaNotValid=
 'Nesprávna hodnota.';
SMyCisStrediskoJednaMusiZostat=
 'Nie je moné vymaza stredisko s èíslom 1.';
{--}
SMyHsvPocetZauctovanych=
 'Prebehlo hromadné spracovanie vıplat. Poèet spracovanıch vıplat %d.';
SMyHsvOtazkaSpustit=
 'Chcete spusti zaúètovanie vıplat v mesiaci %s';
SMyHsvOtazkaUkoncit=
 'Prajete si ukonèi hromadné spracovanie vıplat ?';
{--}
SMyHsuOtazkaSpustit=
 'Chcete spusti zaúètovanie vıkonovej mzdy v mesiaci %s';
SMyHsuPocetZauctovanych=
 'Prebehlo zaúètovanie vıkonovej mzdy. Poèet spracovanıch vıplat %d.';
SMyHsuOtazkaUkoncit=
 'Prajete si ukonèi zadávanie vıkonovej mzdy ?';
SMyHsuOtazkaSpustitNacitanie=
 'Chcete spusti naèítanie podkladov pre vıpoèet vıkonovej mzdy v mesiaci %s ?'+
 'Údaje, ktoré ste ruène zadali v tomto mesiaci budú vymazané.';
SMyHsuNacitanieHotovo=
 'Prebehlo naèítanie podkladov vıkonovej mzdy. Poèet naèítanıch riadkov %d.';
{--}
SMyPar24='Priemer pre nemoc.dávky 0-pôvodne,1-aktuálna daò';
SMyPar25='Vıška prídavku na 1 diea';
SMyPar26='Základ pre DDP: 1-hrubá mzda, 2-základná mzda';
{--}
SMyRepExecError='Nepodarilo sa inicializova tlaèovú zostavu';
SMyRepNotFoundVP='V zadanom mesiaci neexistujú vıplatné pásky';
SMyRepJedenPracovnik='Pre zvolenı typ tlaèovej zostavy musí by vybranı konkrétny pracovník';
SMyRepNotFoundVP2EMAIL='V aktuálnom mesiaci neexistujú vıplatné pásky pripravené na odoslanie emailom, alebo yamestnanci nemajú správne vyplnenú mailovu adresu.';
{--}
SMyRzpZaciatok='Automatické zaúètovanie preplatku/nedoplatku dane prebehne správne len vtedy, ak u máte hotové vıplaty za aktuálny mesiac, do ktorého chcete toto zaúètovanie vykona. Pokraèova ?';
SMyRzzpZaciatok='Automatické zaúètovanie preplatku/nedoplatku zdr.poistenia prebehne správne len vtedy, ak u máte hotové vıplaty za aktuálny mesiac, do ktorého chcete toto zaúètovanie vykona. Pokraèova ?';
SMyRzpUzExistuje='Roèné zúètovanie dane u bolo urobené';
SMyRzpVymazatZuctovanie='Vymaza roèné zúètovanie dane ?';
SMyRzpBudeDefinitivneZrusene='Roèné zúètovanie dane bude definitívne zrušené ?';
SMyRzpVymazanieBoloZastavene='Vymazanie roèného zúètovania dane bolo zastavené';
SMyRzpNemenPred2002='Nie je dovolené pridáva ani modifikova roèné zúètovania pred rokom 2002';
SMyRzpNeexistuje='Najskôr je potrebné vykona roèné zúètovanie dane';
SMyRzpNeexistuje2='Roèné zúètovanie dane nebolo nájdené. Ak spracovávate rok %d, je potrebné zmeni vıplatné obdobie. Ak spracováte rok %d je potrebné najskôr urobi roèné zúètovanie dane.';
SMyRzpChybaHranicaPreNezdCiastku=
  'Nie je definovaná hranica zákl.dane pre nekrátenie nezd.èiastky na daòovníka. Skontrolujte èíselník parametrov programu.';
{--}
SMyZdrOznamenieNeexistuje='Nie je moné vytlaèi oznámenie o preplatkoch. Buï nebol vloenı záznam do evidencie pre roèné zúètovanie zdravotného poistenia, alebo nebol vloenı záznam do evidencie vısledkov roèného zúètovania."';
SMyZdrDokladNeexistuje='Nie je moné vytlaèi doklad o preddavkoch. Buï nebol vloenı záznam do evidencie pre roèné zúètovanie zdravotného poistenia, alebo nie je nastavenı spôsob vıberu iadosti : "zamestnanec poiadal zamestnávate¾a o vystavenie potvrdenia"';
SMyZdrVysledokNeexistuje='Nie je moné vytlaèi oznámenie zamestnanca. Nebol vloenı záznam do sekcie Vısledok roèného zúètovania.';
SMyZdrVypPodkladovPreDoklad='eláte si vykona vıpoèet podkladov pre doklad ? Ak ste tento vıpoèet u urobili v minulosti, tak údaje budú nahradené novım vıpoètom. Pokraèova ?';
SMyZdrVypPodkladovPreDokladHotovo='Podklady pre doklad za jednotlivé mesiace boli zapísané do tabu¾ky.';
SMyZdrVypPodkladovChyba='Nie je moné vykona tlaè. Najskôr je potrebné vykona vıpoèet podkladov pre doklad v záloke Doklad o preddavkoch za rok %s.';
{--}
SMyZukVymazatZuctovanie='Vymaza vıkon ?';
SMyZukBudeDefinitivneZrusene='Vıkon bude definitívne zrušenı ?';
SMyZukVymazanieBoloZastavene='Vymazanie vıkonu bolo zastavené';
{--}
SMyVypUzExistuje='Vıplata u bola urobená';
SMyVypVymazatVyplatu='Vymaza vıplatu ?';
SMyVypBudeDefinitivneZrusena='Vıplata bude definitívne zrušená ?';
SMyVypVymazanieBoloZastavene='Vymazanie vıplaty bolo zastavené';
SMyVypOtazkaUplatnitZrazkovuDan=
 'Zrákovou daòou je moné zdani príjem zamestnanca do vıšky %s mesaène v prípade zamestnanca, ktorı zamestnávate¾a nepoiadal o uplatòovanie nezdanite¾nıch èiastok a daòového bonusu. Naozaj si eláte uplatni zrákovú daò ?';

SMyVypOdpracDniTrebaVyplnit=
  'Poloka poèet odpracovanıch dní musí by vyplnená.';
SMyVypOdpracHodinyTrebaVyplnit=
  'Poloka poèet odpracovanıch hodín musí by vyplnená.';
SMyVypVynimkaVVZTrebaVyplnit=
  'Poloka vınimka vıšky vymer.základu musí by vyplnená.';
SMyVypTlacHPNotSelected=
  'Nevybrali ste tlaè iadnej èasti hromadného príkazu. Tlaè bola zrušená.';
SMyVypMesiaceTrebaVyplnit=
  'Poloka poèet mesiacov, za ktoré sa vypláca jednorázová mzda musí by vyplnená.';
SMyVypTypPremiiInvalid=
'Nesprávna hodnota. Povolené hodnoty sú 0(individ.vıška),1(percent.vıška a 2(hodinová sadzba).';
{--}
SMyZamUzExistuje='Osobné èíslo %s je obsadené, musíte zada èíslo, ktoré ešte nebolo pridelené';
SMyZamRcUzExistuje='Rodné èíslo %s je v databáze u evidované pod os.èíslom: %s, menom: %s. Napriek tomu si ho eláte uloi ?';
SMyZamNeexistuje='Osobné èíslo %s zatia¾ nebolo nikomu pridelené';
SMyZamPrihlasenie='Osobné èíslo %s nemá právo prihlási sa do systému';
SMyZamNotFound='Nie je vybratı zamestnanec';
SMyZamZleHeslo='Nesprávne heslo';
SMyZamZleStareHeslo='Nesprávne staré heslo';
SMyZamNerovnakeHesla='Nové heslo 1 a nové heslo 2 musia by zhodné';
SMyZamUkoncenyPomer='Pracovník ukonèil pracovnı pomer %s. Jeho vıplaty nie je moné meni.';
SMyZamUkoncenyPomer2=
 'Zamestnancovi nie je moné zada vıplatu. Má ukonèenı pracovnı pomer.';
SMyZamNemaUkoncenyPomer=
  'Pracovník nemá zaevidovanı ukonèenı pracovnı pomer v karte zamestnanca.';
SMyZamVymazatPracovnika='Vymaza zamestnanca ?';
SMyZamBudeDefinitivneZruseny='Zamestnanec bude definitívne zrušenı ?';
SMyZamVymazanieBoloZastavene='Vymazanie zamestnanca bolo zastavené';
SMyZamMaUrobeneVyplaty=
  'Zamestnanca nie je moné zmaza dovtedy, pokım nie sú vymazané jeho vıplaty. '+
  'Ak skonèil pracovnı pomer zamestnanca, staèí nastavi poloku "Dátum ukonèenia",'+
  'nepouíva sa vo¾ba vymazanie zamestnanca';
SMyZamPohlavieNotValid='Nesprávna hodnota. Povolené hodnoty sú M(mu) a Z(ena).';
SMyZamVojakNotValid='Nesprávna hodnota. Povolené hodnoty sú A(vojak) a N(nevojak).';
SMyZamRodStavNotValid='Nesprávna hodnota. Povolené hodnoty sú S(slobodnı),Z(enatı),R(rozvedenı) a V(vdovec).';
SMyZamFzUvazokNotValid='Nesprávna hodnota. Povolené hodnoty sú 0,1,2 a 3';
SMyZamFzTypZamNotValid='Nesprávna hodnota. Povolené hodnoty sú O(ostatní),Z(obèan so ZPS) a D(dôchodca).';
SMyZamTypZrazkyNotValid='Nesprávna hodnota. Povolené hodnoty sú P(poisovòa),O(odbory),Y(pôièky),S(staveb.sporenie) a X(iné).';
SMyZamNemozeBytZtpBezZps='Najskôr je potrebné nastavi zmenenú pracovnú schopnos.';
SMyZamZapocetChybaVystup='Nie je moné vytlaèi zápoètovı list. Pracovník nemá vyplnenı dátum vıstupu.';
SMyZamZapocetChybnyVystup='Nie je moné vytlaèi zápoètovı list. Pracovník má nesprávne vyplnenı dátum vıstupu.';

SMyZamNemozeMatObidve=
 'Hodnotenie pracovníka môe by uskutoènené buï dohodnutou vıškou mesaèného platu '+
 'alebo hodinovou sadzbou. Poui súèasne obidve nie je moné.';
SMyZamKZPMusiBytVyplneny=
 'Kód zdravotnej poisovne musí by vyplnenı';
SMyZamSidNotFound=
 'Stredisko s uvedenım èíslom nie je zadefinované v èíselníku stredísk.';
SMyZamMusiBytRovnakeObdobie=
 'Neprítomnos musí zaèína aj konèi v tom istom mesiaci, inak sa musí rozdeli do viacerıch záznamov.';
SMyZamNepMusiZacinatVAktRoku=
 'Dátum zaèiatku neprítomnosti musí zodpoveda aktuálnemu vıplatnemu roku, v ktorom je zadávanı alebo menenı.';
SMyZamNepMusiKoncitVAktRoku=
 'Dátum ukonèenia neprítomnosti musí zodpoveda aktuálnemu vıplatnemu roku, v ktorom je zadávanı alebo menenı.';
SMyZamDatumMusiZacinatVAktRoku=
 'Zadanı dátum musí zodpoveda aktuálnemu vıplatnemu roku, v ktorom je zadávanı alebo menenı.';
 SMyZamPrekrocenyPocetPracDni=
 'Príliš ve¾kı poèet pracovnıch dní v uvedenom období. Maximálny poèet dní, ktorı je moné zada : %s.';
SMyDetMesOdExpected=
 'Mesiac od musí by vyplnenı.';
SMyDetMesDoExpected=
 'Mesiac do musí by vyplnenı.';
SMyBonusNesuhlasi=
 'Zamestnanec %s : zistenı rozdiel medzi evidenciou detí a vyplatenım bonusom. Prosím skontrolujte evidenciu detí a jeho vıplaty';
SMyNepDatZanikuPoistMusiBytDoKoncaRoka2012=
 'Dátum zániku poistenia: Dátum musí byt rovnı alebo menší ako 31.12.2012';
SMyNepNevyplnenyUdajDatumVznikuPoistenia=
 'Nevyplnenı údaj : Dátum vzniku poistenia';
SMyNepNevyplnenyUdajDatumZanikuPoistenia=
 'Nevyplnenı údaj : Dátum zániku poistenia';
SMyNepNespravnaHodnotaPrePracovnyPomer=
 'Nesprávna hodnota pre typ pracovného pomeru, povolené hodnoty sú: 1 - pracovnı pomer na dobu neurèitú, 2 - pracovnı pomer na dobu urèitú';

 function  SysLog(Const s:string):string;
function  MaxD(Const D1,D2:double):double;
function  MinD(Const D1,D2:double):double;
function  StrToChar(Const S: String): Char;
function  MyPassword(Const S: String): String;
procedure MyMessage(Const S: String);
procedure MyWarning(const S:String);
procedure MyError(const S:String);
function  MyOtazka(const S: String):Boolean;
function  Mesiac(i:integer;up:boolean):string;
function  ZAOKRUHLI(X:extended;J,S:integer):Double;
function  RODINNY_STAV(stav,pohl:char):string;
function  TEXT_POHLAVIE(pohl:char):string;
function  TEXT_VOJAK(pomer:char):string;
function  TEXT_FZ_UVAZOK(uvazok:char):string;
function  TEXT_FZ_TYPZAM(typ: char):string;
function  TEXT_TYP_PREMII(typ: integer):string;
function  TEXT_TYP_PRIPLATKOV(typ: integer):string;
function  TEXT_TYP_NEPRITOMNOSTI(typ: integer):string;
function  StrToLongint(const S:string):longint;
function  StrToDouble(const S:string):double;
function  LPAD(Const S:string;N:byte;C:char):string;
function  RPAD(Const S:string;N:byte;C:char):string;
function  Kontrola_predcisla(Const s:string):boolean;
function  Kontrola_ABO(Const s:string):boolean;
function  Je_Cislo(Const s:string):boolean;
function  IsNumeric( Value: string ): boolean;
function  RegGetStr( sKey, sItem, sDefVal : string ) : string;
procedure RegSetStr( sKey, sItem, sVal : string );
function  GetVolumeInfo(Root:String; var vi:TVolumeInfo): Boolean;
function  GetVolumeSerialNumber: string;
function  GenerateKey:string;
function  NVL(const S:string):string;
function  NVL1(const S1,S2:string):string;
function  NVL2(const S1,S2,S3:string):string;
function  NVLC(const c:variant):currency;
procedure Nastav_Farbu(F:TForm);
function  TYP_PRIPL_TO_STRING(typ: byte): string;
function  TYP_PRIPL_TO_BYTE(typ: string): byte;
function  TYP_PRIPL2_TO_STRING(typ: byte): string;
function  TYP_PRIPL2_TO_BYTE(typ: string): byte;
function  TEXT_INSTITUCIE(typ:string;kod:integer):string;
function  TEXT_ZRAZKY(typ:string):string;
function  TITULOK_REPORTU(const firma:string;sid:integer):string;
procedure Progress(x:integer);
function Spoj(X1,X2,X3:string):string;
procedure NacitajParametre(iRok,iMesiac:integer);
function VratHodnotu(const Skratka:string):double;
function VratHodnotuInt(const Skratka:string):integer;
function LongCisloU(const predc,cislo:string):string;
function MyMesiac(obdobie:longint):integer;
function MyRok(obdobie:longint):integer;
function DateToObdobie(datum:TDateTime):longint;
function DateToRRRRMMDD(datum:TDateTime):longint;
function ObdobieToMMRRRR(obdobie:longint):string;
function NajdiPosledny(const FName,FExt:string;Pocet:integer):integer;
function CLC(Const S:string):string; {Cut Last Char}
function MyAdresa(Const iUlica,iCislo,iPsc,iMesto:string):string;
function MyUlica(Const iUlica,iCislo:string):string;
procedure MyRozdelUlicu(Const iUlica:string;var oUlica,oCislo:string);
procedure MyRozdelUlicuExt(Const iUlica:string;var oUlica,orCislo,supCislo:string);
procedure MyRozdelTel(Const iTel:string;var oPredvolba,oCislo:string);
procedure MyRozdelCisloU(Const iCisloU:string;var oPredcU,oCisloU:string);
function StrReplaceX(Const iSource,iOld,iNew:string):string;
function StrReplaceAll(Const iSource,iOld,iNew:string):string;
function KAL_DNI(Const iObdobie:longint):integer;
function MyCisPar(Const iRok:integer):string;
procedure parseCsv(Const iSource:string);
function cleanCsv(const iSource:string):string;
function MyAdrRok(rok:integer):string;
function PMT(const p,m,t:string):string;
function RC_BEZ(iRC:string):string;
procedure RC_VALIDATE(iRC:string);
procedure CRLF;
procedure E_TEXT(const iELM:string);
procedure E_TEXT_LPAD(const iELM:string;iSize:integer;iChar:char;iCRLF:boolean);
procedure E_TEXT_RPAD(const iELM:string;iSize:integer;iChar:char;iCRLF:boolean);
procedure E_TAGZ(const iTAG:string);
procedure E_TAGK(const iTAG:string);
procedure E_TAG(const iTAG,iELM:string);
procedure E_TAG_DATA(const iTAG,iELM:string);
procedure EX_TAG(const iTAG,iELM:string);
procedure E_TAGA(const iTAG,iATTR:string);
procedure E_ATTR(const iATTR,iHOD:string);
procedure E_ATTRZ(const iATTR,iHOD:string);
procedure E_TAGZA(const iTAG,iATTR:string);
procedure E_XFDF(iField,iHOD:string);
function DecodeButton(iButton: TNavigateBtn):integer;
procedure Rtf_SetKeyWord(iKey,iVal:string;iLen:integer;iPad:char);
procedure Rtf_InitKeyWord;
procedure Rtf_Zobraz(X:TMyReportParam);
procedure Rtf_Open(var X:TMyReportParam);
procedure Rtf_Replace(X:TMyReportParam);
procedure Rtf_Uloz_Xml(X:TMyReportParam);
function MyFormatField(const Fmt: string; X:TField): string;
function LastDayDate(YY,MM,DD: word): TDateTime;
function Obdobie_Add_MM(iObdobie,iMM:longint):longint;
procedure VyberSuboru(iDir:string;iFilter:string);
function VyberSuboru1(iDir:string;iFilter:string):string;
function VratMesiace(var X:TMesiace): string;
function MyDateDaysBetween(Dat1,Dat2:TDateTime):longint;
function KonverziaSKK_EUR(iSumaSKK: double): double;
function KonverziaEUR_SKK(iSumaEUR: double): double;
function KonverziaSKK_EUR_nahor(iSumaSKK: double): double;
function KonverziaSKK_EUR_nadol(iSumaSKK: double): double;
function SendMail_VyplatnaPaska(iEmailFrom:string; iEmailTo: string; iEmailCC:string; iSubject:string; iBodyFile:string; iAttachFile:string):string;
function GetVersionFromRegKey(s:string): string;
function FromWinToAscii(const S: string): string;
Procedure ModifyBDE( Path, Chave, Valor: String );

var MyAppPath:string[128];
    MyNetPath:string[128];
    MyCommPth:string[128];
    MyDataPth:string[128];  {dáta z aktuálneho roku}
    MyDataDir:string[8];
    MyDatxPth:string[128]; {dáta z minulého roku}
    MyDataSkk:string[128]; {dáta v SKK}
    MyPrivPth:string[128];
    MyPamPath:string[128];
    MyBkpPath:string[128];
    MySklPath:string[128];
    MyImpPath:string[128]; {pre GfK}
    MyStdImpPath:string[128]; {standard import path}
    MyMailPath:string[128];
    MyFrmPath:string[128]; { DEFAULT .\frm\ }
    MyRepPath1:string[128]; { DEFAULT .\vystupy\dataXX\rokXX }
    MyRokPath:string[128];
    MyIniFile:TIniFile;
    MyBlatIniFile:TIniFile;
    MyParFile:TIniFile;
    MyCaption:string[128];
    MyStatus:string[64];
    MyPoslednySubor:string;
    MyXml: AnsiString;
    MyAttr:AnsiString;
    MyZamFilter:char;
    MyTextDoplatky:string[64];
    MySmtpServer:string;
    MySmtpUser:string;
    MySmtpPassword:string;
    MySmtpCC:string;
    MySmtpTestMailTo:string;
    MySmtpMailFrom:string;
    MyParser:array[1..50] of string;
    dobre_cu:boolean;
    Zakon_Euro_Dual_Do:longint = 201012;
    MyVerziaMenu: string;
    slTypzecPopis: TStringList;
    slTypzecCode: TStringList;
 {
    PravidelnePrijmyList: TList;
    NepravidelnePrijmyList: TList;
}
{
[PARAMETER 1]
POPIS=Dopravné 1
SKRATKA=DOPR1
HODNOTA=300
[PARAMETER 2]
POPIS=Dopravné 2
SKRATKA=DOPR2
HODNOTA=380
[PARAMETER 3]
POPIS=Dopravné 3
SKRATKA=DOPR3
HODNOTA=800
[PARAMETER 4]
POPIS=Hranica hrubého príjmu pre uplatnenie mimoriadnych vıdavkov
SKRATKA=DOPR_HRANICA
HODNOTA=7000
[PARAMETER 5]
POPIS=Vıška nezdanite¾nej èiastky na mimoriadne vıdavky
SKRATKA=DOPR_MIMO
HODNOTA=500
[PARAMETER 6]
POPIS=Koeficient násobku pre vıpoèet prídavkov - niší
SKRATKA=KOEF_PRIDAVKY1
HODNOTA=1,36
[PARAMETER 7]
POPIS=Koeficient násobku pre vıpoèet prídavkov - vyšší
SKRATKA=KOEF_PRIDAVKY2
HODNOTA=1,99
[PARAMETER 8]
POPIS=Nezdanite¾ná èiastka na 1 diea
SKRATKA=NEZD_DIETA
HODNOTA=750
[PARAMETER 9]
POPIS=Max poèet detí pre uplatnenie nezdanit. súm na deti
SKRATKA=NEZD_DIETA_MAXP
HODNOTA=4
[PARAMETER 10]
POPIS=Nezdanite¾ná èiastka na 1 ZP diea
SKRATKA=NEZD_DIETA_ZTP
HODNOTA=1500
[PARAMETER 11]
POPIS=Nezdanite¾ná èiastka na osobu
SKRATKA=NEZD_MINIMUM
HODNOTA=1750
[PARAMETER 12]
POPIS=Tlaèi 2 vıplatné pásky na jednu stranu A4 (NIE=0, ÁNO=1)
SKRATKA=TLAC_2VP_NA1
HODNOTA=1
[PARAMETER 13]
POPIS=1=disketa A, 2=disketa B, 0=pevnı disk
SKRATKA=ZALOHOVANIE
HODNOTA=0
[PARAMETER 14]
POPIS=ivotné minimum - plnoletá fyzická osoba
SKRATKA=ZIV_MINIMUM
HODNOTA=3000
[PARAMETER 15]
POPIS=ivotné minimum - spoloène posudzovaná osoba
SKRATKA=ZIV_MINIMUM1
HODNOTA=2100
[PARAMETER 16]
POPIS=Rodièovskı príspevok po ukonèení materskej dovolenky
SKRATKA=RODIC_PRISPEVOK
HODNOTA=0
[PARAMETER 17]
POPIS=Poèet poloiek hromadného príkazu na jednej strane
SKRATKA=POC_POL_HP
HODNOTA=15
[PARAMETER 18]
POPIS=Minimálna suma pre odvod poistenia za škody
SKRATKA=MIN_POI_SKODA
HODNOTA=70
[PARAMETER 19]
POPIS=Maximálny základ pre odvod zdrav.poistenia
SKRATKA=MAX_ZAKLAD_ZP
HODNOTA=32000
[PARAMETER 20]
POPIS=Maximálny základ pre odvod nemoc.poistenia
SKRATKA=MAX_ZAKLAD_NP
HODNOTA=32000
[PARAMETER 21]
POPIS=Maximálny základ pre odvod dôchodkového poistenia
SKRATKA=MAX_ZAKLAD_DP
HODNOTA=32000
[PARAMETER 22]
POPIS=Maximálny základ pre odvod do fondu zamestnanosti
SKRATKA=MAX_ZAKLAD_FZ
HODNOTA=32000
[PARAMETER 23]
POPIS=Nezdanite¾ná mesaèná èiastka na daòovníka
SKRATKA=NC_OSOBA
HODNOTA=3230
[PARAMETER 24]
POPIS=Vıška prídavku na 1 diea
SKRATKA=PRIDAV_NA_DIETA
HODNOTA=270
[PARAMETER 26]
POPIS=Základ pre DDP, 1-hrubá mzda, 2-základná mzda
SKRATKA=ZAKLAD_DDP
HODNOTA=1
[PARAMETER 27]
POPIS=Percent. zníenie sadzby na starobné poistenie na 1 diea
SKRATKA=ZNIZ_POIST_DIETA
HODNOTA=0,5
[PARAMETER 28]
POPIS=Daòovı bonus na vyivované diea
SKRATKA=DAN_BONUS_DIETA
HODNOTA=400
[PARAMETER 29]
POPIS=Miera poklesu schopn. vyk.zárobk.èinn.pre ú¾avu na zdrav.p.
SKRATKA=MIERA_POKLESU_ZP
HODNOTA=20
[PARAMETER 30]
POPIS=Minimálna mzda
SKRATKA=MIN_MZDA
HODNOTA=6500
[PARAMETER 31] - platné od 1.1.2006 - iba WARNING
Zdanenie príjmov zo závislej èinnosti do 5000 Sk zrákovou daòou
Zrákovou daòou sa bude zdaòova aj príjem zamestnanca do vıšky 5000 Sk
mesaène v prípade zamestnanca, ktorı zamestnávate¾a nepoiadal o uplatòovanie
nezdanite¾nıch èiastok a daòového bonusu.
POPIS=Minimálna mzda
SKRATKA=DAN_MAX_PRIJEM
HODNOTA=5000
[PARAMETER 32]
POPIS=Zráková daò k preddavkovej posunutá o 1 mesiac
SKRATKA=ZRAZ_DAN_POSUN
HODNOTA=0/1 ÁNO/NIE
[PARAMETER 33]
POPIS=Poèítanie príplatkov: 0=z hod.sadz.,1=z priem.mzdy
SKRATKA=POCITANIE_PRIPL
HODNOTA=0/1
[PARAMETER 34]
POPIS=Identifikácia pre soc.poisovòu: 0=IÈO,1=DIÈ
SKRATKA=IDENT_SOCPOIST
HODNOTA=0/1
[PARAMETER 36]
POPIS=Hranica zákl.dane pre nekrátenie nezd.èiastky na osobu
SKRATKA=NC_OSOBA_PRIJEM
HODNOTA=498000
[PARAMETER 37]
POPIS=Nezdanite¾ná roèná èiastka na daòovníka
SKRATKA=NC_OSOBA_ROK
HODNOTA=4025.70
[PARAMETER 38]
POPIS=Nezdanite¾ná èiastka na DDS, P, ÚS roène
SKRATKA=NC_OSOBA_POISTNE
HODNOTA=398.33
[PARAMETER 39]
POPIS=Sadzba odvodov pre II.pilier
SKRATKA=SADZBA_2PILIER
HODNOTA=4
}
    PARAMETRE:array[1..99] of record
      id:integer;
      skratka:string[16];
      hodnota:double;
      popis:string[60];
    end;
    PARAMETRE_M:array[1..99,1..12] of record
      id:integer;
      skratka:string[16];
      hodnota:double;
      popis:string[60];
    end;

implementation

uses
  Messages, Graphics, Controls, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, Tabs,
  ComCtrls,Registry,Progress{,About,RxCalc},DbTables,DbiProcs,DbiTypes;

var
    fSysDebug: TStringList;
    slFile: TStringList;
    slKeyWords: TStringList;
    slKeyValues: TStringList;
    Dialog1: TOpenDialog;
    i: integer;

// Priloha constructor
// --------------------------------------------------------------------------
constructor TPriloha.Create;
begin
end;

function  SysLog(Const s:string):string;
begin
  if SysDebug = 1 then fSysDebug.Add(s);
  Result := s;
end;

function MyCisPar(Const iRok:integer):string;
begin
  if iRok < 2004
    then Result := 'CIS_PAR.DB'
    else Result := 'CIS_PAR.DB'; //'P'+IntToStr(iRok)+'.DB';
end;

function  MaxD(Const D1,D2:double):double;
begin
  if D1 > D2 then MaxD := D1
             else MaxD := D2;
end;

function  MinD(Const D1,D2:double):double;
begin
  if D1 > D2 then MinD := D2
             else MinD := D1;
end;

function  StrToChar(Const S: String): Char;
begin
  if S='' then Result:=' ' else Result:=S[1];
end;

function  MyPassword(Const S: String): String;
var t:string;i:byte;
begin
  t:=s;
  for i:=1 to length(t) do t[i]:=chr( ord(t[i]) xor (i+2));
  Result:=t;
end;

procedure MyMessage(Const S: String);
begin
  Application.MessageBox(@S[1],'Informácia',
  MB_OK+MB_ICONINFORMATION+MB_DEFBUTTON1);
end;

procedure MyWarning(const S:String);
begin
  Application.MessageBox(@S[1],'Upozornenie',
  MB_OK+MB_ICONWARNING+MB_DEFBUTTON1);
end;

procedure MyError(const S:String);
begin
  Application.MessageBox(@S[1],' Chyba',
  MB_OK+MB_ICONSTOP+MB_DEFBUTTON1);
end;

function MyOtazka(const S: String):Boolean;
var X:string;
begin
  X := #13+StrReplaceAll(StrReplaceAll(S,#10#13,#13),#13#10,#13) + #0;
  FormMyOtazka:=TFormMyOtazka.Create(Application);
  FormMyOtazka.StaticText1.Lines.SetText(@X[1]);
  MyOtazka:=FormMyOtazka.ShowModal=mrYes;
  FormMyOtazka.Free;
end;

function Mesiac(i:integer;up:boolean):string;
var s:string;
begin
  case i of
   1:if up then s:='JANUÁR'    else s:='január';
   2:if up then s:='FEBRUÁR'   else s:='február';
   3:if up then s:='MAREC'     else s:='marec';
   4:if up then s:='APRÍL'     else s:='apríl';
   5:if up then s:='MÁJ'       else s:='máj';
   6:if up then s:='JÚN'       else s:='jún';
   7:if up then s:='JÚL'       else s:='júl';
   8:if up then s:='AUGUST'    else s:='august';
   9:if up then s:='SEPTEMBER' else s:='september';
  10:if up then s:='OKTÓBER'   else s:='október';
  11:if up then s:='NOVEMBER'  else s:='november';
  12:if up then s:='DECEMBER'  else s:='december';
  end;
  Result:=s;
end;

function ZAOKRUHLI(X:extended;J,S:integer):double;
{
  S=0 hore
  S=1 dole
  S=2 normal
  S=3 bez
  S=4 do 50h dole
  S=5 od 5 hore
}
var i:longint;D,XPOM:extended;
const epsilon:double=0.000000001;
begin
  XPOM:=X;
  if X=0 then begin Result:=0;exit;end;
  if (Frac(X)<>0) and (Trunc(X)<>0) and (J<0) then
   begin Result:=Trunc(X)+ZAOKRUHLI(Frac(X),J,S);exit;end
  else if (Frac(X)<>0) and (J>0) then X:=Trunc(X);
  D:=1;
  if j>0 then begin
    for i:=1 to abs(J) do D:=D*10;
    X:=X/D;
  end else begin
    for i:=1 to abs(J) do D:=D/10;
    X:=X/D;
  end;
  if ABS(Frac(X)) < epsilon then X:=Trunc(X) else
  if 1-ABS(Frac(X)) < epsilon then
  begin
    if X<0 then X:=Trunc(X)-1 else X:=Trunc(X)+1;
  end;
  if S=0 then begin
    if Frac(X)<>0 then begin
      if X<0
      then X:=Trunc(X)-1
      else X:=Trunc(X)+1
    end;
  end else
  if S=1 then X:=Trunc(X) else
  if S=2 then X:=Round(X) else
  if S=4 then begin
    if Frac(X)<=0.5 then X:=Trunc(X)
                    else X:=Round(X);
  end else
  if S=5 then begin
    if Frac(X)<0.5 then X:=Trunc(X)
                   else X:=Trunc(X)+1;
  end;
  X:=X*D;
  ZAOKRUHLI:=X;
  SysLog('ZAOK:'+Format('%0.9f',[XPOM])+';'+IntToStr(J)+';'+IntToStr(S)+'->'+Format('%0.9f',[X]));
end;

function  RODINNY_STAV(stav,pohl:char):string;
begin
  case stav of
   '1','S':if pohl='M' then Result:='slobodnı' else
       if pohl='Z' then Result:='slobodná' else
                        Result:='slobodnı(á)';
   '2','Z':if pohl='M' then Result:='enatı' else
       if pohl='Z' then Result:='vydatá' else
                        Result:='enatı(vydatá)';
   '4','V':if pohl='M' then Result:='vdovec' else
       if pohl='Z' then Result:='vdova' else
                        Result:='vdovec(vdova)';
   '3','R':if pohl='M' then Result:='rozvedenı' else
       if pohl='Z' then Result:='rozvedená' else
                        Result:='rozvedenı(á)';
   '5':if pohl='M' then Result:='druh,druka' else
       if pohl='Z' then Result:='druh, druka' else
                        Result:='druh, druka';
   else Result:='';
  end;
end;

function  TEXT_POHLAVIE(pohl:char):string;
begin
  case pohl of
   'M': Result:='mu';
   'Z': Result:='ena';
  else  Result:='';
  end;
end;

function  TEXT_VOJAK(pomer:char):string;
begin
  case pomer of
   'A': Result:='vojak';
   'N': Result:='nevojak';
  else  Result:='';
  end;
end;

function  TEXT_FZ_UVAZOK(uvazok:char):string;
begin
  case uvazok of
   '0': Result:='inı';
   '1': Result:='plnı';
   '2': Result:='poloviènı';
   '3': Result:='menej ako poloviènı';
  else  Result:='';
  end;
end;

function  TEXT_FZ_TYPZAM(typ: char):string;
begin
  case typ of
   'O': Result:='ostatní';
   'Z': Result:='obèan so ZPS';
   'D': Result:='dôchodca';
  else  Result:='';
  end;
end;

function  TEXT_TYP_PREMII(typ: integer):string;
begin
  case typ of
   0: Result:='individuálna vıška';
   1: Result:='percentuálna sadzba';
   2: Result:='hodinová sadzba';
  else  Result:='';
  end;
end;

function  TEXT_TYP_PRIPLATKOV(typ: integer):string;
begin
  case typ of
   0: Result:='percentuálna';
   1: Result:='hodinová';
  else  Result:='';
  end;
end;

function  TEXT_TYP_NEPRITOMNOSTI(typ: integer):string;
begin
  case typ of
   0: Result:='neuvedenı';
   1: Result:='PN';
   2: Result:='OÈR';
   3: Result:='náhr.vo¾no';
   4: Result:='absencia';
   5: Result:='nútené vo¾no';
  else  Result:='';
  end;
end;

function  StrToLongint(const S:string):longint;
var E:integer;
begin
  Val(S,Result,E);
  if E <> 0 then raise EMyError.Create(Format(SMyAppInvalidLonginteger, [S]));
end;

function  StrToDouble(const S:string):double;
var E:integer;
begin
  Val(S,Result,E);
  if E <> 0 then raise EMyError.Create(Format(SMyAppInvalidLonginteger, [S]));
end;

function  LPAD(Const S:string;N:byte;C:char):string;
var i:byte;
begin
  if LENGTH(S)>=N then Result:=Copy(S,1,N)
  else begin
    Result:='';
    for i:=1 to N-LENGTH(S) do Result:=Result+C;
    Result:=Result+S;
  end;
end;

function  RPAD(Const S:string;N:byte;C:char):string;
var i:byte;LEN:integer;
begin
  LEN:=LENGTH(S);
  if LEN>=N then Result:=Copy(S,LEN-N+1,N)
  else begin
    Result:='';
    for i:=1 to N-LEN do Result:=Result+C;
    Result:=S+Result;
  end;
end;


function Kontrola_predcisla(Const s:string):boolean;
var Predc,Pom:string;
    i,x:integer;
begin
  if s='' then begin Result:=true; exit; end;
  StrToLongint(s);
  Predc:=LPAD(s,6,'0');
  Pom := ':58421';
  x := 0;
  For i := 1 to 6 do x := x + ((ord(Predc[i])-48) * (ord(Pom[i])-48));
  Result := ((x mod 11) = 0);
  {if not Result then raise EMyError.Create(SMyAppZlePredcislo);}
end;

function Kontrola_ABO(Const s:string):boolean;
var  Abocis,Pom:string;
     i,x  : longint;
begin
  if s='' then begin Result:=true; exit; end;
  Abocis:=LPAD(TRIM(s),10,'0');
  StrToLongint(Copy(Abocis,1,5));
  StrToLongint(Copy(Abocis,6,5));
  Pom := '6379:58421';
  x := 0;
  For i := 1 to 10 do x := x + ((ord(Abocis[i])-48) * (ord(Pom[i])-48));
  Result := ((x mod 11) = 0) and (x <> 0);
  {if not Result then raise EMyError.Create(SMyAppZleAbo);}
end;

function  Je_Cislo(Const s:string):boolean;
var i:integer;
begin
  Result:=false;
  if s='' then exit;
  for i:=1 to length(s) do
    if (s[i]<'0') or (s[i]>'9') then exit;
  Result:=true;
end;

function IsNumeric( Value: string ): boolean;
var
  Number: Extended;
  Error: Integer;
begin
  Val(Value, Number, Error);
  result := (Error = 0);
end;

function  RegGetStr( sKey, sItem, sDefVal : string ) : string;
var reg:TRegIniFile;
begin
  reg := TRegIniFile.Create('');
  reg.RootKey := HKEY_LOCAL_MACHINE;
  Result := reg.ReadString( sKey, sItem, sDefVal );
  reg.Free;
end;

procedure RegSetStr( sKey, sItem, sVal : string );
var reg:TRegIniFile;
begin
  reg := TRegIniFile.Create('');
  reg.RootKey := HKEY_LOCAL_MACHINE;
  reg.WriteString( sKey, sItem, sVal + #0 );
  reg.Free;
end;

function  GetVolumeInfo(Root:String; var vi:TVolumeInfo): Boolean;
type TCharBuffer = array[0..255] of Char;
var flags, sn, mc: DWord; bufVolumeName, bufFSName: TCharBuffer;
begin with vi do begin
  VolumeName := '';
  VolumeSN := 0;
  MaxComponent := 0;
  FSName := '';
  FSFlags := [];

  result := GetVolumeInformation(@Root[1],
        @bufVolumeName, sizeof(bufVolumeName),
        @sn, mc, flags,
        @bufFSName, sizeof(bufFSName));

  if result then begin
    VolumeName := StrPas(bufVolumeName);
    VolumeSN := sn;
    MaxComponent := mc;
    FSName := StrPas(bufFSName);
  end;
end;end;

function  GetVolumeSerialNumber: string;
var vi:TVolumeInfo;
begin
  GetVolumeInfo(Copy(ExpandFileName(GetCurrentDir),1,3),vi);
  Result:=Format('%8x',[vi.VolumeSN]);
end;

function  GenerateKey:string;
var i:byte;
begin
 Result:='';
 for i:=1 to 10 do Result:=Result + chr( Random(10) + ord('0') );
 Result:=Copy(Result,1,5) + '-' + Copy(Result,6,5);
end;

function  NVL(const S:string):string;
begin
 if Trim(S)='' then Result:='0' else Result:=s;
end;

function  NVL1(const S1,S2:string):string;
begin
 if Trim(S1)='' then Result:=S2 else Result:=S1;
end;

function  NVL2(const S1,S2,S3:string):string;
begin
 if Trim(S1)='' then Result:=S3 else Result:=S2;
end;

function  NVLC(const c:variant):currency;
begin
 if c=null then Result:=0 else Result:=currency(c);
end;

procedure Nastav_Farbu(F:TForm);
var i:integer;c1,c2,c3:longint;
begin with F do begin
try
  c1:=MyIniFile.ReadInteger('COLOR','Pole1',-1);
  c2:=MyIniFile.ReadInteger('COLOR','Pole2',-1);
  c3:=MyIniFile.ReadInteger('COLOR','Pozadie',-1);

  for i:=0 to ComponentCount-1 do
  begin
    if Components[i] is TForm
      then (Components[i] as TForm).ScaleBy(120,100);
    if c1<>-1 then
    begin
      if Components[i] is TEdit then
       if (Components[i] as TEdit).Color=clOlive
         then (Components[i] as TEdit).Color:=c1;

      if Components[i] is TDBEdit then
       if (Components[i] as TDBEdit).Color=clOlive
         then (Components[i] as TDBEdit).Color:=c1;

      if Components[i] is TDBLookupComboBox then
       if (Components[i] as TDBLookupComboBox).Color=clOlive
         then (Components[i] as TDBLookupComboBox).Color:=c1;
    end;
    if c2<>-1 then
    begin
      if Components[i] is TEdit then
       if (Components[i] as TEdit).Color=clGreen
         then (Components[i] as TEdit).Color:=c2;

      if Components[i] is TDBEdit then
       if (Components[i] as TDBEdit).Color=clGreen
         then (Components[i] as TDBEdit).Color:=c2;

      if Components[i] is TDBLookupComboBox then
       if (Components[i] as TDBLookupComboBox).Color=clGreen
         then (Components[i] as TDBLookupComboBox).Color:=c2;
    end;
    if c3<>-1 then
    begin
      if Components[i] is TNotebook then
       if (Components[i] as TNotebook).Color=clGray
        then (Components[i] as TNotebook).Color:=c3;

      if Components[i] is TDBGrid then
       if (Components[i] as TDBGrid).Color=clGray
        then (Components[i] as TDBGrid).Color:=c3;

      if Components[i] is TScrollBox then
       if (Components[i] as TScrollBox).Color=clGray
        then (Components[i] as TScrollBox).Color:=c3;
    end;
  end;
  except end;
end;end;

function  TYP_PRIPL_TO_STRING(typ: byte): string;
var i:byte;
begin
  Result:='';
  if typ=0 then begin Result:='00000000'; exit; end;
  if typ=1 then begin Result:='01111110'; exit; end;
  for i:=1 to 8 do begin
    Result:=IntToStr(typ mod 2)+Result;
    typ:=typ div 2;
  end;
end;

function  TYP_PRIPL_TO_BYTE(typ: string): byte;
var i:byte;
begin
  Result:=0;
  for i:=1 to 8 do begin
    Result:=Result+StrToInt(Copy(typ,i,1));
    if i<8 then Result:=Result*2;
  end;
end;

function  TYP_PRIPL2_TO_STRING(typ: byte): string;
var i:byte;
begin
  Result:='';
  for i:=1 to 8 do begin
    Result:=IntToStr(typ mod 2)+Result;
    typ:=typ div 2;
  end;
end;

function  TYP_PRIPL2_TO_BYTE(typ: string): byte;
var i:byte;
begin
  Result:=0;
  for i:=1 to 8 do begin
    Result:=Result+StrToInt(Copy(typ,i,1));
    if i<8 then Result:=Result*2;
  end;
end;

function  TEXT_INSTITUCIE(typ:string;kod:integer):string;
begin
  Result:='';
  if length(typ)>0 then
  case typ[1] of
   'D':Result:='Daòovı úrad - zráky+preddavky';
   'E':Result:='Daòovı úrad - preddavky';
   'F':Result:='Daòovı úrad - zráky';
   'P':Result:='Zákonné poistenie za škodu';
   'S':Result:='Sociálna poisovòa';
   'U':Result:='Úrad práce';
   'X':Result:='Sociálny fond';
   'Z':Result:='Zdrav.pois.è.'+IntToStr(kod);
   'Y':Result:='DDP è.'+IntToStr(kod);
   else Result:='';
  end;
end;

function  TEXT_ZRAZKY(typ:string):string;
begin
  Result:='';
  if length(typ)>0 then
  case typ[1] of
   'P':Result:='poisovòa';
   'O':Result:='odbory';
   'S':Result:='staveb.sporenie';
   'Y':Result:='pôièky';
   'X':Result:='iné';
   else Result:='';
  end;
end;

procedure Progress(x:integer);
begin
  if FormProgress=nil then begin
    FormProgress:=TFormProgress.Create(nil);
    FormProgress.Show;
  end;
  FormProgress.UpdateProgress(x);
  if x=100 then begin
    FormProgress.Free;
    FormProgress:=nil;
  end;
end;

function LongCisloU(const predc,cislo:string):string;
begin
  if trim(predc)=''
   then Result:=cislo
    else Result:=predc+'-'+cislo;
end;

function Spoj(X1,X2,X3:string):string;
begin
 Result:=TrimLeft(X1+' ')+TrimLeft(X2+' ')+TrimLeft(X3);
end;

function TITULOK_REPORTU(const firma:string;sid:integer):string;
begin
  if sid=0 then Result:=firma
           else Result:=firma+', stredisko: '+IntToStr(Sid);
end;

procedure NacitajParametre(iRok,iMesiac:integer);
var T_:TTable;i,j,XX:integer;MM_OD,MM_DO:integer;
begin
  for i:=1 to 99 do PARAMETRE[i].id:=0;
  for i:=1 to 99 do for j:=1 to 12 do PARAMETRE_M[i,j].id:=0;
  T_:=TTable.Create(Application);
  try
  T_.DatabaseName:='PAM98_COMM';
  T_.TableName:=MyCisPar(iRok);
  T_.Open;
  T_.First;
  while not T_.EOF do begin
    MM_OD:=1;
    MM_DO:=12;
    if (iRok>=2008) then begin
      MM_OD:=T_.FieldByName('Mesiac_od').AsInteger;
      MM_DO:=T_.FieldByName('Mesiac_do').AsInteger;
    end;
    XX:=T_.FieldByName('Id').AsInteger;
    for j:=MM_OD to MM_DO do begin
      PARAMETRE_M[XX,j].id     := XX;
      PARAMETRE_M[XX,j].skratka:= T_.FieldByName('Skratka').Value;
      PARAMETRE_M[XX,j].hodnota:= T_.FieldByName('Hodnota').Value;
      PARAMETRE_M[XX,j].popis  := T_.FieldByName('Popis').Value;
    end;
    if (iMesiac>=MM_OD) and (iMesiac<=MM_DO) then
    begin
      PARAMETRE[XX].id     := XX;
      PARAMETRE[XX].skratka:= T_.FieldByName('Skratka').Value;
      PARAMETRE[XX].hodnota:= T_.FieldByName('Hodnota').Value;
      PARAMETRE[XX].popis  := T_.FieldByName('Popis').Value;
    end;
    T_.Next;
  end;
  T_.Close;
  finally
  T_.Free;
  end;
  try
  for i:=1 to 99 do if PARAMETRE[i].id<>0 then
  begin
    MyParFile.WriteString(
     'PARAMETER '+IntToStr(PARAMETRE[i].id),'POPIS',PARAMETRE[i].popis);
    MyParFile.WriteString(
     'PARAMETER '+IntToStr(PARAMETRE[i].id),'SKRATKA',PARAMETRE[i].skratka);
    MyParFile.WriteString(
     'PARAMETER '+IntToStr(PARAMETRE[i].id),'HODNOTA',FloatToStr(PARAMETRE[i].hodnota));
  end;
  finally
  end;
end;

function VratHodnotu(const Skratka:string):double;
var i:integer;
begin
  for i:=1 to 99 do
   if UpperCase(PARAMETRE[i].skratka)=UpperCase(Skratka)
    then begin Result:=PARAMETRE[i].hodnota; exit; end;
  raise EMyError.Create(Format(SMyAppParameterNotFound,[Skratka]));
end;

function VratHodnotuInt(const Skratka:string):integer;
begin
  Result:=Round(VratHodnotu(Skratka));
end;

function MyMesiac(obdobie:longint):integer;
begin
  MyMesiac := obdobie mod 100;
end;

function MyRok(obdobie:longint):integer;
begin
  MyRok := obdobie div 100;
end;

function DateToObdobie(datum:TDateTime):longint;
var YY,MM,DD:word;LL:longint;
begin
  DecodeDate(datum,YY,MM,DD);
  LL:=YY;
  LL:=LL*100 + MM;
  Result:=LL;
end;

function DateToRRRRMMDD(datum:TDateTime):longint;
var YY,MM,DD:word;LL:longint;
begin
  DecodeDate(datum,YY,MM,DD);
  LL:=YY;
  LL:=(LL*100 + MM)*100 + DD ;
  Result:=LL;
end;

function ObdobieToMMRRRR(obdobie:longint):string;
begin
  Result:=LPAD(IntToStr(MyMesiac(obdobie)),2,'0')+IntToStr(MyRok(obdobie));
end;

function NajdiPosledny(const FName,FExt:string;Pocet:integer):integer;
var i,m:integer;s:string[5];
begin
  MyPoslednySubor := '';
  m:=9;
  for i:=1 to pocet-1 do m:=m*10+9;
  for i:=1 to m do
  begin
    s:=Format('%.'+IntToStr(Pocet)+'d',[i]);
    if not FileExists(FName+s+'.'+FExt) then begin
      Result:=i;
      exit;
    end else MyPoslednySubor := FName+s+'.'+FExt;
  end;
  Result:=0;
end;

function CLC(Const S:string):string; {Cut Last Char}
begin
  if Length(S)>=1
    then Result:= LPAD(S,Length(S)-1,'0')
      else Result:=s;
end;

function MyAdresa(Const iUlica,iCislo,iPsc,iMesto:string):string;
var s:string;
begin
  s:=TRIM(iCislo);
  if s<>'' then s:=' '+s;
  Result:=
    iUlica+s+', '+iPsc+' '+iMesto;
end;

function MyUlica(Const iUlica,iCislo:string):string;
var s:string;
begin
  s:=TRIM(iCislo);
  if s<>'' then s:=' '+s;
  Result := iUlica+s;
end;

procedure MyRozdelUlicu(Const iUlica:string;var oUlica,oCislo:string);
var A1,A2,A3:string;
begin
  MyRozdelUlicuExt(iUlica,A1,A2,A3);
  oUlica:=A1;
  if A2='' then oCislo:=A3
  else if A3='' then oCislo:=A2
  else oCislo:=A3+'/'+A2;
end;

procedure MyRozdelUlicuExt(Const iUlica:string;var oUlica,orCislo,supCislo:string);
var pom1:string;
    c1,c3:longint;
    i,wc:integer;
    ww:array[1..3] of record
      zaciatok:integer;
      koniec:integer;
      hod:string;
    end;
    bol_oddelovac,je_oddelovac:boolean;
    suffix: string;
begin
  pom1:=TRIM(iUlica);
  if pom1='' then begin
    oUlica:=''; orCislo:=''; supCislo:=''; exit;
  end;
  suffix:='';
  //rozdelenie adresy - ulica na ulicu a cislo
  wc:=0;
  bol_oddelovac:=true;
  for i:=length(pom1) downto 1 do begin
    je_oddelovac:=((pom1[i]=' ') and (pom1[i+1]>='0') and (pom1[i+1]<='9'))
               or ((pom1[i]='/') and (pom1[i+1]>='0') and (pom1[i+1]<='9'));
    if bol_oddelovac then begin
       if not je_oddelovac then begin
         inc(wc);
         if wc>3 then break;
         ww[wc].koniec:=i;
         ww[wc].zaciatok:=i;
         ww[wc].hod:=pom1[i];
       end;
    end else begin
      if not je_oddelovac then begin
        ww[wc].zaciatok:=i;
        ww[wc].hod:=pom1[i]+ww[wc].hod;
      end
      else if pom1[i]='/' then begin
         inc(wc);
         if wc>3 then break;
         ww[wc].koniec:=i;
         ww[wc].zaciatok:=i;
         ww[wc].hod:=pom1[i];
      end;
    end;
    bol_oddelovac:=je_oddelovac;
  end;
  try c1:=StrToInt(ww[1].hod); except oUlica:=TRIM(pom1)+suffix; supCislo:=''; orCislo:=''; exit; end;
  if Trim(ww[2].hod)<>'/' then begin oUlica:=TRIM(Copy(pom1,1,ww[1].zaciatok-1))+suffix; orCislo:=IntToStr(c1); supCislo:=''; exit; end;
  try c3:=StrToInt(ww[3].hod); except oUlica:=TRIM(Copy(pom1,1,ww[1].zaciatok-1))+suffix; orCislo:=IntToStr(c1); supCislo:=''; exit; end;
  oUlica:=TRIM(Copy(pom1,1,ww[3].zaciatok-1)); orCislo:=IntToStr(c1); supCislo:=IntToStr(c3);
end;

procedure MyRozdelTel(Const iTel:string;var oPredvolba,oCislo:string);
var A1,A2,A3: string;
begin
  MyRozdelUlicuExt(iTel,A1,A2,A3);
  if Copy(A3,1,1)='0' then oPredvolba:=Copy(A3,2,LENGTH(A3)-1)
                      else oPredvolba:=A3;
  oCislo := A2;
end;

procedure MyRozdelCisloU(Const iCisloU:string;var oPredcU,oCisloU:string);
var pom,predcu,cislou,c1,c2:string;p:integer;
begin
    dobre_cu:=false;
    pom:=iCisloU;
    p:=Pos('-',pom);
    if p>0 then
    begin
      predcu:=Trim(Copy(pom,1,p-1));
      cislou:=Trim(Copy(pom,p+1,length(pom)-p));
      p:=Pos('-',cislou);
      if p>0 then
      begin
        c1:=Trim(Copy(cislou,1,p-1));
        c2:=Trim(Copy(cislou,p+1,length(pom)-p));
        if Kontrola_predcisla(predcu) AND Kontrola_ABO(c1+c2) then
        begin
          cislou:=c1+c2; dobre_cu:=true;
        end;
      end
      else
      begin
        if (length(predcu)<=6) AND
           Kontrola_Predcisla(predcu) AND
           (length(cislou)<=10) AND
           Kontrola_ABO(cislou) then
        begin
          dobre_cu:=true;
        end
        else begin
          if Kontrola_ABO(predcu+cislou) then
          begin
            cislou:=predcu+cislou;
            predcu:='000000';
            dobre_cu:=true;
          end;
        end;
      end
    end
    else begin
      predcu:='000000';
      cislou:=Trim(pom);
      if Kontrola_ABO(cislou) then
      begin
         dobre_cu:=true;
      end;
    end;
    oPredcU:='000000';
    oCisloU:='0000000000';
    if dobre_cu then  begin
      oPredcU:=predcu;
      oCisloU:=cislou;
    end;
end;

function StrReplaceX(Const iSource,iOld,iNew:string):string;
var p:integer;s,v:string;
begin
  s:=iSource;
  p:=Pos(iOld,s);
  if p>0 then begin
    v:=Copy(s,1,p-1);
    v:=v+iNew+Copy(s,p+length(iOld),length(s));
  end else v:=s;
  Result:=v;
end;

function StrReplaceAll(Const iSource,iOld,iNew:string):string;
var p:integer;s,v:string;
begin
  v:='';
  s:=iSource;
  p:=Pos(iOld,s);
  if p>0 then begin
    while p>0 do begin
      v:=v+Copy(s,1,p-1)+iNew;
      s:=Copy(s,p+length(iOld),length(s));
      p:=Pos(iOld,s);
    end;
    v:=v+s;
  end else v:=s;
  Result:=v;
end;

function KAL_DNI(Const iObdobie:longint):integer;
var RR,MM,KD:integer;
begin
{ 1. Rok je priestupnı, ak je delite¾nı èíslom 4 (kadı štvrtı rok), ale
  2. Rok nie je priestupnı, ak je delite¾nı èíslom 100 (všetky roky koncov storoèí), ale
  3. Rok je priestupnı, aj je delite¾nı èíslom 400 (kadı štvrtı rok konca storoèia).
}
  RR:=MyRok(iObdobie);
  MM:=MyMesiac(iObdobie);
  case MM of
   1,3,5,7,8,10,12: KD:=31;
   4,6,9,11: KD:=30;
   2:if ((RR mod 400)=0) or
        ((RR mod 4=0) and (RR mod 100<>0))
     then KD:=29 else KD:=28;
   else KD:=0
  end;
  Result:=KD;
end;

function cleanCsv(const iSource:string):string;
var s:string;
begin
  s:=iSource;
  if Copy(s,1,1)='"' then s:=Copy(s,2,length(s)-1);
  if Copy(s,length(s),1)='"' then s:=Copy(s,1,length(s)-1);
  Result:=s;
end;

procedure parseCsv(Const iSource:string);
var i,p1:integer;s1:string;
begin
  for i:=1 to 50 do MyParser[i]:='';
  s1:=iSource;
  i:=0;
  repeat
    p1:=Pos(';',s1);
    if p1=0 then begin inc(i);MyParser[i]:=cleanCsv(s1); end
    else begin
      inc(i); MyParser[i]:=cleanCsv(Copy(s1,1,p1-1)); s1:=Copy(s1,p1+1,Length(s1));
    end;
  until (p1=0) or (i=50);
end;

function MyAdrRok(rok:integer):string;
begin
  Result := 'ROK'+IntToStr(rok);
end;

function PMT(const p,m,t:string):string;
begin
  Result :=
    Trim(
    Copy(
    Trim(p)+' '+
    Trim(m)+' '+
    Trim(t),
    1,100));
end;

function RC_BEZ(iRC:string):string;
var s:string;
begin
  s:=iRC;
  while Pos('/',s)<>0 do Delete(s,Pos('/',s),1);
  while Pos(' ',s)<>0 do Delete(s,Pos(' ',s),1);
  Result:=s;
end;

{------------------------ podpora XML --------------------------------------}

procedure CRLF;
begin MyXml := MyXml + #13#10; end;

procedure E_TEXT(const iELM:string);
begin MyXml := MyXml + iElm; CRLF; end;

procedure E_TEXT_LPAD(const iELM:string;iSize:integer;iChar:char;iCRLF:boolean);
var s:string;
begin
  s:=iELM; if iSize>0 then s:=LPAD(iELM,iSize,iChar);
  MyXml := MyXml + s;
  if iCRLF then CRLF;
end;

procedure E_TEXT_RPAD(const iELM:string;iSize:integer;iChar:char;iCRLF:boolean);
var s:string;
begin
  s:=iELM; if iSize>0 then s:=RPAD(iELM,iSize,iChar);
  MyXml := MyXml + s;
  if iCRLF then CRLF;
end;

procedure E_TAGZ(const iTAG:string);
begin MyXml := MyXml + '<' + iTAG + '>'; CRLF; end;

procedure E_TAGK(const iTAG:string);
begin MyXml := MyXml + '</' + iTAG + '>'; CRLF; end;

procedure E_TAG(const iTAG,iELM:string);
begin
 MyXml := MyXml + '<' + iTAG + '>' + UTF16BEToUTF8Str(cp1250ToUTF16Str(StrReplaceAll(iElm,'&','&amp;')))
                + '</' + iTAG + '>';
 CRLF;
end;

procedure E_TAG_DATA(const iTAG,iELM:string);
begin
 MyXml := MyXml + '<' + iTAG + '><![CDATA[' + UTF16BEToUTF8Str(cp1250ToUTF16Str(iElm))
                + ']]></' + iTAG + '>';
 CRLF;
end;

procedure EX_TAG(const iTAG,iELM:string);
begin
 if Trim(iELM)<>'' then E_TAG(iTAG,iELM);
end;

procedure E_TAGA(const iTAG,iATTR:string);
begin
 MyXml := MyXml + '<' + iTAG + ' ' + UTF16BEToUTF8Str(cp1250ToUTF16Str(iATTR)) + '/>';
 CRLF;
end;

procedure E_TAGZA(const iTAG,iATTR:string);
begin
 MyXml := MyXml + '<' + iTAG + ' ' + UTF16BEToUTF8Str(cp1250ToUTF16Str(iATTR)) + '>';
 CRLF;
end;

procedure E_ATTR(const iATTR,iHOD:string);
begin
 if MyAttr<>'' then MyAttr := MyAttr + ' ';
 MyAttr := MyAttr + iATTR + '=' + '"' + iHOD + '"';
end;

procedure E_ATTRZ(const iATTR,iHOD:string);
begin MyAttr:=''; E_ATTR(iATTR,iHOD); end;

procedure E_XFDF(iField,iHOD:string);
begin
  MyAttr:='';
  E_ATTRZ('name',iField);
  E_TAGZA('field',MyAttr);
  E_TAG('value',StrReplaceAll(iHOD,'&','&amp;'));
  E_TAGK('field');
end;

function DecodeButton(iButton: TNavigateBtn):integer;
begin
  case iButton of
  nbInsert: Result:=1;
  nbEdit:   Result:=2;
  nbDelete: Result:=3;
  nbPost:   Result:=4;
  nbCancel: Result:=5
  else Result:=0;
  end;
end;

procedure Rtf_SetKeyWord(iKey,iVal:string;iLen:integer;iPad:char);
begin
  if iLen>0 then iVal:=RPAD(iVal,iLen,iPad);
  slKeyWords.Add(iKey);
  slKeyValues.Add(iVal);
end;

procedure Rtf_InitKeyWord;
begin
  slKeyWords.Clear;
  slKeyValues.Clear;
end;

procedure Rtf_Replace(X:TMyReportParam);
var i,j: Integer;
    InFile,OutFile: string;
procedure OpenFile(FileName: String; slFile: TStringList);
begin
  slFile.Clear;
  slFile.LoadFromFile(FileName);
end;
procedure SaveFile(FileName: String; slFile: TStringList);
begin
  slFile.SaveToFile(FileName);
  slFile.Clear;
end;
begin
  inFile := X.rtf_sablona;
  outFile := X.rtf_subor;
  if not FileExists(InFile) then exit;
  OpenFile(InFile, slFile);
  for i := 0 to slFile.Count - 1 do
  for j := 0 to slKeyWords.COunt - 1 do
  begin
    slFile.Strings[i] := StrReplaceX(slFile.Strings[i], slKeyWords.Strings[j], slKeyValues.Strings[j]);
  end;
  SaveFile(OutFile, slFile);
end;

procedure Rtf_Uloz_XML(X:TMyReportParam);
var OutFile: string;
procedure OpenFile(FileName: String; slFile: TStringList);
begin
  slFile.Clear;
  slFile.LoadFromFile(FileName);
end;
procedure SaveFile(FileName: String; slFile: TStringList);
begin
  slFile.SaveToFile(FileName);
  slFile.Clear;
end;
begin
  outFile := X.rtf_subor;
  slFile.Clear;
  slFile.Add(MyXML);
  SaveFile(OutFile, slFile);
end;

procedure Rtf_Open(var X:TMyReportParam);
begin
  if not FileExists(X.RTF_sablona) then
    raise EMyError.Create(Format(SMyAppFileNotFound, [X.RTF_sablona]));
  X.rtf_existuje := FileExists(X.RTF_subor);
{
  if (X.rtf_existuje) and (X.rtf_prepisat) then
  if not MyOtazka(Format(SMyAppExistujePrepisat,[X.RTF_subor])) then
  begin
    X.rtf_prepisat := FALSE;
  end else
  if not X.rtf_existuje then X.rtf_prepisat := TRUE;
}
  X.rtf_prepisat:=TRUE;
end;

procedure Rtf_Zobraz(X:TMyReportParam);
begin
  if not FileExists(X.RTF_subor) then
    raise EMyError.Create(Format(SMyAppFileNotFound, [X.RTF_subor]));
  if not MyOtazka(Format(SMyAppRunRTF,[X.RTF_subor])) then exit;
{  StartAssociatedExe(X.RTF_subor,err);}
{  ExecNewProcess(X.RTF_subor,true);}
{  WinExecAndWait32('start '+X.RTF_subor,0);}
  ExecuteFileX(X.RTF_subor,'',ExtractFilePath(X.RTF_subor),1);
end;

function MyFormatField(const Fmt: string; X:TField): string;
begin
  if X.AsString='' then Result:='' else
  begin
    if X is TCurrencyField then Result:=Format(Fmt,[(X as TCurrencyField).Value])
    else
    if X is TSmallintField then Result:=Format(Fmt,[(X as TSmallintField).Value])
    else
    Result:='';
  end
end;

function LastDayDate(YY,MM,DD: word): TDateTime;
var X:TDateTime;i:integer;
begin
  if (DD<1) or (DD>31) then DD:=31;
  if DD<=28 then X:=EncodeDate(YY,MM,DD)
  else
  for i:=DD downto 28 do
  try
  X:=EncodeDate(YY,MM,i);
  break;
  except
  end;
  Result:=X;
end;

procedure RC_VALIDATE(iRC:string);
begin
  if iRC='' then exit;
  StrToDouble(iRC);
  if (length(iRC)<9) or (length(iRC)>10) then
  raise EMyError.Create(SMyAppBadRcLength);
end;

function Obdobie_Add_MM(iObdobie,iMM:longint):longint;
var RR,MM:longint;
begin
  RR:=MyRok(iObdobie);
  MM:=MyMesiac(iObdobie);
  MM:=MM+iMM;
  while MM<1 do begin
    MM:=MM+12; RR:=RR-1;
  end;
  while MM>12 do begin
    MM:=MM-12; RR:=RR+1;
  end;
  Result := (RR*100) + MM;
end;

procedure VyberSuboru(iDir:string;iFilter:string);
begin
try
  Dialog1:=TOpenDialog.Create(Application);
  with Dialog1 do
  begin
    InitialDir:=iDir;
    DefaultExt:='';
    Filter:=iFilter;
    FilterIndex:=1;
    Options:=[ofFileMustExist,ofNoDereferenceLinks,ofPathMustExist,ofHideReadOnly];
    Title:='Vıber súboru';
    repeat
      if not Dialog1.Execute then exit;
      ExecuteFileX(Dialog1.FileName,'',InitialDir,SW_MAXIMIZE);
    until false;
  end;
finally
  Dialog1.Free;
  SetCurrentDir(MyAppPath);
  Application.BringToFront;
end;
end;

function VyberSuboru1(iDir:string;iFilter:string):string;
begin
try
  Dialog1:=TOpenDialog.Create(Application);
  with Dialog1 do
  begin
    InitialDir:=iDir;
    DefaultExt:='csv';
    Filter:=iFilter;
    FilterIndex:=1;
    Options:=[ofFileMustExist,ofNoDereferenceLinks,ofPathMustExist{,ofHideReadOnly}];
    Title:='Vıber súboru';
    repeat
      if not Dialog1.Execute then exit; 
      VyberSuboru1 := Dialog1.FileName;
      break;
    until false;
  end;
finally
  Dialog1.Free;
  SetCurrentDir(MyAppPath);
end;
end;

function VratMesiace(var X:TMesiace): string;
var i,m1,m2:byte;vysl:string;
function Add_Vysl(const s:string):string;
begin
  if vysl='' then vysl:=vysl+s
  else vysl:=vysl+','+s;
end;
procedure spracuj;
begin
  if (m1=0) or (m2=0) then exit;
  if m2=m1 then Add_Vysl(IntToStr(m1)) else
  if m2=m1+1 then Add_Vysl(IntToStr(m1)+','+IntToStr(m2)) else
  if m2>m1 then Add_Vysl(IntToStr(m1)+'-'+IntToStr(m2));
end;
begin
  vysl:='';m1:=0;m2:=0;
  for i:=1 to 12 do begin
    if (X[i]=1) and (m1=0) then m1:=i else
    if (X[i]=0) and (m1<>0) then begin
      m2:=i-1;
      Spracuj;
      m1:=0;
    end;
  end;
  if m1<>0 then begin m2:=12;Spracuj;end;
  VratMesiace:=vysl;
end;
function MyDateDaysBetween(Dat1,Dat2:TDateTime):longint;
var Y1,M1,D1: Word;
    Y2,M2,D2: Word;
    rokov,dni: Longint;
    POSLEDNY_ROK,mm: integer;
    rr: Longint;
begin
  DecodeDate(Dat1,Y1,M1,D1);
  DecodeDate(Dat2,Y2,M2,D2);
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
  for rr:=Y1 to rokov do if IsLeapyear(rr) then dni:=dni+366 else dni:=dni+365;
  Result:=dni;
end;

function KonverziaSKK_EUR(iSumaSKK: double): double;
var pom: double;
begin
  pom := ZAOKRUHLI(iSumaSKK * 100 / KonvKurzEuro,0,5);
  pom := pom/100;
  KonverziaSKK_EUR := pom;
end;

function KonverziaEUR_SKK(iSumaEUR: double): double;
var pom: double;
begin
  pom := ZAOKRUHLI(iSumaEUR * KonvKurzEuro,0,2);
  KonverziaEUR_SKK := pom;
end;

function KonverziaSKK_EUR_nahor(iSumaSKK: double): double;
var pom: double;
begin
  pom := ZAOKRUHLI(iSumaSKK * 100 / KonvKurzEuro,0,0);
  pom := pom/100;
  KonverziaSKK_EUR_nahor := pom;
end;

function KonverziaSKK_EUR_nadol(iSumaSKK: double): double;
var pom: double;
begin
  pom := ZAOKRUHLI(iSumaSKK * 100 / KonvKurzEuro,0,1);
  pom := pom/100;
  KonverziaSKK_EUR_nadol := pom;
end;

function SendMail_VyplatnaPaska(iEmailFrom:string; iEmailTo: string; iEmailCC:string; iSubject:string; iBodyFile:string; iAttachFile:string):string;
begin
  SendMail_VyplatnaPaska := Format(
  MyAppPath + 'blat "%s" -try 3 -delay 1 -8bitmime -mailfrom "%s" -attach "%s" -sf "%s" -base64 -to %s %s -server %s -u %s -pw %s',
  [
   iBodyFile,
   iEmailFrom,
   iAttachFile,
   iSubject,
   iEmailTo,
   NVL2(iEmailCC,'-cc '+iEmailCC,''),
   MySmtpServer,MySmtpUser,MySmtpPassword]);
end;

function GetVersionFromRegKey(s:string): string;
var i,p,pp: integer;
begin
 i :=0;
 pp:=0;
 p:=1;
 while (p > 0) and (i < 4) do begin
   p := Pos('-',s);
   if p > 0 then begin
     pp := pp + p;
     s := Copy(s,p+1,length(s));
   end;
   inc(i);
 end;
 if (p > 0) then begin
   Result := s;
 end else Result := 'DEMO';
end;

procedure TransTable128(ptext: PChar; Length: integer; Trans128: PChar);
var i: integer;
begin
  for i := 1 to Length do begin
    if Ord(ptext^) > 127 then
      ptext^ := Trans128[Ord(ptext^)-128]; // 0-based index in PChar...
    inc(ptext);
  end;
end;

function FromWinToAscii(const S: string): string;
const
  Trans: string[128]=
    '@@,f".@@^%S<STZZ ''''"".__"@s>stzz'+
    ' ^"L A|@"@S"  @Z"+,l''m .,as"L"lz'+
    'RAAAALCCCEEEEIIDDNNOOOOxRUUUUYT@'+
    'raaaalccceeeeiiddnnoooo/ruuuuyt ';
var pc: PChar;
begin
  Result:=S;
  UniqueString(Result);
  pc:=Pointer(Result);
  TransTable128(pc,Length(Result),@Trans[1]);
end;

Procedure ModifyBDE( Path, Chave, Valor: String );
var ParamList: TParamList;
Lista: TStringList;
cfgMode: TConfigMode;
KI: Integer;
begin
Lista := TStringList.Create;
//Recupera Lista de Configuraço~es
Session.GetConfigParams( Path, '', Lista );
//Verifica na lista, onde a chave modificada se encontra
For KI := 0 to ( Lista.Count - 1 ) do begin
if Pos( UpperCase( Chave ), UpperCase( Lista[KI] ) ) <> 0 then begin
Lista[KI] := UpperCase( Chave ) + '=' + Valor;
//Salva o atual modo de configuraça~o da variável de sessa~o
cfgMode := Session.ConfigMode;
//Coloca em modo de alteraça~o
Session.ConfigMode := cmPersistent;
//Cria lista de parâmetros
ParamList := TParamList.Create( Lista );
//Chama API do BDE para modificar as configuraço~es
Check( DbiCfgModifyRecord( nil, PChar( Path ), ParamList.FieldCount,
PFLDDesc( ParamList.FieldDescs ), ParamList.Buffer ) );
//Recupera o modo de configuraça~o da variável de sessa~o
Session.ConfigMode := cfgMode;
//Salva as configuraço~es da sessa~o
Session.SaveConfigFile;
ParamList.Free;
end;
end;
Lista.Free;
end;

initialization
  Randomize;
  MyAppPath:=ExtractFilePath(ParamStr(0));

  if SysDebug = 1 then fSysDebug := TStringList.Create;
  slFile := TStringList.Create;
  slKeyWords := TStringList.Create;
  slKeyWords.Sorted:=False;
  slKeyValues:= TStringList.Create;
  slKeyValues.Sorted:=False;
  slTypZecPopis:= TStringList.Create;
  slTypZecPopis.Sorted:=False;
  for i:=1 to 255 do slTypZecPopis.insert(0,'');
  slTypZecCode:= TStringList.Create;
  slTypZecCode.Sorted:=False;
  for i:=1 to 255 do slTypZecCode.insert(0,'');
(*
  PravidelnePrijmyList := TList.Create;
  NepravidelnePrijmyList := TList.Create;
*)
  finalization
  if SysDebug = 1 then begin fSysDebug.SaveToFile(MyAppPath+'sysdebug.log');fSysDebug.Free;end;
  slFile.Free;
  slKeyWords.Free;
  slKeyValues.Free;
  slTypZecPopis.Free;
  slTypZecCode.Free;
end.
/***************************************************************************
Local SQL using BDE (Paradox/dBase):
can't rename a field with the "as" keyword as generates compile error
date functions:
EXTRACT(param FROM datetimeField) AS 'FieldAliasForSmallIntegerField'; where param = YEAR, MONTH, DAY, HOUR, MINUTE, SECOND
conversion functions:
CAST(fieldname AS datatype) AS 'FieldAliasForDatatypeField', where datatype = DATE, TIME, TIMESTAMP, SMALLINT, INTEGER,NUMERIC, FLOAT, CHARACTER(LGTH), VARCHAR(LGTH), BOOLEAN, BYTES but cannot be text/blob
string functions:
Concatenation:
eg. field1 || ", " || field2 creates a calculated field: "field1Value, field2Value"
LOWER; UPPER; case conversions
SUBSTRING(fieldname FROM start [FOR lgth]) (NB. sq. bracketed part indicates optional)
TRIM([LEADING|TRAILING}BOTH] trimmedCharacter FROM fieldname)
strings must be enclosed with double quotes

FROM clause:
Common SQL:
FROM table1 [table1alias], table2 [table2alias]
Sybase/SQL Server:
JOIN statements:
must use WHERE clause to join tables and asterix to signify type of join - LEFT or RIGHT OUTER joins (TRANSACT syntax):
FROM maintable WHERE maintable.field1 [*= | = | =* ] lookupTable.keyField
Local SQL via BDE (Paradox/dbase/heterogeneous joins):
JOIN statements (ANSI92 style):
join via a foreign or primary key relationship:
SELECT fieldnames
FROM table1 KEY JOIN table2
join via same named fields:
SELECT fieldnames
FROM table1 NATURAL JOIN table2
outer joins - include rows that don't match
FROM table1 [LEFT | RIGHT] OUTER JOIN table2 on table1.field1 = table2.Keyfield
inner joins - include rows that match
FROM table1 INNER JOIN table2 on table1.field1 = table2.Keyfield
multiple joins need careful bracketing to ensure SQL runs correctly (if having problems create one in Access then view SQL):
FROM (table 1 LEFT JOIN table2 (LEFT JOIN table3 on table2.field2 = table3.keyField) on table1.field1 = table2.keyField)
create new table from merger of same data-structured data from multiple tables (eg. mail merge of addresses):
SELECT fieldnames FROM table1
UNION
SELECT fieldnames FROM table2
UNION
SELECT fieldnames FROM table3
heterogeneous joins from different databases in Delphi:
SELECT tablename1.fieldname1, tablename2.fieldname2
FROM '':DatabaseAlias1:tablename1'', '':DatabaseAlias2:tablename2''

WHERE clause:
only need to use if need to filter data BEFORE it is Grouped
Common SQL:
Comparison predicates:
>,<,>=,<=,<>,=
field1 IS [NOT] NULL
Sybase/SQL Server:
see also under FROM clause for joins
LIKE patterns:
% = any string of zero or more characters
_ = any single character
ESCAPE "escapeCharacter" = signifies that where escapeCharacter occurs, the following character is taken literally & not as a wildcard
eg. WHERE (PercentValue LIKE "%10^%%" ESCAPE "^") finds strings containing 10%
Comparison predicates:
field1 [NOT] IN (comma separated values)
field1 [NOT] BETWEEN value1 AND value2
Subquery comparisons:
field1 comparison_predicate ANY | ALL (NestedSelectStatement)
eg. WHERE (H."pur_price" > ANY (SELECT O."price" FROM "old_sales.dbf"))
where [NOT] EXISTS (NestedSelectStatement)
MS Access:
LIKE patterns:
* = any string of zero or more characters
Local SQL via BDE (Paradox/dBase):
LIKE patterns:
% = any string of zero or more characters
_ = any single character
ESCAPE "escapeCharacter" = signifies that where escapeCharacter occurs, the following character is taken literally & not as a wildcard
eg. WHERE (PercentValue LIKE "%10^%%" ESCAPE "^") finds strings containing 10%
Comparison_predicates:
field1 [NOT] IN (comma separated values)
field1 [NOT] BETWEEN value1 AND value2
Subquery comparisons:
field1 comparison_predicate SOME | ANY | ALL (NestedSelectStatement)
eg. WHERE (H."pur_price" > ANY (SELECT O."price" FROM "old_sales.dbf"))
where [NOT] EXISTS (NestedSelectStatement)
GROUP BY clause:
only required if either:
aggregate function used in select clause, or,
use the HAVING clause
must include ALL non-aggregate fields in the Select clause
HAVING clause:
allows a filter on the result set after it is brought to client allowing filtering on summary data on groups of rows, but increases network traffic!
only use if need to filter data AFTER it has been aggregated by a Group
ORDER BY clause:
only need to use this if wish to order data and:
Group By clause is NOT used, and,
desired data order is not the SELECT clause order???
*/
