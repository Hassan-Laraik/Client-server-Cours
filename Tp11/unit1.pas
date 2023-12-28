unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBCtrls,
  DBExtCtrls, StdCtrls, ExtCtrls, ExtDlgs, ZConnection, ZDataset;

type

  { TForm1 }

  TForm1 = class(TForm)
    BtnNouveau: TButton;
    BtnModifier: TButton;
    BtnSupprimer: TButton;
    btnAnnuler: TButton;
    BtnValider: TButton;
    BtnChargerPhoto: TButton;
    DBComboBox1: TDBComboBox;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBImage1: TDBImage;
    DBMemo1: TDBMemo;
    DBNavigator1: TDBNavigator;
    DsStagiaires: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel1: TPanel;
    Znx: TZConnection;
    ZtblStagiaires: TZTable;
    procedure btnAnnulerClick(Sender: TObject);
    procedure BtnChargerPhotoClick(Sender: TObject);
    procedure BtnModifierClick(Sender: TObject);
    procedure BtnNouveauClick(Sender: TObject);
    procedure BtnSupprimerClick(Sender: TObject);
    procedure BtnValiderClick(Sender: TObject);
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
  ZtblStagiaires.Append;
end;

procedure TForm1.BtnSupprimerClick(Sender: TObject);
begin
  ZtblStagiaires.Delete;
end;

procedure TForm1.BtnValiderClick(Sender: TObject);
begin
  ZtblStagiaires.Post;
end;

procedure TForm1.BtnModifierClick(Sender: TObject);
begin
  ZtblStagiaires.edit;
end;

procedure TForm1.btnAnnulerClick(Sender: TObject);
begin
  ZtblStagiaires.cancel;
end;

procedure TForm1.BtnChargerPhotoClick(Sender: TObject);
begin
  if not (ZtblStagiaires.State in [dsInsert,dsEdit])
then Exit ;

     if OpenPictureDialog1.Execute then
       begin
         TBlobField(ZtblStagiaires.FieldByName('photo'))
         .LoadFromFile(OpenPictureDialog1.FileName );
       end;
end;

end.

