unit FormulaCalculatorUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,ECalc,EExpr, ExtCtrls, XPMan, translationunit;

type
  TFormulaCalculatorBox = class(TForm)
    Label1: TLabel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    StaticText4: TStaticText;
    Edit4: TEdit;
    StaticText5: TStaticText;
    Edit5: TEdit;
    StaticText6: TStaticText;
    Edit6: TEdit;
    StaticText7: TStaticText;
    Edit7: TEdit;
    StaticText8: TStaticText;
    Edit8: TEdit;
    StaticText9: TStaticText;
    Edit9: TEdit;
    StaticText10: TStaticText;
    Edit10: TEdit;
    Memo1: TMemo;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    StaticText16: TStaticText;
    StaticText17: TStaticText;
    StaticText18: TStaticText;
    StaticText19: TStaticText;
    StaticText20: TStaticText;
    Bevel1: TBevel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    ComboBox10: TComboBox;
    Label3: TLabel;
    ComboBox11: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Label1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure fill_mee(fm:string);
    procedure BoxFill;
    procedure ComboBox11Change(Sender: TObject);
    procedure translate_form;
  private
    { Private declarations }
  public
    mode:byte;
    { Public declarations }
  end;

var
  FormulaCalculatorBox: TFormulaCalculatorBox;
  Formula,variable:String;
  Vars:TVariables;
  LongVars:TVariables;
  Number,num2:Word;
  code:integer;
  Err:Boolean;
  History:THistory;
  Error:TError;
  i:integer;
  result:real;
  TempStr:string;
  main_form:array[1..10] of string;
  RelLists:array[1..10] of array[1..1000] of string;
  Strings:array[0..2] of String=('In this version of the program you can have only one unknown quantity!','You have entered an illegal value for the quantity "','" ! Use the "?" symbol for the unknown quantity !');
implementation

uses FormulasUnit, EditDlgUnit, QuantitiesUnit, QuantitiesDervUnit;

{$R *.DFM}

procedure TFormulaCalculatorBox.fill_mee;
begin

  Edit1.visible:=false;
  Edit2.visible:=false;
  Edit3.visible:=false;
  Edit4.visible:=false;
  Edit5.visible:=false;
  Edit6.visible:=false;
  Edit7.visible:=false;
  Edit8.visible:=false;
  Edit9.visible:=false;
  Edit10.visible:=false;

  StaticText11.visible:=false;
  StaticText12.visible:=false;
  StaticText13.visible:=false;
  StaticText14.visible:=false;
  StaticText15.visible:=false;
  StaticText16.visible:=false;
  StaticText17.visible:=false;
  StaticText18.visible:=false;
  StaticText19.visible:=false;
  StaticText20.visible:=false;

  Edit1.Text:='';
  Edit2.Text:='';
  Edit3.Text:='';
  Edit4.Text:='';
  Edit5.Text:='';
  Edit6.Text:='';
  Edit7.Text:='';
  Edit8.Text:='';
  Edit9.Text:='';
  Edit10.Text:='';

  StaticText1.Caption:='';
  StaticText2.Caption:='';
  StaticText3.Caption:='';
  StaticText4.Caption:='';
  StaticText5.Caption:='';
  StaticText6.Caption:='';
  StaticText7.Caption:='';
  StaticText8.Caption:='';
  StaticText9.Caption:='';
  StaticText10.Caption:='';

  ComboBox1.Clear;
  ComboBox2.Clear;
  ComboBox3.Clear;
  ComboBox4.Clear;
  ComboBox5.Clear;
  ComboBox6.Clear;
  ComboBox7.Clear;
  ComboBox8.Clear;
  ComboBox9.Clear;
  ComboBox10.Clear;

  ComboBox1.Hide;
  ComboBox2.Hide;
  ComboBox3.Hide;
  ComboBox4.Hide;
  ComboBox5.Hide;
  ComboBox6.Hide;
  ComboBox7.Hide;
  ComboBox8.Hide;
  ComboBox9.Hide;
  ComboBox10.Hide;

  Memo1.Text:='';

  Number:=0;
  Formula:='';

  Formula:=Formulas.get_formula(fm);
  ComboBox11.Text:=fm;
  Label3.Caption:=fm;
  if EditDlgUnit.HasText then
  begin
     formula:=EditDlgUnit.return;
     EditDlgUnit.HasText:=false;
  end;

  Label1.Caption:=Formula;
  FindVars(Formula,Vars,Number);

  for i:=1 to number do
  LongVars[i].name:=Quantities.name_by_short(Quantities.shorter(vars[i].name));

  if Number>0 then
    begin
      Edit1.visible:=true;
      StaticText11.visible:=true;
      StaticText1.Caption:=Vars[1].Name;
      ComboBox1.Visible:=true;

      main_form[1]:=Quantities.get_formula(LongVars[1].name);
      QuantitiesDervBox.ListUp(main_form[1],RelLists[1],num2);
      ComboBox1.Clear;

      ComboBox1.Text:='<Units>';
      ComboBox1.Items.Add('<Units>');
      for i:=2 to num2 do
          ComboBox1.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[1][i]));
    end;

  if Number>1 then
    begin
      Edit2.visible:=true;
      StaticText12.visible:=true;
      StaticText2.Caption:=Vars[2].Name;
      ComboBox2.Visible:=true;

      main_form[2]:=Quantities.get_formula(LongVars[2].name);
      QuantitiesDervBox.ListUp(main_form[2],RelLists[2],num2);
      ComboBox2.Clear;

      ComboBox2.Text:='<Units>';
      ComboBox2.Items.Add('<Units>');
      for i:=2 to num2 do
          ComboBox2.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[2][i]));
    end;

  if Number>2 then
    begin
      Edit3.visible:=true;
      StaticText13.visible:=true;
      StaticText3.Caption:=Vars[3].Name;
      ComboBox3.Visible:=true;

      main_form[3]:=Quantities.get_formula(LongVars[3].name);
      QuantitiesDervBox.ListUp(main_form[3],RelLists[3],num2);
      ComboBox3.Clear;

      ComboBox3.Text:='<Units>';
      ComboBox3.Items.Add('<Units>');
      for i:=2 to num2 do
          ComboBox3.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[3][i]));
    end;

  if Number>3 then
    begin
      Edit4.visible:=true;
      StaticText14.visible:=true;
      StaticText4.Caption:=Vars[4].Name;
      ComboBox4.Visible:=true;

      main_form[4]:=Quantities.get_formula(LongVars[4].name);
      QuantitiesDervBox.ListUp(main_form[4],RelLists[4],num2);
      ComboBox4.Clear;

      ComboBox4.Text:='<Units>';
      ComboBox4.Items.Add('<Units>');
      for i:=2 to num2 do
          ComboBox4.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[4][i]));
    end;

  if Number>4 then
    begin
      Edit5.visible:=true;
      StaticText15.visible:=true;
      StaticText5.Caption:=Vars[5].Name;
      ComboBox5.Visible:=true;

      main_form[5]:=Quantities.get_formula(LongVars[5].name);
      QuantitiesDervBox.ListUp(main_form[5],RelLists[5],num2);
      ComboBox5.Clear;

      ComboBox5.Text:='<Units>';
      ComboBox5.Items.Add('<Units>');
      for i:=2 to num2 do
          ComboBox5.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[5][i]));
    end;

  if Number>5 then
    begin
      Edit6.visible:=true;
      StaticText16.visible:=true;
      StaticText6.Caption:=Vars[6].Name;
      ComboBox6.Visible:=true;

      main_form[6]:=Quantities.get_formula(LongVars[6].name);
      QuantitiesDervBox.ListUp(main_form[6],RelLists[6],num2);
      ComboBox6.Clear;

      ComboBox6.Text:='<Units>';
      ComboBox6.Items.Add('<Units>');
      for i:=2 to num2 do
          ComboBox6.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[6][i]));
    end;

  if Number>6 then
    begin
      Edit7.visible:=true;
      StaticText17.visible:=true;
      StaticText7.Caption:=Vars[7].Name;
      ComboBox7.Visible:=true;

      main_form[7]:=Quantities.get_formula(LongVars[7].name);
      QuantitiesDervBox.ListUp(main_form[7],RelLists[7],num2);
      ComboBox7.Clear;

      ComboBox7.Text:='<Units>';
      ComboBox7.Items.Add('<Units>');
      for i:=2 to num2 do
          ComboBox7.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[7][i]));
    end;

  if Number>7 then
    begin
      Edit8.visible:=true;
      StaticText18.visible:=true;
      StaticText8.Caption:=Vars[8].Name;
      ComboBox8.Visible:=true;

      main_form[8]:=Quantities.get_formula(LongVars[8].name);
      QuantitiesDervBox.ListUp(main_form[8],RelLists[8],num2);
      ComboBox8.Clear;

      ComboBox8.Text:='<Units>';
      ComboBox8.Items.Add('<Units>');
      for i:=2 to num2 do
          ComboBox8.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[8][i]));
    end;

  if Number>8 then
    begin
      Edit9.visible:=true;
      StaticText19.visible:=true;
      StaticText9.Caption:=Vars[9].Name;
      ComboBox9.Visible:=true;

      main_form[9]:=Quantities.get_formula(LongVars[9].name);
      QuantitiesDervBox.ListUp(main_form[9],RelLists[9],num2);
      ComboBox9.Clear;

      ComboBox9.Text:='<Units>';
      ComboBox9.Items.Add('<Units>');
      for i:=2 to num2 do
          ComboBox9.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[9][i]));
    end;

  if Number>9 then
    begin
      Edit10.visible:=true;
      StaticText20.visible:=true;
      StaticText10.Caption:=Vars[10].Name;
      ComboBox10.Visible:=true;

      main_form[10]:=Quantities.get_formula(LongVars[10].name);
      QuantitiesDervBox.ListUp(main_form[10],RelLists[10],num2);
      ComboBox10.Clear;

      ComboBox10.Text:='<Units>';
      ComboBox10.Items.Add('<Units>');
      for i:=2 to num2 do
          ComboBox10.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelLists[10][i]));
    end;


end;

procedure TFormulaCalculatorBox.BoxFill;
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

procedure TFormulaCalculatorBox.FormShow(Sender: TObject);
begin

if mode=1 then
begin
  Label3.Show;
  ComboBox11.Hide;
  fill_mee(Formulas.ADOTable1.FieldValues['Name']);
end
else
if mode=2 then
begin
    ComboBox11.show;
    Label3.Hide;
    BoxFill;
end;
end;

procedure TFormulaCalculatorBox.Button2Click(Sender: TObject);
begin
  self.Hide;
end;

procedure TFormulaCalculatorBox.Button1Click(Sender: TObject);
label final;
var vn:byte;
    formu,qunit,stri:string;
begin
  variable:='';
  Err:=False;
  Formula:=self.Label1.Caption;
  FindVars(Formula,Vars,Number);
  memo1.clear;
  result:=0;

  if Edit1.Text='?' then
    begin
      variable:=Vars[1].name;
      Vars[1].name:='';
      Vars[1].value:=0;
      vn:=1;
      qunit:=ComboBox1.Text;
    end;

  if Edit2.Text='?' then
    begin
      if variable<>'' then
        begin
          MessageDlg(Strings[0],mtError,[mbOk],0);
          Err:=True;
        end
      else
        begin
          variable:=Vars[2].name;
          Vars[2].name:='';
          vn:=2;
          qunit:=ComboBox2.Text;
        end;
    end;

      if Edit3.Text='?' then
    begin
      if variable<>'' then
        begin
          MessageDlg(Strings[0],mtError,[mbOk],0);
          Err:=True;
        end
      else
        begin
          variable:=Vars[3].name;
          Vars[3].name:='';
          vn:=3;
          qunit:=ComboBox3.Text;
        end;
    end;

      if Edit4.Text='?' then
    begin
      if variable<>'' then
        begin
          MessageDlg(Strings[0],mtError,[mbOk],0);
          Err:=True;
        end
      else
        begin
          variable:=Vars[4].name;
          Vars[4].name:='';
          vn:=4;
          qunit:=ComboBox4.Text;
        end;
    end;

      if Edit5.Text='?' then
    begin
      if variable<>'' then
        begin
          MessageDlg(Strings[0],mtError,[mbOk],0);
          Err:=True;
        end
      else
        begin
          variable:=Vars[5].name;
          Vars[5].name:='';
          vn:=5;
          qunit:=ComboBox5.Text;
        end;
    end;

      if Edit6.Text='?' then
    begin
      if variable<>'' then
        begin
          MessageDlg(Strings[0],mtError,[mbOk],0);
          Err:=True;
        end
      else
        begin
          variable:=Vars[6].name;
          Vars[6].name:='';
          vn:=6;
          qunit:=ComboBox6.Text;
        end;
    end;

      if Edit7.Text='?' then
    begin
      if variable<>'' then
        begin
          MessageDlg(Strings[0],mtError,[mbOk],0);
          Err:=True;
        end
      else
        begin
          variable:=Vars[7].name;
          Vars[7].name:='';
          vn:=7;
          qunit:=ComboBox7.Text;
        end;
    end;

      if Edit8.Text='?' then
    begin
      if variable<>'' then
        begin
          MessageDlg(Strings[0],mtError,[mbOk],0);
          Err:=True;
        end
      else
        begin
          variable:=Vars[8].name;
          Vars[8].name:='';
          vn:=8;
          qunit:=ComboBox8.Text;
        end;
    end;

      if Edit9.Text='?' then
    begin
      if variable<>'' then
        begin
          MessageDlg(Strings[0],mtError,[mbOk],0);
          Err:=True;
        end
      else
        begin
          variable:=Vars[9].name;
          Vars[9].name:='';
          vn:=9;
          qunit:=ComboBox9.Text;
        end;
    end;

      if Edit10.Text='?' then
    begin
      if variable<>'' then
        begin
          MessageDlg(Strings[0],mtError,[mbOk],0);
          Err:=True;
        end
      else
        begin
          variable:=Vars[10].name;
          Vars[10].name:='';
          vn:=10;
          qunit:=ComboBox10.Text;
        end;
    end;

    if Err then Goto Final;

    Error.code:=0;
    Error.Message:='';
    Error.Position:=0;

    if Vars[1].name<>'' then
      begin
        if ComboBox1.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox1.text),main_form[1]);
        if formu='' then formu:='$main';
        Vars[1].value:=Calculate(StringReplace(formu,'$main',Edit1.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg(Strings[1]+vars[1].name+Strings[2],mtError,[mbOk],0);
            goto final;
          end;
      end;

    if Vars[2].name<>'' then
      begin
        if ComboBox2.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox2.text),main_form[2]);
        if formu='' then formu:='$main';
        Vars[2].value:=Calculate(StringReplace(formu,'$main',Edit2.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg(Strings[1]+vars[2].name+Strings[2],mtError,[mbOk],0);
            goto final;
          end;
      end;

   if Vars[3].name<>'' then
      begin
        if ComboBox3.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox3.text),main_form[3]);
        if formu='' then formu:='$main';
        Vars[3].value:=Calculate(StringReplace(formu,'$main',Edit3.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg(Strings[1]+vars[3].name+Strings[2],mtError,[mbOk],0);
            goto final;
          end;
      end;

    if Vars[4].name<>'' then
      begin
        if ComboBox4.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox4.text),main_form[4]);
        if formu='' then formu:='$main';
        Vars[4].value:=Calculate(StringReplace(formu,'$main',Edit4.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg(Strings[1]+vars[4].name+Strings[2],mtError,[mbOk],0);
            goto final;
          end;
      end;

    if Vars[5].name<>'' then
      begin
        if ComboBox5.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox5.text),main_form[5]);
        if formu='' then formu:='$main';
        Vars[5].value:=Calculate(StringReplace(formu,'$main',Edit5.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg(Strings[1]+vars[5].name+Strings[2],mtError,[mbOk],0);
            goto final;
          end;
      end;

    if Vars[6].name<>'' then
      begin
        if ComboBox6.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox6.text),main_form[6]);
        if formu='' then formu:='$main';
        Vars[6].value:=Calculate(StringReplace(formu,'$main',Edit6.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg(Strings[1]+vars[6].name+Strings[2],mtError,[mbOk],0);
            goto final;
          end;
      end;

    if Vars[7].name<>'' then
      begin
        if ComboBox7.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox7.text),main_form[7]);
        if formu='' then formu:='$main';
        Vars[7].value:=Calculate(StringReplace(formu,'$main',Edit7.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg(Strings[1]+vars[7].name+Strings[2],mtError,[mbOk],0);
            goto final;
          end;
      end;

    if Vars[8].name<>'' then
      begin
        if ComboBox8.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox8.text),main_form[8]);
        if formu='' then formu:='$main';
        Vars[8].value:=Calculate(StringReplace(formu,'$main',Edit8.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg(Strings[1]+vars[8].name+Strings[2],mtError,[mbOk],0);
            goto final;
          end;
      end;

    if Vars[9].name<>'' then
      begin
        if ComboBox9.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox9.text),main_form[9]);
        if formu='' then formu:='$main';
        Vars[9].value:=Calculate(StringReplace(formu,'$main',Edit9.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg(Strings[1]+vars[9].name+Strings[2],mtError,[mbOk],0);
            goto final;
          end;
      end;

    if Vars[10].name<>'' then
      begin
        if ComboBox10.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox10.text),main_form[10]);
        if formu='' then formu:='$main';
        Vars[10].value:=Calculate(StringReplace(formu,'$main',Edit10.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg(Strings[1]+vars[10].name+Strings[2],mtError,[mbOk],0);
            goto final;
          end;
      end;

result:=0;      
Express(variable,formula,History);
Delete(Formula,1,1+length(variable));
result:=Calculate(Formula,vars,Error);

    formu:=QuantitiesDervBox.TranslateQuantity(main_form[vn],QuantitiesDervBox.QuantityShortUnit(qunit));
    if formu='' then formu:='$main';
    str(result,stri);
    result:=calculate(StringReplace(formu,'$main',stri,[rfReplaceAll, rfIgnoreCase]),novars,Error);

{if error.code<>0 then
  begin
    str(error.Code,TempStr);
    MessageDlg('Calculation Error #'+TempStr+': '+Error.Message,mtError,[mbOk],0);
    goto final;
  end;}

i:=2;
TempStr:='';
while History[i]<>'' do
  begin
    Memo1.Lines.Add(History[i]);
    inc(i);
  end;
Memo1.Lines.Add('');  
TempStr:=format('%g',[result]);
Memo1.Lines.Add(variable+'='+TempStr+' '+qunit);
variable:='';

{for i:=1 to number do
  begin
    str(Vars[i].value,TempStr);
    Memo1.Lines.Add(Vars[i].name+'='+TempStr);
  end;}

Final:
end;

procedure TFormulaCalculatorBox.Label1DblClick(Sender: TObject);
begin
  EditDlg.Show;
  EditDlg.Edit1.Text:=Label1.Caption;
end;

procedure TFormulaCalculatorBox.FormActivate(Sender: TObject);
var text:string;
begin
//  if EditDlgUnit.HasText then self.FormShow(sender);
//  begin
  text:=label3.Caption;
  if pos(' <custom>',text)<=0 then text:=text+' <custom>';

  if EditDlgUnit.HasText then fill_mee(text)
end;

procedure TFormulaCalculatorBox.ComboBox11Change(Sender: TObject);
begin
  fill_mee(ComboBox11.Text);
end;

procedure TFormulaCalculatorBox.translate_form;
begin
  Label2.Caption:=GetWord('Operations','Operations')+':';
  Button1.Caption:=GetWord('Calculate','Calculate');
  Button2.Caption:=GetWord('Close','Close');
  self.Caption:=GetWord('FormulaCalculation','Formula Calculation');
  Strings[0]:=GetWord('ErrFmWU','In this version of the program you can have only one unknown quantity!');
  Strings[1]:=GetWord('ErrFmWV1','You have entered an illegal value for the quantity "');
  Strings[2]:=GetWord('ErrFmWV2','" ! Use the "?" symbol for the unknown quantity !');
end;
end.
