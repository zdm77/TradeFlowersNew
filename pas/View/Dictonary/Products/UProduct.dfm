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
  OldCreateOrder = False
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
        Height = 462
        OptionsBehavior.ExpandOnDblClick = True
        OptionsBehavior.ExpandOnIncSearch = False
        ExplicitHeight = 462
      end
      inherited frameTopPanel1: TframeTopPanel
        inherited cxGroupBox4: TcxGroupBox
          inherited chkShowDel: TCheckBox
            ExplicitLeft = 310
            ExplicitTop = 2
          end
        end
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
        Height = 462
        ExplicitWidth = 514
        ExplicitHeight = 462
        inherited viewProduct: TcxGridDBTableView
          OnDblClick = frameProduct1viewProductDblClick
        end
      end
      inherited frameTopPanel2: TframeTopPanel
        Width = 514
        ExplicitWidth = 514
        inherited cxGroupBox4: TcxGroupBox
          ExplicitWidth = 514
          Width = 514
          inherited btnImport: TButton
            OnClick = frameTopPanel2btnImportClick
          end
        end
      end
    end
  end
end
