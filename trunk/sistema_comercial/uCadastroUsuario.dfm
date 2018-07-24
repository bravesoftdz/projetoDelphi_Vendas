object FormCadastroUsuario: TFormCadastroUsuario
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro Usu'#225'rio'
  ClientHeight = 209
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 27
    Width = 36
    Height = 15
    Caption = 'Nome:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 37
    Top = 62
    Width = 35
    Height = 15
    Caption = 'Senha:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 32
    Top = 95
    Width = 42
    Height = 15
    Caption = 'Fun'#231#227'o:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object edtSenha: TMaskEdit
    Left = 81
    Top = 56
    Width = 344
    Height = 23
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = ''
  end
  object edtNome: TMaskEdit
    Left = 81
    Top = 21
    Width = 344
    Height = 23
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = ''
  end
  object comboFuncao: TComboBox
    Left = 81
    Top = 91
    Width = 216
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Items.Strings = (
      'Vendedor'
      'Gerente'
      'Caixa'
      'Estoquista'
      'Diretor'
      'Supervisor'
      'Motorista'
      'Auxiliar de Escrit'#243'rio')
  end
  object btnSalvar: TButton
    Left = 272
    Top = 160
    Width = 75
    Height = 25
    Caption = '&Salvar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnSalvarClick
  end
  object btnCancelar: TButton
    Left = 353
    Top = 160
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object FDConnection1: TFDConnection
    Left = 392
    Top = 104
  end
  object FDManager1: TFDManager
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 344
    Top = 112
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 200
    Top = 144
  end
end
