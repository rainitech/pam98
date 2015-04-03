unit Login;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls;

type
  TFormHeslo = class(TForm)
    N: TNotebook;
    Label1: TLabel;
    Password: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    Password1: TEdit;
    Password2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Ok2: TButton;
    Storno2: TButton;
    CB_ZMENA: TCheckBox;
    Panel1: TPanel;
    Image3: TImage;
    Image1: TImage;
    procedure Storno2Click(Sender: TObject);
    procedure Ok2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NPageChanged(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    HesloPokusy: byte;
    HesloResult: boolean;
  end;

var
  FormHeslo: TFormHeslo;

implementation

uses MyConsts, Dm_main;

{$R *.DFM}

procedure TFormHeslo.Storno2Click(Sender: TObject);
begin
  MyMessage(SMyAppPasswordNotChanged);
  Close;
end;

procedure TFormHeslo.Ok2Click(Sender: TObject);
begin
  if Password1.Text <> Password2.Text then begin
    MyError(SMyAppNewPasswordNotSame);
  end
    else
  begin
    DM.NastavNoveHeslo(Password1.Text);
    MyMessage(SMyAppPasswordSuccesfullyChanged);
    Close;
  end;
end;

procedure TFormHeslo.FormCreate(Sender: TObject);
begin
  Password.Text:='';
  HesloPokusy:=0;
  HesloResult:=False;
  N.ActivePage:='MAIN';
end;

procedure TFormHeslo.NPageChanged(Sender: TObject);
begin
  if N.ActivePage='ZMENA' then begin
    Password1.Text:='';
    Password2.Text:='';
  end;
end;

procedure TFormHeslo.OKBtnClick(Sender: TObject);
begin
  if not DM.KontrolaVstupnehoHesla(Password.Text) then
   begin
     MyError(SMyAppInvalidPassword);
     HesloPokusy := HesloPokusy + 1;
     if HesloPokusy >= 3 then Close;
   end
    else
   begin
     Hesloresult:=true;
     if CB_ZMENA.State=cbChecked then N.ActivePage:='ZMENA'
     else Close;
   end;
end;




end.

