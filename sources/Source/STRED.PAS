unit Stred;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Grids, DBGrids;

type
  TFormStred = class(TForm)
    Button1: TButton;
    SG1: TStringGrid;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormStred: TFormStred;
  pocet: byte;

implementation

uses Dm_main, MyConsts;

{$R *.DFM}


procedure TFormStred.Button1Click(Sender: TObject);
var i:byte;
begin
  DM.TPRIV_.Edit;
  DM.TPRIV_SID.AsString := SG1.Cells[SG1.Col,SG1.Row];
  for i:=0 to pocet-1 do begin
    SG1.Cells[0,i]:='';
    SG1.Cells[1,i]:='';
  end;
  DM.TPRIV_.Post;
  ModalResult:=mrOK;
  Close;
end;

procedure TFormStred.FormActivate(Sender: TObject);
begin
  SG1.Cells[0,0] := '0';
  SG1.Cells[1,0] := 'VŠETKY STREDISKÁ (FIRMA SPOLU)';
  pocet:=1;
  DM.CIS2_.Filtered:=false;
  DM.CIS2_.First;
  while not DM.CIS2_.EOF do begin
    SG1.Cells[0,pocet]:=DM.CIS2_.FieldByName('id').Value;
    SG1.Cells[1,pocet]:=DM.CIS2_.FieldByName('nazov').Value;
    DM.CIS2_.Next;
    inc(pocet);
  end;
  SG1.RowCount := pocet;
end;


end.
