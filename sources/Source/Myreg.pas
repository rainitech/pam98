unit Myreg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls;

type
  TFormReg = class(TForm)
    REG_CODE: TEdit;
    BtnOk: TBitBtn;
    BtnStorno: TBitBtn;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    RG1: TRadioGroup;
    RG2: TRadioGroup;
    REG_KEY: TEdit;
    Label1: TLabel;
    procedure BtnOkClick(Sender: TObject);
    procedure BtnStornoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RG1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RegPocZam: byte;
    RegPocFir: byte;
    RegDemo:   boolean;
    RegResult: boolean;
    RegPokusy: byte;
  end;

var
  FormReg: TFormReg;

implementation

uses Dm_main, MyConsts, Mydes;

{$R *.DFM}

procedure TFormReg.BtnOkClick(Sender: TObject);
var Pom1,DK,Znak11,MenuVer:string;
begin
  Inc(RegPokusy);

  RegDemo:=UpperCase(REG_CODE.Text)='DEMO';

  Pom1:=Trim(REG_CODE.Text);
  if Copy(Pom1,9,1)='1' then RegPocZam:=5  else
  if Copy(Pom1,9,1)='2' then RegPocZam:=10 else
  if Copy(Pom1,9,1)='3' then RegPocZam:=20 else
  if Copy(Pom1,9,1)='4' then RegPocZam:=50  else
  if Copy(Pom1,9,1)='5' then RegPocZam:=0  else
  Pom1:='';

  RegPocFir:=99;
  Znak11 := Copy(Pom1,11,1);
  MenuVer := Copy(GetVersionFromRegKey(DM.TSYS_REG_KEY.Value),1,3);

  if Copy(Pom1,10,1)<>'-' then Pom1:='';

  Delete(Pom1,9,1);
  Delete(Pom1,10,1);
  DK := DecryptKey(Pom1);
  RegResult:=
    RegDemo or (
        (DK = Copy(DM.TSYS_REG_KEY.Value,1,11))
      );

  if RegResult then Close
  else begin
   MyError(SMyAppInvalidRegKey);
   if RegPokusy=3 then
   begin
     MyError(SMyAppMocVelaPokusov);
     Close;
   end;
  end;
end;

procedure TFormReg.BtnStornoClick(Sender: TObject);
begin
  RegResult:=False;
  Close;
end;

procedure TFormReg.FormCreate(Sender: TObject);
begin
  RegPokusy:=0;
  RegResult:=False;
end;

procedure TFormReg.RG1Exit(Sender: TObject);
var i,p,pp: integer; s,pom:string;
begin
 if (RG1.ItemIndex = -1) or (RG2.ItemIndex = -1) then exit;
 s := REG_KEY.Text;
 i :=0;
 pp:=0;
 p:=1;
 while (p > 0) and (i < 4) do begin
   p := Pos('-',s);
   if p > 0 then begin
     pp := pp + p;
     s := Copy(s,p+1,length(s));
   end;
   inc(i);
 end;
 if (p > 0) and (RG1.ItemIndex <> -1) and (RG2.ItemIndex <> -1) then
 begin
   case RG2.ItemIndex of
     0: pom:='5';
     1: pom:='20';
     2: pom:='50';
     3: pom:='MAX';
   else
     pom:='BAD'
   end;
   REG_KEY.Text := Copy(REG_KEY.Text,1,pp) + Copy(RG1.Items.Strings[RG1.ItemIndex],1,3)+'-'+pom;
 end;
end;

end.
