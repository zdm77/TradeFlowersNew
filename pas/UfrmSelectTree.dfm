object frmSelectTree: TfrmSelectTree
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1090#1088#1091#1082#1090#1091#1088#1099
  ClientHeight = 551
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    TabOrder = 0
    Height = 41
    Width = 642
    object lblProduct: TLabel
      Left = 3
      Top = 39
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnSelect: TButton
      Left = 3
      Top = 5
      Width = 86
      Height = 28
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 12
      Images = frmMain.imgMidle
      ModalResult = 6
      TabOrder = 0
      OnClick = btnSelectClick
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 41
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 1
    Height = 510
    Width = 642
    object lstCategory: TcxDBTreeList
      Left = 2
      Top = 2
      Width = 638
      Height = 506
      Align = alClient
      Bands = <
        item
        end>
      DataController.DataSource = dsCategory
      DataController.ParentField = 'parent_id'
      DataController.KeyField = 'id'
      Navigator.Buttons.CustomButtons = <>
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      RootValue = -1
      TabOrder = 0
      object columnNameC: TcxDBTreeListColumn
        Caption.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'name'
        Width = 280
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
  end
  object dsCategory: TUniDataSource
    DataSet = memCategory
    Left = 184
    Top = 456
  end
  object queryCategoty: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'select * from dictonary.category')
    Left = 264
    Top = 456
  end
  object DataDriverCategory: TDataSetDriverEh
    ProviderDataSet = DMMain.queryCategory
    Left = 88
    Top = 368
  end
  object memCategory: TMemTableEh
    Params = <>
    DataDriver = DataDriverCategory
    Left = 208
    Top = 352
    object fieldCategoryid: TIntegerField
      FieldName = 'id'
    end
    object fieldCategoryname: TStringField
      FieldName = 'name'
      Size = 100
    end
    object fieldCategorypid: TIntegerField
      FieldName = 'pid'
    end
    object fieldCategorylevel: TStringField
      FieldName = 'level'
      Size = 100
    end
    object fieldCategoryNext_level: TMemoField
      FieldName = 'next_level'
      BlobType = ftMemo
    end
    object fieldCategoryCount: TLargeintField
      FieldName = 'count'
    end
    object fieldCategoryParent_name: TStringField
      FieldName = 'p_name'
      Size = 100
    end
  end
end
