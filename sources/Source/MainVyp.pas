UNIT MainVyp;

interface

{$INCLUDE DEFINE.INC}   

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, Tabs,
  ComCtrls, Menus, DBConsts, DB, Spin, Tabnotbk, DBCGrids, DBTables,
  MyConsts;

type
  TFormMainVyp = class(TForm)
    MainMenu1: TMainMenu;
    StatusBar1: TStatusBar;
    Operacie_vypl1: TMenuItem;
    Vypl_insert1: TMenuItem;
    Vypl_edit1: TMenuItem;
    Vypl_post1: TMenuItem;
    Vypl_cancel1: TMenuItem;
    N3: TMenuItem;
    Vypl_tlac1: TMenuItem;
    Vypl_navrat1: TMenuItem;
    Vypl_delete1: TMenuItem;
    N8: TMenuItem;
    Vypl_zakladne: TMenuItem;
    N17: TMenuItem;
    Vypl_doplnkove: TMenuItem;
    Vypl_zrazky: TMenuItem;
    Operacie_zrv1: TMenuItem;
    zrv_cancel: TMenuItem;
    zrv_post: TMenuItem;
    zrv_delete: TMenuItem;
    zrv_insert: TMenuItem;
    Operacie_zamf1: TMenuItem;
    Nvrat1: TMenuItem;
    N22: TMenuItem;
    Zoradeniepodaosobnhosla1: TMenuItem;
    Zoradeniepodaabecedy1: TMenuItem;
    N33: TMenuItem;
    Vberzamestnanca1: TMenuItem;
    N: TNotebook;
    Splitter_ZAMF: TSplitter;
    Panel_zamf: TPanel;
    Panel2: TPanel;
    BitBtn19: TBitBtn;
    BitBtn8: TBitBtn;
    Panel59: TPanel;
    DBG_zamf: TDBGrid;
    Label51: TLabel;
    Splitter_VYP: TSplitter;
    Panel23: TPanel;
    DBText1: TDBText;
    Panel10: TPanel;
    Butt_vypl_tlac: TSpeedButton;
    Butt_vypl_navrat: TBitBtn;
    Panel28: TPanel;
    DBN_vypl2: TDBNavigator;
    DBN_vypl1: TDBNavigator;
    Label175: TLabel;
    Label190: TLabel;
    Label268: TLabel;
    Label305: TLabel;
    Label308: TLabel;
    Label309: TLabel;
    Label310: TLabel;
    Label311: TLabel;
    Label312: TLabel;
    Label388: TLabel;
    Label315: TLabel;
    DBText16: TDBText;
    DBText17: TDBText;
    DBText18: TDBText;
    DBText19: TDBText;
    DBText20: TDBText;
    DBText21: TDBText;
    DBText30: TDBText;
    DBText31: TDBText;
    DBText32: TDBText;
    DBText33: TDBText;
    DBText34: TDBText;
    DBText35: TDBText;
    DBText36: TDBText;
    DBText37: TDBText;
    Label353: TLabel;
    DBText38: TDBText;
    DBText39: TDBText;
    SB_VYPL: TScrollBox;
    N_VYPL: TPageControl;
    PAGE_ZAKLAD: TTabSheet;
    PAGE_PRIPL: TTabSheet;
    Panel54: TPanel;
    Panel1: TPanel;
    Label365: TLabel;
    Label366: TLabel;
    Label367: TLabel;
    Label368: TLabel;
    Label369: TLabel;
    Label370: TLabel;
    Label371: TLabel;
    Label372: TLabel;
    Label373: TLabel;
    Label176: TLabel;
    Label183: TLabel;
    Label266: TLabel;
    Label267: TLabel;
    Label348: TLabel;
    Label349: TLabel;
    Label350: TLabel;
    Label351: TLabel;
    Label352: TLabel;
    DBEdit98: TDBEdit;
    DBEdit121: TDBEdit;
    DBEdit255: TDBEdit;
    DBEdit256: TDBEdit;
    DBEdit257: TDBEdit;
    DBEdit258: TDBEdit;
    DBEdit259: TDBEdit;
    DBEdit260: TDBEdit;
    DBEdit261: TDBEdit;
    DBEdit262: TDBEdit;
    DBEdit263: TDBEdit;
    DBEdit264: TDBEdit;
    DBEdit99: TDBEdit;
    DBEdit238: TDBEdit;
    DBEdit239: TDBEdit;
    DBEdit240: TDBEdit;
    DBEdit241: TDBEdit;
    PAGE_ND: TTabSheet;
    PAGE_ZRAZKY: TTabSheet;
    Panel43: TPanel;
    Panel45: TPanel;
    DBN_zrv2: TDBNavigator;
    DBN_zrv1: TDBNavigator;
    SB_ZRV: TScrollBox;
    DBGrid9: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    DBText22: TDBText;
    Label15: TLabel;
    DBText23: TDBText;
    DBText24: TDBText;
    DBEdit59: TDBEdit;
    DBEdit62: TDBEdit;
    DBEdit63: TDBEdit;
    DBEdit76: TDBEdit;
    DBEdit78: TDBEdit;
    DBEdit79: TDBEdit;
    DBEdit80: TDBEdit;
    DBEdit81: TDBEdit;
    DBEdit82: TDBEdit;
    DBEdit83: TDBEdit;
    DBEdit84: TDBEdit;
    DBEdit100: TDBEdit;
    DBEdit101: TDBEdit;
    DBEdit219: TDBEdit;
    DBEdit220: TDBEdit;
    DBEdit221: TDBEdit;
    DBEdit222: TDBEdit;
    DBEdit223: TDBEdit;
    DBEdit291: TDBEdit;
    DBEdit292: TDBEdit;
    DBEdit293: TDBEdit;
    DBEdit295: TDBEdit;
    DBEdit296: TDBEdit;
    DBEdit297: TDBEdit;
    DBEdit299: TDBEdit;
    DBEdit300: TDBEdit;
    DBEdit301: TDBEdit;
    DBEdit303: TDBEdit;
    DBEdit304: TDBEdit;
    DBEdit305: TDBEdit;
    DBEdit290: TDBEdit;
    Panel56: TPanel;
    DBEdit275: TDBEdit;
    DBEdit276: TDBEdit;
    DBEdit277: TDBEdit;
    Label274: TLabel;
    Label277: TLabel;
    Label278: TLabel;
    Label279: TLabel;
    Label280: TLabel;
    Label281: TLabel;
    Label16: TLabel;
    Label282: TLabel;
    DBEdit124: TDBEdit;
    DBEdit125: TDBEdit;
    DBEdit126: TDBEdit;
    DBEdit127: TDBEdit;
    DBEdit128: TDBEdit;
    DBEdit129: TDBEdit;
    DBEdit130: TDBEdit;
    DBEdit214: TDBEdit;
    DBEdit215: TDBEdit;
    DBEdit216: TDBEdit;
    DBEdit280: TDBEdit;
    DBEdit281: TDBEdit;
    DBEdit294: TDBEdit;
    DBEdit298: TDBEdit;
    DBEdit302: TDBEdit;
    DBEdit318: TDBEdit;
    DBEdit218: TDBEdit;
    DBEdit319: TDBEdit;
    Panel58: TPanel;
    DBEdit320: TDBEdit;
    DBCheckBox31: TDBCheckBox;
    DBCheckBox32: TDBCheckBox;
    Label4: TLabel;
    Label14: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label55: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label_dohody_old: TLabel;
    Label195: TLabel;
    Label196: TLabel;
    Label197: TLabel;
    Label199: TLabel;
    Label205: TLabel;
    Label207: TLabel;
    Label208: TLabel;
    Label211: TLabel;
    LabelPlusDohodyOld: TLabel;
    Label236: TLabel;
    Label238: TLabel;
    Label261: TLabel;
    Label262: TLabel;
    Label126: TLabel;
    Label128: TLabel;
    Label135: TLabel;
    Label139: TLabel;
    Label146: TLabel;
    Label150: TLabel;
    Label151: TLabel;
    Label283: TLabel;
    Label284: TLabel;
    Label285: TLabel;
    Label286: TLabel;
    Label287: TLabel;
    Label288: TLabel;
    Label303: TLabel;
    Label389: TLabel;
    Label390: TLabel;
    Label391: TLabel;
    DBText15: TDBText;
    Label314: TLabel;
    Label344: TLabel;
    Label346: TLabel;
    Label347: TLabel;
    Label189: TLabel;
    Label345: TLabel;
    Label355: TLabel;
    Label356: TLabel;
    Label357: TLabel;
    DBText28: TDBText;
    DBText29: TDBText;
    Label358: TLabel;
    Label359: TLabel;
    Label360: TLabel;
    Label361: TLabel;
    Label362: TLabel;
    Label405: TLabel;
    Label406: TLabel;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit55: TDBEdit;
    DBEdit_dohody_old: TDBEdit;
    DBEdit58: TDBEdit;
    DBEdit85: TDBEdit;
    DBEdit86: TDBEdit;
    DBEdit87: TDBEdit;
    DBEdit111: TDBEdit;
    DBEdit114: TDBEdit;
    DBEdit115: TDBEdit;
    DBEdit116: TDBEdit;
    DBEdit117: TDBEdit;
    DBCheckBox16: TDBCheckBox;
    DBEdit118: TDBEdit;
    DBEdit119: TDBEdit;
    DBEdit120: TDBEdit;
    DBEdit60: TDBEdit;
    DBEdit64: TDBEdit;
    DBEdit65: TDBEdit;
    DBEdit67: TDBEdit;
    DBEdit196: TDBEdit;
    DBEdit235: TDBEdit;
    DBEdit237: TDBEdit;
    DBEdit97: TDBEdit;
    DBEdit236: TDBEdit;
    DBEdit247: TDBEdit;
    DBEdit248: TDBEdit;
    DBEdit243: TDBEdit;
    DBEdit270: TDBEdit;
    DBEdit271: TDBEdit;
    Label318: TLabel;
    Label325: TLabel;
    Label328: TLabel;
    Label329: TLabel;
    Label330: TLabel;
    Label331: TLabel;
    Label332: TLabel;
    Label333: TLabel;
    Label334: TLabel;
    Label335: TLabel;
    Label339: TLabel;
    DBEdit202: TDBEdit;
    DBEdit208: TDBEdit;
    DBEdit210: TDBEdit;
    DBEdit211: TDBEdit;
    DBEdit212: TDBEdit;
    DBEdit213: TDBEdit;
    DBEdit224: TDBEdit;
    DBEdit225: TDBEdit;
    DBEdit226: TDBEdit;
    DBEdit227: TDBEdit;
    DBEdit230: TDBEdit;
    Vypl_nepritomnost: TMenuItem;
    Vypl_nemocenske: TMenuItem;
    N1: TMenuItem;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Panel_vyp_grid: TPanel;
    DBGrid2: TDBGrid;
    DBRadioGroup1: TDBRadioGroup;
    PAGE_USE: TTabSheet;
    Label191: TLabel;
    DBCheckBox5: TDBCheckBox;
    DBEdit103: TDBEdit;
    DBEdit273: TDBEdit;
    Label206: TLabel;
    Label410: TLabel;
    Label24: TLabel;
    DBEdit4: TDBEdit;
    Label25: TLabel;
    DBEdit5: TDBEdit;
    Vypl_nepouz: TMenuItem;
    Label185: TLabel;
    Label123: TLabel;
    DBEdit253: TDBEdit;
    DBEdit254: TDBEdit;
    DBEdit252: TDBEdit;
    DBEdit251: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    DBEdit3: TDBEdit;
    Label32: TLabel;
    DBEdit16: TDBEdit;
    PAGE_VYKON: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    DBN_hsu2: TDBNavigator;
    DBN_hsu1: TDBNavigator;
    Panel5: TPanel;
    DBGrid3: TDBGrid;
    Vypl_vykonova: TMenuItem;
    operacie_hsu1: TMenuItem;
    hsu_insert: TMenuItem;
    hsu_edit: TMenuItem;
    hsu_delete: TMenuItem;
    hsu_post: TMenuItem;
    hsu_cancel: TMenuItem;
    PAGE_POISTNE: TTabSheet;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label39: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    Label45: TLabel;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit46: TDBEdit;
    Label50: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    DBEdit47: TDBEdit;
    DBEdit_Oz_zdravot: TDBEdit;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit68: TDBEdit;
    DBEdit69: TDBEdit;
    DBEdit70: TDBEdit;
    Label49: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    DBEdit71: TDBEdit;
    DBEdit72: TDBEdit;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    DBEdit75: TDBEdit;
    DBEdit92: TDBEdit;
    DBEdit102: TDBEdit;
    DBEdit106: TDBEdit;
    DBEdit107: TDBEdit;
    DBEdit108: TDBEdit;
    DBEdit109: TDBEdit;
    DBEdit131: TDBEdit;
    DBEdit132: TDBEdit;
    Label58: TLabel;
    DBEdit133: TDBEdit;
    Label193: TLabel;
    DBEdit105: TDBEdit;
    Label_PRHRMEZA: TLabel;
    DB_PRHRMEZA: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label54: TLabel;
    DBEdit26: TDBEdit;
    Label59: TLabel;
    DBEdit27: TDBEdit;
    Label60: TLabel;
    DBEdit28: TDBEdit;
    Label64: TLabel;
    DBCheckBox7: TDBCheckBox;
    Label65: TLabel;
    Label26: TLabel;
    Label23: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    DBCheckBox15: TDBCheckBox;
    DBEdit112: TDBEdit;
    DBEdit61: TDBEdit;
    DBEdit77: TDBEdit;
    DBEdit324: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit88: TDBEdit;
    DBEdit89: TDBEdit;
    Label194: TLabel;
    DBEdit110: TDBEdit;
    DBEdit321: TDBEdit;
    Label66: TLabel;
    Label67: TLabel;
    DBEdit12: TDBEdit;
    Label31: TLabel;
    Label69: TLabel;
    DBEdit93: TDBEdit;
    Label198: TLabel;
    Label407: TLabel;
    DBEdit104: TDBEdit;
    DBEdit113: TDBEdit;
    DBEdit272: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    Label70: TLabel;
    Label71: TLabel;
    DBEdit66: TDBEdit;
    Label72: TLabel;
    Label73: TLabel;
    DBEdit94: TDBEdit;
    Label74: TLabel;
    Label63: TLabel;
    DBEdit95: TDBEdit;
    Label77: TLabel;
    DBEdit122: TDBEdit;
    Label76: TLabel;
    Label78: TLabel;
    Label80: TLabel;
    DBEdit96: TDBEdit;
    Label79: TLabel;
    DBEdit123: TDBEdit;
    Label68: TLabel;
    DBEdit91: TDBEdit;
    Label82: TLabel;
    DBEdit134: TDBEdit;
    SpeedButton1: TSpeedButton;
    Vypl_poistne: TMenuItem;
    Label83: TLabel;
    DBEdit49: TDBEdit;
    Label121: TLabel;
    DBEdit57: TDBEdit;
    Label84: TLabel;
    DBComboBox1: TDBComboBox;
    Label85: TLabel;
    DBEdit90: TDBEdit;
    Label28: TLabel;
    Label29: TLabel;
    DBEdit7: TDBEdit;
    DBCheckBox3: TDBCheckBox;
    Label30: TLabel;
    Panel6: TPanel;
    Edit_zam_filter: TEdit;
    PAGE_NP: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    DBN_np2: TDBNavigator;
    DBN_np1: TDBNavigator;
    DBGridNP1: TDBGrid;
    ScrollBox1: TScrollBox;
    Label75: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    DBEdit137: TDBEdit;
    DBEdit138: TDBEdit;
    DBEdit139: TDBEdit;
    DBEdit146: TDBEdit;
    DBEdit148: TDBEdit;
    DBEdit149: TDBEdit;
    DBEdit150: TDBEdit;
    DBEdit154: TDBEdit;
    DBEdit156: TDBEdit;
    DBEdit158: TDBEdit;
    DBEdit160: TDBEdit;
    DBEdit161: TDBEdit;
    DBEdit162: TDBEdit;
    DBEdit163: TDBEdit;
    DBEdit164: TDBEdit;
    DBEdit166: TDBEdit;
    DBEdit168: TDBEdit;
    DBEdit170: TDBEdit;
    DBEdit144: TDBEdit;
    Label86: TLabel;
    DBEdit8: TDBEdit;
    Label97: TLabel;
    DBEdit186: TDBEdit;
    Label91: TLabel;
    Label90: TLabel;
    Label102: TLabel;
    DBEdit9: TDBEdit;
    Label103: TLabel;
    DBEdit10: TDBEdit;
    Label104: TLabel;
    Label105: TLabel;
    DBEdit135: TDBEdit;
    Edit_zam_filter_rc: TEdit;
    Label27: TLabel;
    DBEdit136: TDBEdit;
    DBCheckBox4: TDBCheckBox;
    Label106: TLabel;
    DBText25: TDBText;
    Label107: TLabel;
    DBEdit140: TDBEdit;
    DBText26: TDBText;
    Label81: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    DBEdit56: TDBEdit;
    DBEdit141: TDBEdit;
    DBEdit142: TDBEdit;
    DBEdit143: TDBEdit;
    DBEdit145: TDBEdit;
    DBEdit147: TDBEdit;
    DBEdit151: TDBEdit;
    DBEdit152: TDBEdit;
    Label122: TLabel;
    Label124: TLabel;
    DBEdit153: TDBEdit;
    Label125: TLabel;
    Label127: TLabel;
    DBEdit155: TDBEdit;
    DBEdit157: TDBEdit;
    Label129: TLabel;
    Label130: TLabel;
    DBEdit159: TDBEdit;
    DBEdit165: TDBEdit;
    DBCheckBox6: TDBCheckBox;
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure SET_ALL(Sender: TObject);
    procedure SET_ALL_MV_PLAT(Sender: TObject);
    procedure Akcia_zamf_vyber(Sender: TObject);
    procedure NPageChanged(Sender: TObject);
    procedure Akcia_vypl_navrat(Sender: TObject);
    procedure Akcia_obdobie(Sender: TObject);
    procedure Akcia_stredisko(Sender: TObject);
    procedure Show_FormAbout(Sender: TObject);
    procedure Akcia_priprav_vypl1(Sender: TObject);
    procedure Akcia_vypl_insert(Sender: TObject);
    procedure Akcia_vypl_edit(Sender: TObject);
    procedure Akcia_vypl_delete(Sender: TObject);
    procedure Akcia_vypl_post(Sender: TObject);
    procedure Akcia_vypl_cancel(Sender: TObject);
    procedure DBN_OnClick(Sender: TObject; Button: TNavigateBtn);
    procedure DBG_zamfKeyPress(Sender: TObject; var Key: Char);
    procedure Akcia_system_koniec(Sender: TObject);
    procedure Akcia_kalkulacka(Sender: TObject);
    procedure Vypl_zakladneClick(Sender: TObject);
    procedure Vypl_doplnkoveClick(Sender: TObject);
    procedure Akcia_zam_zoradit1(Sender: TObject);
    procedure Akcia_zam_zoradit2(Sender: TObject);
    procedure Akcia_zam_sucasny(Sender: TObject);
    procedure Akcia_zam_vyradeny(Sender: TObject);
    procedure Akcia_zam_vsetci(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Hint_zobraz(Sender: TObject);
    procedure Hint_zmaz(Sender: TObject);
    procedure akcia_priprav_zrv(Sender: TObject);
    procedure DBN_zrv1Click(Sender: TObject; Button: TNavigateBtn);
    procedure akcia_zrv(Sender: TObject);
    procedure DBComboBoxRp1Enter(Sender: TObject);
    procedure Zoznamskratiek1Click(Sender: TObject);
    procedure ShowReportVP1(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N_VYPLChange(Sender: TObject);
    procedure Vypl_zrazkyClick(Sender: TObject);
    procedure Vypl_nemocenskeClick(Sender: TObject);
    procedure Vypl_nepouzClick(Sender: TObject);
    procedure N_VYPLChanging(Sender: TObject; var AllowChange: Boolean);
    procedure DBG_zamfDblClick(Sender: TObject);
    procedure akcia_priprav_vykon(Sender: TObject);
    procedure akcia_priprav_np(Sender: TObject);
    procedure DBN_hsu1Click(Sender: TObject; Button: TNavigateBtn);
    procedure akcia_hsu(Sender: TObject);
    procedure hint_zobraz_vvz(Sender: TObject);
    procedure ShowReportVYK(Sender: TObject);
    procedure Vypl_poistneClick(Sender: TObject);
    procedure DBG_zamfTitleClick(Column: TColumn);
    procedure Edit_zam_filterKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SET_ALL_VYPNP(Sender: TObject);
    procedure DBN_np1Click(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
    X: TMyReportParam;
    SYS_START: Boolean;
    function  VYPLNENE_POLE(F:TField):boolean;
    function  VYPLNENE: boolean;
    procedure NASTAV_PRVY;
    procedure DisableOperacie;
    procedure EnableMenuItem(i:TMenuItem);
    procedure DisableMenuItem(i:TMenuItem);
    procedure UpdateStatus;
    procedure UpdatePanelHotova;
    procedure RefreshDatabase;
  end;

var
  FormMainVyp: TFormMainVyp;
  AppCalc: Boolean;
  App_Vyplaty: Boolean;

implementation

uses DM_Main, Dm_zam, Dm_vypl, Login, Obdobie, About,
  Dm_ppv, RXCalc, Myreg, Sc_main, Stred, Pridavky,
  Xenon, FmxUtils, FileCtrl, Progress, MainHP1, Pomoc, MainCsv1, ParForm,
  M_Pomoc, DM_ALL, Main;

type
  TFooClass = class(TControl); { needed to get at protected font property }

{$R *.DFM}

procedure TFormMainVyp.UpdateStatus;
begin with DM do begin
 MyStatus:='Výplatné obdobie: '+AktObdobieStr2;
 MyCaption:='PAM98 '+UpperCase(Copy(MyVerzia,1,Length(MyVerzia)-1))+' - Firma: '+TINF_Nazov.Value+
             ' - Stredisko: '+AktStrediskoStr;
 StatusBar1.Panels[0].Text:= MyStatus;
 Caption := MyCaption;
end;end;

procedure TFormMainVyp.UpdatePanelHotova;
begin

end;

procedure TFormMainVyp.EnableMenuItem(i:TMenuItem);
begin
  i.Enabled:=True;
  i.Visible:=True;
end;

procedure TFormMainVyp.DisableMenuItem(i:TMenuItem);
begin
  i.Enabled:=False;
  i.Visible:=False;
end;

procedure TFormMainVyp.DisableOperacie;
begin
  DisableMenuItem(Operacie_zamf1);
  DisableMenuItem(Operacie_vypl1);
  DisableMenuItem(Operacie_zrv1);
  DisableMenuItem(Operacie_hsu1);
end;

function TFormMainVyp.VYPLNENE_POLE(F:TField):boolean;
const
  CheckTypes = [ftString, ftSmallint, ftInteger, ftWord, ftBoolean, ftFloat,
    ftCurrency, ftBCD, ftDate, ftTime, ftDateTime, ftBytes, ftVarBytes];
begin
  VYPLNENE_POLE:=TRUE;
  with F do
  if Required and
    (DataSet.State in [dsEdit,dsInsert])and
    (FieldKind = fkData) and
    (DataType in CheckTypes) and IsNull then
  begin
    VYPLNENE_POLE:=FALSE;
    FocusControl;
    DatabaseError(Format(SFieldRequired, [DisplayName]));
  end;
end;

function TFormMainVyp.VYPLNENE: boolean;
var i:integer;
begin
  VYPLNENE:=TRUE;
  for i:=0 to ComponentCount-1 do
  if (Components[i] is TDBEdit) then
  with Components[i] as TDBEdit do
  begin
    if CanFocus then
     VYPLNENE:=VYPLNENE_POLE(DataSource.Dataset.FieldByName(DataField));
  end;
end;

procedure TFormMainVyp.NASTAV_PRVY;
var i:integer;
begin
  for i:=0 to ComponentCount-1 do
  if (Components[i] is TDBEdit) then
  begin
    if (Components[i] as TDBEdit).TabOrder=0 then
    if (Components[i] as TDBEdit).CanFocus then
    begin
      (Components[i] as TDBEdit).SetFocus;
      break;
    end;
  end
  else
  if (Components[i] is TEdit) then
  begin
    if (Components[i] as TEdit).TabOrder=0 then
    if (Components[i] as TEdit).CanFocus then
    begin
      (Components[i] as TEdit).SetFocus;
      break;
    end;
  end
end;

procedure TFormMainVyp.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key)=13 then DBG_zamf.SetFocus;
end;

procedure TFormMainVyp.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key)=13 then DBG_zamf.SetFocus;
end;

procedure TFormMainVyp.FormCreate(Sender: TObject);
begin
  SYS_START := True;
  Nastav_Farbu(Self);
  N_VYPL.ActivePage:=PAGE_ZAKLAD;
  N.ActivePage:='ZAMF';
  N.Enabled:=True;
  {Akcia_zam_sucasny(nil);}
  Label_PRHRMEZA.Visible := True;
  DB_PRHRMEZA.Visible := True;
  UpdatePanelHotova;
end;

procedure TFormMainVyp.SET_ALL(Sender: TObject);
begin
  DMV.SET_ALL;
  Hint_Zmaz(Sender);
end;

procedure TFormMainVyp.SET_ALL_MV_PLAT(Sender: TObject);
begin with DM,DMV do if TVYP_.State in [dsEdit,dsInsert] then begin
  TVYP_PRHRMEZA.Value:=0;
  DMV.SET_V_PRIEMER3;
  DMV.SET_ALL;
  Hint_Zmaz(Sender);
end;end;

procedure TFormMainVyp.Akcia_zamf_vyber(Sender: TObject);
begin with DMZ do begin
  if TZAM_.IsEmpty then raise EMyError.Create(SMyZamNotFound);
  DMV.DS_VYPL.Enabled:=True;
  DMV.DS_VGRID.Enabled:=True;
  DMZ.DS_ZGRID.Enabled:=True;
  N.ActivePage:='VYPL1';
end;end;

procedure TFormMainVyp.NPageChanged(Sender: TObject);
begin with DM,DMZ,DMV,DMP do begin
  SB_VYPL.HorzScrollBar.Position := 0;
  SB_VYPL.VertScrollBar.Position := 0;
  DisableOperacie;
  if N.ActivePage='VYPL1' then
  begin
    N_VYPL.ActivePage:=PAGE_ZAKLAD;
    EnableMenuItem(Operacie_vypl1);
    if NOT (TVYP_.State in [dsEdit,dsInsert]) then
    begin
      {--}
      TPPV_.SetRangeStart;
      TPPV_.FieldByName('Code_emp').Value := TZAM_Code_emp.Value;
      TPPV_.SetRangeEnd;
      TPPV_.FieldByName('Code_emp').Value := TZAM_Code_emp.Value+1;
      TPPV_.ApplyRange;
      TPPV_.First;
      TPPV_.Filter:='Vystup=null';
      TPPV_.Filtered:=True;
      {--}
      TVYP_.SetRangeStart;
      TVYP_.FieldByName('Code_emp').Value := TZAM_Code_emp.Value;
      TVYP_.FieldByName('V_obdobie').Value := DM.AktRok*100+1;
      TVYP_.SetRangeEnd;
      TVYP_.FieldByName('Code_emp').Value := TZAM_Code_emp.Value;
      TVYP_.FieldByName('V_obdobie').Value := DM.AktRok*100+12;
      TVYP_.ApplyRange;
      if NOT TVYP_.FindKey([TZAM_Code_emp.Value,DM.AktObdobie])
       then TVYP_.Last;
      {--ZRV--}
      EnableMenuItem(Operacie_zrv1);
      TZRV_.SetRangeStart;
      TZRV_.FieldByName('Code_emp').Value := TZAM_Code_emp.Value;
      TZRV_.FieldByName('V_obdobie').Value := TVYP_V_obdobie.Value;
      TZRV_.SetRangeEnd;
      TZRV_.FieldByName('Code_emp').Value := TZAM_Code_emp.Value;
      TZRV_.FieldByName('V_obdobie').Value := TVYP_V_obdobie.Value+1;
      TZRV_.ApplyRange;
      TZRV_.First;
      TZRV_.Filtered:=False;
      {--HSU--}
      EnableMenuItem(Operacie_hsu1);
      THSU_.SetRangeStart;
      THSU_.FieldByName('V_obdobie').Value := TVYP_V_obdobie.Value;
      THSU_.FieldByName('Code_numb').Value := TZAM_Code_numb.Value;
      THSU_.FieldByName('Code_emp').Value := TZAM_Code_emp.Value;
      THSU_.SetRangeEnd;
      THSU_.FieldByName('V_obdobie').Value := TVYP_V_obdobie.Value;
      THSU_.FieldByName('Code_numb').Value := TZAM_Code_numb.Value;
      THSU_.FieldByName('Code_emp').Value := TZAM_Code_emp.Value+1;
      THSU_.ApplyRange;
      THSU_.First;
      THSU_.Filtered:=False;
      {--HSU--}
      DS_VYPNP.Enabled := True;
    end
    else begin
      SET_ALL;
    end;
  end
  else if N.ActivePage='ZAMF' then
  begin
    EnableMenuItem(Operacie_zamf1);
    PANEL_ZAMF.Caption:='  1.04  Výplaty - výber zamestnanca';
    UpdatePanelHotova;
    Edit_zam_filter.SetFocus;
    Edit_zam_filter.SelLength := 0;
  end;
  if N.ActivePage<>'ZAMF'
  then NASTAV_PRVY;
end;end;

procedure TFormMainVyp.Akcia_vypl_navrat(Sender: TObject);
begin with DMV,DMZ do begin
  Kontrola_Zmien(TZRV_,SMyAppZrvCancel,True);
  Kontrola_Zmien(THSU_,SMyAppHsuCancel,True);
  Kontrola_Zmien(TVYPNP_,SMyAppVypNpCancel,True);

  if TVYP_.State in [dsEdit,dsInsert]
  then raise EMyError.Create(SMyAppEditMode)
  else N.ActivePage:='ZAMF';
end;end;

procedure TFormMainVyp.Akcia_obdobie(Sender: TObject);
begin with DM do begin
  if FormObdobie=nil then Application.CreateForm(TFormObdobie, FormObdobie);
  FormObdobie.ShowModal;
  UpdateStatus;
end;end;

procedure TFormMainVyp.Akcia_stredisko(Sender: TObject);
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
  UpdateStatus;
end;end;

procedure TFormMainVyp.Show_FormAbout(Sender: TObject);
begin
  if FormAbout=nil then Application.CreateForm(TFormAbout, FormAbout);
  FormAbout.ShowModal;
end;

procedure TFormMainVyp.Akcia_priprav_vypl1(Sender: TObject);
begin with DMV do begin
    if TVYP_.State in [dsEdit,dsInsert] then begin
    Vypl_tlac1.Enabled:=False;
    Vypl_insert1.Enabled:=False;
    Vypl_edit1.Enabled:=False;
    Vypl_delete1.Enabled:=False;
    Vypl_post1.Enabled:=True;
    Vypl_cancel1.Enabled:=True;
    Vypl_navrat1.Enabled:=False;
    Butt_vypl_tlac.Enabled:=False;
    Butt_vypl_navrat.Enabled:=False;
    DS_HSU.AutoEdit:=True;
  end else
  begin
    Vypl_tlac1.Enabled:=True;
    Vypl_insert1.Enabled:=True;
    Vypl_edit1.Enabled:=True;
    Vypl_delete1.Enabled:=True;
    Vypl_post1.Enabled:=False;
    Vypl_cancel1.Enabled:=False;
    Vypl_navrat1.Enabled:=True;
    Butt_vypl_tlac.Enabled:=True;
    Butt_vypl_navrat.Enabled:=True;
    DS_HSU.AutoEdit:=False;
  end;
  Akcia_priprav_zrv(Sender);
  Akcia_priprav_vykon(Sender);
  Akcia_priprav_np(Sender);
  Update;
end;end;

procedure TFormMainVyp.Akcia_vypl_insert(Sender: TObject);
begin
  DBN_vypl1.BtnClick(nbInsert);
end;

procedure TFormMainVyp.Akcia_vypl_edit(Sender: TObject);
begin
  DBN_vypl2.BtnClick(nbEdit);
end;

procedure TFormMainVyp.Akcia_vypl_delete(Sender: TObject);
begin
  DBN_vypl1.BtnClick(nbDelete);
end;

procedure TFormMainVyp.Akcia_vypl_post(Sender: TObject);
begin
  DBN_vypl2.BtnClick(nbPost);
end;

procedure TFormMainVyp.Akcia_vypl_cancel(Sender: TObject);
begin
  DBN_vypl2.BtnClick(nbCancel);
end;

procedure TFormMainVyp.DBN_OnClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  Akcia_priprav_vypl1(Sender);
end;

procedure TFormMainVyp.DBG_zamfKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key)=13 then Akcia_zamf_vyber(Sender);
end;

procedure TFormMainVyp.Akcia_system_koniec(Sender: TObject);
begin
  if MyOtazka(SMyAppTerminate) then Application.Terminate;
end;

procedure TFormMainVyp.Akcia_kalkulacka(Sender: TObject);
begin
  FormCalc.Show;
end;

procedure TFormMainVyp.Vypl_zakladneClick(Sender: TObject);
begin
  N_VYPL.ActivePage:=PAGE_ZAKLAD;
end;

procedure TFormMainVyp.Vypl_doplnkoveClick(Sender: TObject);
begin
  N_VYPL.ActivePage:=PAGE_PRIPL;
end;

procedure TFormMainVyp.Akcia_zam_zoradit1(Sender: TObject);
begin with DMZ do begin
  if not (TZAM_.State in [dsInsert,dsEdit])
   then TZAM_.IndexName:='ZAM1';
end;end;

procedure TFormMainVyp.Akcia_zam_zoradit2(Sender: TObject);
begin with DMZ do begin
  if not (TZAM_.State in [dsInsert,dsEdit])
   then TZAM_.IndexName:='';
end;end;

procedure TFormMainVyp.Akcia_zam_sucasny(Sender: TObject);
begin
   FormMain.Akcia_zam_sucasny(Sender);
end;

procedure TFormMainVyp.Akcia_zam_vyradeny(Sender: TObject);
begin
   FormMain.Akcia_zam_vyradeny(Sender);
end;

procedure TFormMainVyp.Akcia_zam_vsetci(Sender: TObject);
begin
   FormMain.Akcia_zam_vsetci(Sender);
end;

procedure TFormMainVyp.FormActivate(Sender: TObject);
begin
  DM.VYNIMKY_TO_STRINGLIST(DBComboBox1.Items);
  APP_VYPLATY := True;
  if SYS_START then
  begin
    SYS_START:=False;
    FormMenuPomoc.CreatemenuPomoc(MainMenu1);
    UpdateStatus;
    Edit_zam_filter.SetFocus;
    Edit_zam_filter.SelLength := 0;
  end;
  StatusBar1.Visible:=True;
  if DM.AktObdobie>=ZAKON_2005_01 then begin
    DBEdit_Oz_zdravot.Visible:=true;
    PAGE_ND.Enabled:=false;
    PAGE_ND.TabVisible:=false;
    PAGE_USE.Enabled:=false;
    PAGE_USE.TabVisible:=false;
    Vypl_nepouz.Visible:=false;
    Vypl_nemocenske.Visible:=false;
  end
  else begin
    DBEdit_Oz_zdravot.Visible:=false;
    PAGE_ND.TabVisible:=true;
    PAGE_ND.Enabled:=true;
    PAGE_USE.TabVisible:=true;
    PAGE_USE.Enabled:=true;
    Vypl_nepouz.Visible:=true;
    Vypl_nemocenske.Visible:=true;
  end;
end;

procedure TFormMainVyp.RefreshDatabase;
var i:integer;
begin with DBTables.Session.Databases[0] do begin
  for I := 0 to DataSetCount - 1 do
   if DataSets[I] is TTable then
    DataSets[I].FlushBuffers;
end;end;

procedure TFormMainVyp.Hint_zobraz(Sender: TObject);
begin
  if (Sender as TWinControl).Hint = '%SMyAppHintPoistenie'
  then StatusBar1.Panels[1].Text:=SMyAppHintPoistenie
  else if (Sender as TWinControl).Hint = '%SMyAppHintPoistenie2'
  then StatusBar1.Panels[1].Text:=SMyAppHintPoistenie2
   else StatusBar1.Panels[1].Text:=(Sender as TWinControl).Hint;
end;

procedure TFormMainVyp.Hint_zmaz(Sender: TObject);
begin
  StatusBar1.Panels[1].Text:='';
end;

procedure TFormMainVyp.akcia_priprav_zrv(Sender: TObject);
begin with DMV do begin
  if NOT (TVyp_.State in [dsEdit,dsInsert]) then
  begin
    Zrv_insert.Enabled:=False;
    Zrv_delete.Enabled:=False;
    Zrv_post.Enabled:=False;
    Zrv_cancel.Enabled:=False;
    DBN_zrv1.Enabled:=False;
    DBN_zrv2.Enabled:=False;
  end
  else
  if TZrv_.State in [dsEdit,dsInsert] then
  begin
    Zrv_insert.Enabled:=False;
    Zrv_delete.Enabled:=False;
    Zrv_post.Enabled:=True;
    Zrv_cancel.Enabled:=True;
    DBN_zrv1.Enabled:=True;
    DBN_zrv2.Enabled:=True;
  end else
  begin
    Zrv_insert.Enabled:=True;
    Zrv_delete.Enabled:=True;
    Zrv_post.Enabled:=False;
    Zrv_cancel.Enabled:=False;
    DBN_zrv1.Enabled:=True;
    DBN_zrv2.Enabled:=True;
  end;
end;end;

procedure TFormMainVyp.DBN_zrv1Click(Sender: TObject; Button: TNavigateBtn);
begin
  Akcia_priprav_zrv(Sender);
end;

procedure TFormMainVyp.akcia_zrv(Sender: TObject);
begin with DMV do begin
  if Sender=nil then exit;
  if TMenuItem(Sender).Name='zrv_insert' then DBN_zrv1.BtnClick(nbInsert) else
  if TMenuItem(Sender).Name='zrv_edit'   then DBN_zrv2.BtnClick(nbEdit)   else
  if TMenuItem(Sender).Name='zrv_delete' then DBN_zrv1.BtnClick(nbDelete) else
  if TMenuItem(Sender).Name='zrv_post'   then DBN_zrv2.BtnClick(nbPost)   else
  if TMenuItem(Sender).Name='zrv_cancel' then DBN_zrv2.BtnClick(nbCancel);
end;end;

procedure TFormMainVyp.DBComboBoxRp1Enter(Sender: TObject);
begin
  Height:=20;
end;

procedure TFormMainVyp.Zoznamskratiek1Click(Sender: TObject);
begin
  FormPomoc:=TFormPomoc.Create(Application);
  try
  FormPomoc.ShowModal;
  finally
  FormPomoc.Free;
  end;
end;

procedure TFormMainVyp.ShowReportVP1(Sender: TObject);
begin with DMV do if TVYP_.State = dsBrowse then begin
  DM.NaplnMyReportParam(X);
  X.Silent:=True;
  X.Code_emp1:=DMV.TVYP_Code_emp.Value;
  X.Code_emp2:=DMV.TVYP_Code_emp.Value;
  X.AktObdobie:=DMV.TVYP_V_obdobie.Value;
  X.Typ:='VP';
  RunReport(X);
end;end;

procedure TFormMainVyp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin with DMZ,DMV do begin
  if (TVYP_.State in [dsEdit,dsInsert]) or
     (TZRV_.State in [dsEdit,dsInsert]) then begin
     if not MyOtazka(SMyAppCloseForm) then
     begin
       App_Vyplaty := False;
       Action:=caNone;
       Exit;
     end;
  end;
  if TVYP_.State in [dsEdit,dsInsert] then TVYP_.Cancel;
  if TZRV_.State in [dsEdit,dsInsert] then TZRV_.Cancel;
  TVYP_.CancelRange;
  TZRV_.CancelRange;
  DMA.DisableDataSources;
  App_Vyplaty := False;
  Action := caFree;
end;end;

procedure TFormMainVyp.N_VYPLChange(Sender: TObject);
begin
  if N_VYPL.ActivePage = PAGE_ZRAZKY then begin
    DMV.DS_ZRV.Enabled:=True;
    akcia_priprav_zrv(Sender);
  end
  else if N_VYPL.ActivePage = PAGE_VYKON then begin
    DMV.DS_HSU.Enabled:=True;
    akcia_priprav_vykon(Sender);
  end
  else if N_VYPL.ActivePage = PAGE_NP then begin
    DMV.DS_VYPNP.Enabled:=True;
    akcia_priprav_np(Sender);
  end;
end;

procedure TFormMainVyp.Vypl_zrazkyClick(Sender: TObject);
begin
  N_VYPL.ActivePage:=PAGE_ZRAZKY;
end;

procedure TFormMainVyp.Vypl_nemocenskeClick(Sender: TObject);
begin
  N_VYPL.ActivePage:=PAGE_ND;
end;

procedure TFormMainVyp.Vypl_nepouzClick(Sender: TObject);
begin
  N_VYPL.ActivePage:=PAGE_USE;
end;

procedure TFormMainVyp.N_VYPLChanging(Sender: TObject;
  var AllowChange: Boolean);
begin with DMV,DMZ do begin
  Kontrola_Zmien(TZRV_,SMyAppZrvCancel,False);
  AllowChange := Zmeny_Ok;if not Zmeny_Ok then exit;
  Kontrola_Zmien(THSU_,SMyAppHsuCancel,False);
  AllowChange := Zmeny_Ok;if not Zmeny_Ok then exit;
  Kontrola_Zmien(TVYPNP_,SMyAppVypNpCancel,False);
  AllowChange := Zmeny_Ok;if not Zmeny_Ok then exit;
  SET_ALL;
end;end;

procedure TFormMainVyp.DBG_zamfDblClick(Sender: TObject);
begin
  Akcia_zamf_vyber(Sender);
end;

procedure TFormMainVyp.akcia_priprav_vykon(Sender: TObject);
begin with DMV do begin
  if NOT (TVyp_.State in [dsEdit,dsInsert]) then
  begin
    Hsu_insert.Enabled   :=False;
    Hsu_edit.Enabled     :=False;
    Hsu_delete.Enabled   :=False;
    Hsu_post.Enabled     :=False;
    Hsu_cancel.Enabled   :=False;
    DBN_hsu1.Enabled     :=False;
    DBN_hsu2.Enabled     :=False;
  end
  else
  if THSU_.State in [dsEdit,dsInsert] then
  begin
    Hsu_insert.Enabled   :=False;
    Hsu_edit.Enabled     :=False;
    Hsu_delete.Enabled   :=False;
    Hsu_post.Enabled     :=True;
    Hsu_cancel.Enabled   :=True;
    DBN_hsu1.Enabled     :=True;
    DBN_hsu2.Enabled     :=True;
  end else
  begin
    Hsu_insert.Enabled   :=True;
    Hsu_edit.Enabled     :=True;
    Hsu_delete.Enabled   :=True;
    Hsu_post.Enabled     :=False;
    Hsu_cancel.Enabled   :=False;
    DBN_hsu1.Enabled     :=True;
    DBN_hsu2.Enabled     :=True;
  end;
end;end;

procedure TFormMainVyp.akcia_priprav_np(Sender: TObject);
begin with DMV do begin
  if NOT (TVyp_.State in [dsEdit,dsInsert]) then
  begin
    DBN_np1.Enabled     :=False;
    DBN_np2.Enabled     :=False;
    DBGridNP1.Enabled   :=True;
  end
  else
  if TVypnp_.State in [dsEdit,dsInsert] then
  begin
    DBN_np1.Enabled     :=True;
    DBN_np2.Enabled     :=True;
    DBGridNP1.Enabled   :=False;
  end else
  begin
    DBN_np1.Enabled     :=True;
    DBN_np2.Enabled     :=True;
    DBGridNP1.Enabled   :=True;
  end;
end;end;

procedure TFormMainVyp.DBN_hsu1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  Akcia_priprav_vykon(Sender);
end;

procedure TFormMainVyp.akcia_hsu(Sender: TObject);
begin with DMV do begin
  if Sender=nil then exit;
  if TMenuItem(Sender).Name='hsu_insert' then DBN_hsu1.BtnClick(nbInsert) else
  if TMenuItem(Sender).Name='hsu_edit'   then DBN_hsu2.BtnClick(nbEdit)   else
  if TMenuItem(Sender).Name='hsu_delete' then DBN_hsu1.BtnClick(nbDelete) else
  if TMenuItem(Sender).Name='hsu_post'   then DBN_hsu2.BtnClick(nbPost)   else
  if TMenuItem(Sender).Name='hsu_cancel' then DBN_hsu2.BtnClick(nbCancel);
end;end;

procedure TFormMainVyp.hint_zobraz_vvz(Sender: TObject);
begin
  if (Sender as TWinControl).Hint = '%SMyAppHintVynimkaVZ'
   then StatusBar1.Panels[1].Text:=SMyAppHintVynimkaVZ
   else StatusBar1.Panels[1].Text:=(Sender as TWinControl).Hint;
end;

procedure TFormMainVyp.ShowReportVYK(Sender: TObject);
begin with DMV do
if TVYP_.State = dsBrowse then begin
  DM.NaplnMyReportParam(X);
  X.Silent:=True;
  X.Code_emp1:=DMV.TVYP_Code_emp.Value;
  X.Code_emp2:=DMV.TVYP_Code_emp.Value;
  X.AktObdobie:=DMV.TVYP_V_obdobie.Value;
  X.Typ:='VYK';
  RunReport(X);
end else MyError(SMyAppEditMode);
end;

procedure TFormMainVyp.Vypl_poistneClick(Sender: TObject);
begin
  N_VYPL.ActivePage:=PAGE_POISTNE;
end;

procedure TFormMainVyp.DBG_zamfTitleClick(Column: TColumn);
begin
 if UpperCase(Column.FieldName)='CODE_NUMB' then
   akcia_zam_zoradit2(nil)
 else if UpperCase(Column.FieldName)='PMT' then
   akcia_zam_zoradit1(nil);
end;

procedure TFormMainVyp.Edit_zam_filterKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var filter1,filter2: string;
begin with DMZ do begin
  if Edit_zam_filter.Text<>''
    then filter1 := 'Surname='''+Uppercase(Edit_zam_filter.Text)+'*'''
    else filter1:='';
  if Edit_zam_filter_rc.Text<>''
    then filter2 := 'Born_numb='''+Uppercase(Edit_zam_filter_rc.Text)+'*'''
    else filter2:='';
  {--}
  if filter1='' then
    PRIEZVISKO_FILTER:=filter2
  else if filter2='' then
    PRIEZVISKO_FILTER:=filter1
  else if (filter1='') and (filter2='') then
    PRIEZVISKO_FILTER:=''
  else PRIEZVISKO_FILTER:= filter1 + ' and ' + filter2;
  {-}
  SET_FILTER(GET_FILTER(MyZamFilter,DM.AktSidFilter));
end;end;

procedure TFormMainVyp.SET_ALL_VYPNP(Sender: TObject);
begin
 DMV.SET_ALL_VYPNP;
end;

procedure TFormMainVyp.DBN_np1Click(Sender: TObject; Button: TNavigateBtn);
begin
  Akcia_priprav_np(Sender);
  DBEdit144.SetFocus;
end;


















end.

