object CalculatorFW: TCalculatorFW
  Left = 229
  Top = 203
  BorderStyle = bsDialog
  Caption = 'Calculator'
  ClientHeight = 215
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 16
    Top = 16
    Width = 329
    Height = 21
    BiDiMode = bdLeftToRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TLMDButton
    Left = 312
    Top = 152
    Width = 33
    Height = 57
    Caption = '='
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TLMDButton
    Left = 192
    Top = 56
    Width = 33
    Height = 25
    Caption = 'CE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button4: TLMDButton
    Left = 192
    Top = 152
    Width = 33
    Height = 25
    Caption = '1'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Buttons
  end
  object Button5: TLMDButton
    Left = 232
    Top = 152
    Width = 33
    Height = 25
    Caption = '2'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Buttons
  end
  object Button6: TLMDButton
    Left = 272
    Top = 152
    Width = 33
    Height = 25
    Caption = '3'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Buttons
  end
  object Button7: TLMDButton
    Left = 232
    Top = 120
    Width = 33
    Height = 25
    Caption = '5'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = Buttons
  end
  object Button8: TLMDButton
    Left = 192
    Top = 120
    Width = 33
    Height = 25
    Caption = '4'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = Buttons
  end
  object Button9: TLMDButton
    Left = 272
    Top = 120
    Width = 33
    Height = 25
    Caption = '6'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = Buttons
  end
  object Button10: TLMDButton
    Left = 192
    Top = 88
    Width = 33
    Height = 25
    Caption = '7'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = Buttons
  end
  object Button11: TLMDButton
    Left = 232
    Top = 88
    Width = 33
    Height = 25
    Caption = '8'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = Buttons
  end
  object Button12: TLMDButton
    Left = 272
    Top = 88
    Width = 33
    Height = 25
    Caption = '9'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = Buttons
  end
  object Button13: TLMDButton
    Left = 192
    Top = 184
    Width = 75
    Height = 25
    Caption = '0'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = Buttons
  end
  object Button14: TLMDButton
    Left = 272
    Top = 184
    Width = 33
    Height = 25
    Caption = '.'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    OnClick = Buttons
  end
  object Button15: TLMDButton
    Left = 312
    Top = 88
    Width = 33
    Height = 57
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    OnClick = Buttons
  end
  object Button16: TLMDButton
    Left = 232
    Top = 56
    Width = 33
    Height = 25
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    OnClick = Buttons
  end
  object Button17: TLMDButton
    Left = 272
    Top = 56
    Width = 33
    Height = 25
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    OnClick = Buttons
  end
  object Button18: TLMDButton
    Left = 312
    Top = 56
    Width = 33
    Height = 25
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
    OnClick = Buttons
  end
  object Button19: TLMDButton
    Left = 56
    Top = 56
    Width = 33
    Height = 25
    Caption = ')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 18
    OnClick = Buttons
  end
  object Button20: TLMDButton
    Left = 16
    Top = 56
    Width = 33
    Height = 25
    Caption = '('
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 19
    OnClick = Buttons
  end
  object Button21: TLMDButton
    Left = 56
    Top = 184
    Width = 33
    Height = 25
    Caption = 'pi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 20
    OnClick = Buttons
  end
  object Button22: TLMDButton
    Left = 96
    Top = 184
    Width = 33
    Height = 25
    Caption = 'E'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 21
    OnClick = Buttons
  end
  object Button24: TLMDButton
    Left = 16
    Top = 88
    Width = 33
    Height = 25
    Caption = 'sin'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 22
    OnClick = Buttons
  end
  object Button25: TLMDButton
    Left = 56
    Top = 88
    Width = 33
    Height = 25
    Caption = 'cos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 23
    OnClick = Buttons
  end
  object Button26: TLMDButton
    Left = 96
    Top = 88
    Width = 33
    Height = 25
    Caption = 'tan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 24
    OnClick = Buttons
  end
  object Button27: TLMDButton
    Left = 16
    Top = 120
    Width = 33
    Height = 25
    Caption = 'arcsin'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 25
    OnClick = Buttons
  end
  object Button28: TLMDButton
    Left = 16
    Top = 184
    Width = 33
    Height = 25
    Caption = 'fact'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 26
    OnClick = Buttons
  end
  object Button29: TLMDButton
    Left = 16
    Top = 152
    Width = 33
    Height = 25
    Caption = 'ln'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 27
    OnClick = Buttons
  end
  object Button30: TLMDButton
    Left = 56
    Top = 152
    Width = 33
    Height = 25
    Caption = 'log'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 28
    OnClick = Buttons
  end
  object Button31: TLMDButton
    Left = 96
    Top = 152
    Width = 33
    Height = 25
    Caption = 'exp'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 29
    OnClick = Buttons
  end
  object Button32: TLMDButton
    Left = 56
    Top = 120
    Width = 33
    Height = 25
    Caption = 'arccos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 30
    OnClick = Buttons
  end
  object Button33: TLMDButton
    Left = 96
    Top = 120
    Width = 33
    Height = 25
    Caption = 'arctan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 31
    OnClick = Buttons
  end
  object Button3: TLMDButton
    Left = 144
    Top = 56
    Width = 33
    Height = 25
    Caption = '^'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 32
    OnClick = Buttons
  end
  object Button34: TLMDButton
    Left = 144
    Top = 120
    Width = 33
    Height = 25
    Caption = '~'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 33
    OnClick = Buttons
  end
  object Button35: TLMDButton
    Left = 144
    Top = 88
    Width = 33
    Height = 25
    Caption = '|'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 34
    OnClick = Buttons
  end
  object Button36: TLMDButton
    Left = 96
    Top = 56
    Width = 33
    Height = 25
    Caption = 'round'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 35
    OnClick = Buttons
  end
  object Button23: TLMDButton
    Left = 144
    Top = 152
    Width = 33
    Height = 25
    Caption = 'frac'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 36
    OnClick = Buttons
  end
  object Button37: TLMDButton
    Left = 144
    Top = 184
    Width = 33
    Height = 25
    Caption = 'trunc'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 37
    OnClick = Buttons
  end
end
