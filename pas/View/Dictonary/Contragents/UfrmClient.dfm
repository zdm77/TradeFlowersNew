object frmClient: TfrmClient
  Left = 0
  Top = 0
  Caption = 'frmClient'
  ClientHeight = 669
  ClientWidth = 934
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object groupTop: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    PanelStyle.OfficeBackgroundKind = pobkStyleColor
    TabOrder = 0
    Height = 42
    Width = 934
    object btnProductAdd: TButton
      Left = 3
      Top = 5
      Width = 86
      Height = 32
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 3
      Images = frmMain.imgMidle
      TabOrder = 0
      OnClick = btnProductAddClick
    end
    object btnProductEdt: TButton
      Left = 89
      Top = 5
      Width = 37
      Height = 32
      ImageAlignment = iaCenter
      ImageIndex = 4
      Images = frmMain.imgMidle
      TabOrder = 1
      OnClick = btnProductEdtClick
    end
    object btnProductDel: TButton
      Left = 126
      Top = 5
      Width = 37
      Height = 32
      ImageAlignment = iaCenter
      ImageIndex = 5
      Images = frmMain.imgMidle
      TabOrder = 2
    end
    object btnProductRefresh: TButton
      Left = 163
      Top = 5
      Width = 37
      Height = 32
      ImageAlignment = iaCenter
      ImageIndex = 11
      Images = frmMain.imgMidle
      TabOrder = 3
    end
  end
  object gridProduct: TcxGrid
    Left = 0
    Top = 42
    Width = 934
    Height = 627
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = True
    ExplicitTop = 43
    object viewProduct: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      FilterBox.Position = fpTop
      FilterBox.Visible = fvNever
      FindPanel.ApplyInputDelay = 200
      FindPanel.DisplayMode = fpdmAlways
      FindPanel.InfoText = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
      FindPanel.ShowCloseButton = False
      FindPanel.ShowFindButton = False
      DataController.DataSource = dsClient
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
      GridView = viewProduct
    end
  end
  object dsClient: TUniDataSource
    DataSet = QueryClient
    Left = 600
    Top = 448
  end
  object QueryClient: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO client'
      '  (name)'
      'VALUES'
      '  (:name)')
    SQLDelete.Strings = (
      'DELETE FROM client'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE client'
      'SET'
      '  name = :name'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM client'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      'SELECT name FROM client'
      'WHERE'
      '  id = :id')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM client'
      ''
      ') t')
    Connection = DMMain.conMain
    SQL.Strings = (
      'select *'
      'from client'
      'order by name;')
    DetailFields = 'product_category_id'
    Left = 672
    Top = 464
    object fieldQueryClientid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object fieldQueryClientname: TStringField
      FieldName = 'name'
      Size = 255
    end
  end
end
