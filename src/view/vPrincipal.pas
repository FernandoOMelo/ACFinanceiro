unit vPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    menuPrincipal: TMainMenu;
    menuCadastro: TMenuItem;
    menuRelatorios: TMenuItem;
    menuAjuda: TMenuItem;
    menuCadastroPadrao: TMenuItem;
    procedure menuCadastroPadraoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  vCadastroPadrao;

{$R *.dfm}

procedure TfrmPrincipal.menuCadastroPadraoClick(Sender: TObject);
begin
  frmCadastroPadrao.Show;
end;

end.
