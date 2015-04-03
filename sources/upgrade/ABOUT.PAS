unit About;

interface

uses
  SysUtils, Windows, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, Quickrpt, Gauges, StdCtrls, Spin, Buttons,
  ComCtrls, qrprntr, ToolWin, DBCtrls;

type
  TFormAbout = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Image1: TImage;
    DBText1: TDBText;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBText2: TDBText;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel2: TPanel;
    LabelPath: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    QRep: TQuickRep;
  end;

var
  FormAbout: TFormAbout;

implementation

uses Dm_main, MyConsts;

{$R *.DFM}


procedure TFormAbout.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormAbout.FormShow(Sender: TObject);
begin
  LabelPath.Caption := MyAppPath;
end;


end.
