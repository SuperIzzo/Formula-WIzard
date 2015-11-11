object Units: TUnits
  Left = 210
  Top = 199
  BorderStyle = bsDialog
  Caption = 'Units'
  ClientHeight = 217
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 240
    Top = 16
    Width = 129
    Height = 65
  end
  object btn_add: TButton
    Left = 16
    Top = 16
    Width = 89
    Height = 33
    Caption = 'Add'
    TabOrder = 0
    OnClick = btn_addClick
  end
  object btn_delete: TButton
    Left = 16
    Top = 96
    Width = 89
    Height = 33
    Caption = 'Delete'
    TabOrder = 1
    OnClick = btn_deleteClick
  end
  object btn_edit: TButton
    Left = 16
    Top = 56
    Width = 89
    Height = 33
    Caption = 'Edit'
    TabOrder = 2
    OnClick = btn_editClick
  end
  object btn_der: TButton
    Left = 16
    Top = 136
    Width = 89
    Height = 33
    Caption = 'Derivatives'
    TabOrder = 3
    OnClick = btn_derClick
  end
  object btn_tran: TButton
    Left = 16
    Top = 176
    Width = 89
    Height = 33
    Caption = 'Translate'
    TabOrder = 4
    OnClick = btn_tranClick
  end
  object DBLookupListBox1: TDBLookupListBox
    Left = 112
    Top = 16
    Width = 113
    Height = 186
    DataField = 'Name'
    DataSource = DataSource2
    KeyField = 'Name'
    ListField = 'Name'
    ListSource = DataSource1
    TabOrder = 5
    OnClick = DBLookupListBox1Click
    OnDblClick = DBLookupListBox1DblClick
  end
  object StaticText1: TStaticText
    Left = 250
    Top = 40
    Width = 110
    Height = 25
    Align = alCustom
    Alignment = taCenter
    AutoSize = False
    TabOrder = 6
  end
  object DBMemo1: TDBMemo
    Left = 240
    Top = 88
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
    Left = 216
    Top = 168
  end
  object DataSource2: TDataSource
    DataSet = ADOTable2
    Left = 304
    Top = 168
  end
  object ADOTable1: TADOTable
    AfterPost = ADOTable1DataChange
    AfterDelete = ADOTable1DataChange
    TableName = 'Units'
    Left = 248
    Top = 168
  end
  object ADOTable2: TADOTable
    TableName = 'Units'
    Left = 336
    Top = 168
  end
end
