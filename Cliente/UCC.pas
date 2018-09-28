// 
// Created by the DataSnap proxy generator.
// 27/09/2018 22:50:42
// 

unit UCC;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TSMClient = class(TDSAdminClient)
  private
    FExecuteReaderCommand: TDBXCommand;
    FProximoCodigoCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function ExecuteReader(SQL: string): OleVariant;
    function ProximoCodigo(Tabela: string): Integer;
  end;

implementation

function TSMClient.ExecuteReader(SQL: string): OleVariant;
begin
  if FExecuteReaderCommand = nil then
  begin
    FExecuteReaderCommand := FDBXConnection.CreateCommand;
    FExecuteReaderCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FExecuteReaderCommand.Text := 'TSM.ExecuteReader';
    FExecuteReaderCommand.Prepare;
  end;
  FExecuteReaderCommand.Parameters[0].Value.SetWideString(SQL);
  FExecuteReaderCommand.ExecuteUpdate;
  Result := FExecuteReaderCommand.Parameters[1].Value.AsVariant;
end;

function TSMClient.ProximoCodigo(Tabela: string): Integer;
begin
  if FProximoCodigoCommand = nil then
  begin
    FProximoCodigoCommand := FDBXConnection.CreateCommand;
    FProximoCodigoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FProximoCodigoCommand.Text := 'TSM.ProximoCodigo';
    FProximoCodigoCommand.Prepare;
  end;
  FProximoCodigoCommand.Parameters[0].Value.SetWideString(Tabela);
  FProximoCodigoCommand.ExecuteUpdate;
  Result := FProximoCodigoCommand.Parameters[1].Value.GetInt32;
end;


constructor TSMClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TSMClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TSMClient.Destroy;
begin
  FExecuteReaderCommand.DisposeOf;
  FProximoCodigoCommand.DisposeOf;
  inherited;
end;

end.

