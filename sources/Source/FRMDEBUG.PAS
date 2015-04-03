unit Frmdebug;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, DBTables, ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    MainMenu1: TMainMenu;
    Otvorenie_firmy: TMenuItem;
    Zrusenie_firmy: TMenuItem;
    StatusBar1: TStatusBar;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SYS_START : boolean;
    OTVORENA_FIRMA : integer;
    function  Open_db_common:boolean;
    procedure NACITAJ_FIRMY;
    procedure Akcia_otvorenie_db(Sender: TObject);
    procedure Akcia_zatvorenie_db(Sender: TObject);
    procedure Akcia_obdobie(Sender: TObject);
    procedure Akcia_stredisko(Sender: TObject);
    procedure UpdateStatus;
  end;

var
  Form1: TForm1;

implementation

uses MainHP1, Dm_main, MyConsts, Dm_zam, Dm_vypl, Dm_ppv, Obdobie, Stred,
  MainCsv1, RepOdv;

{$R *.DFM}

procedure TForm1.UpdateStatus;
begin with DM do begin
  MyStatus:='Výplatné obdobie: '+AktObdobieStr2;
  MyCaption:='PAM98 - Firma: '+TINF_Nazov.Value+
             ' - Stredisko: '+AktStrediskoStr;
  StatusBar1.Panels[0].Text:=MyStatus;
  Caption :=MyCaption;
end;end;

procedure TForm1.Akcia_obdobie(Sender: TObject);
begin with DM do begin
  if FormObdobie=nil then Application.CreateForm(TFormObdobie, FormObdobie);
  FormObdobie.ShowModal;
end;end;

procedure TForm1.Akcia_stredisko(Sender: TObject);
begin with DM do begin
  CIS2_.Filtered:=false;
  if CIS2_.RecordCount<=1 then
  begin
    if (Sender as TMenuItem).Name='mnu_zmena_strediska'
      then MyMessage(SMyAppIbaJednoStredisko);
    TPRIV_.Edit;
    TPRIV_SID.Value:=0;
    TPRIV_.Post;
    exit;
  end;
  if FormStred=nil then Application.CreateForm(TFormStred, FormStred);
  FormStred.ShowModal;
end;end;

procedure TForm1.Akcia_zatvorenie_db(Sender: TObject);
begin with DM,DMZ,DMV,DMP do begin
  TPRIV_.Close;
  TSYS_.Close;
  TINF_.Close;
  CIS0_.Close;
  CIS1_.Close;
  CIS2_.Close;
  CIS3_.Close;
  CIS4_.Close;
  TSET_.Close;
  TDZP_.Close;
  TZAM_.Close;
  TDET_.Close;
  TVYP_.Close;
  TRZP_.Close;
  TPPV_.Close;
  TZRZ_.Close;
  TZRV_.Close;
  TNEP_.Close;
end;end;

procedure TForm1.Akcia_otvorenie_db(Sender: TObject);
var s:string;DBOK:boolean;
begin with DM,DMZ,DMV,DMP do begin
  Akcia_zatvorenie_db(Sender);
  s:=Format('%.2d',[TMenuItem(Sender).Tag]);
  MyDataPth:=MyNetPath+'DATA'+s+'\';
  DBTables.Session.Close;
  DBTables.Session.DeleteAlias(Alias_Common);
  DBTables.Session.AddStandardAlias(Alias_Common,MyCommPth,'PARADOX');
  DBTables.Session.DeleteAlias(Alias_Private);
  DBTables.Session.AddStandardAlias(Alias_Private,MyPrivPth,'PARADOX');
  DBTables.Session.DeleteAlias(Alias_Data);
  DBTables.Session.AddStandardAlias(Alias_Data,MyDataPth,'PARADOX');
  DBTables.Session.AddPassword(MyPassword(MyDbPassword));
  DBTables.Session.Open;
  try
  if not TPRIV_.Active then begin TPRIV_.Open; TPRIV_.Edit; TPRIV_.Cancel; end;
  if not TPPV_.Active then begin TPPV_.Open; end;
  if not TSYS_.Active then begin TSYS_.Open; end;
  if not TINF_.Active then begin TINF_.Open; end;
  if not CIS0_.Active then begin CIS0_.Open; end;
  if not CIS1_.Active then begin CIS1_.Open; end;
  if not CIS2_.Active then begin CIS2_.Open; end;
  if not CIS3_.Active then begin CIS3_.Open; end;
  if not CIS4_.Active then begin CIS4_.Open; end;
  if not TSET_.Active then begin TSET_.Open; end;
  if not TDZP_.Active then begin TDZP_.Open; end;
  if not TZAM_.Active then begin TZAM_.Open; end;
  if not TDET_.Active then begin TDET_.Open; end;
  if not TVYP_.Active then begin TVYP_.Open; end;
  if not TRZP_.Active then begin TRZP_.Open; end;
  if not THSV_.Active then begin THSV_.Open; end;
  if not TZRZ_.Active then begin TZRZ_.Open; end;
  if not TZRV_.Active then begin TZRV_.Open; end;
  if not TNEP_.Active then begin TNEP_.Open; end;
  except
  end;
  DBOK:=false;
  if not TPRIV_.Active then MyError(Format(SMyAppZlyhanieDB,[MyPrivPth+'PRIV.DB'])) else
  if not TPPV_.Active then MyError(Format(SMyAppZlyhanieDB,[MyDataPth+'PPV.DB'])) else
  if not TSYS_.Active then MyError(Format(SMyAppZlyhanieDB,[MyPrivPth+'SYS.DB'])) else
  if not TINF_.Active then MyError(Format(SMyAppZlyhanieDB,[MyDataPth+'INF.DB'])) else
  if not CIS0_.Active then MyError(Format(SMyAppZlyhanieDB,[MyCommPth+'CIS_PAR.DB'])) else
  if not CIS1_.Active then MyError(Format(SMyAppZlyhanieDB,[MyCommPth+'CIS_ZP.DB'])) else
  if not CIS2_.Active then MyError(Format(SMyAppZlyhanieDB,[MyDataPth+'CIS_VM.DB'])) else
  if not CIS3_.Active then MyError(Format(SMyAppZlyhanieDB,[MyCommPth+'CIS_PD.DB'])) else
  if not CIS4_.Active then MyError(Format(SMyAppZlyhanieDB,[MyDataPth+'CIS_BU.DB'])) else
  if not TSET_.Active then MyError(Format(SMyAppZlyhanieDB,[MyCommPth+'SETUP.DB'])) else
  if not TDZP_.Active then MyError(Format(SMyAppZlyhanieDB,[MyDataPth+'DZP.DB'])) else
  if not TZAM_.Active then MyError(Format(SMyAppZlyhanieDB,[MyDataPth+'ZAM.DB'])) else
  if not TDET_.Active then MyError(Format(SMyAppZlyhanieDB,[MyDataPth+'DETI.DB'])) else
  if not TVYP_.Active then MyError(Format(SMyAppZlyhanieDB,[MyDataPth+'VYP.DB'])) else
  if not TRZP_.Active then MyError(Format(SMyAppZlyhanieDB,[MyDataPth+'RZP.DB'])) else
  if not THSV_.Active then MyError(Format(SMyAppZlyhanieDB,[MyPrivPth+'HSV.DB'])) else
  if not TZRZ_.Active then MyError(Format(SMyAppZlyhanieDB,[MyDataPth+'ZRZ.DB'])) else
  if not TZRV_.Active then MyError(Format(SMyAppZlyhanieDB,[MyDataPth+'ZRV.DB'])) else
  if not TNEP_.Active then MyError(Format(SMyAppZlyhanieDB,[MyDataPth+'NEP.DB']))
  else DBOK:=true;
  if not DBOK then Akcia_zatvorenie_db(Sender);
  OTVORENA_FIRMA := TMenuItem(Sender).Tag;
  if DBOK then begin
    Akcia_stredisko(Sender);
    Akcia_obdobie(Sender);
    UpdateStatus;
  end;
end;end;

procedure TForm1.NACITAJ_FIRMY;
var i:integer;s:string;NewItem1,NewItem2: TMenuItem;
begin with DM do begin
  for i:=0 to Otvorenie_firmy.Count-1 do
    Otvorenie_firmy.Remove(Otvorenie_firmy.Items[0]);
  for i:=0 to Zrusenie_firmy.Count-1 do
    Zrusenie_firmy.Remove(Zrusenie_firmy.Items[0]);
  for i:=1 to TSYS_POCET_FIRIEM.Value do
  begin
    s:=Format('%.2d',[i]);
    TXYZ_.Close;
    TXYZ_.TableName:=MyNetPath+'DATA'+s+'\INF.DB';
    try TXYZ_.Open;
      NewItem1 := TMenuItem.Create(Self);
      NewItem1.Tag:=i;
      NewItem1.Caption := s+' '+TXYZ_Nazov.Value;
      NewItem1.OnClick:=Akcia_otvorenie_db;
      Otvorenie_firmy.Add(NewItem1);
      NewItem2 := TMenuItem.Create(Self);
      NewItem2.Tag:=i;
      NewItem2.Caption := s+' '+TXYZ_Nazov.Value;
{      NewItem2.OnClick:=Akcia_zrusenie_firmy;}
      Zrusenie_firmy.Add(NewItem2);
    except
    end;
  end;
  TXYZ_.Close;
end;end;

function  TForm1.Open_db_common:boolean;
begin with DM do begin
  Result:=false;
  {try}
    TSYS_.Close;
    TSET_.Close;
    TDZP_.Close;
    CIS0_.Close;
    CIS1_.Close;
    CIS3_.Close;
    TPRIV_.Close;
    if not TSYS_.Active then TSYS_.Open;
    if not TSET_.Active then TSET_.Open;
    if not TDZP_.Active then TDZP_.Open;
    if not CIS0_.Active then CIS0_.Open;
    if not CIS1_.Active then CIS1_.Open;
    if not CIS3_.Active then CIS3_.Open;
    if not TPRIV_.Active then TPRIV_.Open;
  {except
  end;}
  if not TSYS_.Active then MyError(Format(SMyAppZlyhanieDB,[MyPrivPth+'SYS.DB'])) else
  if not TSET_.Active then MyError(Format(SMyAppZlyhanieDB,[MyCommPth+'SETUP.DB'])) else
  if not TDZP_.Active then MyError(Format(SMyAppZlyhanieDB,[MyCommPth+'DZP.DB'])) else
  if not CIS0_.Active then MyError(Format(SMyAppZlyhanieDB,[MyCommPth+'CIS_PAR.DB'])) else
  if not CIS1_.Active then MyError(Format(SMyAppZlyhanieDB,[MyCommPth+'CIS_ZP.DB'])) else
  if not CIS3_.Active then MyError(Format(SMyAppZlyhanieDB,[MyCommPth+'CIS_PD.DB'])) else
  if not TPRIV_.Active then MyError(Format(SMyAppZlyhanieDB,[MyPrivPth+'PRIV.DB'])) else
  Result:=true;
end;end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  FormHP1:=TFormHP1.Create(Application);
  FormHP1.ShowModal;
  FormHP1.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SYS_START := True;
  try
    if not Open_db_common then Application.Terminate;
  except on E: Exception do
    begin
      MessageDlg('Exception: ' + E.Message, mtInformation, [mbOK], 0);
      Application.Terminate;
    end;
  end;
  NACITAJ_FIRMY;
  if Otvorenie_firmy.Count=0 then begin
    MyError(SMyAppDataNotFound);
    Application.Terminate;
  end;
{  DisableDataSources;}
{  Nastav_Farbu(Self);}
end;



procedure TForm1.Button2Click(Sender: TObject);
begin
 FormCsv1:=TFormCsv1.Create(Application);
 FormCsv1.ShowModal;
 FormCsv1.Free;
end;


procedure TForm1.Button3Click(Sender: TObject);
begin
  Screen.Cursor:=crHourGlass;
  try
    try ReportOdv:=TReportOdv.Create(Application);
    finally Screen.Cursor:=crDefault;
    end;
  except on E:Exception do begin MyError(SMyAppReportInitFailed+E.Message); exit; end;
  end;
  try ReportOdv.ShowReport(DM.AktObdobie);
  except on E:Exception do begin MyError(SMyAppReportShowFailed+E.Message); end;
  end;
  ReportOdv.Free;
end;

end.
