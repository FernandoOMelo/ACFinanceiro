unit vPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    menuPrincipal: TMainMenu;
    menuCadastro: TMenuItem;
    menuRelatorios: TMenuItem;
    menuAjuda: TMenuItem;
    menuUsuarios: TMenuItem;
    StatusBar1: TStatusBar;
    tmrRelogio: TTimer;
    procedure menuUsuariosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrRelogioTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  vCadastroPadrao,
  vSplash,
  vCadastroUsuarios,
  vLogin,
  mUsuarios, vRedefinirSenha;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  frmSplash := TFrmSplash.Create(nil);
  try
    frmSplash.ShowModal;
  finally
    FreeAndNil(frmSplash);
  end;

  frmLogin := TFrmLogin.Create(nil);
  try
    frmLogin.ShowModal;
    if frmLogin.ModalResult <> mrOk then
      Application.Terminate;
  finally
    FreeAndNil(frmLogin);
  end;

  if dmUsuarios.GetUsuarioLogado.SenhaTemp then
  begin
    frmRedefinirSenha := TFrmRedefinirSenha.Create(nil);
    try
      frmRedefinirSenha.Usuario := dmUsuarios.GetUsuarioLogado;
      frmRedefinirSenha.ShowModal;
      if frmRedefinirSenha.ModalResult <> mrOk then
        Application.Terminate;
    finally
      FreeAndNil(frmRedefinirSenha);
    end;
  end;


  StatusBar1.Panels.Items[1].Text := 'Usuário: ' + dmUsuarios.GetUsuarioLogado.Nome;

end;

procedure TfrmPrincipal.menuUsuariosClick(Sender: TObject);
begin
  frmUsuarios.Show;
end;

procedure TfrmPrincipal.tmrRelogioTimer(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(now);
end;

end.
