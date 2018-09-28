unit USM;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, Data.DBXFirebird, Data.DB, Data.SqlExpr,
  Data.FMTBcd, Datasnap.Provider, Datasnap.DBClient;

type
  TSM = class(TDSServerModule)
    CON_FB: TSQLConnection;
    SQLContato: TSQLDataSet;
    DSPContato: TDataSetProvider;
    SQLConsulta: TSQLDataSet;
    DSPConsulta: TDataSetProvider;
    SQLExecuteReader: TSQLDataSet;
    DSPExecuteReader: TDataSetProvider;
    CDSExecuteReader: TClientDataSet;
    SQLProximoCodigo: TSQLDataSet;
    DSPProximoCodigo: TDataSetProvider;
    CDSProximoCodigo: TClientDataSet;
    DSEndereco: TDataSource;
    DSTelefone: TDataSource;
    SQLEndereco: TSQLDataSet;
    SQLTelefone: TSQLDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    function ExecuteReader(SQL: String): OleVariant;
    function ProximoCodigo(Tabela: String): Integer;
  end;

implementation


{$R *.dfm}


{ TSM }

function TSM.ExecuteReader(SQL: String): OleVariant;
begin
  try
    CDSExecuteReader.Close;
    CDSExecuteReader.CommandText := SQL;
    CDSExecuteReader.Open;

    Result := CDSExecuteReader.Data;
  except on E: Exception do
    raise Exception.Create('Erro Ao tentar Executar o Comando!' + E.Message);
  end;
end;

function TSM.ProximoCodigo(Tabela: String): Integer;
begin
  try
    CDSProximoCodigo.Close;
    CDSProximoCodigo.CommandText := 'select gen_id(GEN_'+Tabela+'_ID, 1) as CODIGO from RDB$DATABASE';
    CDSProximoCodigo.Open;

    if not CDSProximoCodigo.IsEmpty then
      Result := CDSProximoCodigo.FieldByName('CODIGO').AsInteger;
  except on E: Exception do
    raise Exception.Create('Não foi possível buscar o Proximo Codigo!' + E.Message);
  end;
end;

end.

