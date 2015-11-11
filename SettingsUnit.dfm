object SettingsBox: TSettingsBox
  Left = 160
  Top = 101
  Width = 518
  Height = 401
  Caption = 'Settings'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button2: TButton
    Left = 240
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 0
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 416
    Top = 336
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = Button3Click
  end
  object Button5: TButton
    Left = 328
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 2
    OnClick = Button5Click
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 510
    Height = 329
    ActivePage = AppSetPG
    Align = alCustom
    TabOrder = 3
    object AppSetPG: TTabSheet
      Caption = 'General'
      object Label2: TLabel
        Left = 8
        Top = 80
        Width = 72
        Height = 13
        Caption = 'Temp Directory'
      end
      object Label1: TLabel
        Left = 8
        Top = 48
        Width = 72
        Height = 13
        Caption = 'Desktop Image'
      end
      object Label3: TLabel
        Left = 8
        Top = 112
        Width = 42
        Height = 13
        Caption = 'Languge'
      end
      object Edit2: TEdit
        Left = 88
        Top = 80
        Width = 289
        Height = 21
        TabOrder = 0
      end
      object Button4: TButton
        Left = 384
        Top = 80
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 1
        OnClick = Button4Click
      end
      object CheckBox1: TCheckBox
        Left = 8
        Top = 144
        Width = 369
        Height = 17
        Caption = 'Load most recently used database on startup'
        TabOrder = 2
      end
      object CheckBox2: TCheckBox
        Left = 8
        Top = 168
        Width = 369
        Height = 17
        Caption = 'Load unexpectedly closed database'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object Edit1: TEdit
        Left = 88
        Top = 48
        Width = 289
        Height = 21
        TabOrder = 4
      end
      object Button1: TButton
        Left = 384
        Top = 48
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 5
        OnClick = Button1Click
      end
      object ComboBox1: TComboBox
        Left = 88
        Top = 112
        Width = 289
        Height = 21
        ItemHeight = 13
        TabOrder = 6
      end
    end
  end
end
