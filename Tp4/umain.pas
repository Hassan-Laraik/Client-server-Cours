unit uMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BtnValider: TButton;
    BtnEffacer: TButton;
    EdtNom: TEdit;
    EdtPrenom: TEdit;
    EdtVille: TEdit;
    EdtGsm: TEdit;
    EdtCredit: TEdit;
    MemoAdresse: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    PnlTitre: TPanel;
    PnlTitre1: TPanel;
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
   if EdtNom.Text = '' then
   begin
       ShowMessage('Nom Non Correcte');
       EdtNom.SetFocus;
       exit;
   end;

   if Length(EdtGsm.Text) <> 10 then
   begin
      ShowMessage('Numero Gsm Non Correcte');
       EdtGsm.SetFocus;
       exit;
   end;

end;

end.

