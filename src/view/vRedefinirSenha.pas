unit vRedefinirSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  mEntidadeUsuario;

type
  TfrmRedefinirSenha = class(TForm)
    pnPrincipal: TPanel;
    pnMain: TPanel;
    lbConfirmaSenha: TLabel;
    lbSenha: TLabel;
    edtConfirmaSenha: TEdit;
    edtSenha: TEdit;
    pnTop: TPanel;
    lbUsuario: TLabel;
    lbDetalhes: TLabel;
    pnButton: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    FUsuario: TModelEntidadeUsuario;
    procedure SetUsuario(const Value: TModelEntidadeUsuario);
    { Private declarations }
  public
    property Usuario: TModelEntidadeUsuario read FUsuario write SetUsuario;
  end;

var
  frmRedefinirSenha: TfrmRedefinirSenha;

implementation

uses
  mUsuarios;

{$R *.dfm}

procedure TfrmRedefinirSenha.btnCancelarClick(Sender: TObject);
begin
  modalResult := mrCancel;
end;

procedure TfrmRedefinirSenha.btnConfirmarClick(Sender: TObject);
begin
  edtSenha.Text := Trim(edtSenha.Text);
  edtConfirmaSenha.Text := Trim(edtConfirmaSenha.Text);

  if edtSenha.Text = '' then
  begin
    edtSenha.SetFocus;
    Application.MessageBox('Informe a sua nova senha.', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;
  if edtConfirmaSenha.Text = '' then
  begin
    edtConfirmaSenha.SetFocus;
    Application.MessageBox('Confirme a sua nova senha.', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;
  if edtSenha.Text <> edtConfirmaSenha.Text then
  begin
    edtConfirmaSenha.SetFocus;
    Application.MessageBox('Senha diferente da confirmação.', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  Usuario.Senha := edtSenha.Text;
  dmUsuarios.RedefinirSenha(Usuario);
  Application.MessageBox('Senha alterada com sucesso', 'Atenção', MB_OK + MB_ICONINFORMATION);
  ModalResult := mrOk;
end;

procedure TfrmRedefinirSenha.FormShow(Sender: TObject);
begin
  lbUsuario.Caption := FUsuario.Nome;
end;

procedure TfrmRedefinirSenha.SetUsuario(const Value: TModelEntidadeUsuario);
begin
  FUsuario := Value;
end;

end.
