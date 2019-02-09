object frameSave: TframeSave
  Left = 0
  Top = 0
  Width = 651
  Height = 30
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 651
    Height = 30
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 549
      Top = 0
      Width = 102
      Height = 30
      Align = alRight
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      ImageIndex = 13
      Images = frmMain.imgMidle
      TabOrder = 1
    end
    object btnAbort: TButton
      Left = 75
      Top = 0
      Width = 166
      Height = 30
      Align = alLeft
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1076#1072#1083#1100#1085#1077#1081#1096#1080#1081' '#1080#1084#1087#1086#1088#1090
      Images = frmMain.imgMidle
      ModalResult = 2
      TabOrder = 0
      Visible = False
    end
    object btnCancel: TButton
      Left = 0
      Top = 0
      Width = 75
      Height = 30
      Align = alLeft
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      Images = frmMain.imgMidle
      ModalResult = 2
      TabOrder = 2
      ExplicitLeft = 8
    end
  end
end
