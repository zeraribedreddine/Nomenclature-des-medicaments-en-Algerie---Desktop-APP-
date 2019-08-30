program Medicament_App;

uses
  System.StartUpCopy,
  FMX.Forms,
  main_unit in 'main_unit.pas' {Form1},
  dashbord_unit in 'dashbord_unit.pas' {Form2},
  Propos_Unit in 'Propos_Unit.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
