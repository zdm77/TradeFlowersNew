object frmImport: TfrmImport
  Left = 0
  Top = 0
  Caption = #1048#1084#1087#1086#1088#1090
  ClientHeight = 494
  ClientWidth = 800
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
  PixelsPerInch = 96
  TextHeight = 13
  object group1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    TabOrder = 0
    Height = 57
    Width = 800
    object lbl1: TLabel
      Left = 3
      Top = 7
      Width = 70
      Height = 13
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090':*'
    end
    object lbl2: TLabel
      Left = 3
      Top = 34
      Width = 81
      Height = 13
      Caption = #1060#1072#1081#1083' '#1080#1084#1087#1086#1088#1090#1072':*'
    end
    object Label1: TLabel
      Left = 453
      Top = 6
      Width = 58
      Height = 13
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103':'
    end
    object edtContrName: TcxButtonEdit
      Left = 86
      Top = 3
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = edtContrNamePropertiesButtonClick
      TabOrder = 0
      OnClick = edtContrNameClick
      Width = 361
    end
    object edtFile: TcxButtonEdit
      Left = 86
      Top = 30
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 1
      OnClick = edtFileClick
      Width = 361
    end
    object chkAuto: TCheckBox
      Left = 456
      Top = 32
      Width = 217
      Height = 17
      Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080#1081' '#1088#1077#1078#1080#1084'('#1085#1077' '#1073#1077#1079#1086#1087#1072#1089#1085#1086')'
      Enabled = False
      TabOrder = 2
    end
  end
  object group2: TcxGroupBox
    Left = 0
    Top = 57
    Align = alTop
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1086#1083#1077#1081' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103
    TabOrder = 2
    Height = 76
    Width = 800
    object cxGrid1: TcxGrid
      Left = 2
      Top = 18
      Width = 796
      Height = 56
      Align = alClient
      TabOrder = 0
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
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 133
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 3
    Height = 361
    Width = 800
    object grid1: TdxSpreadSheet
      Left = 2
      Top = 41
      Width = 796
      Height = 318
      Align = alClient
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
      Width = 796
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
  end
  object edtCategory: TcxButtonEdit
    Left = 517
    Top = 3
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
  object queryFieldValues: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'select * from  dictonary.product_contragent_field')
    Left = 544
    Top = 344
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
  object query1: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'select * from  dictonary.product_contragent_field')
    Left = 336
    Top = 352
  end
  object memProduct: TMemTableEh
    FetchAllOnOpen = True
    Params = <>
    DataDriver = DataDriverProduct
    Left = 176
    Top = 296
    object fieldProductlevel: TStringField
      FieldName = 'level'
      Required = True
      Size = 100
    end
    object fieldProductid: TIntegerField
      FieldName = 'id'
    end
    object fieldProductname: TStringField
      FieldName = 'name'
      Size = 100
    end
    object fieldProductcategory_id: TIntegerField
      FieldName = 'category_id'
    end
    object fieldProductsuffix: TStringField
      FieldName = 'suffix'
      Size = 100
    end
    object fieldProductbarcode: TStringField
      FieldName = 'barcode'
      Size = 100
    end
    object fieldProductcategory_name: TStringField
      FieldName = 'category_name'
      Required = True
      Size = 100
    end
  end
  object DataDriverProduct: TDataSetDriverEh
    ProviderDataSet = DMMain.queryProduct
    Left = 264
    Top = 272
  end
  object actlst1: TActionList
    Left = 448
    Top = 309
    object actClear: TAction
      Caption = 'actClear'
      OnExecute = actClearExecute
    end
    object actSelect: TAction
      Caption = 'actSelect'
      OnExecute = actSelectExecute
    end
  end
end
