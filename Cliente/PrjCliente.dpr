program PrjCliente;

uses
  Vcl.Forms,
  UFrmPrincipal in 'UFrmPrincipal.pas' {FrmPrincipal},
  UCC in 'UCC.pas',
  UDM in 'UDM.pas' {DM: TDataModule},
  UFrmCadContato in 'UFrmCadContato.pas' {FrmCadContato},
  UFrmConsulta in 'UFrmConsulta.pas' {FrmConsulta};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
