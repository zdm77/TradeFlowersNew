object frameProduct: TframeProduct
  Left = 0
  Top = 0
  Width = 945
  Height = 539
  TabOrder = 0
  object gridProduct: TcxGrid
    Left = 417
    Top = 41
    Width = 427
    Height = 361
    TabOrder = 0
    object viewProduct: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsProduct
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object column1: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'name'
        Width = 488
      end
    end
    object level1: TcxGridLevel
      GridView = viewProduct
    end
  end
  object btnProdAdd: TButton
    Left = 424
    Top = 8
    Width = 75
    Height = 25
    Caption = 'btnProdAdd'
    TabOrder = 1
  end
  object btnProdEdit: TButton
    Left = 505
    Top = 9
    Width = 75
    Height = 25
    Caption = 'btnProdEdit'
    TabOrder = 2
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alLeft
    PanelStyle.Active = True
    TabOrder = 3
    Height = 539
    Width = 377
    object lstCategory: TcxDBTreeList
      Left = 2
      Top = 49
      Width = 373
      Height = 488
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
      OnClick = lstCategoryClick
      ExplicitLeft = 5
      ExplicitTop = 110
      ExplicitWidth = 289
      ExplicitHeight = 349
      object columnNameC: TcxDBTreeListColumn
        DataBinding.FieldName = 'name'
        Width = 255
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 2
      Top = 2
      Align = alTop
      PanelStyle.Active = True
      PanelStyle.OfficeBackgroundKind = pobkStyleColor
      TabOrder = 1
      Height = 47
      Width = 373
      object btnAdd: TButton
        Left = 3
        Top = 5
        Width = 86
        Height = 32
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        ImageIndex = 3
        Images = frmMain.imgMidle
        TabOrder = 0
        OnClick = btnAddClick
      end
      object btnEdit: TButton
        Left = 89
        Top = 5
        Width = 37
        Height = 32
        ImageAlignment = iaCenter
        ImageIndex = 4
        Images = frmMain.imgMidle
        TabOrder = 1
        OnClick = btnEditClick
      end
      object btnDel: TButton
        Left = 126
        Top = 5
        Width = 37
        Height = 32
        ImageAlignment = iaCenter
        ImageIndex = 5
        Images = frmMain.imgMidle
        TabOrder = 2
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 377
    Top = 0
    Width = 8
    Height = 539
    HotZoneClassName = 'TcxMediaPlayer9Style'
    ExplicitLeft = 392
    ExplicitTop = 176
    ExplicitHeight = 100
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
  object dsProduct: TUniDataSource
    DataSet = queryProduct
    Left = 600
    Top = 456
  end
  object queryProduct: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'select * from product')
    DetailFields = 'product_category_id'
    Left = 672
    Top = 456
  end
end
