unit uClient;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBCtrls,
  DBExtCtrls, StdCtrls;

type

  { TFrmClient }

  TFrmClient = class(TForm)
    BtnAnnuler: TButton;
    BtnValider: TButton;
    DBComboBox1: TDBComboBox;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBImage1: TDBImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BtnAnnulerClick(Sender: TObject);
    procedure BtnValiderClick(Sender: TObject);
  private

  public

  end;

var
  FrmClient: TFrmClient;

implementation
  uses UDM;
{$R *.lfm}

  { TFrmClient }

  procedure TFrmClient.BtnValiderClick(Sender: TObject);
  begin
    DM.ZtblClients.Post;
  end;

procedure TFrmClient.BtnAnnulerClick(Sender: TObject);
begin
  DM.ZtblClients.Cancel;
end;

end.

