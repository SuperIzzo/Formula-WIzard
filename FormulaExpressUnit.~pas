unit FormulaExpressUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,ECalc,EExpr, ExtCtrls, XPMan, translationUnit;

type
  TFormulaExpressBox = class(TForm)
    ComboBox1: TComboBox;
    StaticText1: TStaticText;
    Button2: TButton;
    Memo1: TMemo;
    StaticText2: TStaticText;
    StaticText4: TStaticText;
    Bevel1: TBevel;
    StaticText3: TStaticText;
    ComboBox2: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure StaticText4DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure fill_mee(fm:string);
    procedure BoxFill;
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure translate_form;
  private
    { Private declarations }
  public
    mode:byte;
    { Public declarations }
  end;

var
  FormulaExpressBox: TFormulaExpressBox;
  Formula,variable:String;
  Vars:TVariables;
  Number:Word;
  History:THistory;
  i:integer;
  Strings:array[0..0] of String=('Specify the quantity you want to express!');

implementation

uses FormulasUnit, EditDlgUnit;

{$R *.DFM}

procedure TFormulaExpressBox.fill_mee;
var TempStr:string;
begin
  ComboBox1.Clear;
  Memo1.Clear;
  Formula:=Formulas.get_formula(fm);

  if EditDlgUnit.HasText then
  begin
     formula:=EditDlgUnit.return;
     EditDlgUnit.HasText:=false;
  end;

  StaticText4.Caption:=Formula;
  StaticText3.Caption:=fm;
  ComboBox2.Text:=fm;
  FindVars(Formula,Vars,Number);

  for i:=1 to Number do
    ComboBox1.Items.Add(Vars[i].name);

  str(Number,TempStr);
  StaticText2.caption:=TempStr;
end;

procedure TFormulaExpressBox.BoxFill;
var Book:String;
begin
  Book:=Formulas.AdoTable1.bookmark;
  Formulas.AdoTable1.First;
  ComboBox2.Text:=Formulas.ADOTable1.FieldValues['Name'];
  while not  Formulas.AdoTable1.Eof do
  begin
    ComboBox2.Items.Add(Formulas.ADOTable1.FieldValues['Name']);
    Formulas.ADOTable1.Next;
  end;
  Formulas.AdoTable1.bookmark:=Book;
end;

procedure TFormulaExpressBox.FormShow(Sender: TObject);
begin

if mode=1 then
begin
  StaticText3.Show;
  ComboBox2.Hide;
  fill_mee(Formulas.ADOTable1.FieldValues['Name']);
end
else
if mode=2 then
begin
    ComboBox2.show;
    StaticText3.Hide;
    BoxFill;
end;

end;

procedure TFormulaExpressBox.Button2Click(Sender: TObject);
begin
  Self.Hide;
end;

procedure TFormulaExpressBox.StaticText4DblClick(Sender: TObject);
begin
  EditDlg.Show;
  EditDlg.Edit1.Text:=self.StaticText4.Caption;
end;

procedure TFormulaExpressBox.FormActivate(Sender: TObject);
var text:string;
begin
  text:=StaticText3.Caption;
  if pos(' <custom>',text)<=0 then text:=text+' <custom>';
  
  if EditDlgUnit.HasText then fill_mee(text)//self.FormShow(sender);
end;

procedure TFormulaExpressBox.ComboBox2Change(Sender: TObject);
begin
  fill_mee(ComboBox2.Text);
end;

procedure TFormulaExpressBox.ComboBox1Change(Sender: TObject);
var TempStr:String;
begin
  if ComboBox1.Text='' then
    begin
      MessageDlg(Strings[0],mtError,[mbOk],0);
      Exit;
    end;
  Formula:=self.StaticText4.Caption;

  Express(ComboBox1.Text,formula,History);

  Memo1.Lines.Clear;
  i:=2;
  TempStr:='';
  while History[i]<>'' do
    begin
      Memo1.Lines.Add(History[i]);
      inc(i);
    end;

end;

procedure TFormulaExpressBox.translate_form;
begin
  StaticText1.Caption:=GetWord('Quantities','Quantities')+':';
  Button2.Caption:=GetWord('Close','Close');
  self.Caption:=GetWord('QuantityExpressing','Quantity Expressing');
  Strings[0]:=GetWord('ErrFmNQ','Specify the quantity you want to express!');
end;

end.
