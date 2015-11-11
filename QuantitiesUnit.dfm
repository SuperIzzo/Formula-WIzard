object Quantities: TQuantities
  Left = 163
  Top = 204
  BorderStyle = bsDialog
  Caption = 'Quantities'
  ClientHeight = 230
  ClientWidth = 396
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
  object Bevel1: TBevel
    Left = 264
    Top = 24
    Width = 129
    Height = 65
  end
  object DBText1: TDBText
    Left = 272
    Top = 56
    Width = 113
    Height = 13
    Alignment = taCenter
    DataField = 'Unit'
    DataSource = DataSource1
    Transparent = False
  end
  object btn_add: TButton
    Left = 16
    Top = 24
    Width = 89
    Height = 33
    Caption = 'Add'
    TabOrder = 0
    OnClick = btn_addClick
  end
  object btn_delete: TButton
    Left = 16
    Top = 104
    Width = 89
    Height = 33
    Caption = 'Delete'
    TabOrder = 1
    OnClick = btn_deleteClick
  end
  object btn_edit: TButton
    Left = 16
    Top = 64
    Width = 89
    Height = 33
    Caption = 'Edit'
    TabOrder = 2
    OnClick = btn_editClick
  end
  object btn_der: TButton
    Left = 16
    Top = 144
    Width = 89
    Height = 33
    Caption = 'Derivatives'
    TabOrder = 3
    OnClick = btn_derClick
  end
  object btn_tran: TButton
    Left = 16
    Top = 184
    Width = 89
    Height = 33
    Caption = 'Calculate'
    TabOrder = 4
    OnClick = btn_tranClick
  end
  object DBLookupListBox1: TDBLookupListBox
    Left = 120
    Top = 24
    Width = 137
    Height = 186
    DataField = 'Name'
    DataSource = DataSource2
    KeyField = 'Name'
    ListField = 'Name'
    ListSource = DataSource1
    TabOrder = 5
    OnClick = DBLookupListBox1Click
  end
  object StaticText1: TStaticText
    Left = 272
    Top = 40
    Width = 110
    Height = 17
    Align = alCustom
    Alignment = taCenter
    AutoSize = False
    TabOrder = 6
  end
  object DBMemo1: TDBMemo
    Left = 264
    Top = 96
    Width = 129
    Height = 113
    Color = clBtnFace
    DataField = 'Description'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 7
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 192
    Top = 208
  end
  object DataSource2: TDataSource
    DataSet = ADOTable2
    Left = 280
    Top = 208
  end
  object ADOTable1: TADOTable
    AfterPost = ADOTable1DataChange
    AfterDelete = ADOTable1DataChange
    TableName = 'Quantities'
    Left = 224
    Top = 208
  end
  object ADOTable2: TADOTable
    TableName = 'Quantities'
    Left = 312
    Top = 208
  end
end
