unit mEntidadeUsuario;

interface

type
  TModelEntidadeUsuario = class
    private
      FID: String;
      FLogin: String;
      FNome: String;
      FSenha: String;
      FSenhaTemp: Boolean;
      procedure SetIDUsuarioLogado(const Value: String);
      procedure SetLoginUsuarioLogado(const Value: String);
      procedure SetNomeUsuarioLogado(const Value: String);
    procedure SetSenha(const Value: String);
    procedure SetSenhaTemp(const Value: Boolean);
    public
      property ID: String read FID write SetIDUsuarioLogado;
      property Nome: String read FNome write SetNomeUsuarioLogado;
      property Login: String read FLogin write SetLoginUsuarioLogado;
      property Senha: String read FSenha write SetSenha;
      property SenhaTemp: Boolean read FSenhaTemp write SetSenhaTemp;
  end;

implementation

{ TModelEntidadeUsuario }

procedure TModelEntidadeUsuario.SetIDUsuarioLogado(const Value: String);
begin
  FID := Value;
end;

procedure TModelEntidadeUsuario.SetLoginUsuarioLogado(const Value: String);
begin
  FLogin := Value;
end;

procedure TModelEntidadeUsuario.SetNomeUsuarioLogado(const Value: String);
begin
  FNome := Value;
end;

procedure TModelEntidadeUsuario.SetSenha(const Value: String);
begin
  FSenha := Value;
end;

procedure TModelEntidadeUsuario.SetSenhaTemp(const Value: Boolean);
begin
  FSenhaTemp := Value;
end;

end.
