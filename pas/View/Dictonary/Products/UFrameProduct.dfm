object frameProduct: TframeProduct
  Left = 0
  Top = 0
  Width = 811
  Height = 539
  TabOrder = 0
  object gridCategory: TcxGrid
    Left = 8
    Top = 40
    Width = 377
    Height = 361
    TabOrder = 0
    object viewCategory: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsCategory
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object columnName: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'name'
        Width = 488
      end
    end
    object levelGrid1Level1: TcxGridLevel
      GridView = viewCategory
    end
  end
  object btnCategoryAdd: TButton
    Left = 8
    Top = 9
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = btnCategoryAddClick
  end
  object btnCategoryEdit: TButton
    Left = 89
    Top = 9
    Width = 75
    Height = 25
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 2
    OnClick = btnCategoryEditClick
  end
  object dsCategory: TUniDataSource
    DataSet = queryCategoty
    Left = 184
    Top = 456
  end
  object queryCategoty: TUniQuery
    Left = 264
    Top = 456
  end
end
