object frameTopPanel: TframeTopPanel
  Left = 0
  Top = 0
  Width = 652
  Height = 38
  TabOrder = 0
  object cxGroupBox4: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 0
    Height = 38
    Width = 652
    object btnAdd: TButton
      Left = 3
      Top = 3
      Width = 86
      Height = 32
      Caption = #1057#1086#1079#1076#1072#1090#1100
      ImageIndex = 3
      Images = frmMain.imgMidle
      TabOrder = 0
    end
    object btnEdit: TButton
      Left = 89
      Top = 3
      Width = 37
      Height = 32
      ImageAlignment = iaCenter
      ImageIndex = 4
      Images = frmMain.imgMidle
      TabOrder = 1
    end
    object btnDel: TButton
      Left = 126
      Top = 3
      Width = 37
      Height = 32
      ImageAlignment = iaCenter
      ImageIndex = 5
      Images = frmMain.imgMidle
      TabOrder = 2
    end
    object btnRefresh: TButton
      Left = 163
      Top = 3
      Width = 37
      Height = 32
      ImageAlignment = iaCenter
      ImageIndex = 11
      Images = frmMain.imgMidle
      TabOrder = 3
    end
    object chkShowDel: TCheckBox
      Left = 206
      Top = 11
      Width = 83
      Height = 17
      Caption = #1059#1076#1072#1083#1077#1085#1085#1099#1077
      TabOrder = 5
      OnClick = chkShowDelClick
    end
    object btnRestore: TButton
      Left = 283
      Top = 3
      Width = 102
      Height = 32
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
      ImageIndex = 6
      Images = frmMain.imgMidle
      TabOrder = 4
      Visible = False
    end
  end
end
