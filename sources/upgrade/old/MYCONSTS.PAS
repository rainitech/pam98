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
  'Moment�lne pou��vate DEMO verziu programu PAM98. '+
  'V�platn� obdobie pre sk��obn� prev�dzku programu ' +
  'bolo ur�en� na v�platn� mesiace janu�r a� j�n roku 1998.';
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
SMyAppTerminate='Naozaj ukon�i� aplik�ciu PAM98 ?';
SMyAppZlyhanieDB='Nepodarilo sa otvori� s�bor %s';
SMyAppLimitExceeded=
  '�al�iu v�platu v tomto mesiaci nie je mo�n� prida�. '+
  'T�to verzia programu umo��uje v jednom mesiaci vytvori� maxim�lne %s v�plat';
SMyAppDataNotFound='Program nena�iel ani jednu datab�zu.';
SMyAppUserWantInsert='Prida� nov� z�znam ?';
SMyAppStopUserWantInsert='Prid�vanie z�znamu bolo zastaven�.';
SMyAppReportInitFailed='Nepodarilo sa inicializova� tla�ov� zostavu.';
SMyAppReportShowFailed='Nastala chyba pri vytv�ran� tla�ovej zostavy.';
xSMyAppRunningOnlyWithBigFirm='T�to funkcia je pou�ite�n� iba pre ve�k� z�vod.';
SMyAppOnlyHalfValueAllowed='Desatinn� �as� nesmie by� in� ako 0.5 !!!';
SMyAppXenon98NaozajSpustit=
  '�el�te si spusti� export �dajov do s�boru pre program Xenon 98 ?';
SMyAppXenon98Hotovo=
  'Export je ukon�en�. Exportovan� �daje boli ulo�en� do s�boru %s.';
SMyAppRunZalohovanie=
  'Z�lohovanie �dajov do s�boru %s.'+#10#13+
  'Spustenie z�lohovania sp�sob� zatvorenie datab�z. Nesk�r ich '+
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
SMyAppIbaMultiverzia=
 'Prevedenie pr�slu�nej oper�cie je mo�n� iba v multiverzii programu.';
SMyAppUcastNaPoisteniInvalid=
'Nespr�vna hodnota. Povolen� hodnoty s� 0(nie),1(�no),2(iba zamestnanec) a 3(iba zamestn�vate�).';
SMyAppChybaHlavickaHP=
'Najsk�r je potrebn� zada� hlavi�ku hromadn�ho pr�kazu.';
SMyAppOtazkaGenerujHP=
'�el�te si spusti� generovanie hromadn�ho pr�kazu pod�a v�plat za %s ?';
SMyAppGenerujHPNotSelected=
  'Nevybrali ste �iadnu �as� hromadn�ho pr�kazu. Generovanie bolo zru�en�.';
SMyAppPriznakUctovatInvalid=
'Nespr�vna hodnota. Povolen� hodnoty s� 0(nie) a 1(�no).';
SMyAppCreateFileFailed=
 'Nepodarilo sa vytvori� s�bor %s. Skontrolujte, �i s�bor s uveden�m menom nepou��va in� aplik�cia.';
SMyAppFileCreated=
 'S�bor %s bol �spe�ne vytvoren�. Tento s�bor je mo�n� otvori� v Exceli.';
SMyAppRunExcel=
 '�el�te si otvori� vytvoren� s�bor v Exceli ?';
{--}
SMyCisDeleteQuestion='Vymaza� polo�ku ?';
SMyCisDeleteStopped='Vymazanie polo�ky bolo zastaven�';
SMyCisDeleteNotAllowed='Vymazanie polo�ky nie je dovolen�';
SMyCisKeyViolation='Key violation.';
SMyCisDuplicitnyZaznam='Duplicitn� z�znam.';
SMyCisInsertNotAllowed='Pridanie polo�ky nie je dovolen�';
SMyCisInstituciaNotValid=
 'Nespr�vna hodnota. Povolen� hodnoty s� D(da�ov� �rad),S(soc.pois�ov�a),U(�rad pr�ce) a Z(zdrav.pois�ov�a)';
{--}
SMyHsvPocetZauctovanych=
 'Prebehlo hromadn� spracovanie v�plat. Po�et spracovan�ch v�plat %d.';
SMyHsvOtazkaSpustit=
 'Chcete spusti� za��tovanie v�plat v mesiaci %s';
SMyHsvOtazkaUkoncit=
 'Prajete si ukon�i� hromadn� spracovanie v�plat ?';
{--}
SMyRepExecError='Nepodarilo sa inicializova� tla�ov� zostavu';
SMyRepNotFoundVP='V zadanom mesiaci neexistuj� v�platn� p�sky';
{--}
SMyRzpUzExistuje='Ro�n� z��tovanie dane u� bolo uroben�';
SMyRzpVymazatZuctovanie='Vymaza� ro�n� z��tovanie dane ?';
SMyRzpBudeDefinitivneZrusene='Ro�n� z��tovanie dane bude definit�vne zru�en� ?';
SMyRzpVymazanieBoloZastavene='Vymazanie ro�n�ho z��tovania dane bolo zastaven�';
{--}
SMyVypUzExistuje='V�plata u� bola uroben�';
SMyVypVymazatVyplatu='Vymaza� v�platu ?';
SMyVypBudeDefinitivneZrusena='V�plata bude definit�vne zru�en� ?';
SMyVypVymazanieBoloZastavene='Vymazanie v�platy bolo zastaven�';
SMyVypNedovolenyHrubyPrijem=
  'Nie je mo�n� pou�i� osobitn� sadzbu dane %s ak hrub� pr�jem presahuje sumu %s Sk';
SMyVypOdpracDniTrebaVyplnit=
  'Polo�ka po�et odpracovan�ch dn� mus� by� vyplnen�.';
SMyVypOdpracHodinyTrebaVyplnit=
  'Polo�ka po�et odpracovan�ch hod�n mus� by� vyplnen�.';
SMyVypTlacHPNotSelected=
  'Nevybrali ste tla� �iadnej �asti hromadn�ho pr�kazu. Tla� bola zru�en�.';
SMyVypMesiaceTrebaVyplnit=
  'Polo�ka po�et mesiacov, za ktor� sa vypl�ca jednor�zov� mzda mus� by� vyplnen�.';
SMyVypTypPremiiInvalid=
'Nespr�vna hodnota. Povolen� hodnoty s� 0(individ.v��ka),1(percent.v��ka a 2(hodinov� sadzba).';
{--}
SMyZamUzExistuje='Osobn� ��slo %s je obsaden�, mus�te zada� ��slo, ktor� e�te nebolo pridelen�';
SMyZamNeexistuje='Osobn� ��slo %s zatia� nebolo nikomu pridelen�';
SMyZamPrihlasenie='Osobn� ��slo %s nem� pr�vo prihl�si� sa do syst�mu';
SMyZamNotFound='Nie je vybrat� zamestnanec';
SMyZamZleHeslo='Nespr�vne heslo';
SMyZamZleStareHeslo='Nespr�vne star� heslo';
SMyZamNerovnakeHesla='Nov� heslo 1 a nov� heslo 2 musia by� zhodn�';
SMyZamUkoncenyPomer='Pracovn�k ukon�il pracovn� pomer %s. Jeho v�platy nie je mo�n� meni�.';
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

SMyZamNemozeMatObidve=
 'Hodnotenie pracovn�ka m��e by� uskuto�nen� bu� dohodnutou v��kou mesa�n�ho platu '+
 'alebo hodinovou sadzbou. Pou�i� s��asne obidve nie je mo�n�.';
SMyZamSidNotFound=
 'Stredisko s uveden�m ��slom nie je zadefinovan� v ��seln�ku stred�sk.';
SMyZamMusiBytRovnakeObdobie=
 'Nepr�tomnos� mus� za��na� aj kon�i� v tom istom mesiaci, inak sa mus� rozdeli� do viacer�ch z�znamov.';
SMyZamPrekrocenyPocetPracDni=
 'Pr�li� ve�k� po�et pracovn�ch dn� v uvedenom obdob�. Maxim�lny po�et dn�, ktor� je mo�n� zada� : %s.';
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
   'S':if pohl='M' then Result:='slobodn�' else
       if pohl='Z' then Result:='slobodn�' else
                        Result:='slobodn�(�)';
   'Z':if pohl='M' then Result:='�enat�' else
       if pohl='Z' then Result:='vydat�' else
                        Result:='�enat�(vydat�)';
   'V':if pohl='M' then Result:='vdovec' else
       if pohl='Z' then Result:='vdova' else
                        Result:='vdovec(vdova)';
   'R':if pohl='M' then Result:='rozveden�' else
       if pohl='Z' then Result:='rozveden�' else
                        Result:='rozveden�(�)';
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
   'D':Result:='Da�ov� �rad - preddavky';
   'E':Result:='Da�ov� �rad - zr�ky';
   'F':Result:='Da�ov� �rad - ro�n� vyrovnanie';
   'S':Result:='Soci�lna pois�ov�a';
   'U':Result:='�rad pr�ce';
   'Z':Result:='Zdrav.pois�.�.'+IntToStr(kod);
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
