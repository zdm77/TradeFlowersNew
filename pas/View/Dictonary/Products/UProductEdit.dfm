object frmProductEdit: TfrmProductEdit
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072
  ClientHeight = 489
  ClientWidth = 502
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
    Caption = #1058#1086#1074#1072#1088
    TabOrder = 0
    ExplicitWidth = 736
    Height = 73
    Width = 502
    object lbl2: TLabel
      Left = 8
      Top = 21
      Width = 58
      Height = 13
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103':'
    end
    object lbl1: TLabel
      Left = 8
      Top = 48
      Width = 77
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
      FocusControl = edtname
    end
    object edtParentName: TcxButtonEdit
      Left = 91
      Top = 17
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
      Left = 91
      Top = 44
      DataBinding.DataField = 'name'
      DataBinding.DataSource = dsProduct
      TabOrder = 1
      Width = 400
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 450
    Align = alBottom
    PanelStyle.Active = True
    TabOrder = 1
    Height = 39
    Width = 502
    object gridProp: TcxGrid
      Left = 8
      Top = 146
      Width = 497
      Height = 200
      TabOrder = 0
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
        object columnVal: TcxGridDBColumn
          Caption = #1047#1085#1072#1095#1077#1085#1080#1077
          DataBinding.FieldName = 'prop_value'
          Width = 239
        end
      end
      object levelProp: TcxGridLevel
        GridView = viewProp
      end
    end
    object btnSave: TButton
      Left = 400
      Top = 4
      Width = 99
      Height = 32
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 13
      Images = frmMain.imgMidle
      TabOrder = 1
      OnClick = btnSaveClick
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 73
    Align = alClient
    Caption = #1057#1074#1086#1081#1089#1090#1074#1072
    TabOrder = 2
    ExplicitLeft = 120
    ExplicitTop = 144
    ExplicitWidth = 185
    ExplicitHeight = 105
    Height = 377
    Width = 502
    object cxGrid1: TcxGrid
      Left = 2
      Top = 57
      Width = 498
      Height = 318
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 16
      ExplicitTop = 154
      ExplicitWidth = 475
      ExplicitHeight = 200
      object cxGridDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsProps
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'name'
          Width = 255
        end
        object cxGridDBColumn2: TcxGridDBColumn
          Caption = #1047#1085#1072#1095#1077#1085#1080#1077
          DataBinding.FieldName = 'prop_value'
          Width = 239
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
    object cxGroupBox4: TcxGroupBox
      Left = 2
      Top = 18
      Align = alTop
      PanelStyle.Active = True
      TabOrder = 1
      Height = 39
      Width = 498
      object btnFromBase: TButton
        Left = 3
        Top = 3
        Width = 118
        Height = 30
        Caption = #1048#1079' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
        ImageIndex = 20
        Images = frmMain.imgMidle
        TabOrder = 0
        OnClick = btnFromBaseClick
      end
    end
  end
  object dsProduct: TUniDataSource
    DataSet = queryProduct
    Left = 496
    Top = 9
  end
  object queryProduct: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'select * from dictonary.product')
    Left = 536
    Top = 9
    object fieldProductid: TIntegerField
      FieldName = 'id'
    end
    object fieldProductname: TStringField
      FieldName = 'name'
      Size = 255
    end
    object fieldProductcategory_id: TIntegerField
      FieldName = 'category_id'
    end
    object fieldProductsuffix: TStringField
      FieldName = 'suffix'
      Size = 255
    end
    object fieldProductbarcode: TStringField
      FieldName = 'barcode'
      Size = 13
    end
  end
  object dsProps: TUniDataSource
    DataSet = queryProps
    Left = 376
    Top = 377
  end
  object queryProps: TUniQuery
    SQLUpdate.Strings = (
      'update dictonary.properties_product'
      'set  prop_value=:prop_value'
      'where id=:id')
    Connection = DMMain.conMain
    SQL.Strings = (
      'SELECT '
      'prd.id,'
      '  p.name,'
      '  prd.prop_value'
      'FROM'
      ' dictonary.properties_product prd'
      
        '  INNER JOIN dictonary.properties_category cp ON (prd.category_p' +
        'rops_id = cp.id)'
      '  INNER JOIN dictonary.properties p ON (cp.prop_id = p.id)'
      'where  prd.product_id=:id'
      'order by cp.order_by')
    Left = 440
    Top = 393
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        Value = nil
      end>
  end
end
