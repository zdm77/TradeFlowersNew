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
    object nav1: TcxDBNavigator
      Left = 4
      Top = 3
      Width = 240
      Height = 32
      Buttons.OnButtonClick = nav1ButtonsButtonClick
      Buttons.CustomButtons = <>
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
      TabOrder = 0
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
        DataController.DataSource = dsProps
        DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        EditForm.ItemHotTrack = True
        EditForm.UseDefaultLayout = False
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.EditMode = emInplaceEditFormHideCurrentRow
        OptionsBehavior.FocusCellOnCycle = True
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
      'DELETE FROM properties'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE properties'
      'SET'
      '  id = :id, name = :name'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM properties'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      'SELECT id, name FROM properties'
      'WHERE'
      '  id = :id')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM properties'
      ''
      ') t')
    Connection = DMMain.conMain
    SQL.Strings = (
      'SELECT '
      ' * from properties'
      'order by name')
    OnUpdateError = queryPropsUpdateError
    BeforePost = queryPropsBeforePost
    OnPostError = queryPropsPostError
    Left = 171
    Top = 537
  end
end
