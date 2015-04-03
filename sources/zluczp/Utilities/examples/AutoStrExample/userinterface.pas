unit userinterface;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AutoListUtils, StdCtrls, AutoStrCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    UtilsStringIterator1: TUtilsStringIterator;
    AutoStrListBox1: TAutoStrListBox;
    UtilsAutoStrings1: TUtilsAutoStrings;
    Edit1: TEdit;
    Button1: TButton;
    AutoStrNavigator1: TAutoStrNavigator;
    UtilsAutoAliases1: TUtilsAutoAliases;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  with UtilsAutoStrings1 do begin
    AddLiteral('Robert');
    AddLiteral('Richard');
  end;
  with UtilsAutoAliases1 do begin
    Define('Robert','Bob');
    Define('Richard','Dick');
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Edit1.Text <> '' then UtilsAutoStrings1.AddLiteral(Edit1.Text);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked
    then UtilsAutoStrings1.AliasOpt := aoFull
    else UtilsAutoStrings1.AliasOpt := aoOff;
end;

end.
