unit MainNEP1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBCtrls, StdCtrls, Buttons, ExtCtrls, ComCtrls, Menus,
  DBTables, Db, Mask, SMDBGrid;

type
  TFormNEP1 = class(TForm)
    Panel50: TPanel;
    Panel51: TPanel;
    Btn_navrat: TBitBtn;
    Panel53: TPanel;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Mnu_operacie: TMenuItem;
    Mnu_navrat: TMenuItem;
    Pomoc1: TMenuItem;
    Kalkulacka1: TMenuItem;
    N29: TMenuItem;
    Oprograme1: TMenuItem;
    Splitter1: TSplitter;
    Panel52: TPanel;
    N2: TMenuItem;
    mnu_insert1: TMenuItem;
    mnu_edit1: TMenuItem;
    mnu_delete1: TMenuItem;
    mnu_post1: TMenuItem;
    mnu_cancel1: TMenuItem;
    SB1: TScrollBox;
    Panel1: TPanel;
    Panel3: TPanel;
    Mnu_vytvor_xml: TMenuItem;
    btn_xml: TSpeedButton;
    N1: TMenuItem;
    Panel2: TPanel;
    Panel5: TPanel;
    DBG1: TSMDBGrid;
    btn_xml_view: TSpeedButton;
    procedure Btn_navratClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Kalkulacka1Click(Sender: TObject);
    procedure Oprograme1Click(Sender: TObject);
    procedure DBN2Click(Sender: TObject; Button: TNavigateBtn);
    procedure Mnu_operacieClick(Sender: TObject);
    procedure btn_xmlClick(Sender: TObject);
    procedure BTN_SELClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBG1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btn_xml_viewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateStatus;
    procedure UpdateMenu;
  end;

var
  FormNEP1: TFormNEP1;
  FNameXml: string;
  FPathXml: string;
  F:TextFile;

implementation

uses MyConsts, Dm_main, DM_sql, RXCalc, About, FmxUtils, Dm_zam, ParForm2,
  RexSpXml;

{$R *.DFM}

procedure TFormNEP1.UpdateMenu;
var prvy,druhy:boolean;
begin with DMZ do begin
  if (TZAM_.State in [dsEdit,dsInsert]) or
     (TZAM_.State in [dsEdit,dsInsert])
  then begin
    prvy:=TZAM_.State in [dsEdit,dsInsert];
    druhy:=TZAM_.State in [dsEdit,dsInsert];
    Mnu_insert1.Enabled:=False;
    Mnu_edit1.Enabled:=False;
    Mnu_delete1.Enabled:=False;
    Mnu_post1.Enabled:=prvy;
    Mnu_cancel1.Enabled:=prvy;
    Mnu_navrat.Enabled:=False;
    Btn_navrat.Enabled:=False;
    Mnu_vytvor_xml.Enabled:=False;
    {--}
end else
  begin
    Mnu_insert1.Enabled:=True;
    Mnu_edit1.Enabled:=True;
    Mnu_delete1.Enabled:=True;
    Mnu_post1.Enabled:=False;
    Mnu_cancel1.Enabled:=False;
    Mnu_navrat.Enabled:=True;
    Btn_navrat.Enabled:=True;
    Mnu_vytvor_xml.Enabled:=True;
    {--}
end;
end;end;

procedure TFormNEP1.UpdateStatus;
begin
  StatusBar1.Panels[0].Text:=MyStatus;
  Caption := MyCaption;
end;

procedure TFormNEP1.Btn_navratClick(Sender: TObject);
begin
  Close;
end;

procedure TFormNEP1.FormCreate(Sender: TObject);
begin with DMZ do begin
  TNEP_.MasterSource:=nil;
  TNEP_.MasterFields:='';
  TNEP_.Filter:='TypRL>=''AA'' and TypRL<=''ZZ''';
  TNEP_.Filtered:=True;
  TNEP_.Last;
  DS_NEP.Enabled:=True;
  UpdateStatus;
  DBG1.RefreshData;
end;end;

procedure TFormNEP1.Kalkulacka1Click(Sender: TObject);
begin
  FormCalc.Show;
end;

procedure TFormNEP1.Oprograme1Click(Sender: TObject);
begin
  if FormAbout=nil then Application.CreateForm(TFormAbout, FormAbout);
  FormAbout.ShowModal;
end;

procedure TFormNEP1.DBN2Click(Sender: TObject; Button: TNavigateBtn);
begin
 UpdateMenu;
end;

procedure TFormNEP1.Mnu_operacieClick(Sender: TObject);
begin
  UpdateMenu;
end;

function VytvorXml:AnsiString;
var i,pc,pohl,typRL2:integer;
    typRL,typRL_zmena,oldIDX:string;
function XDAT(X:TDateTime):string;
begin
  if X=StrToDate('30.12.1899') then Result:='' else Result:=FormatDateTime('dd.mm.yyyy',X);
end;
procedure VytvorIdentFoDopl(tagName:string);
begin with DMZ,DM do begin
  E_TAGZ(tagName);
  EX_TAG('rodPriezvisko',TZAM_Prev_name.Value);
  E_TAG('datNarodenia',XDAT(TZAM_Born_date.Value));
  E_TAG('miestoNarodenia',NVL1(TZAM_Born_city.Value,'neuvedené'));
  E_TAG('statP',STAT(TZAM_Stat_obcan.AsString));
  EX_TAG('ssnStatP',STAT(TZAM_SSN.Value));
  EX_TAG('cpp',TZAM_Cpp.Value);
  E_TAG('stav',TZAM_Rod_stav.AsString);
  TDOCH_.Last;
  EX_TAG('dochodok',TDOCH_Typ.AsString);
  E_TAGK(tagName);
end;end;
procedure VytvorAdresa;
var A1,A2,A3:string;
begin with DMZ,DM do begin
  MyRozdelUlicuExt(TZAM_tp_street.Value,A1,A2,A3);
  E_TAGZ('adresa');
  EX_TAG('ulica',A1);
  EX_TAG('supCislo',A3);
  EX_TAG('oCislo',A2);
  E_TAG('obec',TZAM_tp_city.Value);
  E_TAG('psc',TZAM_tp_zip.Value);
  if TZAM_tp_zip2.Value<>'' then E_TAG('zipKod',TZAM_tp_zip2.Value);
  E_TAG('stat',STAT(TZAM_stat_tp.AsString));
  E_TAGK('adresa');
end;end;
procedure VytvorAdresaKontZamnec;
var A1,A2,A3:string;
begin with DMZ,DM do begin
  MyRozdelUlicuExt(TZAM_pp_street.Value,A1,A2,A3);
  E_TAGZ('korAdresa');
  if TZAM_pp_city.Value<>'' then
  begin
    E_TAGZ('adresa');
    EX_TAG('ulica',A1);
    EX_TAG('supCislo',A3);
    EX_TAG('oCislo',A2);
    E_TAG('obec',TZAM_pp_city.Value);
    E_TAG('psc',TZAM_pp_zip.Value);
    if TZAM_pp_zip2.Value<>'' then E_TAG('zipKod',TZAM_pp_zip2.Value);
    E_TAG('stat',STAT(TZAM_stat_pp.AsString));
    E_TAGK('korAdresa');
  end;
  E_TAG('tel',TZAM_Tel1.Value);
  E_TAG('fax',TZAM_Fax.Value);
  E_TAG('mail',TZAM_Mail.Value);
  E_TAGK('korAdresa');
end;end;
procedure VytvorAdresaKontZamtel;
var A1,A2,A3:string;
begin with DM,DMZ do begin
  E_TAGZ('adresaZel');
  if TINF_KA_MESTO.Value<>'' then
  begin
    MyRozdelUlicuExt(TINF_KA_ULICA.Value,A1,A2,A3);
    E_TAGZ('adresa');
    EX_TAG('ulica',A1);
    EX_TAG('supCislo',A3);
    EX_TAG('oCislo',A2);
    E_TAG('obec',TINF_KA_MESTO.Value);
    E_TAG('psc',TINF_KA_PSC.Value);
    E_TAG('stat',STAT(TINF_KA_STAT.Value));
    if TINF_KA_ZIP.Value<>'' then E_TAG('zipKod',TINF_KA_ZIP.Value);
    E_TAGK('adresa');
  end else
  begin
    MyRozdelUlicuExt(TINF_ADR_ULICA1.Value,A1,A2,A3);
    E_TAGZ('adresa');
    EX_TAG('ulica',A1);
    EX_TAG('supCislo',A3);
    EX_TAG('oCislo',A2);
    E_TAG('obec',TINF_ADR_MESTO.Value);
    E_TAG('psc',TINF_ADR_PSC.Value);
    E_TAG('stat',STAT(TINF_ADR_STAT.Value));
    if TINF_ADR_ZIP.Value<>'' then E_TAG('zipKod',TINF_ADR_ZIP.Value);
    E_TAGK('adresa');
  end;
  E_TAG('tel',TINF_ADR_Telefon.Value);
  E_TAG('fax',TINF_ADR_Fax.Value);
  E_TAG('mail',TINF_ADR_Email.Value);
  E_TAGK('adresaZel');
end;end;
procedure VytvorUcet;
begin with DMZ do begin
   if (TZAM_Cislo_u.Value<>'') and (TZAM_Banka_u.Value<>'') then
   begin
     E_TAGZ('ucet');
     E_TAG('nazovSidloBanky',TZAM_Banka2_u.Value);
     E_TAG('kodBanky',TZAM_Banka_u.Value);
     E_TAG('cisloUctu',LongCisloU(TZAM_predcislo_u.Value,TZAM_Cislo_u.Value));
     E_TAGK('ucet');
  end;
end;end;
begin with FormNEP1,DM,DMZ do begin
  try
  oldIDX:=TZAM_.IndexName;
  SAVE_FILTER;
  TZAM_.IndexName:='Zam1';
  pc:=0;
  MyXML := '';
  E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
  E_TEXT(' <spRegListZec xmlns="http://socpoist.sk/xsd/rlzec17" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://socpoist.sk/xsd/rlzec17 RLZEC-v1.7.xsd">');
  E_TAG('typDoc','RLZEC0001');
  E_TAGZ('zamestnavatel');
  E_TAGZ('identifikacia');
  E_TAG('icz',TINF_ICZ.Value);
  E_TAGZ('identifikator');
  E_TAG('ico',TINF_ICO.Value);
  E_TAGK('identifikator');
  E_TAG('nazov',TINF_NAZOV.Value);
  E_TAGK('identifikacia');
  if TINF_TYP_ZEL.Value = 'FO' then begin
    E_TAGZ('fOsoba');
    E_TAGZ('identifikatorFO');
    E_TAG('rc',TINF_FO_RC.Value);
    E_TAG('cpp',TINF_FO_CPP.Value);
    E_TAGK('identifikatorFO');
    E_TAG('priezvisko',TINF_FO_Surname.Value);
    E_TAG('meno',TINF_FO_Name.Value);
    EX_TAG('titul',TINF_FO_Titul_Pred.Value);
    //EX_TAG('titulZa',TINF_FO_Titul_Za.Value);
    E_TAGK('fOsoba');
  end;
  VytvorAdresaKontZamtel;
  E_TAGK('zamestnavatel');
  E_TAGZ('zoznamRLZec');
  E_TAGZ('regListyZec');
  for i:=0 to DBG1.SelectedRows.Count-1 do
  with DBG1.DataSource.DataSet do begin
    GotoBookmark(Pointer(DBG1.SelectedRows.Items[i]));
    if TZAM_Code_emp.Value<>TNEP_Code_emp.Value
     then SET_FILTER('code_emp='+TNEP_Code_emp.AsString);
    typRL:=TNEP_TypRL.Value;
    if typRL='MD' then typRL_zmena:='PE' else typRL_zmena := typRL;
    typRL2:=TNEP_TypRL2.Value;
    E_TAGZA('regListZec','typRL="'+typRL_zmena+'"');
    E_TAGZ('identFO');
    if TZAM_ssn.Value<>'' then E_TAG('icp',TZAM_ssn.Value);
    E_TAG('rodneC',TZAM_born_numb.Value);
    E_TAG('priezvisko',TZAM_surname.Value);
    E_TAG('meno',TZAM_name.Value);
    E_TAG('titul',TZAM_Title.Value);
    if TZAM_Pohlavie.Value='M' then pohl:=1 else pohl:=2;
    E_TAG('pohlavie',IntToStr(pohl));
    E_TAGK('identFO');
    case TZAM_TYPZEC.Value of
    0,1: E_ATTRZ('typZec','PP');
    2: E_ATTRZ('typZec','D');
    end;
    E_TAGZA('typRegListuZec',MyAttr);
    if typRL='PA' then begin
       E_TAGZ('prihlaska');
       VytvorIdentFODopl('identFODopl');
       VytvorAdresa;
       VytvorAdresaKontZamnec;
       VytvorUcet;
       E_TAG('datVznikPoist',XDAT(TNEP_Datum_od.Value));
       E_TAGK('prihlaska');
    end else
    if typRL='ZM' then begin
       E_ATTRZ('datUplatnenia',XDAT(TNEP_Datum_od.Value));
       E_TAGZA('zmena',MyAttr);
       VytvorIdentFODopl('identFODoplZmena');
       VytvorAdresa;
       VytvorAdresaKontZamnec;
       VytvorUcet;
       E_TAG('datVznikPoist',XDAT(TNEP_Datum_od.Value));
       E_TAGK('zmena');
    end else
    if typRL='PE' then begin
       E_TAGZ('prerusenie');
       case typRL2 of
         2:begin
            E_ATTRZ('datVzniku',XDAT(TNEP_Datum_od.Value));
            E_ATTR('dovod',TNEP_Prerusenie.AsString);
            E_TAGA('vznikPrerus',MyAttr);
           end;
         3:begin
            E_TAG('zanikPrerus',XDAT(TNEP_Datum_do.Value));
           end;
         1:begin
            E_TAGZ('vznik_zanikPrerus');
            E_ATTRZ('datVzniku',XDAT(TNEP_Datum_od.Value));
            E_ATTR('dovod',TNEP_Prerusenie.AsString);
            E_TAGA('vznikPrerus',MyAttr);
            E_ATTRZ('datZaniku',XDAT(TNEP_Datum_do.Value));
            E_TAGA('zanikPrerus',MyAttr);
            E_TAGK('vznik_zanikPrerus');
          end;
       end;
       E_TAGK('prerusenie');
    end else
    if typRL='MD' then begin
       E_TAGZ('prerusenie');
       case typRL2 of
         2:begin
            E_ATTRZ('datZac',XDAT(TNEP_Datum_od.Value));
            E_TAGA('zacMD_RD',MyAttr);
           end;
         3:begin
            E_ATTRZ('datKon',XDAT(TNEP_Datum_do.Value));
            E_TAGA('konMD_RD',MyAttr);
           end;
         1:begin
            E_TAGZ('zac_konMD_RD');
            E_ATTRZ('datZac',XDAT(TNEP_Datum_od.Value));
            E_TAGA('zacMD_RD',MyAttr);
            E_ATTRZ('datKon',XDAT(TNEP_Datum_do.Value));
            E_TAGA('konMD_RD',MyAttr);
            E_TAGK('zac_konMD_RD');
          end;
       end;
       E_TAGK('prerusenie');
    end else
    if typRL='OD' then begin
       case TZAM_TYPZEC.Value of
       1:   E_ATTRZ('pracPomer','1');
       0,2: E_ATTRZ('pracPomer','2');
       end;
       E_TAGZA('odhlaska',MyAttr);
       E_TAG('datZanikPoist',XDAT(TNEP_Datum_do.Value));
       E_TAGK('odhlaska');
    end;
    E_TAGK('typRegListuZec');
    E_TAGK('regListZec');
  end;
  E_TAGK('regListyZec');
  E_TAGK('zoznamRLZec');
  E_TAGZ('vystavenie');
  E_TAG('zostavil',TTLA_Vykaz_zostavil.Value);
  E_TAG('datumVyst',XDAT(TTLA_Den.Value));
  E_TAGK('vystavenie');
  E_TAGK('spRegListZec');
  Result := MyXml;
finally
  RESTORE_FILTER;
  TZAM_.IndexName:=oldIDX;
end;
end;end; {VytvorXML}

{VytvorXml_v1_7------------------------------------------}

function VytvorXml_v1_7:AnsiString;
var i,pc,pohl,typRL2:integer;
    typRL,typRL_zmena,oldIDX:string;
function XDAT(X:TDateTime):string;
begin
  if X=StrToDate('30.12.1899') then Result:='' else Result:=FormatDateTime('dd.mm.yyyy',X);
end;
procedure VytvorIdentFoDopl(tagName:string);
begin with DMZ,DM do begin
  E_TAGZ(tagName);
  EX_TAG('rodPriezvisko',TZAM_Prev_name.Value);
  E_TAG('datNarodenia',XDAT(TZAM_Born_date.Value));
  E_TAG('miestoNarodenia',NVL1(TZAM_Born_city.Value,'neuvedené'));
  E_TAG('statP',STAT(TZAM_Stat_obcan.AsString));
  E_TAG('stav',TZAM_Rod_stav.AsString);
  TDOCH_.Last;
  EX_TAG('dochodok',TDOCH_Typ.AsString);
  E_TAGK(tagName);
end;end;
procedure VytvorAdresa;
var A1,A2,A3:string;
begin with DMZ,DM do begin
  MyRozdelUlicuExt(TZAM_tp_street.Value,A1,A2,A3);
  E_TAGZ('adresa');
  EX_TAG('ulica',A1);
  EX_TAG('supCislo',A3);
  EX_TAG('oCislo',A2);
  E_TAG('obec',TZAM_tp_city.Value);
  E_TAG('psc',TZAM_tp_zip.Value);
  if TZAM_tp_zip2.Value<>'' then E_TAG('zipKod',TZAM_tp_zip2.Value);
  E_TAG('stat',STAT(TZAM_stat_tp.AsString));
  E_TAGK('adresa');
end;end;
procedure VytvorAdresaKontZamnec;
var A1,A2,A3:string;
begin with DMZ,DM do begin
  MyRozdelUlicuExt(TZAM_pp_street.Value,A1,A2,A3);
  E_TAGZ('korAdresa');
  if TZAM_pp_city.Value<>'' then
  begin
    E_TAGZ('adresa');
    E_TAG('ulica',A1);
    EX_TAG('supCislo',A3);
    EX_TAG('oCislo',A2);
    E_TAG('obec',TZAM_pp_city.Value);
    E_TAG('psc',TZAM_pp_zip.Value);
    if TZAM_pp_zip2.Value<>'' then E_TAG('zipKod',TZAM_pp_zip2.Value);
    E_TAG('stat',STAT(TZAM_stat_pp.AsString));
    E_TAGK('korAdresa');
  end;
  E_TAG('tel',TZAM_Tel1.Value);
  E_TAG('fax',TZAM_Fax.Value);
  E_TAG('mail',TZAM_Mail.Value);
  E_TAGK('korAdresa');
end;end;
procedure VytvorAdresaKontZamtel;
var A1,A2,A3:string;
begin with DM,DMZ do begin
  E_TAGZ('adresaZel');
  if TINF_KA_MESTO.Value<>'' then
  begin
    MyRozdelUlicuExt(TINF_KA_ULICA.Value,A1,A2,A3);
    E_TAGZ('adresa');
    EX_TAG('ulica',A1);
    EX_TAG('supCislo',A3);
    EX_TAG('oCislo',A2);
    E_TAG('obec',TINF_KA_MESTO.Value);
    E_TAG('psc',TINF_KA_PSC.Value);
    E_TAG('stat',STAT(TINF_KA_STAT.Value));
    if TINF_KA_ZIP.Value<>'' then E_TAG('zipKod',TINF_KA_ZIP.Value);
    E_TAGK('adresa');
  end else
  begin
    MyRozdelUlicuExt(TINF_ADR_ULICA1.Value,A1,A2,A3);
    E_TAGZ('adresa');
    EX_TAG('ulica',A1);
    EX_TAG('supCislo',A3);
    EX_TAG('oCislo',A2);
    E_TAG('obec',TINF_ADR_MESTO.Value);
    E_TAG('psc',TINF_ADR_PSC.Value);
    E_TAG('stat',STAT(TINF_ADR_STAT.Value));
    if TINF_ADR_ZIP.Value<>'' then E_TAG('zipKod',TINF_ADR_ZIP.Value);
    E_TAGK('adresa');
  end;
  E_TAG('tel',TINF_ADR_Telefon.Value);
  E_TAG('fax',TINF_ADR_Fax.Value);
  E_TAG('mail',TINF_ADR_Email.Value);
  E_TAGK('adresaZel');
end;end;
procedure VytvorUcet;
begin with DMZ do begin
   if (TZAM_Cislo_u.Value<>'') and (TZAM_Banka_u.Value<>'') then
   begin
     E_TAGZ('ucet');
     E_TAG('nazovSidloBanky',TZAM_Banka2_u.Value);
     E_TAG('kodBanky',TZAM_Banka_u.Value);
     E_TAG('cisloUctu',LongCisloU(TZAM_predcislo_u.Value,TZAM_Cislo_u.Value));
     E_TAGK('ucet');
  end;
end;end;
begin with FormNEP1,DM,DMZ do begin
  try
  oldIDX:=TZAM_.IndexName;
  SAVE_FILTER;
  TZAM_.IndexName:='Zam1';
  pc:=0;
  MyXML := '';
  E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
  E_TEXT(' <spRegListZec xmlns="http://socpoist.sk/xsd/rlzec17" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://socpoist.sk/xsd/rlzec17 RLZEC-v1.7.xsd">');
  E_TAG('typDoc','RLZEC0001');
  E_TAGZ('zamestnavatel');
  E_TAGZ('identifikacia');
  E_TAG('icz',TINF_ICZ.Value);
  E_TAGZ('identifikator');
  E_TAG('ico',TINF_ICO.Value);
  E_TAGK('identifikator');
  E_TAG('nazov',TINF_NAZOV.Value);
  E_TAGK('identifikacia');
  if TINF_TYP_ZEL.Value = 'FO' then begin
    E_TAGZ('fOsoba');
    {E_TAGZ('identifikatorFO');}
    E_TAG('rodneC',TINF_FO_RC.Value);
    {E_TAG('cpp',TINF_FO_CPP.Value);}
    {E_TAGK('identifikatorFO');}
    E_TAG('priezvisko',TINF_FO_Surname.Value);
    E_TAG('meno',TINF_FO_Name.Value);
    EX_TAG('titul',TINF_FO_Titul_Pred.Value);
    //EX_TAG('titulZa',TINF_FO_Titul_Za.Value);
    E_TAGK('fOsoba');
  end;
  VytvorAdresaKontZamtel;
  E_TAGK('zamestnavatel');
  E_TAGZ('zoznamRLZec');
  E_TAGZ('regListyZec');
  for i:=0 to DBG1.SelectedRows.Count-1 do
  with DBG1.DataSource.DataSet do begin
    GotoBookmark(Pointer(DBG1.SelectedRows.Items[i]));
    if TZAM_Code_emp.Value<>TNEP_Code_emp.Value
     then SET_FILTER('code_emp='+TNEP_Code_emp.AsString);
    typRL:=TNEP_TypRL.Value;
    if (typRL='MD') or (typRL='RD') then typRL_zmena:='ZM' else typRL_zmena := typRL;
    typRL2:=TNEP_TypRL2.Value;
    E_TAGZA('regListZec','typRL="'+typRL_zmena+'"');
    E_TAGZ('identFO');
    if TZAM_ssn.Value<>'' then E_TAG('icp',TZAM_ssn.Value);
    E_TAG('rodneC',TZAM_born_numb.Value);
    E_TAG('priezvisko',TZAM_surname.Value);
    E_TAG('meno',TZAM_name.Value);
    E_TAG('titul',TZAM_Title.Value);
    if TZAM_Pohlavie.Value='M' then pohl:=1 else pohl:=2;
    E_TAG('pohlavie',IntToStr(pohl));
    E_TAGK('identFO');
    case TZAM_TYPZEC.Value of
    0,1: E_ATTRZ('typZec','PP');
    2: E_ATTRZ('typZec','D');
    end;
    E_TAGZA('typRegListuZec',MyAttr);
    if typRL='PA' then begin
       E_TAGZ('prihlaska');
       VytvorIdentFODopl('identFODopl');
       VytvorAdresa;
       VytvorAdresaKontZamnec;
       VytvorUcet;
       E_TAG('datVznikPoist',XDAT(TNEP_Datum_od.Value));
       E_TAG('statVykPrace','SK');
       E_TAGK('prihlaska');
    end else
    if typRL='ZM' then begin
       E_ATTRZ('datUplatnenia',XDAT(TNEP_Datum_od.Value));
       E_TAGZA('zmena',MyAttr);
       VytvorIdentFODopl('identFODoplZmena');
       VytvorAdresa;
       VytvorAdresaKontZamnec;
       VytvorUcet;
       E_TAG('datVznikPoist',XDAT(TNEP_Datum_od.Value));
       E_TAG('statVykPrace','SK');
       E_TAGK('zmena');
    end else
    if typRL='PE' then begin
       E_TAGZ('prerusenie');
       case typRL2 of
         2:begin
            E_ATTRZ('datVzniku',XDAT(TNEP_Datum_od.Value));
            E_ATTR('dovod',TNEP_Prerusenie.AsString);
            E_TAGA('vznikPrerus',MyAttr);
           end;
         3:begin
            E_TAG('zanikPrerus',XDAT(TNEP_Datum_do.Value));
           end;
         1:begin
            E_TAGZ('vznik_zanikPrerus');
            E_ATTRZ('datVzniku',XDAT(TNEP_Datum_od.Value));
            E_ATTR('dovod',TNEP_Prerusenie.AsString);
            E_TAGA('vznikPrerus',MyAttr);
            E_ATTRZ('datZaniku',XDAT(TNEP_Datum_do.Value));
            E_TAGA('zanikPrerus',MyAttr);
            E_TAGK('vznik_zanikPrerus');
          end;
       end;
       E_TAGK('prerusenie');
    end else
    if typRL='MD' then begin
       E_TAGZ('zmena');
       E_TAGZ('md');
       case typRL2 of
         2:begin
            E_ATTRZ('datZac',XDAT(TNEP_Datum_od.Value));
            E_TAGA('zacMD',MyAttr);
           end;
         3:begin
            E_ATTRZ('datKon',XDAT(TNEP_Datum_do.Value));
            E_TAGA('konMD',MyAttr);
           end;
         1:begin
            E_TAGZ('zac_konMD');
            E_ATTRZ('datZac',XDAT(TNEP_Datum_od.Value));
            E_TAGA('zacMD',MyAttr);
            E_ATTRZ('datKon',XDAT(TNEP_Datum_do.Value));
            E_TAGA('konMD',MyAttr);
            E_TAGK('zac_konMD');
          end;
       end;
       E_TAGK('md');
       E_TAGK('zmena');
    end else
    if typRL='RD' then begin
       E_TAGZ('zmena');
       E_TAGZ('rd');
       case typRL2 of
         2:begin
            E_ATTRZ('datZac',XDAT(TNEP_Datum_od.Value));
            E_TAGA('zacRD',MyAttr);
           end;
         3:begin
            E_ATTRZ('datKon',XDAT(TNEP_Datum_do.Value));
            E_TAGA('konRD',MyAttr);
           end;
         1:begin
            E_TAGZ('zac_konRD');
            E_ATTRZ('datZac',XDAT(TNEP_Datum_od.Value));
            E_TAGA('zacRD',MyAttr);
            E_ATTRZ('datKon',XDAT(TNEP_Datum_do.Value));
            E_TAGA('konRD',MyAttr);
            E_TAGK('zac_konRD');
          end;
       end;
       E_TAGK('rd');
       E_TAGK('zmena');
    end else
    if typRL='OD' then begin
       case TZAM_TYPZEC.Value of
       0: begin E_ATTRZ('pracPomer','2');
                E_TAGZA('odhlaskaPP',MyAttr);
                E_TAG('datZanikPoist',XDAT(TNEP_Datum_do.Value));
                E_TAGK('odhlaskaPP');
          end;
       1: begin E_ATTRZ('pracPomer','1');
                E_TAGZA('odhlaskaPP',MyAttr);
                E_TAG('datZanikPoist',XDAT(TNEP_Datum_do.Value));
                E_TAGK('odhlaskaPP');
          end;
       2: begin E_TAGZ('odhlaskaD');
                E_TAG('datVznikPoist',XDAT(TNEP_Datum_od.Value));
                E_TAG('datZanikPoist',XDAT(TNEP_Datum_do.Value));
                E_TAGK('odhlaskaD');
          end;
       end;
    end;
    E_TAGK('typRegListuZec');
    E_TAGK('regListZec');
  end;
  E_TAGK('regListyZec');
  E_TAGK('zoznamRLZec');
  E_TAGZ('vystavenie');
  E_TAG('zostavil',TTLA_Vykaz_zostavil.Value);
  E_TAG('datumVyst',XDAT(TTLA_Den.Value));
  E_TAGK('vystavenie');
  E_TAGK('spRegListZec');
  Result := MyXml;
finally
  RESTORE_FILTER;
  TZAM_.IndexName:=oldIDX;
end;
end;end; {VytvorXml_v1_7}

{VytvorXml_v2011-----------------------------------------}

function VytvorXml_v2011:AnsiString;
var i,pc,pohl,typRL2:integer;
    typRL,typRL_zmena,oldIDX:string;
function XDAT(X:TDateTime):string;
begin
  if X=StrToDate('30.12.1899') then Result:='' else Result:=FormatDateTime('dd.mm.yyyy',X);
end;
procedure VytvorIdentFoDopl(tagName:string);
begin with DMZ,DM do begin
  E_TAGZ(tagName);
  EX_TAG('rodPriezvisko',TZAM_Prev_name.Value);
  E_TAG('datNarodenia',XDAT(TZAM_Born_date.Value));
  E_TAG('miestoNarodenia',NVL1(TZAM_Born_city.Value,'neuvedené'));
  E_TAG('statP',STAT(TZAM_Stat_obcan.AsString));
  E_TAG('stav',TZAM_Rod_stav.AsString);
  TDOCH_.Last;
  E_TAGK(tagName);
end;end;
procedure VytvorAdresa;
var A1,A2,A3:string;
begin with DMZ,DM do begin
  MyRozdelUlicuExt(TZAM_tp_street.Value,A1,A2,A3);
  if ((A1='') and (A2<>'') and (A3='')) then begin
    A3:=A2; A2:=''; 
  end;
  E_TAGZ('adresa');
  EX_TAG('ulica',A1);
  EX_TAG('supCislo',A3);
  EX_TAG('oCislo',A2);
  E_TAG('obec',TZAM_tp_city.Value);
  E_TAG('psc',TZAM_tp_zip.Value);
  if TZAM_tp_zip2.Value<>'' then E_TAG('zipKod',TZAM_tp_zip2.Value);
  E_TAG('stat',STAT(TZAM_stat_tp.AsString));
  E_TAGK('adresa');
end;end;
procedure VytvorAdresaKontZamnec;
var A1,A2,A3:string;
begin with DMZ,DM do begin
  MyRozdelUlicuExt(TZAM_pp_street.Value,A1,A2,A3);
  if ((A1='') and (A2<>'') and (A3='')) then begin
    A3:=A2; A2:='';
  end;
  E_TAGZ('korAdresa');
  if TZAM_pp_city.Value<>'' then
  begin
    E_TAGZ('adresa');
    EX_TAG('ulica',A1);
    EX_TAG('supCislo',A3);
    EX_TAG('oCislo',A2);
    E_TAG('obec',TZAM_pp_city.Value);
    E_TAG('psc',TZAM_pp_zip.Value);
    if TZAM_pp_zip2.Value<>'' then E_TAG('zipKod',TZAM_pp_zip2.Value);
    E_TAG('stat',STAT(TZAM_stat_pp.AsString));
    E_TAGK('korAdresa');
  end;
  E_TAG('tel',TZAM_Tel1.Value);
  E_TAG('fax',TZAM_Fax.Value);
  E_TAG('mail',TZAM_Mail.Value);
  E_TAGK('korAdresa');
end;end;
procedure VytvorAdresaKontZamtel;
var A1,A2,A3:string;
begin with DM,DMZ do begin
  E_TAGZ('adresaZel');
  if TINF_KA_MESTO.Value<>'' then
  begin
    MyRozdelUlicuExt(TINF_KA_ULICA.Value,A1,A2,A3);
    if ((A1='') and (A2<>'') and (A3='')) then begin
      A3:=A2; A2:='';
    end;
    E_TAGZ('adresa');
    EX_TAG('ulica',A1);
    EX_TAG('supCislo',A3);
    EX_TAG('oCislo',A2);
    E_TAG('obec',TINF_KA_MESTO.Value);
    E_TAG('psc',TINF_KA_PSC.Value);
    E_TAG('stat',STAT(TINF_KA_STAT.Value));
    if TINF_KA_ZIP.Value<>'' then E_TAG('zipKod',TINF_KA_ZIP.Value);
    E_TAGK('adresa');
  end else
  begin
    MyRozdelUlicuExt(TINF_ADR_ULICA1.Value,A1,A2,A3);
    if ((A1='') and (A2<>'') and (A3='')) then begin
      A3:=A2; A2:='';
    end;
    E_TAGZ('adresa');
    EX_TAG('ulica',A1);
    EX_TAG('supCislo',A3);
    EX_TAG('oCislo',A2);
    E_TAG('obec',TINF_ADR_MESTO.Value);
    E_TAG('psc',TINF_ADR_PSC.Value);
    E_TAG('stat',STAT(TINF_ADR_STAT.Value));
    if TINF_ADR_ZIP.Value<>'' then E_TAG('zipKod',TINF_ADR_ZIP.Value);
    E_TAGK('adresa');
  end;
  E_TAG('tel',TINF_ADR_Telefon.Value);
  E_TAG('fax',TINF_ADR_Fax.Value);
  E_TAG('mail',TINF_ADR_Email.Value);
  E_TAGK('adresaZel');
end;end;
procedure VytvorUcet;
begin with DMZ do begin
   if (TZAM_Cislo_u.Value<>'') and (TZAM_Banka_u.Value<>'') then
   begin
     E_TAGZ('ucet');
     E_TAG('nazovSidloBanky',TZAM_Banka2_u.Value);
     E_TAG('kodBanky',TZAM_Banka_u.Value);
     E_TAG('cisloUctu',LongCisloU(TZAM_predcislo_u.Value,TZAM_Cislo_u.Value));
     E_TAGK('ucet');
  end;
end;end;
begin with FormNEP1,DM,DMZ do begin
  try
  oldIDX:=TZAM_.IndexName;
  SAVE_FILTER;
  TZAM_.IndexName:='Zam1';
  pc:=0;
  MyXML := '';
  E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
  E_TEXT('<spRegListZec xmlns="http://socpoist.sk/xsd/rlzec2011" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://socpoist.sk/xsd/rlzec2011 RLZEC-v2011.xsd">');
  E_TAG('typDoc','RLZEC0001');
  E_TAGZ('zamestnavatel');
  E_TAGZ('identifikacia');
  E_TAG('icz',TINF_ICZ.Value);
  E_TAGZ('identifikator');
  E_TAG('ico',TINF_ICO.Value);
  E_TAGK('identifikator');
  E_TAG('nazov',TINF_NAZOV.Value);
  E_TAGK('identifikacia');
  if TINF_TYP_ZEL.Value = 'FO' then begin
    E_TAGZ('fOsoba');
    {E_TAGZ('identifikatorFO');}
    E_TAG('rodneC',TINF_FO_RC.Value);
    {E_TAG('cpp',TINF_FO_CPP.Value);}
    {E_TAGK('identifikatorFO');}
    E_TAG('priezvisko',TINF_FO_Surname.Value);
    E_TAG('meno',TINF_FO_Name.Value);
    EX_TAG('titul',TINF_FO_Titul_Pred.Value);
    //EX_TAG('titulZa',TINF_FO_Titul_Za.Value);
    E_TAGK('fOsoba');
  end;
  VytvorAdresaKontZamtel;
  E_TAGK('zamestnavatel');
  E_TAGZ('zoznamRLZec');
  E_TAGZ('regListyZec');
  for i:=0 to DBG1.SelectedRows.Count-1 do
  with DBG1.DataSource.DataSet do begin
    GotoBookmark(Pointer(DBG1.SelectedRows.Items[i]));
    if TZAM_Code_emp.Value<>TNEP_Code_emp.Value
     then SET_FILTER('code_emp='+TNEP_Code_emp.AsString);
    typRL:=TNEP_TypRL.Value;
    if (typRL='MD') or (typRL='RD') then typRL_zmena:='ZM' else typRL_zmena := typRL;
    typRL2:=TNEP_TypRL2.Value;
    E_TAGZA('regListZec','typRL="'+typRL_zmena+'"');
    E_TAGZ('identFO');
    if TZAM_ssn.Value<>'' then E_TAG('icp',TZAM_ssn.Value);
    E_TAG('rodneC',TZAM_born_numb.Value);
    E_TAG('priezvisko',TZAM_surname.Value);
    E_TAG('meno',TZAM_name.Value);
    E_TAG('titul',TZAM_Title.Value);
    if TZAM_Pohlavie.Value='M' then pohl:=1 else pohl:=2;
    E_TAG('pohlavie',IntToStr(pohl));
    E_TAGK('identFO');
    case TZAM_TYPZEC.Value of
    0,1: E_ATTRZ('typZec','PP');
    2: E_ATTRZ('typZec','D');
    3: E_ATTRZ('typZec','NP');
    end;
    E_TAGZA('typRegListuZec',MyAttr);
    if typRL='PA' then begin
       E_TAGZ('prihlaska');
       VytvorIdentFODopl('identFODopl');
       VytvorAdresa;
       VytvorAdresaKontZamnec;
       VytvorUcet;
       E_TAG('datVznikPoist',XDAT(TNEP_Datum_od.Value));
       E_TAG('statVykPrace','SK');
       E_TAGK('prihlaska');
    end else
    if typRL='ZM' then begin
       E_ATTRZ('datUplatnenia',XDAT(TNEP_Datum_od.Value));
       E_TAGZA('zmena',MyAttr);
       VytvorIdentFODopl('identFODoplZmena');
       VytvorAdresa;
       VytvorAdresaKontZamnec;
       VytvorUcet;
       E_TAG('datVznikPoist',XDAT(TNEP_Datum_od.Value));
       E_TAG('statVykPrace','SK');
       E_TAGK('zmena');
    end else
    if typRL='PE' then begin
       E_TAGZ('prerusenie');
       case typRL2 of
         2:begin
            E_ATTRZ('datVzniku',XDAT(TNEP_Datum_od.Value));
            E_ATTR('dovod',TNEP_Prerusenie.AsString);
            E_TAGA('vznikPrerus',MyAttr);
           end;
         3:begin
            E_TAG('zanikPrerus',XDAT(TNEP_Datum_do.Value));
           end;
         1:begin
            E_TAGZ('vznik_zanikPrerus');
            E_ATTRZ('datVzniku',XDAT(TNEP_Datum_od.Value));
            E_ATTR('dovod',TNEP_Prerusenie.AsString);
            E_TAGA('vznikPrerus',MyAttr);
            E_ATTRZ('datZaniku',XDAT(TNEP_Datum_do.Value));
            E_TAGA('zanikPrerus',MyAttr);
            E_TAGK('vznik_zanikPrerus');
          end;
       end;
       E_TAGK('prerusenie');
    end else
    if typRL='MD' then begin
       E_ATTRZ('datUplatnenia',XDAT(TNEP_Datum_od.Value));
       E_TAGZA('zmena',MyAttr);
       E_TAGZ('md');
       case typRL2 of
         2:begin
            E_ATTRZ('datZac',XDAT(TNEP_Datum_od.Value));
            E_TAGA('zacMD',MyAttr);
           end;
         3:begin
            E_ATTRZ('datKon',XDAT(TNEP_Datum_do.Value));
            E_TAGA('konMD',MyAttr);
           end;
         1:begin
            E_TAGZ('zac_konMD');
            E_ATTRZ('datZac',XDAT(TNEP_Datum_od.Value));
            E_TAGA('zacMD',MyAttr);
            E_ATTRZ('datKon',XDAT(TNEP_Datum_do.Value));
            E_TAGA('konMD',MyAttr);
            E_TAGK('zac_konMD');
          end;
       end;
       E_TAGK('md');
       E_TAGK('zmena');
    end else
    if typRL='RD' then begin
       E_ATTRZ('datUplatnenia',XDAT(TNEP_Datum_od.Value));
       E_TAGZA('zmena',MyAttr);
       E_TAGZ('rd');
       case typRL2 of
         2:begin
            E_ATTRZ('datZac',XDAT(TNEP_Datum_od.Value));
            E_TAGA('zacRD',MyAttr);
           end;
         3:begin
            E_ATTRZ('datKon',XDAT(TNEP_Datum_do.Value));
            E_TAGA('konRD',MyAttr);
           end;
         1:begin
            E_TAGZ('zac_konRD');
            E_ATTRZ('datZac',XDAT(TNEP_Datum_od.Value));
            E_TAGA('zacRD',MyAttr);
            E_ATTRZ('datKon',XDAT(TNEP_Datum_do.Value));
            E_TAGA('konRD',MyAttr);
            E_TAGK('zac_konRD');
          end;
       end;
       E_TAGK('rd');
       E_TAGK('zmena');
    end else
    if typRL='OD' then begin
       case TZAM_TYPZEC.Value of
       0: begin E_ATTRZ('pracPomer','2');
                E_TAGZA('odhlaskaPP',MyAttr);
                E_TAG('datZanikPoist',XDAT(TNEP_Datum_do.Value));
                E_TAGK('odhlaskaPP');
          end;
       1: begin E_ATTRZ('pracPomer','1');
                E_TAGZA('odhlaskaPP',MyAttr);
                E_TAG('datZanikPoist',XDAT(TNEP_Datum_do.Value));
                E_TAGK('odhlaskaPP');
          end;
       2: begin E_TAGZ('odhlaskaD');
                E_TAG('datVznikPoist',XDAT(TNEP_Datum_od.Value));
                E_TAG('datZanikPoist',XDAT(TNEP_Datum_do.Value));
                E_TAGK('odhlaskaD');
          end;
       end;
    end;
    E_TAGK('typRegListuZec');
    E_TAGK('regListZec');
  end;
  E_TAGK('regListyZec');
  E_TAGK('zoznamRLZec');
  E_TAGZ('vystavenie');
  E_TAG('zostavil',TTLA_Vykaz_zostavil.Value);
  E_TAG('datumVyst',XDAT(TTLA_Den.Value));
  E_TAGK('vystavenie');
  E_TAGK('spRegListZec');
  Result := MyXml;
finally
  RESTORE_FILTER;
  TZAM_.IndexName:=oldIDX;
end;
end;end; {VytvorXml_v2011}

{VytvorXml_v2013-----------------------------------------}

function VytvorXml_v2013:AnsiString;
var i,pc,pohl,typRL2:integer;
    typRL,typRL_zmena,oldIDX:string;
function XDAT(X:TDateTime):string;
begin
  if X=StrToDate('30.12.1899') then Result:='' else Result:=FormatDateTime('dd.mm.yyyy',X);
end;
function TYPZEC_TO_CODE(typ: integer): string;
begin
  case typ of
  1: Result := 'ZEC';
  2: Result := 'ZECD';
  3: Result := 'ZECN';
  10:Result := 'ZECD1';
  11:Result := 'ZECD1N';
  12:Result := 'ZECD2';
  13:Result := 'ZECD2N';
  14:Result := 'ZECD3';
  15:Result := 'ZECD3N';
  16:Result := 'ZECD4';
  17:Result := 'ZECD4N';
  18:Result := 'ZECDDPP';
  19:Result := 'ZECDDPN';
  20:Result := 'ZECDN';
  21:Result := 'ZECDNDP';
  22:Result := 'ZECDNNPDPPVN';
  23:Result := 'ZECDNSDP';
  end;
end;
procedure VytvorIdentFoDopl(tagName:string);
begin with DMZ,DM do begin
  E_TAGZ(tagName);
  EX_TAG('rodPriezvisko',TZAM_Born_name.Value);
  E_TAG('datNarodenia',XDAT(TZAM_Born_date.Value));
  E_TAG('miestoNarodenia',NVL1(TZAM_Born_city.Value,'neuvedené'));
  E_TAG('statP',STAT(TZAM_Stat_obcan.AsString));
  if TZAM_Pohlavie.Value='M' then pohl:=1 else pohl:=2;
  E_TAG('pohlavie',IntToStr(pohl));
  E_TAG('stav',TZAM_Rod_stav.AsString);
  TDOCH_.Last;
  E_TAGK(tagName);
end;end;
procedure VytvorAdresa;
var A1,A2,A3:string;
begin with DMZ,DM do begin
  E_TAGZ('adresa');
      if TZAM_tp_ulica.Value<>'' then {Adresa s ulicou}
      begin
        E_TAG('ulica',TZAM_tp_ulica.Value);
        EX_TAG('supCislo',TZAM_tp_supcislo.AsString);
        E_TAG('oCislo',TZAM_tp_ocislo.Value);
        E_TAG('obec',TZAM_tp_city.Value);
        if (TZAM_stat_tp.Value='') or (TZAM_stat_tp.Value='703')
          then E_TAG('psc',TZAM_tp_zip.Value)
          else E_TAG('psc',TZAM_tp_zip2.Value);
        E_TAG('stat',STAT(TZAM_stat_tp.AsString));
      end else begin {Adresa bez ulice}
        E_TAG('supCislo',TZAM_tp_supcislo.AsString);
        E_TAG('obec',TZAM_tp_city.Value);
        if (TZAM_stat_tp.Value='') or (TZAM_stat_tp.Value='703')
          then E_TAG('psc',TZAM_tp_zip.Value)
          else E_TAG('psc',TZAM_tp_zip2.Value);
        E_TAG('stat',STAT(TZAM_stat_tp.AsString));
      end;
  E_TAGK('adresa');
end;end;
procedure VytvorAdresaKontZamnec;
var A1,A2,A3:string;
begin with DMZ,DM do begin
  if (TZAM_pp_city.Value <> '') or (TZAM_Tel1.Value <> '') or (TZAM_Mail.Value <> '') then begin
  E_TAGZ('korAdresa');
    if TZAM_pp_city.Value <> '' then begin
      E_TAGZ('adresa');
      if TZAM_pp_ulica.Value<>'' then {Adresa s ulicou}
      begin
        E_TAG('ulica',TZAM_pp_ulica.Value);
        EX_TAG('supCislo',TZAM_pp_supcislo.AsString);
        E_TAG('oCislo',TZAM_pp_ocislo.Value);
        E_TAG('obec',TZAM_pp_city.Value);
        if (TZAM_stat_pp.Value='') or (TZAM_stat_pp.Value='703')
          then E_TAG('psc',TZAM_pp_zip.Value)
          else E_TAG('psc',TZAM_pp_zip2.Value);
        E_TAG('stat',STAT(TZAM_stat_pp.AsString));
      end else begin {Adresa bez ulice}
        E_TAG('supCislo',TZAM_pp_supcislo.AsString);
        E_TAG('obec',TZAM_pp_city.Value);
        if (TZAM_stat_pp.Value='') or (TZAM_stat_pp.Value='703')
          then E_TAG('psc',TZAM_pp_zip.Value)
          else E_TAG('psc',TZAM_pp_zip2.Value);
        E_TAG('stat',STAT(TZAM_stat_pp.AsString));
      end;
      E_TAGK('adresa');
    end;
    if TZAM_Tel1.Value <> '' then E_TAG('tel',TZAM_Tel1.Value);
    if TZAM_Mail.Value <> '' then E_TAG('mail',TZAM_Mail.Value);
  E_TAGK('korAdresa');
  end;
end;end;
(*
procedure VytvorAdresaKontZamtel;
var A1,A2,A3:string;
begin with DM,DMZ do begin
  E_TAGZ('adresaZel');
  if TINF_KA_MESTO.Value<>'' then
  begin
    MyRozdelUlicuExt(TINF_KA_ULICA.Value,A1,A2,A3);
    if ((A1='') and (A2<>'') and (A3='')) then begin
      A3:=A2; A2:='';
    end;
    E_TAGZ('adresa');
    EX_TAG('ulica',A1);
    EX_TAG('supCislo',A3);
    EX_TAG('oCislo',A2);
    E_TAG('obec',TINF_KA_MESTO.Value);
    E_TAG('psc',TINF_KA_PSC.Value);
    E_TAG('stat',STAT(TINF_KA_STAT.Value));
    if TINF_KA_ZIP.Value<>'' then E_TAG('zipKod',TINF_KA_ZIP.Value);
    E_TAGK('adresa');
  end else
  begin
    MyRozdelUlicuExt(TINF_ADR_ULICA1.Value,A1,A2,A3);
    if ((A1='') and (A2<>'') and (A3='')) then begin
      A3:=A2; A2:='';
    end;
    E_TAGZ('adresa');
    EX_TAG('ulica',A1);
    EX_TAG('supCislo',A3);
    EX_TAG('oCislo',A2);
    E_TAG('obec',TINF_ADR_MESTO.Value);
    E_TAG('psc',TINF_ADR_PSC.Value);
    E_TAG('stat',STAT(TINF_ADR_STAT.Value));
    if TINF_ADR_ZIP.Value<>'' then E_TAG('zipKod',TINF_ADR_ZIP.Value);
    E_TAGK('adresa');
  end;
  E_TAG('tel',TINF_ADR_Telefon.Value);
  E_TAG('fax',TINF_ADR_Fax.Value);
  E_TAG('mail',TINF_ADR_Email.Value);
  E_TAGK('adresaZel');
end;end;
*)
procedure VytvorUcet;
begin with DMZ do begin
   if (TZAM_Cislo_u.Value<>'') and (TZAM_Banka_u.Value<>'') then
   begin
     E_TAGZ('ucet');
     E_TAG('nazovSidloBanky',TZAM_Banka2_u.Value);
     E_TAG('kodBanky',TZAM_Banka_u.Value);
     E_TAG('cisloUctu',LongCisloU(TZAM_predcislo_u.Value,TZAM_Cislo_u.Value));
     E_TAGK('ucet');
  end;
end;end;
begin with FormNEP1,DM,DMZ do begin
  try
  oldIDX:=TZAM_.IndexName;
  SAVE_FILTER;
  TZAM_.IndexName:='Zam1';
  pc:=0;
  MyXML := '';
  E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
  E_TEXT('<spRegListZec xmlns="http://socpoist.sk/xsd/rlzec2013" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://socpoist.sk/xsd/rlzec2013 RLZEC-v2013.xsd">');
  E_TAG('typDoc','RLZEC0001');
  E_TAGZ('zamestnavatel');
  E_TAGZ('identifikacia');
  E_TAG('icz',TINF_ICZ.Value);
  E_TAGZ('identifikator');
  E_TAG('ico',TINF_ICO.Value);
  E_TAGK('identifikator');
  E_TAG('nazov',TINF_NAZOV.Value);
  E_TAGK('identifikacia');
  if TINF_TYP_ZEL.Value = 'FO' then begin
    E_TAGZ('fOsoba');
    {E_TAGZ('identifikatorFO');}
    E_TAG('rodneC',TINF_FO_RC.Value);
    {E_TAG('cpp',TINF_FO_CPP.Value);}
    {E_TAGK('identifikatorFO');}
    E_TAG('priezvisko',TINF_FO_Surname.Value);
    E_TAG('meno',TINF_FO_Name.Value);
    EX_TAG('titul',TINF_FO_Titul_Pred.Value);
    //EX_TAG('titulZa',TINF_FO_Titul_Za.Value);
    E_TAGK('fOsoba');
  end;
  //VytvorAdresaKontZamtel; {od roku 2013 sa nepouziva}
  E_TAGK('zamestnavatel');
  E_TAGZ('zoznamRLZec');
  E_TAGZ('regListyZec');
  for i:=0 to DBG1.SelectedRows.Count-1 do
  with DBG1.DataSource.DataSet do begin
    GotoBookmark(Pointer(DBG1.SelectedRows.Items[i]));
    if TZAM_Code_emp.Value<>TNEP_Code_emp.Value
     then SET_FILTER('code_emp='+TNEP_Code_emp.AsString);
    typRL:=TNEP_TypRL.Value;
    {Typ registraèného listu: PA - prihláška, OD- odhláška, ZM - zmena, PE - prerušenie, ZP - zrušenie prihlášky}
    if (typRL='MD') or (typRL='RD') then typRL_zmena:='ZM' else typRL_zmena := typRL;
    typRL2:=TNEP_TypRL2.Value;
{-------------->regListZec - povodne tu zacina regListZec a pravdepodobne sa odstranuje samotny typ z neho }
    E_TAGZA('regListZec','typRL="'+typRL_zmena+'"');
    E_TAGZ('identFO');
       E_TAG('rc',TZAM_born_numb.Value);
       E_TAG('priezvisko',TZAM_surname.Value);
       if TZAM_Prev_name.Value<>'' then E_TAG('predPriezvisko',TZAM_Prev_name.Value); {doplnene v roku 2013}
       E_TAG('meno',TZAM_name.Value);
       if TZAM_Title.Value<>'' then E_TAG('titulPred',TZAM_Title.Value);
       //if TZAM_Title_after.Value<>'' then E_TAG('titulZa',TZAM_Title_after.Value); {TODO: rozsirit DM !!!!!!!!!!!!!!!!!!!!!!!!!!!!!}
    E_TAGK('identFO');  (*
    case TZAM_TYPZEC.Value of
    0,1: E_ATTRZ('typZec','PP');
    2: E_ATTRZ('typZec','D');
    3: E_ATTRZ('typZec','NP');
    end; *)
    E_TAGZ('typRegListuFO');
    if typRL='PA' then begin
       E_TAGZ('prihlaska');
       VytvorIdentFODopl('identFODopl');
       VytvorAdresa;
       VytvorAdresaKontZamnec;
       E_TAGZ('typPoistPrihl');
       E_ATTRZ('typZec',TYPZEC_TO_CODE(TNEP_TYPZEC.Value));
       E_TAGZA('zecPrihl',MyAttr);
       VytvorUcet;
       E_TAG('datVznikPoist',XDAT(TNEP_Datum_od.Value));
       EX_TAG('datVznikPV',XDAT(TNEP_DatVznikPV.Value));
       E_TAG('statVykPrace','SK');
       E_TAGK('zecPrihl');
       E_TAGK('typPoistPrihl');
       E_TAGK('prihlaska');
    end else
    if typRL='ZM' then begin
       E_ATTRZ('datUplatnenia',XDAT(TNEP_Datum_od.Value));
       E_TAGZA('zmena',MyAttr);
       if TNEP_Zmena1.Value then VytvorIdentFODopl('identFODoplZmena');
       if TNEP_Zmena2.Value then VytvorAdresa;
       if TNEP_Zmena3.Value then VytvorAdresaKontZamnec;
       E_TAGZ('typPoistZmena');
       E_ATTRZ('typZec',TYPZEC_TO_CODE(TNEP_TYPZEC.Value));
       E_TAGZA('zecZmena',MyAttr);
       if TNEP_Zmena4.Value then VytvorUcet;
       {E_TAG('statVykPrace','SK'); nepovinny atribut}
       { ======== MATERSKA DOVOLENKA ======= }
       if (TNEP_ZacMD.AsString <> '') or (TNEP_KonMD.AsString <> '') then begin
          E_TAGZ('md');
          if (TNEP_ZacMD.AsString <> '') and (TNEP_KonMD.AsString <> '') then begin
            E_TAGZ('zac_konMD');
              E_ATTRZ('datZac',XDAT(TNEP_ZacMD.Value));
              E_TAGA('zacMD',MyAttr);
              E_ATTRZ('datKon',XDAT(TNEP_KonMD.Value));
              E_TAGA('konMD',MyAttr);
            E_TAGK('zac_konMD');
          end else if TNEP_ZacMD.AsString <> '' then begin
              E_ATTRZ('datZac',XDAT(TNEP_ZacMD.Value));
              E_TAGA('zacMD',MyAttr);
          end else if TNEP_KonMD.AsString <> '' then begin
              E_ATTRZ('datKon',XDAT(TNEP_KonMD.Value));
              E_TAGA('konMD',MyAttr);
          end;
          E_TAGK('md');
       end;
       { ======== RODICOVSKA DOVOLENKA ======= }
       if (TNEP_ZacRD.AsString <> '') or (TNEP_KonRD.AsString <> '') then begin
          E_TAGZ('rd');
          if (TNEP_ZacRD.AsString <> '') and (TNEP_KonRD.AsString <> '') then begin
            E_TAGZ('zac_konRD');
              E_ATTRZ('datZac',XDAT(TNEP_ZacRD.Value));
              E_TAGA('zacRD',MyAttr);
              E_ATTRZ('datKon',XDAT(TNEP_KonRD.Value));
              E_TAGA('konRD',MyAttr);
            E_TAGK('zac_konRD');
          end else if TNEP_ZacRD.AsString <> '' then begin
              E_ATTRZ('datZac',XDAT(TNEP_ZacRD.Value));
              E_TAGA('zacRD',MyAttr);
          end else if TNEP_KonRD.AsString <> '' then begin
              E_ATTRZ('datKon',XDAT(TNEP_KonRD.Value));
              E_TAGA('konRD',MyAttr);
          end;
          E_TAGK('rd');
       end;
       E_TAGK('zecZmena');
       E_TAGK('typPoistZmena');
       E_TAGK('zmena');
    end else
    if typRL='PE' then begin
       E_TAGZ('prerusenie');
       E_TAGZ('typPoistPrerus');
       E_ATTRZ('typZec',TYPZEC_TO_CODE(TNEP_TYPZEC.Value));
       E_TAGZA('zecPrerus',MyAttr);
       { ======== PRERUSENIE ======= }
       if (TNEP_Datum_od.AsString <> '') or (TNEP_Datum_do.AsString <> '') then begin
          if (TNEP_Datum_od.AsString <> '') and (TNEP_Datum_do.AsString <> '') then begin
            E_TAGZ('vznik_zanikPrerus');
              E_ATTRZ('datVzniku',XDAT(TNEP_Datum_od.Value));
              E_ATTR('dovod',TNEP_Prerusenie.AsString);
              E_TAGA('vznikPrerus',MyAttr);
              E_ATTRZ('datZaniku',XDAT(TNEP_Datum_do.Value));
              E_TAGA('zanikPrerus',MyAttr);
            E_TAGK('vznik_zanikPrerus');
          end else if TNEP_Datum_od.AsString <> '' then begin
              E_ATTRZ('datVzniku',XDAT(TNEP_Datum_od.Value));
              E_ATTR('dovod',TNEP_Prerusenie.AsString);
              E_TAGA('vznikPrerus',MyAttr);
          end else if TNEP_Datum_do.AsString <> '' then begin
              E_ATTRZ('datZaniku',XDAT(TNEP_Datum_do.Value));
              E_TAGA('zanikPrerus',MyAttr);
          end;
       end;
       E_TAGK('zecPrerus');
       E_TAGK('typPoistPrerus');
       E_TAGK('prerusenie');
    end else
    if typRL='OD' then begin
       E_TAGZ('odhlaska');
       E_TAGZ('typPoistOdhl');
       case TNEP_TYPZEC.Value of
       1: begin
          E_ATTRZ('pracPomer',TNEP_TypPracPomeru.AsString);
          E_TAGZA('zecPPOdhl', MyAttr);
          E_ATTRZ('datVzniku',XDAT(TNEP_Datum_od.Value));
          E_ATTR('datZaniku',XDAT(TNEP_Datum_do.Value));
          E_TAGA('zanik', MyAttr);
          E_TAGK('zecPPOdhl');
          end;
       3: begin
          E_TAGZ('zecNPOdhl');
          E_ATTRZ('datVzniku',XDAT(TNEP_Datum_od.Value));
          E_ATTR('datZaniku',XDAT(TNEP_Datum_do.Value));
          E_TAGA('zanik', MyAttr);
          E_TAGK('zecNPOdhl');
          end;
     else begin
          E_ATTRZ('typZec',TYPZEC_TO_CODE(TNEP_TYPZEC.Value));
          E_TAGZA('zecDOdhl', MyAttr);
          if (TNEP_TypZec.Value = 2) or (TNEP_TypZec.Value = 18) or (TNEP_TypZec.Value = 19)
           then begin
             E_ATTRZ('datVzniku',XDAT(TNEP_Datum_od.Value));
             E_ATTR('datZaniku',XDAT(TNEP_Datum_do.Value));
           end
          else
          E_ATTRZ('datZaniku',XDAT(TNEP_Datum_do.Value));
          E_TAGA('zanik', MyAttr);
          if TNEP_TYPZEC.Value<>2 then EX_TAG('datVznikPV',XDAT(TNEP_datVznikPV.Value));
          E_TAGK('zecDOdhl');
          end;
       end;
       E_TAGK('typPoistOdhl');
       E_TAGK('odhlaska');

    end else
    if typRL='ZP' then begin
       E_TAGZ('zruseniePrihlasky');
       E_TAGZ('typPoistZrus');
       E_ATTRZ('typZec',TYPZEC_TO_CODE(TNEP_TYPZEC.Value));
       E_TAGZA('zecZrus',MyAttr);
       E_TAGZ('poistenie');
       EX_TAG('datVznikPoist',XDAT(TNEP_Datum_od.Value));
       E_TAG('datZruseniaPoist',XDAT(TNEP_Datum_do.Value));
       EX_TAG('datVznikPV',XDAT(TNEP_datVznikPV.Value));
       E_TAGK('poistenie');
       E_TAGK('zecZrus');
       E_TAGK('typPoistZrus');
       E_TAGK('zruseniePrihlasky');
    end;
    E_TAGK('typRegListuFO');
    E_TAGK('regListZec');
  end;
  E_TAGK('regListyZec');
  E_TAGK('zoznamRLZec');
  E_TAGZ('vystavenie');
  E_TAG('zostavil',TTLA_Vykaz_zostavil.Value);
  E_TAG('datumVyst',XDAT(TTLA_Den.Value));
  E_TAGK('vystavenie');
  E_TAGK('spRegListZec');
  Result := MyXml;
finally
  RESTORE_FILTER;
  TZAM_.IndexName:=oldIDX;
end;
end;end; {VytvorXml_v2013}

{VytvorXml_v2014-----------------------------------------}

function VytvorXml_v2014:AnsiString;
var i,pc,pohl,typRL2:integer;
    typRL,typRL_zmena,oldIDX:string;
function XDAT(X:TDateTime):string;
begin
  if X=StrToDate('30.12.1899') then Result:='' else Result:=FormatDateTime('dd.mm.yyyy',X);
end;
function TYPZEC_TO_CODE(typ: integer): string;
begin
  case typ of
  1: Result := 'ZEC';
  2: Result := 'ZECD';
  3: Result := 'ZECN';
  10:Result := 'ZECD1';
  11:Result := 'ZECD1N';
  12:Result := 'ZECD2';
  13:Result := 'ZECD2N';
  14:Result := 'ZECD3';
  15:Result := 'ZECD3N';
  16:Result := 'ZECD4';
  17:Result := 'ZECD4N';
  18:Result := 'ZECDDPP';
  19:Result := 'ZECDDPN';
  20:Result := 'ZECDN';
  21:Result := 'ZECDNDP';
  22:Result := 'ZECDNNPDPPVN';
  23:Result := 'ZECDNSDP';
  end;
end;
procedure VytvorIdentFoDopl(tagName:string);
begin with DMZ,DM do begin
  E_TAGZ(tagName);
  EX_TAG('rodPriezvisko',TZAM_Born_name.Value);
  E_TAG('datNarodenia',XDAT(TZAM_Born_date.Value));
  E_TAG('miestoNarodenia',NVL1(TZAM_Born_city.Value,'neuvedené'));
  E_TAG('statP',STAT(TZAM_Stat_obcan.AsString));
  if TZAM_Pohlavie.Value='M' then pohl:=1 else pohl:=2;
  E_TAG('pohlavie',IntToStr(pohl));
  E_TAG('stav',TZAM_Rod_stav.AsString);
  E_TAG('zamSUcastou',LOWERCASE(TZAM_Statutar_Od_50_percent.AsString));
  E_TAG('par7ods2',LOWERCASE(TZAM_Par7ods2.AsString));
  TDOCH_.Last;
  E_TAGK(tagName);
end;end;
procedure VytvorAdresa;
var A1,A2,A3:string;
begin with DMZ,DM do begin
  E_TAGZ('adresa');
      if TZAM_tp_ulica.Value<>'' then {Adresa s ulicou}
      begin
        E_TAG('ulica',TZAM_tp_ulica.Value);
        EX_TAG('supCislo',TZAM_tp_supcislo.AsString);
        E_TAG('oCislo',TZAM_tp_ocislo.Value);
        E_TAG('obec',TZAM_tp_city.Value);
        if (TZAM_stat_tp.Value='') or (TZAM_stat_tp.Value='703')
          then E_TAG('psc',TZAM_tp_zip.Value)
          else E_TAG('psc',TZAM_tp_zip2.Value);
        E_TAG('stat',STAT(TZAM_stat_tp.AsString));
      end else begin {Adresa bez ulice}
        E_TAG('supCislo',TZAM_tp_supcislo.AsString);
        E_TAG('obec',TZAM_tp_city.Value);
        if (TZAM_stat_tp.Value='') or (TZAM_stat_tp.Value='703')
          then E_TAG('psc',TZAM_tp_zip.Value)
          else E_TAG('psc',TZAM_tp_zip2.Value);
        E_TAG('stat',STAT(TZAM_stat_tp.AsString));
      end;
  E_TAGK('adresa');
end;end;
procedure VytvorAdresaKontZamnec;
var A1,A2,A3:string;
begin with DMZ,DM do begin
  if (TZAM_pp_city.Value <> '') or (TZAM_Tel1.Value <> '') or (TZAM_Mail.Value <> '') then begin
  E_TAGZ('korAdresa');
    if TZAM_pp_city.Value <> '' then begin
      E_TAGZ('adresa');
      if TZAM_pp_ulica.Value<>'' then {Adresa s ulicou}
      begin
        E_TAG('ulica',TZAM_pp_ulica.Value);
        EX_TAG('supCislo',TZAM_pp_supcislo.AsString);
        E_TAG('oCislo',TZAM_pp_ocislo.Value);
        E_TAG('obec',TZAM_pp_city.Value);
        if (TZAM_stat_pp.Value='') or (TZAM_stat_pp.Value='703')
          then E_TAG('psc',TZAM_pp_zip.Value)
          else E_TAG('psc',TZAM_pp_zip2.Value);
        E_TAG('stat',STAT(TZAM_stat_pp.AsString));
      end else begin {Adresa bez ulice}
        E_TAG('supCislo',TZAM_pp_supcislo.AsString);
        E_TAG('obec',TZAM_pp_city.Value);
        if (TZAM_stat_pp.Value='') or (TZAM_stat_pp.Value='703')
          then E_TAG('psc',TZAM_pp_zip.Value)
          else E_TAG('psc',TZAM_pp_zip2.Value);
        E_TAG('stat',STAT(TZAM_stat_pp.AsString));
      end;
      E_TAGK('adresa');
    end;
    if TZAM_Tel1.Value <> '' then E_TAG('tel',TZAM_Tel1.Value);
    if TZAM_Mail.Value <> '' then E_TAG('mail',TZAM_Mail.Value);
  E_TAGK('korAdresa');
  end;
end;end;
procedure VytvorUcet;
begin with DMZ do begin
   if (TZAM_Cislo_u.Value<>'') and (TZAM_Banka_u.Value<>'') then
   begin
     E_TAGZ('ucet');
     E_TAG('nazovSidloBanky',TZAM_Banka2_u.Value);
     E_TAG('iban',TZAM_IBAN.Value);
     //E_TAG('kodBanky',TZAM_Banka_u.Value);
     //E_TAG('cisloUctu',LongCisloU(TZAM_predcislo_u.Value,TZAM_Cislo_u.Value));
     E_TAGK('ucet');
  end;
end;end;
begin with FormNEP1,DM,DMZ do begin
  try
  oldIDX:=TZAM_.IndexName;
  SAVE_FILTER;
  TZAM_.IndexName:='Zam1';
  pc:=0;
  MyXML := '';
  E_TEXT('<?xml version="1.0" encoding="UTF-8"?>');
  E_TEXT('<spRegListZec xmlns="http://socpoist.sk/xsd/rlzec2014" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://socpoist.sk/xsd/rlzec2014 RLZEC-v2014.xsd">');
  E_TAG('typDoc','RLZEC0001');
  E_TAGZ('zamestnavatel');
  E_TAGZ('identifikacia');
  E_TAG('variabilnySymbol',TINF_ICZ.Value);
  E_TAGZ('identifikator');
  E_TAG('ico',TINF_ICO.Value);
  E_TAGK('identifikator');
  E_TAG('nazov',TINF_NAZOV.Value);
  E_TAGK('identifikacia');
  if TINF_TYP_ZEL.Value = 'FO' then begin
    E_TAGZ('fOsoba');
    {E_TAGZ('identifikatorFO');}
    E_TAG('rodneC',TINF_FO_RC.Value);
    {E_TAG('cpp',TINF_FO_CPP.Value);}
    {E_TAGK('identifikatorFO');}
    E_TAG('priezvisko',TINF_FO_Surname.Value);
    E_TAG('meno',TINF_FO_Name.Value);
    EX_TAG('titul',TINF_FO_Titul_Pred.Value);
    //EX_TAG('titulZa',TINF_FO_Titul_Za.Value);
    E_TAGK('fOsoba');
  end;
  //VytvorAdresaKontZamtel; {od roku 2013 sa nepouziva}
  E_TAGK('zamestnavatel');
  E_TAGZ('zoznamRLZec');
  E_TAGZ('regListyZec');
  for i:=0 to DBG1.SelectedRows.Count-1 do
  with DBG1.DataSource.DataSet do begin
    GotoBookmark(Pointer(DBG1.SelectedRows.Items[i]));
    if TZAM_Code_emp.Value<>TNEP_Code_emp.Value
     then SET_FILTER('code_emp='+TNEP_Code_emp.AsString);
    typRL:=TNEP_TypRL.Value;
    {Typ registraèného listu: PA - prihláška, OD- odhláška, ZM - zmena, PE - prerušenie, ZP - zrušenie prihlášky}
    if (typRL='MD') or (typRL='RD') then typRL_zmena:='ZM' else typRL_zmena := typRL;
    typRL2:=TNEP_TypRL2.Value;
{-------------->regListZec - povodne tu zacina regListZec a pravdepodobne sa odstranuje samotny typ z neho }
    E_TAGZA('regListZec','typRL="'+typRL_zmena+'"');
    E_TAGZ('identFO');
       E_TAG('rc',TZAM_born_numb.Value);
       E_TAG('priezvisko',TZAM_surname.Value);
       if TZAM_Prev_name.Value<>'' then E_TAG('predPriezvisko',TZAM_Prev_name.Value); {doplnene v roku 2013}
       E_TAG('meno',TZAM_name.Value);
       if TZAM_Title.Value<>'' then E_TAG('titulPred',TZAM_Title.Value);
       //if TZAM_Title_after.Value<>'' then E_TAG('titulZa',TZAM_Title_after.Value); {TODO: rozsirit DM !!!!!!!!!!!!!!!!!!!!!!!!!!!!!}
    E_TAGK('identFO');  (*
    case TZAM_TYPZEC.Value of
    0,1: E_ATTRZ('typZec','PP');
    2: E_ATTRZ('typZec','D');
    3: E_ATTRZ('typZec','NP');
    end; *)
    E_TAGZ('typRegListuFO');
    if typRL='PA' then begin
       E_TAGZ('prihlaska');
       VytvorIdentFODopl('identFODopl');
       VytvorAdresa;
       VytvorAdresaKontZamnec;
       E_TAGZ('typPoistPrihl');
       E_ATTRZ('typZec',TYPZEC_TO_CODE(TNEP_TYPZEC.Value));
       E_TAGZA('zecPrihl',MyAttr);
       VytvorUcet;
       E_TAG('datVznikPoist',XDAT(TNEP_Datum_od.Value));
       EX_TAG('datVznikPV',XDAT(TNEP_DatVznikPV.Value));
       E_TAG('statVykPrace','SK');
       E_TAGK('zecPrihl');
       E_TAGK('typPoistPrihl');
       E_TAGK('prihlaska');
    end else
    if typRL='ZM' then begin
       E_ATTRZ('datUplatnenia',XDAT(TNEP_Datum_od.Value));
       E_TAGZA('zmena',MyAttr);
       if TNEP_Zmena1.Value then VytvorIdentFODopl('identFODoplZmena');
       if TNEP_Zmena2.Value then VytvorAdresa;
       if TNEP_Zmena3.Value then VytvorAdresaKontZamnec;
       E_TAGZ('typPoistZmena');
       E_ATTRZ('typZec',TYPZEC_TO_CODE(TNEP_TYPZEC.Value));
       E_TAGZA('zecZmena',MyAttr);
       if TNEP_Zmena4.Value then VytvorUcet;
       {E_TAG('statVykPrace','SK'); nepovinny atribut}
       { ======== MATERSKA DOVOLENKA ======= }
       if (TNEP_ZacMD.AsString <> '') or (TNEP_KonMD.AsString <> '') then begin
          E_TAGZ('md');
          if (TNEP_ZacMD.AsString <> '') and (TNEP_KonMD.AsString <> '') then begin
            E_TAGZ('zac_konMD');
              E_ATTRZ('datZac',XDAT(TNEP_ZacMD.Value));
              E_TAGA('zacMD',MyAttr);
              E_ATTRZ('datKon',XDAT(TNEP_KonMD.Value));
              E_TAGA('konMD',MyAttr);
            E_TAGK('zac_konMD');
          end else if TNEP_ZacMD.AsString <> '' then begin
              E_ATTRZ('datZac',XDAT(TNEP_ZacMD.Value));
              E_TAGA('zacMD',MyAttr);
          end else if TNEP_KonMD.AsString <> '' then begin
              E_ATTRZ('datKon',XDAT(TNEP_KonMD.Value));
              E_TAGA('konMD',MyAttr);
          end;
          E_TAGK('md');
       end;
       { ======== RODICOVSKA DOVOLENKA ======= }
       if (TNEP_ZacRD.AsString <> '') or (TNEP_KonRD.AsString <> '') then begin
          E_TAGZ('rd');
          if (TNEP_ZacRD.AsString <> '') and (TNEP_KonRD.AsString <> '') then begin
            E_TAGZ('zac_konRD');
              E_ATTRZ('datZac',XDAT(TNEP_ZacRD.Value));
              E_TAGA('zacRD',MyAttr);
              E_ATTRZ('datKon',XDAT(TNEP_KonRD.Value));
              E_TAGA('konRD',MyAttr);
            E_TAGK('zac_konRD');
          end else if TNEP_ZacRD.AsString <> '' then begin
              E_ATTRZ('datZac',XDAT(TNEP_ZacRD.Value));
              E_TAGA('zacRD',MyAttr);
          end else if TNEP_KonRD.AsString <> '' then begin
              E_ATTRZ('datKon',XDAT(TNEP_KonRD.Value));
              E_TAGA('konRD',MyAttr);
          end;
          E_TAGK('rd');
       end;
       E_TAGK('zecZmena');
       E_TAGK('typPoistZmena');
       E_TAGK('zmena');
    end else
    if typRL='PE' then begin
       E_TAGZ('prerusenie');
       E_TAGZ('typPoistPrerus');
       E_ATTRZ('typZec',TYPZEC_TO_CODE(TNEP_TYPZEC.Value));
       E_TAGZA('zecPrerus',MyAttr);
       { ======== PRERUSENIE ======= }
       if (TNEP_Datum_od.AsString <> '') or (TNEP_Datum_do.AsString <> '') then begin
          if (TNEP_Datum_od.AsString <> '') and (TNEP_Datum_do.AsString <> '') then begin
            E_TAGZ('vznik_zanikPrerus');
              E_ATTRZ('datVzniku',XDAT(TNEP_Datum_od.Value));
              E_ATTR('dovod',TNEP_Prerusenie.AsString);
              E_TAGA('vznikPrerus',MyAttr);
              E_ATTRZ('datZaniku',XDAT(TNEP_Datum_do.Value));
              E_TAGA('zanikPrerus',MyAttr);
            E_TAGK('vznik_zanikPrerus');
          end else if TNEP_Datum_od.AsString <> '' then begin
              E_ATTRZ('datVzniku',XDAT(TNEP_Datum_od.Value));
              E_ATTR('dovod',TNEP_Prerusenie.AsString);
              E_TAGA('vznikPrerus',MyAttr);
          end else if TNEP_Datum_do.AsString <> '' then begin
              E_ATTRZ('datZaniku',XDAT(TNEP_Datum_do.Value));
              E_TAGA('zanikPrerus',MyAttr);
          end;
       end;
       E_TAGK('zecPrerus');
       E_TAGK('typPoistPrerus');
       E_TAGK('prerusenie');
    end else
    if typRL='OD' then begin
       E_TAGZ('odhlaska');
       E_TAGZ('typPoistOdhl');
       case TNEP_TYPZEC.Value of
       1: begin
          E_ATTRZ('pracPomer',TNEP_TypPracPomeru.AsString);
          E_TAGZA('zecPPOdhl', MyAttr);
          E_ATTRZ('datVzniku',XDAT(TNEP_Datum_od.Value));
          E_ATTR('datZaniku',XDAT(TNEP_Datum_do.Value));
          E_TAGA('zanik', MyAttr);
          E_TAGK('zecPPOdhl');
          end;
       3: begin
          E_TAGZ('zecNPOdhl');
          E_ATTRZ('datVzniku',XDAT(TNEP_Datum_od.Value));
          E_ATTR('datZaniku',XDAT(TNEP_Datum_do.Value));
          E_TAGA('zanik', MyAttr);
          E_TAGK('zecNPOdhl');
          end;
     else begin
          E_ATTRZ('typZec',TYPZEC_TO_CODE(TNEP_TYPZEC.Value));
          E_TAGZA('zecDOdhl', MyAttr);
          if (TNEP_TypZec.Value = 2) or (TNEP_TypZec.Value = 18) or (TNEP_TypZec.Value = 19)
           then begin
             E_ATTRZ('datVzniku',XDAT(TNEP_Datum_od.Value));
             E_ATTR('datZaniku',XDAT(TNEP_Datum_do.Value));
           end
          else
          E_ATTRZ('datZaniku',XDAT(TNEP_Datum_do.Value));
          E_TAGA('zanik', MyAttr);
          if TNEP_TYPZEC.Value<>2 then EX_TAG('datVznikPV',XDAT(TNEP_datVznikPV.Value));
          E_TAGK('zecDOdhl');
          end;
       end;
       E_TAGK('typPoistOdhl');
       E_TAGK('odhlaska');

    end else
    if typRL='ZP' then begin
       E_TAGZ('zruseniePrihlasky');
       E_TAGZ('typPoistZrus');
       E_ATTRZ('typZec',TYPZEC_TO_CODE(TNEP_TYPZEC.Value));
       E_TAGZA('zecZrus',MyAttr);
       E_TAGZ('poistenie');
       EX_TAG('datVznikPoist',XDAT(TNEP_Datum_od.Value));
       E_TAG('datZruseniaPoist',XDAT(TNEP_Datum_do.Value));
       EX_TAG('datVznikPV',XDAT(TNEP_datVznikPV.Value));
       E_TAGK('poistenie');
       E_TAGK('zecZrus');
       E_TAGK('typPoistZrus');
       E_TAGK('zruseniePrihlasky');
    end;
    E_TAGK('typRegListuFO');
    E_TAGK('regListZec');
  end;
  E_TAGK('regListyZec');
  E_TAGK('zoznamRLZec');
  E_TAGZ('vystavenie');
  E_TAG('zostavil',TTLA_Vykaz_zostavil.Value);
  E_TAG('tel',TTLA_Telefon.Value);
  E_TAG('mail',TTLA_Mail.Value);
  E_TAG('datumVyst',XDAT(TTLA_Den.Value));
  E_TAGK('vystavenie');
  E_TAGK('spRegListZec');
  Result := MyXml;
finally
  RESTORE_FILTER;
  TZAM_.IndexName:=oldIDX;
end;
end;end; {VytvorXml_v2014}

procedure TFormNEP1.btn_xmlClick(Sender: TObject);
var
  POSLEDNY:integer;
begin with DM,DMZ do begin
  if DBG1.SelectedRows.Count=0 then begin
    MyMessage(SMyAppNoRowNotSelected);
    exit;
  end;
  if not MyOtazka(Format(SMyAppShowRowSelected,[DBG1.SelectedRows.Count])) then exit;
  {--}
  FormTLA1:=TFormTLA1.Create(Application);
  try
  FormTLA1.ShowModal;
  finally
  FormTLA1.Free;
  end;
  Screen.Cursor:=crHourGlass;
  TNEP_.DisableControls;
  try
  try
    FPathXML := MyAppPath+MenoXMLDir;
    CreateDir(MyAppPath+MenoXmlDir);
    FNameXML := 'SPRLZEC_'+TINF_ICO.Value+'_'+IntToStr(DM.AktRok)+'_';
    POSLEDNY := NajdiPosledny (FPathXML+'\'+FNameXML,'XML',5);
(*
    if MyPoslednySubor <> '' then begin
      if not MyOtazka(Format(SMyAppVytvoritNovyXml,[MyPoslednySubor]))
        then exit;
    end;
*)
    FNameXML := FNameXML + LPAD(IntToStr(POSLEDNY),5,'0')+'.xml';
    assignfile(F,FPathXML+'\'+FNameXML);
    rewrite(F);
    if true then write(F,VytvorXML_v2014)
    else if DM.AktObdobie >= ZAKON_2013_01
     then write(F,VytvorXML_v2013)
    else if DM.AktObdobie >= ZAKON_2011_01
     then write(F,VytvorXML_v2011)
    else if DM.AktObdobie >= ZAKON_2008_07
     then write(F,VytvorXML_v1_7)
     else write(F,VytvorXML);
    CloseFile(F);
    if DM.AktObdobie < ZAKON_2013_01 then
      VytvorConfSubor(FPathXML,FNameXML,ChangeFileExt(FNameXML,'.txt'));
    MyMessage(Format(SMyAppHPCompletedXml,[FPathXML+'\'+FNameXML]));
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  finally
    Screen.Cursor:=crDefault;
    TNEP_.EnableControls;
  end;
  FormNEP1.SetFocus;
end;end;

procedure TFormNEP1.BTN_SELClick(Sender: TObject);
begin
  DBG1.SelectedRows.CurrentRowSelected := True;
  DMZ.TNEP_.Next;
  if DMZ.TNEP_.EOF then DMZ.TNEP_.First
end;

procedure TFormNEP1.Button2Click(Sender: TObject);
begin
  DBG1.SelectedRows.CurrentRowSelected := False;
  DMZ.TNEP_.Next;
  if DMZ.TNEP_.EOF then DMZ.TNEP_.First
end;

procedure TFormNEP1.DBG1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    DBG1.DefaultDrawColumnCell
    (Rect, DataCol, Column, State);
end;

procedure TFormNEP1.btn_xml_viewClick(Sender: TObject);
begin with DM do begin
  FPathXML := MyAppPath+MenoXMLDir;
   VyberSuboru(FPathXML+'\','SPRLZEC_'+TINF_ICO.Value+'_'+IntToStr(DM.AktRok)+' files(*.XML)|SPRLZEC_'+TINF_ICO.Value+'_'+IntToStr(DM.AktRok)+'*.XML'+'|*.XML|*.XML');
  FormNEP1.SetFocus;
end;end;

end.
