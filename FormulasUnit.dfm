object Formulas: TFormulas
  Left = 179
  Top = 151
  Anchors = [akTop, akRight]
  BorderStyle = bsDialog
  Caption = 'Formula Inspector'
  ClientHeight = 309
  ClientWidth = 470
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDefault
  OnKeyPress = delete
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 313
    Top = 11
    Width = 149
    Height = 97
  end
  object Formula: TDBText
    Left = 314
    Top = 51
    Width = 148
    Height = 18
    Alignment = taCenter
    DataField = 'Formula'
    DataSource = DataSource1
    Transparent = True
  end
  object DBLookupListBox1: TDBLookupListBox
    Left = 144
    Top = 11
    Width = 153
    Height = 277
    DataField = 'Name'
    DataSource = DataSource2
    KeyField = 'Name'
    ListField = 'Name'
    ListSource = DataSource1
    TabOrder = 0
    OnDblClick = Btn_EditClick
  end
  object Discription: TDBMemo
    Left = 313
    Top = 115
    Width = 149
    Height = 185
    Color = clBtnFace
    DataField = 'Description'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
  end
  object Btn_Add: TButton
    Left = 7
    Top = 13
    Width = 121
    Height = 33
    Caption = 'Add'
    TabOrder = 2
    OnClick = Btn_AddClick
  end
  object Btn_Edit: TButton
    Left = 7
    Top = 51
    Width = 121
    Height = 33
    Caption = 'Edit'
    TabOrder = 3
    OnClick = Btn_EditClick
  end
  object Btn_Del: TButton
    Left = 7
    Top = 91
    Width = 121
    Height = 33
    Caption = 'Delete'
    TabOrder = 4
    OnClick = Btn_DelClick
  end
  object Btn_More: TButton
    Left = 7
    Top = 139
    Width = 121
    Height = 34
    Caption = 'Derivatives'
    TabOrder = 5
    OnClick = Btn_MoreClick
  end
  object Btn_Calc: TButton
    Left = 7
    Top = 179
    Width = 121
    Height = 33
    Caption = 'Calculate'
    TabOrder = 6
    OnClick = Btn_CalcClick
  end
  object Btn_Close: TButton
    Left = 7
    Top = 267
    Width = 121
    Height = 33
    Caption = 'Close'
    TabOrder = 7
    OnClick = Btn_CloseClick
  end
  object Btn_Graph: TButton
    Left = 7
    Top = 219
    Width = 121
    Height = 33
    Caption = 'Chart'
    TabOrder = 8
    OnClick = Btn_GraphClick
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 312
    Top = 264
  end
  object DataSource2: TDataSource
    DataSet = ADOTable2
    Left = 400
    Top = 264
  end
  object ADOTable1: TADOTable
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Program Files\Co' +
      'mmon Files\PFD\Formulas.mdb;Persist Security Info=False'
    CursorType = ctStatic
    AfterPost = ADOTable1datachange
    AfterDelete = ADOTable1datachange
    TableName = 'Formulas'
    Left = 344
    Top = 264
  end
  object ADOTable2: TADOTable
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Program Files\Co' +
      'mmon Files\PFD\Formulas.mdb;Persist Security Info=False'
    CursorType = ctStatic
    TableName = 'Formulas'
    Left = 432
    Top = 264
  end
end
