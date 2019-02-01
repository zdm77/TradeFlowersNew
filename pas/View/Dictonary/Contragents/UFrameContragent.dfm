object FrameContragent: TFrameContragent
  Left = 0
  Top = 0
  Width = 981
  Height = 609
  TabOrder = 0
  object tab1: TcxTabControl
    Left = 0
    Top = 0
    Width = 981
    Height = 28
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Properties.CustomButtons.Buttons = <>
    Properties.TabIndex = 0
    Properties.Tabs.Strings = (
      '12'
      '4')
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    OnChange = tab1Change
    ClientRectBottom = 30
    ClientRectLeft = 4
    ClientRectRight = 977
    ClientRectTop = 30
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 28
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 1
    ExplicitTop = 22
    ExplicitHeight = 587
    Height = 581
    Width = 981
    object cxGroupBox2: TcxGroupBox
      Left = 2
      Top = 2
      Align = alClient
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099
      TabOrder = 0
      ExplicitLeft = 225
      ExplicitWidth = 754
      ExplicitHeight = 583
      Height = 577
      Width = 977
      object cxGroupBox4: TcxGroupBox
        Left = 2
        Top = 18
        Align = alTop
        PanelStyle.Active = True
        TabOrder = 0
        ExplicitWidth = 750
        Height = 39
        Width = 973
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
        ExplicitWidth = 750
        ExplicitHeight = 524
        Height = 518
        Width = 973
        object gridContragent: TcxGrid
          Left = 2
          Top = 2
          Width = 969
          Height = 514
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = True
          ExplicitWidth = 746
          ExplicitHeight = 520
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
      'where contragent_type_id = :contragent_type_id'
      'ORDER BY name')
    Left = 336
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contragent_type_id'
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
  object query1: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'SELECT *'
      'FROM dictonary.contragent_type order by name')
    Left = 504
    Top = 296
  end
end
