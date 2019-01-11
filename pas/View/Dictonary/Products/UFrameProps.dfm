object frameProps: TframeProps
  Left = 0
  Top = 0
  Width = 803
  Height = 644
  TabOrder = 0
  object gridProps: TcxGrid
    Left = 1
    Top = 45
    Width = 751
    Height = 482
    TabOrder = 0
    object viewProps: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsProps
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      EditForm.MasterRowDblClickAction = dcaShowEditForm
      EditForm.UseDefaultLayout = False
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.EditMode = emInplaceEditFormHideCurrentRow
      OptionsBehavior.FocusCellOnCycle = True
      OptionsView.GroupByBox = False
      object columnName: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'name'
        LayoutItem = viewPropsLayoutItem1.Owner
        Width = 100
      end
      object columnProd: TcxGridDBColumn
        DataBinding.FieldName = 'product_id'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'product_id'
        Properties.ListColumns = <
          item
            FieldName = 'p_name'
          end>
        Properties.ListSource = dsProd
        LayoutItem = viewPropsLayoutItem2.Owner
        Width = 190
      end
      object columnPropsColumn1: TcxGridDBColumn
        DataBinding.FieldName = 'chk'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = '1'
        Properties.ValueGrayed = 0
        Properties.ValueUnchecked = '0'
        LayoutItem = viewPropsLayoutItem3.Owner
      end
      object viewPropsRootGroup: TcxGridInplaceEditFormGroup
        AlignHorz = ahLeft
        AlignVert = avTop
        CaptionOptions.Text = 'Template Card'
        ButtonOptions.Buttons = <>
        Hidden = True
        ShowBorder = False
        Index = -1
      end
      object viewPropsLayoutItem1: TcxGridInplaceEditFormLayoutItem
        Parent = viewPropsRootGroup
        AlignHorz = ahLeft
        AlignVert = avTop
        Index = 0
      end
      object viewPropsLayoutItem2: TcxGridInplaceEditFormLayoutItem
        Parent = viewPropsRootGroup
        Index = 1
      end
      object viewPropsLayoutItem3: TcxGridInplaceEditFormLayoutItem
        Parent = viewPropsRootGroup
        AlignHorz = ahLeft
        AlignVert = avTop
        SizeOptions.Width = 132
        Index = 2
      end
    end
    object levelGrid1Level1: TcxGridLevel
      GridView = viewProps
    end
  end
  object nav1: TcxDBNavigator
    Left = -2
    Top = 6
    Width = 150
    Height = 32
    Buttons.CustomButtons = <
      item
        ImageIndex = 10
      end>
    Buttons.Images = frmMain.imgMidle
    Buttons.First.Visible = False
    Buttons.PriorPage.Visible = False
    Buttons.Prior.Visible = False
    Buttons.Next.Visible = False
    Buttons.NextPage.Visible = False
    Buttons.Last.Visible = False
    Buttons.Insert.ImageIndex = 3
    Buttons.Append.Visible = False
    Buttons.Delete.ImageIndex = 5
    Buttons.Edit.ImageIndex = 4
    Buttons.Post.Visible = False
    Buttons.Cancel.Visible = False
    Buttons.Refresh.ImageIndex = 6
    Buttons.SaveBookmark.Visible = False
    Buttons.GotoBookmark.Visible = False
    Buttons.Filter.Visible = False
    DataSource = dsProps
    TabOrder = 1
  end
  object dsProps: TUniDataSource
    DataSet = queryProps
    Left = 150
    Top = 433
  end
  object queryProps: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO "Props"'
      '  (name, product_id, chk)'
      'VALUES'
      '  (:name, :product_id, :chk)')
    SQLDelete.Strings = (
      'DELETE FROM view_prop_test'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE "Props"'
      'SET'
      '  name = :name,  product_id = :product_id, chk = :chk'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM view_prop_test'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      'SELECT id, name, p_name, product_id, chk FROM view_prop_test'
      'WHERE'
      '  id = :id')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM view_prop_test'
      ''
      ') t')
    Connection = DMMain.conMain
    SQL.Strings = (
      'select * from'
      'view_prop_test')
    Left = 207
    Top = 428
  end
  object queryProd: TUniQuery
    SQLUpdate.Strings = (
      'update "Props" set product_id=:id')
    Connection = DMMain.conMain
    SQL.Strings = (
      'SELECT '
      'id as product_id, name as p_name from prod_poduct')
    Left = 130
    Top = 289
  end
  object dsProd: TUniDataSource
    DataSet = queryProd
    Left = 209
    Top = 289
  end
end
