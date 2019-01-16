object frmOnlyName: TfrmOnlyName
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 79
  ClientWidth = 478
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
  object lbl1: TLabel
    Left = 6
    Top = 12
    Width = 73
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object btnSave: TButton
    Left = 361
    Top = 35
    Width = 105
    Height = 36
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    ImageIndex = 13
    Images = frmMain.imgMidle
    TabOrder = 0
    OnClick = btnSaveClick
  end
  object edtName: TcxTextEdit
    Left = 85
    Top = 8
    Properties.OnChange = edtNamePropertiesChange
    TabOrder = 1
    Width = 381
  end
  object dsProp: TUniDataSource
    DataSet = queryProp
    Left = 88
    Top = 33
  end
  object queryProp: TUniQuery
    Connection = DMMain.conMain
    Left = 128
    Top = 33
  end
end
