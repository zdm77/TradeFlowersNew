object DMMain: TDMMain
  OldCreateOrder = False
  Height = 487
  Width = 723
  object conMain: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'trade2020'
    Username = 'postgres'
    Server = 'localhost'
    LoginPrompt = False
    Left = 40
    Top = 24
    EncryptedPassword = 'B4FF94FF9BFFCCFFC8FFBCFF94FF8EFF99FF92FFBBFF92FF'
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
