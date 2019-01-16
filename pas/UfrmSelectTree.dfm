object frmSelectTree: TfrmSelectTree
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmSelectTree'
  ClientHeight = 551
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    TabOrder = 0
    Height = 49
    Width = 642
    object btnSelect: TButton
      Left = 3
      Top = 5
      Width = 86
      Height = 38
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 12
      Images = frmMain.imgMidle
      TabOrder = 0
      OnClick = btnSelectClick
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 49
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 41
    Height = 502
    Width = 642
    object lstCategory: TcxDBTreeList
      Left = 2
      Top = 2
      Width = 638
      Height = 498
      Align = alClient
      Bands = <
        item
        end>
      DataController.DataSource = dsCategory
      DataController.ParentField = 'pid'
      DataController.KeyField = 'id'
      Navigator.Buttons.CustomButtons = <>
      OptionsData.Editing = False
      OptionsData.Deleting = False
      RootValue = -1
      TabOrder = 0
      ExplicitLeft = 5
      ExplicitTop = 110
      ExplicitWidth = 289
      ExplicitHeight = 349
      object columnNameC: TcxDBTreeListColumn
        Caption.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'name'
        Width = 280
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
  end
  object dsCategory: TUniDataSource
    DataSet = queryCategoty
    Left = 184
    Top = 456
  end
  object queryCategoty: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'select * from category')
    Left = 264
    Top = 456
  end
end
