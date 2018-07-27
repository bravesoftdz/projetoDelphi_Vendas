unit uBaseDAO;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, uDM, Data.DB, Vcl.Dialogs;

type
  TBaseDAO = class
  protected
    FDQuery: TFDQuery;

    function ExecSQL(const pSQL: String): Integer;
    function GetQuery(const pSQL: String): TFDQuery;

    constructor Create;
  public
    destructor Destroy; override;
  end;

implementation

{ TBaseDAO }

constructor TBaseDAO.Create;
begin
  FDQuery := TFDQuery.Create(nil);
  FDQuery.Connection := uDMConnection.FDconnection;
end;

destructor TBaseDAO.Destroy;
begin
  if Assigned(FDQuery) then
    FreeAndNil(FDQuery);
  inherited;
end;

function TBaseDAO.ExecSQL(const pSQL: String): Integer;
begin
  Result := 0;
  try
    FDQuery.Connection.StartTransaction;
    FDQuery.SQL.Text := pSQL;
    FDQuery.ExecSQL;
    Result := FDQuery.RowsAffected;
    FDQuery.Connection.Commit;
  except
    FDQuery.Connection.Rollback;
  end;
end;

function TBaseDAO.GetQuery(const pSQL: String): TFDQuery;
begin
  FDQuery.SQL.Text := pSQL;
  FDQuery.Active := True;
  Result := FDQuery;
end;

end.
