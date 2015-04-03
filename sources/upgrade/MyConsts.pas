unit MyConsts;
(*
        1 � zamestnanec - �erpanie pracovn�ho vo�na bez n�hrady mzdy alebo slu�obn�ho vo�na bez n�roku na plat alebo slu�obn� pr�jem,
        2 � zamestnanec - dlhodob� uvo�nenie z pracovn�ho pomeru, �t�tnozamestnaneck�ho pomeru alebo zo slu�obn�ho pomeru na v�kon verejnej funkcie alebo na v�kon odborovej funkcie pod�a osobitn�ch predpisov,
        3 � zamestnanec - neospravedlnen� nepr�tomnos� v pr�ci,
        4 � zamestnanec/SZ�O - preru�enie od 11 . d�a potreby o�etrovania fyzickej osoby uvedenej v � 39 ods. 1 p�sm. a) z�kona �. 461/2003 Z. z. o soci�lnom poisten� alebo preru�enie od 11 . d�a starostlivosti o die�a uveden� v � 39 ods. 1 p�sm. b) z�kona �. 461/2003 Z. z. o soci�lnom poisten�,
        5 � zamestnanec/SZ�O - v�kon v�zby alebo v�kon trestu od�atia slobody,
        6 - zamestnanec  - �erpanie rodi�ovsk� dovolenku,
        7 - SZ�O - n�rok na rodi�ovsk� pr�spevok,
        8 � zamestnanec/SZ�O - trvanie do�asnej pracovnej neschopnosti odo d�a nasleduj�ceho po uplynut� 52 t��d�ov,
        9 � zamestnanec � neospravedlnen� nepr�tomnos� v pr�ci z d�vodu jeho ��asti na �trajku,
        10 � SZ�O � pozastaven� prev�dzkovanie �ivnosti, pozastaven� v�kon �innosti alebo pozastaven� �innos�
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
Z�klad dane zni�uje o nezdanite�n� �as�, ktorou je suma zodpovedaj�ca
19,2 n�sobku sumy �ivotn�ho  minima platn�ho k 1. janu�ru pr�slu�n�ho
zda�ovacieho obdobia ro�ne na da�ovn�ka, teda od zda�ovan�ch pr�jmov
bude mo�n� odpo��ta� nezdanite�n� sumu 87 936 Sk. (6736->7328 Sk mesa�ne)

Pr�spevky da�ovn�ka na doplnkov� d�chodkov� sporenie  a finan�n� prostriedky
vynalo�en� da�ovn�kom na ��elov� sporenie bude mo�n� odpo��ta� od z�kladu dane
vo v��ke preuk�zate�ne zaplatenej v zda�ovacom obdob�, v �hrne najviac
do v��ky 12 000 Sk.

Sadzba poistn�ho je pre

a) zamestnanca 4 % z vymeriavacieho z�kladu,
b) samostatne z�robkovo �inn� osobu 14 % z vymeriavacieho z�kladu; ak je samostatne z�robkovo �inn� osoba osoba so zdravotn�m postihnut�m, 40) sadzba poistn�ho je 7 % z vymeriavacieho z�kladu,
c) zamestn�vate�a 10 % z vymeriavacieho z�kladu; ak zamestn�va osoby so zdravotn�m postihnut�m, 40) sadzba poistn�ho je za tieto osoby 5 % z vymeriavacieho z�kladu,
d) poistenca pod�a � 11 ods. 2 14 % z vymeriavacieho z�kladu,
e) �t�t 4 % z vymeriavacieho z�kladu.

(12) Vymeriavac� z�klad sa zaokr�h�uje na cel� koruny nahor.

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
  KonvKurzEuroTxt = 'Konverzn� kurz  1 EUR = 30,1260 SKK';
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
  MenoCelaFirma='spolu cel� firma';
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
  'Moment�lne pou��vate DEMO verziu programu PAM98. '+
  'V�platn� obdobie pre sk��obn� prev�dzku programu ' +
  'bolo ur�en� na v�platn� mesiace janu�r a� september.';
SMyAppInvalidValue=
  'Nespr�vna hodnota.';
SMyAppInvalid2Value=
  'Nespr�vna hodnota - polo�ka %s.';
SMyAppOnlyForExtendedVersion =
  ' T�to funkcia je povolen� len pre verziu PAM98 "EXTENDED".';
SMyAppNewPasswordNotSame=
  'Nespr�vne zadan� nov� heslo, nezhoduje sa s kontrolnou hodnotou.';
SMyAppInvalidPassword='Nespr�vny vstupn� k�d.';
SMyAppPasswordSuccesfullyChanged='Vstupn� heslo bolo �spe�ne zmenen�.';
SMyAppPasswordNotChanged=
   'Heslo nebolo zmenen�.';
SMyAppInvalidLogin=
  'Program bude ukon�en�, preto�e nebol �spe�ne prihl�sen� opr�vnen� '+
  'pou��vate� programu.';
SMyAppInvalidLonginteger='Nespr�vna ��seln� hodnota.';
SMyAppNotRegistered=
  'Program bude ukon�en�, preto�e nebol riadne zaregistrovan�. '+
  'Opr�vnen� pou��vate� programu mus� zada� registra�n� k�d.';
SMyAppInvalidRegKey='Chybn� registra�n� k�d';
SMyAppMocVelaPokusov='Prekro�en� maxim�lny po�et pokusov.';
SMyAppZlePredcislo='Pred��slo nevyhovuje kontrole na modulo 11';
SMyAppZleAbo='��slo ��tu nevyhovuje kontrole na modulo 11';
SMyAppCannotEdit='Neexistuje z�znam pre vykonanie opravy';
SMyAppEditMode='Najsk�r je potrebn� dokon�i� spracovanie zmien';
SMyAppZamCancel='Nie je dokon�en� spracovanie �dajov zamestnanca. Ignorova� vykonan� zmeny ?';
SMyAppZrvCancel='Nie je dokon�en� spracovanie zr�ok zo mzdy. Ignorova� vykonan� zmeny ?';
SMyAppNepCancel='Nie je dokon�en� spracovanie nepr�tomnosti. Ignorova� vykonan� zmeny ?';
SMyAppHsuCancel='Nie je dokon�en� spracovanie v�konovej mzdy. Ignorova� vykonan� zmeny ?';
SMyAppVypNpCancel='Nie je dokon�en� spracovanie nepravideln�ch pr�jmov. Ignorova� vykonan� zmeny ?';
SMyAppVypNpZleObdobie='Mesiac do ktor�ho sa rozpo��tava pr�jem nesmie by� v��� ako je mesiac aktu�lneho v�platn�ho obdobia.';
SMyAppVypNpZmenaKalDni='Upozornenie: Bol prepo��tan� po�et kalend�rnych dn� pod�a zadan�ho mesiaca.';
SMyAppVypNpDuplicitnyZaznam='Duplicitn� z�znam. Pre dan� mesiac u� existuje z�znam s nepravideln�m pr�jmom.';
SMyAppZrvAzPoZmeneVyp='Ak chcete prid�va� alebo opravova� zr�ky zo mzdy, mus�te ma� v�platu v re�ime opr�v alebo prid�vania.';
SMyAppHsuAzPoZmeneVyp='Ak chcete prid�va� alebo opravova� v�konov� mzdu, mus�te ma� v�platu v re�ime opr�v alebo prid�vania.';
SMyAppCloseForm='Nie je dokon�en� spracovanie zmien. Ignorova� vykonan� zmeny ?';
SMyAppTerminate='Naozaj ukon�i� aplik�ciu PAM98 ?';
SMyAppZlyhanieDB='Nepodarilo sa otvori� s�bor %s';
SMyAppLimitExceeded=
  '�al�iu v�platu v tomto mesiaci nie je mo�n� prida�. '+
  'T�to verzia programu umo��uje v jednom mesiaci vytvori� maxim�lne %s v�plat';
SMyAppDataNotFound='Program nena�iel ani jednu datab�zu.';
SMyAppUserWantInsert='Prida� nov� z�znam ?';
SMyAppStopUserWantInsert='Prid�vanie z�znamu bolo zastaven�.';
SMyAppReportInitFailed='Nepodarilo sa inicializova� tla�ov� zostavu. ';
SMyAppReportIsEmpty='Tla�ov� zostava neobsahuje �iadne �daje, je pr�zdna.';
SMyAppReportShowFailed='Nastala chyba pri vytv�ran� tla�ovej zostavy. ';
SMyAppOnlyHalfValueAllowed='Desatinn� �as� nesmie by� in� ako 0.5 !!!';
SMyAppNaozajSpustitGfkGarancne=
  'Nepou��vajte t�to funkciu bez s�hlasu spolo�nosti RAINITECH !!!. �el�te si spusti� nastavenie garan�n�ho poistenia pre v�etk�ch zamestnancov ?';
SMyAppNaozajSpustitGfkZmenaNaDohodarov=
  'Nepou��vajte t�to funkciu bez s�hlasu spolo�nosti RAINITECH !!!. �el�te si spusti� zmenu v�etk�ch zamestnancov na dohod�rov ?';
SMyAppGfkGarancneHotovo=
  'Garan�n� poistenie bolo nastaven� v zamestnancoch aj vo v�plat�ch v aktu�lnom mesiaci.';
SMyAppXenon98NaozajSpustit=
  '�el�te si spusti� export �dajov do s�boru pre program Xenon 98 ?';
SMyAppXenon98Hotovo=
  'Export je ukon�en�. Exportovan� �daje boli ulo�en� do s�boru %s.';
SMyAppAccessImportNaozajSpustit=
  '�el�te si spusti� import �dajov z Accessu ? V�platy v mesiaci %d/%d bud� vymazan� ! Pokra�ova� ?';
SMyAppAccessImportHotovo=
  'Import je ukon�en�. Po�et importovan�ch v�plat: %d.';
SMyAppImportAnketarovNaozajSpustit=
  '�el�te si spusti� import �dajov o anket�roch zo s�boru %s ?';
SMyAppImportVyplatNaozajSpustit=
  '�el�te si spusti� import �dajov o v�plat�ch zo s�boru %s ?';
SMyAppVymazVyplatAnketarov=
  'Bud� vymazan� v�etky v�platy za mesiac %d/%d v stredisk�ch ��slo %s. '+
  'Pokra�ova� ?';
SMyAppVymazVyplatPriImporte=
  'Prv�m krokom importu m��e by� je mo�n� vymaza� v�etky v�platy za mesiac %d/%d, ak si to �el�te. '+#10#13+
  '�no, znamen� pokra�ova� s vymnazan�m.'+#10#13+
  'Nie, znamen� pokra�ova� bez vymazania.';
SMyAppRunZalohovanie=
  'Z�lohovanie �dajov do adres�ra %s.'+#10#13+
  'Spustenie z�lohovania sp�sob� zatvorenie datab�z. Nesk�r ich '+
  'm��ete otvori� cez menu "V�ber firmy".'+#10#13+
  'Pokra�ova� ?';
SMyAppObnovaVyber=
  'V�ber s�boru so z�lo�nou k�piou';
SMyAppXmlVyber=
  'V�ber XML s�boru pre soci�lnu pois�ov�u';
SMyAppRunObnova=
  'POZOR! Obnovou �dajov zo z�lo�nej k�pie bud� definit�vne vymazan� aktu�lne �daje firmy %s.'+#10#13+
  'Spustenie obnovy sp�sob� zatvorenie datab�z. Nesk�r ich '+
  'm��ete otvori� cez menu "V�ber firmy".'+#10#13+
  'Pokra�ova� ?';
SMyAppRunObnovaCommon=
  'POZOR! Obnovou �dajov zo z�lo�nej k�pie bud� definit�vne vymazan� s��asn� nastavenia parametrov pre rok %d.'+#10#13+
  'Spustenie obnovy sp�sob� zatvorenie datab�z. Nesk�r ich '+
  'm��ete otvori� cez menu "V�ber firmy".'+#10#13+
  'Pokra�ova� ?';
SMyAppVlozDisketu=
  #10#13'Pros�m vlo�te disketu do mechaniky %s.'+#10#13+
  'Pokra�ova� ?';
SMyAppIbaJednoStredisko=
  'V ��seln�ku stred�sk nie s� zadefinovan� aspo� 2 stredisk�, preto '+
  'nie je mo�n� zmeni� stredisko.';
SMyAppNesuhlasDatumovehoIntervalu=
  '"D�tum do" mus� by� v��� ako "d�tum od".';
SMyAppOtazkaZrusitRegistraciu=
 'Zru�en�m registr�cie programu sa program ukon��.'#13+
 'Pri novom spusten� program budete potrebova� nov� registra�n� k�d.'#13+
 'Zru�i� registr�ciu programu ?';
SMyAppOtazkaNaozajZrusit=
 'Naozaj zru�i� %s ?';
SMyAppOtazkaTestovatEmaily=
 '�el�te si vykona� test a zasla� emaily s v�platn�mi p�skami'#13+
 'na testovaciu emailovu adresu %s ?';
SMyAppOtazkaPoslatEmaily=
 'D�le�it�!'#13'�el�te si posla� email s v�platn�mi p�skami zamestnancom pr�ve teraz ?';
SMyAppEmailVysledok =
 'V�sledn� LOG zo zasielania emailov si skontrolujte v tomto s�bore:'#13#13' %s.';
SMyAppRegistraciaZrusena=
 'Registr�cia programu bola zru�en�. Program bude ukon�en�.';
SMyAppRegistraciaNejdeZrusit=
 'Registr�cia nem��e by� zru�en�. Program nie je zaregistrovan�.';
SMyAppPridanieFirmyUspech=
 'Pridanie novej firmy bolo �spe�n�. Poradov� ��slo novej firmy je %d.';
SMyApppridanieFirmyNeuspech=
 'Chyba pri prid�van� novej firmy.';
SMyAppZrusenieFirmyPopis=
 'Upozornenie! V�etky �daje firmy %s bud� nen�vratne vymazan� ! Pokra�ova� ?';
SMyAppZrusenieFirmyUspech=
 'Zru�enie firmy %s prebehlo �spe�ne.';
SMyAppZrusenieFirmyNeuspech=
 'Chyba pri ru�en� firmy %s.';
SMyAppZrusenieFirmyOtvorena=
 'Nie je mo�n� zru�i� otvoren� firmu.';
SMyAppZrusenieTlacovychDefinicii=
 'Upozornenie! V�etky defin�cie tla�ov�ch zost�v bud� vymazan� ! Pokra�ova� ?';
SMyAppIbaMultiverzia=
 'Prevedenie pr�slu�nej oper�cie je mo�n� iba v multiverzii programu.';
SMyAppHintPoistenie=
 'Povolen� hodnoty: 0=nie, 1=�no, 2=iba pracovn�k, 3=iba firma, 4=s��et sadzieb, 5=�no,ale firma len gar.fond';
SMyAppHintPoistenie2=
 'Povolen� hodnoty: 0=nie, 1=�no';
SMyAppHintVynimkaVZ=
 'Povolen� hodnoty: 0=bez v�nimky, ostatn� povolen� hodnoty s� v ��seln�ku';
SMyAppChybaHlavickaHP=
'Najsk�r je potrebn� zada� hlavi�ku hromadn�ho pr�kazu.';
SMyAppOtazkaGenerujHP=
'�el�te si spusti� generovanie hromadn�ho pr�kazu pod�a v�plat za %s ?';
SMyAppGenerujHPNotSelected=
  'Nevybrali ste �iadnu �as� hromadn�ho pr�kazu. Generovanie bolo zru�en�.';
SMyAppGenerujHPCompleted=
  'Generovanie hromadn�ho pr�kazu bolo dokon�en�. '+
  #13#10#13#10+'!!! Sumu pre odvod preddavkov alebo dane na da�ov� �rad je potrebn� skontrolova� a pr�padne aj manu�lne upravi� !!!'+
  #13#10+'     T�to suma nezoh�ad�uje neuplatnen� preplatky z minul�ch mesiacov.'+
  #13#10#13#10+'!!! Doporu�ujeme v�dy kontrolova� s v�kazmi !!!';
SMyAppHPCompletedXml=
  'Generovanie s�boru %s bolo dokon�en�.';
SMyAppOtazkaBoloRocneZuctovanieVTomtoMesiaci=
  'Pre be�n� v�kaz v mesiaci pou�ite ako odpove� prednastaven� vo�bu "Nie"'#10#13#10#13+
  'V mesiaci v ktorom ste vykonali a prip�sali ro�n� z��tovanie preddavkov dane, pou�ite vo�bu "�no" a �daje z ro�n�ho z��tovania sa zahrn� do tohto mesa�n�ho v�kazu.'+#10#13#10#13+
  'Bolo v tomto mesiaci vykonan� ro�n� z��tovanie preddavkov dane?';
SMyAppDuMesVykCompletedXml=
  'Generovanie s�boru %s bolo dokon�en�.'+#10#13+
  'XML s�bor je mo�n� nahra� do softv�ru eDANE, ktor� poskytuje da�ov� �rad na svojej web str�nke.'+#10#13+
  'Po stla�en� OK sa otvor� Explorer v pr�slu�nom adres�ri, kde bol vygenerovan� s�bor.';
SMyAppHPCompletedVub=
  'Generovanie s�boru %s bolo dokon�en�.';
SMyAppHPBadCisloU=
  'Chybn� ��slo ��tu: %s !!!';
SMyAppHPNevyplnenyDatumSplatnosti=
  'Najsk�r je potrebn� vyplni� d�tum splatnosti hromadn�ho pr�kazu.';
SMyAppPriznakUctovatInvalid=
'Nespr�vna hodnota. Povolen� hodnoty s� 0(nie) a 1(�no).';
SMyAppCreateFileFailed=
 'Nepodarilo sa vytvori� s�bor %s. Skontrolujte, �i s�bor s uveden�m menom nepou��va in� aplik�cia.';
SMyAppFileCreated=
 'S�bor %s bol �spe�ne vytvoren�. Tento s�bor je mo�n� otvori� v Exceli.';
SMyAppRunExcel=
 '�el�te si otvori� vytvoren� s�bor v Exceli ?';
SMyAppRunRTF=
 '�el�te si otvori� vytvoren� s�bor %s ?';
SMyAppHpidIsNull=
 'Najsk�r mus�te vybra� hromadn� pr�kaz na �hradu.';
SMyAppParameterNotFound=
 'Nena�iel sa parameter %s.';
SMyAppFileNotFound=
 'Neexistuje s�bor %s.';
SMyAppDanovePasmaNotFound=
 'S�bor %s neobsahuje inform�cie o da�ov�ch p�smach.';
SMyAppNastavitDanovePasma=
 'Chcete nastavi� da�ov� p�sma pre rok %d zo s�boru %s ?';
SMyAppNastavitParametreRoku=
 'Chcete nastavi� parametre pre rok %d zo s�boru %s ?';
SMyAppNaozajVymazatHromPrikaz=
 'Bude vymazan� hlavi�ka hromadn�ho pr�kazu a tie� v�etky riadky hromadn�ho pr�kazu. Pokra�ova� ?';
SMyAppZakazRobitZmeny=
 'Nie je mo�n� vykona� zmenu v�platy star�ej ako je d�tum poslednej uz�vierky (%s)';
SMyAppZakazRobitZmenyMimoAktMesiaca=
 'Nie je mo�n� vykona� zmenu v�platy v inom ne� aktu�lnom obdob�. V pr�pade, �e chcete �daje zmeni�, vykonajte zmenu v�platn�ho obdobia.';
SMyAppPreniestZmenyDoVyplat=
 'Vykonali ste zmeny v nastaveniach. Chcete tieto zmeny prenies� do v�etk�ch v�plat v mesiaci %s ?';
SMyAppNaozajPrepocitatVyplaty=
 'Naozaj chcete prepo��ta� v�etky v�platy za %s ?';
SMyAppNaozajRozdelitDan=
 'Pred vykonan�m tejto oper�cie je doporu�en� vykona� z�lohu �dajov a po vykonan� akcie kontrolu �dajov vo v�plat�ch. Naozaj chcete prepo��ta� v�etky v�platy (%s) a rozdeli� da� pod�a pr�jmu na preddavkov� a zr�kov� v mesiaci %s ?';
SMyAppZakazRobitHsv=
 'Nie je mo�n� vykona� hromadn� spracovanie v�plat v mesiaci pred d�tumom poslednej uz�vierky (%s)';
SMyAppZakazRobitHsu=
 'Nie je mo�n� vykona� hromadn� spracovanie �konov v mesiaci pred d�tumom poslednej uz�vierky (%s)';
SMyAppLenPoslednyMesiacStvrtroka=
 'Uveden� v�kaz je mo�n� vytv�ra� iba v mesiacoch 3,6,9 a 12, teda posledn� mesiac �tvr�roka.';
SMyAppZrusenaFunkcia=
  'T�to funkcia je od %s zru�en�';
SMyAppVytvoritNovyXml=
  'S�bor %s u� existuje. Touto oper�ciou vznikne nov� XML s�bor. Naozaj si �el�te vytvori� nov� XML s�bor ? ';
SMyAppExistujePrepisat=
  'S�bor %s u� existuje. Touto oper�ciou vznikne nov� s�bor, pri�om �daje v existuj�com s�bore bud� prep�san�. Naozaj si �el�te prep�sa� existuj�ci s�bor a vytvori� nov� ? ';
SMyAppSpustitVypocetCDM=
  '�el�te si vypo��ta� denn� vymer.z�klad pre v�po�et n�hrad PN pre rok %d ?'+#10#13+
  'Pokra�ova� ?';
SMyAppOtazkaVymazatCDM=
  '�el�te si vymaza� �daj denn�ho vymer.z�kladu pre v�po�et n�hrad PN pre v�etk�ch platn�ch zamestnancov ?';
SMyAppVypocetCDM_Hotovo=
  'V�po�et skon�il. Pros�m skontrolujte polo�ku "Denn� vymer.z�kl.pre n�hr.PN" na kart�ch zamestnancov v z�lo�ke "Pracovn� �daje".';
SMyAppTypRiadkuNieJeVybraty=
  'Nevybrali ste typ riadku. Najsk�r mus�te vybra� typ riadku.';
SMyAppKodNieJeVyplneny=
  'Chyba. K�d pois�ovne mus� by� vyplnen�.';
SMyAppKodNieJeCislo=
  'Chyba. K�d pois�ovne mus� by� ��seln� hodnota.';
SMyAppNedaSaNastavitRok=
  'Od roku 2005 je ka�d� rok evidovan� osobitne. Zmena roku znamen� zmenu agendy a vykon�va sa cez menu Syst�m/V�ber firmy. V tejto obrazovke m��ete rok nastavi� na hodnotu 2004 alebo men�iu';
SMyAppRokUzExistuje=
  'Zalo�enie datab�z roku %s nie je mo�n�, preto�e datab�zy u� existuj�.';
SMyAppZalozenieRokuUspech=
 'Zalo�enie datab�z roku %d bolo �spe�n�. Datab�zy s� ulo�en� v adres�ri %s.';
SMyAppZalozenieRokuNeuspech=
 'Zalo�enie datab�z roku %d skon�ilo ne�spe�ne.';
SMyAppOtazkaPridatRok=
  '�el�te si zalo�i� datab�zy pre rok %s ? '+
  'Pokra�ova� ?';
SMyAppZauctovatPreplatkyDane=
  '�el�te si do v�platy za %s za��tova� vypo��tan� preplatky a nedoplatky dane z ro�n�ho z��tovania preddavkov dane za rok %d ? '+
  'Pokra�ova� ?';
SMyAppZauctovatPreplatkyZP=
  '�el�te si do v�platy za %s za��tova� vypo��tan� preplatky a nedoplatky zdrav.poistenia z ro�n�ho z��tovania preddavkov zdrav.poistenia za rok %d ? '+
  'Pokra�ova� ?';
SMyAppNeexistujeRZP=
  'V roku %d sa nena�li �iadne vypo��tan� ro�n� z��tovania preddavkov. '+
  'Zme�te v�platn� obdobie na minul� rok a vykonajte ro�n� z��tovanie preddavkov.';
SMyAppChybaPriZauctovaniPreplatkovDane=
  'Za��tovanie preplatkov/nedoplatkov dane skon�ilo s chybami. Viac inform�ci� n�jdete v protokole zo spracovania.';
SMyAppChybaPriZauctovaniPreplatkovZP=
  'Za��tovanie preplatkov/nedoplatkov zdrav.poistenia skon�ilo s chybami. Viac inform�ci� n�jdete v protokole zo spracovania.';
SMyAppFilesGenerated=
  'Generovanie s�borov v adres�ri %s bolo dokon�en�.';
SMyAppZdravFilesGenerated=
  'Generovanie s�borov %s v adres�ri %s a v podadres�ri pr�slu�nej zdravotnej pois�ovne bolo dokon�en�.';
SMyAppZdravRzpFilesGenerated=
  'S�bor %s s podkladmi pre ro�n� z��tovanie bol vytvoren�.'+CHR(13)+CHR(10)+
  'Program nedok�e generova� obdobia poistenia OD DO pre zamestnancov, ktor� mali v priebehu roka preru�en� poistenie.'+CHR(13)+CHR(10)+
  'Tieto obdobia je potrebn� do s�boru doplni� manu�lne v textovom editore.'+CHR(13)+CHR(10)+
  'Po stla�en� OK sa otvor� Explorer v pr�slu�nom adres�ri, kde bol vygenerovan� s�bor.';
SMyAppZdravFilesNotGenerated=
  'S�bory neboli vygenerovan�, nako�ko nie s� pripraven� �iadne �daje pre export d�t.'+CHR(13)+CHR(10)+
  'Najsk�r je potrebn� pripravi� �daje v karte zamestnanca v z�lo�ke Zdr.poist.-typ d�vky 601.';
SMyAppChybaRozdielneDatumy=
  'Nie je mo�n� zada� po�adovan� typ udalosti, preto�e uveden� typ vy�aduje ma� zadan� rovnak� d�tumy za�iatku aj konca';
SMyAppDovodPreruseniaNemaBytVyplneny=
  'D�vod preru�enia poistenia je mo�n� zada� len pre registra�n� list SP-preru�enie';
SMyAppDovodPreruseniaMusiBytVyplneny=
  'D�vod preru�enia poistenia mus� by� vyplnen�';
SMyAppNepripustnyTypRL2=
  'Nepr�pustn� typ udalosti pre zvolen� registra�n� list.';
SMyAppNoRowNotSelected=
  'Nebol ozna�en� ani jeden riadok, aspo� jeden z�znam je potrebn� ozna�i�.';
SMyAppShowRowSelected=
  'Bolo ozna�en�ch %d riadkov na spracovanie. Pokra�ova� ?';
SMyAppBadRcLength=
  'D�ka rodn�ho ��sla mus� by� minim�lne 9 a maxim�lne 10 znakov.';
SMyAppNotFoundVykazZP=
  'V�kaz pre zdravotn� pois�ov�u �.%d je pr�zdny.';
SMyAppRocneZuctZpAzOdRoku2006=
  'Ro�n� z��tovanie zdravotn�ho poistn�ho sa 1.kr�t vykon�va a� vo v�platnom obdob� roku 2006 za rok 2005. Je potrebn� najsk�r nastavi� spr�vne v�platn� obdobie.';
SMyAppRocneZuctZlyRok=
  'Nespr�vny d�tum %s - rok mus� by� zhodn� s rokom, za ktor� sa rob� ro�n� z��tovanie.';
SMyAppVD_PDF_Hotovo=
  'Bolo vygenerovan�ch %d s�borov %s v adres�ri %s. S�bory je mo�n� prezera� v prehliada�i Acrobat Reader 6.0 CE alebo vy��om. Prehliada� sa otvor� automaticky po dvojkliknut� na dan� s�bor.';
SMyAppZalozitNovuFirmu=
  'Vybrali ste vo�bu pre pridanie novej firmy do mzdovej evidencie. Pokra�ova� ?';
SMyAppItemIsRequired=
  'Polo�ka %s mus� by� vyplnen�';
SMyAppCompleted=
  'Oper�cia bola �spe�ne dokon�en�';
{--}
SMyCisDeleteQuestion='Vymaza� polo�ku ?';
SMyCisDeleteStopped='Vymazanie polo�ky bolo zastaven�';
SMyCisDeleteNotAllowed='Vymazanie polo�ky nie je dovolen�';
SMyCisKeyViolation='Key violation.';
SMyCisDuplicitnyZaznam='Duplicitn� z�znam.';
SMyCisInsertNotAllowed='Pridanie polo�ky nie je dovolen�';
SMyCisInstituciaNotValid=
 'Nespr�vna hodnota.';
SMyCisStrediskoJednaMusiZostat=
 'Nie je mo�n� vymaza� stredisko s ��slom 1.';
{--}
SMyHsvPocetZauctovanych=
 'Prebehlo hromadn� spracovanie v�plat. Po�et spracovan�ch v�plat %d.';
SMyHsvOtazkaSpustit=
 'Chcete spusti� za��tovanie v�plat v mesiaci %s';
SMyHsvOtazkaUkoncit=
 'Prajete si ukon�i� hromadn� spracovanie v�plat ?';
{--}
SMyHsuOtazkaSpustit=
 'Chcete spusti� za��tovanie v�konovej mzdy v mesiaci %s';
SMyHsuPocetZauctovanych=
 'Prebehlo za��tovanie v�konovej mzdy. Po�et spracovan�ch v�plat %d.';
SMyHsuOtazkaUkoncit=
 'Prajete si ukon�i� zad�vanie v�konovej mzdy ?';
SMyHsuOtazkaSpustitNacitanie=
 'Chcete spusti� na��tanie podkladov pre v�po�et v�konovej mzdy v mesiaci %s ?'+
 '�daje, ktor� ste ru�ne zadali v tomto mesiaci bud� vymazan�.';
SMyHsuNacitanieHotovo=
 'Prebehlo na��tanie podkladov v�konovej mzdy. Po�et na��tan�ch riadkov %d.';
{--}
SMyPar24='Priemer pre nemoc.d�vky 0-p�vodne,1-aktu�lna da�';
SMyPar25='V��ka pr�davku na 1 die�a';
SMyPar26='Z�klad pre DDP: 1-hrub� mzda, 2-z�kladn� mzda';
{--}
SMyRepExecError='Nepodarilo sa inicializova� tla�ov� zostavu';
SMyRepNotFoundVP='V zadanom mesiaci neexistuj� v�platn� p�sky';
SMyRepJedenPracovnik='Pre zvolen� typ tla�ovej zostavy mus� by� vybran� konkr�tny pracovn�k';
SMyRepNotFoundVP2EMAIL='V aktu�lnom mesiaci neexistuj� v�platn� p�sky pripraven� na odoslanie emailom, alebo yamestnanci nemaj� spr�vne vyplnen� mailovu adresu.';
{--}
SMyRzpZaciatok='Automatick� za��tovanie preplatku/nedoplatku dane prebehne spr�vne len vtedy, ak u� m�te hotov� v�platy za aktu�lny mesiac, do ktor�ho chcete toto za��tovanie vykona�. Pokra�ova� ?';
SMyRzzpZaciatok='Automatick� za��tovanie preplatku/nedoplatku zdr.poistenia prebehne spr�vne len vtedy, ak u� m�te hotov� v�platy za aktu�lny mesiac, do ktor�ho chcete toto za��tovanie vykona�. Pokra�ova� ?';
SMyRzpUzExistuje='Ro�n� z��tovanie dane u� bolo uroben�';
SMyRzpVymazatZuctovanie='Vymaza� ro�n� z��tovanie dane ?';
SMyRzpBudeDefinitivneZrusene='Ro�n� z��tovanie dane bude definit�vne zru�en� ?';
SMyRzpVymazanieBoloZastavene='Vymazanie ro�n�ho z��tovania dane bolo zastaven�';
SMyRzpNemenPred2002='Nie je dovolen� prid�va� ani modifikova� ro�n� z��tovania pred rokom 2002';
SMyRzpNeexistuje='Najsk�r je potrebn� vykona� ro�n� z��tovanie dane';
SMyRzpNeexistuje2='Ro�n� z��tovanie dane nebolo n�jden�. Ak spracov�vate rok %d, je potrebn� zmeni� v�platn� obdobie. Ak spracov�te rok %d je potrebn� najsk�r urobi� ro�n� z��tovanie dane.';
SMyRzpChybaHranicaPreNezdCiastku=
  'Nie je definovan� hranica z�kl.dane pre nekr�tenie nezd.�iastky na da�ovn�ka. Skontrolujte ��seln�k parametrov programu.';
{--}
SMyZdrOznamenieNeexistuje='Nie je mo�n� vytla�i� ozn�menie o preplatkoch. Bu� nebol vlo�en� z�znam do evidencie pre ro�n� z��tovanie zdravotn�ho poistenia, alebo nebol vlo�en� z�znam do evidencie v�sledkov ro�n�ho z��tovania."';
SMyZdrDokladNeexistuje='Nie je mo�n� vytla�i� doklad o preddavkoch. Bu� nebol vlo�en� z�znam do evidencie pre ro�n� z��tovanie zdravotn�ho poistenia, alebo nie je nastaven� sp�sob v�beru �iadosti : "zamestnanec po�iadal zamestn�vate�a o vystavenie potvrdenia"';
SMyZdrVysledokNeexistuje='Nie je mo�n� vytla�i� ozn�menie zamestnanca. Nebol vlo�en� z�znam do sekcie V�sledok ro�n�ho z��tovania.';
SMyZdrVypPodkladovPreDoklad='�el�te si vykona� v�po�et podkladov pre doklad ? Ak ste tento v�po�et u� urobili v minulosti, tak �daje bud� nahraden� nov�m v�po�tom. Pokra�ova� ?';
SMyZdrVypPodkladovPreDokladHotovo='Podklady pre doklad za jednotliv� mesiace boli zap�san� do tabu�ky.';
SMyZdrVypPodkladovChyba='Nie je mo�n� vykona� tla�. Najsk�r je potrebn� vykona� v�po�et podkladov pre doklad v z�lo�ke Doklad o preddavkoch za rok %s.';
{--}
SMyZukVymazatZuctovanie='Vymaza� v�kon ?';
SMyZukBudeDefinitivneZrusene='V�kon bude definit�vne zru�en� ?';
SMyZukVymazanieBoloZastavene='Vymazanie v�konu bolo zastaven�';
{--}
SMyVypUzExistuje='V�plata u� bola uroben�';
SMyVypVymazatVyplatu='Vymaza� v�platu ?';
SMyVypBudeDefinitivneZrusena='V�plata bude definit�vne zru�en� ?';
SMyVypVymazanieBoloZastavene='Vymazanie v�platy bolo zastaven�';
SMyVypOtazkaUplatnitZrazkovuDan=
 'Zr�kovou da�ou je mo�n� zdani� pr�jem zamestnanca do v��ky %s mesa�ne v pr�pade zamestnanca, ktor� zamestn�vate�a nepo�iadal o uplat�ovanie nezdanite�n�ch �iastok a da�ov�ho bonusu. Naozaj si �el�te uplatni� zr�kov� da� ?';

SMyVypOdpracDniTrebaVyplnit=
  'Polo�ka po�et odpracovan�ch dn� mus� by� vyplnen�.';
SMyVypOdpracHodinyTrebaVyplnit=
  'Polo�ka po�et odpracovan�ch hod�n mus� by� vyplnen�.';
SMyVypVynimkaVVZTrebaVyplnit=
  'Polo�ka v�nimka v��ky vymer.z�kladu mus� by� vyplnen�.';
SMyVypTlacHPNotSelected=
  'Nevybrali ste tla� �iadnej �asti hromadn�ho pr�kazu. Tla� bola zru�en�.';
SMyVypMesiaceTrebaVyplnit=
  'Polo�ka po�et mesiacov, za ktor� sa vypl�ca jednor�zov� mzda mus� by� vyplnen�.';
SMyVypTypPremiiInvalid=
'Nespr�vna hodnota. Povolen� hodnoty s� 0(individ.v��ka),1(percent.v��ka a 2(hodinov� sadzba).';
{--}
SMyZamUzExistuje='Osobn� ��slo %s je obsaden�, mus�te zada� ��slo, ktor� e�te nebolo pridelen�';
SMyZamRcUzExistuje='Rodn� ��slo %s je v datab�ze u� evidovan� pod os.��slom: %s, menom: %s. Napriek tomu si ho �el�te ulo�i� ?';
SMyZamNeexistuje='Osobn� ��slo %s zatia� nebolo nikomu pridelen�';
SMyZamPrihlasenie='Osobn� ��slo %s nem� pr�vo prihl�si� sa do syst�mu';
SMyZamNotFound='Nie je vybrat� zamestnanec';
SMyZamZleHeslo='Nespr�vne heslo';
SMyZamZleStareHeslo='Nespr�vne star� heslo';
SMyZamNerovnakeHesla='Nov� heslo 1 a nov� heslo 2 musia by� zhodn�';
SMyZamUkoncenyPomer='Pracovn�k ukon�il pracovn� pomer %s. Jeho v�platy nie je mo�n� meni�.';
SMyZamUkoncenyPomer2=
 'Zamestnancovi nie je mo�n� zada� v�platu. M� ukon�en� pracovn� pomer.';
SMyZamNemaUkoncenyPomer=
  'Pracovn�k nem� zaevidovan� ukon�en� pracovn� pomer v karte zamestnanca.';
SMyZamVymazatPracovnika='Vymaza� zamestnanca ?';
SMyZamBudeDefinitivneZruseny='Zamestnanec bude definit�vne zru�en� ?';
SMyZamVymazanieBoloZastavene='Vymazanie zamestnanca bolo zastaven�';
SMyZamMaUrobeneVyplaty=
  'Zamestnanca nie je mo�n� zmaza� dovtedy, pok�m nie s� vymazan� jeho v�platy. '+
  'Ak skon�il pracovn� pomer zamestnanca, sta�� nastavi� polo�ku "D�tum ukon�enia",'+
  'nepou��va sa vo�ba vymazanie zamestnanca';
SMyZamPohlavieNotValid='Nespr�vna hodnota. Povolen� hodnoty s� M(mu�) a Z(�ena).';
SMyZamVojakNotValid='Nespr�vna hodnota. Povolen� hodnoty s� A(vojak) a N(nevojak).';
SMyZamRodStavNotValid='Nespr�vna hodnota. Povolen� hodnoty s� S(slobodn�),Z(�enat�),R(rozveden�) a V(vdovec).';
SMyZamFzUvazokNotValid='Nespr�vna hodnota. Povolen� hodnoty s� 0,1,2 a 3';
SMyZamFzTypZamNotValid='Nespr�vna hodnota. Povolen� hodnoty s� O(ostatn�),Z(ob�an so ZPS) a D(d�chodca).';
SMyZamTypZrazkyNotValid='Nespr�vna hodnota. Povolen� hodnoty s� P(pois�ov�a),O(odbory),Y(p��i�ky),S(staveb.sporenie) a X(in�).';
SMyZamNemozeBytZtpBezZps='Najsk�r je potrebn� nastavi� zmenen� pracovn� schopnos�.';
SMyZamZapocetChybaVystup='Nie je mo�n� vytla�i� z�po�tov� list. Pracovn�k nem� vyplnen� d�tum v�stupu.';
SMyZamZapocetChybnyVystup='Nie je mo�n� vytla�i� z�po�tov� list. Pracovn�k m� nespr�vne vyplnen� d�tum v�stupu.';

SMyZamNemozeMatObidve=
 'Hodnotenie pracovn�ka m��e by� uskuto�nen� bu� dohodnutou v��kou mesa�n�ho platu '+
 'alebo hodinovou sadzbou. Pou�i� s��asne obidve nie je mo�n�.';
SMyZamKZPMusiBytVyplneny=
 'K�d zdravotnej pois�ovne mus� by� vyplnen�';
SMyZamSidNotFound=
 'Stredisko s uveden�m ��slom nie je zadefinovan� v ��seln�ku stred�sk.';
SMyZamMusiBytRovnakeObdobie=
 'Nepr�tomnos� mus� za��na� aj kon�i� v tom istom mesiaci, inak sa mus� rozdeli� do viacer�ch z�znamov.';
SMyZamNepMusiZacinatVAktRoku=
 'D�tum za�iatku nepr�tomnosti mus� zodpoveda� aktu�lnemu v�platnemu roku, v ktorom je zad�van� alebo menen�.';
SMyZamNepMusiKoncitVAktRoku=
 'D�tum ukon�enia nepr�tomnosti mus� zodpoveda� aktu�lnemu v�platnemu roku, v ktorom je zad�van� alebo menen�.';
SMyZamDatumMusiZacinatVAktRoku=
 'Zadan� d�tum mus� zodpoveda� aktu�lnemu v�platnemu roku, v ktorom je zad�van� alebo menen�.';
 SMyZamPrekrocenyPocetPracDni=
 'Pr�li� ve�k� po�et pracovn�ch dn� v uvedenom obdob�. Maxim�lny po�et dn�, ktor� je mo�n� zada� : %s.';
SMyDetMesOdExpected=
 'Mesiac od mus� by� vyplnen�.';
SMyDetMesDoExpected=
 'Mesiac do mus� by� vyplnen�.';
SMyBonusNesuhlasi=
 'Zamestnanec %s : zisten� rozdiel medzi evidenciou det� a vyplaten�m bonusom. Pros�m skontrolujte evidenciu det� a jeho v�platy';
SMyNepDatZanikuPoistMusiBytDoKoncaRoka2012=
 'D�tum z�niku poistenia: D�tum mus� byt rovn� alebo men�� ako 31.12.2012';
SMyNepNevyplnenyUdajDatumVznikuPoistenia=
 'Nevyplnen� �daj : D�tum vzniku poistenia';
SMyNepNevyplnenyUdajDatumZanikuPoistenia=
 'Nevyplnen� �daj : D�tum z�niku poistenia';
SMyNepNespravnaHodnotaPrePracovnyPomer=
 'Nespr�vna hodnota pre typ pracovn�ho pomeru, povolen� hodnoty s�: 1 - pracovn� pomer na dobu neur�it�, 2 - pracovn� pomer na dobu ur�it�';

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
    MyDataPth:string[128];  {d�ta z aktu�lneho roku}
    MyDataDir:string[8];
    MyDatxPth:string[128]; {d�ta z minul�ho roku}
    MyDataSkk:string[128]; {d�ta v SKK}
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
POPIS=Dopravn� 1
SKRATKA=DOPR1
HODNOTA=300
[PARAMETER 2]
POPIS=Dopravn� 2
SKRATKA=DOPR2
HODNOTA=380
[PARAMETER 3]
POPIS=Dopravn� 3
SKRATKA=DOPR3
HODNOTA=800
[PARAMETER 4]
POPIS=Hranica hrub�ho pr�jmu pre uplatnenie mimoriadnych v�davkov
SKRATKA=DOPR_HRANICA
HODNOTA=7000
[PARAMETER 5]
POPIS=V��ka nezdanite�nej �iastky na mimoriadne v�davky
SKRATKA=DOPR_MIMO
HODNOTA=500
[PARAMETER 6]
POPIS=Koeficient n�sobku pre v�po�et pr�davkov - ni���
SKRATKA=KOEF_PRIDAVKY1
HODNOTA=1,36
[PARAMETER 7]
POPIS=Koeficient n�sobku pre v�po�et pr�davkov - vy���
SKRATKA=KOEF_PRIDAVKY2
HODNOTA=1,99
[PARAMETER 8]
POPIS=Nezdanite�n� �iastka na 1 die�a
SKRATKA=NEZD_DIETA
HODNOTA=750
[PARAMETER 9]
POPIS=Max po�et det� pre uplatnenie nezdanit. s�m na deti
SKRATKA=NEZD_DIETA_MAXP
HODNOTA=4
[PARAMETER 10]
POPIS=Nezdanite�n� �iastka na 1 Z�P die�a
SKRATKA=NEZD_DIETA_ZTP
HODNOTA=1500
[PARAMETER 11]
POPIS=Nezdanite�n� �iastka na osobu
SKRATKA=NEZD_MINIMUM
HODNOTA=1750
[PARAMETER 12]
POPIS=Tla�i� 2 v�platn� p�sky na jednu stranu A4 (NIE=0, �NO=1)
SKRATKA=TLAC_2VP_NA1
HODNOTA=1
[PARAMETER 13]
POPIS=1=disketa A, 2=disketa B, 0=pevn� disk
SKRATKA=ZALOHOVANIE
HODNOTA=0
[PARAMETER 14]
POPIS=�ivotn� minimum - plnolet� fyzick� osoba
SKRATKA=ZIV_MINIMUM
HODNOTA=3000
[PARAMETER 15]
POPIS=�ivotn� minimum - spolo�ne posudzovan� osoba
SKRATKA=ZIV_MINIMUM1
HODNOTA=2100
[PARAMETER 16]
POPIS=Rodi�ovsk� pr�spevok po ukon�en� materskej dovolenky
SKRATKA=RODIC_PRISPEVOK
HODNOTA=0
[PARAMETER 17]
POPIS=Po�et polo�iek hromadn�ho pr�kazu na jednej strane
SKRATKA=POC_POL_HP
HODNOTA=15
[PARAMETER 18]
POPIS=Minim�lna suma pre odvod poistenia za �kody
SKRATKA=MIN_POI_SKODA
HODNOTA=70
[PARAMETER 19]
POPIS=Maxim�lny z�klad pre odvod zdrav.poistenia
SKRATKA=MAX_ZAKLAD_ZP
HODNOTA=32000
[PARAMETER 20]
POPIS=Maxim�lny z�klad pre odvod nemoc.poistenia
SKRATKA=MAX_ZAKLAD_NP
HODNOTA=32000
[PARAMETER 21]
POPIS=Maxim�lny z�klad pre odvod d�chodkov�ho poistenia
SKRATKA=MAX_ZAKLAD_DP
HODNOTA=32000
[PARAMETER 22]
POPIS=Maxim�lny z�klad pre odvod do fondu zamestnanosti
SKRATKA=MAX_ZAKLAD_FZ
HODNOTA=32000
[PARAMETER 23]
POPIS=Nezdanite�n� mesa�n� �iastka na da�ovn�ka
SKRATKA=NC_OSOBA
HODNOTA=3230
[PARAMETER 24]
POPIS=V��ka pr�davku na 1 die�a
SKRATKA=PRIDAV_NA_DIETA
HODNOTA=270
[PARAMETER 26]
POPIS=Z�klad pre DDP, 1-hrub� mzda, 2-z�kladn� mzda
SKRATKA=ZAKLAD_DDP
HODNOTA=1
[PARAMETER 27]
POPIS=Percent. zn�enie sadzby na starobn� poistenie na 1 die�a
SKRATKA=ZNIZ_POIST_DIETA
HODNOTA=0,5
[PARAMETER 28]
POPIS=Da�ov� bonus na vy�ivovan� die�a
SKRATKA=DAN_BONUS_DIETA
HODNOTA=400
[PARAMETER 29]
POPIS=Miera poklesu schopn. vyk.z�robk.�inn.pre ��avu na zdrav.p.
SKRATKA=MIERA_POKLESU_ZP
HODNOTA=20
[PARAMETER 30]
POPIS=Minim�lna mzda
SKRATKA=MIN_MZDA
HODNOTA=6500
[PARAMETER 31] - platn� od 1.1.2006 - iba WARNING
Zdanenie pr�jmov zo z�vislej �innosti do 5000 Sk zr�kovou da�ou
Zr�kovou da�ou sa bude zda�ova� aj pr�jem zamestnanca do v��ky 5000 Sk
mesa�ne v pr�pade zamestnanca, ktor� zamestn�vate�a nepo�iadal o uplat�ovanie
nezdanite�n�ch �iastok a da�ov�ho bonusu.
POPIS=Minim�lna mzda
SKRATKA=DAN_MAX_PRIJEM
HODNOTA=5000
[PARAMETER 32]
POPIS=Zr�kov� da� k preddavkovej posunut� o 1 mesiac
SKRATKA=ZRAZ_DAN_POSUN
HODNOTA=0/1 �NO/NIE
[PARAMETER 33]
POPIS=Po��tanie pr�platkov: 0=z hod.sadz.,1=z priem.mzdy
SKRATKA=POCITANIE_PRIPL
HODNOTA=0/1
[PARAMETER 34]
POPIS=Identifik�cia pre soc.pois�ov�u: 0=I�O,1=DI�
SKRATKA=IDENT_SOCPOIST
HODNOTA=0/1
[PARAMETER 36]
POPIS=Hranica z�kl.dane pre nekr�tenie nezd.�iastky na osobu
SKRATKA=NC_OSOBA_PRIJEM
HODNOTA=498000
[PARAMETER 37]
POPIS=Nezdanite�n� ro�n� �iastka na da�ovn�ka
SKRATKA=NC_OSOBA_ROK
HODNOTA=4025.70
[PARAMETER 38]
POPIS=Nezdanite�n� �iastka na DDS, �P, �S ro�ne
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
  Application.MessageBox(@S[1],'Inform�cia',
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
   1:if up then s:='JANU�R'    else s:='janu�r';
   2:if up then s:='FEBRU�R'   else s:='febru�r';
   3:if up then s:='MAREC'     else s:='marec';
   4:if up then s:='APR�L'     else s:='apr�l';
   5:if up then s:='M�J'       else s:='m�j';
   6:if up then s:='J�N'       else s:='j�n';
   7:if up then s:='J�L'       else s:='j�l';
   8:if up then s:='AUGUST'    else s:='august';
   9:if up then s:='SEPTEMBER' else s:='september';
  10:if up then s:='OKT�BER'   else s:='okt�ber';
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
   '1','S':if pohl='M' then Result:='slobodn�' else
       if pohl='Z' then Result:='slobodn�' else
                        Result:='slobodn�(�)';
   '2','Z':if pohl='M' then Result:='�enat�' else
       if pohl='Z' then Result:='vydat�' else
                        Result:='�enat�(vydat�)';
   '4','V':if pohl='M' then Result:='vdovec' else
       if pohl='Z' then Result:='vdova' else
                        Result:='vdovec(vdova)';
   '3','R':if pohl='M' then Result:='rozveden�' else
       if pohl='Z' then Result:='rozveden�' else
                        Result:='rozveden�(�)';
   '5':if pohl='M' then Result:='druh,dru�ka' else
       if pohl='Z' then Result:='druh, dru�ka' else
                        Result:='druh, dru�ka';
   else Result:='';
  end;
end;

function  TEXT_POHLAVIE(pohl:char):string;
begin
  case pohl of
   'M': Result:='mu�';
   'Z': Result:='�ena';
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
   '0': Result:='in�';
   '1': Result:='pln�';
   '2': Result:='polovi�n�';
   '3': Result:='menej ako polovi�n�';
  else  Result:='';
  end;
end;

function  TEXT_FZ_TYPZAM(typ: char):string;
begin
  case typ of
   'O': Result:='ostatn�';
   'Z': Result:='ob�an so ZPS';
   'D': Result:='d�chodca';
  else  Result:='';
  end;
end;

function  TEXT_TYP_PREMII(typ: integer):string;
begin
  case typ of
   0: Result:='individu�lna v��ka';
   1: Result:='percentu�lna sadzba';
   2: Result:='hodinov� sadzba';
  else  Result:='';
  end;
end;

function  TEXT_TYP_PRIPLATKOV(typ: integer):string;
begin
  case typ of
   0: Result:='percentu�lna';
   1: Result:='hodinov�';
  else  Result:='';
  end;
end;

function  TEXT_TYP_NEPRITOMNOSTI(typ: integer):string;
begin
  case typ of
   0: Result:='neuveden�';
   1: Result:='PN';
   2: Result:='O�R';
   3: Result:='n�hr.vo�no';
   4: Result:='absencia';
   5: Result:='n�ten� vo�no';
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
   'D':Result:='Da�ov� �rad - zr�ky+preddavky';
   'E':Result:='Da�ov� �rad - preddavky';
   'F':Result:='Da�ov� �rad - zr�ky';
   'P':Result:='Z�konn� poistenie za �kodu';
   'S':Result:='Soci�lna pois�ov�a';
   'U':Result:='�rad pr�ce';
   'X':Result:='Soci�lny fond';
   'Z':Result:='Zdrav.pois�.�.'+IntToStr(kod);
   'Y':Result:='DDP �.'+IntToStr(kod);
   else Result:='';
  end;
end;

function  TEXT_ZRAZKY(typ:string):string;
begin
  Result:='';
  if length(typ)>0 then
  case typ[1] of
   'P':Result:='pois�ov�a';
   'O':Result:='odbory';
   'S':Result:='staveb.sporenie';
   'Y':Result:='p��i�ky';
   'X':Result:='in�';
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
{ 1. Rok je priestupn�, ak je delite�n� ��slom 4 (ka�d� �tvrt� rok), ale
  2. Rok nie je priestupn�, ak je delite�n� ��slom 100 (v�etky roky koncov storo��), ale
  3. Rok je priestupn�, aj je delite�n� ��slom 400 (ka�d� �tvrt� rok konca storo�ia).
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
    Title:='V�ber s�boru';
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
    Title:='V�ber s�boru';
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
//Recupera Lista de Configura�o~es
Session.GetConfigParams( Path, '', Lista );
//Verifica na lista, onde a chave modificada se encontra
For KI := 0 to ( Lista.Count - 1 ) do begin
if Pos( UpperCase( Chave ), UpperCase( Lista[KI] ) ) <> 0 then begin
Lista[KI] := UpperCase( Chave ) + '=' + Valor;
//Salva o atual modo de configura�a~o da vari�vel de sessa~o
cfgMode := Session.ConfigMode;
//Coloca em modo de altera�a~o
Session.ConfigMode := cmPersistent;
//Cria lista de par�metros
ParamList := TParamList.Create( Lista );
//Chama API do BDE para modificar as configura�o~es
Check( DbiCfgModifyRecord( nil, PChar( Path ), ParamList.FieldCount,
PFLDDesc( ParamList.FieldDescs ), ParamList.Buffer ) );
//Recupera o modo de configura�a~o da vari�vel de sessa~o
Session.ConfigMode := cfgMode;
//Salva as configura�o~es da sessa~o
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
