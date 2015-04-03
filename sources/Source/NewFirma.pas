unit NewFirma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask;

type
  TFormNovaFirma = class(TForm)
    Button1: TButton;
    Edit_nazov: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    CB_Rok: TComboBox;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    ok: boolean;
    { Public declarations }
  end;

var
  FormNovaFirma: TFormNovaFirma;

implementation

uses Dm_main, MyConsts, Main;

{$R *.DFM}

procedure TFormNovaFirma.Button1Click(Sender: TObject);
begin
  ok:=true;
  ModalResult:=mrOK;
  Close;
end;

procedure TFormNovaFirma.Button2Click(Sender: TObject);
begin
  ok:=false;
  ModalResult:=mrCancel;
  Close;
end;

procedure TFormNovaFirma.FormActivate(Sender: TObject);
begin
 Edit_nazov.Text := 'BEZ MENA';
 CB_ROK.Text := '2004';
end;

end.
