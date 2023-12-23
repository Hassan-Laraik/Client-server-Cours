unit ustagiaire;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBCtrls,
  DBExtCtrls, StdCtrls, ExtDlgs, ZConnection, ZDataset;

type

  { TForm1 }

  TForm1 = class(TForm)
    BtnNouveau: TButton;
    BtnModifier: TButton;
    BtnSupprimer: TButton;
    BtnAnnuller: TButton;
    BtnValider: TButton;
    DataSource1: TDataSource;
    DBComboBox1: TDBComboBox;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBImage1: TDBImage;
    DBMemo1: TDBMemo;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel1: TPanel;
    ZConnection1: TZConnection;
    ZTable1: TZTable;
    ZTable1adresse: TMemoField;
    ZTable1code: TLongintField;
    ZTable1naissance: TDateField;
    ZTable1noms: TStringField;
    ZTable1phone: TStringField;
    ZTable1photo: TBlobField;
    ZTable1prenoms: TStringField;
    ZTable1sexe: TStringField;
    procedure BtnAnnullerClick(Sender: TObject);
    procedure BtnModifierClick(Sender: TObject);
    procedure BtnNouveauClick(Sender: TObject);
    procedure BtnSupprimerClick(Sender: TObject);
    procedure BtnValiderClick(Sender: TObject);
    procedure DBImage1DblClick(Sender: TObject);
    procedure ZTable1PostError(DataSet: TDataSet; E: EDatabaseError;
      var DataAction: TDataAction);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BtnNouveauClick(Sender: TObject);
begin
  if ZTable1.State in [dsEdit,dsInsert] then Exit;
  ZTable1.Append;
   DBEdit2.SetFocus;
end;

procedure TForm1.BtnSupprimerClick(Sender: TObject);
begin
  ZTable1.Delete;
end;

procedure TForm1.BtnValiderClick(Sender: TObject);
begin
    if ZTable1.State in [dsBrowse] then Exit;
  ZTable1.Post;
end;

procedure TForm1.DBImage1DblClick(Sender: TObject);
begin
  if  ZTable1.State in [dsInsert,dsEdit] then
   begin
     if OpenPictureDialog1.Execute then
     begin
       DBImage1.WriteHeader:=false;
       DBImage1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
     end;
   end;
end;

procedure TForm1.ZTable1PostError(DataSet: TDataSet; E: EDatabaseError;
  var DataAction: TDataAction);
begin
  if (
  pos( 'Duplicate entry '+quotedstr(dataset.FieldByName('phone').AsString)+' for key '+QuotedStr('stagiaires.phone') ,e.Message)<> 0) then
     begin
       DataAction := daAbort;
       ShowMessage('Duplication Phone');
       //exit;
     end;
  if (
  pos( 'Duplicate entry '+quotedstr(dataset.FieldByName('code').AsString)+' for key '+QuotedStr('stagiaires.PRIMARY') ,e.Message)<> 0) then
     begin
       DataAction := daAbort;
       ShowMessage('Duplication code');
       //exit;
     end;
  if (
  pos( 'Column '+quotedstr('noms')+' cannot be null',e.Message)<> 0) then
     begin
       DataAction := daAbort;
       ShowMessage('Nom Vide');
       //exit;
     end;
  if (pos( 'Column '+quotedstr('prenoms')+' cannot be null',e.Message)<> 0) then
     begin
       DataAction := daAbort;
       ShowMessage('Preom Vide');
       //exit;
     end;
end;

procedure TForm1.BtnModifierClick(Sender: TObject);
begin
 if ZTable1.State in [dsEdit,dsInsert] then Exit;
  ZTable1.Edit;
   DBEdit2.SetFocus;
end;

procedure TForm1.BtnAnnullerClick(Sender: TObject);
begin
   if ZTable1.State in [dsBrowse] then Exit;
  ZTable1.Cancel;

end;

end.

