unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  uRESTDWServerEvents, uRESTDWServerContext, uRESTDWIdBase, uRESTDWParams;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button2: TButton;
    RESTDWIdServicePooler1: TRESTDWIdServicePooler;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
  uses udm;
{$R *.lfm}

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
begin
  RESTDWIdServicePooler1.Active := true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  try
    RESTDWIdServicePooler1.ServerMethodClass := TDM;
  except
  showmessage('Aucune Connection');
  application.terminate;
  end;  
end;

end.

