unit MainInf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MainVzor, Menus, ComCtrls, StdCtrls, DBCtrls, ExtCtrls, Mask, Buttons,
  Db, checklst;

type
  TFormInf = class(TFormMainVzor)
    Panel7: TPanel;
    Panel9: TPanel;
    btn_firma_navrat: TBitBtn;
    Panel13: TPanel;
    DBN_firma: TDBNavigator;
    SB_FIRMA: TScrollBox;
    PAGE_MAIN: TPageControl;
    PAGE_INFO: TTabSheet;
    PAGE_DOPLNOK: TTabSheet;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label82: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label137: TLabel;
    Label86: TLabel;
    Label119: TLabel;
    Label122: TLabel;
    Label129: TLabel;
    Label156: TLabel;
    Label171: TLabel;
    Label216: TLabel;
    Label417: TLabel;
    Label53: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit12: TDBEdit;
    S_nemocd_pocita: TDBRadioGroup;
    S_nadcas: TDBEdit;
    S_sobota: TDBEdit;
    S_nedela: TDBEdit;
    S_sviatok: TDBEdit;
    S_noc: TDBEdit;
    S_stazene: TDBEdit;
    S_pracdoba: TDBEdit;
    DBEdit133: TDBEdit;
    DBEdit134: TDBEdit;
    DBEdit135: TDBEdit;
    DBEdit136: TDBEdit;
    DBEdit171: TDBEdit;
    DBEdit172: TDBEdit;
    DBRadioGroup6: TDBRadioGroup;
    DBEdit282: TDBEdit;
    DBEdit283: TDBEdit;
    DBEdit284: TDBEdit;
    DBEdit285: TDBEdit;
    DBEdit286: TDBEdit;
    DBEdit287: TDBEdit;
    DBEdit288: TDBEdit;
    DBEdit289: TDBEdit;
    DBEdit278: TDBEdit;
    DBEdit279: TDBEdit;
    DBEdit178: TDBEdit;
    DBEdit1: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBZ_Priezvisko: TDBEdit;
    DBZ_Meno: TDBEdit;
    DBZ_Titul: TDBEdit;
    Label19: TLabel;
    DBZ_RodCislo: TDBEdit;
    Label47: TLabel;
    DBEdit10: TDBEdit;
    TabSheet1: TTabSheet;
    Label63: TLabel;
    Label14: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label290: TLabel;
    Label291: TLabel;
    Label292: TLabel;
    Label293: TLabel;
    Label294: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label36: TLabel;
    Label150: TLabel;
    Label49: TLabel;
    DBZ_Ulica: TDBEdit;
    DBZ_Mesto: TDBEdit;
    DBZ_PSC: TDBEdit;
    DBZ_Telefon1: TDBEdit;
    DBEdit102: TDBEdit;
    DBEdit106: TDBEdit;
    DBEdit107: TDBEdit;
    qx: TDBLookupComboBox;
    DBLookupComboBox6: TDBLookupComboBox;
    DBEdit86: TDBEdit;
    DBEdit87: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit88: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBRadioGroup3: TDBRadioGroup;
    CheckListBox1: TCheckListBox;
    Memo1: TMemo;
    DBCheckBox2: TDBCheckBox;
    TabSheet2: TTabSheet;
    Label15: TLabel;
    DBEdit13: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    Button1: TButton;
    Label17: TLabel;
    DBEdit15: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Button2: TButton;
    Button3: TButton;
    DBEdit16: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure Akcia_priprav_firma(Sender: TObject);
    procedure Akcia_priplatky(Sender: TObject);
    procedure CheckListBox1ClickCheck(Sender: TObject);
    procedure DBN_firmaBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure DBN_firmaClick(Sender: TObject; Button: TNavigateBtn);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init_typ_priplatkov;
    function NeukonceneZmeny: boolean;override;
    procedure ZrusDbZmeny;override;
  end;

var
  FormInf: TFormInf;

procedure RunFormInf;

implementation

uses Dm_main, MyConsts, FmxUtils;

{$R *.DFM}



procedure TFormInf.FormCreate(Sender: TObject);
begin
  inherited;
  DBN := DBN_FIRMA;
  Init_typ_priplatkov;
  PAGE_MAIN.ActivePage := PAGE_INFO;
end;

procedure RunFormInf;
begin
  FormInf:=TFormInf.Create(Application);
  try
  FormInf.ShowModal;
  finally
  FormInf.Free;
  end;
end;

procedure TFormInf.Akcia_priprav_firma(Sender: TObject);
begin with DM do begin
  inherited;
  if TINF_.State in [dsEdit,dsInsert] then begin
    edit1.Enabled:=False;
    post1.Enabled:=True;
    cancel1.Enabled:=True;
    navrat1.Enabled:=False;
    btn_firma_navrat.Enabled:=False;
    CheckListBox1.Enabled:=True;
  end else
  begin
    edit1.Enabled:=True;
    post1.Enabled:=False;
    cancel1.Enabled:=False;
    navrat1.Enabled:=True;
    btn_firma_navrat.Enabled:=True;
    CheckListBox1.Enabled:=False;
  end;
end;end;

procedure TFormInf.Init_typ_priplatkov;
var s1,s2:string;i:integer;
begin with DM do begin
  CheckListBox1.Enabled:=False;
  s1:=TINF_CALC_TYP_PRIPLATKOV.Value;
  NEW_TYP_PRIPLATKOV := s1;
  for i:=2 to 7 do if s1[i]='1' then begin
    CheckListBox1.Checked[i-2]:=true;
  end else begin
    CheckListBox1.Checked[i-2]:=false;
  end;
  s2:=TINF_CALC_TYP_PRIPLATKOV2.Value;
  NEW_TYP_PRIPLATKOV2 := s2;
  for i:=1 to 5 do if s2[i]='1' then begin
    CheckListBox1.Checked[i+5]:=true;
  end else begin
    CheckListBox1.Checked[i+5]:=false;
  end;
  for i:=0 to 10 do
   if CheckListBox1.Checked[i]
     then Memo1.Lines[i]:='HS'
     else Memo1.Lines[i]:='%S';
end;end;

procedure TFormInf.Akcia_priplatky(Sender: TObject);
  function Get_rb(i:integer):char;
  begin if CheckListBox1.Checked[i] then Result:='1' else Result:='0'; end;
begin with DM do begin
  inherited;
  if NOT (DM.TINF_.State in [dsInsert,dsEdit]) then
  begin
    Init_typ_priplatkov;exit;
  end;
  New_typ_priplatkov[1]:='0';
  New_typ_priplatkov[2]:=Get_rb(0);
  New_typ_priplatkov[3]:=Get_rb(1);
  New_typ_priplatkov[4]:=Get_rb(2);
  New_typ_priplatkov[5]:=Get_rb(3);
  New_typ_priplatkov[6]:=Get_rb(4);
  New_typ_priplatkov[7]:=Get_rb(5);
  New_typ_priplatkov[8]:='0';
  {--}
  New_typ_priplatkov2[1]:=Get_rb(6);
  New_typ_priplatkov2[2]:=Get_rb(7);
  New_typ_priplatkov2[3]:=Get_rb(8);
  New_typ_priplatkov2[4]:=Get_rb(9);
  New_typ_priplatkov2[5]:=Get_rb(10);
  New_typ_priplatkov2[6]:='0';
  New_typ_priplatkov2[7]:='0';
  New_typ_priplatkov2[8]:='0';
end;end;

function TFormInf.NeukonceneZmeny: boolean;
begin with DM do begin
  Result := TINF_.State in [dsEdit,dsInsert];
end;end;

procedure TFormInf.ZrusDbZmeny;
begin
  DM.TINF_.Cancel;
end;

procedure TFormInf.CheckListBox1ClickCheck(Sender: TObject);
var i:integer;s:string;
begin
  inherited;
  for i:=0 to (Sender as TCheckListBox).Items.Count-1 do
  if (Sender as TCheckListBox).Checked[i]
  then Memo1.Lines[i]:='HS'
  else Memo1.Lines[i]:='%S';
end;

procedure TFormInf.DBN_firmaBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  Akcia_priplatky(Sender);
end;

procedure TFormInf.DBN_firmaClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  Akcia_priprav_firma(Sender);
end;





procedure TFormInf.Button1Click(Sender: TObject);
var Cmd: string;
begin with DM do begin
  inherited;

  Cmd := Format(
  ' "%s" -try 3 -log "%s" -delay 1 -8bitmime -mailfrom "%s" -sf "%s" -base64 -to %s -server %s -u %s -pw %s',
  [
   MyDataPth+OutboxMessageBodyFile,
   MyAppPath+'zasielanie.log',
   TINF_SMTP_FROM.Value,
   MyDataPth+OutboxSubjectFile,
   TINF_SMTP_FROM.Value,
   TINF_SMTP_SERVER.Value,
   TINF_SMTP_USER.Value,
   TINF_SMTP_PWD.Value
   ]);

  ExecuteFileX(MyAppPath + 'blat',Cmd,'',0);
  Show;
end;end;

procedure TFormInf.Button2Click(Sender: TObject);
begin
  inherited;
  ExecuteFile('write',MyDataPth+OutboxMessageBodyFile,'',1);
  Show;
end;


procedure TFormInf.Button3Click(Sender: TObject);
begin
  inherited;
  ExecuteFile('write',MyDataPth+OutboxSubjectFile,'',1);
  Show;
end;

end.
