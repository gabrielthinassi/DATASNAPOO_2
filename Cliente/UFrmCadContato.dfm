object FrmCadContato: TFrmCadContato
  Left = 0
  Top = 0
  Caption = 'Cadastro de Contato'
  ClientHeight = 400
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 60
    Align = alTop
    TabOrder = 0
    OnExit = pnlTopExit
    object pnlNavegacao: TPanel
      Left = 376
      Top = 1
      Width = 223
      Height = 58
      Align = alRight
      TabOrder = 0
      object btnUltimo: TBitBtn
        Left = 168
        Top = 1
        Width = 54
        Height = 56
        Align = alRight
        Caption = '>|'
        TabOrder = 0
        OnClick = btnUltimoClick
      end
      object btnProximo: TBitBtn
        Left = 114
        Top = 1
        Width = 54
        Height = 56
        Align = alRight
        Caption = '>'
        TabOrder = 1
        OnClick = btnProximoClick
      end
      object btnAnterior: TBitBtn
        Left = 60
        Top = 1
        Width = 54
        Height = 56
        Align = alRight
        Caption = '<'
        TabOrder = 2
        OnClick = btnAnteriorClick
      end
      object btnPrimeiro: TBitBtn
        Left = 6
        Top = 1
        Width = 54
        Height = 56
        Align = alRight
        Caption = '|<'
        TabOrder = 3
        OnClick = btnPrimeiroClick
      end
    end
    object edtCodigo: TJvCalcEdit
      Left = 24
      Top = 20
      Width = 121
      Height = 21
      ImageKind = ikEllipsis
      TabOrder = 1
      ZeroEmpty = False
      DecimalPlacesAlwaysShown = False
      OnButtonClick = edtCodigoButtonClick
      OnKeyPress = edtCodigoKeyPress
    end
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 60
    Width = 161
    Height = 340
    Align = alLeft
    TabOrder = 1
    object btnIncluir: TBitBtn
      Left = 1
      Top = 1
      Width = 159
      Height = 56
      Align = alTop
      Caption = '&Incluir'
      TabOrder = 0
    end
    object btnConsultar: TBitBtn
      Left = 1
      Top = 225
      Width = 159
      Height = 56
      Align = alTop
      Caption = 'C&onsultar'
      TabOrder = 1
      OnClick = btnConsultarClick
    end
    object btnExcluir: TBitBtn
      Left = 1
      Top = 57
      Width = 159
      Height = 56
      Align = alTop
      Caption = '&Excluir'
      TabOrder = 2
    end
    object btnGravar: TBitBtn
      Left = 1
      Top = 113
      Width = 159
      Height = 56
      Align = alTop
      Caption = '&Gravar'
      TabOrder = 3
    end
    object btnCancelar: TBitBtn
      Left = 1
      Top = 169
      Width = 159
      Height = 56
      Align = alTop
      Caption = '&Cancelar'
      TabOrder = 4
    end
  end
  object pnlCenter: TPanel
    Left = 161
    Top = 60
    Width = 439
    Height = 340
    Align = alClient
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 18
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 16
      Top = 58
      Width = 55
      Height = 13
      Caption = 'Nascimento'
      FocusControl = DBEdit2
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 34
      Width = 315
      Height = 21
      DataField = 'NOME_CONTATO'
      DataSource = DSContato
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 74
      Width = 132
      Height = 21
      DataField = 'DTNASCIMENTO_CONTATO'
      DataSource = DSContato
      TabOrder = 1
    end
    object JvPageControl1: TJvPageControl
      Left = 1
      Top = 101
      Width = 437
      Height = 238
      ActivePage = TabSheet1
      Align = alBottom
      TabOrder = 2
      object TabSheet1: TTabSheet
        Caption = 'Endere'#231'o'
        object gridEndereco: TJvDBGrid
          Left = 0
          Top = 0
          Width = 429
          Height = 210
          Align = alClient
          DataSource = DSEndereco
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Telefone'
        ImageIndex = 1
        object gridTelefone: TJvDBGrid
          Left = 0
          Top = 0
          Width = 429
          Height = 210
          Align = alClient
          DataSource = DSTelefone
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
        end
      end
    end
  end
  object DSContato: TDataSource
    DataSet = DM.CDSContato
    OnStateChange = DSContatoStateChange
    OnDataChange = DSContatoDataChange
    Left = 168
    Top = 8
  end
  object DSEndereco: TDataSource
    DataSet = DM.CDSEndereco
    Left = 240
    Top = 8
  end
  object DSTelefone: TDataSource
    DataSet = DM.CDSTelefone
    Left = 312
    Top = 8
  end
end
