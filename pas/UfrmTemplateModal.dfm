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
  end
  object lblL: TLabel
    Left = 8
    Top = 38
    Width = 77
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  inline frameSave1: TframeSave
    Left = 0
    Top = 427
    Width = 729
    Height = 30
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 427
    ExplicitWidth = 729
    inherited Panel1: TPanel
      Width = 729
      ExplicitTop = 0
      ExplicitWidth = 729
      ExplicitHeight = 30
      inherited Button1: TButton
        Left = 627
        OnClick = frameSave1Button1Click
        ExplicitLeft = 627
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
  object edtPost: TcxDBLookupComboBox
    Left = 91
    Top = 35
    DataBinding.DataField = 'post_name'
    DataBinding.DataSource = ds1
    Properties.DropDownListStyle = lsFixedList
    Properties.ListColumns = <>
    Properties.ListOptions.ShowHeader = False
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Width = 244
  end
  object edtName: TcxDBTextEdit
    Left = 91
    Top = 8
    DataBinding.DataField = 'name'
    DataBinding.DataSource = ds1
    TabOrder = 0
    Width = 244
  end
  object query1: TUniQuery
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
    Options.DefaultValues = True
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
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'name'
      Required = True
      Size = 255
    end
    object fieldContragentTypeId: TIntegerField
      DisplayLabel = #1058#1080#1087
      FieldName = 'contragent_type_id'
      Required = True
    end
    object fieldContragentTypeName: TStringField
      DisplayLabel = #1058#1080#1087
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
    Connection = DMMain.conMain
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
