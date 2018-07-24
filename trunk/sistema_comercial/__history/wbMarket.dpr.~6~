program wbMarket;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uLogin in 'uLogin.pas' {Form2},
  uCadastroUsuario in 'uCadastroUsuario.pas' {FormCadastroUsuario},
  cUsuario in '..\classes\cUsuario.pas',
  uDAOUsuario in '..\classes\uDAOUsuario.pas',
  uClasseConexao in '..\classes\ClassesDAO\uClasseConexao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TFormCadastroUsuario, FormCadastroUsuario);
  Application.Run;
end.
