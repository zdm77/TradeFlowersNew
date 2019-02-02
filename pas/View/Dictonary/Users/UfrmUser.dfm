object frmUser: TfrmUser
  Left = 0
  Top = 0
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
  ClientHeight = 557
  ClientWidth = 914
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
  inline frameTopPanel1: TframeTopPanel
    Left = 0
    Top = 0
    Width = 914
    Height = 38
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 914
    inherited cxGroupBox4: TcxGroupBox
      ExplicitWidth = 914
      Width = 914
      inherited btnAdd: TButton
        OnClick = frameTopPanel1btnAddClick
      end
      inherited btnEdit: TButton
        OnClick = frameTopPanel1btnEditClick
      end
      inherited btnDel: TButton
        OnClick = frameTopPanel1btnDelClick
      end
      inherited btnRefresh: TButton
        OnClick = frameTopPanel1btnRefreshClick
      end
      inherited chkShowDel: TCheckBox
        OnClick = frameTopPanel1chkShowDelClick
      end
      inherited btnRestore: TButton
        OnClick = frameTopPanel1btnRestoreClick
      end
    end
  end
  object grid1: TcxGrid
    Left = 0
    Top = 38
    Width = 914
    Height = 519
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = True
    object view1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      FilterBox.Position = fpTop
      FilterBox.Visible = fvNever
      FindPanel.ApplyInputDelay = 200
      FindPanel.DisplayMode = fpdmAlways
      FindPanel.InfoText = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
      FindPanel.ShowCloseButton = False
      FindPanel.ShowFindButton = False
      OnCellDblClick = view1CellDblClick
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
      GridView = view1
    end
  end
  object queryUser: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'SELECT *'
      'FROM dictonary.users'
      'where'
      ' is_delete=:is_delete'
      'ORDER BY name')
    Left = 344
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'is_delete'
        Value = nil
      end>
    object field_Userid: TIntegerField
      FieldName = 'id'
    end
    object field_Username: TStringField
      FieldName = 'name'
      Size = 100
    end
    object field_Userlogin: TStringField
      FieldName = 'login'
      Size = 15
    end
    object field_Useris_delete: TBooleanField
      FieldName = 'is_delete'
    end
  end
  object ds1: TUniDataSource
    DataSet = queryUser
    Left = 432
    Top = 416
  end
end
