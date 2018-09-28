object FrmPrincipal: TFrmPrincipal
  Left = 560
  Top = 353
  Caption = 'FrmPrincipal'
  ClientHeight = 409
  ClientWidth = 732
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 256
    Top = 152
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Contato1: TMenuItem
        Caption = 'Contato'
        OnClick = Contato1Click
      end
    end
  end
end
