unit Sc_main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, Menus, StdCtrls, DBCtrls, Buttons, ExtCtrls,
  DataToWK1, DataToHTML, DataExport, DataToDBF, DataToAscii, DataToXLS,
  PgCSV;

type
  TFormCis = class(TForm)
    MainMenu1: TMainMenu;
    Mnu_operacie: TMenuItem;
    Mnu_insert: TMenuItem;
    Mnu_edit: TMenuItem;
    Mnu_delete: TMenuItem;
    Mnu_post: TMenuItem;
    Mnu_cancel: TMenuItem;
    N1: TMenuItem;
    Mnu_navrat: TMenuItem;
    DS1: TDataSource;
    Panel0: TPanel;
    Panel3: TPanel;
    Btn_navrat: TBitBtn;
    Panel26: TPanel;
    DBN1: TDBNavigator;
    DBGrid1: TDBGrid;
    DBN2: TDBNavigator;
    PanelLegenda1: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    PgCSV1: TPgCSV;
    procedure Mnu_akciaClick(Sender: TObject);
    procedure Akcia_priprav_cis(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Startup
     (const aTitle:string;const aDataset:TDataSet);
  end;

var
  FormCis: TFormCis;

implementation

uses MyConsts, Dm_main, FmxUtils;

{$R *.DFM}

procedure TFormCis.Startup
 (const aTitle:string;const aDataset:TDataSet);
var ch:char;SDmeno:string;
begin with DM do begin
  FormCis.Caption := 'PAM98 - Firma: '+TINF_Nazov.Value;
  Panel0.Caption  := aTitle;
  DS1.DataSet     := aDataset;
  SaveDialog1.InitialDir := MyRepPath1;
  SDMeno:=(aDataSet as TTable).TableName;
  SaveDialog1.FileName := StrReplaceAll(SDMeno,ExtractFileExt(SDMeno),'')+'.CSV';
  PGCSV1.DataSet := aDataSet;
  if aDataset.name='CIS4_' then
  begin
    for ch:='A' to 'Z' do if ch in SetOf_InstituciaValid
     then DBGrid1.Columns[0].PickList.Add(ch);
    DBGrid1.Columns[0].Width:=50;
    DBGrid1.Columns[0].DropDownRows:=10;
    DBGrid1.Columns[0].Alignment:=taCenter;
    DBGrid1.Columns[1].Alignment:=taCenter;
    PanelLegenda1.Visible := True;
  end else
    PanelLegenda1.Visible := False;
  Akcia_priprav_cis(nil);
  Nastav_Farbu(Self);
  ShowModal;
end;end;


procedure TFormCis.Mnu_akciaClick(Sender: TObject);
begin
  if TMenuItem(Sender).Name='Mnu_insert' then DS1.DataSet.insert else
  if TMenuItem(Sender).Name='Mnu_edit'   then DS1.DataSet.edit   else
  if TMenuItem(Sender).Name='Mnu_delete' then DS1.DataSet.delete else
  if TMenuItem(Sender).Name='Mnu_post'   then DS1.DataSet.post   else
  if TMenuItem(Sender).Name='Mnu_cancel' then DS1.DataSet.cancel else
  Close;
end;


procedure TFormCis.Akcia_priprav_cis(Sender: TObject);
begin
  if DS1.DataSet=nil then exit;
  if DS1.DataSet.State in [dsEdit,dsInsert] then
  begin
    Mnu_insert.Enabled:=False;
    Mnu_edit.Enabled:=False;
    Mnu_delete.Enabled:=False;
    Mnu_post.Enabled:=True;
    Mnu_cancel.Enabled:=True;
    Mnu_navrat.Enabled:=False;
    Btn_navrat.Enabled:=False;
    DBN1.Enabled:=False;
    DBN2.Enabled:=True;
  end else
  begin
    Mnu_insert.Enabled:=True;
    Mnu_edit.Enabled:=True;
    Mnu_delete.Enabled:=True;
    Mnu_post.Enabled:=False;
    Mnu_cancel.Enabled:=False;
    Mnu_navrat.Enabled:=True;
    Btn_navrat.Enabled:=True;
    DBN1.Enabled:=True;
    DBN2.Enabled:=False;
  end;
end;


procedure TFormCis.Button1Click(Sender: TObject);

 procedure DoExportFile(AExport: TDataExport; AExtencion : String);
  begin
    AExport.GetFields.Clear;
    AExport.SaveToFile( ChangeFileExt( SaveDialog1.FileName, AExtencion ) );
  end;
begin
  if SaveDialog1.Execute Then
    case SaveDialog1.FilterIndex of
      1: begin
           PGCSV1.CSVFile := SaveDialog1.FileName;
           PGCSV1.DataSetToCSV;
           ExecuteFile(SaveDialog1.FileName,'','',1);
         end;
    end;
end;

end.
