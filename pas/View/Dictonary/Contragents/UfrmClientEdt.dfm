object frmClientEdt: TfrmClientEdt
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmClientEdt'
  ClientHeight = 346
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 12
    Width = 77
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    FocusControl = edtname
  end
  object edtname: TcxDBTextEdit
    Left = 91
    Top = 8
    DataBinding.DataField = 'name'
    DataBinding.DataSource = frmClient.dsClient
    TabOrder = 0
    Width = 400
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 305
    Align = alBottom
    TabOrder = 1
    Height = 41
    Width = 749
    object btnSave: TButton
      Left = 3
      Top = 7
      Width = 88
      Height = 32
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 13
      Images = frmMain.imgMidle
      TabOrder = 0
      OnClick = btnSaveClick
    end
  end
end
