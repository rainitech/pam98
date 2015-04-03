unit MyConsts;

interface

uses
IniFiles,
MyOtazka,
SysUtils,
Windows,
Forms;

type
EMyError = class(Exception);

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

const
  MenoTlacDir='excel';
  MenoTlacCsv='zostava';
  MenoTlacSlk='zostava';
  MyDbPassword='34566%YKF!=?N)&';
  MyVerzia='Verzia 2.30.';
  IdVerzia='PRIVATE-PROGRAM-VERSION:2.30';
  MyDbVerzia=230;
  PoiPlatiZam=[1,2];
  PoiPlatiFir=[1,3];

  MenoZaloznehoBatu='zaloha.bat';

  Alias_Common = 'PAM98_COMM';
  Alias_Data   = 'PAM98_DATA';
  Alias_Private= 'PAM98_PRIV';

  Demo_Rok: word = 1998;
  Demo_Mesiace: set of byte = [1,2,3,4,5,6];
  {I designed my form in 1024x768 mode.}
  DesignScreenWidth: LongInt = 1024;
  DesignScreenHeight: LongInt = 768;

  SetOf_InstituciaValid=['D','S','U','Z'];

  {Smer zaokruhlovania}
  Sm_hore=0;
  Sm_dole=1;
  Sm_normal=2;
  Sm_bez=3;

resourcestring

SMyAppSkratenyNazov=
  'PAM98';
SMyAppInvalidObdobie4Demo=
  'Moment·lne pouûÌvate DEMO verziu programu PAM98. '+
  'V˝platnÈ obdobie pre sk˙öobn˙ prev·dzku programu ' +
  'bolo urËenÈ na v˝platnÈ mesiace janu·r aû j˙n roku 1998.';
SMyAppNewPasswordNotSame=
  'Nespr·vne zadanÈ novÈ heslo, nezhoduje sa s kontrolnou hodnotou.';
SMyAppInvalidPassword='Nespr·vny vstupn˝ kÛd.';
SMyAppPasswordSuccesfullyChanged='VstupnÈ heslo bolo ˙speöne zmenenÈ.';
SMyAppPasswordNotChanged=
   'Heslo nebolo zmenenÈ.';
SMyAppInvalidLogin=
  'Program bude ukonËen˝, pretoûe nebol ˙speöne prihl·sen˝ opr·vnen˝ '+
  'pouûÌvateæ programu.';
SMyAppInvalidLonginteger='Nespr·vna ËÌseln· hodnota.';
SMyAppNotRegistered=
  'Program bude ukonËen˝, pretoûe nebol riadne zaregistrovan˝. '+
  'Opr·vnen˝ pouûÌvateæ programu musÌ zadaù registraËn˝ kÛd.';
SMyAppInvalidRegKey='Chybn˝ registraËn˝ kÛd';
SMyAppMocVelaPokusov='PrekroËen˝ maxim·lny poËet pokusov.';
SMyAppZlePredcislo='PredËÌslo nevyhovuje kontrole na modulo 11';
SMyAppZleAbo='»Ìslo ˙Ëtu nevyhovuje kontrole na modulo 11';
SMyAppCannotEdit='Neexistuje z·znam pre vykonanie opravy';
SMyAppEditMode='NajskÙr je potrebnÈ dokonËiù spracovanie zmien';
SMyAppTerminate='Naozaj ukonËiù aplik·ciu PAM98 ?';
SMyAppZlyhanieDB='Nepodarilo sa otvoriù s˙bor %s';
SMyAppLimitExceeded=
  'œalöiu v˝platu v tomto mesiaci nie je moûnÈ pridaù. '+
  'T·to verzia programu umoûÚuje v jednom mesiaci vytvoriù maxim·lne %s v˝plat';
SMyAppDataNotFound='Program nenaöiel ani jednu datab·zu.';
SMyAppUserWantInsert='Pridaù nov˝ z·znam ?';
SMyAppStopUserWantInsert='Prid·vanie z·znamu bolo zastavenÈ.';
SMyAppReportInitFailed='Nepodarilo sa inicializovaù tlaËov˙ zostavu.';
SMyAppReportShowFailed='Nastala chyba pri vytv·ranÌ tlaËovej zostavy.';
xSMyAppRunningOnlyWithBigFirm='T·to funkcia je pouûiteæn· iba pre veæk˝ z·vod.';
SMyAppOnlyHalfValueAllowed='Desatinn· Ëasù nesmie byù in· ako 0.5 !!!';
SMyAppXenon98NaozajSpustit=
  'éel·te si spustiù export ˙dajov do s˙boru pre program Xenon 98 ?';
SMyAppXenon98Hotovo=
  'Export je ukonËen˝. ExportovanÈ ˙daje boli uloûenÈ do s˙boru %s.';
SMyAppRunZalohovanie=
  'Z·lohovanie ˙dajov do s˙boru %s.'+#10#13+
  'Spustenie z·lohovania spÙsobÌ zatvorenie datab·z. NeskÙr ich '+
  'mÙûete otvoriù cez menu "V˝ber firmy".'+#10#13+
  'PokraËovaù ?';
SMyAppVlozDisketu=
  #10#13'ProsÌm vloûte disketu do mechaniky %s.'+#10#13+
  'PokraËovaù ?';
SMyAppIbaJednoStredisko=
  'V ËÌselnÌku stredÌsk nie s˙ zadefinovanÈ aspoÚ 2 stredisk·, preto '+
  'nie je moûnÈ zmeniù stredisko.';
SMyAppNesuhlasDatumovehoIntervalu=
  '"D·tum do" musÌ byù v‰ËöÌ ako "d·tum od".';
SMyAppOtazkaZrusitRegistraciu=
 'ZruöenÌm registr·cie programu sa program ukonËÌ.'#13+
 'Pri novom spustenÌ program budete potrebovaù nov˝ registraËn˝ kÛd.'#13+
 'Zruöiù registr·ciu programu ?';
SMyAppOtazkaNaozajZrusit=
 'Naozaj zruöiù %s ?'; 
SMyAppRegistraciaZrusena=
 'Registr·cia programu bola zruöen·. Program bude ukonËen˝.'; 
SMyAppRegistraciaNejdeZrusit=
 'Registr·cia nemÙûe byù zruöen·. Program nie je zaregistrovan˝.';
SMyAppPridanieFirmyUspech=
 'Pridanie novej firmy bolo ˙speönÈ. PoradovÈ ËÌslo novej firmy je %d.';
SMyApppridanieFirmyNeuspech=
 'Chyba pri prid·vanÌ novej firmy.';
SMyAppZrusenieFirmyPopis=
 'Upozornenie! Vöetky ˙daje firmy %s bud˙ nen·vratne vymazanÈ ! PokraËovaù ?';
SMyAppZrusenieFirmyUspech=
 'Zruöenie firmy %s prebehlo ˙speöne.';
SMyAppZrusenieFirmyNeuspech=
 'Chyba pri ruöenÌ firmy %s.';
SMyAppZrusenieFirmyOtvorena=
 'Nie je moûnÈ zruöiù otvoren˙ firmu.';
SMyAppIbaMultiverzia=
 'Prevedenie prÌsluönej oper·cie je moûnÈ iba v multiverzii programu.';
SMyAppUcastNaPoisteniInvalid=
'Nespr·vna hodnota. PovolenÈ hodnoty s˙ 0(nie),1(·no),2(iba zamestnanec) a 3(iba zamestn·vateæ).';
SMyAppChybaHlavickaHP=
'NajskÙr je potrebnÈ zadaù hlaviËku hromadnÈho prÌkazu.';
SMyAppOtazkaGenerujHP=
'éel·te si spustiù generovanie hromadnÈho prÌkazu podæa v˝plat za %s ?';
SMyAppGenerujHPNotSelected=
  'Nevybrali ste ûiadnu Ëasù hromadnÈho prÌkazu. Generovanie bolo zruöenÈ.';
SMyAppPriznakUctovatInvalid=
'Nespr·vna hodnota. PovolenÈ hodnoty s˙ 0(nie) a 1(·no).';
SMyAppCreateFileFailed=
 'Nepodarilo sa vytvoriù s˙bor %s. Skontrolujte, Ëi s˙bor s uveden˝m menom nepouûÌva in· aplik·cia.';
SMyAppFileCreated=
 'S˙bor %s bol ˙speöne vytvoren˝. Tento s˙bor je moûnÈ otvoriù v Exceli.';
SMyAppRunExcel=
 'éel·te si otvoriù vytvoren˝ s˙bor v Exceli ?';
{--}
SMyCisDeleteQuestion='Vymazaù poloûku ?';
SMyCisDeleteStopped='Vymazanie poloûky bolo zastavenÈ';
SMyCisDeleteNotAllowed='Vymazanie poloûky nie je dovolenÈ';
SMyCisKeyViolation='Key violation.';
SMyCisDuplicitnyZaznam='Duplicitn˝ z·znam.';
SMyCisInsertNotAllowed='Pridanie poloûky nie je dovolenÈ';
SMyCisInstituciaNotValid=
 'Nespr·vna hodnota. PovolenÈ hodnoty s˙ D(daÚov˝ ˙rad),S(soc.poisùovÚa),U(˙rad pr·ce) a Z(zdrav.poisùovÚa)';
{--}
SMyHsvPocetZauctovanych=
 'Prebehlo hromadnÈ spracovanie v˝plat. PoËet spracovan˝ch v˝plat %d.';
SMyHsvOtazkaSpustit=
 'Chcete spustiù za˙Ëtovanie v˝plat v mesiaci %s';
SMyHsvOtazkaUkoncit=
 'Prajete si ukonËiù hromadnÈ spracovanie v˝plat ?';
{--}
SMyRepExecError='Nepodarilo sa inicializovaù tlaËov˙ zostavu';
SMyRepNotFoundVP='V zadanom mesiaci neexistuj˙ v˝platnÈ p·sky';
{--}
SMyRzpUzExistuje='RoËnÈ z˙Ëtovanie dane uû bolo urobenÈ';
SMyRzpVymazatZuctovanie='Vymazaù roËnÈ z˙Ëtovanie dane ?';
SMyRzpBudeDefinitivneZrusene='RoËnÈ z˙Ëtovanie dane bude definitÌvne zruöenÈ ?';
SMyRzpVymazanieBoloZastavene='Vymazanie roËnÈho z˙Ëtovania dane bolo zastavenÈ';
{--}
SMyVypUzExistuje='V˝plata uû bola uroben·';
SMyVypVymazatVyplatu='Vymazaù v˝platu ?';
SMyVypBudeDefinitivneZrusena='V˝plata bude definitÌvne zruöen· ?';
SMyVypVymazanieBoloZastavene='Vymazanie v˝platy bolo zastavenÈ';
SMyVypNedovolenyHrubyPrijem=
  'Nie je moûnÈ pouûiù osobitn˙ sadzbu dane %s ak hrub˝ prÌjem presahuje sumu %s Sk';
SMyVypOdpracDniTrebaVyplnit=
  'Poloûka poËet odpracovan˝ch dnÌ musÌ byù vyplnen·.';
SMyVypOdpracHodinyTrebaVyplnit=
  'Poloûka poËet odpracovan˝ch hodÌn musÌ byù vyplnen·.';
SMyVypTlacHPNotSelected=
  'Nevybrali ste tlaË ûiadnej Ëasti hromadnÈho prÌkazu. TlaË bola zruöen·.';
SMyVypMesiaceTrebaVyplnit=
  'Poloûka poËet mesiacov, za ktorÈ sa vypl·ca jednor·zov· mzda musÌ byù vyplnen·.';
SMyVypTypPremiiInvalid=
'Nespr·vna hodnota. PovolenÈ hodnoty s˙ 0(individ.v˝öka),1(percent.v˝öka a 2(hodinov· sadzba).';
{--}
SMyZamUzExistuje='OsobnÈ ËÌslo %s je obsadenÈ, musÌte zadaù ËÌslo, ktorÈ eöte nebolo pridelenÈ';
SMyZamNeexistuje='OsobnÈ ËÌslo %s zatiaæ nebolo nikomu pridelenÈ';
SMyZamPrihlasenie='OsobnÈ ËÌslo %s nem· pr·vo prihl·siù sa do systÈmu';
SMyZamNotFound='Nie je vybrat˝ zamestnanec';
SMyZamZleHeslo='Nespr·vne heslo';
SMyZamZleStareHeslo='Nespr·vne starÈ heslo';
SMyZamNerovnakeHesla='NovÈ heslo 1 a novÈ heslo 2 musia byù zhodnÈ';
SMyZamUkoncenyPomer='PracovnÌk ukonËil pracovn˝ pomer %s. Jeho v˝platy nie je moûnÈ meniù.';
SMyZamVymazatPracovnika='Vymazaù zamestnanca ?';
SMyZamBudeDefinitivneZruseny='Zamestnanec bude definitÌvne zruöen˝ ?';
SMyZamVymazanieBoloZastavene='Vymazanie zamestnanca bolo zastavenÈ';
SMyZamMaUrobeneVyplaty=
  'Zamestnanca nie je moûnÈ zmazaù dovtedy, pok˝m nie s˙ vymazanÈ jeho v˝platy. '+
  'Ak skonËil pracovn˝ pomer zamestnanca, staËÌ nastaviù poloûku "D·tum ukonËenia",'+
  'nepouûÌva sa voæba vymazanie zamestnanca';
SMyZamPohlavieNotValid='Nespr·vna hodnota. PovolenÈ hodnoty s˙ M(muû) a Z(ûena).';
SMyZamVojakNotValid='Nespr·vna hodnota. PovolenÈ hodnoty s˙ A(vojak) a N(nevojak).';
SMyZamRodStavNotValid='Nespr·vna hodnota. PovolenÈ hodnoty s˙ S(slobodn˝),Z(ûenat˝),R(rozveden˝) a V(vdovec).';
SMyZamFzUvazokNotValid='Nespr·vna hodnota. PovolenÈ hodnoty s˙ 0,1,2 a 3';
SMyZamFzTypZamNotValid='Nespr·vna hodnota. PovolenÈ hodnoty s˙ O(ostatnÌ),Z(obËan so ZPS) a D(dÙchodca).';
SMyZamTypZrazkyNotValid='Nespr·vna hodnota. PovolenÈ hodnoty s˙ P(poisùovÚa),O(odbory),Y(pÙûiËky),S(staveb.sporenie) a X(inÈ).';
SMyZamNemozeBytZtpBezZps='NajskÙr je potrebnÈ nastaviù zmenen˙ pracovn˙ schopnosù.';

SMyZamNemozeMatObidve=
 'Hodnotenie pracovnÌka mÙûe byù uskutoËnenÈ buÔ dohodnutou v˝ökou mesaËnÈho platu '+
 'alebo hodinovou sadzbou. Pouûiù s˙Ëasne obidve nie je moûnÈ.';
SMyZamSidNotFound=
 'Stredisko s uveden˝m ËÌslom nie je zadefinovanÈ v ËÌselnÌku stredÌsk.';
SMyZamMusiBytRovnakeObdobie=
 'NeprÌtomnosù musÌ zaËÌnaù aj konËiù v tom istom mesiaci, inak sa musÌ rozdeliù do viacer˝ch z·znamov.';
SMyZamPrekrocenyPocetPracDni=
 'PrÌliö veæk˝ poËet pracovn˝ch dnÌ v uvedenom obdobÌ. Maxim·lny poËet dnÌ, ktor˝ je moûnÈ zadaù : %s.';
function  StrToChar(Const S: String): Char;
function  MyPassword(Const S: String): String;
procedure MyMessage(Const S: String);
procedure MyWarning(const S:String);
procedure MyError(const S:String);
function  MyOtazka(const S: String):Boolean;
function  Mesiac(i:integer;up:boolean):string;
function  ZAOKRUHLI(X:double;J,S:integer):Double;
function  RODINNY_STAV(stav,pohl:char):string;
function  TEXT_POHLAVIE(pohl:char):string;
function  TEXT_VOJAK(pomer:char):string;
function  TEXT_FZ_UVAZOK(uvazok:char):string;
function  TEXT_FZ_TYPZAM(typ: char):string;
function  TEXT_TYP_PREMII(typ: integer):string;
function  TEXT_TYP_PRIPLATKOV(typ: integer):string;
function  StrToLongint(const S:string):longint;
function  LPAD(Const S:string;N:byte;C:char):string;
function  Kontrola_predcisla(Const s:string):boolean;
function  Kontrola_ABO(Const s:string):boolean;
function  RegGetStr( sKey, sItem, sDefVal : string ) : string;
procedure RegSetStr( sKey, sItem, sVal : string );
function  GetVolumeInfo(Root:String; var vi:TVolumeInfo): Boolean;
function  GetVolumeSerialNumber: string;
function  GenerateKey:string;
function  NVL(const S:string):string;
procedure Nastav_Farbu(F:TForm);
function  TYP_PRIPL_TO_STRING(typ: byte): string;
function  TYP_PRIPL_TO_BYTE(typ: string): byte;
function  TYP_PRIPL2_TO_STRING(typ: byte): string;
function  TYP_PRIPL2_TO_BYTE(typ: string): byte;
function  TEXT_INSTITUCIE(typ:string;kod:integer):string;
function LongCisloU(const predc,cislo:string):string;

var MyAppPath:string[128];
    MyNetPath:string[128];
    MyCommPth:string[128];
    MyDataPth:string[128];
    MyPrivPth:string[128];
    MyPamPath:string[128];
    MyBkpPath:string[128];
    MyIniFile:TIniFile;
    MyCaption:string[128];
    MyStatus:string[64];

implementation

uses
  Messages, Classes, Graphics, Controls, Dialogs,
  Grids, DBGrids, DBCtrls, StdCtrls, ExtCtrls, Buttons, Tabs,
  ComCtrls,Registry;

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
  Application.MessageBox(@S[1],'Inform·cia',
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
begin
  FormMyOtazka:=TFormMyOtazka.Create(Application);
  FormMyOtazka.StaticText1.Caption:=S;
  MyOtazka:=FormMyOtazka.ShowModal=mrYes;
  FormMyOtazka.Free;
end;

function Mesiac(i:integer;up:boolean):string;
var s:string;
begin
  case i of
   1:if up then s:='JANU¡R'    else s:='janu·r';
   2:if up then s:='FEBRU¡R'   else s:='febru·r';
   3:if up then s:='MAREC'     else s:='marec';
   4:if up then s:='APRÕL'     else s:='aprÌl';
   5:if up then s:='M¡J'       else s:='m·j';
   6:if up then s:='J⁄N'       else s:='j˙n';
   7:if up then s:='J⁄L'       else s:='j˙l';
   8:if up then s:='AUGUST'    else s:='august';
   9:if up then s:='SEPTEMBER' else s:='september';
  10:if up then s:='OKT”BER'   else s:='oktÛber';
  11:if up then s:='NOVEMBER'  else s:='november';
  12:if up then s:='DECEMBER'  else s:='december';
  end;
  Result:=s;
end;

function ZAOKRUHLI(X:double;J,S:integer):double;
{
  S=0 hore
  S=1 dole
  S=2 normal
  S=3 bez
}
var i,D:integer;
begin
  X:= Int(X*10000)/10000;
  D:=1;
  for i:=1 to abs(J) do D:=D*10;
  if j>=0 then X:=X/D else X:=X*D;
  if S=0 then begin
    if Frac(X)<>0 then begin
      if X<0
      then X:=Trunc(X)-1
      else X:=Trunc(X)+1
    end;
  end else
  if S=1 then X:=Trunc(X) else
  if S=2 then X:=Round(X);
  if j>=0 then X:=X*D else X:=X/D;
  ZAOKRUHLI:=X;
end;

function  RODINNY_STAV(stav,pohl:char):string;
begin
  case stav of
   'S':if pohl='M' then Result:='slobodn˝' else
       if pohl='Z' then Result:='slobodn·' else
                        Result:='slobodn˝(·)';
   'Z':if pohl='M' then Result:='ûenat˝' else
       if pohl='Z' then Result:='vydat·' else
                        Result:='ûenat˝(vydat·)';
   'V':if pohl='M' then Result:='vdovec' else
       if pohl='Z' then Result:='vdova' else
                        Result:='vdovec(vdova)';
   'R':if pohl='M' then Result:='rozveden˝' else
       if pohl='Z' then Result:='rozveden·' else
                        Result:='rozveden˝(·)';
   else Result:='';
  end;
end;

function  TEXT_POHLAVIE(pohl:char):string;
begin
  case pohl of
   'M': Result:='muû';
   'Z': Result:='ûena';
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
   '0': Result:='in˝';
   '1': Result:='pln˝';
   '2': Result:='poloviËn˝';
   '3': Result:='menej ako poloviËn˝';
  else  Result:='';
  end;
end;

function  TEXT_FZ_TYPZAM(typ: char):string;
begin
  case typ of
   'O': Result:='ostatnÌ';
   'Z': Result:='obËan so ZPS';
   'D': Result:='dÙchodca';
  else  Result:='';
  end;
end;

function  TEXT_TYP_PREMII(typ: integer):string;
begin
  case typ of
   0: Result:='individu·lna v˝öka';
   1: Result:='percentu·lna sadzba';
   2: Result:='hodinov· sadzba';
  else  Result:='';
  end;
end;

function  TEXT_TYP_PRIPLATKOV(typ: integer):string;
begin
  case typ of
   0: Result:='percentu·lna';
   1: Result:='hodinov·';
  else  Result:='';
  end;
end;

function  StrToLongint(const S:string):longint;
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
  if not Result then raise EMyError.Create(SMyAppZlePredcislo);
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
  if not Result then raise EMyError.Create(SMyAppZleAbo);
end;

function  RegGetStr( sKey, sItem, sDefVal : string ) : string;
var reg:TRegIniFile;
begin
  reg := TRegIniFile.Create( sKey );
  Result := reg.ReadString( '', sItem, sDefVal );
  reg.Free;
end;

procedure RegSetStr( sKey, sItem, sVal : string );
var reg:TRegIniFile;
begin
  reg := TRegIniFile.Create( sKey );
  reg.WriteString( '', sItem, sVal + #0 );
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

  result := GetVolumeInformation(PChar(Root),
        @bufVolumeName, sizeof(bufVolumeName),
        @sn, mc, flags,
        @bufFSName, sizeof(bufFSName));

  if result then begin
    VolumeName := bufVolumeName;
    VolumeSN := sn;
    MaxComponent := mc;
    FSName := bufFSName;
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

procedure Nastav_Farbu(F:TForm);
var i:integer;c1,c2,c3:longint;
begin with F do begin
try
  c1:=MyIniFile.ReadInteger('COLOR','Pole1',-1);
  c2:=MyIniFile.ReadInteger('COLOR','Pole2',-1);
  c3:=MyIniFile.ReadInteger('COLOR','Pozadie',-1);

  for i:=0 to ComponentCount-1 do
  begin
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
   'D':Result:='DaÚov˝ ˙rad - preddavky';
   'E':Result:='DaÚov˝ ˙rad - zr·ûky';
   'F':Result:='DaÚov˝ ˙rad - roËnÈ vyrovnanie';
   'S':Result:='Soci·lna poisùovÚa';
   'U':Result:='⁄rad pr·ce';
   'Z':Result:='Zdrav.poisù.Ë.'+IntToStr(kod);
   else Result:='';
  end;
end;

function LongCisloU(const predc,cislo:string):string;
begin
  if trim(predc)=''
   then Result:=cislo
    else Result:=predc+'-'+cislo;
end;

begin
  Randomize;
  MyAppPath:=ExtractFilePath(ParamStr(0));
end.
