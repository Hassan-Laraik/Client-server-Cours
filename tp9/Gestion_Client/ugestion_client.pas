unit uGestion_Client;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DBGrids;

type

  { TForm1 }

  TForm1 = class(TForm)
    BtnNouveau: TButton;
    BtnEditer: TButton;
    BtnSuprimer: TButton;
    DSClients: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BtnEditerClick(Sender: TObject);
    procedure BtnNouveauClick(Sender: TObject);
    procedure BtnSuprimerClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
 uses uDM,uClient;
{$R *.lfm}

 { TForm1 }

 procedure TForm1.BtnNouveauClick(Sender: TObject);
 begin
   DM.ZtblClients.Append;
   FrmClient.ShowModal;
 end;

procedure TForm1.BtnSuprimerClick(Sender: TObject);
begin
  DM.ZtblClients.Delete;
end;

procedure TForm1.BtnEditerClick(Sender: TObject);
begin
  DM.ZtblClients.Edit;
   FrmClient.ShowModal;
end;

end.

