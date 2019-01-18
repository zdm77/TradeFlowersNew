object frameProduct: TframeProduct
  Left = 0
  Top = 0
  Width = 945
  Height = 539
  TabOrder = 0
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alLeft
    PanelStyle.Active = True
    TabOrder = 0
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
      FindPanel.ApplyInputDelay = 200
      FindPanel.DisplayMode = fpdmAlways
      FindPanel.InfoText = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
      FindPanel.ShowClearButton = False
      FindPanel.ShowCloseButton = False
      FindPanel.ShowFindButton = False
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      Navigator.Buttons.CustomButtons = <>
      OptionsBehavior.ExpandOnDblClick = False
      OptionsBehavior.ExpandOnIncSearch = True
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      RootValue = -1
      TabOrder = 0
      OnClick = lstCategoryClick
      OnDblClick = lstCategoryDblClick
      ExplicitLeft = 3
      ExplicitTop = 45
      object columnNameC: TcxDBTreeListColumn
        Caption.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
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
        OnClick = btnDelClick
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 377
    Top = 0
    Width = 8
    Height = 539
    HotZoneClassName = 'TcxMediaPlayer9Style'
    Control = cxGroupBox1
  end
  object cxGroupBox3: TcxGroupBox
    Left = 385
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 2
    ExplicitLeft = 383
    Height = 539
    Width = 560
    object gridProduct: TcxGrid
      Left = 2
      Top = 49
      Width = 556
      Height = 488
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      ExplicitLeft = 101
      ExplicitTop = 81
      ExplicitWidth = 427
      ExplicitHeight = 361
      object viewProduct: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        FilterBox.Position = fpTop
        FilterBox.Visible = fvNever
        FindPanel.ApplyInputDelay = 200
        FindPanel.DisplayMode = fpdmAlways
        FindPanel.InfoText = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
        FindPanel.ShowClearButton = False
        FindPanel.ShowCloseButton = False
        FindPanel.ShowFindButton = False
        DataController.DataSource = dsProduct
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
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
    object cxGroupBox4: TcxGroupBox
      Left = 2
      Top = 2
      Align = alTop
      PanelStyle.Active = True
      PanelStyle.OfficeBackgroundKind = pobkStyleColor
      TabOrder = 1
      ExplicitLeft = 4
      ExplicitTop = 10
      Height = 47
      Width = 556
      object btnProductAdd: TButton
        Left = 3
        Top = 9
        Width = 86
        Height = 32
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        ImageIndex = 3
        Images = frmMain.imgMidle
        TabOrder = 0
        OnClick = btnProductAddClick
      end
      object btnProductEdt: TButton
        Left = 89
        Top = 5
        Width = 37
        Height = 32
        ImageAlignment = iaCenter
        ImageIndex = 4
        Images = frmMain.imgMidle
        TabOrder = 1
        OnClick = btnProductEdtClick
      end
      object btnProductDel: TButton
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
