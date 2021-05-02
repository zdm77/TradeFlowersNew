object frmCategoryEdit: TfrmCategoryEdit
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
  ClientHeight = 466
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    TabOrder = 0
    Height = 65
    Width = 552
    object lbl2: TLabel
      Left = 3
      Top = 9
      Width = 132
      Height = 13
      Caption = #1056#1086#1076#1080#1090#1077#1083#1100#1089#1082#1072#1103' '#1082#1072#1090#1077#1075#1086#1088#1080#1103':'
    end
    object lbl1: TLabel
      Left = 7
      Top = 36
      Width = 73
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FocusControl = edtname
    end
    object edtParentName: TcxButtonEdit
      Left = 146
      Top = 5
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = edtParentNamePropertiesButtonClick
      TabOrder = 0
      Width = 400
    end
    object edtname: TcxDBTextEdit
      Left = 146
      Top = 32
      DataBinding.DataField = 'name'
      DataBinding.DataSource = dsMain
      TabOrder = 1
      Width = 400
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 65
    Align = alClient
    Caption = #1057#1074#1086#1081#1089#1090#1074#1072
    TabOrder = 1
    Height = 401
    Width = 552
    object cxGroupBox3: TcxGroupBox
      Left = 2
      Top = 358
      Align = alBottom
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitTop = 365
      Height = 41
      Width = 548
      object btnSave: TButton
        Left = 3
        Top = 7
        Width = 88
        Height = 32
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        ImageIndex = 13
        Images = frmMain.imgMidle
        TabOrder = 0
        OnClick = btnSaveClick
      end
    end
    object btnPropAdd: TButton
      Left = 7
      Top = 24
      Width = 86
      Height = 32
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 3
      Images = frmMain.imgMidle
      TabOrder = 1
      OnClick = btnPropAddClick
    end
    object btnEdit: TButton
      Left = 93
      Top = 24
      Width = 37
      Height = 32
      ImageAlignment = iaCenter
      ImageIndex = 4
      Images = frmMain.imgMidle
      TabOrder = 2
      OnClick = btnEditClick
    end
    object btnPropEdit: TButton
      Left = 130
      Top = 24
      Width = 37
      Height = 32
      ImageAlignment = iaCenter
      ImageIndex = 5
      Images = frmMain.imgMidle
      TabOrder = 3
      OnClick = btnPropEditClick
    end
    object btnFromParent: TButton
      Left = 167
      Top = 24
      Width = 106
      Height = 32
      Caption = #1048#1079' '#1088#1086#1076#1080#1090#1077#1083#1103
      ImageIndex = 20
      Images = frmMain.imgMidle
      TabOrder = 4
      OnClick = btnFromParentClick
    end
    object btnFormat: TButton
      Left = 279
      Top = 24
      Width = 146
      Height = 32
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1103
      TabOrder = 5
    end
    object gridProp: TcxGrid
      Left = 3
      Top = 62
      Width = 497
      Height = 297
      TabOrder = 6
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      object viewProp: TcxGridDBTableView
        OnDblClick = viewPropDblClick
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsProps
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
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
      Left = 506
      Top = 161
      Width = 32
      Height = 32
      ImageIndex = 19
      Images = frmMain.imgMidle
      TabOrder = 7
      OnClick = btnUpClick
    end
    object btnDawn: TButton
      Left = 506
      Top = 199
      Width = 32
      Height = 32
      ImageIndex = 20
      Images = frmMain.imgMidle
      TabOrder = 8
      OnClick = btnDawnClick
    end
  end
  object dsMain: TUniDataSource
    DataSet = queryCategory
    Left = 520
    Top = 68
  end
  object queryCategory: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO  product_category'
      '  ( name, parent_id)'
      'VALUES'
      '  ( :name, :parent_id)')
    SQLDelete.Strings = (
      'DELETE FROM  product_category'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE  product_category'
      'SET'
      '  id = :id, name = :name, parent_id = :parent_id'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM  category'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      'SELECT id, name, parent_id FROM  product_category'
      'WHERE'
      '  id = :id')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM  category'
      ''
      ') t')
    Connection = DMMain.conMain
    SQL.Strings = (
      'select * from product_category')
    Left = 109
    Top = 314
    object fieldCategoryid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object fieldCategoryname: TMemoField
      FieldName = 'name'
      Required = True
      BlobType = ftMemo
    end
    object fieldCategoryparent_id: TIntegerField
      FieldName = 'parent_id'
      Required = True
    end
  end
  object dsProps: TUniDataSource
    DataSet = queryProps
    Left = 554
    Top = 155
  end
  object queryProps: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO  properties'
      '  (id, name)'
      'VALUES'
      '  (:id, :name)')
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
      '  cp.id,'
      '  cp.category_id,'
      '  cp.prop_id,'
      '  p.name,'
      'in_name,'
      'cp.order_by'
      'FROM'
      '  public.category_props cp'
      '  INNER JOIN public.properties p ON (cp.prop_id = p.id)'
      'where category_id=:id'
      'order by cp.order_by')
    Left = 145
    Top = 226
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        Value = nil
      end>
  end
  object bind1: TBindSourceDB
    DataSet = queryCategory
    ScopeMappings = <>
    Left = 368
    Top = 259
  end
  object bindList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 572
    Top = 17
  end
end
