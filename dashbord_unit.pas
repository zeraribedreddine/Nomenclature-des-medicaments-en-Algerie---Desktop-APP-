unit dashbord_unit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid,
  FMX.Layouts, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Phys.ODBCBase, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Controls, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Fmx.Bind.Navigator, Data.Bind.Grid, Data.Bind.DBScope, FMX.Objects,
  FMX.StdCtrls, FMX.Edit, FMX.frxClass, FMX.frxDBSet, FMX.ListBox;

type
  TForm2 = class(TForm)
    Lay_clien_all: TLayout;
    Lay_top: TLayout;
    Lay_client: TLayout;
    Grid1: TGrid;
    FDConnection1: TFDConnection;
    FDTable1: TFDTable;
    DataSource1: TDataSource;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    NavigatorBindSourceDB1: TBindNavigator;
    BindingsList1: TBindingsList;
    Panl_print: TPanel;
    Circle1: TCircle;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    GridPanelLayout1: TGridPanelLayout;
    GroupBox1: TGroupBox;
    RadioBu_num_enges: TRadioButton;
    RadioBu_dosage: TRadioButton;
    RadioBu_Cond: TRadioButton;
    RadioBu_code: TRadioButton;
    RadioBu_nom_marqu: TRadioButton;
    RadioBu_Labor_decision: TRadioButton;
    RadioBu_nomunation: TRadioButton;
    RadioBu_form: TRadioButton;
    RadioBu_Pays_labo: TRadioButton;
    RadioBu_Date_initial: TRadioButton;
    RadioBu_Date_finale: TRadioButton;
    RadioBu_Duree_stb: TRadioButton;
    RadioBu_Remborssm: TRadioButton;
    RadioBu_list: TRadioButton;
    rect_telech_pdf: TRectangle;
    Lab_prinOne: TLabel;
    Panel1: TPanel;
    Rectangle2: TRectangle;
    edit_serch: TEdit;
    Rectangle3: TRectangle;
    Circle2: TCircle;
    Label3: TLabel;
    Rect_info: TRectangle;
    Label4: TLabel;
    SearchEditButton1: TSearchEditButton;
    img_printOne: TCircle;
    Rectangle4: TRectangle;
    Lab_dashbord: TLabel;
    img_R_dashbord: TCircle;
    Rectangle1: TRectangle;
    Lab_print_all: TLabel;
    img_print_all: TCircle;


    procedure Circle2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure edit_serchTyping(Sender: TObject);
    procedure Circle1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure Circle1MouseLeave(Sender: TObject);


    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDConnection1AfterConnect(Sender: TObject);
    procedure FDConnection1BeforeDisconnect(Sender: TObject);


    procedure img_R_dashbordClick(Sender: TObject);
    procedure Lab_print_allClick(Sender: TObject);
    procedure Lab_prinOneClick(Sender: TObject);








  private
    { Déclarations privées }

  public
    { Déclarations publiques }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses main_unit, Propos_Unit;

// ---------------------------------------------

procedure filterr(Dataset: TDataSet; const FieldName, SearchTerm: string);
begin
  Assert(Assigned(Dataset), 'No dataset is assigned');

  if SearchTerm = '' then
    Dataset.Filtered := False
  else
  begin
    Dataset.Filter := FieldName + ' LIKE ' + QuotedStr('%' + SearchTerm + '%');
    Dataset.Filtered := True;
  end;


end;


// ---------------------------------------------





procedure TForm2.Circle1MouseLeave(Sender: TObject);
begin
 Rect_info.Visible:= false;
end;

procedure TForm2.Circle1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
  Rect_info.Visible:= true;
end;

procedure TForm2.Circle2Click(Sender: TObject);
begin
 edit_serch.Text:= '';
  RadioBu_num_enges.IsChecked := false ;
  RadioBu_dosage.IsChecked := false;
  RadioBu_Cond.IsChecked := false;
  RadioBu_nomunation.IsChecked := false;
  RadioBu_nom_marqu.IsChecked := false;
  RadioBu_code.IsChecked := false;
  RadioBu_Labor_decision.IsChecked := false;
  RadioBu_form.IsChecked := false;
  RadioBu_Pays_labo.IsChecked := false;
  RadioBu_Date_initial.IsChecked := false;
  RadioBu_Date_finale.IsChecked := false;
  RadioBu_Duree_stb.IsChecked := false;
  RadioBu_list.IsChecked := false;
  RadioBu_Remborssm.IsChecked := false;
end;








procedure TForm2.img_R_dashbordClick(Sender: TObject);
begin
 form1.Show;
 Form2.Close;
end;

procedure TForm2.edit_serchTyping(Sender: TObject);
begin

  //--------------------------------//

    if RadioBu_Date_initial.IsChecked = true then
     begin
       filterr(FDTable1, 'DATE_DENREGISTREMENT_INITIAL', edit_serch.Text);
     end

  //----------------------------------//
       else
  //----------------------------------//

    if RadioBu_Date_finale.IsChecked = true then
     begin
       filterr(FDTable1, 'DATE_DENREGISTREMENT_FINAL', edit_serch.Text);
     end

  //----------------------------------//
       else
   //----------------------------------//
       if RadioBu_code.IsChecked = true then
       begin
           filterr(FDTable1, 'CODE', edit_serch.Text);
       end
   //----------------------------------//
       else
   //----------------------------------//
       if RadioBu_nom_marqu.IsChecked = true then
       begin
         filterr(FDTable1, 'NOM_DE_MARQUE', edit_serch.Text);
       end

  //----------------------------------//
        else
  //----------------------------------//

        if RadioBu_dosage.IsChecked = true then
        begin
          filterr(FDTable1, 'DOSAGE', edit_serch.Text);
        end

   //----------------------------------//
         else
  //----------------------------------//

        if RadioBu_num_enges.IsChecked = true then
        begin
          filterr(FDTable1, 'NUM_ENREGISTREMENT', edit_serch.Text);
        end

   //----------------------------------//
         else
  //----------------------------------//

        if RadioBu_Cond.IsChecked = true then
        begin
          filterr(FDTable1, 'COND', edit_serch.Text);
        end

   //----------------------------------//
         else
  //----------------------------------//

        if RadioBu_Labor_decision.IsChecked = true then
        begin
          filterr(FDTable1, 'LABORATOIRES_DETENTEUR_DE_LA_DECISION_DENREGISTREMENT', edit_serch.Text);
        end

   //----------------------------------//
                  else
  //----------------------------------//

        if RadioBu_nomunation.IsChecked = true then
        begin
          filterr(FDTable1, 'DENOMINATION_COMMUNE_INTERNATIONALE', edit_serch.Text);
        end

   //----------------------------------//
                 else
  //----------------------------------//

        if RadioBu_Pays_labo.IsChecked = true then
        begin
          filterr(FDTable1, 'PAYS_DU_LABORATOIRE_DETENTEUR_DE_LA_DECISION_DENREGISTREMENT', edit_serch.Text);
        end

   //----------------------------------//
                  else
  //----------------------------------//

        if RadioBu_form.IsChecked = true then
        begin
          filterr(FDTable1, 'FORME', edit_serch.Text);
        end

   //----------------------------------//
                  else
  //----------------------------------//

        if RadioBu_Duree_stb.IsChecked = true then
        begin
          filterr(FDTable1, 'DUREE_DE_STABILITE', edit_serch.Text);
        end

   //----------------------------------//
                   else
  //----------------------------------//

        if RadioBu_Remborssm.IsChecked = true then
        begin
          filterr(FDTable1, 'REMBOURSEMENT', edit_serch.Text);
        end

   //----------------------------------//
                         else
  //----------------------------------//

        if RadioBu_list.IsChecked = true then
        begin
          filterr(FDTable1, 'LISTE', edit_serch.Text);
        end

   //----------------------------------//

end;




procedure TForm2.FDConnection1AfterConnect(Sender: TObject);
begin
  FDTable1.Open;
end;

procedure TForm2.FDConnection1BeforeDisconnect(Sender: TObject);
begin
 FDTable1.Close;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDConnection1.Connected := false ;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
 FDConnection1.Connected:= true ;
end;










procedure TForm2.Label3Click(Sender: TObject);
begin
  FDTable1.Refresh;
  edit_serch.Text:= '';
  RadioBu_num_enges.IsChecked := false ;
  RadioBu_dosage.IsChecked := false;
  RadioBu_Cond.IsChecked := false;
  RadioBu_nomunation.IsChecked := false;
  RadioBu_nom_marqu.IsChecked := false;
  RadioBu_code.IsChecked := false;
  RadioBu_Labor_decision.IsChecked := false;
  RadioBu_form.IsChecked := false;
  RadioBu_Pays_labo.IsChecked := false;
  RadioBu_Date_initial.IsChecked := false;
  RadioBu_Date_finale.IsChecked := false;
  RadioBu_Duree_stb.IsChecked := false;
  RadioBu_list.IsChecked := false;
  RadioBu_Remborssm.IsChecked := false;
end;







procedure TForm2.Lab_prinOneClick(Sender: TObject);

begin

//------------------------------------------------------

frxReport1.LoadFromfile('C:\Users\kikatokiro\Desktop\Project db Medicament algerien\raport\REPORTSAVE.fr3');
frxDBDataset1.RangeBegin := rbCurrent;
frxDBDataset1.RangeEnd := reCurrent;
frxReport1.ShowReport;

//--------------------------------------------------------

end;

procedure TForm2.Lab_print_allClick(Sender: TObject);
begin
frxReport1.LoadFromfile('C:\Users\kikatokiro\Desktop\Project db Medicament algerien\raport\REPORTSAVE.fr3');
frxReport1.ShowReport;
end;

end.
