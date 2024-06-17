unit vCadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPanels, Vcl.ExtCtrls, Data.DB, System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmCadastroPadrao = class(TForm)
    pnPrincipal: TCardPanel;
    cardCadastro: TCard;
    cardPesquisa: TCard;
    pnPesquisa: TPanel;
    pnBotoes: TPanel;
    pnGrid: TPanel;
    DBGrid1: TDBGrid;
    edtPesquisar: TEdit;
    lbPesquisar: TLabel;
    btnPesquisar: TButton;
    ImageList1: TImageList;
    btnFechar: TButton;
    btnImprimir: TButton;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    Panel1: TPanel;
    Button1: TButton;
    btnSalvar: TButton;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPadrao: TfrmCadastroPadrao;

implementation

{$R *.dfm}

procedure TfrmCadastroPadrao.btnAlterarClick(Sender: TObject);
begin
  pnPrincipal.ActiveCard := cardCadastro;
end;

procedure TfrmCadastroPadrao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroPadrao.btnIncluirClick(Sender: TObject);
begin
  pnPrincipal.ActiveCard := cardCadastro;
end;

procedure TfrmCadastroPadrao.Button1Click(Sender: TObject);
begin
  pnPrincipal.ActiveCard := cardPesquisa;
end;

end.
