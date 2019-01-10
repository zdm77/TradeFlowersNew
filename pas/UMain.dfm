object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'frmMain'
  ClientHeight = 629
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mm1
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TButton
    Left = 64
    Top = 520
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 152
    Top = 520
    Width = 75
    Height = 25
    Caption = #1088#1077#1076' '#1050#1072#1090
    TabOrder = 1
  end
  object btn3: TButton
    Left = 241
    Top = 520
    Width = 75
    Height = 25
    Caption = '+'#1050#1072#1090
    TabOrder = 2
  end
  object Button1: TButton
    Left = 360
    Top = 520
    Width = 75
    Height = 25
    Caption = #1088#1077#1076' '#1058#1086#1074
    TabOrder = 3
  end
  object Button2: TButton
    Left = 441
    Top = 520
    Width = 75
    Height = 25
    Caption = '+'#1058#1086#1074
    TabOrder = 4
  end
  object prov1: TPostgreSQLUniProvider
    Left = 568
    Top = 504
  end
  object mm1: TMainMenu
    Left = 264
    Top = 576
    object N1: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N2: TMenuItem
        Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072
        OnClick = N2Click
      end
    end
  end
  object tabMain: TdxTabbedMDIManager
    Active = True
    TabProperties.CloseButtonMode = cbmEveryTab
    TabProperties.CustomButtons.Buttons = <>
    TabProperties.MultiLine = True
    TabProperties.NavigatorPosition = npLeftTop
    Left = 392
    Top = 456
  end
end
