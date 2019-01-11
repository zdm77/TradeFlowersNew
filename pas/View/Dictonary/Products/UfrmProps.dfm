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
    Top = 34
    Width = 811
    Height = 527
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 811
    ExplicitHeight = 561
    inherited gridProps: TcxGrid
      Left = 0
      Top = 0
      Width = 811
      Height = 527
      Align = alClient
      ExplicitLeft = 0
      ExplicitTop = -16
      ExplicitWidth = 811
      ExplicitHeight = 527
      inherited viewProps: TcxGridDBTableView
        Navigator.Buttons.ConfirmDelete = True
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        EditForm.MasterRowDblClickAction = dcaShowEditForm
        NewItemRow.InfoText = #1044#1086#1073#1072#1074#1080#1090#1100
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.NavigatorHints = True
        OptionsBehavior.EditAutoHeight = eahEditor
        OptionsBehavior.EditMode = emInplaceEditForm
        OptionsView.ShowEditButtons = gsebAlways
        OptionsView.GroupByBox = False
        OptionsView.ShowColumnFilterButtons = sfbAlways
        Preview.AutoHeight = False
        Preview.Visible = True
        inherited columnName: TcxGridDBColumn
          PropertiesClassName = 'TcxComboBoxProperties'
        end
      end
    end
    inherited btnAdd: TButton
      Left = 442
      Top = 252
      ExplicitLeft = 442
      ExplicitTop = 252
    end
    inherited btnEdit: TButton
      Left = 428
      Top = 310
      ExplicitLeft = 428
      ExplicitTop = 310
    end
    inherited btnDel: TButton
      Left = 425
      Top = 371
      ExplicitLeft = 425
      ExplicitTop = 371
    end
  end
  inline frameTopPanelMain1: TframeTopPanelMain
    Left = 0
    Top = 0
    Width = 811
    Height = 34
    Align = alTop
    TabOrder = 1
    ExplicitLeft = -201
    ExplicitTop = 7
    inherited barProduct: TdxBarManager
      DockControlHeights = (
        0
        0
        69
        0)
      inherited btnSel: TdxBarLargeButton
        OnClick = nil
      end
      inherited btnPrint: TdxBarLargeButton
        OnClick = nil
      end
    end
  end
end
