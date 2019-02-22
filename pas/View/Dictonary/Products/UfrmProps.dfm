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
  inline frameProps1: TframeProps
    Left = 0
    Top = 0
    Width = 811
    Height = 561
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 811
    ExplicitHeight = 561
    inherited cxGroupBox1: TcxGroupBox
      ExplicitWidth = 811
      Width = 811
    end
    inherited cxGroupBox2: TcxGroupBox
      ExplicitWidth = 811
      ExplicitHeight = 523
      Height = 523
      Width = 811
      inherited gridProps: TcxGrid
        Width = 807
        Height = 519
        ExplicitWidth = 807
        ExplicitHeight = 519
        inherited viewProps: TcxGridDBTableView
          inherited columnName: TcxGridDBColumn
            LayoutItem = viewPropsLayoutItem1.Owner
          end
          inherited viewPropsLayoutItem1: TcxGridInplaceEditFormLayoutItem
            SizeOptions.Width = 440
          end
        end
      end
    end
  end
end
