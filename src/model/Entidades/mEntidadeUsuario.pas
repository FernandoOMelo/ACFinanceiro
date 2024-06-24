unit mEntidadeUsuario;

interface

type
  TModelEntidadeUsuario = class
    private
      FID: String;
      FLogin: String;
      FNome: String;
      procedure SetIDUsuarioLogado(const Value: String);
      procedure SetLoginUsuarioLogado(const Value: String);
      procedure SetNomeUsuarioLogado(const Value: String);
    public
      property ID: String read FID write SetIDUsuarioLogado;
      property Nome: String read FNome write SetNomeUsuarioLogado;
      property Login: String read FLogin write SetLoginUsuarioLogado;
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

end.
