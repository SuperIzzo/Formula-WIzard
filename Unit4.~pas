unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,ECalc,EExpr, XPMan, TranslationUnit;

type
  TForm4 = class(TForm)
    var1: TEdit;
    val1: TEdit;
    StaticText1: TStaticText;
    var2: TEdit;
    val2: TEdit;
    var3: TEdit;
    val3: TEdit;
    var4: TEdit;
    val4: TEdit;
    var5: TEdit;
    val5: TEdit;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    var6: TEdit;
    val6: TEdit;
    var7: TEdit;
    val7: TEdit;
    var8: TEdit;
    val8: TEdit;
    var9: TEdit;
    val9: TEdit;
    var10: TEdit;
    val10: TEdit;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    Memo1: TMemo;
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
    StaticText21: TStaticText;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    StaticText24: TStaticText;
    StaticText25: TStaticText;
    Calc: TButton;
    Clear: TButton;
    Cancel: TButton;
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
    StaticText26: TStaticText;
    StaticText27: TStaticText;
    procedure CalcClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure varChange(Sender: TObject);
    procedure translate_form;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  main_form:array[1..10]of String;

implementation

uses FormulasUnit, QuantitiesDervUnit, QuantitiesUnit;

{$R *.DFM}


procedure TForm4.CalcClick(Sender: TObject);
var
   UVars:TVariables;
   FVars:TVariables;
   i,j:Word;
   loop1,loop2:Integer;
//   Err:Integer;
   VarName:String;
   Formula:String;
   counter:integer;
   History:THistory;
   Error:TError;
   TempStr:String;
   Result:real;
   FFound:integer;
   formu,qunit,stri:string;
   vn:word;

begin
i:=0;
FFound:=0;   

  if var1.text<>'' then
    if val1.text<>'?' then
      begin
        if ComboBox1.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox1.text),main_form[1]);
        if formu='' then formu:='$main';
        UVars[i+1].value:=Calculate(StringReplace(formu,'$main',Val1.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg('You have entered incorrect value for "'+Var1.text+'" !',mtError,[mbOk],0);
            exit;
          end
        else
          begin
            UVars[i+1].Name:=Var1.text;
            inc(i);
          end
      end
    else
      begin
        VarName:=Var1.text;
        qunit:=ComboBox1.Text;
        vn:=1;
      end;

{================ 2nd ===================}

  if Var2.text<>'' then
    if Val2.text<>'?' then
      begin
        if ComboBox2.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox2.text),main_form[2]);
        if formu='' then formu:='$main';
        UVars[i+1].value:=Calculate(StringReplace(formu,'$main',Val2.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg('You have entered incorrect value for "'+Var2.text+'" !',mtError,[mbOk],0);
            exit;
          end
        else
          begin
            UVars[i+1].Name:=Var2.text;
            inc(i);
          end
      end
    else
      if VarName='' then
      begin
        VarName:=Var2.text;
        qunit:=ComboBox2.Text;
        vn:=2;
      end
      else
        begin
          MessageDlg('In this version of the program you can only have one unknown quantity!',mtError,[mbOk],0);
          exit;
        end;

{========== 3rd ================}

  if Var3.text<>'' then
    if Val3.text<>'?' then
      begin
        if ComboBox3.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox3.text),main_form[3]);
        if formu='' then formu:='$main';
        UVars[i+1].value:=Calculate(StringReplace(formu,'$main',Val3.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg('You have entered incorrect value for "'+Var3.text+' !',mtError,[mbOk],0);
            exit;
          end
        else
          begin
            UVars[i+1].Name:=Var3.text;
            inc(i);
          end
      end
    else
      if VarName='' then
        begin
          VarName:=Var3.text;
          qunit:=ComboBox3.Text;
          vn:=3;
        end
      else
        begin
          MessageDlg('In this version of the program you can only have one unknown quantity!',mtError,[mbOk],0);
          exit;
        end;

{============= 4th ===============}

  if Var4.text<>'' then
    if Val4.text<>'?' then
      begin
        if ComboBox4.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox4.text),main_form[4]);
        if formu='' then formu:='$main';
        UVars[i+1].value:=Calculate(StringReplace(formu,'$main',Val4.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg('You have entered incorrect value for "'+Var4.text+' !',mtError,[mbOk],0);
            exit;
          end
        else
          begin
            UVars[i+1].Name:=Var4.text;
            inc(i);
          end
      end
    else
      if VarName='' then
      begin
        VarName:=Var4.text;
        qunit:=ComboBox4.Text;
        vn:=4;
      end
      else
        begin
          MessageDlg('In this version of the program you can only have one unknown quantity!',mtError,[mbOk],0);
          exit;
        end;

{============= 5th ===============}

  if Var5.text<>'' then
    if Val5.text<>'?' then
      begin
        if ComboBox5.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox5.text),main_form[5]);
        if formu='' then formu:='$main';
        UVars[i+1].value:=Calculate(StringReplace(formu,'$main',Val5.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg('You have entered incorrect value for "'+Var5.text+' !',mtError,[mbOk],0);
            exit;
          end
        else
          begin
            UVars[i+1].Name:=Var5.text;
            inc(i);
          end
      end
    else
      if VarName='' then
      begin
        VarName:=Var5.text;
        qunit:=ComboBox5.Text;
        vn:=5;
      end
      else
        begin
          MessageDlg('In this version of the program you can only have one unknown quantity!',mtError,[mbOk],0);
          exit;
        end;

{============= 6th ===============}

  if Var6.text<>'' then
    if Val6.text<>'?' then
      begin
        if ComboBox6.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox6.text),main_form[6]);
        if formu='' then formu:='$main';
        UVars[i+1].value:=Calculate(StringReplace(formu,'$main',Val6.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg('You have entered incorrect value for "'+Var6.text+' !',mtError,[mbOk],0);
            exit;
          end
        else
          begin
            UVars[i+1].Name:=Var6.text;
            inc(i);
          end
      end
    else
      if VarName='' then
      begin
        VarName:=Var6.text;
        qunit:=ComboBox6.Text;
        vn:=6;
      end
      else
        begin
          MessageDlg('In this version of the program you can only have one unknown quantity!',mtError,[mbOk],0);
          exit;
        end;

{============= 7th ===============}

  if Var7.text<>'' then
    if Val7.text<>'?' then
      begin
        if ComboBox7.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox7.text),main_form[7]);
        if formu='' then formu:='$main';
        UVars[i+1].value:=Calculate(StringReplace(formu,'$main',Val7.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg('You have entered incorrect value for "'+Var7.text+' !',mtError,[mbOk],0);
            exit;
          end
        else
          begin
            UVars[i+1].Name:=Var7.text;
            inc(i);
          end
      end
    else
      if VarName='' then
      begin
        VarName:=Var7.text;
        qunit:=ComboBox7.Text;
        vn:=7;
      end
      else
        begin
          MessageDlg('In this version of the program you can only have one unknown quantity!',mtError,[mbOk],0);
          exit;
        end;

{============= 8th ===============}

  if Var8.text<>'' then
    if Val8.text<>'?' then
      begin
        if ComboBox8.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox8.text),main_form[8]);
        if formu='' then formu:='$main';
        UVars[i+1].value:=Calculate(StringReplace(formu,'$main',Val8.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg('You have entered incorrect value for "'+Var8.text+' !',mtError,[mbOk],0);
            exit;
          end
        else
          begin
            UVars[i+1].Name:=Var8.text;
            inc(i);
          end
      end
    else
      if VarName='' then
      begin
        VarName:=Var8.text;
        qunit:=ComboBox8.Text;
        vn:=8;
      end
      else
        begin
          MessageDlg('In this version of the program you can only have one unknown quantity!',mtError,[mbOk],0);
          exit;
        end;

{============= 9th ===============}

  if Var9.text<>'' then
    if Val9.text<>'?' then
      begin
        if ComboBox9.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox9.text),main_form[9]);
        if formu='' then formu:='$main';
        UVars[i+1].value:=Calculate(StringReplace(formu,'$main',Val9.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg('You have entered incorrect value for "'+Var9.text+' !',mtError,[mbOk],0);
            exit;
          end
        else
          begin
            UVars[i+1].Name:=Var9.text;
            inc(i);
          end
      end
    else
      if VarName='' then
      begin
        VarName:=Var9.text;
        qunit:=ComboBox9.Text;
        vn:=9;
      end
      else
        begin
          MessageDlg('In this version of the program you can only have one unknown quantity!',mtError,[mbOk],0);
          exit;
        end;

{============= 10th ===============}

  if Var10.text<>'' then
    if Val10.text<>'?' then
      begin
        if ComboBox10.text='<Units>' then formu:='$main' else
          formu:=QuantitiesDervBox.TranslateQuantity(QuantitiesDervBox.QuantityShortUnit(ComboBox10.text),main_form[10]);
        if formu='' then formu:='$main';
        UVars[i+1].value:=Calculate(StringReplace(formu,'$main',Val10.Text,[rfReplaceAll, rfIgnoreCase]),novars ,Error);
        if Error.Code<>0 then
          begin
            MessageDlg('You have entered incorrect value for "'+Var10.text+' !',mtError,[mbOk],0);
            exit;
          end
        else
          begin
            UVars[i+1].Name:=Var10.text;
            inc(i);
          end
      end
    else
      if VarName='' then
      begin
        VarName:=Var10.text;
        qunit:=ComboBox10.Text;
        vn:=10;
      end
      else
        begin
          MessageDlg('In this version of the program you can only have one unknown quantity!',mtError,[mbOk],0);
          exit;
        end;

if VarName='' then
  begin
    MessageDlg('In this version of the program you can have only one unknown quantity!',mtError,[mbOk],0);
    exit;
  end;

Formulas.ADOTable1.First;

with Formulas.ADOTable1 do
  while not EOF do
    begin
      Formula:=FieldByName('Formula').AsString;
      FindVars(formula,FVars,j);
      if j<=i+1 then
        begin
          counter:=0;
          for loop1:=1 to i do
            for loop2:=1 to j do
              if UVars[loop1].Name=FVars[loop2].name then inc(counter);
          if (counter>=j-1)and(inside(VarName,Formula,1,length(formula))) then
            begin
              FFound:=FFound+1;
              if FFound=1 then
                 Memo1.Lines.Add('One formula found:')
              else
                Memo1.Lines.Add('There is also another formula found:');
              Memo1.Lines.Add('');
              Express(VarName,Formula,History);
              system.delete(formula,1,Length(VarName)+1);
              result:=Calculate(formula,UVars,Error);

                formu:=QuantitiesDervBox.TranslateQuantity(main_form[vn],QuantitiesDervBox.QuantityShortUnit(qunit));
                if formu='' then formu:='$main';
                str(result,stri);
                result:=calculate(StringReplace(formu,'$main',stri,[rfReplaceAll, rfIgnoreCase]),novars,Error);

              loop1:=2;
              TempStr:='';
              while History[loop1]<>'' do
                begin
                  Memo1.Lines.Add(History[loop1]);
                  inc(loop1);
                end;
              Str(result:8:3,TempStr);
              Memo1.Lines.Add(VarName+'='+TempStr+' '+qunit);
              Memo1.Lines.Add('____________________________________');
              Memo1.Lines.Add('');


            end;
        end;
        Next;
end;
if FFound=0 then
  Memo1.Lines.Add('No formula could be found:');


end;

procedure TForm4.CancelClick(Sender: TObject);
begin
  self.hide;
end;



procedure TForm4.ClearClick(Sender: TObject);
begin
  Var1.text:='';
  Val1.Text:='';
  Var2.text:='';
  Val2.Text:='';
  Var3.text:='';
  Val3.Text:='';
  Var4.text:='';
  Val4.Text:='';
  Var5.text:='';
  Val5.Text:='';
  Var6.text:='';
  Val6.Text:='';
  Var7.text:='';
  Val7.Text:='';
  Var8.text:='';
  Val8.Text:='';
  Var9.text:='';
  Val9.Text:='';
  Var10.text:='';
  Val10.Text:='';
  Memo1.Clear;
end;

procedure TForm4.varChange(Sender: TObject);
var pname,pval:string;
    combox:^TComboBox;
    RelList:array[0..1000] of string;
    num2,i,num:word;
begin
  pname:=(TEdit(Sender)).Name;
  pval:=(TEdit(Sender)).Text;

  Combox:=nil;

  if pname = 'var1' then begin Combox:=@ComboBox1; num:=1; end else
  if pname = 'var2' then begin Combox:=@ComboBox2; num:=2; end else
  if pname = 'var3' then begin Combox:=@ComboBox3; num:=3; end else
  if pname = 'var4' then begin Combox:=@ComboBox4; num:=4; end else
  if pname = 'var5' then begin Combox:=@ComboBox5; num:=5; end else
  if pname = 'var6' then begin Combox:=@ComboBox6; num:=6; end else
  if pname = 'var7' then begin Combox:=@ComboBox7; num:=7; end else
  if pname = 'var8' then begin Combox:=@ComboBox8; num:=8; end else
  if pname = 'var9' then begin Combox:=@ComboBox9; num:=9; end else
  if pname = 'var10' then begin Combox:=@ComboBox10; num:=1; end else exit;

  main_form[num]:=Quantities.get_formula(Quantities.name_by_short(pval));
  QuantitiesDervBox.ListUp(main_form[num],
                           RelList,num2);
  Combox.Clear;
  Combox.Text:='<Units>';
  Combox.Items.Add('<Units>');

  for i:=1 to num2-1 do
  Combox.Items.Add(QuantitiesDervBox.QuantityUnitShort(RelList[i]))
end;

procedure TForm4.translate_form;
begin
  StaticText21.Caption:=GetWord('Quantity','Quantity');
  StaticText23.Caption:=GetWord('Quantity','Quantity');
  StaticText22.Caption:=GetWord('Value','Value');
  StaticText24.Caption:=GetWord('Value','Value');
  StaticText25.Caption:=GetWord('Operations','Operations')+':';
  StaticText26.Caption:=GetWord('Unit','Unit');
  StaticText27.Caption:=GetWord('Unit','Unit');
  Calc.Caption:=GetWord('Calculate','Calculate');
  Clear.Caption:=GetWord('Clear','Clear');
  Cancel.Caption:=GetWord('Close','Close');
end;
end.                   
