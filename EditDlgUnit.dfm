object EditDlg: TEditDlg
  Left = 214
  Top = 152
  BorderStyle = bsDialog
  Caption = 'Editor'
  ClientHeight = 84
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnHide = FormHide
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText1: TStaticText
    Left = 8
    Top = 8
    Width = 44
    Height = 17
    Caption = 'Formula:'
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 289
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 224
    Top = 56
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = Button2Click
  end
end
