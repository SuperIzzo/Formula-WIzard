unit FormulaEditUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls,FormulasUnit, XPMan, translationunit;

type
  TFormulaEditBox = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure translate_form;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormulaEditBox: TFormulaEditBox;
  Strings:array[0..1] of String=('You must write in the field "Name" before you press the button "OK"!','You must write in the field "Formula" before you press the button "OK"!');
implementation

{$R *.DFM}

procedure TFormulaEditBox.Button1Click(Sender: TObject);
begin
Formulas.ADOTable1.EnableControls;
  If Edit1.text='' then MessageDlg(Strings[0],mtError,[mbOk],0)
    else
      if Edit2.text='' then MessageDlg(Strings[1],mtError,[mbOk],0)
        else
          begin

            if mode=1 then Formulas.ADOTable1.insert;
            if mode=2 then Formulas.ADOTable1.edit;
            
            Formulas.ADOTable1.FieldbyName('Name').value:=Edit1.text;
            Formulas.ADOTable1.FieldByName('Formula').value:=Edit2.text;
            Formulas.ADOTable1.FieldByName('Description').value:=Memo1.Text;
            Formulas.ADOTable1.post;

            mode:=0;
            Self.Hide;
          end;

end;


procedure TFormulaEditBox.Button2Click(Sender: TObject);
begin
  Self.Hide;
end;

procedure TFormulaEditBox.FormShow(Sender: TObject);
begin
           if mode=2 then
              begin
                Edit1.text:=Formulas.ADOTable1.FieldbyName('Name').asstring;
                Edit2.text:=Formulas.ADOTable1.FieldbyName('Formula').asstring;
                Memo1.text:=Formulas.ADOTable1.FieldbyName('Description').asstring;

              end;
            if mode=1 then
              begin
                Edit1.text:='';
                Edit2.text:='';
                Memo1.text:='';

              end;
            if mode=0 then exit;
end;

procedure TFormulaEditBox.translate_form;
begin
  label1.Caption:=GetWord('Name','Name')+':';
  label2.Caption:=GetWord('Formula','Formula')+':';
  label3.Caption:=GetWord('Description','Description')+':';
  Button1.Caption:=GetWord('Ok','Ok');
  Button2.Caption:=GetWord('Cancel','Cancel');
  Strings[0]:=GetWord('ErrFmNN','You must write in the field "Name" before you press the button "OK"!');
  Strings[1]:=GetWord('ErrFmNF','You must write in the field "Formula" before you press the button "OK"!');
end;

end.
