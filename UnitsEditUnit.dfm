object UnitsEditBox: TUnitsEditBox
  Left = 270
  Top = 187
  BorderStyle = bsDialog
  Caption = '...'
  ClientHeight = 267
  ClientWidth = 279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 49
    Height = 17
    AutoSize = False
    Caption = 'Name:'
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 49
    Height = 17
    AutoSize = False
    Caption = 'Sign:'
  end
  object Label3: TLabel
    Left = 121
    Top = 43
    Width = 24
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = '='
  end
  object Label4: TLabel
    Left = 16
    Top = 64
    Width = 49
    Height = 17
    AutoSize = False
    Caption = 'Main:'
  end
  object Label5: TLabel
    Left = 16
    Top = 96
    Width = 56
    Height = 13
    Caption = 'Description:'
  end
  object Edit1: TEdit
    Left = 72
    Top = 16
    Width = 193
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 72
    Top = 40
    Width = 49
    Height = 21
    TabOrder = 1
  end
  object Edit5: TEdit
    Left = 144
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 72
    Top = 64
    Width = 193
    Height = 21
    ItemHeight = 13
    TabOrder = 3
  end
  object Memo1: TMemo
    Left = 16
    Top = 112
    Width = 249
    Height = 105
    TabOrder = 4
  end
  object Button1: TButton
    Left = 16
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 192
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 6
    OnClick = Button2Click
  end
end
