object frameProps: TframeProps
  Left = 0
  Top = 0
  Width = 803
  Height = 644
  TabOrder = 0
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    TabOrder = 0
    Height = 38
    Width = 803
    object btnAdd: TButton
      Left = 3
      Top = 5
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
      Top = 5
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
      Top = 5
      Width = 37
      Height = 32
      ImageAlignment = iaCenter
      ImageIndex = 5
      Images = frmMain.imgMidle
      TabOrder = 2
      OnClick = btnDelClick
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 38
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 1
    Height = 606
    Width = 803
    object gridProps: TcxGrid
      Left = 2
      Top = 2
      Width = 799
      Height = 602
      Align = alClient
      TabOrder = 0
      object viewProps: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnCellClick = viewPropsCellClick
        DataController.DataSource = dsProps
        DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        EditForm.ItemHotTrack = True
        EditForm.UseDefaultLayout = False
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ShowEditButtons = gsebAlways
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object columnName: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'name'
          PropertiesClassName = 'TcxTextEditProperties'
          LayoutItem = viewPropsLayoutItem1.Owner
          Options.SortByDisplayText = isbtOn
          Width = 408
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
          SizeOptions.Width = 432
          Index = 0
        end
      end
      object levelGrid1Level1: TcxGridLevel
        GridView = viewProps
      end
    end
  end
  object dsProps: TUniDataSource
    DataSet = queryProps
    Left = 93
    Top = 540
  end
  object queryProps: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO properties'
      '  ( name)'
      'VALUES'
      '  ( :name)')
    SQLDelete.Strings = (
      'DELETE FROM  properties'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE  properties'
      'SET'
      '  id = :id, name = :name'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM  properties'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      'SELECT id, name FROM  properties'
      'WHERE'
      '  id = :id')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM  properties'
      ''
      ') t')
    Connection = DMMain.conMain
    SQL.Strings = (
      'SELECT '
      ' * from properties'
      'order by name')
    OnUpdateError = queryPropsUpdateError
    BeforePost = queryPropsBeforePost
    OnDeleteError = queryPropsDeleteError
    OnPostError = queryPropsPostError
    Left = 171
    Top = 537
  end
end
