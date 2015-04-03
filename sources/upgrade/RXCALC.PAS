unit RXCalc;

interface

uses
  Windows,
  SysUtils, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Menus, ExtCtrls, Buttons, Clipbrd;

type

{ TrxCalculatorForm }

  TrxCalcState = (csFirst, csValid, csError);
  TFormCalc = class(TForm)
    MainPanel: TPanel;
    Panel2: TPanel;
    DisplayPanel: TPanel;
    DisplayLabel: TLabel;
    BackButton: TSpeedButton;
    ButtonC: TSpeedButton;
    ButtonMC: TSpeedButton;
    ButtonMR: TSpeedButton;
    ButtonMS: TSpeedButton;
    ButtonMP: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Button7: TSpeedButton;
    Button4: TSpeedButton;
    Button1: TSpeedButton;
    Button0: TSpeedButton;
    Button8: TSpeedButton;
    Button5: TSpeedButton;
    Button2: TSpeedButton;
    ButtonPM: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    Button9: TSpeedButton;
    Button6: TSpeedButton;
    Button3: TSpeedButton;
    ButtonPnt: TSpeedButton;
    ButtonDiv: TSpeedButton;
    ButtonMul: TSpeedButton;
    ButtonSub: TSpeedButton;
    ButtonAdd: TSpeedButton;
    ButtonSqrt: TSpeedButton;
    ButtonPercent: TSpeedButton;
    ButtonRev: TSpeedButton;
    ButtonResult: TSpeedButton;
    MemoryLabel: TLabel;
    OkButton: TSpeedButton;
    CancelButton: TSpeedButton;
    DisplayShape: TShape;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button0Click(Sender: TObject);
    procedure ButtonPntClick(Sender: TObject);
    procedure ButtonDivClick(Sender: TObject);
    procedure ButtonMulClick(Sender: TObject);
    procedure ButtonSubClick(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonResultClick(Sender: TObject);
    procedure ButtonCClick(Sender: TObject);
    procedure BackButtonClick(Sender: TObject);
    procedure ButtonPMClick(Sender: TObject);
    procedure ButtonRevClick(Sender: TObject);
    procedure ButtonPercentClick(Sender: TObject);
    procedure ButtonSqrtClick(Sender: TObject);
    procedure ButtonMCClick(Sender: TObject);
    procedure ButtonMRClick(Sender: TObject);
    procedure ButtonMSClick(Sender: TObject);
    procedure ButtonMPClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure CheckFirst;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    FStatus: TrxCalcState;
    FOperator: Char;
    FOperand: Double;
    FMemory: Double;
    procedure CalcKey(Key: Char);
    procedure Clear;
    procedure Error;
    procedure SetDisplay(R: Double);
    function GetDisplay: Double;
  protected
  end;

{ TrxCalculator }

  TrxCalculator = class(TComponent)
  private
    FValue: Double;
    FCtl3D: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    function Execute: Boolean;
  published
    property Ctl3D: Boolean read FCtl3D write FCtl3D default True;
    property Value: Double read FValue write FValue;
  end;

var
  FormCalc : TFormCalc;

implementation

{$R *.DFM}

const
  VK_0 = $30;
  VK_1 = $31;
  VK_2 = $32;
  VK_3 = $33;
  VK_4 = $34;
  VK_5 = $35;
  VK_6 = $36;
  VK_7 = $37;
  VK_8 = $38;
  VK_9 = $39;

{ TrxCalculator }

constructor TrxCalculator.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCtl3D := True;
end;

function TrxCalculator.Execute: Boolean;
begin
  with TFormCalc.Create(Application) do
  try
    Ctl3D := FCtl3D;
    if Self.FValue <> 0 then begin
      SetDisplay(Self.FValue);
      FStatus := csFirst;
      FOperator := '=';
    end;
    Result := (ShowModal = mrOk);
    if Result then Self.FValue := StrToFloat(DisplayLabel.Caption);
  finally
    Free;
  end;
end;

{ TrxCalculatorForm }


procedure TFormCalc.Error;
begin
  FStatus := csError;
  DisplayLabel.Caption := 'Chyba';
end;

procedure TFormCalc.SetDisplay(R: Double);
var
  S: string;
begin
  S := Format('%31.10f', [R]);
  while S[Length(S)] = '0' do Delete(S, Length(S), 1);
  if S[Length(S)] = DecimalSeparator then Delete(S, Length(S), 1);
  DisplayLabel.Caption := S;
end;

function TFormCalc.GetDisplay: Double;
begin
  if FStatus = csError then Result := 0
  else Result := StrToFloat(DisplayLabel.Caption);
end;

procedure TFormCalc.CheckFirst;
begin
  if FStatus = csFirst then begin
    FStatus := csValid;
    DisplayLabel.Caption := '0';
  end;
end;

procedure TFormCalc.CalcKey(Key: Char);
var
  R: Double;
begin
  Key := UpCase(Key);
  if (FStatus = csError) and (Key <> 'C') then Key := ' ';
  if Key = DecimalSeparator then begin
    CheckFirst;
    if Pos(DecimalSeparator, DisplayLabel.Caption) = 0 then
      DisplayLabel.Caption := DisplayLabel.Caption + DecimalSeparator;
  end else
    case Key of
      '0'..'9': begin
        CheckFirst;
        if DisplayLabel.Caption = '0' then DisplayLabel.Caption := '';
        DisplayLabel.Caption := DisplayLabel.Caption + Key;
      end;
      #8: begin
        CheckFirst;
        if (Length(DisplayLabel.Caption) = 1) or
          ((Length(DisplayLabel.Caption) = 2) and
          (DisplayLabel.Caption[1] = '-'))
        then
          DisplayLabel.Caption := '0'
        else
          DisplayLabel.Caption := Copy(DisplayLabel.Caption, 1,
            Length(DisplayLabel.Caption) - 1);
      end;
      '_': SetDisplay( -GetDisplay);
      '+', '-', '*', '/', '=', '%', #13: begin
        if FStatus = csValid then begin
          FStatus := csFirst;
          R := GetDisplay;
          if Key = '%' then
            case FOperator of
              '+', '-': R := FOperand * R / 100;
              '*', '/': R := R / 100;
            end;
          case FOperator of
            '+': SetDisplay(FOperand + R);
            '-': SetDisplay(FOperand - R);
            '*': SetDisplay(FOperand * R);
            '/': if R = 0 then Error else SetDisplay(FOperand / R);
          end;
        end;
        FOperator := Key;
        FOperand := GetDisplay;
      end;
      'C': Clear;
    end;
end;

procedure TFormCalc.Clear;
begin
  FStatus := csFirst;
  DisplayLabel.Caption := '0';
  FOperator := '=';
end;

procedure TFormCalc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_0, VK_NUMPAD0: Button0Click(Self);
    VK_1, VK_NUMPAD1: Button1Click(Self);
    VK_2, VK_NUMPAD2: Button2Click(Self);
    VK_3, VK_NUMPAD3: Button3Click(Self);
    VK_4, VK_NUMPAD4: Button4Click(Self);
    VK_5, VK_NUMPAD5: Button5Click(Self);
    VK_6, VK_NUMPAD6: Button6Click(Self);
    VK_7, VK_NUMPAD7: Button7Click(Self);
    VK_8, VK_NUMPAD8: Button8Click(Self);
    VK_9, VK_NUMPAD9: Button9Click(Self);
    VK_BACK: BackButtonClick(Self);
    VK_ESCAPE: ButtonCClick(Self);
    187, VK_RETURN: ButtonResultClick(Self);
    VK_DIVIDE: ButtonDivClick(Self);
    VK_MULTIPLY: ButtonMulClick(Self);
    VK_SUBTRACT	: ButtonSubClick(Self);
    VK_ADD: ButtonAddClick(Self);
    188, 190, VK_DECIMAL: ButtonPntClick(Self);
  end;
end;

procedure TFormCalc.Button1Click(Sender: TObject);
begin
  CalcKey('1');
end;

procedure TFormCalc.Button2Click(Sender: TObject);
begin
  CalcKey('2');
end;

procedure TFormCalc.Button3Click(Sender: TObject);
begin
  CalcKey('3');
end;

procedure TFormCalc.Button4Click(Sender: TObject);
begin
  CalcKey('4');
end;

procedure TFormCalc.Button5Click(Sender: TObject);
begin
  CalcKey('5');
end;

procedure TFormCalc.Button6Click(Sender: TObject);
begin
  CalcKey('6');
end;

procedure TFormCalc.Button7Click(Sender: TObject);
begin
  CalcKey('7');
end;

procedure TFormCalc.Button8Click(Sender: TObject);
begin
  CalcKey('8');
end;

procedure TFormCalc.Button9Click(Sender: TObject);
begin
  CalcKey('9');
end;

procedure TFormCalc.Button0Click(Sender: TObject);
begin
  CalcKey('0');
end;

procedure TFormCalc.ButtonPntClick(Sender: TObject);
begin
  CalcKey(DecimalSeparator);
end;

procedure TFormCalc.ButtonDivClick(Sender: TObject);
begin
  CalcKey('/');
end;

procedure TFormCalc.ButtonMulClick(Sender: TObject);
begin
  CalcKey('*');
end;

procedure TFormCalc.ButtonSubClick(Sender: TObject);
begin
  CalcKey('-');
end;

procedure TFormCalc.ButtonAddClick(Sender: TObject);
begin
  CalcKey('+');
end;

procedure TFormCalc.ButtonResultClick(Sender: TObject);
begin
  CalcKey('=');
end;

procedure TFormCalc.ButtonCClick(Sender: TObject);
begin
  CalcKey('C');
end;

procedure TFormCalc.BackButtonClick(Sender: TObject);
begin
  CalcKey(#8);
end;

procedure TFormCalc.ButtonPMClick(Sender: TObject);
begin
  CalcKey('_');
end;

procedure TFormCalc.ButtonRevClick(Sender: TObject);
begin
  FStatus := csFirst;
  if GetDisplay = 0 then Error
    else SetDisplay(1.0 / GetDisplay);
end;

procedure TFormCalc.ButtonPercentClick(Sender: TObject);
begin
  CalcKey('%');
end;

procedure TFormCalc.ButtonSqrtClick(Sender: TObject);
begin
  FStatus := csFirst;
  if GetDisplay < 0 then Error
    else SetDisplay(Sqrt(GetDisplay));
end;

procedure TFormCalc.ButtonMCClick(Sender: TObject);
begin
  FMemory := 0.0;
  MemoryLabel.Caption := '';
end;

procedure TFormCalc.ButtonMRClick(Sender: TObject);
begin
  if (FStatus = csValid) or (FStatus = csFirst) then begin
    FStatus := csFirst;
    CheckFirst;
    SetDisplay(FMemory);
  end;
end;

procedure TFormCalc.ButtonMSClick(Sender: TObject);
begin
  if (FStatus = csValid) or (FStatus = csFirst) then begin
    FStatus := csFirst;
    FMemory := GetDisplay;
    if FMemory <> 0 then MemoryLabel.Caption := 'M'
    else MemoryLabel.Caption := '';
  end;
end;

procedure TFormCalc.ButtonMPClick(Sender: TObject);
begin
  if (FStatus = csValid) or (FStatus = csFirst) then begin
    FStatus := csFirst;
    FMemory := FMemory + GetDisplay;
    if FMemory <> 0 then MemoryLabel.Caption := 'M'
      else MemoryLabel.Caption := '';
  end;
end;

procedure TFormCalc.FormCreate(Sender: TObject);
begin
  FMemory := 0.0;
end;

procedure TFormCalc.Copy1Click(Sender: TObject);
begin
  Clipboard.AsText := DisplayLabel.Caption;
end;

procedure TFormCalc.Paste1Click(Sender: TObject);
begin
  try
    SetDisplay(StrToFloat(Clipboard.AsText));
  except
    DisplayLabel.Caption := '0';
  end;
end;

procedure TFormCalc.OkButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFormCalc.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
