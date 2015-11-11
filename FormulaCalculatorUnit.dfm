object FormulaCalculatorBox: TFormulaCalculatorBox
  Left = 197
  Top = 59
  BorderStyle = bsDialog
  Caption = 'Formula Calculation'
  ClientHeight = 465
  ClientWidth = 428
  Color = clBtnFace
  Constraints.MaxHeight = 499
  Constraints.MaxWidth = 436
  Constraints.MinHeight = 499
  Constraints.MinWidth = 436
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 16
    Width = 409
    Height = 49
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 16
    Top = 64
    Width = 393
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'Formula'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnDblClick = Label1DblClick
  end
  object Label2: TLabel
    Left = 8
    Top = 248
    Width = 54
    Height = 13
    Caption = 'Operations:'
  end
  object Label3: TLabel
    Left = 16
    Top = 24
    Width = 393
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = 'Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnDblClick = Label1DblClick
  end
  object StaticText1: TStaticText
    Left = 8
    Top = 88
    Width = 33
    Height = 17
    AutoSize = False
    TabOrder = 0
  end
  object StaticText2: TStaticText
    Left = 224
    Top = 88
    Width = 33
    Height = 17
    AutoSize = False
    TabOrder = 1
  end
  object StaticText3: TStaticText
    Left = 8
    Top = 120
    Width = 33
    Height = 17
    AutoSize = False
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 64
    Top = 88
    Width = 57
    Height = 21
    TabOrder = 3
    Visible = False
  end
  object Edit2: TEdit
    Left = 280
    Top = 88
    Width = 57
    Height = 21
    TabOrder = 4
    Visible = False
  end
  object Edit3: TEdit
    Left = 64
    Top = 120
    Width = 57
    Height = 21
    TabOrder = 5
    Visible = False
  end
  object StaticText4: TStaticText
    Left = 224
    Top = 120
    Width = 33
    Height = 17
    AutoSize = False
    TabOrder = 6
  end
  object Edit4: TEdit
    Left = 280
    Top = 120
    Width = 57
    Height = 21
    TabOrder = 7
    Visible = False
  end
  object StaticText5: TStaticText
    Left = 8
    Top = 152
    Width = 33
    Height = 17
    AutoSize = False
    TabOrder = 8
  end
  object Edit5: TEdit
    Left = 64
    Top = 152
    Width = 57
    Height = 21
    TabOrder = 9
    Visible = False
  end
  object StaticText6: TStaticText
    Left = 224
    Top = 152
    Width = 33
    Height = 17
    AutoSize = False
    TabOrder = 10
  end
  object Edit6: TEdit
    Left = 280
    Top = 152
    Width = 57
    Height = 21
    TabOrder = 11
    Visible = False
  end
  object StaticText7: TStaticText
    Left = 8
    Top = 184
    Width = 33
    Height = 17
    AutoSize = False
    TabOrder = 12
  end
  object Edit7: TEdit
    Left = 64
    Top = 184
    Width = 57
    Height = 21
    TabOrder = 13
    Visible = False
  end
  object StaticText8: TStaticText
    Left = 224
    Top = 184
    Width = 33
    Height = 17
    AutoSize = False
    TabOrder = 14
  end
  object Edit8: TEdit
    Left = 280
    Top = 184
    Width = 57
    Height = 21
    TabOrder = 15
    Visible = False
  end
  object StaticText9: TStaticText
    Left = 8
    Top = 216
    Width = 33
    Height = 17
    AutoSize = False
    TabOrder = 16
  end
  object Edit9: TEdit
    Left = 64
    Top = 216
    Width = 57
    Height = 21
    TabOrder = 17
    Visible = False
  end
  object StaticText10: TStaticText
    Left = 224
    Top = 216
    Width = 33
    Height = 17
    AutoSize = False
    TabOrder = 18
  end
  object Edit10: TEdit
    Left = 280
    Top = 216
    Width = 57
    Height = 21
    TabOrder = 19
    Visible = False
  end
  object Memo1: TMemo
    Left = 8
    Top = 272
    Width = 409
    Height = 121
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 20
  end
  object Button1: TButton
    Left = 8
    Top = 424
    Width = 89
    Height = 33
    Caption = 'Calculate'
    Default = True
    TabOrder = 21
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 328
    Top = 424
    Width = 91
    Height = 33
    Cancel = True
    Caption = 'Close'
    TabOrder = 22
    OnClick = Button2Click
  end
  object StaticText11: TStaticText
    Left = 48
    Top = 88
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 23
  end
  object StaticText12: TStaticText
    Left = 264
    Top = 88
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 24
  end
  object StaticText13: TStaticText
    Left = 48
    Top = 120
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 25
  end
  object StaticText14: TStaticText
    Left = 264
    Top = 120
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 26
  end
  object StaticText15: TStaticText
    Left = 48
    Top = 152
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 27
  end
  object StaticText16: TStaticText
    Left = 264
    Top = 152
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 28
  end
  object StaticText17: TStaticText
    Left = 48
    Top = 184
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 29
  end
  object StaticText18: TStaticText
    Left = 264
    Top = 184
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 30
  end
  object StaticText19: TStaticText
    Left = 48
    Top = 216
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 31
  end
  object StaticText20: TStaticText
    Left = 264
    Top = 216
    Width = 10
    Height = 17
    Caption = '='
    TabOrder = 32
  end
  object ComboBox1: TComboBox
    Left = 128
    Top = 88
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 33
  end
  object ComboBox2: TComboBox
    Left = 344
    Top = 88
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 34
  end
  object ComboBox3: TComboBox
    Left = 128
    Top = 120
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 35
  end
  object ComboBox4: TComboBox
    Left = 344
    Top = 120
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 36
  end
  object ComboBox5: TComboBox
    Left = 128
    Top = 152
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 37
  end
  object ComboBox6: TComboBox
    Left = 344
    Top = 152
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 38
  end
  object ComboBox7: TComboBox
    Left = 128
    Top = 184
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 39
  end
  object ComboBox8: TComboBox
    Left = 344
    Top = 184
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 40
  end
  object ComboBox9: TComboBox
    Left = 128
    Top = 216
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 41
  end
  object ComboBox10: TComboBox
    Left = 344
    Top = 216
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 42
  end
  object ComboBox11: TComboBox
    Left = 72
    Top = 27
    Width = 289
    Height = 21
    ItemHeight = 13
    TabOrder = 43
    Text = 'ComboBox11'
    OnChange = ComboBox11Change
  end
end
