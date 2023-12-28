unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DBGrids, DBCtrls, ZDataset, ZConnection;

type

  { TForm1 }

  TForm1 = class(TForm)
    BrtRechercher: TButton;
    DsStagiaires: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    EdtRechercher: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Znx: TZConnection;
    ZtblStagiaires: TZTable;
    procedure BrtRechercherClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BrtRechercherClick(Sender: TObject);
begin
  ZtblStagiaires.Filtered := False;
  ZtblStagiaires.Filter := 'concat(code,noms,prenoms) like '+  quotedstr('*'+edtRechercher.text + '*');
  ZtblStagiaires.Filtered := true;
end;

end.

