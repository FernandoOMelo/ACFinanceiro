unit vSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmSplash = class(TForm)
    pnPrincipal: TPanel;
    imgLogo: TImage;
    lbNomeAplicacao: TLabel;
    ProgressBar1: TProgressBar;
    lbStatus: TLabel;
    Timer1: TTimer;
    imgDll: TImage;
    imgBancoDeDados: TImage;
    imgConfiguracoes: TImage;
    imgInicializando: TImage;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizarStatus(Mensagem: String; Imagem: TImage);
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

procedure TfrmSplash.AtualizarStatus(Mensagem: String; Imagem: TImage);
begin
  lbStatus.Caption := Mensagem;
  Imagem.Visible := True;
end;

procedure TfrmSplash.Timer1Timer(Sender: TObject);
begin
  if progressBar1.Position <= 100 then
  begin
    progressBar1.StepIt;
    case progressBar1.Position of
      10: AtualizarStatus('Carregando dependências...', imgDll);
      25: AtualizarStatus('Conectando ao Banco de Dados...', imgBancoDeDados);
      45: AtualizarStatus('Carregando as configurações...', imgConfiguracoes);
      75: AtualizarStatus('Iniciando o Sistema !', imgInicializando);
    end;
  end;
  if progressBar1.Position = 100 then
  begin
    Close;
  end;
end;

end.
