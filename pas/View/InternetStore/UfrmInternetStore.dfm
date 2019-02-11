object frmInternetStore: TfrmInternetStore
  Left = 0
  Top = 0
  Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1080#1085#1090#1077#1088#1085#1077#1090' '#1084#1072#1075#1072#1079#1080#1085#1086#1084
  ClientHeight = 583
  ClientWidth = 760
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object btnSinc: TButton
    Left = 16
    Top = 24
    Width = 129
    Height = 41
    Caption = #1057#1080#1085#1093#1088#1086#1085#1080#1079#1072#1094#1080#1103
    TabOrder = 0
    OnClick = btnSincClick
  end
  object btnDelAll: TButton
    Left = 151
    Top = 24
    Width = 129
    Height = 41
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1105
    TabOrder = 1
    OnClick = btnDelAllClick
  end
  object queryCategory: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'select * from dictonary.category '
      ''
      '')
    Left = 688
    Top = 56
  end
  object query1: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'select * from dictonary.category ')
    Left = 688
    Top = 112
  end
  object queryProduct: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'select * from dictonary.product '
      ''
      '')
    Left = 544
    Top = 64
  end
end
