unit uConfigConnection;

interface

uses
  System.IniFiles, Vcl.Forms, System.SysUtils, System.classes;

type
  TConnectionConfig = class
  private
    FPort: String;
    FServer: String;
    FDataBase: String;
    FPassword: String;
    FUserName: String;
    FIniFile: TIniFile;

    function GetPort: String;
    function GetServer: String;
    function GetDataBase: String;
    function GetPassword: String;
    function GetUserName: String;
    function GetDiverConnection: String;
  private
    function GetInfoINI(const pChave, pField, pValue: String): String;

    procedure SetPort(const Value: String);
    procedure SetServer(const Value: String);
    procedure SetDatabase(const Value: String);
    procedure SetPassword(const Value: String);
    procedure SetUserName(const Value: String);
  public
    procedure CreateConfigINI(const pConfig: TConnectionConfig);

    property Port: String read GetPort write SetPort;
    property Server: String read GetServer write SetServer;
    property DriverConnection: String read GetDiverConnection;
    property DataBase: String read GetDataBase write SetDatabase;
    property Password: String read GetPassword write SetPassword;
    property UserName: String read GetUserName write SetUserName;
  end;

implementation

{ TConnectionConfig }

procedure TConnectionConfig.CreateConfigINI(const pConfig: TConnectionConfig);
begin
  FIniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'ConfigConnection.ini');
  FIniFile.WriteString('Connection', 'DriverConnection', 'PG');

  FIniFile.WriteString('Connection', 'Port', pConfig.FPort);
  FIniFile.WriteString('Connection', 'Server', pConfig.FServer);
  FIniFile.WriteString('Connection', 'DataBase', pConfig.FDataBase);
  FIniFile.WriteString('Connection', 'UserName', pConfig.FUserName);
  FIniFile.WriteString('Connection', 'Password', pConfig.FPassword);

  FIniFile.Free;
end;

function TConnectionConfig.GetInfoINI(const pChave, pField, pValue: String): String;
begin
  FIniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'ConfigConnection.ini');
  Result := FIniFile.ReadString(pChave, pField, pValue);
  FIniFile.Free;
end;

function TConnectionConfig.GetDataBase: String;
begin
  Result := getInfoINI('Connection', 'DataBase', 'wbMarket');
end;

function TConnectionConfig.GetDiverConnection: String;
begin
  Result := getInfoINI('Connection', 'DriverConnection', 'PG');
end;

function TConnectionConfig.GetPassword: String;
begin
  Result := getInfoINI('Connection', 'Password', '#abc123#');
end;

function TConnectionConfig.GetPort: String;
begin
  Result := getInfoINI('Connection', 'Port', '5432');
end;

function TConnectionConfig.GetServer: String;
begin
  Result := getInfoINI('Connection', 'Server', 'localhost');
end;

function TConnectionConfig.GetUserName: String;
begin
  Result := getInfoINI('Connection', 'UserName', 'postgres');
end;

procedure TConnectionConfig.SetDatabase(const Value: String);
begin
  FDataBase := Value;
end;

procedure TConnectionConfig.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TConnectionConfig.SetPort(const Value: String);
begin
  FPort := Value;
end;

procedure TConnectionConfig.SetServer(const Value: String);
begin
  FServer := Value
end;

procedure TConnectionConfig.SetUserName(const Value: String);
begin
  FUserName := Value;
end;

end.
