unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, StdCtrls,
  cUsuario;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation
 uses udm;
{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
var
  Usario : TUsuario;
  erro : string;
begin
  try
   Usario := TUsuario.Create(DM.conn);
    Usario.email := 'hassan1@hassan.com';
    Usario.Senha := 'hassan1';
     Usario.ValidaLogin(erro) ;
     Edit1.Text := Usario.datas.FieldByName('EMAIL').AsString;
    ShowMessage( erro  );
     //Usario := nil ;
  finally
    //Json.Free;
    Usario.Destroy;
  end;
end;

end.

