unit ImportPackageUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ExtCtrls, Packages,translationunit;

type
  TImportPackageBox = class(TForm)
    CheckListBox1: TCheckListBox;
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Memo1: TMemo;
    Label6: TLabel;
    procedure Button5Click(Sender: TObject);
    procedure Button5Click2(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure CheckListBox1ClickCheck(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure translate_form;
    procedure CheckListBox1Click(Sender: TObject);
    procedure FillBox;
  private
    { Private declarations }
  public
    Pack   : TPack;
    mode   : (importing=1,exporting=2);
    { Public declarations }
  end;

var
  ImportPackageBox: TImportPackageBox;
  Strings:Array[0..16] of String=('Open Package...','Data','Name','Short','Sign','Main','Formula','Description','Unit','Quantity','Case','Import Packages','Export Packages','Open','Export','Import','Load');

implementation

uses DesktopUnit;

{$R *.dfm}

procedure TImportPackageBox.Button5Click(Sender: TObject);
  var openDialog:TOpenDialog;
begin

  openDialog := TOpenDialog.Create(self);
  openDialog.Title:=Strings[0];
  openDialog.InitialDir:= DesktopUnit.ddir;
  openDialog.Filter:='PFD Package File|*.pfp';
  openDialog.DefaultExt:='pfp';
  openDialog.FilterIndex:=1;

  if openDialog.Execute then
  if fileExists(openDialog.FileName) then
  begin
    Pack.OpenPackageFile(openDialog.FileName,fmOpenRead);
    Pack.ReadUp;
    Pack.ClosePackageFile;
    Pack.SelectAll;
    FillBox;
  end;
end;

procedure TImportPackageBox.Button5Click2(Sender: TObject);
  var saveDialog:TSaveDialog;
      i:Integer;
begin

  saveDialog := TSaveDialog.Create(self);
  saveDialog.Title:=Strings[0];
  saveDialog.InitialDir:= DesktopUnit.ddir;
  saveDialog.Filter:='PFD Package File|*.pfp';
  saveDialog.DefaultExt:='pfp';
  saveDialog.FilterIndex:=1;

  if saveDialog.Execute then
  begin
    Pack.OpenPackageFile(saveDialog.FileName,fmOpenCreate);
    Pack.WriteSelected;
    Pack.ClosePackageFile;
  end;
end;

procedure TImportPackageBox.FormCreate(Sender: TObject);
begin
  Pack.Create;
end;

procedure TImportPackageBox.FormDestroy(Sender: TObject);
begin
  Pack.Destroy;
end;

procedure TImportPackageBox.Button2Click(Sender: TObject);
begin
  self.Hide;
end;

procedure TImportPackageBox.FormShow(Sender: TObject);
begin
  CheckListBox1.Clear;
  Pack.Clear;
  Label2.Caption:=Strings[1]+':';
  Label1.Caption:=Strings[2]+':';
  Label3.Caption:=Strings[4]+':';
  Label5.Caption:=Strings[5]+':';
  Label4.Caption:=Strings[6]+':';
  Label6.Caption:=Strings[7]+':';
  Memo1.Top:=104;
  Memo1.Height:=105;
  Memo1.Clear;

  if mode=importing then
  begin
    caption:=Strings[11];
    Button5.Caption:=Strings[13];
    Button5.OnClick:=self.Button5Click;
    Button1.Caption:=Strings[15];
  end
  else
  begin
    caption:=Strings[12];
    Button5.Caption:=Strings[14];
    Button5.OnClick:=self.Button5Click2;
    Button1.Caption:=Strings[16];
  end;
end;

procedure TImportPackageBox.Button6Click(Sender: TObject);
begin
  Pack.Clear;
  CheckListBox1.Clear;
end;

procedure TImportPackageBox.CheckListBox1ClickCheck(Sender: TObject);
begin
  Pack.SetSelected(CheckListBox1.ItemIndex,CheckListBox1.Checked[CheckListBox1.ItemIndex]);
end;

procedure TImportPackageBox.Button1Click(Sender: TObject);
begin
  if mode=importing then
    begin
      if Pack.ImportSelected then Desktop.SetChange('',true);
    end
  else
    begin
      Pack.LoadDataBase;
      Pack.SelectAll;
      FillBox;
    end;
end;

procedure TImportPackageBox.Button3Click(Sender: TObject);
var i:integer;
begin
  Pack.SelectAll;
  for i:=0 to Pack.LastDataField do CheckListBox1.Checked[i]:=true;
end;

procedure TImportPackageBox.Button4Click(Sender: TObject);
var i:integer;
begin
  Pack.SelectNone;
  for i:=0 to Pack.LastDataField do CheckListBox1.Checked[i]:=false;
end;

procedure TImportPackageBox.translate_form;
begin

  Button6.Caption:=GetWord('Clear','Clear');
  Button1.Caption:=GetWord('Import','Import');
  Button2.Caption:=GetWord('Close','Close');
  Button3.Caption:=GetWord('SelectAll','Select All');
  Button4.Caption:=GetWord('SelectNone','SelectNone');
  Strings[0]:=GetWord('OpenPackage','Open Package')+'...';
  Strings[1]:=GetWord('Data','Data');
  Strings[2]:=GetWord('Name','Name');
  Strings[3]:=GetWord('Short','Short');
  Strings[4]:=GetWord('Sign','Sign');
  Strings[5]:=GetWord('Main','Main');
  Strings[6]:=GetWord('Formula','Formula');
  Strings[7]:=GetWord('Description','Description');
  Strings[8]:=GetWord('Unit','Unit');
  Strings[9]:=GetWord('Quantity','Quantity');
  Strings[10]:=GetWord('Case','Case');
  Strings[11]:=GetWord('ImpPack','Import Packages');
  Strings[12]:=GetWord('ExpPack','Export Packages');
  Strings[13]:=GetWord('Open','Open');
  Strings[14]:=GetWord('Export','Export');
  Strings[15]:=GetWord('Import','Import');
  Strings[16]:=GetWord('Load','Load');

  if mode=importing then
  begin
    caption:=Strings[11];
    Button5.Caption:=Strings[13];
    Button1.Caption:=Strings[15];
  end
  else
  begin
    caption:=Strings[12];
    Button5.Caption:=Strings[14];
    Button1.Caption:=Strings[16];
  end;
//  self.CheckListBox1Click(self);
  //  ('Open Package...','Data','Name','Short','Sign','Main','Formula','Description');
end;


procedure TImportPackageBox.CheckListBox1Click(Sender: TObject);
begin
  Case Pack.DataList[CheckListBox1.ItemIndex].DType of
    dtUnit:
      begin
        Label2.Caption:=Strings[1]+': '+Strings[8];
        Label1.Caption:=Strings[2]+': '+Pack.DataList[CheckListBox1.ItemIndex].Name;
        Label3.Caption:=Strings[4]+': '+Pack.DataList[CheckListBox1.ItemIndex].Sign;
        Label5.Caption:=Strings[5]+': '+Pack.DataList[CheckListBox1.ItemIndex].Main;
        Label4.Caption:=Strings[6]+': '+Pack.DataList[CheckListBox1.ItemIndex].Formula;
        Label6.Caption:=Strings[7]+':';
        Memo1.Top:=104;
        Memo1.Height:=105;
        Memo1.Text:=Pack.DataList[CheckListBox1.ItemIndex].Description;
      end;
    dtQuantity:
      begin
        Label2.Caption:=Strings[1]+': '+Strings[9];
        Label1.Caption:=Strings[2]+': '+Pack.DataList[CheckListBox1.ItemIndex].Name;
        Label3.Caption:=Strings[3]+': '+Pack.DataList[CheckListBox1.ItemIndex].Sign;
        Label5.Caption:=Strings[8]+': '+Pack.DataList[CheckListBox1.ItemIndex].Formula;
        Label4.Caption:=Strings[7]+':';
        Memo1.Top:=88;
        Memo1.Height:=121;
        Memo1.Text:=Pack.DataList[CheckListBox1.ItemIndex].Description;
      end;
    dtFormula:
      begin
        Label2.Caption:=Strings[1]+': '+Strings[6];
        Label1.Caption:=Strings[2]+': '+Pack.DataList[CheckListBox1.ItemIndex].Name;
        Label3.Caption:=Strings[6]+': '+Pack.DataList[CheckListBox1.ItemIndex].Formula;
        Label5.Caption:=Strings[10]+': '+Pack.DataList[CheckListBox1.ItemIndex].CUse;
        Label4.Caption:=Strings[7]+':';
        Memo1.Top:=88;
        Memo1.Height:=121;
        Memo1.Text:=Pack.DataList[CheckListBox1.ItemIndex].Description;
      end;
  end;    
end;

procedure TImportPackageBox.FillBox;
var i:integer;
begin
    CheckListBox1.Clear;
    For i:=0 to Pack.LastDataField do
    begin
      CheckListBox1.Items.Add(Pack.DataList[i].Name);
      CheckListBox1.Checked[i]:=Pack.Selected[i];
    end;
end;

end.
