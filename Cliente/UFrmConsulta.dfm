object FrmConsulta: TFrmConsulta
  Left = 0
  Top = 0
  Caption = 'FrmConsulta'
  ClientHeight = 400
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 100
    Align = alTop
    TabOrder = 0
    object cbxCampo: TJvComboBox
      Left = 24
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Nome'
      Items.Strings = (
        'Codigo'
        'Nome'
        'Nascimento')
      ItemIndex = 1
    end
    object cbxCondicao: TJvComboBox
      Left = 160
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Que cont'#233'm'
      Items.Strings = (
        'Iniciado com'
        'Terminado com'
        'Igual a'
        'Que cont'#233'm')
      ItemIndex = 3
    end
    object edtValor: TEdit
      Left = 295
      Top = 40
      Width = 162
      Height = 21
      TabOrder = 2
    end
    object btnConsultar: TBitBtn
      Left = 472
      Top = 16
      Width = 113
      Height = 33
      Caption = 'Consultar'
      TabOrder = 3
      OnClick = btnConsultarClick
    end
    object btnConfirmar: TBitBtn
      Left = 472
      Top = 55
      Width = 113
      Height = 32
      Caption = 'Confirmar'
      TabOrder = 4
      OnClick = btnConfirmarClick
    end
  end
  object gridConsulta: TJvDBGrid
    Left = 0
    Top = 100
    Width = 600
    Height = 300
    Align = alClient
    DataSource = DSConsulta
    TabOrder = 1
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
  object DSConsulta: TDataSource
    DataSet = DM.CDSConsulta
    Left = 536
    Top = 336
  end
end
