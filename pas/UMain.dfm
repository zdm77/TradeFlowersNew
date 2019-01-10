object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'frmMain'
  ClientHeight = 629
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grid1: TcxGrid
    Left = 8
    Top = 40
    Width = 427
    Height = 361
    TabOrder = 0
    object viewGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsMain
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object columnName: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'name'
        Width = 488
      end
    end
    object levelGrid1Level1: TcxGridLevel
      GridView = viewGrid1DBTableView1
    end
  end
  object btn1: TButton
    Left = 64
    Top = 520
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 152
    Top = 520
    Width = 75
    Height = 25
    Caption = #1088#1077#1076' '#1050#1072#1090
    TabOrder = 2
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 241
    Top = 520
    Width = 75
    Height = 25
    Caption = '+'#1050#1072#1090
    TabOrder = 3
    OnClick = btn3Click
  end
  object Button1: TButton
    Left = 360
    Top = 520
    Width = 75
    Height = 25
    Caption = #1088#1077#1076' '#1058#1086#1074
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 441
    Top = 520
    Width = 75
    Height = 25
    Caption = '+'#1058#1086#1074
    TabOrder = 5
  end
  object cxGrid1: TcxGrid
    Left = 480
    Top = 40
    Width = 427
    Height = 361
    TabOrder = 6
    object cxGridDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsProduct
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGridDBColumn1: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'name'
        Width = 488
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object conMain: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'wwwunifloragroup_trade'
    Username = 'uniflora_trade'
    Server = 'pgsql.uniflora.mass.hc.ru'
    Connected = True
    LoginPrompt = False
    Left = 104
    Top = 256
    EncryptedPassword = 'B4FF94FF9BFFCCFFC8FFBCFF94FF8EFF99FF92FF'
  end
  object dsMain: TUniDataSource
    DataSet = queryMain
    Left = 232
    Top = 448
  end
  object queryMain: TUniQuery
    Connection = conMain
    Left = 304
    Top = 448
  end
  object prov1: TPostgreSQLUniProvider
    Left = 568
    Top = 504
  end
  object dsProduct: TUniDataSource
    DataSet = queryProduct
    Left = 600
    Top = 456
  end
  object queryProduct: TUniQuery
    Connection = conMain
    Left = 672
    Top = 456
  end
end
