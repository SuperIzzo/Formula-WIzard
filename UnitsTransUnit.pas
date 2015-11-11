unit UnitsTransUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,UnitsUnit,EExpr,ECalc, XPMan, translationunit;

type
  TUnitsTransBox = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    StaticText1: TStaticText;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure translate_form;
  private
    RelList:TURelList;
    formula:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UnitsTransBox: TUnitsTransBox;
  Strings:Array[0..0] of String=('Formula');

implementation


{$R *.dfm}

procedure TUnitsTransBox.FormShow(Sender: TObject);
var book:string;
begin
  ComboBox1.Clear;
  ComboBox2.Clear;
  Label1.Caption:='';
  Edit1.Text:='';
  Edit2.Text:='';

  Book:=Units.AdoTable1.bookmark;
  Units.AdoTable1.First;
  while not  Units.AdoTable1.Eof do
  begin
    ComboBox1.Items.Add(Units.ADOTable1.FieldValues['Name']);
    Units.ADOTable1.Next;
  end;
  Units.AdoTable1.bookmark:=Book;
end;

procedure TUnitsTransBox.ComboBox1Change(Sender: TObject);
var i:integer;
begin
  Units.find_rel(ComboBox1.Text,RelList,'','');
  ComboBox2.Clear;
  label1.Caption:='';
  label2.Caption:=Units.get_short(ComboBox1.Text);

  for i:=1 to RelList.num do
    ComboBox2.items.Add(RelList.Name[i]);
end;

procedure TUnitsTransBox.ComboBox2Change(Sender: TObject);
var his:THistory;
begin
  formula:=ComboBox1.Text+'='+StringReplace(Units.trans_formula(RelList.Path[ComboBox2.ItemIndex+1]),'$main',ComboBox2.Text,[rfReplaceAll]);
  Express(ComboBox2.Text,formula,his);
  label1.Caption:=Strings[0]+': '+formula;
  label3.Caption:=Units.get_short(ComboBox2.Text);
end;

procedure TUnitsTransBox.Button1Click(Sender: TObject);
var
  vars:TVariables;
  error:TError;
  form,tempstr:string;
begin
  vars[1].name:=ComboBox1.Text;
  vars[1].value:=Calculate(Edit1.Text,novars,Error);
  form:=formula;
  delete(form,1,length(ComboBox2.Text)+1);
//  str(Calculate(form,vars,error):0:10,tempstr);
  Edit2.Text:=format('%g',[Calculate(form,vars,error)]);
//  tempstr;
end;

procedure TUnitsTransBox.Button2Click(Sender: TObject);
begin
  self.Hide;
end;
procedure TUnitsTransBox.translate_form;
begin
  Self.Caption:=GetWord('UnitTranslation','Unit Traslation');
  Button1.Caption:=GetWord('Calculate','Calculate');
  Button2.Caption:=GetWord('Close','Close');
  StaticText1.Caption:=GetWord('to','to');
  Label1.Caption:=GetWord('Formula','Formula')+':';
  Strings[0]:=GetWord('Formula','Formula');
end;
end.
