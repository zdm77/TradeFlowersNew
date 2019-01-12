object frameProduct: TframeProduct
  Left = 0
  Top = 0
  Width = 945
  Height = 539
  TabOrder = 0
  object btnCategoryAdd: TButton
    Left = 8
    Top = 9
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 0
    OnClick = btnCategoryAddClick
  end
  object btnCategoryEdit: TButton
    Left = 89
    Top = 9
    Width = 75
    Height = 25
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 1
    OnClick = btnCategoryEditClick
  end
  object gridProduct: TcxGrid
    Left = 417
    Top = 41
    Width = 427
    Height = 361
    TabOrder = 2
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
    TabOrder = 3
  end
  object btnProdEdit: TButton
    Left = 505
    Top = 9
    Width = 75
    Height = 25
    Caption = 'btnProdEdit'
    TabOrder = 4
  end
  object lstCategory: TcxDBTreeList
    Left = 12
    Top = 94
    Width = 289
    Height = 349
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
    TabOrder = 5
    OnClick = lstCategoryClick
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
  object navCategory: TcxDBNavigator
    Left = 14
    Top = 52
    Width = 120
    Height = 32
    Buttons.OnButtonClick = navCategoryButtonsButtonClick
    Buttons.CustomButtons = <
      item
        ImageIndex = 3
      end
      item
        ImageIndex = 4
      end
      item
        ImageIndex = 5
      end
      item
        ImageIndex = 6
      end>
    Buttons.Images = frmMain.imgMidle
    Buttons.First.Visible = False
    Buttons.PriorPage.Visible = False
    Buttons.Prior.Visible = False
    Buttons.Next.Visible = False
    Buttons.NextPage.Visible = False
    Buttons.Last.Visible = False
    Buttons.Insert.ImageIndex = 3
    Buttons.Insert.Visible = False
    Buttons.Append.Visible = False
    Buttons.Delete.ImageIndex = 5
    Buttons.Delete.Visible = False
    Buttons.Edit.ImageIndex = 4
    Buttons.Edit.Visible = False
    Buttons.Post.Visible = False
    Buttons.Cancel.Visible = False
    Buttons.Refresh.ImageIndex = 6
    Buttons.Refresh.Visible = False
    Buttons.SaveBookmark.Visible = False
    Buttons.GotoBookmark.Visible = False
    Buttons.Filter.Visible = False
    DataSource = dsCategory
    TabOrder = 6
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
