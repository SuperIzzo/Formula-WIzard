object Form4: TForm4
  Left = 185
  Top = 106
  BorderStyle = bsDialog
  Caption = 'Calculation Form'
  ClientHeight = 375
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnShow = ClearClick
  PixelsPerInch = 96
  TextHeight = 13
  object var1: TEdit
    Left = 24
    Top = 32
    Width = 41
    Height = 21
    TabOrder = 0
    OnChange = varChange
  end
  object val1: TEdit
    Left = 88
    Top = 32
    Width = 49
    Height = 21
    TabOrder = 1
  end
  object StaticText1: TStaticText
    Left = 72
    Top = 32
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 2
  end
  object var2: TEdit
    Left = 24
    Top = 64
    Width = 41
    Height = 21
    TabOrder = 3
    OnChange = varChange
  end
  object val2: TEdit
    Left = 88
    Top = 64
    Width = 49
    Height = 21
    TabOrder = 4
  end
  object var3: TEdit
    Left = 24
    Top = 96
    Width = 41
    Height = 21
    TabOrder = 5
    OnChange = varChange
  end
  object val3: TEdit
    Left = 88
    Top = 96
    Width = 49
    Height = 21
    TabOrder = 6
  end
  object var4: TEdit
    Left = 24
    Top = 128
    Width = 41
    Height = 21
    TabOrder = 7
    OnChange = varChange
  end
  object val4: TEdit
    Left = 88
    Top = 128
    Width = 49
    Height = 21
    TabOrder = 8
  end
  object var5: TEdit
    Left = 24
    Top = 160
    Width = 41
    Height = 21
    TabOrder = 9
    OnChange = varChange
  end
  object val5: TEdit
    Left = 88
    Top = 160
    Width = 49
    Height = 21
    TabOrder = 10
  end
  object StaticText2: TStaticText
    Left = 72
    Top = 64
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 11
  end
  object StaticText3: TStaticText
    Left = 72
    Top = 128
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 12
  end
  object StaticText4: TStaticText
    Left = 72
    Top = 160
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 13
  end
  object StaticText5: TStaticText
    Left = 72
    Top = 96
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 14
  end
  object var6: TEdit
    Left = 248
    Top = 32
    Width = 41
    Height = 21
    TabOrder = 15
    OnChange = varChange
  end
  object val6: TEdit
    Left = 312
    Top = 32
    Width = 49
    Height = 21
    TabOrder = 16
  end
  object var7: TEdit
    Left = 248
    Top = 64
    Width = 41
    Height = 21
    TabOrder = 17
    OnChange = varChange
  end
  object val7: TEdit
    Left = 312
    Top = 64
    Width = 49
    Height = 21
    TabOrder = 18
  end
  object var8: TEdit
    Left = 248
    Top = 96
    Width = 41
    Height = 21
    TabOrder = 19
    OnChange = varChange
  end
  object val8: TEdit
    Left = 312
    Top = 96
    Width = 49
    Height = 21
    TabOrder = 20
  end
  object var9: TEdit
    Left = 248
    Top = 128
    Width = 41
    Height = 21
    TabOrder = 21
    OnChange = varChange
  end
  object val9: TEdit
    Left = 312
    Top = 128
    Width = 49
    Height = 21
    TabOrder = 22
  end
  object var10: TEdit
    Left = 248
    Top = 160
    Width = 41
    Height = 21
    TabOrder = 23
    OnChange = varChange
  end
  object val10: TEdit
    Left = 312
    Top = 160
    Width = 49
    Height = 21
    TabOrder = 24
  end
  object StaticText6: TStaticText
    Left = 296
    Top = 32
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 25
  end
  object StaticText7: TStaticText
    Left = 296
    Top = 64
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 26
  end
  object StaticText8: TStaticText
    Left = 296
    Top = 160
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 27
  end
  object StaticText9: TStaticText
    Left = 296
    Top = 96
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 28
  end
  object StaticText10: TStaticText
    Left = 296
    Top = 128
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 29
  end
  object Memo1: TMemo
    Left = 8
    Top = 216
    Width = 433
    Height = 113
    Lines.Strings = (
      '')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 30
  end
  object StaticText11: TStaticText
    Left = 8
    Top = 32
    Width = 13
    Height = 17
    Caption = '1.'
    TabOrder = 31
  end
  object StaticText12: TStaticText
    Left = 8
    Top = 64
    Width = 13
    Height = 17
    Caption = '2.'
    TabOrder = 32
  end
  object StaticText13: TStaticText
    Left = 8
    Top = 96
    Width = 13
    Height = 17
    Caption = '3.'
    TabOrder = 33
  end
  object StaticText14: TStaticText
    Left = 8
    Top = 128
    Width = 13
    Height = 17
    Caption = '4.'
    TabOrder = 34
  end
  object StaticText15: TStaticText
    Left = 8
    Top = 160
    Width = 13
    Height = 17
    Caption = '5.'
    TabOrder = 35
  end
  object StaticText16: TStaticText
    Left = 232
    Top = 32
    Width = 13
    Height = 17
    Caption = '6.'
    TabOrder = 36
  end
  object StaticText17: TStaticText
    Left = 232
    Top = 64
    Width = 13
    Height = 17
    Caption = '7.'
    TabOrder = 37
  end
  object StaticText18: TStaticText
    Left = 232
    Top = 96
    Width = 13
    Height = 17
    Caption = '8.'
    TabOrder = 38
  end
  object StaticText19: TStaticText
    Left = 232
    Top = 128
    Width = 13
    Height = 17
    Caption = '9.'
    TabOrder = 39
  end
  object StaticText20: TStaticText
    Left = 224
    Top = 160
    Width = 19
    Height = 17
    Caption = '10.'
    TabOrder = 40
  end
  object StaticText21: TStaticText
    Left = 24
    Top = 8
    Width = 43
    Height = 17
    Caption = 'Quantity'
    TabOrder = 41
  end
  object StaticText22: TStaticText
    Left = 88
    Top = 8
    Width = 31
    Height = 17
    Caption = 'Value'
    TabOrder = 42
  end
  object StaticText23: TStaticText
    Left = 248
    Top = 8
    Width = 43
    Height = 17
    Caption = 'Quantity'
    TabOrder = 43
  end
  object StaticText24: TStaticText
    Left = 312
    Top = 8
    Width = 31
    Height = 17
    Caption = 'Value'
    TabOrder = 44
  end
  object StaticText25: TStaticText
    Left = 24
    Top = 192
    Width = 58
    Height = 17
    Caption = 'Operations:'
    TabOrder = 45
  end
  object Calc: TButton
    Left = 8
    Top = 344
    Width = 81
    Height = 25
    Caption = 'Calculate'
    Default = True
    TabOrder = 46
    OnClick = CalcClick
  end
  object Clear: TButton
    Left = 170
    Top = 344
    Width = 110
    Height = 25
    Caption = 'Clear'
    TabOrder = 47
    OnClick = ClearClick
  end
  object Cancel: TButton
    Left = 360
    Top = 344
    Width = 83
    Height = 25
    Cancel = True
    Caption = 'Close'
    TabOrder = 48
    OnClick = CancelClick
  end
  object ComboBox1: TComboBox
    Left = 144
    Top = 32
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 49
    Text = '<Units>'
  end
  object ComboBox2: TComboBox
    Left = 144
    Top = 64
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 50
    Text = '<Units>'
  end
  object ComboBox3: TComboBox
    Left = 144
    Top = 96
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 51
    Text = '<Units>'
  end
  object ComboBox4: TComboBox
    Left = 144
    Top = 128
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 52
    Text = '<Units>'
  end
  object ComboBox5: TComboBox
    Left = 144
    Top = 160
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 53
    Text = '<Units>'
  end
  object ComboBox6: TComboBox
    Left = 368
    Top = 32
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 54
    Text = '<Units>'
  end
  object ComboBox7: TComboBox
    Left = 368
    Top = 64
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 55
    Text = '<Units>'
  end
  object ComboBox8: TComboBox
    Left = 368
    Top = 96
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 56
    Text = '<Units>'
  end
  object ComboBox9: TComboBox
    Left = 368
    Top = 128
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 57
    Text = '<Units>'
  end
  object ComboBox10: TComboBox
    Left = 368
    Top = 160
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 58
    Text = '<Units>'
  end
  object StaticText26: TStaticText
    Left = 144
    Top = 8
    Width = 23
    Height = 17
    Caption = 'Unit'
    TabOrder = 59
  end
  object StaticText27: TStaticText
    Left = 368
    Top = 8
    Width = 23
    Height = 17
    Caption = 'Unit'
    TabOrder = 60
  end
end
