unit UnitsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, DB, ADODB,Math,EExpr, XPMan, translationunit;

const max_names=100;

type
  TURelList = record
    num: byte;
    name: array[1..max_names] of string;
    book: array[1..max_names] of string;
    path: array[1..max_names] of string;
  end;

  TUnits = class(TForm)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    Bevel1: TBevel;
    btn_add: TButton;
    btn_delete: TButton;
    btn_edit: TButton;
    btn_der: TButton;
    btn_tran: TButton;
    DBLookupListBox1: TDBLookupListBox;
    StaticText1: TStaticText;
    DBMemo1: TDBMemo;
    procedure DBLookupListBox1Click(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);

    procedure find_rel(of_what:string;var RelList:TURelList;exception:string;path:string);
    function find_formula(of_what,to_what:string):string;
    procedure btn_derClick(Sender: TObject);
    function trans_formula(path:string):string;
    procedure DBLookupListBox1DblClick(Sender: TObject);

    function get_formula(name:string):string;
    function get_short(name:string):string;
    function get_main(name:string):string;
    function short_to_name(short:string):string;
    procedure btn_tranClick(Sender: TObject);
    procedure ADOTable1DataChange(DataSet: TDataSet);

    procedure translate_form;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Units: TUnits;
  Strings:Array[0..3] of String=('Add a Unit','Edit a Unit','Are you sure you want to delete this unit?','unknown');

  function replace_main(formula,rplc:string):string;

implementation

uses UnitsEditUnit, UnitsDervUnit, UnitsTransUnit, DesktopUnit;

  function TUnits.get_formula;
  var book:string;
  begin
    book:=ADOTable1.Bookmark;
    ADOTable1.first;
    get_formula:='';
    while not ADOTable1.Eof do
    begin
      if UpperCase(name)=UpperCase(string(ADOTable1.FieldValues['Name'])) then
      begin
        get_formula:=string(ADOTable1.FieldValues['Formula']);
        ADOTable1.Bookmark:=book;
        exit;
      end;
      ADOTable1.Next;
    end;
    ADOTable1.Bookmark:=book;
  end;

  function TUnits.get_short;
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

  function TUnits.get_main;
  var book:string;
  begin
    book:=ADOTable1.Bookmark;
    ADOTable1.first;
    get_main:='';
    while not ADOTable1.Eof do
    begin
      if UpperCase(name)=UpperCase(string(ADOTable1.FieldValues['Name'])) then
      begin
        get_main:=string(ADOTable1.FieldValues['Main']);
        ADOTable1.Bookmark:=book;
        exit;
      end;
      ADOTable1.Next;
    end;
    ADOTable1.Bookmark:=book;
  end;

  function TUnits.short_to_name;
  var book:string;
  begin
    book:=ADOTable1.Bookmark;
    ADOTable1.first;
    short_to_name:='';
    while not ADOTable1.Eof do
    begin
      if short=string(ADOTable1.FieldValues['Short']) then
      begin
        short_to_name:=string(ADOTable1.FieldValues['Name']);
        ADOTable1.Bookmark:=book;
        exit;
      end;
      ADOTable1.Next;
    end;
    ADOTable1.Bookmark:=book;
  end;

  function replace_main(formula,rplc:string):string;
  var mark:integer;
      fml:string;
  begin
    mark:=pos('$main',formula);
    fml:=formula;
    while mark>0 do
    begin
      delete(fml,mark,5);
      insert(rplc,fml,mark);
      mark:=pos('$main',fml);
    end;
    replace_main:=fml;
  end;

  procedure TUnits.Find_Rel;
  var c_main,c_name,booki:string;
      i:byte;
      maini,namei:string;
      tempList:TURelList;
      pathi:string;
  begin

  namei:=UpperCase(of_what);
  booki:=ADOTable1.Bookmark;
  ADOTable1.First;
  RelList.num:=0;
  pathi:=path;
  if pathi='' then pathi:=of_what;

  while not ADOTable1.Eof do
  begin
    c_main:=string(ADOTable1.FieldValues['Main']);
    c_name:=string(ADOTable1.FieldValues['Name']);

    if (namei=UpperCase(c_main))and(namei<>UpperCase(c_name))and(UpperCase(exception)<>UpperCase(c_name)) then
    begin
      RelList.num:=RelList.num+1;
      RelList.name[RelList.num]:=c_name;
      RelList.book[RelList.num]:=ADOTable1.Bookmark;
      RelList.path[RelList.num]:=pathi+'<<'+c_name;
      Find_Rel(RelList.name[RelList.num],tempList,namei,RelList.path[RelList.num]);

      for i:=1 to tempList.num do
      begin
        RelList.Name[i+RelList.Num]:=tempList.name[i];
        RelList.book[i+RelList.num]:=tempList.Book[i];
        RelList.path[i+RelList.num]:=tempList.path[i];
      end;

      RelList.Num:=RelList.num+tempList.Num;
    end;

    if (namei=UpperCase(c_name))and(namei<>UpperCase(c_main))and(exception<>UpperCase(c_main)) then
    begin
      RelList.num:=RelList.num+1;
      RelList.name[RelList.num]:=c_main;
      RelList.book[RelList.num]:=ADOTable1.Bookmark;
      RelList.path[RelList.num]:=pathi+'>>'+c_main;
      Find_Rel(RelList.name[RelList.num],tempList,namei,RelList.path[RelList.num]);

      for i:=1 to tempList.num do
      begin
        RelList.Name[i+RelList.Num]:=tempList.name[i];
        RelList.book[i+RelList.num]:=tempList.Book[i];
        RelList.path[i+RelList.num]:=tempList.path[i]
      end;

      RelList.Num:=RelList.num+tempList.Num;
    end;

    ADOTable1.next;
  end;

  ADOTable1.Bookmark:=booki;

  end;

  function TUnits.Find_Formula;
  var RelList:TURelList;
      i:word;
      pathi:string;
  begin
    find_rel(to_what,RelList,'','');
    for i:=1 to RelList.num do
      if of_what=RelList.name[i] then break;

    pathi:=RelList.path[i];
    Find_Formula:=trans_formula(pathi);
  end;

  function TUnits.trans_formula;
  var pathi,namei,maini,formul,fullform:string;
      p1,p2:integer;
      his:THistory;
  begin
    pathi:=path;
    fullform:='$main';

    while (pos('>>',pathi)>0) or (pos('<<',pathi)>0) do
    begin
      p1:=pos('>>',pathi);
      p2:=pos('<<',pathi);

      if (p1>0) and ((p1<p2) or (p2=0)) then
      begin
        namei:=copy(pathi,1,p1-1);
        delete(pathi,1,p1+1);

        p1:=pos('>>',pathi);
        if p1=0 then p1:=length(pathi)+1;
        p2:=pos('<<',pathi);
        if p2=0 then p2:=length(pathi)+1;

        maini:=copy(pathi,1, Min(p1,p2)-1);
        formul:=get_formula(namei);

        //Express('$main',formul,his);
        //formul:=StringReplace(formul,'$name','$main',[rfReplaceAll]);
        //delete(formul,1,6);
        fullform:=StringReplace(fullform,'$main','('+formul+')',[rfReplaceAll]);
      end;

      if (p2>0) and ((p2<p1) or (p1=0)) then
      begin
        maini:=copy(pathi,1,p2-1);
        delete(pathi,1,p2+1);

        p1:=pos('>>',pathi);
        if p1=0 then p1:=length(pathi)+1;
        p2:=pos('<<',pathi);
        if p2=0 then p2:=length(pathi)+1;

        namei:=copy(pathi,1, Min(p1,p2)-1);
        formul:='$name='+get_formula(namei);

        Express('$main',formul,his);
        formul:=StringReplace(formul,'$name','$main',[rfReplaceAll]);
        delete(formul,1,6);
        fullform:=StringReplace(fullform,'$main','('+formul+')',[rfReplaceAll]);
      end;
    end;
    trans_formula:=fullform;
  end;

{$R *.dfm}

procedure TUnits.DBLookupListBox1Click(Sender: TObject);
var formu,maini,msign,booki:string;
begin
  maini:=ADOTable1.FieldByName('Main').AsString;

  booki:=ADOTable1.Bookmark;
  ADOTable1.First;
  msign:='('+Strings[3]+')';
  while not ADOTable1.Eof do
  begin
    if UpperCase(maini)=UpperCase(string(ADOTable1.FieldValues['Name'])) then
    begin
      msign:=ADOTable1.FieldValues['Short'];
      Break;
    end;
  ADOTable1.Next;
  end;
  ADOTable1.Bookmark:=booki;

// ADOTable1.FieldByName('Name');

  formu:=replace_main(ADOTable1.FieldByName('Formula').asstring,msign);
  StaticText1.Caption:=ADOTable1.FieldByName('Short').asstring+' = '+formu;

end;

procedure TUnits.btn_addClick(Sender: TObject);
begin
  UnitsEditBox.Mode:=1;
  UnitsEditBox.Caption:=Strings[0];
  UnitsEditBox.show;

end;

procedure TUnits.btn_editClick(Sender: TObject);
begin
  UnitsEditBox.Mode:=2;
  UnitsEditBox.Caption:=Strings[1];
  UnitsEditBox.show;
end;

procedure TUnits.btn_deleteClick(Sender: TObject);
begin
if MessageDlg(Strings[2],
     MtConfirmation,[MbYes,MbNo],0)=mrYes then ADOTable1.Delete;
end;

procedure TUnits.btn_derClick(Sender: TObject);
begin
  UnitsDervBox.mode:=1;
  UnitsDervBox.show;
end;

procedure TUnits.DBLookupListBox1DblClick(Sender: TObject);
begin
  if DBLookupListBox1.SelectedItem='' then
  btn_addClick(Sender) else btn_editClick(Sender);
end;

procedure TUnits.btn_tranClick(Sender: TObject);
begin
  UnitsTransBox.Show;
end;

procedure TUnits.ADOTable1DataChange(DataSet: TDataSet);
begin
  Desktop.SetChange('',true);
end;

procedure TUnits.translate_form;
begin
  self.Caption:=StringReplace(GetWord('Units','Units'),'&','',[rfReplaceAll]);
  btn_add.Caption:=GetWord('Add','Add');
  btn_edit.Caption:=GetWord('Edit','Edit');
  btn_delete.Caption:=GetWord('Delete','Delete');
  btn_der.Caption:=GetWord('Derivatives','Derivatives');
  btn_tran.Caption:=GetWord('Translate','Translate');
  Strings[0]:=GetWord('AddUnit','Add a Unit');
  Strings[1]:=GetWord('EditUnit','Edit a Unit');
  Strings[2]:=GetWord('UnDelCnf','Are you sure you want to delete this unit?');
  Strings[3]:=GetWord('UnUnk','unknown');
end;  

end.
