object frmMainForm: TfrmMainForm
  Left = 194
  Top = 133
  Width = 487
  Height = 399
  Caption = 'Printer Setup Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mmoTextFile: TMemo
    Left = 3
    Top = 3
    Width = 472
    Height = 346
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 276
    Top = 12
    object File1: TMenuItem
      Caption = '&File'
      object Open1: TMenuItem
        Caption = '&Open'
        ShortCut = 16463
        OnClick = Open1Click
      end
      object ShowPrinters1: TMenuItem
        Caption = '&Show Printers'
        ShortCut = 16467
        OnClick = ShowPrinters1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Print1: TMenuItem
        Caption = '&Print...'
        ShortCut = 16464
        OnClick = Print1Click
      end
      object PrinterSetup1: TMenuItem
        Caption = 'Printer &Setup'
        ShortCut = 24656
        OnClick = PrinterSetup1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'E&xit'
        ShortCut = 32883
        OnClick = Exit1Click
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object About1: TMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object dlgFileopen: TOpenDialog
    Filter = 'Text Files (*.txt)|*.txt|All files (*.*)|*.*'
    Left = 246
    Top = 12
  end
  object dlgPrinterSetup: TPrinterSetupDialog
    Left = 216
    Top = 12
  end
end
