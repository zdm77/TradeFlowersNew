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
  inline frameTopPanel1: TframeTopPanel
    Left = 0
    Top = 28
    Width = 981
    Height = 38
    Align = alTop
    TabOrder = 1
    ExplicitTop = 28
    ExplicitWidth = 981
    inherited cxGroupBox4: TcxGroupBox
      ExplicitWidth = 981
      Width = 981
      inherited btnAdd: TButton
        OnClick = frameTopPanel1btnAddClick
      end
      inherited btnEdit: TButton
        OnClick = frameTopPanel1btnEditClick
      end
      inherited btnDel: TButton
        OnClick = frameTopPanel1btnDelClick
      end
      inherited chkShowDel: TCheckBox
        OnClick = frameTopPanel1chkShowDelClick
      end
      inherited btnRestore: TButton
        OnClick = frameTopPanel1btnRestoreClick
      end
    end
  end
  object gridContragent: TcxGrid
    Left = 0
    Top = 66
    Width = 981
    Height = 543
    Align = alClient
    TabOrder = 2
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = True
    ExplicitLeft = 3
    ExplicitTop = 62
    object viewContragent: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      FilterBox.Position = fpTop
      FilterBox.Visible = fvNever
      FindPanel.ApplyInputDelay = 200
      FindPanel.DisplayMode = fpdmAlways
      FindPanel.InfoText = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
      FindPanel.ShowCloseButton = False
      FindPanel.ShowFindButton = False
      DataController.DataSource = dsContr
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
    end
    object level1: TcxGridLevel
      GridView = viewContragent
    end
  end
  object btn1: TButton
    Left = 328
    Top = 432
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 3
    OnClick = btn1Click
  end
  object memContrType: TMemTableEh
    Params = <>
    Left = 376
    Top = 264
  end
  object dsContr: TUniDataSource
    DataSet = memContr
    Left = 552
    Top = 264
  end
  object memContr: TMemTableEh
    FetchAllOnOpen = True
    Params = <>
    DataDriver = DMMain.DataDriverContr
    Left = 464
    Top = 264
    object fieldContrid: TIntegerField
      FieldName = 'id'
    end
    object fieldContrname: TStringField
      FieldName = 'name'
      Size = 100
    end
    object fieldContrcontragent_type_id: TIntegerField
      FieldName = 'contragent_type_id'
      Required = True
    end
    object fieldContris_delete: TBooleanField
      FieldName = 'is_delete'
    end
  end
end
