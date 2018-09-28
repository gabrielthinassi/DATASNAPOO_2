unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrmCadContato, Vcl.Menus;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Contato1: TMenuItem;
    procedure Contato1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.Contato1Click(Sender: TObject);
begin
  if FrmCadContato = nil then
  begin
    Application.CreateForm(TFrmCadContato, FrmCadContato);
    FrmCadContato.Show
  end
  else
    FrmCadContato.Show;
end;

end.
