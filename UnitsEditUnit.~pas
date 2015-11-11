unit UnitsEditUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, XPMan, translationunit;

type
  TUnitsEditBox = class(TForm)

    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit5: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Label5: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure translate_form;
  private
    { Private declarations }
  public
     Mode: Integer;
    { Public declarations }
  end;

var
  UnitsEditBox: TUnitsEditBox;
  Strings:array[0..4] of String=('Formula',
                                 'You must fill in the field "Name" before you press the button "OK"!',
                                 'You must fill in the field "Sign" before you press the button "OK"!',
                                 'You must fill in the field "Formula" before you press the button "OK"!',
                                 'You must fill in the field "Main Unit" before you press the button "OK"!');
implementation

uses UnitsUnit;

{$R *.dfm}

procedure TUnitsEditBox.FormShow(Sender: TObject);
var booki:string;
begin
  ComboBox1.Clear;
  booki:=Units.ADOTable1.Bookmark;
  Units.ADOTable1.First;
  while not Units.ADOTable1.Eof do
  begin
    ComboBox1.items.add(string(Units.ADOTable1.FieldValues['Name']));
    Units.ADOTable1.Next;
  end;
  Units.ADOTable1.Bookmark:=booki;

  if mode=2 then
  begin
    ComboBox1.Text:=string(Units.ADOTable1.FieldValues['Main']);
    Edit1.Text:=string(Units.ADOTable1.FieldValues['Name']);
    Edit2.Text:=string(Units.ADOTable1.FieldValues['Short']);
    Edit5.Text:=string(Units.ADOTable1.FieldValues['Formula']);
    Memo1.Text:=string(Units.ADOTable1.FieldValues['Description']);
  end
  else
  begin
    ComboBox1.Text:='';
    Edit1.Text:='';
    Edit2.Text:='';
    Edit5.Text:=Strings[0];
    Memo1.Text:='';
  end;
end;

procedure TUnitsEditBox.Button1Click(Sender: TObject);
begin

    If Edit1.text='' then MessageDlg(Strings[1],mtError,[mbOk],0)
    else
    if Edit2.text='' then MessageDlg(Strings[2],mtError,[mbOk],0)
    else
    if Edit5.text='' then MessageDlg(Strings[3],mtError,[mbOk],0)
    else
    if ComboBox1.text='' then MessageDlg(Strings[4],mtError,[mbOk],0)
    else
    begin
      if mode=1 then Units.ADOTable1.insert;
      if mode=2 then Units.ADOTable1.Edit;
      
      Units.ADOTable1.EnableControls;

      Units.ADOTable1.FieldbyName('Name').value:=Edit1.text;
      Units.ADOTable1.FieldByName('Short').value:=Edit2.text;
      Units.ADOTable1.FieldByName('Formula').value:=Edit5.text;
      Units.ADOTable1.FieldByName('Main').value:=ComboBox1.text;
      Units.ADOTable1.FieldByName('Description').value:=Memo1.Text;
      Units.ADOTable1.post;
      mode:=0;
      Self.Hide;
    end;
end;

procedure TUnitsEditBox.Button2Click(Sender: TObject);
begin
  Self.Hide;
end;

procedure TUnitsEditBox.translate_form;
begin
  Label1.Caption:=GetWord('Name','Name')+':';
  Label2.Caption:=GetWord('Sign','Sign')+':';
  Label4.Caption:=GetWord('Main','Main')+':';
  Label5.Caption:=GetWord('Description','Description')+':';
  Button1.Caption:=GetWord('Ok','Ok');
  Button2.Caption:=GetWord('Cancel','Cancel');
  Strings[0]:=GetWord('Formula','Formula');
  Strings[1]:=GetWord('ErrUnNN','You must fill in the field "Name" before you press the button "OK"!');
  Strings[2]:=GetWord('ErrUnNS','You must fill in the field "Sign" before you press the button "OK"!');
  Strings[3]:=GetWord('ErrUnNF','You must fill in the field "Formula" before you press the button "OK"!');
  Strings[4]:=GetWord('ErrUnNM','You must fill in the field "Main Unit" before you press the button "OK"!');
end;  

end.
