unit UDM;

interface

uses
  System.SysUtils, System.Classes, UCC, Data.DBXDataSnap,
  Data.DBXCommon, IPPeerClient, Data.DB, Data.SqlExpr, Datasnap.DBClient,
  Datasnap.DSConnect;

type
  TDM = class(TDataModule)
    CON_DS: TSQLConnection;
    DSPCContato: TDSProviderConnection;
    CDSContato: TClientDataSet;
    CDSContatoCODIGO_CONTATO: TIntegerField;
    CDSContatoNOME_CONTATO: TStringField;
    CDSContatoDTNASCIMENTO_CONTATO: TDateField;
    CDSContatoSQLTelefone: TDataSetField;
    CDSContatoSQLEndereco: TDataSetField;
    CDSEndereco: TClientDataSet;
    CDSEnderecoCODIGO_ENDERECO: TIntegerField;
    CDSEnderecoRUA_ENDERECO: TStringField;
    CDSEnderecoNUMERO_ENDERECO: TStringField;
    CDSEnderecoCONTATO_CODCONTATO: TIntegerField;
    CDSTelefone: TClientDataSet;
    CDSTelefoneCODIGO_TELEFONE: TIntegerField;
    CDSTelefoneNUMERO_TELEFONE: TStringField;
    CDSTelefoneCONTATO_CODCONTATO: TIntegerField;
    CDSConsulta: TClientDataSet;
  private
    FInstanceOwner: Boolean;
    FSMClient: TSMClient;
    function GetSMClient: TSMClient;
    { Private declarations }
  public
    CodigoAtual: Integer;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property SMClient: TSMClient read GetSMClient write FSMClient;
    function ExecuteReader(SQL: String): OleVariant;
    function ProximoCodigo(Tabela: String): Integer;

end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TDM.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
  CodigoAtual := 0;
end;

destructor TDM.Destroy;
begin
  FSMClient.Free;
  inherited;
end;

function TDM.ExecuteReader(SQL: String): OleVariant;
begin
  Result := GetSMClient.ExecuteReader(SQL);
end;

function TDM.GetSMClient: TSMClient;
begin
  if FSMClient = nil then
  begin
    CON_DS.Open;
    FSMClient:= TSMClient.Create(CON_DS.DBXConnection, FInstanceOwner);
  end;
  Result := FSMClient;
end;

function TDM.ProximoCodigo(Tabela: String): Integer;
begin
  Result := GetSMClient.ProximoCodigo(Tabela);
end;

end.
