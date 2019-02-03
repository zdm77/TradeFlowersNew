object DMMain: TDMMain
  OldCreateOrder = False
  Height = 588
  Width = 991
  object conMain: TUniConnection
    DataTypeMap = <
      item
        FieldName = 'name'
        DBType = 508
        FieldType = ftString
        FieldLength = 100
      end>
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'wwwunifloragroup_trade'
    Username = 'uniflora_trade'
    Server = 'pgsql.uniflora.mass.hc.ru'
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 24
    EncryptedPassword = 'B4FF94FF9BFFCCFFC8FFBCFF94FF8EFF99FF92FF'
  end
  object prov1: TPostgreSQLUniProvider
    Left = 120
    Top = 23
  end
  object mon1: TUniSQLMonitor
    Left = 288
    Top = 240
  end
  object queryPostMem: TUniQuery
    Connection = conMain
    SQL.Strings = (
      'select * from dictonary.post'
      ''
      'order by name')
    Left = 400
    Top = 24
  end
  object dsPostMem: TDataSource
    Left = 536
    Top = 24
  end
  object queryContragentMem: TUniQuery
    Connection = conMain
    SQL.Strings = (
      'select * from dictonary.contragent'
      ''
      'order by name')
    Left = 400
    Top = 88
  end
  object dsContragentMem: TDataSource
    Left = 552
    Top = 88
  end
  object queryContrType: TUniQuery
    Connection = conMain
    SQL.Strings = (
      'select * from dictonary.contragent_type'
      ''
      'order by name')
    Left = 400
    Top = 168
  end
  object dsContrType: TDataSource
    Left = 552
    Top = 168
  end
  object memPost: TMemTableEh
    Params = <>
    Left = 472
    Top = 24
  end
  object memContragent: TMemTableEh
    Params = <>
    Left = 472
    Top = 88
  end
  object memContrType: TMemTableEh
    Params = <>
    Left = 472
    Top = 168
  end
end
