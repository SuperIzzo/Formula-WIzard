unit EditDlgUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan,TranslationUnit;

type
  TEditDlg = class(TForm)
    StaticText1: TStaticText;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure translate_form;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditDlg: TEditDlg;
  HasText: Boolean;
  return: string;

implementation

{$R *.dfm}

procedure TEditDlg.Button1Click(Sender: TObject);
begin
  return:=Edit1.Text;
  self.Hide;
end;

procedure TEditDlg.Button2Click(Sender: TObject);
begin
  return:='';
  self.Hide;
end;

procedure TEditDlg.FormHide(Sender: TObject);
begin
  if return<>'' then hastext:=true;
end;

procedure TEditDlg.translate_form;
begin
  Self.Caption:=GetWord('Editor','Editor');
  StaticText1.Caption:=GetWord('Formula','Formula')+':';
  Button1.Caption:=GetWord('Ok','Ok');
  Button2.Caption:=GetWord('Cancel','Cancel');
end;

end.
