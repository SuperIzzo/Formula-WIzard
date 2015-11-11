unit SettingsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls,INIFiles,DesktopUnit,extDlgs,
  TranslationUnit,FileCtrl;

type
  TSettingsBox = class(TForm)
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    PageControl1: TPageControl;
    AppSetPG: TTabSheet;
    Label2: TLabel;
    Label1: TLabel;
    Edit2: TEdit;
    Button4: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Button1: TButton;
    Label3: TLabel;
    ComboBox1: TComboBox;
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure translate_form;
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SettingsBox: TSettingsBox;
  IniFile : TIniFile;
  done:boolean;

  procedure LoadSettings;
  procedure SaveSettings;
  procedure StartUp;

implementation

{$R *.dfm}

procedure StartUp;
begin
  if done=false then
  begin
    IniFile := TIniFile.Create(DesktopUnit.working_directory+'\settings.ini');
    done:=true;
  end;
end;

procedure LoadSettings;
var i,fin:integer;
begin
  DesktopUnit.temp_dir:=    IniFile.ReadString('Directories','TempDirectory',DesktopUnit.working_directory+'\Default Data\Tmp');
  if not DirectoryExists(temp_dir) then temp_dir:=Working_directory+'\Default Data\Tmp';

  DesktopUnit.lastnum:=     IniFile.ReadInteger('Files','RecentNum',6);
  SetLength(lastname,lastnum);
  fin:=DesktopUnit.lastnum-1;

  For i:=0 to fin do
  DesktopUnit.lastname[i]:= IniFile.ReadString('Files','LastFile'+IntToStr(i),'<None>');
  DesktopUnit.hasclosed:=   IniFile.ReadBool  ('Files','HasClosed',true);
  DesktopUnit.lucd:=        IniFile.ReadBool  ('Files','LoadUE',DesktopUnit.lucd);
  DesktopUnit.lmru:=        IniFile.ReadBool  ('Files','LoadMR',DesktopUnit.lmru);

  DesktopUnit.img:=         IniFile.ReadString  ('Desktop','Image',img);
  Desktop.Left:=            IniFile.ReadInteger ('Desktop','Left',Desktop.Left);
  Desktop.Top:=             IniFile.ReadInteger ('Desktop','Top',Desktop.Top);
  Desktop.Width:=           IniFile.ReadInteger ('Desktop','Width',Desktop.Width);
  Desktop.Height:=          IniFile.ReadInteger ('Desktop','Height',Desktop.Height);

  DesktopUnit.lname:=       IniFile.ReadString('Language','Language','');
  DesktopUnit.lang:=        IniFile.ReadString('Language','LangFile','');

  if DesktopUnit.lastname[0]<>'<None>' then DesktopUnit.dfull:=DesktopUnit.lastname[0];
//  if DesktopUnit.img<>'' then
  if FileExists(img) then
    Desktop.Image1.Picture.LoadFromFile(DesktopUnit.img)
  else img:='';

  ChangeLanguage(lang);

end;

procedure SaveSettings;
var i,fin:integer;
begin
  IniFile.WriteString('Directories','TempDirectory',DesktopUnit.temp_dir);
  
  IniFile.WriteString('Language','Language',Lname);
  IniFile.WriteString('Language','LangFile',Lang);
  
  IniFile.WriteInteger('Files','RecentNum',DesktopUnit.lastnum);

  fin:=High(DesktopUnit.lastname);
  if fin>DesktopUnit.lastnum-1 then fin:=DesktopUnit.lastnum-1;

  For i:=0 to fin do
    IniFile.WriteString('Files','LastFile'+inttostr(i),lastname[i]);

    //IniFile.WriteString('Files','LastFile',working_directory+'\Default Data\Formulas.mdb');

  IniFile.WriteBool('Files','HasClosed',false);
  IniFile.WriteBool('Files','LoadUE',DesktopUnit.lucd);
  IniFile.WriteBool('Files','LoadMR',DesktopUnit.lmru);

  IniFile.WriteString  ('Desktop','Image',img);
  IniFile.WriteInteger ('Desktop','Left',Desktop.Left);
  IniFile.WriteInteger ('Desktop','Top',Desktop.Top);
  IniFile.WriteInteger ('Desktop','Width',Desktop.Width);
  IniFile.WriteInteger ('Desktop','Height',Desktop.Height);
end;  

procedure TSettingsBox.Button3Click(Sender: TObject);
begin
  Self.Hide;
end;

procedure TSettingsBox.FormCreate(Sender: TObject);
begin
  StartUp
end;

procedure TSettingsBox.Button1Click(Sender: TObject);
var openDialog:TOpenPictureDialog;
begin

  openDialog := TOpenPictureDialog.Create(self);
  openDialog.Title:='Open...';
  openDialog.InitialDir:= DesktopUnit.ddir;
  openDialog.Filter:='Bitmap Image|*.bmp|JPEG|*.jpg|Animated GIF|*gif|All|*.*';
  openDialog.DefaultExt:='*';
  openDialog.FilterIndex:=4;

  if openDialog.Execute then
  begin
    Edit1.Text:=openDialog.FileName;
  end;
end;

procedure TSettingsBox.Button5Click(Sender: TObject);
var i:integer;
begin
  DesktopUnit.img:=Edit1.Text;
  DesktopUnit.temp_dir:=Edit2.Text;
  DesktopUnit.lmru:=CheckBox1.Checked;
  DesktopUnit.lucd:=CheckBox2.Checked;

  Lname:='';
  Lang:='';

  for i:=0 to ComboBox1.Items.Count-1 do
  begin
    if ComboBox1.Text=ComboBox1.Items[i] then
    begin
      Lname:=ComboBox1.Text;
      Lang:=Langs[i].path;
      break;
    end;
  end;    


  SaveSettings;
  LoadSettings;
end;

procedure TSettingsBox.Button2Click(Sender: TObject);
begin
  Button5Click(Sender);
  self.Hide;
end;

procedure TSettingsBox.FormShow(Sender: TObject);
var i:integer;
begin
  Edit1.Text:=DesktopUnit.img;
  Edit2.Text:=temp_dir;
  CheckBox1.Checked:=lmru;
  CheckBox2.Checked:=lucd;

  ComboBox1.Clear;

  ScanLanguages;
  for i:=Low(Langs) to High(Langs) do
  ComboBox1.Items.Add(Langs[i].name);

  ComboBox1.Text:=Lname;

end;

procedure TSettingsBox.translate_form;
begin
  self.Caption:=StringReplace(GetWord('Settings','Settings'),'&','',[rfReplaceAll]);
  AppSetPG.Caption:=GetWord('General','General');
  Label1.Caption:=GetWord('DskImg','Desktop Image');
  Label2.Caption:=GetWord('TmpDir','Temp Directory');
  Label3.Caption:=GetWord('Lng','Language');
  CheckBox1.Caption:=GetWord('LmruDB','Load most recently used database on startup');
  CheckBox2.Caption:=GetWord('LucDB','Load unexpectedly closed database');
  Button2.Caption:=GetWord('Ok','Ok');
  Button5.Caption:=GetWord('Apply','Apply');
  Button3.Caption:=GetWord('Cancel','Cancel');
  Button1.Caption:=GetWord('Browse','Browse');
  Button4.Caption:=GetWord('Browse','Browse');
  
end;

procedure TSettingsBox.Button4Click(Sender: TObject);
var dir:string;
begin
  dir:=temp_dir;
     if SelectDirectory(
        dir,
        [sdAllowCreate,
        sdPerformCreate,
        sdPrompt],
        0
      ) then Edit2.Text:=dir;
end;

end.
