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
      Top = 44
      Width = 373
      Height = 493
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
      TabOrder = 1
      OnClick = lstCategoryClick
      OnDblClick = lstCategoryDblClick
      object columnNameC: TcxDBTreeListColumn
        Caption.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'name'
        Width = 120
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
      TabOrder = 0
      Height = 42
      Width = 373
      object btnAdd: TButton
        Left = 3
        Top = 4
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
        Top = 4
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
        Top = 4
        Width = 37
        Height = 32
        ImageAlignment = iaCenter
        ImageIndex = 5
        Images = frmMain.imgMidle
        TabOrder = 2
        OnClick = btnDelClick
      end
      object btnRefresh: TButton
        Left = 163
        Top = 4
        Width = 37
        Height = 32
        ImageAlignment = iaCenter
        ImageIndex = 11
        Images = frmMain.imgMidle
        TabOrder = 3
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
    Height = 539
    Width = 560
    object gridProduct: TcxGrid
      Left = 2
      Top = 44
      Width = 556
      Height = 493
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      object viewProduct: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        FilterBox.Position = fpTop
        FilterBox.Visible = fvNever
        FindPanel.ApplyInputDelay = 200
        FindPanel.DisplayMode = fpdmAlways
        FindPanel.InfoText = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
        FindPanel.ShowCloseButton = False
        FindPanel.ShowFindButton = False
        DataController.DataSource = dsProduct
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.GroupByBox = False
        object columnName: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'name'
          Width = 435
        end
        object columnBarCode: TcxGridDBColumn
          Caption = #1064#1090#1088#1080'-'#1082#1086#1076
          DataBinding.FieldName = 'barcode'
          Width = 96
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
      TabOrder = 0
      Height = 42
      Width = 556
      object btnProductAdd: TButton
        Left = 3
        Top = 5
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
      object btnProductRefresh: TButton
        Left = 163
        Top = 5
        Width = 37
        Height = 32
        ImageAlignment = iaCenter
        ImageIndex = 11
        Images = frmMain.imgMidle
        TabOrder = 3
        OnClick = btnProductRefreshClick
      end
    end
  end
  object dsCategory: TUniDataSource
    DataSet = memCategory
    Left = 184
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
  object memCategory: TMemTableEh
    Params = <>
    Left = 136
    Top = 360
    object fieldCategoryid: TIntegerField
      FieldName = 'id'
    end
    object fieldCategoryname: TStringField
      FieldName = 'name'
      Size = 100
    end
    object fieldCategorypid: TIntegerField
      FieldName = 'pid'
    end
    object fieldCategorylevel: TStringField
      FieldName = 'level'
      Size = 100
    end
    object fieldCategoryNext_level: TMemoField
      FieldName = 'next_level'
      BlobType = ftMemo
    end
    object fieldCategoryCount: TLargeintField
      FieldName = 'count'
    end
    object fieldCategoryParent_name: TStringField
      FieldName = 'p_name'
      Size = 100
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object id: TMTNumericDataFieldEh
          FieldName = 'id'
          NumericDataType = fdtIntegerEh
          AutoIncrement = True
          DisplayLabel = 'id'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object name: TMTStringDataFieldEh
          FieldName = 'name'
          StringDataType = fdtStringEh
          DisplayLabel = 'name'
          DisplayWidth = 100
          Size = 100
          Transliterate = True
        end
        object pid: TMTNumericDataFieldEh
          FieldName = 'pid'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'pid'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object level: TMTStringDataFieldEh
          FieldName = 'level'
          StringDataType = fdtStringEh
          DisplayLabel = 'level'
          DisplayWidth = 100
          Size = 100
          Transliterate = True
        end
        object p_name: TMTStringDataFieldEh
          FieldName = 'p_name'
          StringDataType = fdtStringEh
          DisplayLabel = 'p_name'
          DisplayWidth = 100
          Size = 100
          Transliterate = True
        end
        object next_level: TMTBlobDataFieldEh
          FieldName = 'next_level'
          DisplayLabel = 'next_level'
          DisplayWidth = 10
          BlobType = ftMemo
          Transliterate = True
        end
        object count: TMTNumericDataFieldEh
          FieldName = 'count'
          NumericDataType = fdtLargeintEh
          AutoIncrement = False
          DisplayLabel = 'count'
          DisplayWidth = 15
          currency = False
          Precision = 15
        end
      end
      object RecordsList: TRecordsListEh
        Data = (
          (
            1
            #1042#1089#1077
            0
            '1.'
            nil
            '1.5.'
            5)
          (
            19
            #1043#1072#1079#1086#1085#1085#1099#1077' '#1090#1088#1072#1074#1099' '#1080' '#1089#1080#1076#1077#1088#1072#1090#1099
            1
            '1.4.'
            nil
            '1.4.1.'
            1)
          (
            18
            #1043#1088#1091#1085#1090#1099
            1
            '1.3.'
            nil
            '1.3.1.'
            nil)
          (
            2
            #1057#1072#1076#1086#1074#1099#1081' '#1080#1085#1074#1077#1085#1090#1072#1088#1100
            1
            '1.1.'
            nil
            '1.1.3.'
            3)
          (
            13
            #1059#1076#1086#1073#1088#1077#1085#1080#1103
            1
            '1.2.'
            nil
            '1.2.2.'
            2)
          (
            21
            #1062#1074#1077#1090#1099
            1
            '1.5.'
            nil
            '1.5.1.'
            1)
          (
            16
            '123345'
            2
            '1.1.3.'
            nil
            '1.1.3.1.'
            nil)
          (
            11
            #1043#1088#1072#1073#1083#1080'1'
            2
            '1.1.1.'
            nil
            '1.1.1.1.'
            nil)
          (
            12
            #1051#1086#1087#1072#1090#1099
            2
            '1.1.2.'
            nil
            '1.1.2.1.'
            nil)
          (
            15
            '8888'
            13
            '1.2.1.'
            nil
            '1.2.1.1.'
            nil)
          (
            17
            '888888888'
            13
            '1.2.2.'
            nil
            '1.2.2.1.'
            nil)
          (
            20
            #1057#1080#1076#1077#1088#1072#1090#1099
            19
            '1.4.1.'
            nil
            '1.4.1.1.'
            nil)
          (
            22
            #1057#1088#1077#1079#1082#1072
            21
            '1.5.1.'
            nil
            '1.5.1.1.'
            nil)
          (
            24
            #1063#1072#1081#1085#1086'-'#1075#1080#1073#1088#1080#1076#1085#1072#1103
            23
            nil
            nil
            nil
            nil))
      end
    end
  end
  object query1: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'select * from product')
    DetailFields = 'product_category_id'
    Left = 520
    Top = 312
  end
end
