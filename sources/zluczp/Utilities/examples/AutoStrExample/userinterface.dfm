object Form1: TForm1
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Auto String Library Example'
  ClientHeight = 348
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object AutoStrListBox1: TAutoStrListBox
    Left = 32
    Top = 64
    Width = 393
    Height = 233
    CanNavigate = True
    ItemHeight = 13
    Iterator = UtilsStringIterator1
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 32
    Top = 8
    Width = 393
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 448
    Top = 6
    Width = 75
    Height = 25
    Caption = 'Add to List'
    TabOrder = 2
    OnClick = Button1Click
  end
  object AutoStrNavigator1: TAutoStrNavigator
    Left = 32
    Top = 312
    Width = 104
    Height = 25
    Iterator = UtilsStringIterator1
    TabOrder = 3
    VisibleButtons = [nbtFirst, nbtPrior, nbtNext, nbtLast]
  end
  object CheckBox1: TCheckBox
    Left = 208
    Top = 316
    Width = 97
    Height = 17
    Caption = 'Use Aliases'
    TabOrder = 4
    OnClick = CheckBox1Click
  end
  object UtilsStringIterator1: TUtilsStringIterator
    List = UtilsAutoStrings1
    Left = 464
    Top = 64
  end
  object UtilsAutoStrings1: TUtilsAutoStrings
    Aliases = UtilsAutoAliases1
    Duplicates = dupIgnore
    Sorted = False
    Left = 504
    Top = 64
  end
  object UtilsAutoAliases1: TUtilsAutoAliases
    Left = 504
    Top = 104
  end
end
