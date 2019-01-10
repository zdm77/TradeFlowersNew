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
  object mm1: TMainMenu
    Left = 120
    Top = 200
    object N1: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N2: TMenuItem
        Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1057#1074#1086#1081#1089#1090#1074#1072
        OnClick = N3Click
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
