object frmProductEdit: TfrmProductEdit
  Left = 0
  Top = 0
  Caption = 'frmProductEdit'
  ClientHeight = 477
  ClientWidth = 736
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
    Left = 104
    Top = 56
    Width = 26
    Height = 13
    Caption = 'name'
    FocusControl = edtname
  end
  object edtname: TcxDBTextEdit
    Left = 104
    Top = 72
    DataBinding.DataField = 'name'
    DataBinding.DataSource = dsProduct
    TabOrder = 0
    Width = 377
  end
  object btn1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 1
    OnClick = btn1Click
  end
  object gridProp: TcxGrid
    Left = 104
    Top = 128
    Width = 497
    Height = 200
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
      object columnVal: TcxGridDBColumn
        DataBinding.FieldName = 'prop_value'
        Width = 239
      end
    end
    object levelProp: TcxGridLevel
      GridView = viewProp
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 104
    Top = 99
    Width = 240
    Height = 25
    DataSource = dsProps
    TabOrder = 3
  end
  object dsProduct: TUniDataSource
    DataSet = queryProduct
    Left = 496
    Top = 9
  end
  object queryProduct: TUniQuery
    Connection = frmMain.conMain
    Left = 536
    Top = 9
  end
  object dsProps: TUniDataSource
    DataSet = queryProps
    Left = 504
    Top = 241
  end
  object queryProps: TUniQuery
    SQLUpdate.Strings = (
      'update prod_prop'
      'set  prop_value=:prop_value'
      'where id=:id')
    Connection = frmMain.conMain
    SQL.Strings = (
      'SELECT '
      'prd.id,'
      '  p.name,'
      '  prd.prop_value'
      'FROM'
      '  public.prod_prop prd'
      
        '  INNER JOIN public.category_props cp ON (prd."category_propsId"' +
        ' = cp.id)'
      '  INNER JOIN public."Props" p ON (cp."propId" = p.id)'
      'where  prd."productId"=:id'
      'order by cp.order_by')
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
