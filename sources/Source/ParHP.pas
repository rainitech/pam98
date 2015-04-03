unit ParHP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Grids, DBGrids;

type
  TFormParHP = class(TForm)
    Button1: TButton;
    cb_tlacit_b: TCheckBox;
    cb_tlacit_c: TCheckBox;
    cb_tlacit_a: TCheckBox;
    cb_tlacit_mena: TCheckBox;
    edit_spp: TEdit;
    Label1: TLabel;
    cb_tlacit_d: TCheckBox;
    Label2: TLabel;
    edit_vsym: TEdit;
    cb_vsym_rc: TCheckBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MyExecute;
  end;

var
  FormParHP: TFormParHP;
  pocet: byte;

type
  TMyParam = record
    tlacit_a,tlacit_b,tlacit_c,tlacit_d,tlacit_mena,vsym_rc:boolean;
    spp:string;vsym:string[64];
  end;

var
  MyParam: TMyParam;

implementation

{$R *.DFM}

procedure TFormParHP.MyExecute;
begin
  ShowModal;
end;

procedure TFormParHP.Button1Click(Sender: TObject);
begin
  with MyParam do begin
    tlacit_a:=cb_tlacit_a.checked;
    tlacit_b:=cb_tlacit_b.checked;
    tlacit_c:=cb_tlacit_c.checked;
    tlacit_d:=cb_tlacit_d.checked;
    tlacit_mena:=cb_tlacit_mena.checked;
    spp:=edit_spp.text;
    vsym_rc:=cb_vsym_rc.checked;
    vsym:=edit_vsym.text;
  end;
  ModalResult:=mrOK;
  Close;
end;

end.
