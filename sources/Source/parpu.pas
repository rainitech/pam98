unit ParPU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Grids, DBGrids;

type
  TFormParPU = class(TForm)
    Button1: TButton;
    Label2: TLabel;
    CB1: TComboBox;
    Button2: TButton;
    edit_kod: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MyExecute;
  end;

var
  FormParPU: TFormParPU;
  pocet: byte;

type
  TMyParam = record
    id:integer;
    znak:char;
    kod:integer;
  end;

var
  MyParam: TMyParam;

implementation

uses MyConsts;

{$R *.DFM}

procedure TFormParPU.MyExecute;
begin
  CB1.ItemIndex := 1;
  ShowModal;
end;

procedure TFormParPU.Button1Click(Sender: TObject);
begin
  if CB1.ItemIndex = -1 then
    raise EMyError.Create(SMyAppTypRiadkuNieJeVybraty);
  if edit_kod.text='' then
    raise EMyError.Create(SMyAppKodNieJeVyplneny);
  if NOT Je_Cislo(edit_kod.text) then
    raise EMyError.Create(SMyAppKodNieJeCislo);
  with MyParam do begin
    case CB1.ItemIndex of
      0: begin id:=29; znak:='Z'; end;
      1: begin id:=35; znak:='F'; end;
      2: begin id:=34; znak:='Z'; end;
      3: begin id:=43; znak:='F'; end;
    end;
    kod:=StrToInt(edit_kod.text);
  end;
{  ModalResult:=mrOK;
  Close;}
end;

procedure TFormParPU.Button2Click(Sender: TObject);
begin
  ModalResult:=mrCANCEL;
  Close;
end;

end.
