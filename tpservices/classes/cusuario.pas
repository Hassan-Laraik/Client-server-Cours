unit cUsuario;

interface

uses ZConnection, Classes,SysUtils, ZDataset,db;

type
    TUsuario = class
    private
        FConn : TZConnection;
        FCod_Usuario: Integer;
        FSenha: String;
        FEmail: String;
    public
        constructor Create(conn: TZConnection);
        property Cod_Usuario : Integer read FCod_Usuario write    FCod_Usuario;
        property Email : String read FEmail write FEmail;
        property Senha : String read FSenha write FSenha;
        function ValidaLogin(out erro: string): Boolean;
end;

implementation

{ TUsuario }

constructor TUsuario.Create(conn: TZConnection);
begin
    FConn := conn;
end;

function TUsuario.ValidaLogin(out erro: string): Boolean;
var
    qry : TZQuery;
begin
    try
        qry := TZQuery.Create(nil);
        qry.Connection := FConn;
        with qry do
        begin
            Active := false;
            SQL.Clear;
            SQL.Add('SELECT * FROM TAB_USUARIO');
            SQL.Add('WHERE (EMAIL=:EMAIL) AND (SENHA=:SENHA)');
            ParamByName('EMAIL').AsString := self.Email;
            ParamByName('SENHA').AsString := self.Senha;
            Active := true;

            if RecordCount = 1 then
            begin
                Cod_Usuario := FieldByName('COD_USARIO').AsInteger;
                erro := '';
                Result := true;
            end
            else
            begin
                Cod_Usuario := 0;
                erro := 'Email ou senha inválida';
                Result := false;
            end;
        end;
         FreeAndNil(qry);
    except on ex:exception do
    begin
        erro := 'Erro ao validar login: ' + ex.Message;
        Result := false;
    end;
    end;
end;

end.
