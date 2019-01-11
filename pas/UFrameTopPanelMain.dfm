object frameTopPanelMain: TframeTopPanelMain
  Left = 0
  Top = 0
  Width = 1012
  Height = 34
  TabOrder = 0
  object barProduct: TdxBarManager
    AlwaysSaveText = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = frmMain.imgMidle
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 408
    DockControlHeights = (
      0
      0
      34
      0)
    object dxbrBardxbrmngr1Bar1: TdxBar
      AllowClose = False
      AllowQuickCustomizing = False
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 334
      FloatTop = 167
      FloatClientWidth = 120
      FloatClientHeight = 121
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnSel'
        end
        item
          Visible = True
          ItemName = 'btnAdd'
        end
        item
          Visible = True
          ItemName = 'btnEdit'
        end
        item
          Visible = True
          ItemName = 'btnDel'
        end
        item
          Visible = True
          ItemName = 'btnRest'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnRefresh'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnFilter'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnPrint'
        end
        item
          Visible = True
          ItemName = 'btnRazdel'
        end
        item
          Visible = True
          ItemName = 'btnExport'
        end
        item
          ViewLayout = ivlGlyphControlCaption
          Visible = True
          ItemName = 'btnArch'
        end
        item
          Visible = True
          ItemName = 'btnAWB'
        end>
      MultiLine = True
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object btnAdd: TdxBarLargeButton
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Category = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 3
      AutoGrayScale = False
      GlyphLayout = glLeft
      Height = 28
      Width = 94
    end
    object btnAddGroup: TdxBarLargeButton
      Category = 0
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1088#1086#1083#1100
      Visible = ivAlways
      LargeImageIndex = 2
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object btnEdit: TdxBarLargeButton
      Category = 0
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 4
      AutoGrayScale = False
      GlyphLayout = glLeft
      Height = 28
    end
    object btnDel: TdxBarLargeButton
      Category = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 5
      AutoGrayScale = False
      GlyphLayout = glLeft
      Height = 28
    end
    object btnRest: TdxBarLargeButton
      Category = 0
      Enabled = False
      Visible = ivNever
      LargeImageIndex = 6
      AutoGrayScale = False
      GlyphLayout = glLeft
      Height = 28
    end
    object btnRefresh: TdxBarLargeButton
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Category = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 11
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object btnSel: TdxBarLargeButton
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Category = 0
      Hint = #1042#1099#1073#1088#1072#1090#1100
      Visible = ivNever
      LargeImageIndex = 1
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object btnFilter: TdxBarLargeButton
      Caption = #1060#1080#1083#1100#1090#1088
      Category = 0
      Hint = #1060#1080#1083#1100#1090#1088
      Visible = ivNever
      LargeImageIndex = 27
      GlyphLayout = glLeft
    end
    object btnPrint: TdxBarLargeButton
      Caption = #1054#1090#1095#1077#1090#1099
      Category = 0
      Hint = #1054#1090#1095#1077#1090#1099
      Visible = ivNever
      ButtonStyle = bsDropDown
      LargeImageIndex = 22
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object btnPrintLogistic: TdxBarButton
      Caption = #1051#1086#1075#1080#1089#1090#1080#1082#1072
      Category = 0
      Hint = #1051#1086#1075#1080#1089#1090#1080#1082#1072
      Visible = ivAlways
    end
    object btnRazdel: TdxBarLargeButton
      Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1100
      Category = 0
      Hint = #1056#1072#1079#1076#1077#1083#1080#1090#1100
      Visible = ivNever
      LargeImageIndex = 28
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object btnЗаказ: TdxBarButton
      Caption = #1047#1072#1082#1072#1079
      Category = 0
      Hint = #1047#1072#1082#1072#1079
      Visible = ivAlways
    end
    object btnЗакупка: TdxBarButton
      Caption = #1047#1072#1082#1091#1087#1082#1072
      Category = 0
      Hint = #1047#1072#1082#1091#1087#1082#1072
      Visible = ivAlways
    end
    object btnReportClients: TdxBarButton
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099
      Category = 0
      Hint = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099
      Visible = ivAlways
    end
    object btnCardClient: TdxBarButton
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072
      Category = 0
      Hint = #1050#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072
      Visible = ivAlways
    end
    object btnExport: TdxBarLargeButton
      Caption = #1042' Excel'
      Category = 0
      Hint = #1042' Excel'
      Visible = ivNever
      LargeImageIndex = 23
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object btnSave: TdxBarLargeButton
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Category = 0
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 13
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object btnAWB: TdxBarLargeButton
      Caption = #1057#1086#1089#1090#1072#1074' AWB'
      Category = 0
      Hint = #1057#1086#1089#1090#1072#1074' AWB'
      Visible = ivNever
      LargeImageIndex = 29
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object btnArch: TcxBarEditItem
      Caption = #1040#1088#1093#1080#1074
      Category = 0
      Hint = #1040#1088#1093#1080#1074
      Visible = ivNever
      ShowCaption = True
      Width = 0
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ImmediatePost = True
      InternalEditValue = False
    end
    object btnLoadPrice: TdxBarLargeButton
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1087#1088#1072#1081#1089
      Category = 0
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1087#1088#1072#1081#1089
      Visible = ivAlways
      LargeImageIndex = 28
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cxBarEditItem1: TcxBarEditItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ShowCaption = True
      Width = 0
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ImmediatePost = True
    end
  end
end
