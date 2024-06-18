unit mUsuarios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient, Datasnap.Provider, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, mConexao;

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
  private
    { Private declarations }
  public
    { Public declarations }
    function TemLoginCadastrado(Login: String; ID: String): Boolean;
  end;

var
  dmUsuarios: TdmUsuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmUsuarios }

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
