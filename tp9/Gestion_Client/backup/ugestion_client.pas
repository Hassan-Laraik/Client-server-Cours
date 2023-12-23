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
    procedure BtnNouveauClick(Sender: TObject);
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

end.

