unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UnicodeUtils;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    MibEnumEdit: TEdit;
    Label2: TLabel;
    MimeNameLabel: TLabel;
    InvalidNumberLabel: TLabel;
    AliasListBox: TListBox;
    AliasEdit: TEdit;
    AliasBtn: TButton;
    CSMIB1: TCSMIB;
    procedure CSMIB1Change(Sender: TObject);
    procedure MibEnumEditChange(Sender: TObject);
    procedure SearchAlias(Sender: TObject);
    procedure AliasEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CSMIB1Change(Sender: TObject);
var
  i: integer;
begin
  MimeNameLabel.Caption:= CSMIB1.PreferredMIMEName;
  AliasListBox.Clear;
  for i:= 0 to pred(CSMIB1.AliasCount) do
    AliasListBox.Items.Add(CSMIB1.Alias[i]);
end;

procedure TForm1.MibEnumEditChange(Sender: TObject);
begin
  try
    CSMIB1.Enum:= StrToInt(MibEnumEdit.Text);
    InvalidNumberLabel.Visible:= false;
  except
    InvalidNumberLabel.Visible:= true;
  end;
end;

procedure TForm1.SearchAlias(Sender: TObject);
begin
  if not CSMIB1.SetToAlias(AliasEdit.Text)
    then ShowMessage('Alias not found.')
    else MibEnumEdit.Text:= IntToStr(CSMIB1.Enum);
end;

procedure TForm1.AliasEditKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(key) = 13 then SearchAlias(Sender);
end;

end.
