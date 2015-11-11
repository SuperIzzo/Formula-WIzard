unit CalculatorUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,ECalc, XPMan, LMDCustomButton, LMDButton;

type

  TCalculatorFW = class(TForm)
    Edit1: TEdit;
    Button1: TLMDButton;
    Button2: TLMDButton;
    Button4: TLMDButton;
    Button9: TLMDButton;
    Button10: TLMDButton;
    Button11: TLMDButton;
    Button12: TLMDButton;
    Button13: TLMDButton;
    Button14: TLMDButton;
    Button15: TLMDButton;
    Button16: TLMDButton;
    Button17: TLMDButton;
    Button18: TLMDButton;
    Button19: TLMDButton;
    Button20: TLMDButton;
    Button21: TLMDButton;
    Button22: TLMDButton;
    Button24: TLMDButton;
    Button25: TLMDButton;
    Button26: TLMDButton;
    Button27: TLMDButton;
    Button28: TLMDButton;
    Button29: TLMDButton;
    Button30: TLMDButton;
    Button31: TLMDButton;
    Button32: TLMDButton;
    Button33: TLMDButton;
    Button3: TLMDButton;
    Button34: TLMDButton;
    Button35: TLMDButton;
    Button36: TLMDButton;
    Button23: TLMDButton;
    Button37: TLMDButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Buttons(Sender: TObject);
    procedure Functions(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CalculatorFW: TCalculatorFW;

implementation

{$R *.DFM}

procedure TCalculatorFW.Button1Click(Sender: TObject);
var
  TempStr:String;
  S1,S2:String;
  Value:Extended;
  vars:TVariables;
  Error:TError;
begin
  TempStr:=Edit1.Text;//UpperCase(Edit1.Text);
  //Str(Calculate(TempStr,vars,Error):20:10,TempStr);
  Edit1.Text:=StringReplace(format('%g',[Calculate(TempStr,vars,Error)]),',','.',[rfReplaceAll]);
  if error.position<>0 then
  begin
    str(error.Code,S1);
    str(error.Position,S2);
    MessageDlg('Calculation Error #'+S1+' at position '+S2+': '+Error.Message,mtError,[mbOk],0);
    Exit;
  end;
end;

procedure TCalculatorFW.Button2Click(Sender: TObject);
begin
  Edit1.Text:='';
end;

procedure TCalculatorFW.Button3Click(Sender: TObject);
begin
  self.hide;
end;

procedure TCalculatorFW.Buttons(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text+(Sender as TButton).Caption;
end;

procedure TCalculatorFW.Functions(Sender: TObject);
begin
  Edit1.Text:=(Sender as TButton).Caption+'('+Edit1.Text+')';
end;

end.
