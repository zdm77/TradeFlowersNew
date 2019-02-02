object frmTemplateModal: TfrmTemplateModal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmTemplateModal'
  ClientHeight = 457
  ClientWidth = 729
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
  object lblName: TLabel
    Left = 8
    Top = 12
    Width = 77
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    FocusControl = edtName
  end
  object lblL: TLabel
    Left = 8
    Top = 38
    Width = 77
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    FocusControl = edtName
  end
  object Panel1: TPanel
    Left = 0
    Top = 420
    Width = 729
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 489
    ExplicitWidth = 777
    DesignSize = (
      729
      37)
    object Button1: TButton
      Left = 561
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 609
    end
    object Button2: TButton
      Left = 648
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
      ExplicitLeft = 696
    end
  end
  object edtName: TDBEdit
    Left = 91
    Top = 8
    Width = 249
    Height = 21
    DataField = 'name'
    TabOrder = 0
  end
  object edtL: TcxLookupComboBox
    Left = 91
    Top = 35
    Properties.ListColumns = <>
    TabOrder = 1
    Width = 249
  end
  object query1: TUniQuery
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
    SQL.Strings = (
      'SELECT '
      '  id,'
      '  name,'
      '  contragent_type_id'
      'FROM '
      '  dictonary.contragent '
      'WHERE'
      '  id = :Id')
    Left = 448
    Top = 24
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
      LookupDataSet = queryL
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'contragent_type_id'
      Lookup = True
    end
  end
  object queryL: TUniQuery
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
    SQL.Strings = (
      'SELECT '
      '  id,'
      '  name'
      'FROM '
      '  dictonary.contragent_type ;')
    Left = 584
    Top = 16
  end
  object ds1: TDataSource
    DataSet = query1
    Left = 496
    Top = 24
  end
end
