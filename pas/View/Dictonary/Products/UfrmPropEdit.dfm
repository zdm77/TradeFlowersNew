object frmPropEditDict: TfrmPropEditDict
  Left = 0
  Top = 0
  Caption = 'frmPropEditDict'
  ClientHeight = 361
  ClientWidth = 542
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 78
    Width = 26
    Height = 13
    Caption = 'name'
    FocusControl = edtname
  end
  object edtname: TcxDBTextEdit
    Left = 40
    Top = 75
    DataBinding.DataField = 'name'
    DataBinding.DataSource = dsProps
    TabOrder = 0
    Width = 465
  end
  object btnSave: TButton
    Left = 24
    Top = 120
    Width = 75
    Height = 25
    Caption = 'btnSave'
    TabOrder = 1
    OnClick = btnSaveClick
  end
  object queryProps: TUniQuery
    Connection = DMMain.conMain
    SQL.Strings = (
      'SELECT '
      '  cp.id,'
      '  cp.category_id,'
      '  cp.prop_id,'
      '  p.name,'
      'in_name,'
      'cp.order_by'
      'FROM'
      '  public.category_props cp'
      '  INNER JOIN public."Props" p ON (cp.prop_id = p.id)'
      'where category_id=:id'
      'order by cp.order_by')
    Left = 242
    Top = 217
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        Value = nil
      end>
  end
  object dsProps: TUniDataSource
    DataSet = queryProps
    Left = 312
    Top = 217
  end
end
