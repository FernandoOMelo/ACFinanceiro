unit vLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmLogin = class(TForm)
    pnEsquerda: TPanel;
    imgLogo: TImage;
    pnPrincipal: TPanel;
    pnLogin: TPanel;
    pnTop: TPanel;
    lbNomeAplicacao: TLabel;
    lbDetalhes: TLabel;
    lbSenha: TLabel;
    edtSenha: TEdit;
    lbLogin: TLabel;
    edtLogin: TEdit;
    btnEntrar: TButton;
    procedure btnEntrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  mUsuarios, mSistema;

{$R *.dfm}

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin
  if Trim(edtLogin.Text) = '' then
  begin
    edtLogin.SetFocus;
    Application.MessageBox('Informe o seu usuário.', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if Trim(edtSenha.Text) = '' then
  begin
    edtSenha.SetFocus;
    Application.MessageBox('Informe a sua senha.', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  try
    dmUsuarios.EfetuarLogin(Trim(edtLogin.Text), Trim(edtSenha.Text));
    dmSistema.DataUltimoAcesso(now);
    dmSistema.UsuarioUltimoAcesso(dmUsuarios.GetUsuarioLogado.Login);
    ModalResult := mrOk;
  except
    on E: Exception do
    begin
      Application.MessageBox(PWideChar(E.Message),'Atenção', MB_OK + MB_ICONWARNING);
      edtLogin.SetFocus;
    end;
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  edtLogin.Text := dmSistema.UsuarioUltimoAcesso;
end;

end.
