object frmContragentEdt: TfrmContragentEdt
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
  ClientHeight = 303
  ClientWidth = 356
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
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 77
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 39
    Width = 22
    Height = 13
    Caption = #1058#1080#1087':'
    FocusControl = DBLookupComboBox1
  end
  object DBEdit1: TDBEdit
    Left = 85
    Top = 8
    Width = 255
    Height = 21
    DataField = 'name'
    DataSource = dsContragent
    TabOrder = 0
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 85
    Top = 35
    Width = 255
    Height = 21
    DataField = 'type_name'
    DataSource = dsContragent
    TabOrder = 1
  end
  inline frameSave1: TframeSave
    Left = 0
    Top = 273
    Width = 356
    Height = 30
    Align = alBottom
    TabOrder = 3
    ExplicitLeft = 94
    ExplicitTop = 184
    inherited Panel1: TPanel
      Width = 356
      ExplicitTop = 0
      ExplicitHeight = 30
      inherited Button1: TButton
        Left = 254
        OnClick = frameSave1Button1Click
        ExplicitLeft = 549
        ExplicitTop = 0
        ExplicitHeight = 30
      end
      inherited Button2: TButton
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitHeight = 30
      end
    end
  end
  object gridCat: TcxDBVerticalGrid
    Left = 0
    Top = 73
    Width = 356
    Height = 200
    Align = alBottom
    Navigator.Buttons.CustomButtons = <>
    TabOrder = 2
    DataController.DataSource = dsCat
    ExplicitLeft = 8
    ExplicitTop = 88
    ExplicitWidth = 150
    Version = 1
    object gridCatname: TcxDBEditorRow
      Properties.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.Alignment.Horz = taLeftJustify
      Properties.DataBinding.FieldName = 'name'
      ID = 6
      ParentID = -1
      Index = 0
      Version = 1
    end
    object gridCatbarcode: TcxDBEditorRow
      Properties.Caption = #1064#1090#1088#1080#1093'-'#1082#1086#1076
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.Alignment.Horz = taLeftJustify
      Properties.DataBinding.FieldName = 'barcode'
      ID = 7
      ParentID = -1
      Index = 1
      Version = 1
    end
  end
  object queryContragent: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO dictonary.contragent'
      '  (id, name, contragent_type_id)'
      'VALUES'
      '  (:id, :name, :contragent_type_id)')
    SQLDelete.Strings = (
      'DELETE FROM dictonary.contragent'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE dictonary.contragent'
      'SET'
      
        '  id = :id, name = :name, contragent_type_id = :contragent_type_' +
        'id'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM dictonary.contragent'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      'SELECT id, name, contragent_type_id FROM dictonary.contragent'
      'WHERE'
      '  id = :id')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM dictonary.contragent'
      ''
      ') t')
    Connection = DMMain.conMain
    SQL.Strings = (
      'SELECT '
      '  id,'
      '  name,'
      '  contragent_type_id'
      'FROM '
      '  dictonary.contragent '
      'WHERE'
      '  id = :Id')
    Left = 152
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id'
        Value = nil
      end>
    object fieldContragentid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object fieldContragentName: TStringField
      FieldName = 'name'
      Size = 255
    end
    object fieldContragentTypeId: TIntegerField
      FieldName = 'contragent_type_id'
      Required = True
    end
    object fieldContragentTypeName: TStringField
      FieldKind = fkLookup
      FieldName = 'type_name'
      LookupDataSet = queryType
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'contragent_type_id'
      Lookup = True
    end
  end
  object queryType: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO dictonary.contragent'
      '  (id, name, contragent_type_id)'
      'VALUES'
      '  (:id, :name, :contragent_type_id)')
    SQLDelete.Strings = (
      'DELETE FROM dictonary.contragent'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE dictonary.contragent'
      'SET'
      
        '  id = :id, name = :name, contragent_type_id = :contragent_type_' +
        'id'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM dictonary.contragent'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      'SELECT id, name, contragent_type_id FROM dictonary.contragent'
      'WHERE'
      '  id = :id')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM dictonary.contragent'
      ''
      ') t')
    Connection = DMMain.conMain
    SQL.Strings = (
      'SELECT '
      '  id,'
      '  name'
      'FROM '
      '  dictonary.contragent_type ;')
    Left = 240
    Top = 16
  end
  object dsContragent: TDataSource
    DataSet = queryContragent
    Left = 96
    Top = 16
  end
  object queryCat: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'SELECT '
      ' *'
      'FROM '
      'dictonary.product_contragent_field'
      'WHERE'
      '  contragent_id = :id')
    Left = 232
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        Value = nil
      end>
    object fieldCatid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object fieldCatcontragent_id: TIntegerField
      FieldName = 'contragent_id'
    end
    object fieldCatname: TIntegerField
      FieldName = 'name'
    end
    object fieldCatbarcode: TIntegerField
      FieldName = 'barcode'
    end
  end
  object dsCat: TDataSource
    DataSet = queryCat
    Left = 184
    Top = 160
  end
end
