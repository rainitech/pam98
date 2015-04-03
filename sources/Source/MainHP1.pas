unit MainHp1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBCtrls, StdCtrls, Buttons, ExtCtrls, ComCtrls, Menus,
  DBTables, Db, Mask;

type
  TFormHP1 = class(TForm)
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
    Mnu_operacie1: TMenuItem;
    N2: TMenuItem;
    Mnu_operacie2: TMenuItem;
    Mnu_cancel2: TMenuItem;
    Mnu_post2: TMenuItem;
    Mnu_delete2: TMenuItem;
    Mnu_edit2: TMenuItem;
    Mnu_insert2: TMenuItem;
    mnu_insert1: TMenuItem;
    mnu_edit1: TMenuItem;
    mnu_delete1: TMenuItem;
    mnu_post1: TMenuItem;
    mnu_cancel1: TMenuItem;
    Mnu_tlac: TMenuItem;
    Mnu_tlac3: TMenuItem;
    SB1: TScrollBox;
    DBG1: TDBGrid;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    Btn_tlac: TSpeedButton;
    Btn_tlac3: TSpeedButton;
    Panel4: TPanel;
    DBN2: TDBNavigator;
    DBN1: TDBNavigator;
    SB2: TScrollBox;
    Panel2: TPanel;
    Panel5: TPanel;
    Btn_nacitaj: TButton;
    Panel6: TPanel;
    DBN2D: TDBNavigator;
    DBN1D: TDBNavigator;
    DBG2: TDBGrid;
    P2: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Mnu_generuj: TMenuItem;
    Mnu_tlac2: TMenuItem;
    Btn_ikey: TSpeedButton;
    btn_vub: TSpeedButton;
    btn_tb: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure Btn_navratClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Kalkulacka1Click(Sender: TObject);
    procedure Oprograme1Click(Sender: TObject);
    procedure DBN2Click(Sender: TObject; Button: TNavigateBtn);
    procedure Mnu_insert1Click(Sender: TObject);
    procedure Mnu_operacieClick(Sender: TObject);
    procedure Mnu_edit1Click(Sender: TObject);
    procedure Mnu_delete1Click(Sender: TObject);
    procedure Mnu_post1Click(Sender: TObject);
    procedure Mnu_cancel1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Mnu_insert2Click(Sender: TObject);
    procedure Mnu_edit2Click(Sender: TObject);
    procedure Mnu_delete2Click(Sender: TObject);
    procedure Mnu_post2Click(Sender: TObject);
    procedure Mnu_cancel2Click(Sender: TObject);
    procedure Btn_nacitajClick(Sender: TObject);
    procedure DBN1Click(Sender: TObject; Button: TNavigateBtn);
    procedure Btn_tlacClick(Sender: TObject);
    procedure Mnu_tlacClick(Sender: TObject);
    procedure Mnu_tlac2Click(Sender: TObject);
    procedure Btn_ikeyClick(Sender: TObject);
    procedure btn_vubClick(Sender: TObject);
    procedure btn_tbClick(Sender: TObject);
    procedure Btn_tlac3Click(Sender: TObject);
    procedure Mnu_tlac3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateStatus;
    procedure UpdateMenu;
    procedure CreateHP(xObdobie:integer);
    function PrevodySuOK(xObdobie:integer):boolean;
  end;

var
  FormHP1: TFormHP1;

type
  TMyParam = record
  end;

var
  MyParam: TMyParam;

implementation

uses MyConsts, Dm_hp, ParHP, RexNz, Dm_main, DM_sql, RexHP1, RXCalc, About,
  REXHP2, FmxUtils, REXHP3;

{$R *.DFM}

procedure TFormHP1.UpdateMenu;
var prvy,druhy:boolean;
begin with DMHP do begin
  if (THP1_.State in [dsEdit,dsInsert]) or
     (THP2_.State in [dsEdit,dsInsert])
  then begin
    prvy:=THP1_.State in [dsEdit,dsInsert];
    druhy:=THP2_.State in [dsEdit,dsInsert];
    Mnu_insert1.Enabled:=False;
    Mnu_edit1.Enabled:=False;
    Mnu_delete1.Enabled:=False;
    Mnu_post1.Enabled:=prvy;
    Mnu_cancel1.Enabled:=prvy;
    Mnu_navrat.Enabled:=False;
    Btn_navrat.Enabled:=False;
    {--}
    Mnu_insert2.Enabled:=False;
    Mnu_edit2.Enabled:=False;
    Mnu_delete2.Enabled:=False;
    Mnu_post2.Enabled:=druhy;
    Mnu_cancel2.Enabled:=druhy;
    Mnu_navrat.Enabled:=False;
    Btn_navrat.Enabled:=False;
    Btn_nacitaj.Enabled:=False;
    Btn_tlac.Enabled:=False;
    Btn_tlac3.Enabled:=False;
    Btn_ikey.Enabled:=False;
    Mnu_tlac.Enabled:=False;
    Mnu_tlac3.Enabled:=False;
    {--}
    DBN1.Enabled:=False;
    DBN1d.Enabled:=False;
    DBN2.Enabled:=prvy;
    DBN2d.Enabled:=druhy;
  end else
  begin
    Mnu_insert1.Enabled:=True;
    Mnu_edit1.Enabled:=True;
    Mnu_delete1.Enabled:=True;
    Mnu_post1.Enabled:=False;
    Mnu_cancel1.Enabled:=False;
    Mnu_navrat.Enabled:=True;
    Btn_navrat.Enabled:=True;
    Btn_nacitaj.Enabled:=True;
    {--}
    Mnu_insert2.Enabled:=True;
    Mnu_edit2.Enabled:=True;
    Mnu_delete2.Enabled:=True;
    Mnu_post2.Enabled:=False;
    Mnu_cancel2.Enabled:=False;
    Mnu_navrat.Enabled:=True;
    Btn_navrat.Enabled:=True;
    Btn_tlac.Enabled:=True;
    Btn_tlac3.Enabled:=True;
    Btn_ikey.Enabled:=True;
    Mnu_tlac.Enabled:=True;
    Mnu_tlac3.Enabled:=True;
    {--}
    DBN1.Enabled:=True;
    DBN1d.Enabled:=True;
    DBN2.Enabled:=True;
    DBN2d.Enabled:=True;
  end;
end;end;

procedure TFormHP1.UpdateStatus;
begin
  StatusBar1.Panels[0].Text:=MyStatus;
  Caption := MyCaption;
end;

procedure TFormHP1.Btn_navratClick(Sender: TObject);
begin
  Close;
end;

procedure TFormHP1.FormCreate(Sender: TObject);
begin with DMHP do begin
  THP1_.Open;
  THP1_.Last;
  THP2_.Open;
  DS_HP1.Enabled:=True;
  DS_HP2.Enabled:=True;
  UpdateStatus;
end;end;

procedure TFormHP1.Kalkulacka1Click(Sender: TObject);
begin
  FormCalc.Show;
end;

procedure TFormHP1.Oprograme1Click(Sender: TObject);
begin
  if FormAbout=nil then Application.CreateForm(TFormAbout, FormAbout);
  FormAbout.ShowModal;
end;

procedure TFormHP1.DBN2Click(Sender: TObject; Button: TNavigateBtn);
begin
 UpdateMenu;
end;

procedure TFormHP1.Mnu_insert1Click(Sender: TObject);
begin
  DBN1.BtnClick(nbInsert);
end;

procedure TFormHP1.Mnu_operacieClick(Sender: TObject);
begin
  UpdateMenu;
end;

procedure TFormHP1.Mnu_edit1Click(Sender: TObject);
begin
  DBN2.BtnClick(nbEdit);
end;

procedure TFormHP1.Mnu_delete1Click(Sender: TObject);
begin
  DBN1.BtnClick(nbDelete);
end;

procedure TFormHP1.Mnu_post1Click(Sender: TObject);
begin
  DBN2.BtnClick(nbPost);
end;

procedure TFormHP1.Mnu_cancel1Click(Sender: TObject);
begin
  DBN2.BtnClick(nbCancel);
end;

procedure TFormHP1.FormDestroy(Sender: TObject);
begin with DMHP do begin
  DS_HP2G.Enabled:=False;
  DS_HP1G.Enabled:=False;
  DS_HP2.Enabled:=False;
  DS_HP1.Enabled:=False;
  THP2_.Close;
  THP1_.Close;
end;end;

procedure TFormHP1.Mnu_insert2Click(Sender: TObject);
begin
  DBN1d.BtnClick(nbInsert);
end;

procedure TFormHP1.Mnu_edit2Click(Sender: TObject);
begin
  DBN2d.BtnClick(nbEdit);
end;

procedure TFormHP1.Mnu_delete2Click(Sender: TObject);
begin
  DBN1d.BtnClick(nbDelete);
end;

procedure TFormHP1.Mnu_post2Click(Sender: TObject);
begin
  DBN2d.BtnClick(nbPost);
end;

procedure TFormHP1.Mnu_cancel2Click(Sender: TObject);
begin
  DBN2d.BtnClick(nbCancel);
end;

function TFormHP1.PrevodySuOK(xObdobie:integer):boolean;
var i:integer;s,FN:string;F1:TextFile;
begin
  s:=Format('select z.code_numb from ":pam98_data:vyp" v,":pam98_data:zam" z where v.v_obdobie=%d and v.sporenie>0 and v.code_emp=z.code_emp and (z.cislo_u=''0000000000'' or z.cislo_u='''')',[xObdobie]);
  DMSQL.ExecuteSql(s);
  if DMSQL.Akt_rows > 0 then begin
    try
    FN:=MyAppPath+MenoXmlDir+'\'+MenoTlacChyby2+IntToStr(DM.AktObdobie)+'.txt';
    assignfile(F1,FN);
    rewrite(F1);
    writeln(F1,'Hromadn˝ prÌkaz nie je moûnÈ vygenerovaù.');
    writeln(F1);
    writeln(F1,'Nie s˙ spr·vne zadanÈ ËÌsla ˙Ëtov na karte zamestnancov.');
    writeln(F1);
    writeln(F1,'Skontrolujte t˝chto zamestnancov :');
    writeln(F1);
    for i:=1 to DMSQL.Akt_Rows do if DMSQL.Results[i]<>''
      then writeln(F1,'Os.ËÌslo: '+DMSQL.Results[i]) else break;
    finally
    CloseFile(f1);
    end;
    ExecuteFileX('notepad',FN,'',1);
    FormHP1.Show;
    PrevodySuOk:=False;
  end else PrevodySuOk:=true;
end;

procedure TFormHP1.CreateHP(xObdobie:integer);
var s,pom:string;X: TMyReportParam;
  function pridaj(const s1,s2:string):string;
  begin if s1='' then result:=s2 else result:=#13+'union'+#13+s2; end;
begin with DMHP,ParHP.MyParam do begin
  if not PrevodySuOk(xObdobie) then exit;
  DM.NaplnMyReportParam(X);
{-- Typ: A(poistnÈ+daÚ) B(v˝platy) C(zr·ûky) --}
  Application.CreateForm(TFormParHP, FormParHP);
  try
  FormParHP.ShowModal;
  finally
  FormParHP.Release;
  FormParHP:=nil;
  end;
{--}
  if not(tlacit_a or tlacit_b or tlacit_c or tlacit_d) then begin
    MyError(SMyAppGenerujHPNotSelected);exit;
  end;
  try
  Screen.Cursor:=crHourGlass;
  DS_HP2.Enabled:=False;
  if tlacit_a then begin
    ReportNZ:=TReportNZ.Create(Application);
    ReportNZ.VytvorPomocnuDatabazu(X,True);
    ReportNZ.Free;
  end;
  s:='delete from ":pam98_data:hp2" where hpid='+THP1_HPID.AsString;
  DMSQL.ExecuteSql(s);
  {-- Q0a -- poistne a dan --}
  if tlacit_a then
  try
    Q0a_.Close;
    Q0a_.Open;
    while not Q0a_.EOF do begin
      try
      try
        THP2_.Insert;
        THP2_Suma.Value := Q0a_Sporenie.Value;
        THP2_Cislo_u.Value := NVL(Q0a_Cislo_u.Value);
        THP2_Banka_u.Value := NVL(Q0a_Banka_u.Value);
        if (Q0a_Buid_typ.value='P') and (X.AktObdobie>=Zakon_2002_01) then
         THP2_Ssym.Value := IntToStr(MyMesiac(X.AktObdobie) div 3)+IntToStr(MyRok(X.AktObdobie))
        else
         THP2_Ssym.Value := Q0a_Ssym_u.Value;
        THP2_Ksym.Value := Q0a_Ksym.Value;
        THP2_Vsym.Value := Q0a_Vsym.Value;
  {      THP2_Poznamka.Value := TEXT_INSTITUCIE(Q0A_Buid_Typ.Value,Q0A_Buid_Kod.Value);}
        if xObdobie=Zakon_2008_12
          then THP2_Strana.Value := 2; // "klient uhradza institucii", zaokruhlovanie v prospech klienta na eurocent nadol
        if xObdobie>=Zakon_2014_01
          then THP2_IBAN.Value := Q0a_IBAN.Value;
        THP2_.Post;
      except
      end;
      finally
      Q0a_.Next;
      end;
    end;
  finally
  Q0a_.Close;
  end;
  {-- Q0b -- vyplaty --}
  if tlacit_b then
  try
    Q0b_.Close;
    Q0b_.ParamByName('P1').AsInteger := xObdobie;
    Q0b_.ParamByName('P2').AsInteger := DM.AktMinSid;
    Q0b_.ParamByName('P3').AsInteger := DM.AktMaxSid;
    Q0b_.Open;
    while not Q0b_.EOF do begin
      try
      if Q0b_Sporenie.Value > 0 then
      try
        THP2_.Insert;
        THP2_Suma.Value := Q0b_Sporenie.Value;
        THP2_Cislo_u.Value := NVL(LongCisloU(Q0b_Predcislo_u.Value,Q0b_Cislo_u.Value));
        THP2_Banka_u.Value := NVL(Q0b_Banka_u.Value);
        if tlacit_mena then
        THP2_Ssym.Value := Copy(Q0b_surname.Value + ' ' + Q0b_Name.Value,1,10)
        else
        THP2_Ssym.Value := Q0b_Ssym_u.Value;
        if Trim(Q0b_Ksym.Value) <> ''
         then THP2_Ksym.Value := Q0b_Ksym.Value
          else THP2_Ksym.Value := '0138';
        if vsym_rc then
        begin
          pom := Q0b_Born_Numb.Value;
          while Pos('/',pom) > 0 do Delete(pom,Pos('/',pom),1);
          THP2_Vsym.Value := Copy(pom,1,10);
        end
        else begin
          if Trim(vsym)<>''
           then THP2_Vsym.Value := vsym
            else THP2_Vsym.Value := LPAD(IntToStr(xObdobie mod 100),2,'0')+
                                    LPAD(IntToStr((xObdobie div 100) mod 100),2,'0');
        end;
{        THP2_Poznamka.Value := Spoj(Q0b_Surname.Value,Q0b_Name.Value,'');}
        if xObdobie=Zakon_2008_12
          then THP2_Strana.Value := 1; // "firma uhradza klientovi", zaokruhlovanie v prospech klienta na eurocent nahor
        if xObdobie>=Zakon_2014_01
          then THP2_IBAN.Value := Q0b_IBAN.Value;
        THP2_.Post;
      except
      end;
      finally
      Q0b_.Next;
      end;
    end;
  finally
    Q0b_.Close;
  end;
  {-- Q0b -- zalohy --}
  if tlacit_d then
  try
    Q0b_.Close;
    Q0b_.ParamByName('P1').AsInteger := xObdobie;
    Q0b_.ParamByName('P2').AsInteger := DM.AktMinSid;
    Q0b_.ParamByName('P3').AsInteger := DM.AktMaxSid;
    Q0b_.Open;
    while not Q0b_.EOF do begin
      try
      if Q0b_Ne_zaloha.Value > 0 then
      try
        THP2_.Insert;
        THP2_Suma.Value := Q0b_Ne_zaloha.Value;
        THP2_Cislo_u.Value := NVL(LongCisloU(Q0b_Predcislo_u.Value,Q0b_Cislo_u.Value));
        THP2_Banka_u.Value := NVL(Q0b_Banka_u.Value);
        THP2_Ssym.Value := Q0b_Ssym_u.Value;
        if Trim(Q0b_Ksym.Value) <> ''
         then THP2_Ksym.Value := Q0b_Ksym.Value
          else THP2_Ksym.Value := DM.TINF_Ksym_u.Value;
        if vsym_rc then
        begin
          pom := Q0b_Born_Numb.Value;
          while Pos('/',pom) > 0 do Delete(pom,Pos('/',pom),1);
          THP2_Vsym.Value := Copy(pom,1,10);
        end
        else begin
          if Trim(vsym)<>''
           then THP2_Vsym.Value := vsym
            else THP2_Vsym.Value := Q0b_Vsym.Value;
        end;
{        THP2_Poznamka.Value := Spoj(Q0b_Surname.Value,Q0b_Name.Value,'');}
        if xObdobie=Zakon_2008_12
          then THP2_Strana.Value := 1; //"firma uhradza klientovi", zaokruhlovanie v prospech klienta na eurocent nahor
        if xObdobie>=Zakon_2014_01
          then THP2_IBAN.Value := Q0b_IBAN.Value;
        THP2_.Post;
      except
      end;
      finally
      Q0b_.Next;
      end;
    end;
  finally
    Q0b_.Close;
  end;
  {-- Q0c -- zrazky --}
  if tlacit_c then
  try
    Q0c_.Close;
    Q0c_.ParamByName('P1').AsInteger := xObdobie;
    Q0c_.ParamByName('P2').AsInteger := DM.AktMinSid;
    Q0c_.ParamByName('P3').AsInteger := DM.AktMaxSid;
    Q0c_.Open;
    while not Q0c_.EOF do begin
      try
      try
      THP2_.Insert;
      THP2_Suma.Value := Q0c_Suma.Value;
      THP2_Cislo_u.Value := NVL(LongCisloU(Q0c_Predcislo_u.Value,Q0c_Cislo_u.Value));
      THP2_Banka_u.Value := NVL(Q0c_Banka_u.Value);
      THP2_Ssym.Value := Q0c_Ssym_u.Value;
      THP2_Ksym.Value := Q0c_Ksym.Value;
      THP2_Vsym.Value := Q0c_Vsym.Value;
{      THP2_Poznamka.Value := Spoj(Q0c_Surname.Value,Q0c_Name.Value,' - '+Q0c_pozn.Value);}
      if xObdobie=Zakon_2008_12
        then THP2_Strana.Value := 0; // zaokruhlovanie na euro podla zakona
      if xObdobie>=Zakon_2014_01
        then THP2_IBAN.Value := Q0c_IBAN.Value;
      THP2_.Post;
      except
      end;
      finally
      Q0c_.Next;
      end;
    end;
  finally
    Q0c_.Close;
  end;
  if (xObdobie=200812) then
  try
    THP2_.Filter := 'HPID='+THP1_HPID.AsString;
    THP2_.Filtered := True;
    THP2_.First;
    while not THP2_.EOF do begin
      THP2_.Edit;
      case THP2_Strana.Value of
        1:THP2_Suma.Value := KonverziaSKK_EUR_nahor(THP2_Suma.Value);
        2:THP2_Suma.Value := KonverziaSKK_EUR_nadol(THP2_Suma.Value);
        else THP2_Suma.Value := KonverziaSKK_EUR(THP2_Suma.Value);
      end;
      THP2_.Post;
      THP2_.Next;
    end;
  finally
    MyMessage('JednotlivÈ sumy hromadnÈho prÌkazu boli skonvertovanÈ z meny SKK na menu EUR.');
    THP2_.Filtered := False;
  end;
  finally
  DS_HP2.Enabled:=True;
  Screen.Cursor:=crDefault;
  MyWarning(SMyAppGenerujHPCompleted);

  end;
end;end;

procedure TFormHP1.Btn_nacitajClick(Sender: TObject);
begin
  if not MyOtazka(Format(SMyAppOtazkaGenerujHP,[DM.AktobdobieStr(false)]))
    then exit;
  CreateHP(DM.AktObdobie);
end;

procedure TFormHP1.DBN1Click(Sender: TObject; Button: TNavigateBtn);
begin
 UpdateMenu;
end;

procedure TFormHP1.Btn_tlacClick(Sender: TObject);
var X:TMyReportParam;
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='HP1';
  X.HPID:=DMHP.THP1_HPID.Value;
  RunReportHP1(X);
{
  Screen.Cursor:=crHourGlass;
  try
    try
    ReportHP1:=TReportHP1.Create(Application);
    finally Screen.Cursor:=crDefault;
    end;
  except MyError(SMyAppReportInitFailed); exit;
  end;
  try
  if DMHP.THP1_HPID.AsString<>''
   then ReportHP1.ShowReport(DMHP.THP1_HPID.Value)
   else MyError(SMyAppHpidIsNull);
  except MyError(SMyAppReportShowFailed);
  end;
  ReportHP1.Free;
}
end;

procedure TFormHP1.Mnu_tlacClick(Sender: TObject);
begin
  Btn_tlac.click;
end;

procedure TFormHP1.Mnu_tlac2Click(Sender: TObject);
var X:TMyReportParam;
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='HP2';
  X.HPID:=DMHP.THP1_HPID.Value;
  RunReportHP2(X);
end;

procedure TFormHP1.Btn_ikeyClick(Sender: TObject);
var fn1:string[128];
    f1:textfile;
  dispform,predcu,cislou,pom,c1,c2:string;
  p:integer;
  dobre_cu:boolean;
begin with DMHP do begin
  try
  dispform:=THP1_Datum_Splatnosti.DisplayFormat;
  CreateDir(MyAppPath+MenoXmlDir);
  THP1_Datum_Splatnosti.DisplayFormat:='yymmdd';
  if THP1_Datum_Splatnosti.AsString='' then begin
    MyError(SMyAppHPNevyplnenyDatumSplatnosti);
    exit;
  end;
  fn1:=MyAppPath+MenoXmlDir+'\'+MenoTlacXml+THP1_Datum_Splatnosti.DisplayText+'.XML';
  assignfile(f1,fn1);
  try rewrite(f1);
  except
    MyError(Format(SMyAppCreateFileFailed,[fn1]));
    exit;
  end;
  writeln(f1,'<?xml version="1.0" encoding="UTF-8" ?>');
  writeln(f1,'<batch_in:Batch xmlns:batch_in="http://www.tatrabanka.sk/batch_in"');
  writeln(f1,'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">');
  writeln(f1,'<VERSION>1.0</VERSION>');
  THP1_Datum_Splatnosti.DisplayFormat:='dd.mm.yyyy';
  writeln(f1,'<NAME>MZDY</NAME> ');
  writeln(f1,'<TRNS>');
  THP1_Datum_Splatnosti.DisplayFormat:='yyyy-mm-dd';
  THP2_.First;
  while not THP2_.EOF do begin
    writeln(f1,'<TRN>');
    writeln(f1,'<OUR>'+THP1_CISLO_U.Value+'</OUR>');
    writeln(f1,'<BEN>');
    dobre_cu:=false;
    pom:=THP2_CISLO_U.Value;
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
        if Kontrola_Predcisla(predcu) AND Kontrola_ABO(cislou) then
        begin
          dobre_cu:=true;
        end
        else begin
          if Kontrola_ABO(predcu+cislou) then
          begin
            predcu:='000000';
            cislou:=predcu+cislou;
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
    if dobre_cu then
    begin
      writeln(f1,'<AP>'+predcu+'</AP>');
      writeln(f1,'<AN>'+cislou+'</AN>');
      writeln(f1,'<BC>'+THP2_BANKA_U.Value+'</BC>');
      writeln(f1,'</BEN>');
      writeln(f1,'<PMT>');
      writeln(f1,'<HD>11</HD>');
      if THP1_Datum_Splatnosti.Value>=EncodeDate(2009,1,1)
      then writeln(f1,'<CCY>EUR</CCY>')
      else writeln(f1,'<CCY>SKK</CCY>');
      writeln(f1,'<AMT>'+THP2_SUMA.AsString+'</AMT>');
      writeln(f1,'<VD>'+THP1_Datum_Splatnosti.DisplayText+'</VD>');
      writeln(f1,'<CS>'+THP2_KSYM.Value+'</CS>');
      writeln(f1,'<CR_VS>'+THP2_VSYM.Value+'</CR_VS>');
      writeln(f1,'<CR_SS>'+THP2_SSYM.Value+'</CR_SS>');
      writeln(f1,'<DB_VS>'+THP2_VSYM.Value+'</DB_VS>');
      writeln(f1,'<DB_SS>'+THP2_SSYM.Value+'</DB_SS>');
      writeln(f1,'<DB_I>MZDY</DB_I>');
      writeln(f1,'</PMT>');
      writeln(f1,'</TRN>');
    end
    else
      MyMessage(Format(SMyAppHPBadCisloU,[THP2_CISLO_U.Value]));
    THP2_.Next;
  end;
  writeln(f1,'</TRNS>');
  writeln(f1,'</batch_in:Batch>');
  closefile(f1);
  MyMessage(Format(SMyAppHPCompletedXml,[fn1]));
  finally
  THP1_Datum_Splatnosti.DisplayFormat:=dispform;
  end;
end;end;

procedure TFormHP1.btn_vubClick(Sender: TObject);
const CIARKA:char=',';
var
  fn1:string[128];
  f1:textfile;
  dispform:string;
  pc:integer;
begin with DMHP do begin
  try
  dispform:=THP1_Datum_Splatnosti.DisplayFormat;
  CreateDir(MyAppPath+MenoXmlDir);
  THP1_Datum_Splatnosti.DisplayFormat:='yymmdd';
  if THP1_Datum_Splatnosti.AsString='' then begin
    MyError(SMyAppHPNevyplnenyDatumSplatnosti);
    exit;
  end;
  fn1:=MyAppPath+MenoXmlDir+'\'+MenoTlacVub+THP1_Datum_Splatnosti.DisplayText+'.txt';
  assignfile(f1,fn1);
  try rewrite(f1);
  except
    MyError(Format(SMyAppCreateFileFailed,[fn1]));
    exit;
  end;
  THP1_Datum_Splatnosti.DisplayFormat:='dd.mm.yyyy';
  THP1_Datum_Splatnosti.DisplayFormat:='yyyy-mm-dd';
  THP1_Datum_Splatnosti.DisplayFormat:='dd.mm.yy';
  THP2_.First;
  pc:=0;
  while not THP2_.EOF do begin
    inc(pc);
    write(f1,'1'+CIARKA);
    write(f1,THP1_Datum_Splatnosti.DisplayText+CIARKA);
    write(f1,THP1_CISLO_U.Value+CIARKA);
    write(f1,THP2_CISLO_U.Value+CIARKA);
    write(f1,THP2_BANKA_U.Value+CIARKA);
    if THP1_Datum_Splatnosti.Value >= EncodeDate(2009,1,1)
    then write(f1,'"'+Format('%0.2f',[THP2_SUMA.Value])+'"'+CIARKA+'EUR'+CIARKA)
    else write(f1,'"'+Format('%0.2f',[THP2_SUMA.Value])+'"'+CIARKA+'SKK'+CIARKA);
    write(f1,THP2_VSYM.Value+CIARKA);
    write(f1,THP2_KSYM.Value+CIARKA);
    if THP2_SSYM.Value=''
     then writeln(f1,'""')
      else writeln(f1,THP2_SSYM.Value);
    THP2_.Next;
  end;
  closefile(f1);
  MyMessage(Format(SMyAppHPCompletedVub,[fn1]));
  finally
  THP1_Datum_Splatnosti.DisplayFormat:=dispform;
  end;
end;end;

procedure TFormHP1.btn_tbClick(Sender: TObject);
const CIARKA:char='.';
var fn1:string[128];
    f1:textfile;
  dispform,predcu,cislou,pom,c1,c2:string;
  p:integer;
  dobre_cu:boolean;
  ii:integer;
  page:integer;
begin with DMHP do begin
  try
  CreateDir(MyAppPath+MenoXmlDir);
  dispform:=THP1_Datum_Splatnosti.DisplayFormat;
  page:=1;
  THP2_.First;
repeat
  ii:=1;
  THP1_Datum_Splatnosti.DisplayFormat:='yymmdd';
  if THP1_Datum_Splatnosti.AsString='' then begin
    MyError(SMyAppHPNevyplnenyDatumSplatnosti);
    exit;
  end;
  fn1:=MyAppPath+MenoXmlDir+'\'+MenoTlacXml+THP1_Datum_Splatnosti.DisplayText+'.'+LPAD(IntToStr(page),4,'0')+'.XML';
  assignfile(f1,fn1);
  try rewrite(f1);
  except
    MyError(Format(SMyAppCreateFileFailed,[fn1]));
    exit;
  end;
  writeln(f1,'<?xml version="1.0" encoding="UTF-8" ?>');
  writeln(f1,'<MULTI>');
  writeln(f1,'<VERSION>1.0</VERSION>');
  THP1_Datum_Splatnosti.DisplayFormat:='dd.mm.yyyy';
  writeln(f1,'<NAME>platba</NAME> ');
  writeln(f1,'<TRNS>');
  THP1_Datum_Splatnosti.DisplayFormat:='yyyy-mm-dd';
  while not (THP2_.EOF or (ii > 9)) do begin
    writeln(f1,'<TRN>');
    writeln(f1,'<OUR>'+THP1_CISLO_U.Value+'</OUR>');
    writeln(f1,'<VD>'+THP1_Datum_Splatnosti.DisplayText+'</VD>');
    writeln(f1,'<BEN>');
    dobre_cu:=false;
    pom:=THP2_CISLO_U.Value;
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
        if Kontrola_Predcisla(predcu) AND Kontrola_ABO(cislou) then
        begin
          dobre_cu:=true;
        end
        else begin
          if Kontrola_ABO(predcu+cislou) then
          begin
            predcu:='000000';
            cislou:=predcu+cislou;
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
    if dobre_cu then
    begin
      writeln(f1,'<AP>'+predcu+'</AP>');
      writeln(f1,'<AN>'+cislou+'</AN>');
      writeln(f1,'<BC>'+THP2_BANKA_U.Value+'</BC>');
      writeln(f1,'</BEN>');
      writeln(f1,'<PMT>');
      if THP1_Datum_Splatnosti.Value>=EncodeDate(2009,1,1)
      then writeln(f1,'<CCY>EUR</CCY>')
      else writeln(f1,'<CCY>SKK</CCY>');
      writeln(f1,'<AMT>'+StrReplaceAll(Format('%0.2f',[THP2_SUMA.Value]),',','.')+'</AMT>');
      writeln(f1,'<CS>'+THP2_KSYM.Value+'</CS>');
      writeln(f1,'<VS>'+THP2_VSYM.Value+'</VS>');
      writeln(f1,'<SS>'+THP2_SSYM.Value+'</SS>');
      writeln(f1,'<I>MZDY</I>');
      writeln(f1,'</PMT>');
      writeln(f1,'</TRN>');
    end
    else
      MyMessage(Format(SMyAppHPBadCisloU,[THP2_CISLO_U.Value]));
    ii:=ii+1;
    THP2_.Next;
  end;
  writeln(f1,'</TRNS>');
  writeln(f1,'</MULTI>');
  closefile(f1);
  page := page +1;
until THP2_.EOF;
  MyMessage(Format(SMyAppHPCompletedXml,[fn1]));
  finally
  THP1_Datum_Splatnosti.DisplayFormat:=dispform;
  end;
end;end;

procedure TFormHP1.Btn_tlac3Click(Sender: TObject);
var X:TMyReportParam;
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='HP3';
  X.HPID:=DMHP.THP1_HPID.Value;
  RunReportHP3(X);
end;

procedure TFormHP1.Mnu_tlac3Click(Sender: TObject);
begin
  Btn_tlac3.click;
end;

end.

