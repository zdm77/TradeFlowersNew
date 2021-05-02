object frmPropEdit: TfrmPropEdit
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1074#1086#1081#1089#1090#1074#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
  ClientHeight = 123
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnSave: TButton
    Left = 264
    Top = 64
    Width = 105
    Height = 36
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    ImageIndex = 13
    Images = frmMain.imgMidle
    TabOrder = 0
    OnClick = btnSaveClick
  end
  object edtPropName: TcxLookupComboBox
    Left = 72
    Top = 24
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'name'
      end>
    Properties.ListOptions.ColumnSorting = False
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsProp
    TabOrder = 1
    Width = 297
  end
  object chkInName: TcxCheckBox
    Left = 8
    Top = 51
    Caption = #1042' '#1085#1072#1079#1074#1072#1085#1080#1080
    TabOrder = 2
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
