object frmProps: TfrmProps
  Left = 0
  Top = 0
  Caption = 'frmProps'
  ClientHeight = 561
  ClientWidth = 811
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
  inline frameTopPanelMain1: TframeTopPanelMain
    Left = 0
    Top = 0
    Width = 811
    Height = 34
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 811
    inherited barProduct: TdxBarManager
      DockControlHeights = (
        0
        0
        69
        0)
    end
  end
  inline frameProps1: TframeProps
    Left = 0
    Top = 34
    Width = 811
    Height = 527
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 34
    ExplicitWidth = 527
    ExplicitHeight = 803
    inherited gridProps: TcxGrid
      inherited viewProps: TcxGridDBTableView
        inherited columnName: TcxGridDBColumn
          LayoutItem = viewPropsLayoutItem1.Owner
        end
        inherited columnProd: TcxGridDBColumn
          LayoutItem = viewPropsLayoutItem2.Owner
        end
        inherited columnPropsColumn1: TcxGridDBColumn
          LayoutItem = viewPropsLayoutItem3.Owner
        end
        inherited viewPropsRootGroup: TcxGridInplaceEditFormGroup
          Index = -1
        end
        inherited viewPropsLayoutItem1: TcxGridInplaceEditFormLayoutItem
          SizeOptions.Width = 440
          Index = 0
        end
        inherited viewPropsLayoutItem2: TcxGridInplaceEditFormLayoutItem
          SizeOptions.Width = 135
          Index = 1
        end
        inherited viewPropsLayoutItem3: TcxGridInplaceEditFormLayoutItem
          Index = -1
        end
      end
    end
    inherited queryProps: TUniQuery
      Active = False
    end
  end
end
