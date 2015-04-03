unit RexZpTxt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick, UnicodeUtils, FmxUtils, FileCtrl;

procedure RunReportZp514(const MyReportParam: TMyReportParam);
procedure RunReportZp514_Zlucene(const MyReportParam: TMyReportParam);
procedure RunReportZp580(const MyReportParam: TMyReportParam);
procedure RunReportZp580_CSV(const MyReportParam: TMyReportParam);


implementation

uses DM_MAIN, ZP2005VY, ZP2005PR;

var X: TMyReportParam;
 FNameXml: string;
 FPathXml: string;
 FDirZdrav: string;
 F,F1:TextFile;
 MyTxt,MyCsv: AnsiString;
 Zahlavie:array[1..99] of
 record
   vyplnene:boolean;
   kzp:integer;
   identif:string;
 end;
 Telo:
 record
   pocet: integer;
   pocet_kdni: integer;
   prijem: double;
   zaklad: double;
   preddavok_zamtel: double;
   preddavok_zamnec: double;
   {zvyhodneny}
   pocet1: integer;
   pocet_kdni1: integer;
   prijem1: double;
   zaklad1: double;
   preddavok_zamtel1: double;
   preddavok_zamnec1: double;
 end;

procedure CRLF;
begin MyTxt := MyTxt + #13#10; end;

procedure E_TEXT(const iELM:string);
begin MyTxt := MyTxt + iElm + '|'; end;

procedure E_LAST(const iELM:string);
begin MyTxt := MyTxt + iElm; CRLF; end;

procedure CSV_CRLF;
begin MyCsv := MyCsv + #13#10; end;

procedure CSV_TEXT(const iELM:string);
begin MyCsv := MyCsv + iElm + ';'; end;

procedure CSV_LAST(const iELM:string);
begin MyCsv := MyCsv + iElm; CSV_CRLF; end;

{*************************************************************************************
***                               Vytvor 514 jednotlivo                                       ***
*************************************************************************************}
function Vytvor514:AnsiString;
var i,pc,px:integer;
    printband: boolean;
    pom_cislo_platitela:string;
    MyPoctyVsetkyZP:TMyPocty;
begin with DM do begin
  MyTxt := '';
  {--}
  try
  PocetPrihlasenychVsetkyZP(X,MyPoctyVsetkyZP);
  ReportZP2005VY:=TReportZP2005VY.Create(Application);
  ReportZP2005VY.SetX(X);
  ReportZP2005VY.ShowReportStart;
  px:=ReportZP2005VY.Q0_.RecordCount;
  for i:=1 to 99 do Zahlavie[i].vyplnene:=false;
  pc:=0;
  with ZP2005VY.MyOdvody[0],ZP2005VY.MySadzby do begin
    inc(pc);
    Progress(pc * 100 div px);
    Zahlavie[pc].vyplnene:=true;
    Zahlavie[pc].kzp := X.Kod_zp;
    printband:=false;
    ReportZP2005VY.DetailBand1BeforePrint(ReportZP2005VY.DetailBand1,printband);
{
Identifik�cia d�vky

Polo�ka �.	Popis polo�ky	Povinn�	D�tov� typ	D�ka
1.	Charakter d�vky	P	CHAR	1
2.	Typ d�vky	P	INT	3
3.	I�O platite�a / R� / ��slo povolenia na pobyt	P	CHAR	10
4.	��slo platite�a	P	CHAR	10
5.	K�d zdravotnej pois�ovne	P	CHAR	4
6.	D�tum odoslania d�vky	P	DATE	RRRRMMDD
7.	��slo d�vky	P	INT	6
8.	Po�et viet tela d�vky	P	INT	6
9.	Po�et m�di�		INT	3
10.	Poradov� ��slo m�dia		INT	3

Popis polo�iek identifik�cie d�vky:
Charakter d�vky:	N - nov� (prvotn� v�kaz)
	O - opravn� (opravn� v�kaz celkov�)
	A - adit�vna (rozdielov� v�kaz)
Typ d�vky	514
��slo platite�a	��slo pridelen� zdravotnou pois�ov�ou
��slo d�vky	jednozna�n� identifik�tor d�vky platite�a
(poradov� ��slo d�vky)
Po�et m�di�	po�et m�di�, na ktor�ch je d�vka doru�en�
Poradov� ��slo m�dia	poradov� ��slo m�dia (1,2,3,...)

P = povinn� polo�ka

D�tov� typ:		CHAR	- alfanumerick� re�azec
			INT 	- cel� ��slo
			DATE 	- d�tumov� �daj v zadanom tvare
DEC   - desatinn� ��slo, d�ka je vyjadren� v tvare x,y kde x zna�� po�et platn�ch ��slic pred aj za desatinnou bodkou spolu a y ozna�uje po�et platn�ch ��slic za desatinnou bodkou.
Ako odde�ova� v desatinn�ch ��slach sa pou��va bodka.
}
    E_TEXT('N');
    E_TEXT('514'); {typ davky}
    E_TEXT(TINF_ICO.Value);
    pom_cislo_platitela:=CISLO_PLATITELA_ZP(ReportZP2005VY.Q0_KZP.Value);
    E_TEXT(pom_cislo_platitela); {cislo platitela}
    E_TEXT(LPAD(ReportZP2005VY.Q0_KZP.AsString,2,'0') + LPAD(ReportZP2005VY.QCBU_Pobocka_ZP.AsString,2,'0')); {kzp}
    E_TEXT(IntToStr(DateToRRRRMMDD(now)));
    E_TEXT('1'); {cislo davky}
    E_TEXT('%pocet_viet%'); {pocet viet tela davky}
    E_TEXT('');
    E_LAST('');
  {
  1.	veta z�hlavia d�vky obsahuje identifika�n� �daje platite�a
Polo�ka	Popis polo�ky	Povinn�	D�tov� typ	Maxim�lna d�ka
1.	Obdobie	P	INT	6
2.	De� ur�en� na v�platu	P	INT	2
3.	N�zov platite�a	P	CHAR	80
4.	I�O platite�a / R� / ��slo povolenia na pobyt	P	CHAR	10
5.	��slo platite�a	P	CHAR	10
6.	DI�		CHAR	12
7.	Telef�n		CHAR	20
8.	Fax		CHAR	20
9.	Email		CHAR	30
10.	K�d banky platite�a	P	CHAR	4
11.	Pred��slie bankov�ho ��tu		CHAR	6
12.	��slo bankov�ho ��tu	P	INT	10
13.     IBAN

Popis polo�iek 1. vety z�hlavia:
Obdobie	cel� ��slo v tvare RRRRMM
N�zov platite�a	meno a priezvisko alebo n�zov platite�a
��slo platite�a	��slo pridelen� zdravotnou pois�ov�ou
R�	9 alebo 10-miestne rodn� ��slo platite�a ak ide o
	fyzick� osobu (bez lom�tka)
  }
    E_TEXT(IntToStr(X.Obdobie1));
    E_TEXT(IntToStr(TINF_FZ_DEN.Value));
    E_TEXT(TINF_NAZOV.Value);
    E_TEXT(TINF_ICO.Value);
    E_TEXT(pom_cislo_platitela); {cislo platitela}
    E_TEXT(Trim(StrReplaceX(TINF_DIC.Value,'SK','')));
    E_TEXT(TINF_ADR_TELEFON.Value);
    E_TEXT(TINF_ADR_FAX.Value);
    E_TEXT(TINF_ADR_EMAIL.Value);
    E_TEXT(TINF_BANKA_U.Value);
    E_TEXT(TINF_Predcislo_u.Value);
    if X.Obdobie1 >= ZAKON_2014_01 then begin
      E_TEXT(TINF_Cislo_u.Value);
      E_LAST(TINF_IBAN.Value);
    end else
    begin
      E_LAST(TINF_Cislo_u.Value);
    end;
{
2.	veta z�hlavia d�vky obsahuje �daje o poistnom
Polo�ka	Popis polo�ky	Povinn�	D�tov� typ	Maxim�lna d�ka
1.	Po�et zamestnancov prihl�sen�ch do ZP	P	INT	7
2.	SP za zamestnancov bez ZP - zamestn�vate�		DEC	4, 2
3.	SP za zamestnancov bez ZP - zamestnanec		DEC	4, 2
4.	SP za zamestnancov so ZP - zamestn�vate�		DEC	4, 2
5.	SP za zamestnancov so ZP - zamestnanec		DEC	4, 2
6.	Po�et zam. bez ZP, za ktor�ch sa plat� poistn�	P	INT	7
7.	Po�et zam. so ZP, za ktor�ch sa plat� poistn�	P	INT	7
8.	Po�et zapo��tan�ch dn� - zamestnanci bez ZP	P	INT	8
9.	Po�et zapo��tan�ch dn� - zamestnanci so ZP	P	INT	8
10.	Pr�jem celkom - zamestnanci bez ZP		DEC	12, 2
11.	Pr�jem celkom - zamestnanci so ZP		DEC	12, 2
12.	Vymeriavac� z�klad - zamestnanci bez ZP	P	DEC	12, 2
13.	Vymeriavac� z�klad - zamestnanci so ZP	P	DEC	12, 2
14.	Preddavok - zamestnanci bez ZP - zamestn�vate�	P	DEC	12, 2
15.	Preddavok - zamestnanci bez ZP - zamestnanec	P	DEC	12, 2
16.	Preddavok - zamestnanci so ZP - zamestn�vate�	P	DEC	12, 2
17.	Preddavok - zamestnanci so ZP - zamestnanec	P	DEC	12, 2
18.	Preddavok na poistn� celkom	P	DEC	12, 2
19.	Pozn�mka		CHAR	20
20.     Celkov� po�et zam.poisten�ch vo v�etk�ch zdravotn�ch pois�ovniach.  INT 8

Do polo�iek 1. vety z�hlavia d�vky bola pridan� polo�ka �. 20 Celkov� po�et zamestnancov poisten�ch
vo v�etk�ch zdravotn�ch pois�ovniach. Na polo�ku �. 20 sa vz�ahuje prechodn� ustanovenie,
za mesiace m�j a j�n e�te zamestn�vatelia tento �daj povinne uv�dza� nemusia.
V d�vke zasielanej v auguste za j�l je t�to polo�ka u� povinn�.

SP =  sadzba poistn�ho
ZP = zdravotn� postihnutie
Do polo�ky 19 (Pozn�mka) platite� uvedie ozna�enie pr�vnej formy:
FO = fyzick� osoba, PO = pr�vnick� osoba
}
    E_TEXT('%pocet_viet%');
    E_TEXT(Format('%.2f',[DM.TSET_Fz_zdravot.Value]));
    E_TEXT(Format('%.2f',[DM.TSET_F_zdravot.Value]));
    E_TEXT(Format('%.2f',[DM.TSET_Fz_zdravot1.Value]));
    E_TEXT(Format('%.2f',[DM.TSET_F_zdravot1.Value]));
    E_TEXT(IntToStr(pocet));
    E_TEXT(IntToStr(pocet1));
    E_TEXT(IntToStr(pocet_kdni));
    E_TEXT(IntToStr(pocet_kdni1));
    E_TEXT(Format('%.2f',[prijem]));
    E_TEXT(Format('%.2f',[prijem1]));
    E_TEXT(Format('%.2f',[cz_zdravot]));
    E_TEXT(Format('%.2f',[cz_zdravot1]));
    E_TEXT(Format('%.2f',[oz_zdravot]));
    E_TEXT(Format('%.2f',[o_zdravot]));
    E_TEXT(Format('%.2f',[oz_zdravot1]));
    E_TEXT(Format('%.2f',[o_zdravot1]));
    E_TEXT(Format('%.2f',[oz_zdravot+o_zdravot+oz_zdravot1+o_zdravot1]));
    if (X.Obdobie1 < ZAKON_2011_01) then
      E_LAST('')
    else begin
      E_TEXT('');
      E_LAST(IntToStr(MyPoctyVsetkyZP.pocet));
    end;
    Zahlavie[pc].identif:=MyTxt;MyTxt:='';
    ReportZP2005VY.Q0_.Next;
  end;
  ReportZP2005VY.ShowReportEnd;
  finally
  ReportZP2005VY.Free;
  end;
  Progress(100);
{-----------------------------------------------------------}
  try
  ReportZP2005PR:=TReportZP2005PR.Create(Application);
  ReportZP2005PR.SetX(X);
  ReportZP2005PR.ShowReportStart;
  FDirZdrav:='ZP'+IntToStr(X.Kod_ZP);
  CreateDir(FPathXml+FDirZdrav);
  assignfile(F,FPathXML+FDirZdrav+'\'+FNameXML);
  rewrite(F);
  for i:=1 to 99 do
    if (Zahlavie[i].vyplnene) and (Zahlavie[i].kzp=X.kod_zp)
     then begin
       write(F,StrReplaceAll(Zahlavie[i].identif,'%pocet_viet%',IntToStr(ReportZP2005PR.Q01_.RecordCount)));
     end;
  pc:=0;
  px:=ReportZP2005PR.Q00_.RecordCount;
  while not ReportZP2005PR.Q00_.EOF do
  begin
  inc(pc);
  Progress(pc * 100 div px);
{
Veta tela d�vky
Polo�ka	Popis polo�ky	Povinn�	D�tov� typ	D�ka
1.	Poradov� ��slo	P	INT	6
2.	Rodn� ��slo zamestnanca	P	INT	10
3.	Po�et dn�	P	INT	2
4.	Sadzba poistn�ho - zamestn�vate�	P	DEC	4, 2
5.	Sadzba poistn�ho - zamestnanec	P	DEC	4, 2
6.	Pr�jem zamestnanca	P	DEC	12, 2
7.	Vymeriavac� z�klad zamestnanca	P	DEC	12, 2
8.	Preddavok zamestn�vate�	P	DEC	12, 2
9.	Preddavok zamestnanec	P	DEC	12, 2
10.	Preddavok spolu	P	DEC	12, 2
}
  E_TEXT(IntToStr(pc));
  E_TEXT(RC_BEZ(ReportZP2005PR.Q00_Calc_Born_numb.Value));
  E_TEXT(IntToStr(Trunc(ReportZP2005PR.Q00_Calc_Dni_poist.Value)));
  E_TEXT(Format('%.2f',[ReportZP2005PR.Q00_Calc_Fz_zdravot.Value]));
  E_TEXT(Format('%.2f',[ReportZP2005PR.Q00_Calc_F_zdravot.Value]));
  E_TEXT(Format('%.2f',[ReportZP2005PR.Q00_Calc_n_prijem_zp.Value]));
  E_TEXT(Format('%.2f',[ReportZP2005PR.Q00_Calc_n_zaklad_zp.Value]));
  E_TEXT(Format('%.2f',[ReportZP2005PR.Q00_Calc_oz_zdravot.Value]));
  E_TEXT(Format('%.2f',[ReportZP2005PR.Q00_Calc_o_zdravot.Value]));
  E_LAST(Format('%.2f',[ReportZP2005PR.Q00_Calc_oz_zdravot.Value+ReportZP2005PR.Q00_Calc_o_zdravot.Value]));
  write(F,MyTxt);MyTxt:='';
  ReportZP2005PR.Q00_.Next;
  end;
  CloseFile(F);
  ReportZP2005PR.ShowReportEnd;
  finally
  ReportZP2005PR.Free;
  Progress(100);
  end;
{----------------------------------------}
  Result := '';
end;end;


{*************************************************************************************
***                               Vytvor 514 zlucene cez rodne cislo                                       ***
*************************************************************************************}
function Vytvor514_Zlucene:AnsiString;
var i,ii,pc,px:integer;
    printband: boolean;
    pom_cislo_platitela,z1:string;
    MyPoctyVsetkyZP:TMyPocty;
begin with DM do begin
  MyTxt := '';
  {----------------------------------------------------------------}
  try
  PocetPrihlasenychVsetkyZP_Zlucene(X,MyPoctyVsetkyZP);
  ReportZP2005VY:=TReportZP2005VY.Create(Application);
  ReportZP2005VY.SetX(X);
  ReportZP2005VY.ShowReportStart;
  px:=ReportZP2005VY.Q0_.RecordCount;
  for i:=1 to 99 do Zahlavie[i].vyplnene:=false;
  pc:=0;
  with ZP2005VY.MyOdvody[0],ZP2005VY.MySadzby do begin
    inc(pc);
    Progress(pc * 100 div px);
    Zahlavie[pc].vyplnene:=true;
    Zahlavie[pc].kzp := X.Kod_zp;
    printband:=false;
    ReportZP2005VY.DetailBand1BeforePrint(ReportZP2005VY.DetailBand1,printband);
{
Identifik�cia d�vky

Polo�ka �.	Popis polo�ky	Povinn�	D�tov� typ	D�ka
1.	Charakter d�vky	P	CHAR	1
2.	Typ d�vky	P	INT	3
3.	I�O platite�a / R� / ��slo povolenia na pobyt	P	CHAR	10
4.	��slo platite�a	P	CHAR	10
5.	K�d zdravotnej pois�ovne	P	CHAR	4
6.	D�tum odoslania d�vky	P	DATE	RRRRMMDD
7.	��slo d�vky	P	INT	6
8.	Po�et viet tela d�vky	P	INT	6
9.	Po�et m�di�		INT	3
10.	Poradov� ��slo m�dia		INT	3

Popis polo�iek identifik�cie d�vky:
Charakter d�vky:	N - nov� (prvotn� v�kaz)
	O - opravn� (opravn� v�kaz celkov�)
	A - adit�vna (rozdielov� v�kaz)
Typ d�vky	514
��slo platite�a	��slo pridelen� zdravotnou pois�ov�ou
��slo d�vky	jednozna�n� identifik�tor d�vky platite�a
(poradov� ��slo d�vky)
Po�et m�di�	po�et m�di�, na ktor�ch je d�vka doru�en�
Poradov� ��slo m�dia	poradov� ��slo m�dia (1,2,3,...)

P = povinn� polo�ka

D�tov� typ:		CHAR	- alfanumerick� re�azec
			INT 	- cel� ��slo
			DATE 	- d�tumov� �daj v zadanom tvare
DEC   - desatinn� ��slo, d�ka je vyjadren� v tvare x,y kde x zna�� po�et platn�ch ��slic pred aj za desatinnou bodkou spolu a y ozna�uje po�et platn�ch ��slic za desatinnou bodkou.
Ako odde�ova� v desatinn�ch ��slach sa pou��va bodka.
}
    E_TEXT('N');
    E_TEXT('514'); {typ davky}
    E_TEXT(TINF_ICO.Value);
    pom_cislo_platitela:=CISLO_PLATITELA_ZP(ReportZP2005VY.Q0_KZP.Value);
    E_TEXT(pom_cislo_platitela); {cislo platitela}
    E_TEXT(LPAD(ReportZP2005VY.Q0_KZP.AsString,2,'0') + LPAD(ReportZP2005VY.QCBU_Pobocka_ZP.AsString,2,'0')); {kzp}
    E_TEXT(IntToStr(DateToRRRRMMDD(now)));
    E_TEXT('1'); {cislo davky}
    E_TEXT('%pocet_viet%'); {pocet viet tela davky}
    E_TEXT('');
    E_LAST('');
  {
  1.	veta z�hlavia d�vky obsahuje identifika�n� �daje platite�a
Polo�ka	Popis polo�ky	Povinn�	D�tov� typ	Maxim�lna d�ka
1.	Obdobie	P	INT	6
2.	De� ur�en� na v�platu	P	INT	2
3.	N�zov platite�a	P	CHAR	80
4.	I�O platite�a / R� / ��slo povolenia na pobyt	P	CHAR	10
5.	��slo platite�a	P	CHAR	10
6.	DI�		CHAR	12
7.	Telef�n		CHAR	20
8.	Fax		CHAR	20
9.	Email		CHAR	30
10.	K�d banky platite�a	P	CHAR	4
11.	Pred��slie bankov�ho ��tu		CHAR	6
12.	��slo bankov�ho ��tu	P	INT	10
13.     IBAN

Popis polo�iek 1. vety z�hlavia:
Obdobie	cel� ��slo v tvare RRRRMM
N�zov platite�a	meno a priezvisko alebo n�zov platite�a
��slo platite�a	��slo pridelen� zdravotnou pois�ov�ou
R�	9 alebo 10-miestne rodn� ��slo platite�a ak ide o
	fyzick� osobu (bez lom�tka)
  }
    E_TEXT(IntToStr(X.Obdobie1));
    E_TEXT(IntToStr(TINF_FZ_DEN.Value));
    E_TEXT(TINF_NAZOV.Value);
    E_TEXT(TINF_ICO.Value);
    E_TEXT(pom_cislo_platitela); {cislo platitela}
    E_TEXT(Trim(StrReplaceX(TINF_DIC.Value,'SK','')));
    E_TEXT(TINF_ADR_TELEFON.Value);
    E_TEXT(TINF_ADR_FAX.Value);
    E_TEXT(TINF_ADR_EMAIL.Value);
    E_TEXT(TINF_BANKA_U.Value);
    E_TEXT(TINF_Predcislo_u.Value);
    if X.Obdobie1 >= ZAKON_2014_01 then begin
      E_TEXT(TINF_Cislo_u.Value);
      E_LAST(TINF_IBAN.Value);
    end else
    begin
      E_LAST(TINF_Cislo_u.Value);
    end;
{
2.	veta z�hlavia d�vky obsahuje �daje o poistnom
Polo�ka	Popis polo�ky	Povinn�	D�tov� typ	Maxim�lna d�ka
1.	Po�et zamestnancov prihl�sen�ch do ZP	P	INT	7
2.	SP za zamestnancov bez ZP - zamestn�vate�		DEC	4, 2
3.	SP za zamestnancov bez ZP - zamestnanec		DEC	4, 2
4.	SP za zamestnancov so ZP - zamestn�vate�		DEC	4, 2
5.	SP za zamestnancov so ZP - zamestnanec		DEC	4, 2
6.	Po�et zam. bez ZP, za ktor�ch sa plat� poistn�	P	INT	7
7.	Po�et zam. so ZP, za ktor�ch sa plat� poistn�	P	INT	7
8.	Po�et zapo��tan�ch dn� - zamestnanci bez ZP	P	INT	8
9.	Po�et zapo��tan�ch dn� - zamestnanci so ZP	P	INT	8
10.	Pr�jem celkom - zamestnanci bez ZP		DEC	12, 2
11.	Pr�jem celkom - zamestnanci so ZP		DEC	12, 2
12.	Vymeriavac� z�klad - zamestnanci bez ZP	P	DEC	12, 2
13.	Vymeriavac� z�klad - zamestnanci so ZP	P	DEC	12, 2
14.	Preddavok - zamestnanci bez ZP - zamestn�vate�	P	DEC	12, 2
15.	Preddavok - zamestnanci bez ZP - zamestnanec	P	DEC	12, 2
16.	Preddavok - zamestnanci so ZP - zamestn�vate�	P	DEC	12, 2
17.	Preddavok - zamestnanci so ZP - zamestnanec	P	DEC	12, 2
18.	Preddavok na poistn� celkom	P	DEC	12, 2
19.	Pozn�mka		CHAR	20
20.     Celkov� po�et zam.poisten�ch vo v�etk�ch zdravotn�ch pois�ovniach.  INT 8

Do polo�iek 1. vety z�hlavia d�vky bola pridan� polo�ka �. 20 Celkov� po�et zamestnancov poisten�ch
vo v�etk�ch zdravotn�ch pois�ovniach. Na polo�ku �. 20 sa vz�ahuje prechodn� ustanovenie,
za mesiace m�j a j�n e�te zamestn�vatelia tento �daj povinne uv�dza� nemusia.
V d�vke zasielanej v auguste za j�l je t�to polo�ka u� povinn�.

SP =  sadzba poistn�ho
ZP = zdravotn� postihnutie
Do polo�ky 19 (Pozn�mka) platite� uvedie ozna�enie pr�vnej formy:
FO = fyzick� osoba, PO = pr�vnick� osoba
}
    E_TEXT('%pocet_viet%');
    E_TEXT(Format('%.2f',[DM.TSET_Fz_zdravot.Value]));
    E_TEXT(Format('%.2f',[DM.TSET_F_zdravot.Value]));
    E_TEXT(Format('%.2f',[DM.TSET_Fz_zdravot1.Value]));
    E_TEXT(Format('%.2f',[DM.TSET_F_zdravot1.Value]));
    E_TEXT('%pocet%');
    E_TEXT('%pocet1%');
    E_TEXT('%pocet_kdni%');
    E_TEXT('%pocet_kdni1%');
    E_TEXT('%prijem%');
    E_TEXT('%prijem1%');
    E_TEXT('%zaklad%');
    E_TEXT('%zaklad1%');
    E_TEXT('%preddavok_zamtel%');
    E_TEXT('%preddavok_zamtel1%');
    E_TEXT('%preddavok_zamnec%');
    E_TEXT('%preddavok_zamnec1%');
    E_TEXT('%preddavok_spolu%');
(*
    E_TEXT(IntToStr(pocet));
    E_TEXT(IntToStr(pocet1));
    E_TEXT(IntToStr(pocet_kdni));
    E_TEXT(IntToStr(pocet_kdni1));
    E_TEXT(Format('%.2f',[prijem]));
    E_TEXT(Format('%.2f',[prijem1]));
    E_TEXT(Format('%.2f',[cz_zdravot]));
    E_TEXT(Format('%.2f',[cz_zdravot1]));
    E_TEXT(Format('%.2f',[oz_zdravot]));
    E_TEXT(Format('%.2f',[o_zdravot]));
    E_TEXT(Format('%.2f',[oz_zdravot1]));
    E_TEXT(Format('%.2f',[o_zdravot1]));
    E_TEXT(Format('%.2f',[oz_zdravot+o_zdravot+oz_zdravot1+o_zdravot1]));
*)
    if (X.Obdobie1 < ZAKON_2011_01) then
      E_LAST('')
    else begin
      E_TEXT('');
      E_LAST(IntToStr(MyPoctyVsetkyZP.pocet));
    end;
    Zahlavie[pc].identif:=MyTxt;MyTxt:='';
    ReportZP2005VY.Q0_.Next;
  end;
  ReportZP2005VY.ShowReportEnd;
  finally
  ReportZP2005VY.Free;
  end;
  Progress(100);
{-----------------------------------------------------------}
  try
  ReportZP2005PR:=TReportZP2005PR.Create(Application);
  ReportZP2005PR.SetX(X);
  ReportZP2005PR.ShowReportStart514_Zlucene;
  FDirZdrav:='ZP'+IntToStr(X.Kod_ZP);
  CreateDir(FPathXml+FDirZdrav);
  assignfile(F,FPathXML+FDirZdrav+'\'+FNameXML);
  assignfile(F1,FPathXML+FDirZdrav+'\'+FNameXML+'.csv');
  rewrite(F);
  rewrite(F1);
  {Inicializacia}
  Fillchar(Telo,SizeOf(Telo),#0);
{### PHASE 1 ###}
  pc:=0;
  px:=ReportZP2005PR.Q01_.RecordCount;
  while not ReportZP2005PR.Q01_.EOF do
  begin
  inc(pc);
  Progress(pc * 100 div px);
  with Telo do
  if ReportZP2005PR.Q01_Calc_zvyhodneny_ZP.Value then begin
    pocet1 := pocet1 + 1;
    pocet_kdni1 := pocet_kdni1 + Trunc(ReportZP2005PR.Q01_Calc_Dni_poist.Value);
    prijem1 := prijem1 + ReportZP2005PR.Q01_Calc_n_prijem_zp.Value;
    zaklad1 := zaklad1 + ReportZP2005PR.Q01_Calc_n_zaklad_zp.Value;
    preddavok_zamtel1 := preddavok_zamtel1 + ReportZP2005PR.Q01_Calc_oz_zdravot.Value;
    preddavok_zamnec1 := preddavok_zamnec1 + ReportZP2005PR.Q01_Calc_o_zdravot.Value;
  end
  else begin
    pocet := pocet + 1;
    pocet_kdni := pocet_kdni + Trunc(ReportZP2005PR.Q01_Calc_Dni_poist.Value);
    prijem := prijem + ReportZP2005PR.Q01_Calc_n_prijem_zp.Value;
    zaklad := zaklad + ReportZP2005PR.Q01_Calc_n_zaklad_zp.Value;
    preddavok_zamtel := preddavok_zamtel + ReportZP2005PR.Q01_Calc_oz_zdravot.Value;
    preddavok_zamnec := preddavok_zamnec + ReportZP2005PR.Q01_Calc_o_zdravot.Value;
  end;
  ReportZP2005PR.Q01_.Next;
  end;
  Progress(100);
{### ZAHLAVIE ###}
  ii := 0;
  writeln(F1,'Charakter d�vky;Typ d�vky;I�O platite�a / R� / ��slo povolenia na pobyt;��slo platite�a;K�d zdravotnej pois�ovne;D�tum odoslania d�vky RRRRMMDD;��slo d�vky;Po�et viet tela d�vky;Po�et m�di�;Poradov� ��slo m�dia');
  writeln(F1,'Obdobie;De� ur�en� na v�platu;N�zov platite�a;I�O platite�a / R� / ��slo povolenia na pobyt;��slo platite�a;DI�;Telef�n;Fax;Email;K�d banky platite�a;Pred��slie bankov�ho ��tu;��slo bankov�ho ��tu');
  write(F1,'Po�et zamestnancov prihl�sen�ch do ZP;SP za zamestnancov bez ZP - zamestn�vate�;SP za zamestnancov bez ZP - zamestnanec;SP za zamestnancov so ZP - zamestn�vate�;SP za zamestnancov so ZP - zamestnanec;');
  write(F1,'Po�et zam. bez ZP, za ktor�ch sa plat� poistn�;Po�et zam. so ZP, za ktor�ch sa plat� poistn�;Po�et zapo��tan�ch dn� - zamestnanci bez ZP;Po�et zapo��tan�ch dn� - zamestnanci so ZP;');
  write(F1,'Pr�jem celkom - zamestnanci bez ZP;Pr�jem celkom - zamestnanci so ZP;Vymeriavac� z�klad - zamestnanci bez ZP;Vymeriavac� z�klad - zamestnanci so ZP;Preddavok - zamestnanci bez ZP - zamestn�vate�;');
  writeln(F1,'Preddavok - zamestnanci bez ZP - zamestnanec;Preddavok - zamestnanci so ZP - zamestn�vate�;Preddavok - zamestnanci so ZP - zamestnanec;Preddavok na poistn� celkom;Pozn�mka;Celkov� po�et zam.poisten�ch vo v�etk�ch zdravotn�ch pois�ovniach.');

  for i:=1 to 99 do
    if (Zahlavie[i].vyplnene) and (Zahlavie[i].kzp=X.kod_zp)
     then begin
       ii :=ii + 1;
       z1 := Zahlavie[i].identif;
       z1 := StrReplaceAll(z1,'%pocet_viet%',IntToStr(ReportZP2005PR.Q01_.RecordCount));
       z1 := StrReplaceAll(z1,'%pocet%',IntToStr(Telo.Pocet));
       z1 := StrReplaceAll(z1,'%pocet1%',IntToStr(Telo.Pocet1));
       z1 := StrReplaceAll(z1,'%pocet_kdni%',IntToStr(Telo.Pocet_kdni));
       z1 := StrReplaceAll(z1,'%pocet_kdni1%',IntToStr(Telo.Pocet_kdni1));
       z1 := StrReplaceAll(z1,'%prijem%',Format('%.2f',[Telo.Prijem]));
       z1 := StrReplaceAll(z1,'%prijem1%',Format('%.2f',[Telo.Prijem1]));
       z1 := StrReplaceAll(z1,'%zaklad%',Format('%.2f',[Telo.Zaklad]));
       z1 := StrReplaceAll(z1,'%zaklad1%',Format('%.2f',[Telo.Zaklad1]));
       z1 := StrReplaceAll(z1,'%preddavok_zamtel%',Format('%.2f',[Telo.Preddavok_zamtel]));
       z1 := StrReplaceAll(z1,'%preddavok_zamtel1%',Format('%.2f',[Telo.Preddavok_zamtel1]));
       z1 := StrReplaceAll(z1,'%preddavok_zamnec%',Format('%.2f',[Telo.Preddavok_zamnec]));
       z1 := StrReplaceAll(z1,'%preddavok_zamnec1%',Format('%.2f',[Telo.Preddavok_zamnec1]));
       z1 := StrReplaceAll(z1,'%preddavok_spolu%',Format('%.2f',[Telo.Preddavok_zamtel+Telo.Preddavok_zamtel1+Telo.Preddavok_zamnec+Telo.Preddavok_zamnec1]));
       write(F,z1);
       write(F1,StrReplaceAll(z1,'|',';'));
     end;
{### PHASE 2 ###}
  ReportZP2005PR.Q01_.First;
  pc:=0;
  px:=ReportZP2005PR.Q01_.RecordCount;
  while not ReportZP2005PR.Q01_.EOF do
  begin
  inc(pc);
  Progress(pc * 100 div px);
{
Veta tela d�vky
Polo�ka	Popis polo�ky	Povinn�	D�tov� typ	D�ka
1.	Poradov� ��slo	P	INT	6
2.	Rodn� ��slo zamestnanca	P	INT	10
3.	Po�et dn�	P	INT	2
4.	Sadzba poistn�ho - zamestn�vate�	P	DEC	4, 2
5.	Sadzba poistn�ho - zamestnanec	P	DEC	4, 2
6.	Pr�jem zamestnanca	P	DEC	12, 2
7.	Vymeriavac� z�klad zamestnanca	P	DEC	12, 2
8.	Preddavok zamestn�vate�	P	DEC	12, 2
9.	Preddavok zamestnanec	P	DEC	12, 2
10.	Preddavok spolu	P	DEC	12, 2
}
  E_TEXT(IntToStr(pc));
  E_TEXT(RC_BEZ(ReportZP2005PR.Q01_Calc_Born_numb.Value));
  E_TEXT(IntToStr(Trunc(ReportZP2005PR.Q01_Calc_Dni_poist.Value)));
  E_TEXT(Format('%.2f',[ReportZP2005PR.Q01_Calc_Fz_zdravot.Value]));
  E_TEXT(Format('%.2f',[ReportZP2005PR.Q01_Calc_F_zdravot.Value]));
  E_TEXT(Format('%.2f',[ReportZP2005PR.Q01_Calc_n_prijem_zp.Value]));
  E_TEXT(Format('%.2f',[ReportZP2005PR.Q01_Calc_n_zaklad_zp.Value]));
  E_TEXT(Format('%.2f',[ReportZP2005PR.Q01_Calc_oz_zdravot.Value]));
  E_TEXT(Format('%.2f',[ReportZP2005PR.Q01_Calc_o_zdravot.Value]));
  E_LAST(Format('%.2f',[ReportZP2005PR.Q01_Calc_oz_zdravot.Value+ReportZP2005PR.Q01_Calc_o_zdravot.Value]));
  write(F,MyTxt);
  write(F1,StrReplaceAll(StrReplaceAll(MyTxt,'|',';'),'.',','));
  MyTxt:='';
  ReportZP2005PR.Q01_.Next;
  end;
  CloseFile(F);
  CloseFile(F1);
  ReportZP2005PR.ShowReportEnd;
  finally
  ReportZP2005PR.Free;
  Progress(100);
  end;
{----------------------------------------}
  Result := '';
end;end;

{*************************************************************************************
***                               Vytvor 601                                       ***
*************************************************************************************}
function Vytvor601:AnsiString;
var i,pc,px:integer;
    printband: boolean;
    pom_cislo_platitela:string;
    bVytvoril: boolean;
begin with DM do begin
  bVytvoril := false;
  try
  ReportZP2005PR:=TReportZP2005PR.Create(Application);
  ReportZP2005PR.SetX(X);
  ReportZP2005PR.Q0A_.Close;
  ReportZP2005PR.Q0A_.ParamByName('P1').AsInteger := MyRok(X.AktObdobie);
  ReportZP2005PR.Q0A_.ParamByName('P2').AsInteger := MyMesiac(X.AktObdobie);
  ReportZP2005PR.Q0A_.Open;
  ReportZP2005PR.Q1A_.Close;
  ReportZP2005PR.Q1A_.ParamByName('P1').AsInteger := MyRok(X.AktObdobie);
  ReportZP2005PR.Q1A_.ParamByName('P2').AsInteger := MyMesiac(X.AktObdobie);
  ReportZP2005PR.Q1A_.Open;
while not ReportZP2005PR.Q0A_.EOF do
begin

  for i:=1 to 99 do Zahlavie[i].vyplnene:=false;
  pc:=0;
  MyTxt := '';
  {
  1.	 riadok - hlavi�ka:

  No.	N�zov st�pca	Povinnos�	D�ka	Typ	Form�t
  1	Charakter d�vky	P	1-1	CHAR
  2	Typ d�vky	P	3-3	INT
  3	I�O /Rodn� ��slo/ ��slo povolenia na pobyt	P	8-10	CHAR
  4	I�O prij�mate�a d�vky	P	8-8	CHAR
  5	K�d ZP a pobo�ky ZP	P	4-4	CHAR
  6 	D�tum odoslania d�vky	P	8-8	DATE	RRRRMMDD
  7	��slo d�vky	P	1-6	INT
  8	Po�et viet tela d�vky	P	1-6	INT
  9	Po�et m�di�	N	1-3	INT
  10	Poradov� ��slo m�dia	N	1-3	INT

  Vysvetlivky k jednotliv�m polo�k�m:

  Charakter d�vky:		N - nov�, O - opravn�
  Typ d�vky: 			601
  I�O /Rodn� ��slo/		identifika�n� ��slo organiz�cie pod�a ��seln�ka I�O alebo rodn�
  ��slo povolenia na pobyt:	��slo alebo ��slo povolenia na pobyt platite�a - odosielate�a d�vky
  I�O prij�mate�a d�vky:	I�O prij�mate�a d�vky
  K�d ZP a k�d pobo�ky ZP:	k�d zdravotnej pois�ovne a k�d pobo�ky zdravotnej pois�ovne
  D�tum odoslania d�vky:	d�tum odoslania d�vky na ZP
  ��slo d�vky:			poradov� ��slo d�vky platite�a
  Po�et viet tela d�vky:	ud�va sa bez prv�ho a druh�ho riadku d�vky - zodpoved� po�tu oznamovan�ch poistencov
  Po�et m�di�:	po�et m�di�, na ktor�ch je d�vka doru�en�
  Poradov� ��slo m�dia: 	poradov� ��slo m�dia (1,2,3,...)
  }
  NAPLN_UDAJE_ZP(ReportZP2005PR.Q1A_KZP.AsInteger);
  E_TEXT('N');
  E_TEXT('601'); {typ davky}
  E_TEXT(TINF_ICO.Value);
  E_TEXT(CBU.ICO);  {ICO prijimatela davky}
  E_TEXT(LPAD(ReportZP2005PR.Q1A_KZP.AsString,2,'0')+LPAD(IntToStr(CBU.PobockaZP),2,'0'));  {Kod ZP a pobocky ZP}
  E_TEXT(IntToStr(DateToRRRRMMDD(now)));
  E_TEXT('1'); {cislo davky}
  E_TEXT('%pocet_viet%'); {pocet viet tela davky}
  E_TEXT('1');
  E_LAST('1');
  Zahlavie[1].identif:=MyTxt;Zahlavie[1].vyplnene:=true;MyTxt:='';
  {
  2. riadok - �daje o platite�ovi:

  No. 	N�zov st�pca	Povinnos�	D�ka	Typ	Form�t
  1	��slo platite�a poistn�ho	P	1-10	CHAR
  2	K�d ZP	P	2-2	CHAR
  3	K�d pobo�ky ZP	P	2-2	CHAR
  4	Kalend�rny mesiac	P	2-2	CHAR	MM
  5	Kalend�rny rok	P	2-2	CHAR	RR
  6	Meno a priezvisko/obchodn� meno	P	1-60	CHAR
  7	I�O 	P*	8-8	CHAR
  8	Rodn� ��slo	P*	9-10	CHAR
  9	��slo povolenia na pobyt	P*	1-10	CHAR
  10	DI� / I� DPH	N	1-13	CHAR
  11	Pr�vna forma	P 	2-2	CHAR
  12	Adresa s�dla - obec	P	1-25	CHAR
  13	Adresa s�dla - s�pisn� ��slo	N	1-8	CHAR
  14	Adresa s�dla - ulica ��slo	P	1-35	CHAR
  15	Adresa s�dla - PS�	P	5-5	CHAR
  16	Adresa s�dla - �t�t	P**	2-2	CHAR
  17	Telef�n	N	8-15	CHAR
  18	Fax	N	8-15	CHAR
  19	E-mail	N	1-64	CHAR
  20	N�zov banky 	P	1-60	CHAR
  21	Pred��slie ��tu	P 	1-6	CHAR
  22	��slo ��tu	P	1-10	CHAR
  23	K�d banky	P	4-4	CHAR
  24	Osoba zodpovedn� za spracovanie	P	1-50	CHAR
  25    IBAN

  Vysvetlivky k jednotliv�m polo�k�m:

  ��slo platite�a poistn�ho: 		��slo platite�a poistn�ho, ktor� pride�uje ZP
  K�d ZP:				k�d zdravotnej pois�ovne pod�a ��seln�ka ZP
  K�d pobo�ky ZP:			k�d pobo�ky ZP
  Kalend�rny mesiac:			��slo mesiaca, v ktorom do�lo k zmene platite�a poistn�ho
  Kalend�rny rok:	koncov� dvoj��slie roku, v ktorom do�lo k zmene platite�a poistn�ho
  Meno a priezvisko/
  obchodn� meno:		 	identifik�cia platite�a
  I�O:					I�O platite�a
  Rodn� ��slo:				rodn� ��slo platite�a
  ��slo povolenia na pobyt:		��slo povolenia na pobyt platite�a
  DI�/I� DPH:				da�ov� identifika�n� ��slo
  Pr�vna forma:				FO - fyzick� osoba, PO - pr�vnick� osoba
  Adresa s�dla - obec:			n�zov obce s�dla platite�a poistn�ho
  Adresa s�dla - s�pisn� ��slo		s�pisn� ��slo adresy s�dla platite�a poistn�ho
  Adresa s�dla - ulica ��slo		n�zov ulice a ��slo s�dla platite�a poistn�ho
  Adresa s�dla - PS�			PS� adresy s�dla platite�a poistn�ho
  Adresa s�dla - �t�t			k�d �t�tu platite�a pod�a  ISO 3166-1
  Telef�n:				telef�n platite�a poistn�ho
  Fax:					fax platite�a poistn�ho
  E-mail:				e-mail platite�a poistn�ho
  N�zov banky:				n�zov banky alebo pobo�ky zahrani�nej banky platite�a
  Pred��slie ��tu:			pred��slie ��tu platite�a poistn�ho v banke
  ��slo ��tu:				��slo ��tu platite�a poistn�ho v banke
  K�d banky:				4-miestny k�d banky platite�a
  Osoba zodpovedn� za spracovanie: osoba  zodpovedn� za spracovanie u platite�a poistn�ho
  IBAN:                                 Medzinarodny format cisla uctu

  * treba vyplni� jednu z polo�iek I�O, Rodn� ��slo, ��slo povolenia na pobyt
  ** povinn� parameter, ak sa jedn� o in� �t�t ako SR
  }
  pom_cislo_platitela:=CISLO_PLATITELA_ZP(ReportZP2005PR.Q0A_KZP.Value);
  E_TEXT(pom_cislo_platitela); {cislo platitela}
  E_TEXT(LPAD(ReportZP2005PR.Q0A_KZP.AsString,2,'0'));
  E_TEXT(LPAD(IntToStr(CBU.PobockaZP),2,'0'));
  E_TEXT(LPAD(IntToStr(MyMesiac(X.Obdobie1)),2,'0'));
  E_TEXT(LPAD(IntToStr(MyRok(X.Obdobie1) mod 100),2,'0'));
  E_TEXT(TINF_NAZOV.Value);
  E_TEXT(TINF_ICO.Value);
  E_TEXT(TINF_FO_RC.Value);
  E_TEXT(TINF_FO_CPP.Value);
  E_TEXT(Trim(StrReplaceX(TINF_DIC.Value,'SK','')));
  E_TEXT('PO'); {pravna forma}
  E_TEXT(TINF_ADR_MESTO.Value);
  E_TEXT(''); {supisne cislo}
  E_TEXT(TINF_ADR_ULICA.Value);
  E_TEXT(TINF_ADR_PSC.Value);
  E_TEXT(TINF_L_ADR_STAT_AAA.Value);  {stat}
  E_TEXT(TINF_ADR_TELEFON.Value);
  E_TEXT(TINF_ADR_FAX.Value);
  E_TEXT(TINF_ADR_EMAIL.Value);
  E_TEXT(TINF_NAZOV_BANKY.Value);
  E_TEXT(TINF_Predcislo_u.Value);
  E_TEXT(TINF_Cislo_u.Value);
  E_TEXT(TINF_BANKA_U.Value);
  if X.Obdobie1 >= ZAKON_2014_01 then begin
    E_TEXT(X.Vykaz_zostavil);
    E_LAST(TINF_IBAN.Value);
  end else begin
    E_LAST(X.Vykaz_zostavil);
  end;
  Zahlavie[2].identif:=MyTxt;Zahlavie[2].vyplnene:=true;MyTxt:='';
  Progress(100);
{-----------------------------------------------------------}
  ReportZP2005PR.Q1A_.First;
  FDirZdrav:='ZP'+ReportZP2005PR.Q0A_KZP.AsString;
  CreateDir(FPathXml+FDirZdrav);
  assignfile(F,FPathXML+FDirZdrav+'\'+FNameXML);
  rewrite(F);
  for i:=1 to 99 do
    if (Zahlavie[i].vyplnene)
     then write(F,StrReplaceX(Zahlavie[i].identif,'%pocet_viet%',IntToStr(ReportZP2005PR.Q1A_.RecordCount)));
  pc:=0;
  px:=ReportZP2005PR.Q1A_.RecordCount;
  ReportZP2005PR.Q1A_.First;
  while not ReportZP2005PR.Q1A_.EOF do
  begin
    inc(pc);
    Progress(pc * 100 div px);
{
3.	a� n-t� riadok - telo d�vky - �daje o poistencoch:

No. 	N�zov st�pca	Povinnos�	D�ka	Typ	Form�t
1	Poradov� ��slo poistenca	P	1-5	CHAR
2	Rodn� ��slo 	P*	9-10	CHAR
3	Titul 	N	3-12	CHAR
4	Meno	P	1-24	CHAR
5	Priezvisko	P	1-36	CHAR
6	K�d zmeny	P	1-2	CHAR
7	Platnos� zmeny	P	1-1	CHAR
8	D�tum zmeny	P	8-8	DATE	RRRRMMDD
9	Identifika�n� ��slo	P*	9-20	CHAR

Vysvetlivky k jednotliv�m polo�k�m:

Poradov� ��slo poistenca:			poradov� ��slo poistenca v d�vke
Rodn� ��slo:					rodn� ��slo poistenca
Titul:						titul pred menom poistenca
Meno:						meno poistenca
Priezvisko:					priezvisko poistenca
K�d zmeny:		jednomiestny alebo dvojmiestny k�d pod�a metodick�ho usmernenia (napr. 1A, 1B, ..., 1U, 2)
Platnos� zmeny:		hodnoty Z, K, X pod�a metodick�ho usmernenia
D�tum zmeny:		d�tum, kedy do�lo u poistenca k zmene platite�a poistn�ho
Identifika�n� ��slo:	identifika�n� ��slo poistenca

* ak nie je vyplnen� rodn� ��slo, treba vyplni� identifika�n� ��slo poistenca
}
    E_TEXT(IntToStr(pc));
    E_TEXT(RC_BEZ(ReportZP2005PR.Q1A_Born_numb.Value));
    E_TEXT(ReportZP2005PR.Q1A_title.Value);
    E_TEXT(ReportZP2005PR.Q1A_name.Value);
    E_TEXT(ReportZP2005PR.Q1A_surname.Value);
    E_TEXT(ReportZP2005PR.Q1A_kod_zmeny.Value);
    E_TEXT(Uppercase(ReportZP2005PR.Q1A_platnost_zmeny.Value));
    E_TEXT(FormatDateTime('yyyymmdd',ReportZP2005PR.Q1A_datum_zmeny.Value));
    E_LAST('');
    write(F,MyTxt);MyTxt:='';
    bVytvoril := true;
    ReportZP2005PR.Q1A_.Next;
  end;
  CloseFile(F);
  ReportZP2005PR.Q0A_.Next;
  end;
  finally
  ReportZP2005PR.Free;
  Progress(100);
  if (bVytvoril) then
    MyMessage(Format(SMyAppZdravFilesGenerated,[FNameXml,FPathXML]))
  else
    MyError(SMyAppZdravFilesNotGenerated);
  end;
{----------------------------------------}
  Result := '';
end;end;


procedure RunReportZp514(const MyReportParam: TMyReportParam);
var
  DS:char;
begin with DM do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  DS:=DecimalSeparator;
  DecimalSeparator:='.';
  try
  try
    FPathXML := MyRepPath1;
    CreateDir(MyAppPath+MenoXMLDir);
    CreateDir(FPathXML);
    if X.Typ='ZPTXT' then begin
      FNameXML := 'N514'+IntToStr(X.Obdobie1)+'.001';
      Vytvor514;
      MyMessage(Format(SMyAppZdravFilesGenerated,[FNameXml,FPathXML]));
    end else begin
      FNameXML := LPAD(DM.TINF_ICO.Value,8,'0')+FormatDateTime('yyyymmdd',now)+'.601';
      Vytvor601;
    end;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    DecimalSeparator:=DS;
  end;
end;end;

procedure RunReportZp514_Zlucene(const MyReportParam: TMyReportParam);
var
  DS:char;
begin with DM do begin
  X:=MyReportParam;
  Screen.Cursor:=crHourGlass;
  DS:=DecimalSeparator;
  DecimalSeparator:='.';
  try
  try
    FPathXML := MyRepPath1;
    CreateDir(MyAppPath+MenoXMLDir);
    CreateDir(FPathXML);
    if X.Typ='ZPTXT_ZLUC' then begin
      FNameXML := 'N514'+IntToStr(X.Obdobie1)+'.zluc.001';
      Vytvor514_Zlucene;
      MyMessage(Format(SMyAppZdravFilesGenerated,[FNameXml,FPathXML]));
    end else begin
      FNameXML := LPAD(DM.TINF_ICO.Value,8,'0')+FormatDateTime('yyyymmdd',now)+'.601';
      Vytvor601;
    end;
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    DecimalSeparator:=DS;
  end;
end;end;

{*************************************************************************************
***                               Vytvor 580                                       ***
*************************************************************************************}

function VytvorDavku580:AnsiString;
type
type_vyplata = record
  obdobie: integer;
  dni: integer;
  prijem: double;
  zaklad: double;
  sadzba_firma: double;
  sadzba_osoba: double;
  preddavok_firma:double;
  preddavok_osoba:double;
end;
var i,pc,px:integer;
    printband: boolean;
    pom_cislo_platitela:string;
    MyPoctyVsetkyZP:TMyPocty;
    vyplata:array[0..12] of type_vyplata;
    uhrn_prijmov : double;
    uhrn_preddavkov_firma : double;
    uhrn_preddavkov_osoba : double;
    datum_min : TDateTime;
    datum_max : TDateTime;
    YY,MM,DD : word;
begin with DM,ReportZP2005PR do begin
  MyTxt := '';
(*
Polo�ka c. Popis polo�ky Povinn� D�tov� typ Dl�ka
1. Charakter d�vky P CHAR 1
2. Typ d�vky P INT 3
3. ICO platitela/ RC  P CHAR 8-10
4. C�slo platitela P CHAR 10
5. K�d zdravotnej poistovne P CHAR 4
6. D�tum odoslania d�vky P DATE RRRRMMDD
7. C�slo d�vky P INT 6
8. Pocet viet tela d�vky P INT 6
9. Pocet m�di� INT 3
10. Poradov� c�slo m�dia INT 3

Popis polo�iek identifik�cie d�vky:
Charakter d�vky:	N - nov� (prvotn� v�kaz)
	O - opravn� (opravn� v�kaz celkov�)
	A - adit�vna (rozdielov� v�kaz)
Typ d�vky	580
��slo platite�a	��slo pridelen� zdravotnou pois�ov�ou
��slo d�vky	jednozna�n� identifik�tor d�vky platite�a
(poradov� ��slo d�vky)
Po�et m�di�	po�et m�di�, na ktor�ch je d�vka doru�en�
Poradov� ��slo m�dia	poradov� ��slo m�dia (1,2,3,...)

P = povinn� polo�ka

D�tov� typ:		CHAR	- alfanumerick� re�azec
			INT 	- cel� ��slo
			DATE 	- d�tumov� �daj v zadanom tvare
DEC   - desatinn� ��slo, d�ka je vyjadren� v tvare x,y kde x zna�� po�et platn�ch ��slic pred aj za desatinnou bodkou spolu a y ozna�uje po�et platn�ch ��slic za desatinnou bodkou.
Ako odde�ova� v desatinn�ch ��slach sa pou��va bodka.
*)

  try
  ReportZP2005PR:=TReportZP2005PR.Create(Application);
  ReportZP2005PR.SetX(X);

  Q1RZP_.Close;
  Q1RZP_.ParamByName('P0').AsInteger := MyRok(X.AktObdobie)*100+1;
  Q1RZP_.ParamByName('P1').AsInteger := MyRok(X.AktObdobie)*100+12;
  Q1RZP_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q1RZP_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q1RZP_.ParamByName('KZP').AsInteger := X.Kod_Zp;
  Q1RZP_.Open;
  {--}
  Q2RZP_.Close;
(*
  Q2RZP_.ParamByName('P0').AsInteger := MyRok(X.AktObdobie)*100+1;
  Q2RZP_.ParamByName('P1').AsInteger := MyRok(X.AktObdobie)*100+12;
  Q2RZP_.ParamByName('KZP').AsInteger := X.Kod_Zp;
*)
  Q2RZP_.Open;
  {--}
  Q00RZP_.Close;
  Q00RZP_.ParamByName('P0').AsInteger := MyRok(X.AktObdobie)*100+1;
  Q00RZP_.ParamByName('P1').AsInteger := MyRok(X.AktObdobie)*100+12;
  Q00RZP_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q00RZP_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q00RZP_.ParamByName('KZP').AsInteger := X.Kod_Zp;
  Q00RZP_.Open;
  pc:=0;
  px:=ReportZP2005PR.Q00RZP_.RecordCount;

    E_TEXT('N');
    E_TEXT('580'); {typ davky}
    E_TEXT(TINF_ICO.Value);
    pom_cislo_platitela:=CISLO_PLATITELA_ZP(X.Kod_zp);
    E_TEXT(pom_cislo_platitela); {cislo platitela}
    E_TEXT(LPAD(IntToStr(X.Kod_zp),2,'0') + LPAD(ReportZP2005PR.QCBU_Pobocka_ZP.AsString,2,'0')); {kzp}
    E_TEXT(IntToStr(DateToRRRRMMDD(now)));
    E_TEXT('1'); {cislo davky}
    E_TEXT(IntToStr(px)); {pocet viet tela davky}
    E_TEXT('1');
    E_LAST('1');
(*
Veta z�hlavia d�vky obsahuje identifikacn� �daje platitela
Polo�ka Popis polo�ky Povinn� D�tov� typ Maxim�lna
dl�ka
1. Rok P INT 4
2. N�zov platitela P CHAR 80
3. ICO platitela/ RC P CHAR 8-10
4. C�slo platitela P CHAR 10
5. DIC CHAR 12
6. Telef�n N CHAR 20
7. Fax CHAR 20
8. Email N CHAR 75
9. K�d banky platitela P CHAR 4
10. Predc�slie bankov�ho �ctu CHAR 6
11. C�slo bankov�ho �ctu P INT 10
*)
    E_TEXT(IntToStr(MyRok(X.AktObdobie)));
    E_TEXT(TINF_NAZOV.Value);
    E_TEXT(TINF_ICO.Value);
    E_TEXT(pom_cislo_platitela); {cislo platitela}
    E_TEXT(Trim(StrReplaceX(TINF_DIC.Value,'SK','')));
    E_TEXT(TINF_ADR_TELEFON.Value);
    E_TEXT(TINF_ADR_FAX.Value);
    E_TEXT(TINF_ADR_EMAIL.Value);
    E_TEXT(TINF_BANKA_U.Value);
    E_TEXT(TINF_Predcislo_u.Value);
    E_LAST(TINF_Cislo_u.Value);

  FDirZdrav:='ZP'+IntToStr(X.Kod_ZP);
  ForceDirectories(FPathXml+FDirZdrav);
  assignfile(F,FPathXML+FDirZdrav+'\'+FNameXML);
  rewrite(F);
  while not ReportZP2005PR.Q00RZP_.EOF do
  begin
  inc(pc);
  Progress(pc * 100 div px);
{
Veta tela d�vky
Polo�ka	Popis polo�ky	Povinn�	D�tov� typ	D�ka
1.	Poradov� ��slo	P	INT	6
2.	Rodn� ��slo zamestnanca	P	INT	10
3.	Po�et dn�	P	INT	2
4.	Sadzba poistn�ho - zamestn�vate�	P	DEC	4, 2
5.	Sadzba poistn�ho - zamestnanec	P	DEC	4, 2
6.	Pr�jem zamestnanca	P	DEC	12, 2
7.	Vymeriavac� z�klad zamestnanca	P	DEC	12, 2
8.	Preddavok zamestn�vate�	P	DEC	12, 2
9.	Preddavok zamestnanec	P	DEC	12, 2
10.	Preddavok spolu	P	DEC	12, 2
}
  Q2RZP_.Filtered := False;
  Q2RZP_.Filter   := 'code_emp='+Q00RZP_code_emp.AsString;
  Q2RZP_.Filtered := True;
  E_TEXT(IntToStr(pc));
  E_TEXT(RC_BEZ(ReportZP2005PR.Q2RZP_Born_numb.Value));
  datum_min := EncodeDate(MyRok(X.AktObdobie),1,1);
  datum_max := EncodeDate(MyRok(X.AktObdobie)+1,1,1)-1;
  if (Q2RZP_Nastup.Value > datum_min) then datum_min := Q2RZP_Nastup.Value;
  if ((Q2RZP_Vystup.AsString<>'') and (ReportZP2005PR.Q2RZP_Vystup.Value < datum_max)) then datum_max := Q2RZP_Vystup.Value;
  DecodeDate(datum_min,YY,MM,DD);
  E_TEXT(LPAD(IntToStr(DD),2,'0')+LPAD(IntToStr(MM),2,'0')+IntToStr(YY));
  DecodeDate(datum_max,YY,MM,DD);
  E_TEXT(LPAD(IntToStr(DD),2,'0')+LPAD(IntToStr(MM),2,'0')+IntToStr(YY));
  for i:=1 to 22 do E_TEXT('');
  for i:=1 to 12 do begin
    Q1RZP_.Filtered := False;
    Q1RZP_.Filter   := 'code_emp='+Q00RZP_code_emp.AsString+' and v_obdobie='+IntToStr(MyRok(X.AktObdobie)*100+i);
    Q1RZP_.Filtered := True;
    if Q00RZP_Code_emp.Value = Q1RZP_Code_emp.Value then begin
      vyplata[i].dni := Q1RZP_Dni_poist.Value;
      vyplata[i].prijem := Q1RZP_n_prijem_zp.Value;
      vyplata[i].zaklad := Q1RZP_n_zaklad_zp.Value;
      vyplata[i].sadzba_firma := Q1RZP_fz_zdravot.Value;
      vyplata[i].sadzba_osoba := Q1RZP_f_zdravot.Value;
      vyplata[i].preddavok_firma := Q1RZP_oz_zdravot.Value;
      vyplata[i].preddavok_osoba := Q1RZP_o_zdravot.Value;
    end
    else {if Q00RZP_Code_emp.Value = Q2RZP_Code_emp.Value then} begin
      vyplata[i].dni := Q2RZP_Calc_dni_poist.Value;
      vyplata[i].prijem := 0;
      vyplata[i].zaklad := 0;
      vyplata[i].sadzba_firma := Q2RZP_Calc_fz_zdravot.Value;
      vyplata[i].sadzba_osoba := Q2RZP_Calc_f_zdravot.Value;
      vyplata[i].preddavok_firma := 0;
      vyplata[i].preddavok_osoba := 0;
    end;
  end;
  uhrn_prijmov := 0;
  uhrn_preddavkov_firma := 0;
  uhrn_preddavkov_osoba := 0;
  for i:=1 to 12 do begin
   uhrn_prijmov := uhrn_prijmov + vyplata[i].prijem;
   uhrn_preddavkov_firma := uhrn_preddavkov_firma + vyplata[i].preddavok_firma;
   uhrn_preddavkov_osoba := uhrn_preddavkov_osoba + vyplata[i].preddavok_osoba;
  end;
  E_TEXT(Format('%.2f',[uhrn_prijmov]));
  E_TEXT(Format('%.2f',[uhrn_preddavkov_firma]));
  E_TEXT(Format('%.2f',[uhrn_preddavkov_osoba]));
  for i:=1 to 12 do begin
  E_TEXT(IntToStr(MyRok(X.AktObdobie)*100+i));
  E_TEXT(IntToStr(vyplata[i].dni));
  E_TEXT(Format('%.2f',[vyplata[i].prijem]));
  E_TEXT(Format('%.2f',[vyplata[i].zaklad]));
  E_TEXT(Format('%.2f',[vyplata[i].sadzba_firma]));
  E_TEXT(Format('%.2f',[vyplata[i].sadzba_osoba]));
  E_TEXT(Format('%.2f',[vyplata[i].preddavok_firma]));
  E_TEXT(Format('%.2f',[vyplata[i].preddavok_osoba]));
  if i=12 then
  E_LAST(Format('%.2f',[vyplata[i].preddavok_firma + vyplata[i].preddavok_osoba]))
  else
  E_TEXT(Format('%.2f',[vyplata[i].preddavok_firma + vyplata[i].preddavok_osoba]));
  end;
  write(F,MyTxt);MyTxt:='';
  ReportZP2005PR.Q00RZP_.Next;
  end;
  CloseFile(F);
  finally
  Q00RZP_.Close;
  Q1RZP_.Close;
  Q2RZP_.Close;
  ReportZP2005PR.Free;
  Progress(100);
  end;
  Result := '';
end;end;

procedure RunReportZp580(const MyReportParam: TMyReportParam);
var
  DS:char;
begin with DM do begin
  X:=MyReportParam;
  if MyRok(X.AktObdobie) <> 2011 then begin
    MyError('Pre vygenerovanie v�kazu sa mus�te prepn�� do v�platn�ho obdobia pre rok 2011');
    exit;
  end;
  Screen.Cursor:=crHourGlass;
  DS:=DecimalSeparator;
  DecimalSeparator:='.';
  try
  try
    FPathXML := MyRepPath1;
    CreateDir(MyAppPath+MenoXMLDir);
    CreateDir(FPathXML);
    FNameXML := 'N580'+IntToStr(MyRok(X.AktObdobie));
    VytvorDavku580;
    MyMessage(Format(SMyAppZdravRzpFilesGenerated,[FPathXML+FDirZdrav+'\'+FNameXML]));

ExecuteFile(
  'explorer.exe',
  FPathXML+FDirZdrav,
  FPathXML+FDirZdrav,
  SW_SHOWNORMAL
);

  except on E:Exception do begin
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  end;
  finally
    Screen.Cursor:=crDefault;
    DecimalSeparator:=DS;
  end;
end;end;

function VytvorDavku580_CSV:AnsiString;
type
type_vyplata = record
  obdobie: integer;
  dni: integer;
  prijem: double;
  zaklad: double;
  sadzba_firma: double;
  sadzba_osoba: double;
  preddavok_firma:double;
  preddavok_osoba:double;
end;
var i,pc,px:integer;
    printband: boolean;
    pom_cislo_platitela:string;
    MyPoctyVsetkyZP:TMyPocty;
    vyplata:array[0..12] of type_vyplata;
    uhrn_prijmov : double;
    uhrn_preddavkov_firma : double;
    uhrn_preddavkov_osoba : double;
    datum_min : TDateTime;
    datum_max : TDateTime;
    YY,MM,DD : word;
begin with DM,ReportZP2005PR do begin
  MyCsv := '';
(*
Polo�ka c. Popis polo�ky Povinn� D�tov� typ Dl�ka
1. Charakter d�vky P CHAR 1
2. Typ d�vky P INT 3
3. ICO platitela/ RC  P CHAR 8-10
4. C�slo platitela P CHAR 10
5. K�d zdravotnej poistovne P CHAR 4
6. D�tum odoslania d�vky P DATE RRRRMMDD
7. C�slo d�vky P INT 6
8. Pocet viet tela d�vky P INT 6
9. Pocet m�di� INT 3
10. Poradov� c�slo m�dia INT 3

Popis polo�iek identifik�cie d�vky:
Charakter d�vky:	N - nov� (prvotn� v�kaz)
	O - opravn� (opravn� v�kaz celkov�)
	A - adit�vna (rozdielov� v�kaz)
Typ d�vky	580
��slo platite�a	��slo pridelen� zdravotnou pois�ov�ou
��slo d�vky	jednozna�n� identifik�tor d�vky platite�a
(poradov� ��slo d�vky)
Po�et m�di�	po�et m�di�, na ktor�ch je d�vka doru�en�
Poradov� ��slo m�dia	poradov� ��slo m�dia (1,2,3,...)

P = povinn� polo�ka

D�tov� typ:		CHAR	- alfanumerick� re�azec
			INT 	- cel� ��slo
			DATE 	- d�tumov� �daj v zadanom tvare
DEC   - desatinn� ��slo, d�ka je vyjadren� v tvare x,y kde x zna�� po�et platn�ch ��slic pred aj za desatinnou bodkou spolu a y ozna�uje po�et platn�ch ��slic za desatinnou bodkou.
Ako odde�ova� v desatinn�ch ��slach sa pou��va bodka.
*)

  try
  ReportZP2005PR:=TReportZP2005PR.Create(Application);
  ReportZP2005PR.SetX(X);

  Q1RZP_.Close;
  Q1RZP_.ParamByName('P0').AsInteger := MyRok(X.AktObdobie)*100+1;
  Q1RZP_.ParamByName('P1').AsInteger := MyRok(X.AktObdobie)*100+12;
  Q1RZP_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q1RZP_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q1RZP_.ParamByName('KZP').AsInteger := X.Kod_Zp;
  Q1RZP_.Open;
  {--}
  Q2RZP_.Close;
(*
  Q2RZP_.ParamByName('P0').AsInteger := MyRok(X.AktObdobie)*100+1;
  Q2RZP_.ParamByName('P1').AsInteger := MyRok(X.AktObdobie)*100+12;
  Q2RZP_.ParamByName('KZP').AsInteger := X.Kod_Zp;
*)
  Q2RZP_.Open;
  {--}
  Q00RZP_.Close;
  Q00RZP_.ParamByName('P0').AsInteger := MyRok(X.AktObdobie)*100+1;
  Q00RZP_.ParamByName('P1').AsInteger := MyRok(X.AktObdobie)*100+12;
  Q00RZP_.ParamByName('P2').AsInteger := X.AktMinSid;
  Q00RZP_.ParamByName('P3').AsInteger := X.AktMaxSid;
  Q00RZP_.ParamByName('KZP').AsInteger := X.Kod_Zp;
  Q00RZP_.Open;
  pc:=0;
  px:=ReportZP2005PR.Q00RZP_.RecordCount;

    CSV_LAST('I�O;'+TINF_ICO.Value);
    pom_cislo_platitela:=CISLO_PLATITELA_ZP(X.Kod_zp);
    CSV_LAST('��slo platite�a poistn�ho;'+pom_cislo_platitela); {cislo platitela}
    CSV_LAST('��slo zdravotnej pois�ovne;'+LPAD(IntToStr(X.Kod_zp),2,'0') + LPAD(ReportZP2005PR.QCBU_Pobocka_ZP.AsString,2,'0')); {kzp}
    CSV_LAST('D�tum vyvorenia d�vky;'+IntToStr(DateToRRRRMMDD(now)));
    CSV_LAST('Po�et viet tela d�vky;'+IntToStr(px)); {pocet viet tela davky}
(*
Veta z�hlavia d�vky obsahuje identifikacn� �daje platitela
Polo�ka Popis polo�ky Povinn� D�tov� typ Maxim�lna
dl�ka
1. Rok P INT 4
2. N�zov platitela P CHAR 80
3. ICO platitela/ RC P CHAR 8-10
4. C�slo platitela P CHAR 10
5. DIC CHAR 12
6. Telef�n N CHAR 20
7. Fax CHAR 20
8. Email N CHAR 75
9. K�d banky platitela P CHAR 4
10. Predc�slie bankov�ho �ctu CHAR 6
11. C�slo bankov�ho �ctu P INT 10
*)
    CSV_LAST('Rok;'+IntToStr(MyRok(X.AktObdobie)));
    CSV_LAST('N�zov;'+TINF_NAZOV.Value);
    CSV_LAST('I�O;'+TINF_ICO.Value);
    CSV_LAST('��slo platite�a;'+pom_cislo_platitela); {cislo platitela}
    CSV_LAST('DI�;'+Trim(StrReplaceX(TINF_DIC.Value,'SK','')));
    CSV_LAST('Telef�n;'+TINF_ADR_TELEFON.Value);
    CSV_LAST('Fax;'+TINF_ADR_FAX.Value);
    CSV_LAST('Email;'+TINF_ADR_EMAIL.Value);
    CSV_LAST('��et - k�d banky;'+TINF_BANKA_U.Value);
    CSV_LAST('��et - pred��slie;'+TINF_Predcislo_u.Value);
    CSV_LAST('��et - ��slo;'+TINF_Cislo_u.Value);

  FDirZdrav:='ZP'+IntToStr(X.Kod_ZP);
  ForceDirectories(FPathXml+FDirZdrav);
  assignfile(F,FPathXML+FDirZdrav+'\'+FNameXML);
  rewrite(F);
  while not ReportZP2005PR.Q00RZP_.EOF do
  begin
  inc(pc);
  Progress(pc * 100 div px);
{
Veta tela d�vky
Polo�ka	Popis polo�ky	Povinn�	D�tov� typ	D�ka
1.	Poradov� ��slo	P	INT	6
2.	Rodn� ��slo zamestnanca	P	INT	10
3.	Po�et dn�	P	INT	2
4.	Sadzba poistn�ho - zamestn�vate�	P	DEC	4, 2
5.	Sadzba poistn�ho - zamestnanec	P	DEC	4, 2
6.	Pr�jem zamestnanca	P	DEC	12, 2
7.	Vymeriavac� z�klad zamestnanca	P	DEC	12, 2
8.	Preddavok zamestn�vate�	P	DEC	12, 2
9.	Preddavok zamestnanec	P	DEC	12, 2
10.	Preddavok spolu	P	DEC	12, 2
}
  Q2RZP_.Filtered := False;
  Q2RZP_.Filter   := 'code_emp='+Q00RZP_code_emp.AsString;
  Q2RZP_.Filtered := True;
  CSV_LAST('Poradov� ��slo;'+IntToStr(pc));
  CSV_LAST('Rodn� ��slo;'+RC_BEZ(ReportZP2005PR.Q2RZP_Born_numb.Value));
  datum_min := EncodeDate(MyRok(X.AktObdobie),1,1);
  datum_max := EncodeDate(MyRok(X.AktObdobie)+1,1,1)-1;
  if (Q2RZP_Nastup.Value > datum_min) then datum_min := Q2RZP_Nastup.Value;
  if ((Q2RZP_Vystup.AsString<>'') and (ReportZP2005PR.Q2RZP_Vystup.Value < datum_max)) then datum_max := Q2RZP_Vystup.Value;
  DecodeDate(datum_min,YY,MM,DD);
  CSV_LAST('Obdobie od;'+LPAD(IntToStr(DD),2,'0')+LPAD(IntToStr(MM),2,'0')+IntToStr(YY));
  DecodeDate(datum_max,YY,MM,DD);
  CSV_LAST('Obdobie do;'+LPAD(IntToStr(DD),2,'0')+LPAD(IntToStr(MM),2,'0')+IntToStr(YY));
  for i:=1 to 12 do begin
    Q1RZP_.Filtered := False;
    Q1RZP_.Filter   := 'code_emp='+Q00RZP_code_emp.AsString+' and v_obdobie='+IntToStr(MyRok(X.AktObdobie)*100+i);
    Q1RZP_.Filtered := True;
    if Q00RZP_Code_emp.Value = Q1RZP_Code_emp.Value then begin
      vyplata[i].dni := Q1RZP_Dni_poist.Value;
      vyplata[i].prijem := Q1RZP_n_prijem_zp.Value;
      vyplata[i].zaklad := Q1RZP_n_zaklad_zp.Value;
      vyplata[i].sadzba_firma := Q1RZP_fz_zdravot.Value;
      vyplata[i].sadzba_osoba := Q1RZP_f_zdravot.Value;
      vyplata[i].preddavok_firma := Q1RZP_oz_zdravot.Value;
      vyplata[i].preddavok_osoba := Q1RZP_o_zdravot.Value;
    end
    else {if Q00RZP_Code_emp.Value = Q2RZP_Code_emp.Value then} begin
      vyplata[i].dni := Q2RZP_Calc_dni_poist.Value;
      vyplata[i].prijem := 0;
      vyplata[i].zaklad := 0;
      vyplata[i].sadzba_firma := Q2RZP_Calc_fz_zdravot.Value;
      vyplata[i].sadzba_osoba := Q2RZP_Calc_f_zdravot.Value;
      vyplata[i].preddavok_firma := 0;
      vyplata[i].preddavok_osoba := 0;
    end;
  end;
  uhrn_prijmov := 0;
  uhrn_preddavkov_firma := 0;
  uhrn_preddavkov_osoba := 0;
  for i:=1 to 12 do begin
   uhrn_prijmov := uhrn_prijmov + vyplata[i].prijem;
   uhrn_preddavkov_firma := uhrn_preddavkov_firma + vyplata[i].preddavok_firma;
   uhrn_preddavkov_osoba := uhrn_preddavkov_osoba + vyplata[i].preddavok_osoba;
  end;
  CSV_LAST('�hrn pr�jmov;'+Format('%.2f',[uhrn_prijmov]));
  CSV_LAST('�hrn preddavkov zamestn�vate�;'+Format('%.2f',[uhrn_preddavkov_firma]));
  CSV_LAST('�hrn preddavkov zamestnanec;'+Format('%.2f',[uhrn_preddavkov_osoba]));
  CSV_LAST('Mesiac;Dni poistenia;Pr�jem;Vymer.z�klad;Sadzba zamestn�vate�;Sadzba zamestnanec;Preddavok zamestn�vate�;Preddavok zamestnanca;Preddavok spolu');
  for i:=1 to 12 do begin
  CSV_TEXT(IntToStr(MyRok(X.AktObdobie)*100+i));
  CSV_TEXT(IntToStr(vyplata[i].dni));
  CSV_TEXT(Format('%.2f',[vyplata[i].prijem]));
  CSV_TEXT(Format('%.2f',[vyplata[i].zaklad]));
  CSV_TEXT(Format('%.2f',[vyplata[i].sadzba_firma]));
  CSV_TEXT(Format('%.2f',[vyplata[i].sadzba_osoba]));
  CSV_TEXT(Format('%.2f',[vyplata[i].preddavok_firma]));
  CSV_TEXT(Format('%.2f',[vyplata[i].preddavok_osoba]));
  if i=12 then
  CSV_LAST(Format('%.2f',[vyplata[i].preddavok_firma + vyplata[i].preddavok_osoba]))
  else
  CSV_LAST(Format('%.2f',[vyplata[i].preddavok_firma + vyplata[i].preddavok_osoba]));
  end;
  write(F,MyCsv);MyCsv:='';
  ReportZP2005PR.Q00RZP_.Next;
  end;
  CloseFile(F);
  finally
  Q00RZP_.Close;
  Q1RZP_.Close;
  Q2RZP_.Close;
  ReportZP2005PR.Free;
  Progress(100);
  end;
  Result := '';
end;end;

procedure RunReportZp580_CSV(const MyReportParam: TMyReportParam);
var
  DS:char;
begin with DM do begin
  X:=MyReportParam;
  if MyRok(X.AktObdobie) <> 2011 then begin
    MyError('Pre vygenerovanie v�kazu sa mus�te prepn�� do v�platn�ho obdobia pre rok 2011');
    exit;
  end;
  Screen.Cursor:=crHourGlass;
  DS:=DecimalSeparator;
  DecimalSeparator:=',';
  try
  try
    FPathXML := MyRepPath1;
    CreateDir(MyAppPath+MenoXMLDir);
    CreateDir(FPathXML);
    FNameXML := 'N580'+IntToStr(MyRok(X.AktObdobie))+'.csv';
    VytvorDavku580_CSV;
    MyMessage(Format(SMyAppZdravRzpFilesGenerated,[FPathXML+FDirZdrav+'\'+FNameXML]));

 if MyOtazka(SMyAppRunExcel)
   then ExecuteFile('excel','"'+FNameXML+'"',FPathXML+FDirZdrav+'\',1);

  except on E:Exception do begin
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  end;
  finally
    Screen.Cursor:=crDefault;
    DecimalSeparator:=DS;
  end;
end;end;
end.
