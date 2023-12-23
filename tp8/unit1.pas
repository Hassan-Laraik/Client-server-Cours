unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, DBCtrls,
  StdCtrls, ZConnection, ZDataset;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBGrid1: TDBGrid;
    ZConnection1: TZConnection;
    ZTable1: TZTable;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ZTable1PostError(DataSet: TDataSet; E: EDatabaseError;
      var DataAction: TDataAction);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  if ZTable1.State in [dsInsert,dsEdit] then
  begin
    ShowMessage('Operation Non Effectuée');
    DBEdit1.SetFocus;
    exit;
  end;
  ZTable1.Append;
   DBEdit1.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if ZTable1.State in [dsInsert,dsEdit] then
  begin
    ShowMessage('Operation Non Effectuée');
    DBEdit1.SetFocus;
    exit;
  end;
  ZTable1.Edit;
   DBEdit1.SetFocus;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ZTable1.Delete;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if ZTable1.State in [dsBrowse] then
  begin
    ShowMessage('Operation Non Effectuée');
    DBEdit1.SetFocus;
    exit;
  end;
  ZTable1.Cancel;
   DBEdit1.SetFocus;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
   if ZTable1.State in [dsBrowse] then
  begin
    ShowMessage('Operation Non Effectuée');
    DBEdit1.SetFocus;
    exit;
  end;
  ZTable1.Post;
   DBEdit1.SetFocus;
end;

procedure TForm1.ZTable1PostError(DataSet: TDataSet; E: EDatabaseError;
  var DataAction: TDataAction);
begin

    DataAction :=daAbort;
    //DataSet.Cancel;
    ShowMessage(e.Message);
end;

end.

