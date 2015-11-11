program FormulaWizard;

uses
  Forms,
  FormulasUnit in 'FormulasUnit.pas' {Formulas},
  FormulaEditUnit in 'FormulaEditUnit.pas' {FormulaEditBox},
  DesktopUnit in 'DesktopUnit.pas' {Desktop},
  Unit4 in 'Unit4.pas' {Form4},
  EExpr in 'EExpr.pas',
  FormulaCalculatorUnit in 'FormulaCalculatorUnit.pas' {FormulaCalculatorBox},
  ECalc in 'ECalc.pas',
  FormulaExpressUnit in 'FormulaExpressUnit.pas' {FormulaExpressBox},
  CalculatorUnit in 'CalculatorUnit.pas' {CalculatorPFD},
  AboutUnit in 'AboutUnit.pas' {AboutBox},
  EditDlgUnit in 'EditDlgUnit.pas' {EditDlg},
  QuantitiesUnit in 'QuantitiesUnit.pas' {Quantities},
  UnitsUnit in 'UnitsUnit.pas' {Units},
  UnitsEditUnit in 'UnitsEditUnit.pas' {UnitsEditBox},
  UnitsDervUnit in 'UnitsDervUnit.pas' {UnitsDervBox},
  UnitsTransUnit in 'UnitsTransUnit.pas' {UnitsTransBox},
  QuantitiesEditUnit in 'QuantitiesEditUnit.pas' {QuantitiesEditBox},
  QuantitiesDervUnit in 'QuantitiesDervUnit.pas' {QuantitiesDervBox},
  FormulaChartUnit in 'FormulaChartUnit.pas' {FormulaChartBox},
  QuantitiesTransUnit in 'QuantitiesTransUnit.pas' {QuantitiesTransBox},
  SettingsUnit in 'SettingsUnit.pas' {SettingsBox},
  TranslationUnit in 'TranslationUnit.pas',
  SF in 'SF.pas' {SettingsForm},
  Packages in 'Packages.pas',
  ImportPackageUnit in 'ImportPackageUnit.pas' {ImportPackageBox};

{$R *.RES}

begin

  Application.Initialize;
  Application.Title := 'Formula Wizard';
  Application.CreateForm(TDesktop, Desktop);
  Application.CreateForm(TFormulas, Formulas);
  Application.CreateForm(TFormulaEditBox, FormulaEditBox);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TFormulaCalculatorBox, FormulaCalculatorBox);
  Application.CreateForm(TFormulaExpressBox, FormulaExpressBox);
  Application.CreateForm(TCalculatorFW, CalculatorFW);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TEditDlg, EditDlg);
  Application.CreateForm(TQuantities, Quantities);
  Application.CreateForm(TUnits, Units);
  Application.CreateForm(TUnitsEditBox, UnitsEditBox);
  Application.CreateForm(TUnitsDervBox, UnitsDervBox);
  Application.CreateForm(TUnitsTransBox, UnitsTransBox);
  Application.CreateForm(TQuantitiesEditBox, QuantitiesEditBox);
  Application.CreateForm(TQuantitiesDervBox, QuantitiesDervBox);
  Application.CreateForm(TFormulaChartBox, FormulaChartBox);
  Application.CreateForm(TQuantitiesTransBox, QuantitiesTransBox);
  Application.CreateForm(TSettingsBox, SettingsBox);
  Application.CreateForm(TImportPackageBox, ImportPackageBox);
  Application.CreateForm(TSettingsForm, SettingsForm);
  Application.Run;

end.
