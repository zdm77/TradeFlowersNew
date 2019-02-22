object frmPostEdt: TfrmPostEdt
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
  ClientHeight = 67
  ClientWidth = 343
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
  object edtName: TDBEdit
    Left = 91
    Top = 8
    Width = 249
    Height = 21
    DataField = 'name'
    DataSource = dsPostEdt
    TabOrder = 0
  end
  inline frameSave1: TframeSave
    Left = 0
    Top = 37
    Width = 343
    Height = 30
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 279
    ExplicitWidth = 550
    inherited Panel1: TPanel
      Width = 343
      ExplicitWidth = 550
      inherited Button1: TButton
        Left = 241
        OnClick = frameSave1Button1Click
        ExplicitLeft = 448
      end
      inherited btnCancel: TButton
        ExplicitLeft = 0
      end
    end
  end
  object queryPost: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'SELECT '
      '  id,'
      '  name'
      'FROM '
      '  dictonary.post'
      'WHERE'
      '  id = :Id')
    Options.DefaultValues = True
    Left = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id'
        Value = nil
      end>
    object fieldPostName: TStringField
      FieldName = 'name'
      Required = True
      Size = 255
    end
    object fieldPostId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
  end
  object dsPostEdt: TDataSource
    DataSet = queryPost
    Left = 280
  end
end
