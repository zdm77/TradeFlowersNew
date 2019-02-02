object DMMain: TDMMain
  OldCreateOrder = False
  Height = 487
  Width = 723
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
    Left = 272
    Top = 240
  end
end
