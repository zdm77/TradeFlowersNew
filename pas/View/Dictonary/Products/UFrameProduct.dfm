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
      Top = 40
      Width = 373
      Height = 497
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
      OptionsView.ColumnAutoWidth = True
      RootValue = -1
      TabOrder = 1
      OnClick = lstCategoryClick
      OnDblClick = lstCategoryDblClick
      object columnNameC: TcxDBTreeListColumn
        Caption.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'name'
        Width = 342
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
    inline frameTopPanel1: TframeTopPanel
      Left = 2
      Top = 2
      Width = 373
      Height = 38
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 2
      ExplicitWidth = 373
      inherited cxGroupBox4: TcxGroupBox
        ExplicitWidth = 373
        Width = 373
        inherited btnAdd: TButton
          OnClick = frameTopPanel1btnAddClick
        end
        inherited btnEdit: TButton
          OnClick = frameTopPanel1btnEditClick
        end
        inherited chkShowDel: TCheckBox
          Visible = False
        end
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
      Top = 40
      Width = 556
      Height = 497
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
    inline frameTopPanel2: TframeTopPanel
      Left = 2
      Top = 2
      Width = 556
      Height = 38
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 2
      ExplicitWidth = 556
      inherited cxGroupBox4: TcxGroupBox
        ExplicitWidth = 556
        Width = 556
        inherited btnAdd: TButton
          OnClick = frameTopPanel2btnAddClick
        end
        inherited btnEdit: TButton
          OnClick = frameTopPanel2btnEditClick
        end
        inherited btnRefresh: TButton
          OnClick = frameTopPanel2btnRefreshClick
        end
        inherited chkShowDel: TCheckBox
          Visible = False
        end
        inherited btnImport: TButton
          OnClick = frameTopPanel2btnImportClick
        end
      end
    end
  end
  object dsCategory: TUniDataSource
    DataSet = memCategory
    Left = 184
    Top = 456
  end
  object dsProduct: TUniDataSource
    DataSet = memProduct
    Left = 720
    Top = 312
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
    DataDriver = DataDriverCategory
    Left = 152
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
  end
  object queryLevel: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'select * from product')
    DetailFields = 'product_category_id'
    Left = 520
    Top = 312
  end
  object memProduct: TMemTableEh
    Params = <>
    DataDriver = DataDriverProduct
    Left = 632
    Top = 312
    object fieldProductlevel: TStringField
      FieldName = 'level'
      Required = True
      Size = 100
    end
    object fieldProductid: TIntegerField
      FieldName = 'id'
    end
    object fieldProductname: TStringField
      FieldName = 'name'
      Size = 100
    end
    object fieldProductcategory_id: TIntegerField
      FieldName = 'category_id'
    end
    object fieldProductsuffix: TStringField
      FieldName = 'suffix'
      Size = 100
    end
    object fieldProductbarcode: TStringField
      FieldName = 'barcode'
      Size = 100
    end
    object fieldProductcategory_name: TStringField
      FieldName = 'category_name'
      Required = True
      Size = 100
    end
  end
  object memTmp: TMemTableEh
    Params = <>
    Left = 272
    Top = 376
    object IntegerField1: TIntegerField
      FieldName = 'id'
    end
    object StringField1: TStringField
      FieldName = 'name'
      Size = 100
    end
    object IntegerField2: TIntegerField
      FieldName = 'pid'
    end
    object StringField2: TStringField
      FieldName = 'level'
      Size = 100
    end
    object MemoField1: TMemoField
      FieldName = 'next_level'
      BlobType = ftMemo
    end
    object LargeintField1: TLargeintField
      FieldName = 'count'
    end
    object StringField3: TStringField
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
  object DataDriverCategory: TDataSetDriverEh
    ProviderDataSet = DMMain.queryCategory
    Left = 64
    Top = 360
  end
  object DataDriverProduct: TDataSetDriverEh
    ProviderDataSet = DMMain.queryProduct
    Left = 456
    Top = 256
  end
  object query1: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'select * from product')
    DetailFields = 'product_category_id'
    Left = 496
    Top = 400
  end
end
