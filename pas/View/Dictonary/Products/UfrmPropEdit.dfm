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
    Left = 19
    Top = 167
    Width = 75
    Height = 25
    Caption = 'btnSave'
    TabOrder = 1
    OnClick = btnSaveClick
  end
  object cbbProd: TcxDBLookupComboBox
    Left = 36
    Top = 117
    Properties.ListColumns = <>
    TabOrder = 2
    Width = 259
  end
  object queryProps: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO public."Props"'
      '  (name)'
      'VALUES'
      '  (:name)')
    SQLDelete.Strings = (
      'DELETE FROM public."Props"'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE public."Props"'
      'SET'
      '  name = :name'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM public."Props"'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      'SELECT name FROM public."Props"'
      'WHERE'
      '  id = :id')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM public."Props"'
      ''
      ') t')
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
  object queryProd: TUniQuery
    SQLUpdate.Strings = (
      'update "Props" set product_id=:id')
    Connection = DMMain.conMain
    SQL.Strings = (
      'SELECT '
      'id as product_id, name as p_name from prod_poduct')
    Active = True
    Left = 130
    Top = 289
  end
  object dsProd: TUniDataSource
    DataSet = queryProd
    Left = 209
    Top = 289
  end
end
