unit SF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,SettingsUnit;

type
  TSettingsForm = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SettingsForm: TSettingsForm;

implementation

uses DesktopUnit;

{$R *.dfm}

procedure TSettingsForm.FormCreate(Sender: TObject);
begin
  SettingsUnit.StartUp;
  SettingsUnit.LoadSettings;
  SettingsUnit.SaveSettings;
  With Desktop do UpdateReopen;
  Self.Destroy;
end;

end.
