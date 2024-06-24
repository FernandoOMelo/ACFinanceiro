unit mSistema;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmSistema = class(TDataModule)
  private
    function GetConfiguracao(Secao, Parametro, valorPadrao: string): String;
    procedure SetConfiguracao(Secao, Parametro, valor: String);
    Const ARQUIVO_CONFIGURACAO = 'config.cfg';
  public
    function DataUltimoAcesso : String; overload;
    procedure DataUltimoAcesso(aValue: TDateTime); overload;
    function UsuarioUltimoAcesso: String; overload;
    procedure UsuarioUltimoAcesso(aValue: String); overload;
  end;

var
  dmSistema: TdmSistema;

implementation

uses
  System.IniFiles, Vcl.Forms;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

function TdmSistema.DataUltimoAcesso: String;
begin
  Result := GetConfiguracao('ACESSO', 'Data', '');
end;

procedure TdmSistema.DataUltimoAcesso(aValue: TDateTime);
begin
  SetConfiguracao('ACESSO', 'Data', DateTimeToStr(aValue));
end;

function TdmSistema.GetConfiguracao(Secao, Parametro, valorPadrao: string): String;
var
  lArquivoConfig: TIniFile;
begin
  lArquivoConfig := TIniFile.Create(ExtractFilePath(Application.ExeName) + ARQUIVO_CONFIGURACAO);
  try
    Result := lArquivoConfig.ReadString('ACESSO', Parametro, valorPadrao);
  finally
    lArquivoConfig.Free;
  end;
end;

procedure TdmSistema.SetConfiguracao(Secao, Parametro, Valor: String);
var
  lArquivoConfig: TIniFile;
begin
  lArquivoConfig := TIniFile.Create(ExtractFilePath(Application.ExeName) + ARQUIVO_CONFIGURACAO);
  try
    lArquivoConfig.WriteString('ACESSO', Parametro, Valor);
  finally
    lArquivoConfig.Free;
  end;
end;

function TdmSistema.UsuarioUltimoAcesso: String;
begin
  Result := GetConfiguracao('ACESSO', 'Usuario', '');
end;

procedure TdmSistema.UsuarioUltimoAcesso(aValue: String);
begin
  SetConfiguracao('ACESSO', 'Usuario', aValue);
end;

end.
