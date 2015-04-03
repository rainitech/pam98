object Form1: TForm1
  Left = 192
  Top = 130
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'MIB Example'
  ClientHeight = 342
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = CSMIB1Change
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 59
    Top = 40
    Width = 62
    Height = 13
    Caption = 'MIB Number:'
  end
  object Label2: TLabel
    Left = 59
    Top = 72
    Width = 108
    Height = 13
    Caption = 'Preferred MIME Name:'
  end
  object MimeNameLabel: TLabel
    Left = 176
    Top = 72
    Width = 3
    Height = 13
  end
  object InvalidNumberLabel: TLabel
    Left = 184
    Top = 40
    Width = 86
    Height = 13
    Caption = 'Invalid Number'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object MibEnumEdit: TEdit
    Left = 128
    Top = 36
    Width = 49
    Height = 21
    TabOrder = 0
    Text = '3'
    OnChange = MibEnumEditChange
  end
  object AliasListBox: TListBox
    Left = 59
    Top = 96
    Width = 209
    Height = 169
    ItemHeight = 13
    TabOrder = 1
  end
  object AliasEdit: TEdit
    Left = 59
    Top = 272
    Width = 121
    Height = 21
    TabOrder = 2
    OnKeyPress = AliasEditKeyPress
  end
  object AliasBtn: TButton
    Left = 190
    Top = 270
    Width = 75
    Height = 25
    Caption = 'Search alias'
    TabOrder = 3
    OnClick = SearchAlias
  end
  object CSMIB1: TCSMIB
    OnChange = CSMIB1Change
    Enum = 3
    IgnoreInvalidEnum = False
    Left = 280
    Top = 32
  end
end
