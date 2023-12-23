unit uMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BtnValider: TButton;
    ffacerBtnE: TButton;
    EdtNom: TEdit;
    EdtPrenom: TEdit;
    EdtVille: TEdit;
    EdtGSM: TEdit;
    EdtCredit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MemoAdresse: TMemo;
    PnlTitre: TPanel;
    procedure BtnValiderClick(Sender: TObject);


  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }





procedure TForm1.BtnValiderClick(Sender: TObject);
begin
  if  EdtNom.Text = '' then
  begin
    ShowMessage('Nom Obligatoire');
    EdtNom.SetFocus;
    exit;
  end;

  if  EdtPrenom.Text = '' then
  begin
    ShowMessage('Prenom Obligatoire');
    EdtPrenom.SetFocus;
    exit;
  end;

  if  EdtVille.Text = '' then
  begin
    ShowMessage('Ville Obligatoire');
     EdtVille.SetFocus;
    exit;
  end;

  if  EdtGSM.Text = '' then
  begin
    ShowMessage('Gsm Obligatoire');
    EdtGSM.SetFocus;
    exit;
  end;

  ShowMessage('Données Correctes');
end;

end.

