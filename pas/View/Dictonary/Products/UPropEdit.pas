unit UPropEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, Data.DB, MemDS, DBAccess, Uni, Vcl.StdCtrls,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCheckBox, UCategoryProperty;

type
  TfrmPropEdit = class(TForm)
    dsProp: TUniDataSource;
    queryProp: TUniQuery;
    btnSave: TButton;
    edtPropName: TcxLookupComboBox;
    chkInName: TcxCheckBox;
    procedure btnSaveClick(Sender: TObject);
  private
    _senderQuery: TUniQuery;
    categoryProp: TCategoryProperty;
    { Private declarations }
  public
    procedure init(senderQuery: TUniQuery; isNew: Boolean; _categoryProp: TCategoryProperty);
    procedure UpdateProp(query: TUniQuery);
    { Public declarations }
  end;

var
  frmPropEdit: TfrmPropEdit;

implementation

{$R *.dfm}

uses UDmMain, UMain;

procedure TfrmPropEdit.btnSaveClick(Sender: TObject);
begin
  categoryProp.InName := chkInName.Checked;
  categoryProp.PropertyId := edtPropName.EditValue;
  ModalResult := mrOk;
end;

procedure TfrmPropEdit.init(senderQuery: TUniQuery; isNew: Boolean;
  _categoryProp: TCategoryProperty);
begin
  // _senderQuery := senderQuery;
  categoryProp := _categoryProp;
  if isNew = true then
  begin
    with queryProp do
    begin
      Close;
      sql.Text := 'select * from ' + DICT_TABLE_PROPERTIES;
      if (senderQuery.RecordCount > 0) then
      begin
        sql.Add(' where id not in (select prop_id from ' + DICT_TABLE_CATEGORY_PROPERTY +
          ' where category_id=' + inttostr(categoryProp.Id) + ')');
      end;
      sql.Add(' order by name');
      Open;
      categoryProp.Id := Fields[0].AsInteger;
      categoryProp.InName := False;
    end;
  end
  else
  begin
    with queryProp do
    begin
      categoryProp.Id := senderQuery.FieldByName('prop_id').AsInteger;
      Close;
      sql.Text := 'select * from ' + DICT_TABLE_PROPERTIES + ' where id=:id';
      ParamByName('id').Value := categoryProp.Id;
      Open;
      categoryProp.InName :=senderQuery. FieldByName('in_name').AsBoolean;
    end;
     edtPropName.Enabled := False;
  end;
  chkInName.Checked := categoryProp.InName;
  edtPropName.EditValue := categoryProp.Id;
end;

procedure TfrmPropEdit.UpdateProp(query: TUniQuery);
var
  queryUpd: TUniQuery;
begin
  queryUpd := TUniQuery.Create(nil);
  queryUpd.Connection := DMMain.conMain;
  queryUpd.sql.Text := 'update ' + DICT_TABLE_CATEGORY_PROPERTY + ' set in_name=:in_name where id=:id';
  queryUpd.ParamByName('in_name').Value := chkInName.Checked;
  queryUpd.ParamByName('id').Value := query.FieldByName('id').Value;
  queryUpd.ExecSQL;
end;

end.
