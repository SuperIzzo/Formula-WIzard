object QuantitiesDervBox: TQuantitiesDervBox
  Left = 238
  Top = 136
  Width = 298
  Height = 367
  Caption = 'Derivatives (Quantities)'
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
    Left = 8
    Top = 8
    Width = 273
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = 'Quantity'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 64
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object Panel1: TPanel
    Left = 8
    Top = 96
    Width = 273
    Height = 193
    BorderStyle = bsSingle
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 249
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Memo1: TMemo
      Left = 8
      Top = 32
      Width = 249
      Height = 145
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
  end
  object ComboBox2: TComboBox
    Left = 160
    Top = 64
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    OnChange = ComboBox1Change
  end
  object Button1: TButton
    Left = 104
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = Button1Click
  end
  object ComboBox3: TComboBox
    Left = 72
    Top = 16
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Text = 'ComboBox3'
    OnChange = ComboBox3Change
  end
end
