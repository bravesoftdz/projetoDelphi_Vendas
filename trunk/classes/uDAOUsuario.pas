unit uDAOUsuario;

interface

uses
  cUsuario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB,
  System.SysUtils;

type
  TDAOUsuario = class
  private
    FConnection: TFDConnection;
    procedure SetConnection(const Value: TFDConnection);

  public
    property Connection: TFDConnection read FConnection write SetConnection;
    function GetDadosUsuario(const idUsuario: Integer): TUsuario;
    procedure GravaUsuario(aUsuario: TUsuario);

  end;

implementation

{ TDAOUsuario }

function TDAOUsuario.GetDadosUsuario(const idUsuario: Integer): TUsuario;
var
  lUsuario: TUsuario;
  lQry: TFDQuery;
begin
  lUsuario := TUsuario.Create();
  lQry := TFDQuery.Create(nil);
  try
    lQry.Connection := FConnection;
    lQry.Close;
    lQry.SQL.Add('SELECT');
    lQry.SQL.Add(' nome,');
    lQry.SQL.Add('senha,');
    lQry.SQL.Add('id,');
    lQry.SQL.Add('idFuncao');
    lQry.SQL.Add('FROM WBMarket. usuarios');
    lQry.SQL.Add('WHERE');
    lQry.SQL.Add(' id = :pIdUsuario');
    lQry.ParamByName('pidUsuario').AsString;
    lQry.Open;

    lUsuario.Nome := lQry.Fields.FieldByName('nome').AsString;
    lUsuario.Senha := lQry.Fields.FieldByName('senha').AsString;
    lUsuario.id := lQry.Fields.FieldByName('id').AsInteger;
    lUsuario.idFuncao := lQry.Fields.FieldByName('idFuncao').AsInteger;
  finally
    FreeAndNil(lUsuario);
  end;

end;

procedure TDAOUsuario.GravaUsuario(aUsuario: TUsuario);
begin

end;

procedure TDAOUsuario.SetConnection(const Value: TFDConnection);
begin
  FConnection := Value;
end;

end.
