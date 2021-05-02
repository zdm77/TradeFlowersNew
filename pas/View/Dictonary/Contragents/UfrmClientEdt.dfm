object frmClientEdt: TfrmClientEdt
  Left = 0
  Top = 0
  Caption = 'frmClientEdt'
  ClientHeight = 346
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 67
    Width = 77
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    FocusControl = edtname
  end
  object edtname: TcxDBTextEdit
    Left = 91
    Top = 64
    DataBinding.DataField = 'name'
    DataBinding.DataSource = dsClient
    TabOrder = 0
    Width = 400
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    TabOrder = 1
    ExplicitTop = 305
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
  object dsClient: TUniDataSource
    DataSet = QueryClient
    Left = 432
    Top = 230
  end
  object QueryClient: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO client'
      '  (id, name)'
      'VALUES'
      '  (:id, :name)')
    SQLDelete.Strings = (
      'DELETE FROM client'
      'WHERE'
      '  id = :Old_id AND name = :Old_name')
    SQLUpdate.Strings = (
      'UPDATE client'
      'SET'
      '  id = :id, name = :name'
      'WHERE'
      '  id = :Old_id AND name = :Old_name')
    SQLLock.Strings = (
      'SELECT * FROM client'
      'WHERE'
      '  id = :Old_id AND name = :Old_name'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      'SELECT id, name FROM client'
      'WHERE'
      '  id = :id AND name = :name')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM client'
      ''
      ') t')
    Connection = DMMain.conMain
    SQL.Strings = (
      'select *'
      'from client'
      'where id = :id')
    DetailFields = 'product_category_id'
    Left = 504
    Top = 230
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        Value = nil
      end>
    object fieldQueryClientid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object fieldQueryClientname: TStringField
      FieldName = 'name'
      Size = 255
    end
  end
end
