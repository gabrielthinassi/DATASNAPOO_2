unit UFrmConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UDM, Data.DB, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons, JvExStdCtrls, JvCombobox,
  Vcl.ExtCtrls;

type
  TFrmConsulta = class(TForm)
    pnlTop: TPanel;
    cbxCampo: TJvComboBox;
    cbxCondicao: TJvComboBox;
    edtValor: TEdit;
    btnConsultar: TBitBtn;
    btnConfirmar: TBitBtn;
    gridConsulta: TJvDBGrid;
    DSConsulta: TDataSource;
    procedure btnConsultarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoConsulta: Integer;
  end;

var
  FrmConsulta: TFrmConsulta;

implementation

{$R *.dfm}

procedure TFrmConsulta.btnConfirmarClick(Sender: TObject);
begin
  CodigoConsulta := DM.CDSConsulta.FieldByName('CODIGO_CONTATO').AsInteger;
  Close;
end;

procedure TFrmConsulta.btnConsultarClick(Sender: TObject);
var
  Campo, Condicao, SQL: String;
begin
  case cbxCampo.ItemIndex of
    0: Campo := 'CODIGO_CONTATO';
    1: Campo := 'NOME_CONTATO';
    2: Campo := 'DTNASCIMENTO_CONTATO';
  end;

  case cbxCondicao.ItemIndex of
    0: Condicao := '('''  + edtValor.Text + '%'')'; //Iniciado com
    1: Condicao := '(''%' + edtValor.Text +  ''')'; //Terminado com
    2: Condicao := '('''  + edtValor.Text +  ''')'; //Igual a
    3: Condicao := '(''%' + edtValor.Text + '%'')'; //Que contem
  end;

  SQL :=
    'select ' + #13 +
    '    CONTATO.CODIGO_CONTATO,      ' + #13 +
    '    CONTATO.NOME_CONTATO,        ' + #13 +
    '    CONTATO.DTNASCIMENTO_CONTATO ' + #13 +
    'from CONTATO ' + #13 +
    'where ' + Campo + ' like ' + Condicao;

  DM.CDSConsulta.Close;
  DM.CDSConsulta.CommandText := SQL;
  DM.CDSConsulta.Open;

  //DSConsulta.DataSet := DM.CDSConsulta;
end;

end.
