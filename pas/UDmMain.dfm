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
  object queryContrFields: TUniQuery
    Connection = conMain
    SQL.Strings = (
      'select * from dictonary.product_contragent_field'
      'where contragent_id=:id'
      ''
      'order by name')
    Left = 400
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        Value = nil
      end>
  end
  object memContrFields: TMemTableEh
    Params = <>
    Left = 472
    Top = 240
  end
  object dsContrFields: TDataSource
    Left = 552
    Top = 240
  end
  object queryCategory: TUniQuery
    Connection = conMain
    SQL.Strings = (
      ''
      'select c.*,'
      '      tt.p_name,'
      
        '       --"substring"(c.level,1,length(c.level)-2)||cc.count+1||'#39 +
        '.'#39' as next_level,'
      '       case'
      '         when count is not null then c.level || count +1|| '#39'.'#39
      '         else c.level||'#39'1.'#39' '
      '         end as next_level,'
      '       cc.count'
      'from dictonary.category c'
      '     left join '
      '     ('
      '       select pid,'
      '              count(id) as count'
      '       from dictonary.category'
      '       group by pid'
      '     ) as cc on cc.pid = c.id'
      '     left join '
      '     ('
      '       select id,'
      '              name as p_name'
      '       from dictonary.category'
      '     ) tt on tt.id = c.pid  '
      '      '
      ''
      '      '
      '  '
      'order by c.pid, c.name')
    Left = 696
    Top = 40
  end
  object memCategory: TMemTableEh
    Params = <>
    Left = 768
    Top = 40
  end
  object dsCategory: TDataSource
    Left = 832
    Top = 40
  end
  object mem1: TMemTableEh
    Params = <>
    Left = 48
    Top = 104
  end
  object mem2: TMemTableEh
    Params = <>
    Left = 112
    Top = 104
  end
  object DataDriverContr: TDataSetDriverEh
    KeyFields = 'id'
    ProviderDataSet = queryContragentMem
    Left = 304
    Top = 96
  end
end
