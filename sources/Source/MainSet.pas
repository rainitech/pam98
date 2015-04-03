unit MainSet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MainVzor, Menus, ComCtrls, StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons,
  Db;

type
  TFormSetup = class(TFormMainVzor)
    Panel19: TPanel;
    Panel20: TPanel;
    Butt_setup1_navrat: TBitBtn;
    Panel33: TPanel;
    DBN_setup: TDBNavigator;
    N_SET: TNotebook;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label69: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label125: TLabel;
    Label93: TLabel;
    Label148: TLabel;
    Label273: TLabel;
    Label354: TLabel;
    Label363: TLabel;
    Label364: TLabel;
    Label374: TLabel;
    Label379: TLabel;
    Label254: TLabel;
    Label383: TLabel;
    Label384: TLabel;
    Label385: TLabel;
    Label386: TLabel;
    Label387: TLabel;
    Label409: TLabel;
    Label412: TLabel;
    Label413: TLabel;
    Label414: TLabel;
    Label415: TLabel;
    Label416: TLabel;
    Label52: TLabel;
    S_jan: TDBEdit;
    S_feb: TDBEdit;
    S_mar: TDBEdit;
    S_apr: TDBEdit;
    S_jun: TDBEdit;
    S_jul: TDBEdit;
    S_aug: TDBEdit;
    S_sep: TDBEdit;
    S_okt: TDBEdit;
    S_nov: TDBEdit;
    S_dec: TDBEdit;
    S_maj: TDBEdit;
    S_pn1: TDBEdit;
    S_pn2: TDBEdit;
    S_maxden_nd: TDBEdit;
    S_prvedni_pn: TDBEdit;
    S_zdrav_os: TDBEdit;
    S_nemoc_os: TDBEdit;
    S_dochod_os: TDBEdit;
    S_fondz_os: TDBEdit;
    S_zdrav_firma: TDBEdit;
    S_nemoc_firma: TDBEdit;
    S_dochod_firma: TDBEdit;
    S_fondz_firma: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    S_minden_nd: TDBEdit;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    DBCheckBox22: TDBCheckBox;
    DBCheckBox23: TDBCheckBox;
    DBCheckBox24: TDBCheckBox;
    DBCheckBox26: TDBCheckBox;
    DBCheckBox27: TDBCheckBox;
    DBEdit306: TDBEdit;
    DBEdit307: TDBEdit;
    DBEdit308: TDBEdit;
    DBEdit309: TDBEdit;
    DBEdit310: TDBEdit;
    DBEdit311: TDBEdit;
    DBEdit312: TDBEdit;
    DBEdit313: TDBEdit;
    DBEdit314: TDBEdit;
    DBEdit315: TDBEdit;
    DBEdit316: TDBEdit;
    DBEdit317: TDBEdit;
    DBEdit328: TDBEdit;
    Label67: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label276: TLabel;
    Label68: TLabel;
    Label275: TLabel;
    Label200: TLabel;
    Label289: TLabel;
    Label394: TLabel;
    Label60: TLabel;
    Label422: TLabel;
    Label224: TLabel;
    S_zaok_fondz1: TDBRadioGroup;
    S_zaok_fondz2: TDBRadioGroup;
    S_zaok_poistne1: TDBRadioGroup;
    S_zaok_poistne2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup4: TDBRadioGroup;
    S_zaok_zdanmzda1: TDBRadioGroup;
    S_zaok_zdanmzda2: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup5: TDBRadioGroup;
    DBRadioGroup7: TDBRadioGroup;
    DBRadioGroup8: TDBRadioGroup;
    DBRadioGroup9: TDBRadioGroup;
    DBRadioGroup10: TDBRadioGroup;
    DBRadioGroup11: TDBRadioGroup;
    DBRadioGroup12: TDBRadioGroup;
    DBRadioGroup13: TDBRadioGroup;
    DBRadioGroup14: TDBRadioGroup;
    DBRadioGroup15: TDBRadioGroup;
    DBRadioGroup16: TDBRadioGroup;
    DBRadioGroup17: TDBRadioGroup;
    Label1: TLabel;
    DBRadioGroup6: TDBRadioGroup;
    DBRadioGroup18: TDBRadioGroup;
    Label2: TLabel;
    DBRadioGroup19: TDBRadioGroup;
    DBRadioGroup20: TDBRadioGroup;
    Label3: TLabel;
    DBRadioGroup21: TDBRadioGroup;
    DBRadioGroup22: TDBRadioGroup;
    Label4: TLabel;
    DBRadioGroup23: TDBRadioGroup;
    DBRadioGroup24: TDBRadioGroup;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBRadioGroup35: TDBRadioGroup;
    DBRadioGroup37: TDBRadioGroup;
    DBRadioGroup38: TDBRadioGroup;
    DBRadioGroup39: TDBRadioGroup;
    DBRadioGroup40: TDBRadioGroup;
    DBRadioGroup45: TDBRadioGroup;
    DBRadioGroup46: TDBRadioGroup;
    DBRadioGroup47: TDBRadioGroup;
    DBRadioGroup48: TDBRadioGroup;
    DBRadioGroup49: TDBRadioGroup;
    DBRadioGroup50: TDBRadioGroup;
    DBRadioGroup36: TDBRadioGroup;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    procedure DBN_setupClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Akcia_priprav_oper1(Sender: TObject);
    function NeukonceneZmeny: boolean;override;
    procedure ZrusDbZmeny;override;
  end;

var
  FormSetup: TFormSetup;

procedure RunFormSetup(Par: integer);

implementation

uses Dm_main, MyConsts;

{$R *.DFM}

procedure RunFormSetup(Par: integer);
begin
  FormSetup:=TFormSetup.Create(Application);
  try
  if Par=1 then FormSetup.N_SET.ActivePage := 'PAGE1'
  else if DM.AktObdobie >= ZAKON_2009_01 then FormSetup.N_SET.ActivePage := 'PAGE_ZAOKRUH_2009'
  else FormSetup.N_SET.ActivePage := 'PAGE2';
  FormSetup.ShowModal;
  finally
  FormSetup.Free;
  end;
end;

procedure TFormSetup.DBN_setupClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  Akcia_priprav_oper1(nil);
end;

procedure TFormSetup.Akcia_priprav_oper1(Sender: TObject);
begin with DM do begin
  if TSET_.State in [dsEdit,dsInsert] then begin
    edit1.Enabled:=False;
    post1.Enabled:=True;
    cancel1.Enabled:=True;
    navrat1.Enabled:=False;
    butt_setup1_navrat.Enabled:=False;
  end else
  begin
    edit1.Enabled:=True;
    post1.Enabled:=False;
    cancel1.Enabled:=False;
    navrat1.Enabled:=True;
    butt_setup1_navrat.Enabled:=True;
  end;
end;end;

procedure TFormSetup.FormCreate(Sender: TObject);
begin
  inherited;
  DBN := DBN_setup;
end;

function TFormSetup.NeukonceneZmeny: boolean;
begin with DM do begin
  Result := TSET_.State in [dsEdit,dsInsert];
end;end;

procedure TFormSetup.ZrusDbZmeny;
begin
  DM.TSET_.Cancel;
end;

end.

