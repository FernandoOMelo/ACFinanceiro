program MonolitoFinanceiro;

uses
  Vcl.Forms,
  vPrincipal in 'view\vPrincipal.pas' {frmPrincipal},
  vCadastroPadrao in 'view\vCadastroPadrao.pas' {frmCadastroPadrao},
  vSplash in 'view\vSplash.pas' {frmSplash},
  mConexao in 'model\mConexao.pas' {DataModule1: TDataModule},
  vCadastroUsuarios in 'view\vCadastroUsuarios.pas' {frmUsuarios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroPadrao, frmCadastroPadrao);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmUsuarios, frmUsuarios);
  Application.Run;
end.
