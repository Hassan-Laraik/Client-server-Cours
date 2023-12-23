unit UExercice1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFrmExercice1 }

  TFrmExercice1 = class(TForm)
    BtnAfficher: TButton;
    EdtNom: TEdit;
    Label1: TLabel;
    procedure BtnAfficherClick(Sender: TObject);

  private

  public

  end;

var
  FrmExercice1: TFrmExercice1;

implementation

{$R *.lfm}

{ TFrmExercice1 }



procedure TFrmExercice1.BtnAfficherClick(Sender: TObject);
begin
    ShowMessage('Bonjour ');
end;

end.

