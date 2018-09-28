program PrjServidor;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  UFrmServidor in 'UFrmServidor.pas' {FrmServidor},
  USM in 'USM.pas' {SM: TDSServerModule},
  USC in 'USC.pas' {SC: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmServidor, FrmServidor);
  Application.CreateForm(TSC, SC);
  Application.Run;
end.

