object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Principal'
  ClientHeight = 241
  ClientWidth = 515
  Color = clBtnFace
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 515
    Height = 241
    Align = alClient
    TabOrder = 0
    object imgTeste: TImage
      Left = 1
      Top = 1
      Width = 513
      Height = 198
      Align = alClient
      ExplicitLeft = 192
      ExplicitTop = 56
      ExplicitWidth = 105
      ExplicitHeight = 105
    end
    object pnlBotoes: TPanel
      Left = 1
      Top = 199
      Width = 513
      Height = 41
      Align = alBottom
      TabOrder = 0
      object btnCarregarImagem: TButton
        Left = 405
        Top = 1
        Width = 107
        Height = 39
        Align = alRight
        Caption = 'Carregar imagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnCarregarImagemClick
      end
      object edtBusca: TEdit
        Left = 1
        Top = 1
        Width = 398
        Height = 39
        Hint = 'Digite o titulo da imagem de que busca'
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnKeyPress = edtBuscaKeyPress
      end
    end
  end
end
