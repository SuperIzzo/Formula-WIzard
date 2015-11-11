unit QuantitiesUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, ADODB, Grids, DBGrids, DBCtrls, ExtCtrls, XPMan, translationunit;

type
  TQuantities = class(TForm)
    btn_add: TButton;
    btn_delete: TButton;
    btn_edit: TButton;
    btn_der: TButton;
    btn_tran: TButton;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    DBLookupListBox1: TDBLookupListBox;
    StaticText1: TStaticText;
    Bevel1: TBevel;
    DBText1: TDBText;
    DBMemo1: TDBMemo;
    procedure DBLookupListBox1Click(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure btn_derClick(Sender: TObject);
    function  get_formula(name:string):string;
    function  get_short(name:string):string;
    function  name_by_short(short:string):string;
    function  shorter(expr:string):string;
    procedure btn_tranClick(Sender: TObject);
    procedure ADOTable1DataChange(DataSet: TDataSet);
    procedure translate_form;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Quantities: TQuantities;
  Strings:array[0..2] of string=('Add a Quantity','Edit a Quantity','Are you sure you want to delete this quantity?');

implementation

uses QuantitiesEditUnit, QuantitiesDervUnit, QuantitiesTransUnit, DesktopUnit,
  FormulaChartUnit;

{$R *.dfm}

  function TQuantities.shorter;
  var ch:char;
      posi,zh:integer;
  begin
  posi:=pos('$',expr);
  if posi=0 then posi:=length(expr)+1;

  for ch:='0' to '9' do
  begin
    zh:=pos(string(ch),expr);
    if (zh>0) and (zh<posi) then posi:=zh;
  end;

  shorter:=copy(expr,1,posi-1);
  end;

  function TQuantities.get_formula;
  var book:string;
  begin
    book:=ADOTable1.Bookmark;
    ADOTable1.first;
    get_formula:='';
    while not ADOTable1.Eof do
    begin
      if UpperCase(name)=UpperCase(string(ADOTable1.FieldValues['Name'])) then
      begin
        get_formula:=string(ADOTable1.FieldValues['Unit']);
        ADOTable1.Bookmark:=book;
        exit;
      end;
      ADOTable1.Next;
    end;
    ADOTable1.Bookmark:=book;
  end;

  function TQuantities.get_short;
  var book:string;
  begin
    book:=ADOTable1.Bookmark;
    ADOTable1.first;
    get_short:='';
    while not ADOTable1.Eof do
    begin
      if UpperCase(name)=UpperCase(string(ADOTable1.FieldValues['Name'])) then
      begin
        get_short:=string(ADOTable1.FieldValues['Short']);
        ADOTable1.Bookmark:=book;
        exit;
      end;
      ADOTable1.Next;
    end;
    ADOTable1.Bookmark:=book;
  end;

  function TQuantities.name_by_short;
  var book:string;
  begin
    book:=ADOTable1.Bookmark;
    ADOTable1.first;
    name_by_short:='';
    while not ADOTable1.Eof do
    begin
      if short=string(ADOTable1.FieldValues['Short']) then
      begin
        name_by_short:=string(ADOTable1.FieldValues['Name']);
        ADOTable1.Bookmark:=book;
        exit;
      end;
      ADOTable1.Next;
    end;
    ADOTable1.Bookmark:=book;
  end;

procedure TQuantities.DBLookupListBox1Click(Sender: TObject);
begin
  StaticText1.Caption:=ADOTable1.FieldByName('Name').asstring+' ('+ADOTable1.FieldByName('Short').asstring+')';
end;

procedure TQuantities.btn_addClick(Sender: TObject);
begin
  QuantitiesEditBox.Mode:=1;
  QuantitiesEditBox.Caption:=Strings[0];
  QuantitiesEditBox.show;
end;

procedure TQuantities.btn_editClick(Sender: TObject);
begin
  QuantitiesEditBox.Mode:=2;
  QuantitiesEditBox.Caption:=Strings[1];
  QuantitiesEditBox.show;
end;

procedure TQuantities.btn_deleteClick(Sender: TObject);
begin
if MessageDlg(Strings[2],
     MtConfirmation,[MbYes,MbNo],0)=mrYes then ADOTable1.Delete;
end;

procedure TQuantities.btn_derClick(Sender: TObject);
begin
  QuantitiesDervBox.mode:=1;
  QuantitiesDervBox.show;
end;

procedure TQuantities.btn_tranClick(Sender: TObject);
begin
  QuantitiesTransBox.mode:=1;
  QuantitiesTransBox.Show;
end;

procedure TQuantities.ADOTable1DataChange(DataSet: TDataSet);
begin
  Desktop.SetChange('',true);
end;

procedure TQuantities.translate_form;
begin
  self.Caption:=StringReplace(GetWord('Quantities','Quantities'),'&','',[rfReplaceAll]);
  btn_add.Caption:=GetWord('Add','Add');
  btn_Edit.Caption:=GetWord('Edit','Edit');
  btn_Delete.Caption:=GetWord('Delete','Delete');
  btn_Der.Caption:=GetWord('Derivatives','Derivatives');
  btn_Tran.Caption:=GetWord('Calculate','Calculate');
  Strings[0]:=GetWord('AddQuantity','Add a Quantity');
  Strings[1]:=GetWord('EditQuantity','Edit a Quantity');
  Strings[2]:=GetWord('QtDelCnf','Are you sure you want to delete this quantity?');
end;

end.
