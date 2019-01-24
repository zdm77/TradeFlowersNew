object FrameContragent: TFrameContragent
  Left = 0
  Top = 0
  Width = 981
  Height = 609
  TabOrder = 0
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 0
    Height = 609
    Width = 981
    object cxGroupBox1: TcxGroupBox
      Left = 2
      Top = 2
      Align = alLeft
      Caption = #1058#1080#1087#1099
      TabOrder = 0
      Height = 605
      Width = 215
      object gridType: TcxGrid
        Left = 2
        Top = 18
        Width = 211
        Height = 585
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = True
        object viewType: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          FilterBox.Position = fpTop
          FilterBox.Visible = fvNever
          FindPanel.ApplyInputDelay = 200
          FindPanel.InfoText = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
          FindPanel.ShowCloseButton = False
          FindPanel.ShowFindButton = False
          OnCellClick = viewTypeCellClick
          DataController.DataSource = dsType
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          DataController.OnFilterRecord = viewContragentDataControllerFilterRecord
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.GroupByBox = False
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'name'
            Width = 435
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = viewType
        end
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 217
      Top = 2
      Width = 8
      Height = 605
      HotZoneClassName = 'TcxMediaPlayer9Style'
    end
    object cxGroupBox2: TcxGroupBox
      Left = 225
      Top = 2
      Align = alClient
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099
      TabOrder = 2
      Height = 605
      Width = 754
      object cxGroupBox4: TcxGroupBox
        Left = 2
        Top = 18
        Align = alTop
        PanelStyle.Active = True
        TabOrder = 0
        Height = 39
        Width = 750
        object btnAdd: TButton
          Left = 3
          Top = 3
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
          Top = 3
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
          Top = 3
          Width = 37
          Height = 32
          ImageAlignment = iaCenter
          ImageIndex = 5
          Images = frmMain.imgMidle
          TabOrder = 2
        end
        object btnRefresh: TButton
          Left = 163
          Top = 3
          Width = 37
          Height = 32
          ImageAlignment = iaCenter
          ImageIndex = 11
          Images = frmMain.imgMidle
          TabOrder = 3
        end
      end
      object cxGroupBox5: TcxGroupBox
        Left = 2
        Top = 57
        Align = alClient
        PanelStyle.Active = True
        TabOrder = 1
        Height = 546
        Width = 750
        object gridContragent: TcxGrid
          Left = 2
          Top = 2
          Width = 746
          Height = 542
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = True
          object viewContragent: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            FilterBox.Position = fpTop
            FilterBox.Visible = fvNever
            FindPanel.ApplyInputDelay = 200
            FindPanel.DisplayMode = fpdmAlways
            FindPanel.InfoText = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
            FindPanel.ShowCloseButton = False
            FindPanel.ShowFindButton = False
            DataController.DataSource = dsContragentView
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            DataController.OnFilterRecord = viewContragentDataControllerFilterRecord
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
          end
          object level1: TcxGridLevel
            GridView = viewContragent
          end
        end
      end
    end
  end
  object queryType: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'SELECT *'
      'FROM dictonary.contragent_type')
    Left = 392
    Top = 224
  end
  object dsType: TUniDataSource
    DataSet = queryType
    Left = 384
    Top = 360
  end
  object dsContragentView: TUniDataSource
    DataSet = queryContragentView
    Left = 544
    Top = 464
  end
  object queryContragentView: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'SELECT *'
      'FROM dictonary.contragent'
      'ORDER BY name')
    MasterSource = dsType
    MasterFields = 'id'
    DetailFields = 'contragent_type_id'
    Left = 336
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        Value = nil
      end>
    object fieldContragentId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object fieldContragentName: TStringField
      FieldName = 'name'
      Size = 255
    end
    object fieldContragentTypeId: TIntegerField
      FieldName = 'contragent_type_id'
      Required = True
    end
  end
end
