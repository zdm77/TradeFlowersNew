object frmProduct: TfrmProduct
  Left = 0
  Top = 0
  Caption = 'frmProduct'
  ClientHeight = 504
  ClientWidth = 903
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline frameProduct1: TframeProduct
    Left = 0
    Top = 0
    Width = 903
    Height = 504
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 903
    ExplicitHeight = 504
    inherited cxGroupBox1: TcxGroupBox
      ExplicitHeight = 504
      Height = 504
      inherited lstCategory: TcxDBTreeList
        Height = 458
        OptionsBehavior.ExpandOnDblClick = True
        OptionsBehavior.ExpandOnIncSearch = False
        ExplicitLeft = -2
        ExplicitTop = 45
        ExplicitHeight = 458
      end
    end
    inherited cxSplitter1: TcxSplitter
      Height = 504
      ExplicitHeight = 504
    end
    inherited cxGroupBox3: TcxGroupBox
      ExplicitWidth = 518
      ExplicitHeight = 504
      Height = 504
      Width = 518
      inherited gridProduct: TcxGrid
        Width = 514
        Height = 458
        ExplicitWidth = 514
        ExplicitHeight = 458
      end
      inherited cxGroupBox4: TcxGroupBox
        ExplicitWidth = 514
        Width = 514
      end
    end
  end
end
