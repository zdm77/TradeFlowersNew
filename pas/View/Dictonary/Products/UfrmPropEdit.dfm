object frmPropEditDict: TfrmPropEditDict
  Left = 0
  Top = 0
  Caption = 'frmPropEditDict'
  ClientHeight = 357
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnSave: TButton
    Left = 294
    Top = 75
    Width = 75
    Height = 25
    Caption = 'btnSave'
    TabOrder = 0
  end
  object edtPropName: TcxLookupComboBox
    Left = 72
    Top = 24
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'name'
      end>
    Properties.ListSource = dsProp
    TabOrder = 1
    Width = 297
  end
  object chkInName: TcxCheckBox
    Left = 8
    Top = 51
    Caption = #1042' '#1085#1072#1079#1074#1072#1085#1080#1080
    TabOrder = 2
    Width = 121
  end
  object dsProp: TUniDataSource
    DataSet = queryProp
    Left = 168
    Top = 65
  end
  object queryProp: TUniQuery
    Connection = DMMain.conMain
    Left = 224
    Top = 57
  end
end
