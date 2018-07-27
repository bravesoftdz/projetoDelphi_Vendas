program wbMarket;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  uLogin in 'uLogin.pas' {Form2},
  uCadastroUsuario in 'uCadastroUsuario.pas' {FormCadastroUsuario},
  cUsuario in '..\classes\cUsuario.pas',
  uDAOUsuario in '..\classes\uDAOUsuario.pas',
  uClasseConexao in '..\classes\ClassesDAO\uClasseConexao.pas',
  uDM in '..\connection\uDM.pas' {uDMConnection: TDataModule},
  uConfigConnection in '..\connection\uConfigConnection.pas',
  uConfigParamsConnection in '..\connection\uConfigParamsConnection.pas' {FrmConfigParamsConnection},
  uBaseDAO in '..\connection\uBaseDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TuDMConnection, uDMConnection);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;

end.
