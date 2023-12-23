unit uDM;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset;

type

  { TDM }

  TDM = class(TDataModule)
    ZConnection1: TZConnection;
    ZtblClients: TZTable;
    ZtblClientsadress: TStringField;
    ZtblClientsidadherent: TLongintField;
    ZtblClientsnaissance: TDateField;
    ZtblClientsnom: TStringField;
    ZtblClientsphoto: TBlobField;
    ZtblClientsprenom: TStringField;
    ZtblClientssexe: TStringField;
    ZtblClientstele: TStringField;
  private

  public

  end;

var
  DM: TDM;

implementation

{$R *.lfm}

end.

