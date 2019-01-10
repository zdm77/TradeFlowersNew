object frmCategoryEdit: TfrmCategoryEdit
  Left = 0
  Top = 0
  Caption = 'frmCategoryEdit'
  ClientHeight = 501
  ClientWidth = 743
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 78
    Width = 26
    Height = 13
    Caption = 'name'
    FocusControl = edtname
  end
  object edtname: TcxDBTextEdit
    Left = 40
    Top = 75
    DataBinding.DataField = 'name'
    DataBinding.DataSource = dsMain
    TabOrder = 0
    Width = 465
  end
  object btnSave: TButton
    Left = 8
    Top = 468
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = btnSaveClick
  end
  object gridProp: TcxGrid
    Left = 8
    Top = 165
    Width = 497
    Height = 297
    TabOrder = 2
    object viewProp: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsProps
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object columnName: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'name'
        Width = 249
      end
      object columnOrder: TcxGridDBColumn
        Caption = #1055#1086#1088#1103#1076#1086#1082
        DataBinding.FieldName = 'order_by'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
      end
      object columnInName: TcxGridDBColumn
        Caption = #1042' '#1085#1072#1079#1074#1072#1085#1080#1080
        DataBinding.FieldName = 'in_name'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 76
      end
    end
    object levelProp: TcxGridLevel
      GridView = viewProp
    end
  end
  object btnUp: TButton
    Left = 511
    Top = 256
    Width = 42
    Height = 25
    Caption = #1042#1074#1077#1088#1093
    TabOrder = 3
    OnClick = btnUpClick
  end
  object btnDawn: TButton
    Left = 511
    Top = 287
    Width = 42
    Height = 25
    Caption = #1042#1085#1080#1079
    TabOrder = 4
    OnClick = btnDawnClick
  end
  object btnPropAdd: TButton
    Left = 8
    Top = 134
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 5
    OnClick = btnPropAddClick
  end
  object btnPropEdit: TButton
    Left = 89
    Top = 134
    Width = 80
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 6
  end
  object btnFormat: TButton
    Left = 175
    Top = 134
    Width = 178
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1103
    TabOrder = 7
  end
  object dsMain: TUniDataSource
    DataSet = queryCategory
    Left = 496
    Top = 9
  end
  object queryCategory: TUniQuery
    Connection = frmMain.conMain
    SQL.Strings = (
      'select * from category where id=1')
    Left = 536
    Top = 9
    object fieldMainid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object fieldMainname: TStringField
      FieldName = 'name'
      Size = 255
    end
  end
  object dsProps: TUniDataSource
    DataSet = queryProps
    Left = 504
    Top = 241
  end
  object queryProps: TUniQuery
    Connection = frmMain.conMain
    SQL.Strings = (
      'SELECT '
      '  cp.id,'
      '  cp.category_id,'
      '  cp.prop_id,'
      '  p.name,'
      'in_name,'
      'cp.order_by'
      'FROM'
      '  public.category_props cp'
      '  INNER JOIN public."Props" p ON (cp.prop_id = p.id)'
      'where category_id=:id'
      'order by cp.order_by')
    AfterScroll = queryPropsAfterScroll
    Left = 544
    Top = 241
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        Value = nil
      end>
  end
end
