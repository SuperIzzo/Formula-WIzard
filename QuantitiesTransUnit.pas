unit QuantitiesTransUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ECalc,UnitsUnit,EExpr, XPMan,translationunit;

type
  TQuantitiesTransBox = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    StaticText1: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure BoxFill;
    procedure fill_mee(fm:string);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
    Formula:string;
    { Public declarations }
  end;

var
  QuantitiesTransBox: TQuantitiesTransBox;
  Strings:Array[0..0] of String = ('Formula:');
implementation

uses QuantitiesUnit, QuantitiesDervUnit;

{$R *.dfm}

procedure TQuantitiesTransBox.BoxFill;
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

procedure TQuantitiesTransBox.fill_mee;
var list:array[1..1000] of string;
    num,i:word;
begin
  Label1.Caption:=fm+' ('+Quantities.get_short(fm)+')';
  main_form:=Quantities.get_formula(fm); //Quantities.ADOTable1.FieldValues['Unit'];
  ComboBox1.Clear;
  ComboBox2.Clear;
  Edit1.Text:='';
  Edit2.Text:='';
  StaticText1.Caption:=Strings[0];

  QuantitiesDervBox.ListUp(main_form,list,num);
  for i:=1 to num do
    begin
      ComboBox1.Items.Add(List[i]);
      ComboBox2.Items.Add(List[i]);
    end;

  ComboBox1.Sorted:=true;
  ComboBox2.Sorted:=true;
end;

procedure TQuantitiesTransBox.FormShow(Sender: TObject);
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

  Edit1.Text:='';
  Edit2.Text:='';
  Formula:='';

end;

procedure TQuantitiesTransBox.ComboBox1Change(Sender: TObject);
var i:integer;
    stri_n,stri_o:string;
begin
  StaticText1.Caption:=Strings[0];
  stri_n:=QuantitiesDervBox.QuantityUnitShort(ComboBox2.Text);
  stri_o:=QuantitiesDervBox.QuantityUnitShort(ComboBox1.Text);


  Formula:=QuantitiesDervBox.QuantityMorphFormula(ComboBox1.Text,ComboBox2.Text);
  if Formula<>''then
  begin
    StaticText1.Caption:=Strings[0]+' ['+stri_n+'] = '+stringreplace(QuantitiesDervBox.FormatFormula(Formula),'$main','['+stri_o+']',[rfReplaceAll, rfIgnoreCase]);
  end;

end;

procedure TQuantitiesTransBox.Button2Click(Sender: TObject);
begin
  self.Hide;
end;

procedure TQuantitiesTransBox.Button1Click(Sender: TObject);
var fml:string;
valu:extended;
error:TError;
begin
  fml:=formula;
  if fml='' then fml:='$main';

  valu:=calculate(stringreplace(QuantitiesDervBox.FormatFormula(fml),'$main',Edit1.Text,[rfReplaceAll, rfIgnoreCase]),novars,error);
  Edit2.Text:=format('%g',[valu]);
end;

procedure TQuantitiesTransBox.ComboBox3Change(Sender: TObject);
begin
  fill_mee(ComboBox3.Text);
end;

procedure TQuantitiesTransBox.translate_form;
begin
  Self.Caption:=StringReplace(GetWord('Translate','Translate'),'&','',[rfReplaceAll])+' ('+StringReplace(GetWord('Quantities','Quantities'),'&','',[rfReplaceAll])+')';
  Strings[0]:=GetWord('Formula','Formula')+':';
  Button1.Caption:=GetWord('Calculate','Calculate');
  Button2.Caption:=GetWord('Close','Close');
  StaticText1.Caption:=GetWord('Formula','Formula')+':';
end;

end.
