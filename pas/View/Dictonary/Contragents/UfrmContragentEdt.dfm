object frmContragentEdt: TfrmContragentEdt
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
  ClientHeight = 295
  ClientWidth = 349
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
    Top = 265
    Width = 349
    Height = 30
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 265
    ExplicitWidth = 349
    inherited Panel1: TPanel
      Width = 349
      ExplicitTop = 0
      ExplicitWidth = 349
      ExplicitHeight = 30
      inherited Button1: TButton
        Left = 247
        OnClick = frameSave1Button1Click
        ExplicitLeft = 247
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
    Top = 65
    Width = 349
    Height = 200
    Align = alBottom
    Navigator.Buttons.CustomButtons = <>
    TabOrder = 2
    DataController.DataSource = dsCat
    Version = 1
    object gridCatname: TcxDBEditorRow
      Properties.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.Alignment.Horz = taLeftJustify
      Properties.DataBinding.FieldName = 'name'
      ID = 0
      ParentID = -1
      Index = 0
      Version = 1
    end
    object gridCatbarcode: TcxDBEditorRow
      Properties.Caption = #1064#1090#1088#1080#1093'-'#1082#1086#1076
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.Alignment.Horz = taLeftJustify
      Properties.DataBinding.FieldName = 'barcode'
      ID = 1
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
    Left = 368
    Top = 104
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
      LookupDataSet = memContrType
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'contragent_type_id'
      Lookup = True
    end
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
  object memContrType: TMemTableEh
    Params = <>
    Left = 464
    Top = 112
  end
end
