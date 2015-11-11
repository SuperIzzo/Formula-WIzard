unit QuantitiesEditUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, translationunit;

type
  TQuantitiesEditBox = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure translate_form;
  private
    { Private declarations }
  public
    mode:byte;
    { Public declarations }
  end;

var
  QuantitiesEditBox: TQuantitiesEditBox;
  Strings:array[0..2] of String=('You must fill in the field "Name" before you press the button "OK"!','You must fill in the field "Short" before you press the button "OK"!','You must fill in the field "Formula" before you press the button "OK"!');

implementation

uses QuantitiesUnit;

{$R *.dfm}

procedure TQuantitiesEditBox.FormShow(Sender: TObject);
var booki:string;
begin
//  ComboBox1.Clear;
{  booki:=Quantities.ADOTable1.Bookmark;
  Quantities.ADOTable1.First;
  while not Quantities.ADOTable1.Eof do
  begin
    ComboBox1.items.add(string(Quantities.ADOTable1.FieldValues['Name']));
    Quantities.ADOTable1.Next;
  end;
  Quantities.ADOTable1.Bookmark:=booki;}

  if mode=2 then
  begin
    Edit1.Text:=string(Quantities.ADOTable1.FieldValues['Name']);
    Edit2.Text:=string(Quantities.ADOTable1.FieldValues['Short']);
    Edit3.Text:=string(Quantities.ADOTable1.FieldValues['Unit']);
    Memo1.Text:=string(Quantities.ADOTable1.FieldValues['Description']);
  end
  else
  begin
//    ComboBox1.Text:='';
    Edit1.Text:='';
    Edit2.Text:='';
    Edit3.Text:='Unit/s';
    Memo1.Text:='';
  end;
end;

procedure TQuantitiesEditBox.Button1Click(Sender: TObject);
begin

    If Edit1.text='' then MessageDlg(Strings[0],mtError,[mbOk],0)
    else
    if Edit2.text='' then MessageDlg(Strings[1],mtError,[mbOk],0)
    else
    if Edit3.text='' then MessageDlg(Strings[2],mtError,[mbOk],0)
    else
    begin
      if mode=1 then Quantities.ADOTable1.insert;
      if mode=2 then Quantities.ADOTable1.Edit;
      
      Quantities.ADOTable1.EnableControls;

      Quantities.ADOTable1.FieldbyName('Name').value:=Edit1.text;
      Quantities.ADOTable1.FieldByName('Short').value:=Edit2.text;
      Quantities.ADOTable1.FieldByName('Unit').value:=Edit3.text;
      Quantities.ADOTable1.FieldByName('Description').value:=Memo1.Text;
      Quantities.ADOTable1.post;
      mode:=0;
      Self.Hide;
    end;
end;

procedure TQuantitiesEditBox.Button2Click(Sender: TObject);
begin
  self.hide;
end;

procedure TQuantitiesEditBox.translate_form;
begin
  label1.Caption:=GetWord('Name','Name')+':';
  label2.Caption:=GetWord('Short','Short')+':';
  Button1.Caption:=GetWord('Ok','Ok');
  Button2.Caption:=GetWord('Cancel','Cancel');
  Strings[0]:=GetWord('ErrQtNN','You must fill in the field "Name" before you press the button "OK"!');
  Strings[1]:=GetWord('ErrQtNS','You must fill in the field "Short" before you press the button "OK"!');
  Strings[2]:=GetWord('ErrQtNS','You must fill in the field "Formula" before you press the button "OK"!');
end;
end.
