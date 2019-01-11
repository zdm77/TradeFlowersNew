object frameProps: TframeProps
  Left = 0
  Top = 0
  Width = 803
  Height = 644
  TabOrder = 0
  object gridProps: TcxGrid
    Left = 8
    Top = 41
    Width = 751
    Height = 489
    TabOrder = 0
    object viewProps: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsProps
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      EditForm.MasterRowDblClickAction = dcaShowEditForm
      EditForm.UseDefaultLayout = False
      OptionsBehavior.EditMode = emInplaceEditFormHideCurrentRow
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
  object edtName: TEdit
    Left = 403
    Top = 252
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'edtName'
  end
  object edtqqq: TEdit
    Left = 408
    Top = 298
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'edtqqq'
  end
  object dsProps: TUniDataSource
    DataSet = queryProps
    Left = 93
    Top = 540
  end
  object queryProps: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO view_prop_test'
      '  (id, name, p_name, product_id, chk)'
      'VALUES'
      '  (:id, :name, :p_name, :product_id, :chk)')
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
      'SELECT '
      ' * from view_prop_test')
    Left = 171
    Top = 537
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
