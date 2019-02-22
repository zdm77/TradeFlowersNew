object frmQuestAssign: TfrmQuestAssign
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1058#1086#1074#1072#1088' '#1085#1077' '#1085#1072#1081#1076#1077#1085
  ClientHeight = 87
  ClientWidth = 371
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblProduct: TLabel
    Left = 8
    Top = 24
    Width = 47
    Height = 13
    Caption = 'lblProduct'
  end
  object btnNew: TButton
    Left = 8
    Top = 56
    Width = 75
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100
    TabOrder = 0
    OnClick = btnNewClick
  end
  object btnAssign: TButton
    Left = 89
    Top = 56
    Width = 88
    Height = 25
    Caption = #1040#1089#1089#1086#1094#1080#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 1
    OnClick = btnAssignClick
  end
  object btnCancel: TButton
    Left = 288
    Top = 56
    Width = 75
    Height = 25
    Caption = #1055#1088#1086#1087#1091#1089#1090#1080#1090#1100
    ModalResult = 2
    TabOrder = 2
    OnClick = btnCancelClick
  end
end
