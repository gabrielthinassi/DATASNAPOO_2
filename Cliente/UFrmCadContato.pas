unit UFrmCadContato;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  JvExMask, JvToolEdit, JvBaseEdits, Vcl.Buttons, UDM, Data.DB, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvExComCtrls,
  JvComCtrls, UFrmConsulta;

type
  TFrmCadContato = class(TForm)
    pnlTop: TPanel;
    pnlLeft: TPanel;
    pnlCenter: TPanel;
    pnlNavegacao: TPanel;
    edtCodigo: TJvCalcEdit;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    btnPrimeiro: TBitBtn;
    btnIncluir: TBitBtn;
    btnConsultar: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    DSContato: TDataSource;
    DSEndereco: TDataSource;
    DSTelefone: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    JvPageControl1: TJvPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    gridEndereco: TJvDBGrid;
    gridTelefone: TJvDBGrid;
    procedure pnlTopExit(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure DSContatoStateChange(Sender: TObject);
    procedure DSContatoDataChange(Sender: TObject; Field: TField);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AbrirCDS(Codigo: Integer);
    procedure Navegar(Sentido: Integer);
  end;

var
  FrmCadContato: TFrmCadContato;

implementation

uses
  Datasnap.DBClient;

{$R *.dfm}

{ TFrmCadContato }

procedure TFrmCadContato.AbrirCDS(Codigo: Integer);
begin
  if ((Codigo = DM.CodigoAtual) or (Codigo = 0)) then
    Exit;

  DM.CDSContato.Close;
  DM.CDSContato.FetchParams;
  DM.CDSContato.Params[0].AsInteger := Codigo;
  DM.CDSContato.Open;
end;

procedure TFrmCadContato.btnAnteriorClick(Sender: TObject);
begin
  Navegar(1);
end;

procedure TFrmCadContato.btnConsultarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsulta, FrmConsulta);
  FrmConsulta.ShowModal;

  if FrmConsulta.CodigoConsulta > 0 then
  begin
    edtCodigo.Text := IntToStr(FrmConsulta.CodigoConsulta);
    AbrirCDS(FrmConsulta.CodigoConsulta);
  end;
  FreeAndNil(FrmConsulta);
end;

procedure TFrmCadContato.btnPrimeiroClick(Sender: TObject);
begin
  Navegar(0);
end;

procedure TFrmCadContato.btnProximoClick(Sender: TObject);
begin
  Navegar(2);
end;

procedure TFrmCadContato.btnUltimoClick(Sender: TObject);
begin
  Navegar(3);
end;

procedure TFrmCadContato.DSContatoDataChange(Sender: TObject; Field: TField);
begin
  edtCodigo.Text := DSContato.DataSet.FieldByName('CODIGO_CONTATO').AsString;
  DM.CodigoAtual := DSContato.DataSet.FieldByName('CODIGO_CONTATO').AsInteger;
end;

procedure TFrmCadContato.DSContatoStateChange(Sender: TObject);
begin
  btnIncluir.Enabled   := DSContato.State in [dsBrowse, dsInactive];
  btnExcluir.Enabled   := DSContato.State in [dsBrowse];
  btnGravar.Enabled    := DSContato.State in [dsInsert, dsEdit];
  btnCancelar.Enabled  := DSContato.State in [dsInsert, dsEdit];
  btnConsultar.Enabled := DSContato.State in [dsBrowse, dsInactive];

  pnlTop.Enabled := DSContato.State in [dsBrowse, dsInactive];
end;

procedure TFrmCadContato.edtCodigoButtonClick(Sender: TObject);
begin
  btnConsultar.Click;
end;

procedure TFrmCadContato.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnIncluir.SetFocus;
end;

procedure TFrmCadContato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.CDSContato.Close;
end;

procedure TFrmCadContato.Navegar(Sentido: Integer);
var
  CDSTemp: TClientDataSet;
  SQL: String;
begin
  CDSTemp := TClientDataSet.Create(Self);
  try
    case Sentido of
    0: SQL := 'select min(CODIGO_CONTATO) as CODIGO from CONTATO';
    1: SQL := 'select max(CODIGO_CONTATO) as CODIGO from CONTATO where CODIGO_CONTATO < ' + edtCodigo.Text;
    2: SQL := 'select min(CODIGO_CONTATO) as CODIGO from CONTATO where CODIGO_CONTATO > ' + edtCodigo.Text;
    3: SQL := 'select max(CODIGO_CONTATO) as CODIGO from CONTATO';
    end;

    CDSTemp.Data := DM.ExecuteReader(SQL);

    if not CDSTemp.IsEmpty then
      AbrirCDS(CDSTemp.FieldByName('CODIGO').AsInteger)
    else
      edtCodigo.Text := IntToStr(DM.CodigoAtual);
  finally
    CDSTemp.Free;
  end;
end;

procedure TFrmCadContato.pnlTopExit(Sender: TObject);
begin
  if edtCodigo.Text <> '' then
    AbrirCDS(edtCodigo.AsInteger);
end;

end.
