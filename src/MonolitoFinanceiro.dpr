program MonolitoFinanceiro;

uses
  Vcl.Forms,
  vPrincipal in 'view\vPrincipal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
