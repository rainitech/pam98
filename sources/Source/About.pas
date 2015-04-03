unit About;

interface

uses
  SysUtils, Windows, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, Quickrpt, Gauges, StdCtrls, Spin, Buttons,
  ComCtrls, qrprntr, ToolWin, DBCtrls, isp3, OleCtrls, HTTPApp;

type
  TFormAbout = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label_Copyright: TLabel;
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
    DBText3: TDBText;
    Label2: TLabel;
    LabelData: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  LabelData.Caption := MyDataPth;
end;


procedure TFormAbout.FormCreate(Sender: TObject);
begin
  Label_copyright.Caption := MenoCopyright;
end;



end.
