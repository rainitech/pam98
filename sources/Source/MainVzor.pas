unit MainVzor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, StdCtrls, Mask, DBCtrls, Grids, DBGrids, Buttons,
  ExtCtrls, Db;

type
  TFormMainVzor = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    navrat1: TMenuItem;
    oper1: TMenuItem;
    N1Vzor: TMenuItem;
    cancel1: TMenuItem;
    post1: TMenuItem;
    delete1: TMenuItem;
    edit1: TMenuItem;
    insert1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Akcia_Navrat(Sender: TObject);
    procedure Akcia_oper1(Sender: TObject);
  private
    { Private declarations }
    SYS_START: boolean;
  public
    { Public declarations }
    DBN: TDBNavigator;
    procedure UpdateStatus;
    function NeukonceneZmeny:boolean;virtual;
    procedure ZrusDbZmeny;virtual;
  end;

var
  FormMainVzor: TFormMainVzor;

implementation

uses Dm_vypl, MyConsts, M_Pomoc, DM_ALL;

{$R *.DFM}

procedure TFormMainVzor.FormActivate(Sender: TObject);
begin
  if SYS_START then begin
    FormMenuPomoc.CreateMenuPomoc(MainMenu1);
    SYS_START := False;
    UpdateStatus;
  end;  
end;

procedure TFormMainVzor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if NeukonceneZmeny then begin
     if not MyOtazka(SMyAppCloseForm) then
     begin
       Action:=caNone;
       Exit;
     end;
  end;
  ZrusDbZmeny;
  DMA.DisableDataSources;
  Action := caFree;
end;

procedure TFormMainVzor.FormCreate(Sender: TObject);
begin
  SYS_START := True;
  Nastav_Farbu(Self);
end;


procedure TFormMainVzor.Akcia_Navrat(Sender: TObject);
begin
  if NeukonceneZmeny then raise EMyError.Create(SMyAppEditMode);
  ModalResult := mrCancel;
end;

procedure TFormMainVzor.UpdateStatus;
begin
  FormMenuPomoc.UpdateFormStatus((Self as TForm),StatusBar1);
end;

function TFormMainVzor.NeukonceneZmeny:boolean;
begin
 Result := False;
end;

procedure TFormMainVzor.ZrusDbZmeny;
begin
 {TTable.Cancel;}
end;


procedure TFormMainVzor.Akcia_oper1(Sender: TObject);
begin
  if Sender=nil then exit;
  if TMenuItem(Sender).Name='insert1' then DBN.BtnClick(nbInsert) else
  if TMenuItem(Sender).Name='edit1'   then DBN.BtnClick(nbEdit)   else
  if TMenuItem(Sender).Name='delete1' then DBN.BtnClick(nbDelete) else
  if TMenuItem(Sender).Name='post1'   then DBN.BtnClick(nbPost)   else
  if TMenuItem(Sender).Name='cancel1' then DBN.BtnClick(nbCancel);
end;

end.
