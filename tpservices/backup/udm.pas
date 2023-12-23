unit udm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, fpjson, DB, ZConnection, uRESTDWServerEvents,
  uRESTDWDataModule,uRESTDWParams, uRESTDWDatamodule, 
  cUsuario,dialogs;

type

  { TDM }

  TDM = class(TServerMethodDatamodule)

    DWEvents: TRESTDWServerEvents;
    conn: TZConnection;
    procedure DWEventsEventshoraReplyEvent(var Params: TRESTDWParams;
      var Result: String);
    procedure DWEventsEventsValidaLoginReplyEvent(var Params:      TRESTDWParams;var Result: String);
  private

  public

  end;

var
  DM: TDM;

implementation

{$R *.lfm}

{ TDM }

procedure TDM.DWEventsEventshoraReplyEvent(var Params: TRESTDWParams;
  var Result: String);
begin
  result := '{"hora" : "'+formatdatetime('hh:ss:nn',now)+'"}';
end;

procedure TDM.DWEventsEventsValidaLoginReplyEvent(var Params: TRESTDWParams;var Result: String);
var
  Email , Senha,erro: String;
  Usario :TUsuario;
  Json : TjsonObject;
begin
  Email  :=  Params.ItemsString['email'].AsString;
  Senha := Params.ItemsString['senha'].AsString;
   Json := TJSONObject.Create;
  try
   Usario := TUsuario.Create(DM.conn);
   Usario.Email := Email;
   Usario.Senha := Senha;
   if   Usario.ValidaLogin(erro)  then
     begin
      Json.add('Success', 'S');
      Json.add('Error', erro);
      Json.add('CodigoUsario', Usario.Cod_Usuario);
     end else
     begin
      Json.add('Success', 'N');
      Json.add('Error', erro);
      Json.add('CodigoUsario', '0');
     end;
   result := Json.AsJSON;
  finally
    Json.Free;
    Usario.Destroy;
  end;
end;

end.

