object frmContragent: TfrmContragent
  Left = 0
  Top = 0
  Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099
  ClientHeight = 483
  ClientWidth = 755
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline FrameContragent1: TFrameContragent
    Left = 0
    Top = 0
    Width = 755
    Height = 483
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 755
    ExplicitHeight = 483
    inherited tab1: TcxTabControl
      Width = 755
      ExplicitWidth = 755
      ClientRectRight = 751
    end
    inherited frameTopPanel1: TframeTopPanel
      Width = 755
      ExplicitLeft = 0
      ExplicitTop = 28
      ExplicitWidth = 755
      inherited cxGroupBox4: TcxGroupBox
        ExplicitWidth = 755
        Width = 755
      end
    end
    inherited gridContragent: TcxGrid
      Width = 755
      Height = 417
      ExplicitLeft = 0
      ExplicitTop = 66
      ExplicitWidth = 755
      ExplicitHeight = 417
    end
  end
end
