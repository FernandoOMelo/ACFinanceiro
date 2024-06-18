unit vCadastroUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, vCadastroPadrao, Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels,
  mUsuarios, Vcl.WinXCtrls;

type
  TfrmUsuarios = class(TfrmCadastroPadrao)
    DataSource1: TDataSource;
    edtNome: TEdit;
    edtLogin: TEdit;
    edtSenha: TEdit;
    btnStatus: TToggleSwitch;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

uses
  cUtils;

{$R *.dfm}

procedure TfrmUsuarios.btnAlterarClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.Edit;

  edtNome.Text := dmUsuarios.cdsUsuariosNOME.AsString;
  edtLogin.Text := dmUsuarios.cdsUsuariosLOGIN.AsString;
  edtSenha.Text := dmUsuarios.cdsUsuariosSENHA.AsString;
  btnStatus.State := tssOn;
  if dmUsuarios.cdsUsuariosSTATUS.AsString = 'D' then
    btnStatus.State := tssOff;
end;

procedure TfrmUsuarios.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja realmente excluir o registro?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) <> mrYes then
    exit;

  try
    dmUsuarios.cdsUsuarios.Delete;
    dmUsuarios.cdsUsuarios.ApplyUpdates(0);
    Application.MessageBox('Registro excluido com sucesso.', 'Atenção', MB_OK + MB_ICONWARNING);
  except on E: Exception do
    Application.MessageBox(PWideChar(E.Message), 'Erro ao excluir registro', MB_OK + MB_ICONERROR);
  end;

end;

procedure TfrmUsuarios.btnIncluirClick(Sender: TObject);
begin
  inherited;
  LimparCampos;
  dmUsuarios.cdsUsuarios.Insert;
end;

procedure TfrmUsuarios.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.Close;
  dmUsuarios.cdsUsuarios.CommandText := 'SELECT * FROM USUARIOS';
  dmUsuarios.cdsUsuarios.Open;
end;

procedure TfrmUsuarios.btnSalvarClick(Sender: TObject);
var
  lStatus: String;
  Mensagem: String;
begin
  if edtNome.Text = '' then
  begin
    edtNome.SetFocus;
    Application.MessageBox('O campo NOME não pode ser vazio.', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  if edtLogin.Text = '' then
  begin
    edtLogin.SetFocus;
    Application.MessageBox('O campo LOGIN não pode ser vazio.', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;
    if edtSenha.Text = '' then
  begin
    edtNome.SetFocus;
    Application.MessageBox('O campo SENHA não pode ser vazio.', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if dmUsuarios.TemLoginCadastrado(Trim(edtLogin.Text), dmUsuarios.cdsUsuarios.FieldByName('ID').AsString) then
  begin
    edtSenha.SetFocus;
    Application.MessageBox(PWideChar(Format('O login %s já se encontra cadastrado.', [edtLogin.Text])), 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;


  lStatus := 'A';

  if btnStatus.State = tssOff then
    lStatus := 'B';

  Mensagem := 'Registro Alterado com Sucesso';



  if dmUsuarios.cdsUsuarios.State in [dsInsert] then
  begin
    Mensagem := 'Registro Incluido com Sucesso';
    dmUsuarios.cdsUsuariosID.AsString := TUtils.GetID;
    dmUsuarios.cdsUsuariosDATA_CADASTRO.AsDateTime := now;
  end;

  dmUsuarios.cdsUsuariosNOME.AsString := Trim(edtNome.Text);
  dmUsuarios.cdsUsuariosLOGIN.AsString := Trim(edtLogin.Text);
  dmUsuarios.cdsUsuariosSENHA.AsString := Trim(edtSenha.Text);
  dmUsuarios.cdsUsuariosSTATUS.AsString := Trim(lStatus);

  dmUsuarios.cdsUsuarios.Post;
  dmUsuarios.cdsUsuarios.ApplyUpdates(0);

  Application.MessageBox(PWideChar(Mensagem), 'Atenção', MB_OK + MB_ICONINFORMATION);

  pnPrincipal.ActiveCard := cardPesquisa;

  inherited;

end;

procedure TfrmUsuarios.Button1Click(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.Cancel;
end;

procedure TfrmUsuarios.FormShow(Sender: TObject);
begin
  inherited;
  pnPrincipal.ActiveCard := cardPesquisa;
end;

procedure TfrmUsuarios.LimparCampos;
var
  Contador: Integer;
begin
  for Contador := 0 to Pred(ComponentCount) do
  begin
    if Components[Contador] is TCustomEdit then
    begin
      TCustomEdit(Components[Contador]).Clear
    end
    else if Components[Contador] is TToggleSwitch then
    begin
      TToggleSwitch(Components[Contador]).State := tssOn;
    end;
  end;
end;

end.
