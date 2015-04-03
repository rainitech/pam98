unit ParForm2;

{
procedure TFParForm.NacitajNastavenia;
  var MyIni:TIniFile;
begin
  try
  MyIni:=TIniFile.Create(MyAppPath+'TEXTY.INI');
  Edit_Vykaz_Zostavil.Text := MyIni.ReadString(coReportDoplnok,'VYKAZ_ZOSTAVIL','');
  Edit_Vykaz_Dna.Text      := MyIni.ReadString(coReportDoplnok,'VYKAZ_DNA','');
  Edit_Vykaz_Miesto.Text   := MyIni.ReadString(coReportDoplnok,'VYKAZ_MIESTO','');
  Edit_Telefon.Text        := MyIni.ReadString(coReportDoplnok,'TELEFON','');
  Edit_Fax.Text            := MyIni.ReadString(coReportDoplnok,'FAX','');
  Edit_Kontakt_Osoba.Text  := MyIni.ReadString(coReportDoplnok,'KONTAKTNA_OSOBA','');
  except on E:Exception do
  MyError('Chyba pri naèítaní nastavení:'+E.Message);
  end;
end;
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBCtrls, StdCtrls, Buttons, ExtCtrls, ComCtrls, Menus,
  DBTables, Db, Mask;

type
  TFormTLA1 = class(TForm)
    Splitter1: TSplitter;
    SB1: TScrollBox;
    DBZ_Ulica: TDBEdit;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Button1: TButton;
    DBN_RZP2: TDBNavigator;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;

    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTLA1: TFormTLA1;

implementation

uses MyConsts, Dm_main, DM_sql, RXCalc, About, FmxUtils, Dm_zam;

{$R *.DFM}

procedure TFormTLA1.FormCreate(Sender: TObject);
begin with DM do begin
 DS_TLA.Enabled:=True;
 if TTLA_Den.AsString='' then begin
    if not TTLA_.Active then TTLA_.Open;
    TTLA_.Edit;
    TTLA_Den.Value := now;
    TTLA_.Post;
 end;
end;end;

procedure TFormTLA1.Button1Click(Sender: TObject);
begin with DM do begin
 if TTLA_.State in [dsEdit,dsInsert] then raise EMyError.Create(SMyAppEditMode);
 Close;
end;end;

procedure TFormTLA1.FormDestroy(Sender: TObject);
begin
  DM.TTLA_.Cancel;
end;


end.
