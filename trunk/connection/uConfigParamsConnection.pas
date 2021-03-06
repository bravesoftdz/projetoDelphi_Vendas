unit uConfigParamsConnection;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, uConfigConnection;

type
  TFrmConfigParamsConnection = class(TForm)
    Label1: TLabel;
    edtSenha: TEdit;
    edtPorta: TEdit;
    lblSenha: TLabel;
    lblPorta: TLabel;
    edtUsuario: TEdit;
    edtServidor: TEdit;
    edtDatabase: TEdit;
    lblUsuario: TLabel;
    lblDatabase: TLabel;
    btnConectar: TButton;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
  private
    FCadastroINI: TConnectionConfig;

    function ValidarCampos(): Boolean;

    procedure CriarINIdeConexao();
  public
    { Public declarations }
  end;

var
  FrmConfigParamsConnection: TFrmConfigParamsConnection;

implementation

{$R *.dfm}

procedure TFrmConfigParamsConnection.btnConectarClick(Sender: TObject);
begin
  if ValidarCampos() then
    CriarINIdeConexao();
end;

procedure TFrmConfigParamsConnection.CriarINIdeConexao;
begin
  FCadastroINI.Port := edtPorta.Text;
  FCadastroINI.Password := edtSenha.Text;
  FCadastroINI.Server := edtServidor.Text;
  FCadastroINI.UserName := edtUsuario.Text;
  FCadastroINI.DataBase := edtDatabase.Text;

  FCadastroINI.CreateConfigINI(FCadastroINI);

  Self.ModalResult := mrOk;
end;

procedure TFrmConfigParamsConnection.FormCreate(Sender: TObject);
begin
  FCadastroINI := TConnectionConfig.Create;
end;

procedure TFrmConfigParamsConnection.FormDestroy(Sender: TObject);
begin
  FCadastroINI.Free;
end;

function TFrmConfigParamsConnection.ValidarCampos(): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to Pred(ComponentCount) do
  begin
    if (Components[I] is TEdit) then
      if TEdit(Components[I]).Text = EmptyStr then
      begin
        Result := False;
        TEdit(Components[I]).SetFocus;
        Application.MessageBox('Preencha o campo ', 'Aten��o', MB_OK+MB_ICONWARNING);
        Break;
      end;
  end;
end;

end.
