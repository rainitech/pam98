unit Obdobie;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask;

type
  TFormObdobie = class(TForm)
    DBRadioGroup2: TDBRadioGroup;
    Button1: TButton;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    OldObdobie: longint;
    { Public declarations }
  end;

var
  FormObdobie: TFormObdobie;

implementation

uses Dm_main, MyConsts, Main;

{$R *.DFM}


procedure TFormObdobie.Button1Click(Sender: TObject);
var oldrok,rok,mesiac:longint;
  MienkoIni: string;
begin
  Button1.SetFocus;
  if not DM.PripustneObdobiePreDemo
   then raise EMyError.Create(SMyAppInvalidObdobie4Demo);
  DM.TPRIV_.Post;
  oldrok:=(OldObdobie div 100);
  rok:=DM.AktRok;
  mesiac:=DM.AktMesiac;
{-- nastavenie vysky danoveho bonusu na 1 dieta natvrdo pre rok 2005
    za mesiace 1-8 bola jeho vyska 400 Sk a za mesiace 9-12 je vyska 450 Sk
--}
  if rok=2005 then begin
    if mesiac<=8 then PARAMETRE[28].Hodnota:=400 else PARAMETRE[28].Hodnota:=450;
  end else
  if rok=2007 then begin
    if mesiac<=6 then PARAMETRE[28].Hodnota:=540 else PARAMETRE[28].Hodnota:=555;
  end;
  try
  if (oldrok<=2004) and (rok>2004) then raise EMyError.Create(SMyAppNedaSaNastavitRok);
  if (rok<>oldrok) and (rok<=2004)then
  begin
    MienkoIni := 'ROK'+IntToStr(rok)+'.INI';
    if (rok>2001) and FileExists(MienkoIni) then
    begin
      if MyOtazka(Format(SMyAppNastavitDanovePasma,[rok,MienkoIni])) then
        DM.IniFileToDanovePasma(MienkoIni);
      if MyOtazka(Format(SMyAppNastavitParametreRoku,[rok,MienkoIni])) then
        begin
          DM.IniFileToParametre(MienkoIni);
          DM.IniFileToSetup(MienkoIni);
          NacitajParametre(rok,mesiac);
        end;
    end;
    if rok=2001 then
    begin
      if MyOtazka(Format(SMyAppNastavitDanovePasma,[rok,MenoSub2001])) then
        DM.IniFileToDanovePasma(MenoSub2001);
      if MyOtazka(Format(SMyAppNastavitParametreRoku,[rok,MenoSub2001])) then
        begin
          DM.IniFileToParametre(MenoSub2001);
          DM.IniFileToSetup(MenoSub2001);
          NacitajParametre(rok,mesiac);
        end;
    end;
    if rok=2000 then
    begin
      if MyOtazka(Format(SMyAppNastavitDanovePasma,[rok,MenoSub2000])) then
        DM.IniFileToDanovePasma(MenoSub2000);
      if MyOtazka(Format(SMyAppNastavitParametreRoku,[rok,MenoSub2000])) then
      begin
        DM.IniFileToParametre(MenoSub2000);
        DM.IniFileToSetup(MenoSub2000);
        NacitajParametre(rok,mesiac);
      end;
    end;
    if rok=1999 then
    begin
      if MyOtazka(Format(SMyAppNastavitDanovePasma,[rok,MenoSub1999]))
        then DM.IniFileToDanovePasma(MenoSub1999);
    end;
  end;
  except;
    DM.TPRIV_.Edit;
    raise;
  end;
  DM.TINF_.Refresh;
  if ((rok*100)+mesiac>=200608) AND ((rok*100)+mesiac<=200612) then
    DM.NASTAV_VYNIMKY_SPRACOVANIE(1)
  else
    DM.NASTAV_VYNIMKY_SPRACOVANIE(0);
  if rok>2007 then NacitajParametre(rok,mesiac);
  ModalResult:=mrOK;
  Close;
end;

procedure TFormObdobie.FormActivate(Sender: TObject);
begin
  DM.TPRIV_.Edit;
  OldObdobie:=DM.AktObdobie;
  if DM.AktRok > 2004 then begin
    DBEdit1.Enabled:=False;
    DBEdit1.Color:=clSilver;
  end else
  begin
    DBEdit1.Enabled:=True;
    DBEdit1.Color:=clWhite;
  end;
end;

end.
