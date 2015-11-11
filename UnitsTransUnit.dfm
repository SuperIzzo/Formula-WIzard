object UnitsTransBox: TUnitsTransBox
  Left = 269
  Top = 213
  BorderStyle = bsDialog
  Caption = 'Unit Translation'
  ClientHeight = 159
  ClientWidth = 294
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
    Top = 56
    Width = 265
    Height = 13
    AutoSize = False
    Caption = 'Formula:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 264
    Top = 80
    Width = 25
    Height = 25
    AutoSize = False
  end
  object Label4: TLabel
    Left = 142
    Top = 80
    Width = 11
    Height = 17
    AutoSize = False
    Caption = '='
  end
  object Label2: TLabel
    Left = 104
    Top = 80
    Width = 25
    Height = 25
    AutoSize = False
  end
  object ComboBox1: TComboBox
    Left = 16
    Top = 24
    Width = 105
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object ComboBox2: TComboBox
    Left = 176
    Top = 24
    Width = 105
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    OnChange = ComboBox2Change
  end
  object Edit1: TEdit
    Left = 16
    Top = 80
    Width = 81
    Height = 21
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 176
    Top = 80
    Width = 81
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object StaticText1: TStaticText
    Left = 144
    Top = 24
    Width = 25
    Height = 25
    AutoSize = False
    Caption = 'to'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object Button1: TButton
    Left = 16
    Top = 120
    Width = 97
    Height = 25
    Caption = 'Calculate'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 184
    Top = 120
    Width = 97
    Height = 25
    Caption = 'Close'
    TabOrder = 6
    OnClick = Button2Click
  end
end
