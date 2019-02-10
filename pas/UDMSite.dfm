object dmSite: TdmSite
  OldCreateOrder = False
  Height = 439
  Width = 709
  object conSite: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'opencart'
    SpecificOptions.Strings = (
      'MySQL.ConnectionTimeout=80000')
    Username = 'root'
    Server = 'localhost'
    LoginPrompt = False
    Left = 160
    Top = 136
  end
  object provSite: TMySQLUniProvider
    Left = 224
    Top = 136
  end
  object querySiteUpd: TUniQuery
    Connection = conSite
    Left = 272
    Top = 232
  end
  object querySIte2: TUniQuery
    Connection = conSite
    Left = 400
    Top = 248
  end
  object querySite3: TUniQuery
    Connection = conSite
    Left = 464
    Top = 256
  end
end
