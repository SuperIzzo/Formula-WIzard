unit UnitsDervUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,UnitsUnit, XPMan, translationunit;

type
  TUnitsDervBox = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    Label2: TLabel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox2: TComboBox;

    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure fill_mee(formu:string);
    procedure Label1DblClick(Sender: TObject);
    procedure BoxFill;
    procedure ComboBox2Change(Sender: TObject);
    procedure translate_form;
  private
    RelList:TURelList;
    unit_name:string;
    { Private declarations }
  public
    mode:byte;
    { Public declarations }
  end;

var
  UnitsDervBox: TUnitsDervBox;
  Strings:array[0..2] of String=('Path','Formula','Description');
implementation



{$R *.dfm}

procedure TUnitsDervBox.fill_mee;
var i:byte;
begin
  Label1.Caption:=formu+' ('+Units.get_short(formu)+')';
  Units.find_rel(formu,RelList,'','');
  unit_name:=formu;
  ComboBox1.Clear;
  Label2.Caption:='';
  memo1.Text:='';

  for i:=1 to RelList.num do
    ComboBox1.items.Add(RelList.Name[i]);
end;

procedure TUnitsDervBox.BoxFill;
var Book:String;
begin
  Book:=Units.AdoTable1.bookmark;
  Units.AdoTable1.First;
  ComboBox2.Text:=Units.ADOTable1.FieldValues['Name'];
  while not  Units.AdoTable1.Eof do
  begin
    ComboBox2.Items.Add(Units.ADOTable1.FieldValues['Name']);
    Units.ADOTable1.Next;
  end;
  Units.AdoTable1.bookmark:=Book;
end;

procedure TUnitsDervBox.FormShow(Sender: TObject);
var
    formu:string;
begin
  if mode=1 then
  begin
    ComboBox2.Hide;
    Label1.Show;
    formu:=Units.ADOTable1.FieldValues['Name'];
    fill_mee(formu);
  end
  else
  if mode=2 then
  begin
    ComboBox2.show;
    Label1.Hide;
    BoxFill;
  end;
end;

procedure TUnitsDervBox.ComboBox1Change(Sender: TObject);
var booki,maini:string;
begin
  booki:=Units.ADOTable1.Bookmark;
  memo1.Text:='';

  Units.ADOTable1.First;
  maini:=ComboBox1.Text;
  Label2.Caption:=RelList.Name[ComboBox1.ItemIndex+1]+' ('+Units.get_short(RelList.Name[ComboBox1.ItemIndex+1])+')';
  Memo1.Lines.Add(Strings[0]+': '+RelList.Path[ComboBox1.ItemIndex+1]);
  Memo1.Lines.Add(Strings[1]+': '+Unit_Name+'='+StringReplace(Units.trans_formula(RelList.Path[ComboBox1.ItemIndex+1]),'$main',RelList.Name[ComboBox1.ItemIndex+1],[rfReplaceAll]));


  while not Units.ADOTable1.Eof do
  begin
    if UpperCase(maini)=UpperCase(string(Units.ADOTable1.FieldValues['Name'])) then
    Memo1.Lines.Add(Strings[2]+': '+string(Units.ADOTable1.FieldValues['Description']));

    Units.ADOTable1.Next;
  end;
  {Do something!!
   Don't just stand there!!!}

  //Units.ADOTable1.Bookmark:=booki;
end;

procedure TUnitsDervBox.BitBtn2Click(Sender: TObject);
begin
  self.Hide;
end;

procedure TUnitsDervBox.BitBtn1Click(Sender: TObject);
var
  i:integer;
  name,formula,short,desc,
  mformula,mshort,mmain:string;
begin
  mshort:=Units.get_short(Unit_Name);
  mmain:=Units.get_main(Unit_Name);
  mformula:=Units.get_formula(Unit_Name);

  Units.ADOTable1.insert;
  Units.ADOTable1.EnableControls;

  for i:=1 to 20 do
  begin
      Case i of
        1:begin
            name:='Yocto'+lowercase(Unit_Name);
            formula:='$main*1000000000000000000000000';
            short:='y'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^-24 (one septillionth) of the '+Unit_Name;
          end;

        2:begin
            name:='Zepto'+lowercase(Unit_Name);
            formula:='$main*1000000000000000000000';
            short:='z'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^-21 (one sextillionth) of the '+Unit_Name;
          end;

        3:begin
            name:='Atto'+lowercase(Unit_Name);
            formula:='$main*1000000000000000000';
            short:='a'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^-18 (one quintillionth) of the '+Unit_Name;
          end;

        4:begin
            name:='Femto'+lowercase(Unit_Name);
            formula:='$main*1000000000000000';
            short:='f'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^-15 (one quadrillionth) of the '+Unit_Name;
          end;

        5:begin
            name:='Pico'+lowercase(Unit_Name);
            formula:='$main*1000000000000';
            short:='p'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^-12 (one trillionth) of the '+Unit_Name;
          end;

        6:begin
            name:='Nano'+lowercase(Unit_Name);
            formula:='$main*1000000000';
            short:='n'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^-9 (one billionth) of the '+Unit_Name;
          end;

        7:begin
            name:='Micro'+lowercase(Unit_Name);
            formula:='$main*1000000';
            short:='µ'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^-6 (one millionth) of the '+Unit_Name;
          end;

        8:begin
            name:='Milli'+lowercase(Unit_Name);
            formula:='$main*1000';
            short:='m'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^-3 (one thousandth) of the '+Unit_Name;
          end;

        9:begin
            name:='Centi'+lowercase(Unit_Name);
            formula:='$main*100';
            short:='c'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^-2 (one hundredth) of the '+Unit_Name;
          end;

        10:begin
            name:='Deci'+lowercase(Unit_Name);
            formula:='$main*10';
            short:='d'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^-1 (one tenth) of the '+Unit_Name;
          end;

        11:begin
            name:='Deca'+lowercase(Unit_Name);
            formula:='$main/10';
            short:='da'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^1 (ten) of the '+Unit_Name;
          end;

        12:begin
            name:='Hecto'+lowercase(Unit_Name);
            formula:='$main/100';
            short:='h'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^2 (hundred) of the '+Unit_Name;
          end;

        13:begin
            name:='Kilo'+lowercase(Unit_Name);
            formula:='$main/1000';
            short:='k'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^3 (thousand) of the '+Unit_Name;
          end;

        14:begin
            name:='Mega'+lowercase(Unit_Name);
            formula:='$main/1000000';
            short:='M'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^6 (million) of the '+Unit_Name;
          end;

        15:begin
            name:='Giga'+lowercase(Unit_Name);
            formula:='$main/1000000000';
            short:='G'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^9 (billion) of the '+Unit_Name;
          end;

        16:begin
            name:='Tera'+lowercase(Unit_Name);
            formula:='$main/1000000000000';
            short:='T'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^12 (trillion) of the '+Unit_Name;
          end;

        17:begin
            name:='Peta'+lowercase(Unit_Name);
            formula:='$main/1000000000000000';
            short:='P'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^15 (quadrillion) of the '+Unit_Name;
          end;

        18:begin
            name:='Exa'+lowercase(Unit_Name);
            formula:='$main/1000000000000000000';
            short:='E'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^18 (quintillion) of the '+Unit_Name;
          end;

        19:begin
            name:='Zetta'+lowercase(Unit_Name);
            formula:='$main/1000000000000000000000';
            short:='Z'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^21 (sextillion) of the '+Unit_Name;
          end;

        20:begin
            name:='Yotta'+lowercase(Unit_Name);
            formula:='$main/1000000000000000000000000';
            short:='Y'+mshort;
            desc:=name+' is one of the SI derived units for '+Unit_Name+'. Its abbreviation is '+short+'. 1 '+name+' equals 10^24 (septillion) of the '+Unit_Name;
          end;
      end;

      Units.ADOTable1.insert;
      Units.ADOTable1.EnableControls;

      Units.ADOTable1.FieldbyName('Name').value:=name;
      Units.ADOTable1.FieldByName('Short').value:=short;
      if Unit_Name=mmain then
      Units.ADOTable1.FieldByName('Formula').value:='$main*('+StringReplace(StringReplace(mformula,'$main','('+formula+')',[rfReplaceAll, rfIgnoreCase]),'$main','1',[rfReplaceAll, rfIgnoreCase])+')'
      else
      Units.ADOTable1.FieldByName('Formula').value:=formula;
      Units.ADOTable1.FieldByName('Main').value:=Unit_Name;
      Units.ADOTable1.FieldByName('Description').value:=desc;

      Units.ADOTable1.post;
  end;
  Units.ADOTable1.Bookmark:=RelList.book[ComboBox1.ItemIndex+1];
//  self.Hide;
end;

procedure TUnitsDervBox.Label1DblClick(Sender: TObject);
begin
   {don't erease me}
end;

procedure TUnitsDervBox.ComboBox2Change(Sender: TObject);
begin
  fill_mee(ComboBox2.Text);
end;

procedure TUnitsDervBox.translate_form;
begin
  Self.Caption:=StringReplace(GetWord('Derivatives','Derivatives'),'&','',[rfReplaceAll])+' ('+StringReplace(GetWord('Units','Units'),'&','',[rfReplaceAll])+')';
  BitBtn1.Caption:=GetWord('GenSI','Generate Si Standart');
  BitBtn2.Caption:=GetWord('Close','Close');
  Strings[0]:=GetWord('Path','Path');
  Strings[1]:=GetWord('Formula','Formula');
  Strings[2]:=GetWord('Description','Description');
end;

end.
