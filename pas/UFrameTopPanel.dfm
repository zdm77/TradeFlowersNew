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
      Left = 2
      Top = 2
      Width = 86
      Height = 34
      Align = alLeft
      Caption = #1057#1086#1079#1076#1072#1090#1100
      ImageIndex = 3
      Images = frmMain.imgMidle
      TabOrder = 0
    end
    object btnEdit: TButton
      Left = 88
      Top = 2
      Width = 37
      Height = 34
      Align = alLeft
      ImageAlignment = iaCenter
      ImageIndex = 4
      Images = frmMain.imgMidle
      TabOrder = 1
    end
    object btnDel: TButton
      Left = 125
      Top = 2
      Width = 37
      Height = 34
      Align = alLeft
      ImageAlignment = iaCenter
      ImageIndex = 5
      Images = frmMain.imgMidle
      TabOrder = 2
    end
    object btnRefresh: TButton
      Left = 162
      Top = 2
      Width = 37
      Height = 34
      Align = alLeft
      ImageAlignment = iaCenter
      ImageIndex = 11
      Images = frmMain.imgMidle
      TabOrder = 3
    end
    object chkShowDel: TCheckBox
      Left = 199
      Top = 2
      Width = 83
      Height = 34
      Align = alLeft
      Caption = #1059#1076#1072#1083#1077#1085#1085#1099#1077
      TabOrder = 4
      OnClick = chkShowDelClick
    end
    object btnRestore: TButton
      Left = 282
      Top = 2
      Width = 102
      Height = 34
      Align = alLeft
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
      ImageIndex = 6
      Images = frmMain.imgMidle
      TabOrder = 5
      Visible = False
    end
    object btnSelect: TButton
      Left = 384
      Top = 2
      Width = 0
      Height = 34
      Align = alLeft
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 12
      Images = frmMain.imgMidle
      ModalResult = 6
      TabOrder = 6
      OnClick = btnSelectClick
    end
  end
end
