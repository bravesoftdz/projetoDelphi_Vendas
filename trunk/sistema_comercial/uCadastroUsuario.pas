unit uCadastroUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, cUsuario,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB;

type
  TFormCadastroUsuario = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtSenha: TMaskEdit;
    edtNome: TMaskEdit;
    Label3: TLabel;
    comboFuncao: TComboBox;
    btnSalvar: TButton;
    btnCancelar: TButton;
    FDConnection1: TFDConnection;
    FDManager1: TFDManager;
    FDTransaction1: TFDTransaction;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
  private
    FUsuario: TUsuario;
    procedure GravarUsuario();
    procedure CriarObjetos();
    procedure DestruirObjetos();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroUsuario: TFormCadastroUsuario;

implementation

{$R *.dfm}

procedure TFormCadastroUsuario.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCadastroUsuario.btnSalvarClick(Sender: TObject);
begin
  GravarUsuario();
end;

procedure TFormCadastroUsuario.CriarObjetos;
begin
  FUsuario := TUsuario.Create();
end;

procedure TFormCadastroUsuario.DestruirObjetos;
begin
  FreeAndNil(FUsuario);
end;

procedure TFormCadastroUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DestruirObjetos();
end;

procedure TFormCadastroUsuario.FormCreate(Sender: TObject);
begin
  CriarObjetos();
end;

procedure TFormCadastroUsuario.GravarUsuario();
begin
  FUsuario.Nome     := edtNome.Text;
  FUsuario.Senha    := edtSenha.Text;
  FUsuario.id       := 0;
  FUsuario.idFuncao := comboFuncao.ItemIndex;
  FUsuario.GravarUsuarioNoBanco(FUsuario);
end;

end.
