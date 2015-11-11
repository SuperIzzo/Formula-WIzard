unit QuantitiesDervUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,ECalc,UnitsUnit,Math, XPMan,translationunit;

type
  TQuantitiesDervBox = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    Label2: TLabel;
    Memo1: TMemo;
    ComboBox2: TComboBox;
    Button1: TButton;
    ComboBox3: TComboBox;
    procedure ListUp(formula:string; var list:array of string;var num:word);
    procedure ComboBox1Change(Sender: TObject);
    function  FormatFormula(formula:string):string;
    function  QuantityMorphFormula(form_from,form_to:string):string;
    function  QuantityUnitShort(form_from:string):string;
    function  QuantityShortUnit(form_from:string):string;
    function  TranslateQuantity(form_from,form_to:string):string;
    procedure Button1Click(Sender: TObject);
    procedure fill_mee(fm:string);
    procedure FormShow(Sender: TObject);
    procedure BoxFill;
    procedure ComboBox3Change(Sender: TObject);
    procedure translate_form;
  private
    { Private declarations }
  public
    UnitList,RelUnits:TVariables;
    numb:word;
    RelLists:array[1..1000] of TURelList;
    main_form:string;
    mode:byte;

    { Public declarations }
  end;

var
  QuantitiesDervBox: TQuantitiesDervBox;
  Strings:array[0..0] of String=('Formula');

implementation

uses QuantitiesUnit;

{$R *.dfm}

function TQuantitiesDervBox.QuantityMorphFormula;
var stri:string;
    UnitList,RelUnits:TVariables;
    i,num1,num2:word;
begin
  FindVars(form_from,UnitList,num1);
  FindVars(form_to,RelUnits,num2);

  if num1<>num2 then begin QuantityMorphFormula:=''; exit; end;

  stri:=form_from;
  for i:=1 to num1 do
  begin
    stri:=stringReplace(stri,UnitList[i].name,Units.find_formula(UnitList[i].name,RelUnits[i].name),[rfReplaceAll, rfIgnoreCase]);
  end;

  QuantityMorphFormula:=stri;
end;

function TQuantitiesDervBox.QuantityUnitShort;
var stri:string;
    UnitList:TVariables;
    i,num1,num2:word;
begin
  FindVars(form_from,UnitList,num1);
 // FindVars(form_to,RelUnits,num2);

  //if num1<>num2 then begin QuantityUnitShort:=''; exit; end;

  stri:=form_from;
  for i:=1 to numb do
  begin
    stri:=stringReplace(stri,UnitList[i].name,Units.get_short(UnitList[i].name),[rfReplaceAll, rfIgnoreCase]);
  end;

  QuantityUnitShort:=stri;
end;

function TQuantitiesDervBox.QuantityShortUnit;
var stri:string;
    UnitList:TVariables;
    i,num1,num2:word;
begin
  FindVars(form_from,UnitList,num1);
 // FindVars(form_to,RelUnits,num2);

  //if num1<>num2 then begin QuantityUnitShort:=''; exit; end;

  stri:=form_from;
  for i:=1 to num1 do
  begin
    stri:=stringReplace(stri,UnitList[i].name,Units.short_to_name(UnitList[i].name),[rfReplaceAll, rfIgnoreCase]);
  end;

  QuantityShortUnit:=stri;
end;

function TQuantitiesDervBox.FormatFormula;
var stri:string;
begin
  stri:=formula;

  stri:=StringReplace(stri,'$main','$getmebacktonormalwhenyoufinish',[rfIgnoreCase]);

  stri:=StringReplace(stri,'$main/','1/',[rfReplaceAll, rfIgnoreCase]);
  stri:=StringReplace(stri,'$main*','',[rfReplaceAll, rfIgnoreCase]);
  stri:=StringReplace(stri,'*$main','',[rfReplaceAll, rfIgnoreCase]);
  stri:=StringReplace(stri,'/$main','',[rfReplaceAll, rfIgnoreCase]);
  stri:=StringReplace(stri,'+$main','',[rfReplaceAll, rfIgnoreCase]);
  stri:=StringReplace(stri,'$main+','',[rfReplaceAll, rfIgnoreCase]);
  stri:=StringReplace(stri,'-$main','',[rfReplaceAll, rfIgnoreCase]);
  stri:=StringReplace(stri,'$main-','-',[rfReplaceAll, rfIgnoreCase]);
  stri:=StringReplace(stri,'$main','1',[rfReplaceAll, rfIgnoreCase]);

  stri:=StringReplace(stri,'$getmebacktonormalwhenyoufinish','$main',[rfIgnoreCase]);

  FormatFormula:=stri;
end;

function TQuantitiesDervBox.TranslateQuantity;
var resu:string;
begin
  resu:=FormatFormula(QuantityMorphFormula(form_from,form_to));
  if resu='' then resu:='$main';
  TranslateQuantity:=resu;
end;

procedure TQuantitiesDervBox.ListUp;
var
    i,j,maxl,k,tempval:integer;
//    loops:array[1..30] of integer;
    stri:string;
begin
  FindVars(formula,UnitList,numb);

  for i:=1 to numb do
  begin
    Units.find_rel(UnitList[i].name,RelLists[i],'','');
    inc(RelLists[i].num);
    RelLists[i].name[RelLists[i].num]:=UnitList[i].name;
    RelLists[i].path[RelLists[i].num]:=UnitList[i].name;
  end;

  num:=0;
  maxl:=1;
  for i:=1 to numb do maxl:=maxl*RelLists[i].num;

  for j:=maxl downto 0 do
  begin
    stri:=formula;
    for i:=1 to numb do
    begin

    tempval:=1;
    for k:=1 to i-1 do tempval:=tempval*RelLists[k].num;

    tempval:=ceil(j/tempval) mod RelLists[i].num;
    if tempval=0 then tempval:=RelLists[i].num;

    stri:=StringReplace(stri,UnitList[i].name,RelLists[i].name[tempval],[rfReplaceAll, rfIgnoreCase]);

    end;
  num:=num+1;
  List[num]:=stri;

  end;
end;



procedure TQuantitiesDervBox.fill_mee;
var list:array[1..1000] of string;
    num,i:word;
begin
  Label1.Caption:=fm+' ('+Quantities.get_short(fm)+')';
  main_form:=Quantities.get_formula(fm); //Quantities.ADOTable1.FieldValues['Unit'];
  label2.Caption:='';
  Memo1.Text:='';
  ComboBox1.Clear;
  ComboBox2.Clear;

  ListUp(main_form,list,num);
  for i:=1 to num do
    begin
      ComboBox1.Items.Add(List[i]);
      ComboBox2.Items.Add(List[i]);
    end;

  ComboBox1.Sorted:=true;
  ComboBox2.Sorted:=true;
end;

procedure TQuantitiesDervBox.BoxFill;
var Book:String;
begin
  Book:=Quantities.AdoTable1.bookmark;
  Quantities.AdoTable1.First;
  ComboBox3.Text:=Quantities.ADOTable1.FieldValues['Name'];
  while not  Quantities.AdoTable1.Eof do
  begin
    ComboBox3.Items.Add(Quantities.ADOTable1.FieldValues['Name']);
    Quantities.ADOTable1.Next;
  end;
  Quantities.AdoTable1.bookmark:=Book;
end;

procedure TQuantitiesDervBox.FormShow(Sender: TObject);
begin
if mode=1 then
begin
  label1.Show;
  ComboBox3.Hide;
  fill_mee(Quantities.ADOTable1.FieldValues['Name']);
end
else
if mode=2 then
begin
    ComboBox3.show;
    Label1.Hide;
    BoxFill;
end;

end;

procedure TQuantitiesDervBox.ComboBox1Change(Sender: TObject);
var i:integer;
    stri,stri_n,stri_o:string;
begin
  Memo1.Clear;
  label2.Caption:='';
  stri_n:=QuantityUnitShort(ComboBox2.Text);
  stri_o:=QuantityUnitShort(ComboBox1.Text);


  stri:=QuantityMorphFormula(ComboBox1.Text,ComboBox2.Text);
  if stri<>''then
  begin
    Label2.Caption:=stri_o+' >> '+stri_n;
    Memo1.Lines.Add(Strings[0]+': ['+stri_n+'] = '+stringreplace(FormatFormula(stri),'$main','['+stri_o+']',[rfReplaceAll, rfIgnoreCase]));
  end;

end;

procedure TQuantitiesDervBox.Button1Click(Sender: TObject);
begin
  Self.Hide;
end;

procedure TQuantitiesDervBox.ComboBox3Change(Sender: TObject);
begin
  fill_mee(ComboBox3.Text);
end;

procedure TQuantitiesDervBox.translate_form;
begin
  self.Caption:=StringReplace(GetWord('Derivatives','Derivatives'),'&','',[rfReplaceAll])+' ('+StringReplace(GetWord('Quantities','Quantities'),'&','',[rfReplaceAll])+')';
  Button1.Caption:=GetWord('Close','Close');
  Strings[0]:=GetWord('Formula','Formula');
end;
end.
