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
    inherited cxGroupBox3: TcxGroupBox
      ExplicitWidth = 755
      ExplicitHeight = 483
      Height = 483
      Width = 755
      inherited cxGroupBox1: TcxGroupBox
        ExplicitHeight = 479
        Height = 479
        inherited gridType: TcxGrid
          Height = 459
          ExplicitHeight = 459
        end
      end
      inherited cxSplitter1: TcxSplitter
        Height = 479
        ExplicitHeight = 479
      end
      inherited cxGroupBox2: TcxGroupBox
        ExplicitWidth = 528
        ExplicitHeight = 479
        Height = 479
        Width = 528
        inherited cxGroupBox4: TcxGroupBox
          ExplicitWidth = 524
          Width = 524
        end
        inherited cxGroupBox5: TcxGroupBox
          ExplicitWidth = 524
          ExplicitHeight = 420
          Height = 420
          Width = 524
          inherited gridContragent: TcxGrid
            Width = 520
            Height = 416
            ExplicitWidth = 520
            ExplicitHeight = 416
          end
        end
      end
    end
  end
end
