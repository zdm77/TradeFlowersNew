object frmProductEdit: TfrmProductEdit
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072
  ClientHeight = 427
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = #1058#1086#1074#1072#1088
    TabOrder = 0
    ExplicitWidth = 960
    Height = 97
    Width = 496
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
    object lbl3: TLabel
      Left = 8
      Top = 75
      Width = 60
      Height = 13
      Caption = #1064#1090#1088#1080#1093' '#1082#1086#1076':'
      FocusControl = edtBarCode
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
      OnClick = edtParentNameClick
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
    object edtBarCode: TcxDBTextEdit
      Left = 91
      Top = 71
      DataBinding.DataField = 'barcode'
      DataBinding.DataSource = dsProduct
      TabOrder = 2
      Width = 400
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 97
    Align = alClient
    Caption = #1057#1074#1086#1081#1089#1090#1074#1072
    TabOrder = 1
    ExplicitWidth = 960
    ExplicitHeight = 473
    Height = 300
    Width = 496
    object cxGrid1: TcxGrid
      Left = 2
      Top = 57
      Width = 492
      Height = 241
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 956
      ExplicitHeight = 414
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
      TabOrder = 0
      ExplicitWidth = 956
      Height = 39
      Width = 492
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
  inline frameSave1: TframeSave
    Left = 0
    Top = 397
    Width = 496
    Height = 30
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 570
    ExplicitWidth = 960
    inherited Panel1: TPanel
      Width = 496
      ExplicitWidth = 960
      inherited Button1: TButton
        Left = 394
        OnClick = frameSave1Button1Click
        ExplicitLeft = 858
      end
      inherited btnAbort: TButton
        OnClick = frameSave1btnAbortClick
      end
    end
  end
  object dsProduct: TUniDataSource
    DataSet = queryProduct
    Left = 528
    Top = 17
  end
  object queryProduct: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'select * from dictonary.product'
      'where id=:id')
    Left = 584
    Top = 17
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        Value = nil
      end>
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
