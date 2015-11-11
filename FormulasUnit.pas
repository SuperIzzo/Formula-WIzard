unit FormulasUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Db, DBTables, ADODB,ShellApi,translationUnit;

type
  TFormulas = class(TForm)
    DBLookupListBox1: TDBLookupListBox;
    Discription: TDBMemo;
    Bevel1: TBevel;
    Btn_Add: TButton;
    Btn_Edit: TButton;
    Btn_Del: TButton;
    Btn_More: TButton;
    Btn_Calc: TButton;
    Btn_Close: TButton;
    Formula: TDBText;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    Btn_Graph: TButton;
    procedure Btn_EditClick(Sender: TObject);
    procedure Btn_AddClick(Sender: TObject);
    procedure Btn_DelClick(Sender: TObject);
    procedure Btn_CloseClick(Sender: TObject);
    procedure Btn_CalcClick(Sender: TObject);
    procedure Btn_MoreClick(Sender: TObject);
    procedure delete(Sender: TObject; var Key: Char);
    procedure Btn_GraphClick(Sender: TObject);
    function  get_formula(name:string):string;
    procedure ADOTable1datachange(DataSet: TDataSet);
    procedure translate_form;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formulas: TFormulas;
  mode:0..2;
  Strings:array[0..2] of String=('Edit a Formula','Add a Formula','Are you sure you want to delete this formula?');

implementation

uses FormulaEditUnit, FormulaCalculatorUnit, FormulaExpressUnit, FormulaChartUnit, DesktopUnit;

{$R *.DFM}


function TFormulas.get_formula;
  var book:string;
  begin
    book:=ADOTable1.Bookmark;
    ADOTable1.first;
    get_formula:='';
    while not ADOTable1.Eof do
    begin
      if UpperCase(name)=UpperCase(string(ADOTable1.FieldValues['Name'])) then
      begin
        get_formula:=string(ADOTable1.FieldValues['Formula']);
        ADOTable1.Bookmark:=book;
        exit;
      end;
      ADOTable1.Next;
    end;
    ADOTable1.Bookmark:=book;
  end;


procedure TFormulas.Btn_EditClick(Sender: TObject);
begin
  Mode:=2;
  FormulaEditBox.caption:=Strings[0];
  FormulaEditBox.Visible:=true;
end;

procedure TFormulas.Btn_AddClick(Sender: TObject);
begin
  Mode:=1;
  FormulaEditBox.caption:=Strings[1];
  FormulaEditBox.Visible:=true;
end;

procedure TFormulas.Btn_DelClick(Sender: TObject);
begin
  if MessageDlg(Strings[2],
     MtConfirmation,[MbYes,MbNo],0)=mrYes then ADOTable1.Delete;
end;

procedure TFormulas.Btn_CloseClick(Sender: TObject);
begin
  self.hide;
end;

procedure TFormulas.Btn_CalcClick(Sender: TObject);
begin
  FormulaCalculatorBox.mode:=1;
  FormulaCalculatorBox.show;
end;

procedure TFormulas.Btn_MoreClick(Sender: TObject);
begin
  if FormulaExpressBox.Visible then FormulaExpressBox.fill_mee(ADOTable1.FieldValues['Name'])
  else
  begin
    FormulaExpressBox.mode:=1;
    FormulaExpressBox.visible:=true;
  end;
end;

procedure TFormulas.delete(Sender: TObject; var Key: Char);
begin
   if ord(Key)=127 then Btn_DelClick(self);
end;

procedure TFormulas.Btn_GraphClick(Sender: TObject);
begin
  FormulaChartBox.mode:=1;
  FormulaChartBox.show;
end;

procedure TFormulas.ADOTable1DataChange(DataSet: TDataSet);
begin
  Desktop.SetChange('',true);
end;

procedure TFormulas.translate_form;
begin
  self.Caption:=GetWord('FormulaInspector','Formula Inspector');
  btn_Add.Caption:=GetWord('Add','Add');
  btn_Calc.Caption:=GetWord('Calculate','Calculate');
  btn_Close.Caption:=GetWord('Close','Close');
  btn_Del.Caption:=GetWord('Delete','Delete');
  btn_Edit.Caption:=GetWord('Edit','Edit');
  btn_Graph.Caption:=GetWord('Chart','Chart');
  btn_More.Caption:=GetWord('Derivatives','Derivatives');
  Strings[0]:=GetWord('EditFormula','Edit a Formula');
  Strings[1]:=GetWord('AddFormula','Add a Formula');
  Strings[2]:=GetWord('FmDelCnf','Are you sure you want to delete this formula?');
end;

end.


