unit Pridavky;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Grids, DBGrids;

type
  TFormPridavky = class(TForm)
    Button1: TButton;
    Label227: TLabel;
    L1: TLabel;
    Label3: TLabel;
    L2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPridavky: TFormPridavky;
  pocet: byte;

implementation

uses Dm_main, MyConsts, Dm_zam;

{$R *.DFM}


procedure TFormPridavky.Button1Click(Sender: TObject);
begin
  ModalResult:=mrOK;
  Close;
end;

procedure TFormPridavky.FormActivate(Sender: TObject);
begin with DMZ do begin
  Screen.Cursor:=crHourGlass;
  try
  with REC_PRIDAVKY do begin
    L1.Caption := FloatToStr(pridavky);
    L2.Caption := FloatToStr(nezdc_deti);
  end;
  finally
  Screen.Cursor:=crDefault;
  end;

end;end;


end.
