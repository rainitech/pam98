unit Sc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Opercie1: TMenuItem;
    Novzznam1: TMenuItem;
    Opravazznamu1: TMenuItem;
    Vymazaniezznamu1: TMenuItem;
    Potvrdeniezmien1: TMenuItem;
    Ignorovaniezmien1: TMenuItem;
    N1: TMenuItem;
    Nvrat1: TMenuItem;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Table1: TTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

end.
