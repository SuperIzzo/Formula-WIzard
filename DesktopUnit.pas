unit DesktopUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, ExtCtrls, ActnList, Menus, StdCtrls,ShellAPI, ComCtrls,OPConvert,
  XPMan,TranslationUnit;

type
  TDesktop = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    ActionList1: TActionList;
    Calc: TAction;
    Edit: TAction;
    About: TAction;
    Calculator: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    Exit: TAction;
    N10: TMenuItem;
    Quantities1: TMenuItem;
    Units1: TMenuItem;
    Add1: TMenuItem;
    Edit1: TMenuItem;
    Derivatives1: TMenuItem;
    ranslate1: TMenuItem;
    Add2: TMenuItem;
    Inspect1: TMenuItem;
    Derivatives2: TMenuItem;
    ranslate2: TMenuItem;
    Add3: TMenuItem;
    Inspect2: TMenuItem;
    Derivatives3: TMenuItem;
    Calculate1: TMenuItem;
    Chart1: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    Options1: TMenuItem;
    XPManifest1: TXPManifest;
    Settings1: TMenuItem;
    OpenRecent1: TMenuItem;
    N14: TMenuItem;
    Import1: TMenuItem;
    FWPackage1: TMenuItem;
    N15: TMenuItem;
    Export1: TMenuItem;
    FWPackage2: TMenuItem;
    procedure CalcExecute(Sender: TObject);
    procedure ExitExecute(Sender: TObject);
    procedure CalculatorExecute(Sender: TObject);
    procedure AboutExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Add1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Derivatives1Click(Sender: TObject);
    procedure ranslate1Click(Sender: TObject);
    procedure Add2Click(Sender: TObject);
    procedure Inspect1Click(Sender: TObject);
    procedure Derivatives2Click(Sender: TObject);
    procedure ranslate2Click(Sender: TObject);
    procedure Inspect2Click(Sender: TObject);
    procedure Add3Click(Sender: TObject);
    procedure Derivatives3Click(Sender: TObject);
    procedure Calculate1Click(Sender: TObject);
    procedure Chart1Click(Sender: TObject);
    procedure Load_DataBase(dir:string);
    procedure Close_Database;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure New1Click(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure SetChange(name:string;cha:boolean);
    procedure Save1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Index1Click(Sender: TObject);
    procedure Search1Click(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure UpdateReopen;
    procedure OpenRec(Sender: TObject);
    procedure MRUMoveTop(item:string);
    function  translate_form:boolean;
    procedure FWPackage1Click(Sender: TObject);
    procedure FWPackage2Click(Sender: TObject);
//    procedure Copy_DataBase;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const program_name='Formula Wizard';

var
  Desktop: TDesktop;
  working_directory,temp_dir,temp_file:String;
  dname,dfull,ddir:string;
  chan:boolean;
  hasclosed:boolean;
  lmru:boolean; //Load Most Recently Used Database
  lucd:boolean; //Load Unexpectedly Closed Database
  img,lang,lname:string;

  lastname:Array of String;
  lastnum:word;
  Strings:Array[0..8] of String = ('New Database','','Add a Unit','Add a Quantity','Add a Formula','Do you wish to save changes to "','" first?','Save As...','Open...');

procedure FileCopy(const FSrc, FDst: string);


implementation


uses FormulasUnit, Unit4, CalculatorUnit, AboutUnit, QuantitiesUnit, UnitsUnit, UnitsEditUnit, UnitsDervUnit, UnitsTransUnit,
  QuantitiesEditUnit, QuantitiesDervUnit, QuantitiesTransUnit, FormulaEditUnit, FormulaExpressUnit, FormulaCalculatorUnit, FormulaChartUnit,
  SettingsUnit, SplashUnit, ImportPackageUnit;

{$R *.DFM}

procedure FileCopy(const FSrc, FDst: string);
var
  sStream,
  dStream: TFileStream;
begin
  sStream := TFileStream.Create(FSrc, fmOpenRead);
  try
    dStream := TFileStream.Create(FDst, fmCreate);
    try
      dStream.CopyFrom(sStream, 0);
    finally
      dStream.Free;
    end;
  finally
    sStream.Free;
  end;
end;

function GetFileName(path:string):string;
var stri:string;
posi:word;
begin
  stri:=path;
  posi:=1;
  while posi>0 do
  begin
    posi:=pos('\',stri);
    if ( (pos('/',stri)<posi) and (pos('/',stri)>0) )or (pos('\',stri)<0) then posi:=pos('/',stri);

  delete(stri,1,posi);
  end;
  GetFileName:=stri;
end;

function GetFilePath(name:string):string;
var nami,res:string;
begin
  nami:=GetFileName(name);
  res:=name;
  delete(res,length(name)-length(nami),length(nami));
  GetFilePath:=res;
end;

procedure TDesktop.Load_DataBase;
begin
//  if (not (FileExists(dir))) then exit ;

//  Formulas
  Formulas.ADOTable1.Active:=false;
  Formulas.ADOTable1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+dir+';Persist Security Info=False';
  Formulas.ADOTable1.Active:=true;

  Formulas.ADOTable2.Active:=false;
  Formulas.ADOTable2.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+dir+';Persist Security Info=False';
  Formulas.ADOTable2.Active:=true;

// Units
  Units.ADOTable1.Active:=false;
  Units.ADOTable1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+dir+';Persist Security Info=False';
  Units.ADOTable1.Active:=true;

  Units.ADOTable2.Active:=false;
  Units.ADOTable2.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+dir+';Persist Security Info=False';
  Units.ADOTable2.Active:=true;

// Quantities
  Quantities.ADOTable1.Active:=false;
  Quantities.ADOTable1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+dir+';Persist Security Info=False';
  Quantities.ADOTable1.Active:=true;

  Quantities.ADOTable2.Active:=false;
  Quantities.ADOTable2.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+dir+';Persist Security Info=False';
  Quantities.ADOTable2.Active:=true;

//  changed:=false;
end;

procedure TDesktop.Close_Database;
begin
    Formulas.ADOTable1.Active:=false;
    Formulas.ADOTable2.Active:=false;
    Units.ADOTable1.Active:=false;
    Units.ADOTable1.Active:=false;
    Quantities.ADOTable1.Active:=false;
    Quantities.ADOTable1.Active:=false;

    Formulas.ADOTable1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=';
    Formulas.ADOTable2.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=';
    Units.ADOTable1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=';
    Units.ADOTable1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=';
    Quantities.ADOTable1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=';
    Quantities.ADOTable1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=';
end;

procedure TDesktop.SetChange;
var chsg:string[5];
begin
  if name<>'' then
  begin
    dname:=GetFileName(name);
    ddir:=GetFilePath(name);
    dfull:=name;
  end;

  if cha then chsg:='*' else chsg:='';
  chan:=cha;

  Desktop.Caption:=program_name+' - '+chsg+dname;
end;

procedure TDesktop.CalcExecute(Sender: TObject);
begin
  form4.show;
end;


procedure TDesktop.ExitExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TDesktop.CalculatorExecute(Sender: TObject);
begin
  CalculatorFW.visible:=true;
end;

procedure TDesktop.AboutExecute(Sender: TObject);
begin
  AboutBox.Show;
end;

procedure TDesktop.FormCreate(Sender: TObject);
begin
  working_directory:=GetCurrentDir;
//  temp_dir:=;
  temp_file:='\fml.mdbtmp';
  ddir:=working_directory;

  //InitTrans(working_directory+'\Languages\bg.lng');

end;

procedure TDesktop.Add1Click(Sender: TObject);
begin
  UnitsEditBox.Mode:=1;
  UnitsEditBox.Caption:=Strings[2];
  UnitsEditBox.show;
end;

procedure TDesktop.Edit1Click(Sender: TObject);
begin
  Units.show;
end;

procedure TDesktop.Derivatives1Click(Sender: TObject);
begin
  UnitsDervBox.mode:=2;
  UnitsDervBox.show;
end;

procedure TDesktop.ranslate1Click(Sender: TObject);
begin
  UnitsTransBox.Show;
end;

procedure TDesktop.Add2Click(Sender: TObject);
begin
  QuantitiesEditBox.Mode:=1;
  QuantitiesEditBox.Caption:=Strings[3];
  QuantitiesEditBox.show;
end;

procedure TDesktop.Inspect1Click(Sender: TObject);
begin
  Quantities.Show;
end;

procedure TDesktop.Derivatives2Click(Sender: TObject);
begin
  QuantitiesDervBox.mode:=2;
  QuantitiesDervBox.show;
end;

procedure TDesktop.ranslate2Click(Sender: TObject);
begin
  QuantitiesTransBox.mode:=2;
  QuantitiesTransBox.Show;
end;

procedure TDesktop.Inspect2Click(Sender: TObject);
begin
  Formulas.show;
end;

procedure TDesktop.Add3Click(Sender: TObject);
begin
  Mode:=1;
  FormulaEditBox.caption:=Strings[4];
  FormulaEditBox.Visible:=true;
end;

procedure TDesktop.Derivatives3Click(Sender: TObject);
begin
  FormulaExpressBox.mode:=2;
  FormulaExpressBox.visible:=true;
end;

procedure TDesktop.Calculate1Click(Sender: TObject);
begin
  FormulaCalculatorBox.mode:=2;
  FormulaCalculatorBox.show;
end;

procedure TDesktop.Chart1Click(Sender: TObject);
begin
  FormulaChartBox.mode:=2;
  FormulaChartBox.show;
end;

procedure TDesktop.FormShow(Sender: TObject);
var bb:string;
begin
  {
  FileCopy(working_directory+'\Default Data\Formulas.mdb',temp_dir+temp_file);
  FileCopy(working_directory+'\Default Data\Formulas.mdb',temp_dir+'db.tmp');
  Load_DataBase(temp_dir+temp_file);
  SetChange(dname,false);}

  if not FileExists(temp_dir+'db.tmp') then FileCopy(working_directory+'\Default Data\Formulas.mdb',temp_dir+'db.tmp');
  if not FileExists(temp_dir+temp_file) then FileCopy(working_directory+'\Default Data\Formulas.mdb',temp_dir+temp_file);

  if (not hasclosed )and lucd and (lastname[0]<>'<None>') then begin
//    dname:=lastname;
    Load_DataBase(temp_dir+temp_file);
    SetChange(lastname[0],true);
  end
  else if lmru and (lastname[0]<>'<None>') and FileExists(lastname[0]) then
  begin
//    dname:=lastname;
    Load_DataBase(temp_dir+'db.tmp');
    FileCopy(lastname[0],temp_dir+temp_file);
    Load_DataBase(temp_dir+temp_file);
    SetChange(lastname[0],false);
  end  
  else
  New1Click(Sender);
end;

procedure TDesktop.FormClose(Sender: TObject; var Action: TCloseAction);
var f:file; openDialog:TOpenDialog;
but:integer;
begin
// close_database;
 but:=mrNo;
 if chan then
   but:=MessageDlg(Strings[5]+dname+Strings[6],mtConfirmation,[mbYes,mbNo],-1);

 if but=mrYes then Save1Click(Sender);

 SaveSettings;
 IniFile.WriteBool('Files','HasClosed',true);
 if dfull<>'' then IniFile.WriteString('Files','LastFile0',dfull);
 
 IniFile.Destroy;
end;

procedure TDesktop.New1Click(Sender: TObject);
var but:word;
label endi;
begin
// close_database;
 but:=7;
 if chan then
   but:=MessageDlg(Strings[5]+dname+Strings[6],mtConfirmation,[mbYes,mbNo,mbCancel],-1);
 if but=mrCancel then goto endi;;
 if but=mrYes then Save1Click(Sender);

 dname:=Strings[0];
 Load_DataBase(temp_dir+'db.tmp');
 FileCopy(working_directory+'\Default Data\Formulas.mdb',temp_dir+temp_file);
 Load_DataBase(temp_dir+temp_file);
 SetChange('',false);

 endi:
end;

procedure TDesktop.SaveAs1Click(Sender: TObject);
var saveDialog : TSaveDialog;
begin
  saveDialog := TSaveDialog.Create(self);
  saveDialog.Title:=Strings[7];
  saveDialog.InitialDir:= ddir;
  saveDialog.Filter:='Microsoft Database File|*.mdb';
  saveDialog.DefaultExt:='mdb';
  saveDialog.FilterIndex:=1;

  if saveDialog.Execute then
  begin
     Load_DataBase(temp_dir+'db.tmp');
     FileCopy(temp_dir+temp_file,saveDialog.FileName);
     Load_DataBase(temp_dir+temp_file);
     SetChange(saveDialog.FileName,false);
    // dname:=GetFileName(saveDialog.FileName);
//     chan:=false;
  end;
end;

procedure TDesktop.Save1Click(Sender: TObject);
begin
  if (dname<>'')and(dname<>Strings[0]) then
  begin
     Load_DataBase(temp_dir+'db.tmp');
     FileCopy(temp_dir+temp_file,dfull);
     Load_DataBase(temp_dir+temp_file);
     SetChange(dname,false);
  end
  else SaveAs1Click(Sender);
end;

procedure TDesktop.Open1Click(Sender: TObject);
var openDialog:TOpenDialog;
but:integer;
label endi;
begin
// close_database;
 but:=mrNo;
 if chan then
   but:=MessageDlg(Strings[5]+dname+Strings[6],mtConfirmation,[mbYes,mbNo,mbCancel],-1);
 if but=mrCancel then goto endi;
 if but=mrYes then Save1Click(Sender);

  openDialog := TOpenDialog.Create(self);
  openDialog.Title:=Strings[8];
  openDialog.InitialDir:= ddir;
  openDialog.Filter:='Microsoft Database File|*.mdb';
  openDialog.DefaultExt:='mdb';
  openDialog.FilterIndex:=1;

  if openDialog.Execute then
  if fileExists(openDialog.FileName) then
  begin
    Load_DataBase(temp_dir+'db.tmp');
    FileCopy(openDialog.FileName,temp_dir+temp_file);
    Load_DataBase(temp_dir+temp_file);
    SetChange(openDialog.FileName,false);
    MRUMoveTop(openDialog.FileName);
    UpdateReopen;
  end;
 
 endi:
end;

procedure TDesktop.Index1Click(Sender: TObject);
var path:String;
begin

end;

procedure TDesktop.Search1Click(Sender: TObject);
var path:String;
begin

end;

procedure TDesktop.Settings1Click(Sender: TObject);
begin
  SettingsBox.Show;
end;

procedure TDesktop.UpdateReopen;
var i,fin:integer;
    Arr: Array of TMenuItem;
begin

  fin:=High(DesktopUnit.lastname);
  if fin>DesktopUnit.lastnum-1 then fin:=DesktopUnit.lastnum-1;
  
  SetLength(Arr,fin+1);

  for i:=0 to fin do
  begin
    Arr[i]:=TMenuItem.Create(self);
    Arr[i].Caption:=LastName[i];
    Arr[i].OnClick:=OpenRec;
  end;  

  OpenRecent1.Clear;
  OpenRecent1.Add(Arr);
end;

procedure TDesktop.OpenRec(Sender: TObject);
var fname:string;
begin
//  with Sender as TMenuItem do
  fname:=StringReplace(TMenuItem(Sender).caption,'&','',[rfReplaceAll]);
  if FileExists(fname) then
  begin
    Load_DataBase(temp_dir+'db.tmp');
    FileCopy(fname,temp_dir+temp_file);
    Load_DataBase(temp_dir+temp_file);
    SetChange(fname,false);
    MRUMoveTop(fname);
    UpdateReopen;
  end;
end;

procedure TDesktop.MRUMoveTop(item:string);
var i,j,fin:integer;
begin
  fin:=High(DesktopUnit.lastname);
  if fin>DesktopUnit.lastnum-1 then fin:=DesktopUnit.lastnum-1;

  for i:=0 to fin do
    if lastname[i]=item then break;
  if i>fin then i:=fin;
  
  for j:=i downto Low(lastname)+1 do
  begin
    lastname[j]:=lastname[j-1];
  end;
  
  lastname[0]:=item;
end;

function TDesktop.translate_form;
begin
  N1.Caption          := GetWord('File','&File');
  new1.Caption        := GetWord('New','&New');
  open1.Caption       := GetWord('Open','&Open');
  openrecent1.Caption := GetWord('OpenRecent','Open &Recent');
  save1.Caption       := GetWord('Save','&Save');
  saveas1.Caption     := GetWord('SaveAs','Save &As');
  N10.Caption         := GetWord('Exit','&Exit');
  Units1.Caption      := GetWord('Units','&Units');
  Edit1.Caption       := GetWord('Inspect','&Inspect');
  Add1.Caption        := GetWord('Add','&Add');
  Derivatives1.Caption:= GetWord('Derivatives','&Derivatives');
  ranslate1.Caption   := GetWord('Calculate','&Calculate');
  quantities1.Caption := GetWord('Quantities','&Quantities');
  inspect1.Caption    := GetWord('Inspect','&Inspect');
  add2.Caption        := GetWord('Add','&Add');
  Derivatives2.Caption:= GetWord('Derivatives','&Derivatives');
  ranslate2.Caption   := GetWord('Calculate','&Calculate');
  N3.Caption          := GetWord('Formulas','F&ormulas');
  Inspect2.Caption    := GetWord('Inspect','&Inspect');
  Add3.Caption        := GetWord('Add','&Add');
  N2.Caption          := GetWord('Search','&Search');
  Derivatives3.Caption:= GetWord('Derivatives','&Derivatives');
  Calculate1.Caption  := GetWord('Calculate','&Calculate');
  Chart1.Caption      := GetWord('Chart','C&hart');
  Options1.Caption    := GetWord('Tools','&Tools');
  N8.Caption          := GetWord('Calculator','Calculato&r');
  Settings1.Caption   := GetWord('Settings','&Settings');
  N4.Caption          := GetWord('Help','&Help');
  N6.Caption          := GetWord('About','&About');
  Import1.Caption     := GetWord('Import','Import');
  Export1.Caption     := GetWord('Export','Export');
  
  Strings[0]          :=GetWord('ND','New Database');
  Strings[1]          :=GetWord('HelpFile','\FWHelp.chm');
  Strings[2]          :=GetWord('AddUnit','Add a Unit');
  Strings[3]          :=GetWord('AddQuantity','Add a Quantity');
  Strings[4]          :=GetWord('AddFormula','Add a Formula');
  Strings[5]          :=GetWord('SVChCnf1','Do you wish to save changes to "');
  Strings[6]          :=GetWord('SVChCnf2','" first?');
  Strings[7]          :=StringReplace(GetWord('SaveAs','Save As'),'&','',[rfReplaceAll])+'...';
  Strings[8]          :=StringReplace(GetWord('Open','Open'),'&','',[rfReplaceAll])+'...';
end;

procedure TDesktop.FWPackage1Click(Sender: TObject);
begin
  ImportPackageBox.mode:=importing;
  ImportPackageBox.Show;
end;

procedure TDesktop.FWPackage2Click(Sender: TObject);
begin
  ImportPackageBox.mode:=exporting;
  ImportPackageBox.Show;
end;

end.
