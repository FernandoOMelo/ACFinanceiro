program MonolitoFinanceiro;

uses
  Vcl.Forms,
  vPrincipal in 'view\vPrincipal.pas' {frmPrincipal},
  vCadastroPadrao in 'view\vCadastroPadrao.pas' {frmCadastroPadrao},
  vSplash in 'view\vSplash.pas' {frmSplash},
  mConexao in 'model\mConexao.pas' {dmConexao: TDataModule},
  vCadastroUsuarios in 'view\vCadastroUsuarios.pas' {frmUsuarios},
  mUsuarios in 'model\mUsuarios.pas' {dmUsuarios: TDataModule},
  cUtils in 'Utils\cUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroPadrao, frmCadastroPadrao);
  Application.CreateForm(TfrmUsuarios, frmUsuarios);
  Application.CreateForm(TdmUsuarios, dmUsuarios);
  Application.Run;
end.
