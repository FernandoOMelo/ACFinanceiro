program MonolitoFinanceiro;

uses
  Vcl.Forms,
  vPrincipal in 'view\vPrincipal.pas' {frmPrincipal},
  vCadastroPadrao in 'view\vCadastroPadrao.pas' {frmCadastroPadrao},
  vSplash in 'view\vSplash.pas' {frmSplash};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroPadrao, frmCadastroPadrao);
  Application.Run;
end.
