object frameProps: TframeProps
  Left = 0
  Top = 0
  Width = 436
  Height = 585
  TabOrder = 0
  object gridProps: TcxGrid
    Left = 8
    Top = 40
    Width = 377
    Height = 489
    TabOrder = 0
    object viewProps: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsProps
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.EditMode = emInplaceEditForm
      object columnName: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'name'
        Width = 488
      end
    end
    object levelGrid1Level1: TcxGridLevel
      GridView = viewProps
    end
  end
  object btnAdd: TButton
    Left = 8
    Top = 9
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = btnAddClick
  end
  object btnEdit: TButton
    Left = 89
    Top = 9
    Width = 88
    Height = 25
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 2
    OnClick = btnEditClick
  end
  object btnDel: TButton
    Left = 183
    Top = 9
    Width = 88
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 3
    OnClick = btnDelClick
  end
  object dsProps: TUniDataSource
    DataSet = queryProps
    Left = 72
    Top = 536
  end
  object queryProps: TUniQuery
    Connection = DMMain.conMain
    Left = 152
    Top = 536
  end
end
