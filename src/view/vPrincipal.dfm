object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Monolito Financeiro'
  ClientHeight = 671
  ClientWidth = 898
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = menuPrincipal
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object StatusBar1: TStatusBar
    Left = 0
    Top = 640
    Width = 898
    Height = 31
    Panels = <
      item
        Width = 200
      end
      item
        Width = 300
      end>
  end
  object menuPrincipal: TMainMenu
    Left = 856
    Top = 8
    object menuCadastro: TMenuItem
      Caption = 'Cadastros'
      object menuUsuarios: TMenuItem
        Caption = 'Cadastro Usuarios'
        OnClick = menuUsuariosClick
      end
    end
    object menuRelatorios: TMenuItem
      Caption = 'Relat'#243'rios'
    end
    object menuAjuda: TMenuItem
      Caption = 'Ajuda'
    end
  end
  object tmrRelogio: TTimer
    OnTimer = tmrRelogioTimer
    Left = 856
    Top = 296
  end
end
