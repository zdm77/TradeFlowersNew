object frmUserEdt: TfrmUserEdt
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1086#1083#1100#1079#1086#1074#1090#1072#1077#1083#1100
  ClientHeight = 117
  ClientWidth = 338
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
    Width = 39
    Height = 13
    Caption = #1060'.'#1048'.'#1054'.:'
  end
  object lblL: TLabel
    Left = 8
    Top = 66
    Width = 61
    Height = 13
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
  end
  object Label1: TLabel
    Left = 8
    Top = 39
    Width = 34
    Height = 13
    Caption = #1051#1086#1075#1080#1085':'
  end
  inline frameSave1: TframeSave
    Left = 0
    Top = 87
    Width = 338
    Height = 30
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 92
    ExplicitWidth = 340
    inherited Panel1: TPanel
      Width = 338
      ExplicitTop = 0
      ExplicitWidth = 340
      ExplicitHeight = 30
      inherited Button1: TButton
        Left = 236
        OnClick = frameSave1Button1Click
        ExplicitLeft = 238
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
    Top = 62
    DataBinding.DataField = 'post_name'
    DataBinding.DataSource = dsUser
    Properties.DropDownListStyle = lsFixedList
    Properties.ListColumns = <>
    Properties.ListOptions.ShowHeader = False
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 2
    Width = 244
  end
  object edtName: TcxDBTextEdit
    Left = 91
    Top = 8
    DataBinding.DataField = 'name'
    DataBinding.DataSource = dsUser
    TabOrder = 0
    Width = 244
  end
  object edtLogin: TcxDBTextEdit
    Left = 91
    Top = 35
    DataBinding.DataField = 'login'
    DataBinding.DataSource = dsUser
    TabOrder = 1
    Width = 244
  end
  object queryUser: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'SELECT '
      '*'
      'FROM '
      '  dictonary.users'
      'WHERE'
      '  id = :Id')
    Left = 432
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id'
        Value = nil
      end>
    object fieldUserid: TIntegerField
      FieldName = 'id'
    end
    object queryUsername: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'name'
      Required = True
      Size = 100
    end
    object queryUserlogin: TStringField
      DisplayLabel = #1051#1086#1075#1080#1085
      FieldName = 'login'
      Required = True
      Size = 15
    end
    object queryUserpost_id: TIntegerField
      FieldName = 'post_id'
    end
    object fieldUserpost_name: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldKind = fkLookup
      FieldName = 'post_name'
      LookupDataSet = memPost
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'post_id'
      LookupCache = True
      Required = True
      Lookup = True
    end
  end
  object dsUser: TDataSource
    DataSet = queryUser
    Left = 496
    Top = 40
  end
  object memPost: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 392
    Top = 152
  end
end
