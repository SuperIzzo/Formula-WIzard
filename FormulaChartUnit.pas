unit FormulaChartUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart,UnitsUnit,ECalc,EExpr,math,OleCtrls,
  XPMan, TranslationUnit;

type
  TFormulaChartBox = class(TForm)
    Chart1: TChart;
    Series1: TFastLineSeries;
    Edit1: TEdit;
    Edit3: TEdit;
    ComboBox1: TComboBox;
    Edit5: TEdit;
    ComboBox5: TComboBox;
    Edit2: TEdit;
    ComboBox2: TComboBox;
    Edit7: TEdit;
    ComboBox7: TComboBox;
    Edit4: TEdit;
    ComboBox4: TComboBox;
    ComboBox3: TComboBox;
    Edit6: TEdit;
    ComboBox6: TComboBox;
    Edit8: TEdit;
    ComboBox8: TComboBox;
    Edit9: TEdit;
    ComboBox9: TComboBox;
    Edit10: TEdit;
    ComboBox10: TComboBox;
    Edit11: TEdit;
    Edit12: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label13: TLabel;
    Label14: TLabel;
    ComboBox11: TComboBox;
    Edit13: TEdit;
    Label15: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FillForm(fm:string;clear:boolean);
    procedure ClearForm;
    procedure Button1Click(Sender: TObject);
    procedure BoxFill;
    procedure fill_mee(fm:string;clear:boolean);
    procedure ComboBox11Change(Sender: TObject);
    procedure Label13DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure translate_form;
  private
    { Private declarations }
  public
    RelLists:array[1..10] of array[1..1000] of string;
    main_form:array[1..10] of string;
    formula:string;
    vars,var_shorts:TVariables;
    num:word;
    mode:byte;

    { Public declarations }
  end;

var
  FormulaChartBox: TFormulaChartBox;

implementation

uses QuantitiesUnit, QuantitiesDervUnit, FormulasUnit, EditDlgUnit;

{$R *.dfm}

procedure TFormulaChartBox.BoxFill;
var Book:String;
begin
  Book:=Formulas.AdoTable1.bookmark;
  Formulas.AdoTable1.First;
  ComboBox11.Text:=Formulas.ADOTable1.FieldValues['Name'];
  while not  Formulas.AdoTable1.Eof do
  begin
    ComboBox11.Items.Add(Formulas.ADOTable1.FieldValues['Name']);
    Formulas.ADOTable1.Next;
  end;
  Formulas.AdoTable1.bookmark:=Book;
end;

procedure TFormulaChartBox.Button2Click(Sender: TObject);
begin
  self.Hide;
end;

procedure TFormulaChartBox.ClearForm;
begin
  Chart1.LeftAxis.Title.Caption:='';
  Chart1.BottomAxis.Title.Caption:='';

  Edit1.Text:='';
  Label1.Caption:='';
  ComboBox1.Clear;
  Edit1.Hide;
  Label1.Hide;
  ComboBox1.Hide;

  Edit2.Text:='';
  Label2.Caption:='';
  ComboBox2.Clear;
  Edit2.Hide;
  Label2.Hide;
  ComboBox2.Hide;

  Edit3.Text:='';
  Label3.Caption:='';
  ComboBox3.Clear;
  Edit3.Hide;
  Label3.Hide;
  ComboBox3.Hide;

  Edit4.Text:='';
  Label4.Caption:='';
  ComboBox4.Clear;
  Edit4.Hide;
  Label4.Hide;
  ComboBox4.Hide;

  Edit5.Text:='';
  Label5.Caption:='';
  ComboBox5.Clear;
  Edit5.Hide;
  Label5.Hide;
  ComboBox5.Hide;

  Edit6.Text:='';
  Label6.Caption:='';
  ComboBox6.Clear;
  Edit6.Hide;
  Label6.Hide;
  ComboBox6.Hide;

  Edit7.Text:='';
  Label7.Caption:='';
  ComboBox7.Clear;
  Edit7.Hide;
  Label7.Hide;
  ComboBox7.Hide;

  Edit8.Text:='';
  Label8.Caption:='';
  ComboBox8.Clear;
  Edit8.Hide;
  Label8.Hide;
  ComboBox8.Hide;

  Edit9.Text:='';
  Label9.Caption:='';
  ComboBox9.Clear;
  Edit9.Hide;
  Label9.Hide;
  ComboBox9.Hide;

  Edit10.Text:='';
  Label10.Caption:='';
  ComboBox10.Clear;
  Edit10.Hide;
  Label10.Hide;
  ComboBox10.Hide;

  Edit12.Text:='-100';
  Edit11.Text:='100';
  Edit13.Text:='1';

end;

procedure TFormulaChartBox.FillForm;
var num2,i:word;

begin
  formula:=Formulas.get_formula(fm);

  Label14.Caption:=fm;
  ComboBox11.Text:=fm;

  if EditDlgUnit.HasText then
  begin
     formula:=EditDlgUnit.return;
     EditDlgUnit.HasText:=false;
  end;
  Label13.Caption:=formula;

  findvars(formula,var_shorts,num);
  chart1.Series[0].Clear;
  for i:=1 to num do
  Vars[i].name:=Quantities.name_by_short(Quantities.shorter(var_shorts[i].name));

{========================================================================}
  if num>0 then
  begin
  if clear then Edit1.Text:='';
  Label1.Caption:=var_shorts[1].name;
  main_form[1]:=Quantities.get_formula(vars[1].name);

  QuantitiesDervBox.ListUp(main_form[1],RelLists[1],num2);
  ComboBox1.Clear;

  ComboBox1.Text:='<Units>';
  ComboBox1.Items.Add('<Units>');
  for i:=2 to num2 do
      ComboBox1.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[1][i]));
  Edit1.Show;
  Label1.Show;
  ComboBox1.Show;
  end
  else
  begin
    Edit1.Text:='';
    Edit1.Hide;
    ComboBox1.Hide;
    Label1.Hide;
  end;

{========================================================================}
  if num>1 then
  begin
  if clear then Edit2.Text:='';
  Label2.Caption:=var_shorts[2].name;
  main_form[2]:=Quantities.get_formula(vars[2].name);

  QuantitiesDervBox.ListUp(main_form[2],RelLists[2],num2);
  ComboBox2.Clear;

  ComboBox2.Text:='<Units>';
  ComboBox2.Items.Insert(0,'<Units>');
  for i:=2 to num2 do
      ComboBox2.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[2][i]));

  Edit2.Show;
  Label2.Show;
  ComboBox2.Show;
  end
  else
  begin
    Edit2.Text:='';
    Edit2.Hide;
    ComboBox2.Hide;
    Label2.Hide;
  end;

{========================================================================}
  if num>2 then
  begin
  if clear then Edit3.Text:='';
  Label3.Caption:=var_shorts[3].name;
  main_form[3]:=Quantities.get_formula(vars[3].name);

  QuantitiesDervBox.ListUp(main_form[3],RelLists[3],num2);
  ComboBox3.Clear;

  ComboBox3.Text:='<Units>';
  ComboBox3.Items.Insert(0,'<Units>');
  for i:=2 to num2 do
      ComboBox3.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[3][i]));

  Edit3.Show;
  Label3.Show;
  ComboBox3.Show;
  end
  else
  begin
    Edit3.Text:='';
    Edit3.Hide;
    ComboBox3.Hide;
    Label3.Hide;
  end;

{========================================================================}
  if num>3 then
  begin
  if clear then Edit4.Text:='';
  Label4.Caption:=var_shorts[4].name;
  main_form[4]:=Quantities.get_formula(vars[4].name);

  QuantitiesDervBox.ListUp(main_form[4],RelLists[4],num2);
  ComboBox4.Clear;

  ComboBox4.Text:='<Units>';
  ComboBox4.Items.Insert(0,'<Units>');
  for i:=2 to num2 do
      ComboBox4.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[4][i]));

  Edit4.Show;
  Label4.Show;
  ComboBox4.Show;
  end
  else
  begin
    Edit4.Text:='';
    Edit4.Hide;
    ComboBox4.Hide;
    Label4.Hide;
  end;

{========================================================================}
  if num>4 then
  begin
  if clear then Edit5.Text:='';
  Label5.Caption:=var_shorts[5].name;
  main_form[5]:=Quantities.get_formula(vars[5].name);

  QuantitiesDervBox.ListUp(main_form[5],RelLists[5],num2);
  ComboBox5.Clear;

  ComboBox5.Text:='<Units>';
  ComboBox5.Items.Insert(0,'<Units>');
  for i:=2 to num2 do
      ComboBox5.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[5][i]));

  Edit5.Show;
  Label5.Show;
  ComboBox5.Show;
  end
  else
  begin
    Edit5.Text:='';
    Edit5.Hide;
    ComboBox5.Hide;
    Label5.Hide;
  end;

{========================================================================}
  if num>5 then
  begin
  if clear then Edit6.Text:='';
  Label6.Caption:=var_shorts[6].name;
  main_form[6]:=Quantities.get_formula(vars[6].name);

  QuantitiesDervBox.ListUp(main_form[6],RelLists[6],num2);
  ComboBox6.Clear;

  ComboBox6.Text:='<Units>';
  ComboBox6.Items.Insert(0,'<Units>');
  for i:=2 to num2 do
      ComboBox6.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[6][i]));

  Edit6.Show;
  Label6.Show;
  ComboBox6.Show;
  end
  else
  begin
    Edit6.Text:='';
    Edit6.Hide;
    ComboBox6.Hide;
    Label6.Hide;
  end;

{========================================================================}
  if num>6 then
  begin
  if clear then Edit7.Text:='';
  Label7.Caption:=var_shorts[7].name;
  main_form[7]:=Quantities.get_formula(vars[7].name);

  QuantitiesDervBox.ListUp(main_form[7],RelLists[7],num2);
  ComboBox7.Clear;

  ComboBox7.Text:='<Units>';
  ComboBox7.Items.Insert(0,'<Units>');
  for i:=2 to num2 do
      ComboBox7.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[7][i]));

  Edit7.Show;
  Label7.Show;
  ComboBox7.Show;
  end
  else
  begin
    Edit7.Text:='';
    Edit7.Hide;
    ComboBox7.Hide;
    Label7.Hide;
  end;

{========================================================================}
  if num>7 then
  begin
  if clear then Edit8.Text:='';
  Label8.Caption:=var_shorts[8].name;
  main_form[8]:=Quantities.get_formula(vars[8].name);

  QuantitiesDervBox.ListUp(main_form[8],RelLists[8],num2);
  ComboBox8.Clear;

  ComboBox8.Text:='<Units>';
  ComboBox8.Items.Insert(0,'<Units>');
  for i:=2 to num2 do
      ComboBox8.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[8][i]));

  Edit8.Show;
  Label8.Show;
  ComboBox8.Show;
  end
  else
  begin
    Edit8.Text:='';
    Edit8.Hide;
    ComboBox8.Hide;
    Label8.Hide;
  end;

{========================================================================}
  if num>8 then
  begin
  if clear then Edit9.Text:='';
  Label9.Caption:=var_shorts[9].name;
  main_form[9]:=Quantities.get_formula(vars[9].name);

  QuantitiesDervBox.ListUp(main_form[9],RelLists[9],num2);
  ComboBox9.Clear;

  ComboBox9.Text:='<Units>';
  ComboBox9.Items.Insert(0,'<Units>');
  for i:=2 to num2 do
      ComboBox9.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[9][i]));

  Edit9.Show;
  Label9.Show;
  ComboBox9.Show;
  end
  else
  begin
    Edit9.Text:='';
    Edit9.Hide;
    ComboBox9.Hide;
    Label9.Hide;
  end;

{========================================================================}
  if num>9 then
  begin
  if clear then Edit10.Text:='';
  Label10.Caption:=var_shorts[10].name;
  main_form[10]:=Quantities.get_formula(vars[10].name);

  QuantitiesDervBox.ListUp(main_form[10],RelLists[10],num2);
  ComboBox10.Clear;

  ComboBox10.Text:='<Units>';
  ComboBox10.Items.Insert(0,'<Units>');
  for i:=2 to num2 do
      ComboBox10.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[10][i]));

  Edit10.Show;
  Label10.Show;
  ComboBox10.Show;
  end
  else
  begin
    Edit10.Text:='';
    Edit10.Hide;
    ComboBox10.Hide;
    Label10.Hide;
  end;

end;

procedure TFormulaChartBox.fill_mee;
begin
  //formula:=Formulas.get_formula(fm);
if clear then ClearForm;
  FillForm(fm,clear);
  Label14.Caption:=fm;
  ComboBox11.Text:=fm;
end;

/////////////////////////////////////////
procedure TFormulaChartBox.FormShow(Sender: TObject);
begin
  //formula:=string(Formulas.ADOTable1.FieldValues['Formula']);

if mode=1 then
begin
  Label14.visible:=true;
  ComboBox11.visible:=false;
  fill_mee(Formulas.ADOTable1.FieldValues['Name'],true);
end
else
if mode=2 then
begin
    ComboBox11.visible:=true;
    Label14.visible:=false;
    BoxFill;
end;
end;




procedure TFormulaChartBox.Button1Click(Sender: TObject);
var question,loop:byte;
    q,l:byte;
    Error:TError;
    formu,lformu,qformu,stri:string;
    min,max,i:longint;
    x,prec:extended;
    qunit,lunit:string;
    his:THistory;
    cformula:string;
    divz:boolean;
begin
  prec:=10;
  chart1.Series[0].Clear;

  if (ComboBox1.Text='')and(num>0) then
  begin
    MessageDlg('Unit of '+var_shorts[1].name+' is missong!',mtError,[mbOk],0);
    exit;
  end;

  if (ComboBox2.Text='')and(num>1) then
  begin
    MessageDlg('Unit of '+var_shorts[2].name+' is missong!',mtError,[mbOk],0);
    exit;
  end;

  if (ComboBox3.Text='')and(num>2) then
  begin
    MessageDlg('Unit of '+var_shorts[3].name+' is missong!',mtError,[mbOk],0);
    exit;
  end;

  if (ComboBox4.Text='')and(num>3) then
  begin
    MessageDlg('Unit of '+var_shorts[4].name+' is missong!',mtError,[mbOk],0);
    exit;
  end;

  if (ComboBox5.Text='')and(num>4) then
  begin
    MessageDlg('Unit of '+var_shorts[5].name+' is missong!',mtError,[mbOk],0);
    exit;
  end;

  if (ComboBox6.Text='')and(num>5) then
  begin
    MessageDlg('Unit of '+var_shorts[6].name+' is missong!',mtError,[mbOk],0);
    exit;
  end;

  if (ComboBox7.Text='')and(num>6) then
  begin
    MessageDlg('Unit of '+var_shorts[7].name+' is missong!',mtError,[mbOk],0);
    exit;
  end;

  if (ComboBox8.Text='')and(num>7) then
  begin
    MessageDlg('Unit of '+var_shorts[8].name+' is missong!',mtError,[mbOk],0);
    exit;
  end;

  if (ComboBox9.Text='')and(num>8) then
  begin
    MessageDlg('Unit of '+var_shorts[9].name+' is missong!',mtError,[mbOk],0);
    exit;
  end;

  if (ComboBox10.Text='')and(num>9) then
  begin
    MessageDlg('Unit of '+var_shorts[10].name+' is missong!',mtError,[mbOk],0);
    exit;
  end;

  question:=0;
  loop:=0;

  if (Edit1.Text='')and(num>0) then
  begin
    MessageDlg('Value of '+var_shorts[1].name+' is missong! Use "?" for the unknown or "!" for the loop value!',mtError,[mbOk],0);
    exit;
  end else
  if Edit1.Text='?' then
  begin
    inc(question);
    q:=1;
    qunit:=ComboBox1.Text;
  end else
  if Edit1.Text='!' then
  begin
    lunit:=ComboBox1.Text;
    inc(loop);
    l:=1;
  end;

  if (Edit2.Text='')and(num>1) then
  begin
    MessageDlg('Value of '+vars[2].name+' is missong! Use "?" for the unknown or "!" for the loop value!',mtError,[mbOk],0);
    exit;
  end else
  if Edit2.Text='?' then
  begin
    inc(question);
    q:=2;
  qunit:=ComboBox2.Text;
  end else
  if Edit2.Text='!' then
  begin
    lunit:=ComboBox2.Text;
    inc(loop);
    l:=2;
  end;

  if (Edit3.Text='')and(num>2) then
  begin
    MessageDlg('Value of '+vars[3].name+' is missong! Use "?" for the unknown or "!" for the loop value!',mtError,[mbOk],0);
    exit;
  end else
  if Edit3.Text='?' then
  begin
    inc(question);
    q:=3;
    qunit:=ComboBox3.Text;
  end else
  if Edit3.Text='!' then
  begin
    lunit:=ComboBox3.Text;
    inc(loop);
    l:=3;
  end;

  if (Edit4.Text='')and(num>3) then
  begin
    MessageDlg('Value of '+vars[4].name+' is missong! Use "?" for the unknown or "!" for the loop value!',mtError,[mbOk],0);
    exit;
  end else
  if Edit4.Text='?' then
  begin
    inc(question);
    q:=4;
    qunit:=ComboBox4.Text;
  end else
  if Edit4.Text='!' then
  begin
    lunit:=ComboBox4.Text;
    inc(loop);
    l:=4;
  end;

  if (Edit5.Text='')and(num>4) then
  begin
    MessageDlg('Value of '+vars[5].name+' is missong! Use "?" for the unknown or "!" for the loop value!',mtError,[mbOk],0);
    exit;
  end else
  if Edit5.Text='?' then
  begin
    inc(question);
    q:=5;
    qunit:=ComboBox5.Text;
  end else
  if Edit5.Text='!' then
  begin
    lunit:=ComboBox5.Text;
    inc(loop);
    l:=5;
  end;

  if (Edit6.Text='')and(num>5) then
  begin
    MessageDlg('Value of '+vars[6].name+' is missong! Use "?" for the unknown or "!" for the loop value!',mtError,[mbOk],0);
    exit;
    qunit:=ComboBox6.Text;
  end else
  if Edit6.Text='!' then
  begin
    lunit:=ComboBox6.Text;
    inc(question);
    q:=6;
  end else
  if Edit6.Text='!' then
  begin
    inc(loop);
    l:=6;
  end;

  if (Edit7.Text='')and(num>6) then
  begin
    MessageDlg('Value of '+vars[7].name+' is missong! Use "?" for the unknown or "!" for the loop value!',mtError,[mbOk],0);
    exit;
    qunit:=ComboBox7.Text;
  end else
  if Edit7.Text='!' then
  begin
    lunit:=ComboBox7.Text;
    inc(question);
    q:=7;
  end else
  if Edit7.Text='!' then
  begin
    inc(loop);
    l:=7;
  end;

  if (Edit8.Text='')and(num>7) then
  begin
    MessageDlg('Value of '+vars[8].name+' is missong! Use "?" for the unknown or "!" for the loop value!',mtError,[mbOk],0);
    exit;
  end else
  if Edit8.Text='?' then
  begin
    inc(question);
    q:=8;
    qunit:=ComboBox8.Text;
  end else
  if Edit8.Text='!' then
  begin
    lunit:=ComboBox8.Text;
    inc(loop);
    l:=8;
  end;

  if (Edit9.Text='')and(num>8) then
  begin
    MessageDlg('Value of '+vars[9].name+' is missong! Use "?" for the unknown or "!" for the loop value!',mtError,[mbOk],0);
    exit;
  end else
  if Edit9.Text='?' then
  begin
    inc(question);
    q:=9;
    qunit:=ComboBox9.Text;
  end else
  if Edit9.Text='!' then
  begin
    lunit:=ComboBox9.Text;
    inc(loop);
    l:=9;
  end;

  if (Edit10.Text='')and(num>9) then
  begin
    MessageDlg('Value of '+vars[10].name+' is missong! Use "?" for the unknown or "!" for the loop value!',mtError,[mbOk],0);
    exit;
  end else
  if Edit10.Text='?' then
  begin
    inc(question);
    q:=10;
    qunit:=ComboBox10.Text;
  end else
  if Edit10.Text='!' then
  begin
    lunit:=ComboBox10.Text;
    inc(loop);
    l:=10;
  end;              

  if (question<>1) then
  begin
    MessageDlg('You must mark exactly one quantity as unknown. Use "?" instead of a value.',mtError,[mbOk],0);
    exit;
  end;

  if (loop<>1) then
  begin
    MessageDlg('You must mark exactly one quantity as loop. Use "!" instead of a value.',mtError,[mbOk],0);
    exit;
  end;

  if (l<>1)and(q<>1)and(num>0) then
  begin
    if ComboBox1.text='<Units>' then formu:='$main' else
    formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox1.text),main_form[1]);
    if formu='' then formu:='$main';
    var_shorts[1].value:=calculate(StringReplace(formu,'$main',Edit1.Text,[rfReplaceAll, rfIgnoreCase]),novars,Error);
  end;

  if (l<>2)and(q<>2)and(num>1) then
  begin
    if ComboBox2.text='<Units>' then formu:='$main' else
    formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox2.text),main_form[2]);
    if formu='' then formu:='$main';
    var_shorts[2].value:=calculate(StringReplace(formu,'$main',Edit2.Text,[rfReplaceAll, rfIgnoreCase]),novars,Error);
  end;

  if (l<>3)and(q<>3)and(num>3-1) then
  begin
    if ComboBox3.text='<Units>' then formu:='$main' else
    formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox3.text),main_form[3]);
    if formu='' then formu:='$main';
    var_shorts[3].value:=calculate(StringReplace(formu,'$main',Edit3.Text,[rfReplaceAll, rfIgnoreCase]),novars,Error);
  end;

  if (l<>4)and(q<>4)and(num>4-1) then
  begin
    if ComboBox4.text='<Units>' then formu:='$main' else
    formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox4.text),main_form[4]);
    if formu='' then formu:='$main';
    var_shorts[4].value:=calculate(StringReplace(formu,'$main',Edit4.Text,[rfReplaceAll, rfIgnoreCase]),novars,Error);
  end;

  if (l<>5)and(q<>5)and(num>5-1) then
  begin
    if ComboBox5.text='<Units>' then formu:='$main' else
    formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox5.text),main_form[5]);
    if formu='' then formu:='$main';
    var_shorts[5].value:=calculate(StringReplace(formu,'$main',Edit5.Text,[rfReplaceAll, rfIgnoreCase]),novars,Error);
  end;

  if (l<>6)and(q<>6)and(num>6-1) then
  begin
    if ComboBox6.text='<Units>' then formu:='$main' else
    formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox6.text),main_form[6]);
    if formu='' then formu:='$main';
    var_shorts[6].value:=calculate(StringReplace(formu,'$main',Edit6.Text,[rfReplaceAll, rfIgnoreCase]),novars,Error);
  end;

  if (l<>7)and(q<>7)and(num>7-1) then
  begin
    if ComboBox7.text='<Units>' then formu:='$main' else
    formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox7.text),main_form[7]);
    if formu='' then formu:='$main';
    var_shorts[7].value:=calculate(StringReplace(formu,'$main',Edit7.Text,[rfReplaceAll, rfIgnoreCase]),novars,Error);
  end;

  if (l<>8)and(q<>8)and(num>8-1) then
  begin
    if ComboBox8.text='<Units>' then formu:='$main' else
    formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox8.text),main_form[8]);
    if formu='' then formu:='$main';
    var_shorts[8].value:=calculate(StringReplace(formu,'$main',Edit8.Text,[rfReplaceAll, rfIgnoreCase]),novars,Error);
  end;

  if (l<>9)and(q<>9)and(num>9-1) then
  begin
    if ComboBox9.text='<Units>' then formu:='$main' else
    formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox9.text),main_form[9]);
    if formu='' then formu:='$main';
    var_shorts[9].value:=calculate(StringReplace(formu,'$main',Edit9.Text,[rfReplaceAll, rfIgnoreCase]),novars,Error);
  end;

  if (l<>10)and(q<>10)and(num>10-1) then
  begin
    if ComboBox10.text='<Units>' then formu:='$main' else
    formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox10.text),main_form[10]);
    if formu='' then formu:='$main';
    var_shorts[10].value:=calculate(StringReplace(formu,'$main',Edit10.Text,[rfReplaceAll, rfIgnoreCase]),novars,Error);
  end;

  prec:=calculate(Edit13.Text,novars,Error);
  min:=ceil(calculate(Edit12.Text,novars,Error)*prec);
  max:=ceil(calculate(Edit11.Text,novars,Error)*prec);

//  StringReplace(formu,'$main',Edit10.Text,[rfReplaceAll, rfIgnoreCase])
    stri:=formula;
    Express(var_shorts[q].name,stri,his);
    label13.Caption:=stri;
    delete(stri,1,pos('=',stri));
    cformula:=stri;

    if lunit='<Units>' then lformu:='$main' else
    lformu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(lunit),main_form[l]);
    if lformu='' then lformu:='$main';

    if qunit='<Units>' then qformu:='$main' else
    qformu:=QuantitiesDervBox.TranslateQuantity(main_form[q],QuantitiesDervBox.QuantityShortUnit(qunit));
    if qformu='' then qformu:='$main';

  for i:=min to max do
  begin

    stri:=StringReplace(format('%g',[i/prec]),',','.',[rfReplaceAll]);//,stri);
    var_shorts[l].value:=calculate(StringReplace(lformu,'$main',stri,[rfReplaceAll, rfIgnoreCase]),novars,Error);

    divz:=false;
    var_shorts[q].value:=calculate(cformula,var_shorts,error);
    if Error.Code=12 then divz:=true;

    //var_shorts[q].value:=calculate(StringReplace(formu,'$main',stri,[rfReplaceAll, rfIgnoreCase]),novars,Error);

    str(var_shorts[q].value,stri);
    var_shorts[q].value:=calculate(StringReplace(qformu,'$main',stri,[rfReplaceAll, rfIgnoreCase]),novars,Error);
    Chart1.Series[0].AddXY(i/prec, var_shorts[q].value, '', clTeeColor);

    if divz then
    begin
      stri:=StringReplace(format('%g',[ECalc.a0]),',','.',[rfReplaceAll]);//,stri);
      var_shorts[l].value:=calculate(StringReplace(lformu,'$main',stri,[rfReplaceAll, rfIgnoreCase]),novars,Error);

      var_shorts[q].value:=calculate(cformula,var_shorts,error);
      str(var_shorts[q].value,stri);
      var_shorts[q].value:=calculate(StringReplace(qformu,'$main',stri,[rfReplaceAll, rfIgnoreCase]),novars,Error);
      Chart1.Series[0].AddXY(i/prec, var_shorts[q].value, '', clTeeColor);
    end;
  end;
    Chart1.LeftAxis.Title.Caption:=var_shorts[q].name+' ('+qunit+')';
    Chart1.BottomAxis.Title.Caption:=var_shorts[l].name+' ('+lunit+')';
end;

procedure TFormulaChartBox.ComboBox11Change(Sender: TObject);
begin
  fill_mee(ComboBox11.Text,false);
end;

procedure TFormulaChartBox.Label13DblClick(Sender: TObject);
begin
  EditDlg.Show;
  EditDlg.Edit1.Text:=self.Label13.Caption;
end;

procedure TFormulaChartBox.FormActivate(Sender: TObject);
begin
  text:=label14.Caption;
  if pos(' <custom>',text)<=0 then text:=text+' <custom>';

  if EditDlgUnit.HasText then
   fill_mee(text,false)
end;

procedure TFormulaChartBox.translate_form;
begin
  label11.Caption:=GetWord('min','min')+':';
  label12.Caption:=GetWord('max','max')+':';
  label15.Caption:=GetWord('prec','prec')+':';
  Button1.Caption:=GetWord('Draw','Draw');
  Button2.Caption:=GetWord('Close','Close');
end;  
end.
