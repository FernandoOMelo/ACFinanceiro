unit mUsuarios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient, Datasnap.Provider, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, mConexao, mEntidadeUsuario;

type
  TdmUsuarios = class(TDataModule)
    sqlUsuarios: TFDQuery;
    dspUsuarios: TDataSetProvider;
    cdsUsuarios: TClientDataSet;
    cdsUsuariosID: TStringField;
    cdsUsuariosNOME: TStringField;
    cdsUsuariosLOGIN: TStringField;
    cdsUsuariosSENHA: TStringField;
    cdsUsuariosSTATUS: TStringField;
    cdsUsuariosDATA_CADASTRO: TDateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FEntidadeUsuario: TModelEntidadeUsuario;
    { Private declarations }
  public
    { Public declarations }
    function TemLoginCadastrado(Login: String; ID: String): Boolean;
    function GetUsuarioLogado: TModelEntidadeUsuario;
    procedure EfetuarLogin(Login: String; Senha: String);
  end;

var
  dmUsuarios: TdmUsuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmUsuarios }

procedure TdmUsuarios.DataModuleCreate(Sender: TObject);
begin
  FEntidadeUsuario := TModelEntidadeUsuario.Create;
end;

procedure TdmUsuarios.DataModuleDestroy(Sender: TObject);
begin
  FEntidadeUsuario.Free;
end;

procedure TdmUsuarios.EfetuarLogin(Login, Senha: String);
var
  SQLConsulta: TFDQuery;
begin
  SQLConsulta := TFDQuery.Create(nil);
   try
    SQLCOnsulta.Connection := dmConexao.SQLConexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT * FROM USUARIOS WHERE LOGIN = :LOGIN AND SENHA = :SENHA');
    SQLConsulta.ParamByName('LOGIN').AsString := Login;
    SQLConsulta.ParamByName('SENHA').AsString := Senha;
    SQLConsulta.Open();

    if SQLConsulta.IsEmpty then
      raise Exception.Create('Usuário e/ou senha inválidos');
    if SQLConsulta.FieldByName('STATUS').AsString <> 'A' then
      raise Exception.Create('Usuário bloqueado, favor entrar em contato com o adminstrador.');

    FEntidadeUsuario.ID     := SQLConsulta.FieldByName('ID').AsString;
    FEntidadeUsuario.Nome   := SQLConsulta.FieldByName('NOME').AsString;
    FEntidadeUsuario.Login  := SQLConsulta.FieldByName('LOGIN').AsString;

  finally
    SQLConsulta.Close;
    SQLCOnsulta.Free;
  end;
end;

function TdmUsuarios.GetUsuarioLogado: TModelEntidadeUsuario;
begin
  Result := FEntidadeUsuario;
end;

function TdmUsuarios.TemLoginCadastrado(Login, ID: String): Boolean;
var
  SQLConsulta: TFDQuery;
begin
  Result := False;
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLCOnsulta.Connection := dmConexao.SQLConexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT ID FROM USUARIOS WHERE LOGIN = :LOGIN');
    SQLConsulta.ParamByName('LOGIN').AsString := Login;
    SQLConsulta.Open();
    if not SQLConsulta.IsEmpty then
      Result := SQLConsulta.FieldByName('ID').AsString <> ID;
  finally
    SQLConsulta.Close;
    SQLCOnsulta.Free;
  end;
end;

end.
