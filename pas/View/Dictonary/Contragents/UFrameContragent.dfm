object Frame1: TFrame1
  Left = 0
  Top = 0
  Width = 715
  Height = 488
  TabOrder = 0
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    TabOrder = 0
    Height = 41
    Width = 715
    object btnAdd: TButton
      Left = 3
      Top = 5
      Width = 86
      Height = 32
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 3
      Images = frmMain.imgMidle
      TabOrder = 0
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
    object btnRefresh: TButton
      Left = 163
      Top = 5
      Width = 37
      Height = 32
      ImageAlignment = iaCenter
      ImageIndex = 11
      Images = frmMain.imgMidle
      TabOrder = 3
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 41
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 1
    ExplicitLeft = 296
    ExplicitTop = 136
    ExplicitWidth = 185
    ExplicitHeight = 105
    Height = 447
    Width = 715
    object gridProduct: TcxGrid
      Left = 2
      Top = 2
      Width = 711
      Height = 443
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      ExplicitLeft = 42
      ExplicitTop = -46
      ExplicitWidth = 556
      ExplicitHeight = 493
      object viewProduct: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        FilterBox.Position = fpTop
        FilterBox.Visible = fvNever
        FindPanel.ApplyInputDelay = 200
        FindPanel.DisplayMode = fpdmAlways
        FindPanel.InfoText = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
        FindPanel.ShowCloseButton = False
        FindPanel.ShowFindButton = False
        DataController.DataSource = dsContragent
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
        object columnType: TcxGridDBColumn
          DataBinding.FieldName = 'type_name'
          Visible = False
          GroupIndex = 0
          IsCaptionAssigned = True
        end
      end
      object level1: TcxGridLevel
        GridView = viewProduct
      end
    end
  end
  object queryContragent: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'SELECT c.id,'
      '       c.name,'
      '       c.contragent_type_id,'
      '       ct.name type_name'
      'FROM dictonary.contragent c'
      
        '     INNER JOIN dictonary.contragent_type ct ON (c.contragent_ty' +
        'pe_id = ct.id)')
    DetailFields = 'product_category_id'
    Left = 304
    Top = 312
  end
  object dsContragent: TUniDataSource
    DataSet = queryContragent
    Left = 232
    Top = 312
  end
end
