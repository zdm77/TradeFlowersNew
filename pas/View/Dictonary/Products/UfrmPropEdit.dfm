object frmPropEditDict: TfrmPropEditDict
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmPropEditDict'
  ClientHeight = 373
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 6
    Top = 12
    Width = 73
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    FocusControl = edtname
  end
  object btnSave: TButton
    Left = 264
    Top = 64
    Width = 105
    Height = 36
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    ImageIndex = 13
    Images = frmMain.imgMidle
    TabOrder = 0
  end
  object edtname: TcxDBTextEdit
    Left = 145
    Top = 8
    DataBinding.DataField = 'name'
    TabOrder = 1
    Width = 400
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
