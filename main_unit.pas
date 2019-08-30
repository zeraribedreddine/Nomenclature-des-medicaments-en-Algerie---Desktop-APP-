unit main_unit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Objects, FMX.Menus;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    Rect_top: TRectangle;
    Recta_client: TRectangle;
    Rec_name_app: TRectangle;
    Rect_img_drapeudz: TRectangle;
    Rect_logo_sante: TRectangle;
    Label3: TLabel;
    Layout3: TLayout;
    Recta_devlopper: TRectangle;
    Timer1: TTimer;
    Lab_Date: TLabel;
    Lab_HEURRR: TLabel;
    Label1: TLabel;
    GridPanelLayout1: TGridPanelLayout;
    Rectangle1: TRectangle;
    Recta_medicament: TRectangle;
    Label8: TLabel;
    Label9: TLabel;
    Rectangle8: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Label2: TLabel;
    Label4: TLabel;
    Rectangle4: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Rectangle9: TRectangle;
    Label5: TLabel;
    Label6: TLabel;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Label10: TLabel;
    Circle1: TCircle;
    Rectangle5: TRectangle;
    Label7: TLabel;
    Circle2: TCircle;
    procedure Timer1Timer(Sender: TObject);
    procedure Recta_medicamentClick(Sender: TObject);
    procedure Rectangle12Click(Sender: TObject);
    procedure Rectangle3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure Rectangle3MouseLeave(Sender: TObject);
    procedure Circle1Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);









  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses dashbord_unit, Propos_Unit;



procedure TForm1.Circle1Click(Sender: TObject);
begin
 Form3.ShowModal ;
end;


procedure TForm1.Label8Click(Sender: TObject);
begin
 Form2.Show ;
 Form1.Close ;
end;

procedure TForm1.Rectangle12Click(Sender: TObject);
begin
 Form3.Showmodal ;
end;



procedure TForm1.Rectangle3MouseLeave(Sender: TObject);
begin
 Rectangle5.Visible:= false;
 Rectangle3.Visible:= true ;
end;

procedure TForm1.Rectangle3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
 Rectangle5.Visible:= true;
 Rectangle3.Visible:= false ;
end;

procedure TForm1.Recta_medicamentClick(Sender: TObject);
begin
Form2.Show ;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   Lab_date.Text := FormatDateTime('hh:mm:ss' ,Now) ;
   Lab_HEURRR.Text := FormatDateTime ('dd - mm - yyyy',Now) ;
end;


end.
