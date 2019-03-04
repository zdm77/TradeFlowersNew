object frmImport: TfrmImport
  Left = 0
  Top = 0
  Caption = #1048#1084#1087#1086#1088#1090
  ClientHeight = 510
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object group1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    TabOrder = 0
    Height = 92
    Width = 1184
    object group2: TcxGroupBox
      Left = 801
      Top = 2
      Align = alClient
      PanelStyle.Active = True
      TabOrder = 1
      Height = 88
      Width = 381
      object cxGrid1: TcxGrid
        Left = 2
        Top = 38
        Width = 377
        Height = 48
        Align = alBottom
        TabOrder = 1
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsFieldValues
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object cxGrid1DBTableView1name: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'name'
            Width = 83
          end
          object cxGrid1DBTableView1barcode: TcxGridDBColumn
            Caption = #1064#1090#1088#1080#1093'-'#1082#1086#1076
            DataBinding.FieldName = 'barcode'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object btnSavePos: TButton
        Left = 3
        Top = 3
        Width = 75
        Height = 30
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 0
        OnClick = btnSavePosClick
      end
    end
    object group3: TcxGroupBox
      Left = 2
      Top = 2
      Align = alLeft
      TabOrder = 0
      Height = 88
      Width = 799
      object lbl1: TLabel
        Left = 3
        Top = 15
        Width = 70
        Height = 13
        Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090':*'
      end
      object lbl2: TLabel
        Left = 3
        Top = 50
        Width = 81
        Height = 13
        Caption = #1060#1072#1081#1083' '#1080#1084#1087#1086#1088#1090#1072':*'
      end
      object Label1: TLabel
        Left = 454
        Top = 15
        Width = 58
        Height = 13
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103':'
      end
      object edtContrName: TcxButtonEdit
        Left = 90
        Top = 11
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = False
        Properties.OnButtonClick = edtContrNamePropertiesButtonClick
        TabOrder = 0
        OnClick = edtContrNameClick
        Width = 361
      end
      object edtFile: TcxButtonEdit
        Left = 90
        Top = 47
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        TabOrder = 2
        OnClick = edtFileClick
        Width = 361
      end
      object chkAuto: TCheckBox
        Left = 454
        Top = 49
        Width = 217
        Height = 17
        Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080#1081' '#1088#1077#1078#1080#1084'('#1085#1077' '#1073#1077#1079#1086#1087#1072#1089#1085#1086')'
        Enabled = False
        TabOrder = 3
      end
      object edtCategory: TcxButtonEdit
        Left = 518
        Top = 11
        Properties.Buttons = <
          item
            Action = actSelect
            Default = True
            Kind = bkEllipsis
          end
          item
            Action = actClear
            Caption = #1093
            Kind = bkText
          end>
        Properties.ReadOnly = True
        Properties.OnChange = edt1PropertiesChange
        TabOrder = 1
        Width = 275
      end
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 92
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 1
    Height = 418
    Width = 1184
    object Label2: TLabel
      Left = 160
      Top = 112
      Width = 19
      Height = 13
      Caption = 'test'
    end
    object grid1: TdxSpreadSheet
      Left = 2
      Top = 41
      Width = 759
      Height = 375
      Align = alLeft
      OptionsView.R1C1Reference = True
      Data = {
        A402000044585353763242460C00000042465320000000000100000001000101
        010100000000000001004246532000000000424653200200000001000000200B
        00000007000000430061006C0069006200720069000000000000002000000020
        00000000200000000020000000002000000000200007000000470045004E0045
        00520041004C0000000000000200000000000000000101000000200B00000007
        000000430061006C006900620072006900000000000000200000002000000000
        200000000020000000002000000000200007000000470045004E004500520041
        004C000000000000020000000000000000014246532001000000424653201700
        0000540064007800530070007200650061006400530068006500650074005400
        610062006C006500560069006500770006000000530068006500650074003100
        01FFFFFFFFFFFFFFFF6400000002000000020000000200000055000000140000
        0002000000020000000002000000000000010000000000010100004246532055
        0000000000000042465320000000004246532014000000000000004246532000
        0000000000000000000000010000000000000000000000000000000000000042
        4653200000000002020000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000064000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000020002020002000000
        0000000000000000000000000000020000000000000000000000000000000000
        0000000000000000000000000000000000000202000000000000000042465320
        0000000000000000}
    end
    object cxGroupBox2: TcxGroupBox
      Left = 2
      Top = 2
      Align = alTop
      PanelStyle.Active = True
      TabOrder = 0
      Height = 39
      Width = 1180
      object btnImport: TButton
        Left = 3
        Top = 3
        Width = 75
        Height = 31
        Caption = #1048#1084#1087#1086#1088#1090
        TabOrder = 0
        OnClick = btnImportClick
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 761
      Top = 41
      Width = 8
      Height = 375
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 35
    end
    object mmo1: TcxRichEdit
      Left = 769
      Top = 41
      Align = alClient
      TabOrder = 3
      Height = 375
      Width = 413
    end
    object Button1: TButton
      Left = 672
      Top = 152
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 4
    end
  end
  object queryFieldValues: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'select * from  dictonary.product_contragent_field')
    Left = 544
    Top = 344
    object field_ValuesName: TIntegerField
      FieldName = 'name'
    end
    object field_ValuesBarcode: TIntegerField
      FieldName = 'barcode'
    end
    object FieldValuesid: TIntegerField
      FieldName = 'id'
    end
    object FieldValuescontragent_id: TIntegerField
      FieldName = 'contragent_id'
      Required = True
    end
    object FieldValuestest: TFloatField
      FieldKind = fkCalculated
      FieldName = 'test'
      Calculated = True
    end
  end
  object dlgOpen1: TOpenDialog
    Left = 568
    Top = 200
  end
  object dsFieldValues: TUniDataSource
    DataSet = queryFieldValues
    Left = 624
    Top = 320
  end
  object queryProduct: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'select * from  dictonary.product'
      ' where id=0;')
    Left = 336
    Top = 360
    object fieldProductid: TIntegerField
      FieldName = 'id'
    end
    object fieldProductname: TStringField
      FieldName = 'name'
      Required = True
      Size = 100
    end
    object fieldProductcategory_id: TIntegerField
      FieldName = 'category_id'
      Required = True
    end
    object fieldProductsuffix: TStringField
      FieldName = 'suffix'
      Size = 100
    end
    object fieldProductbarcode: TStringField
      FieldName = 'barcode'
      Size = 100
    end
  end
  object memProduct: TMemTableEh
    FetchAllOnOpen = True
    Params = <>
    DataDriver = DataDriverProduct
    Left = 176
    Top = 296
  end
  object DataDriverProduct: TDataSetDriverEh
    ProviderDataSet = DMMain.queryProduct
    Left = 264
    Top = 272
  end
  object actlst1: TActionList
    Left = 472
    Top = 285
    object actClear: TAction
      Caption = 'actClear'
      OnExecute = actClearExecute
    end
    object actSelect: TAction
      Caption = 'actSelect'
      OnExecute = actSelectExecute
    end
  end
  object queryAssign: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'select * from  dictonary.product'
      ' where id=0;')
    Left = 200
    Top = 368
  end
end
