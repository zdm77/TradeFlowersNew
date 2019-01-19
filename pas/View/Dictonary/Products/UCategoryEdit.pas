unit UCategoryEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls, cxTextEdit, cxDBEdit, MemDS,
  DBAccess, Uni, cxButtonEdit, cxCheckBox, cxCalc, cxCustomData, cxFilter,
  cxData, UCategory, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  cxMaskEdit, UProps, UCategoryProperty, cxGroupBox,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmCategoryEdit = class(TForm)
    dsMain: TUniDataSource;
    queryCategory: TUniQuery;
    fieldMainid: TIntegerField;
    fieldMainname: TStringField;
    dsProps: TUniDataSource;
    queryProps: TUniQuery;
    bind1: TBindSourceDB;
    bindList1: TBindingsList;
    queryCategorypid: TIntegerField;
    cxGroupBox1: TcxGroupBox;
    lbl2: TLabel;
    edtParentName: TcxButtonEdit;
    edtname: TcxDBTextEdit;
    lbl1: TLabel;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    btnSave: TButton;
    btnPropAdd: TButton;
    btnEdit: TButton;
    btnPropEdit: TButton;
    btnFromParent: TButton;
    btnFormat: TButton;
    gridProp: TcxGrid;
    viewProp: TcxGridDBTableView;
    columnName: TcxGridDBColumn;
    columnOrder: TcxGridDBColumn;
    columnInName: TcxGridDBColumn;
    levelProp: TcxGridLevel;
    btnUp: TButton;
    btnDawn: TButton;
    procedure btnSaveClick(Sender: TObject);
    procedure btnDawnClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnFromParentClick(Sender: TObject);
    procedure btnPropAddClick(Sender: TObject);
    procedure btnPropEditClick(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure viewPropDblClick(Sender: TObject);
    procedure edtParentNamePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  private
    FEnableDawn: Boolean;
    FEnableUp: Boolean;
    _senderQuery: TUniQuery;
    _category: TCategory;
    categoryProperty: TCategoryProperty;
    prop: TProps;
    procedure SetEnableDawn(const Value: Boolean);
    procedure SetEnableUp(const Value: Boolean);
    procedure UpDawnProp(up: Boolean);
    { Private declarations }
  public
    procedure init(category: TCategory; isNew: Boolean; senderQuery: TUniQuery);
    procedure InsUpdProp(isNew: Boolean);
    property EnableDawn: Boolean read FEnableDawn write SetEnableDawn;
    property EnableUp: Boolean read FEnableUp write SetEnableUp;
    // property EnableDawn: Boolean read FEnableDawn write SetEnableDawn;
  end;

var
  frmCategoryEdit: TfrmCategoryEdit;

implementation

{$R *.dfm}

uses
  UMain, UPropEdit, UDmMain, UfrmSelectTree, UFuncAndProc;

procedure TfrmCategoryEdit.UpDawnProp(up: Boolean);
var
  queryUpd: TUniQuery;
  order: Integer;
  new_order: Integer;
  id: string;
begin
  if queryProps.RecordCount > 0 then
  begin
    order := queryProps.FieldByName('order_by').AsInteger;
    id := queryProps.FieldByName('id').AsString;
    if (up = True) and (order = 1) then
      Exit;
    if (up = True) then
      new_order := order - 1
    else
      new_order := order + 1;
    queryUpd := TUniQuery.Create(nil);
    queryUpd.Connection := DMMain.conMain;
    queryUpd.Close;
    queryUpd.SQL.Text := 'update dictonary.properties_category set order_by=' + IntToStr(new_order) + ' where id=' + id;
    queryUpd.ExecSQL;
    if (up = True) then
      queryProps.Prior
    else
      queryProps.Next;
    id := queryProps.FieldByName('id').AsString;
    queryUpd.Close;
    queryUpd.SQL.Text := 'update dictonary.properties_category set order_by=' + IntToStr(order) + ' where id=' + id;
    queryUpd.ExecSQL;
    queryProps.Refresh;
  end;
end;

procedure TfrmCategoryEdit.btnSaveClick(Sender: TObject);
begin
  queryCategorypid.Value := _category.ParentId;
  queryCategory.Post;
  _senderQuery.Refresh;
  // ShowMessage(queryCategory.FieldByName('id').AsString);
  _senderQuery.Locate('id', _category.id, []);
  // Close;
end;

procedure TfrmCategoryEdit.btnDawnClick(Sender: TObject);
begin
  UpDawnProp(false);
end;

procedure TfrmCategoryEdit.btnEditClick(Sender: TObject);
begin
  InsUpdProp(false);
end;

procedure TfrmCategoryEdit.btnFromParentClick(Sender: TObject);
begin
  _category.GeneratePropertiesFromParent(_category.id, queryProps, _category.ParentId);
end;

procedure TfrmCategoryEdit.btnPropAddClick(Sender: TObject);
begin
  InsUpdProp(True);
end;

procedure TfrmCategoryEdit.btnPropEditClick(Sender: TObject);
begin
  UFuncAndProc.deleteById(queryProps.FieldByName('id').AsInteger, TABLE_CATEGORY_PROPERTY);
  queryProps.Refresh;
end;

procedure TfrmCategoryEdit.btnUpClick(Sender: TObject);
begin
  UpDawnProp(True);
end;

procedure TfrmCategoryEdit.edtParentNamePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSelectTree, frmSelectTree);
  frmSelectTree.init(_category);
  frmSelectTree.ShowModal;
  if frmSelectTree.ModalResult = mrOk then
  begin
    _category.ParentId := frmSelectTree.idSelect;
    edtParentName.Text := _category.GetParent(_category.ParentId).Name;
  end;
end;

procedure TfrmCategoryEdit.SetEnableDawn(const Value: Boolean);
begin
  if FEnableDawn <> Value then
  begin
    FEnableDawn := Value;
    btnDawn.Enabled := FEnableDawn;
  end;
end;

procedure TfrmCategoryEdit.SetEnableUp(const Value: Boolean);
begin
  if FEnableUp <> Value then
  begin
    FEnableUp := Value;
    btnUp.Enabled := FEnableUp;
  end;
end;

procedure TfrmCategoryEdit.init(category: TCategory; isNew: Boolean; senderQuery: TUniQuery);
begin
  _senderQuery := senderQuery;
  _category := category;
  _category.assignCategoryById(category.id, queryCategory);
  with queryCategory do
  begin
    if isNew = True then
    begin
      edtParentName.Text := _category.Name;
      _category.ParentId := category.id;
      queryCategory.Insert;
    end
    else
    begin
      try
        edtParentName.Text := _category.GetParent(category.ParentId).Name;
        queryCategory.Edit;
      except
      end;
    end;
  end;
  prop := TProps.Create();
  prop.GetPropsByCategoryId(_category.id, queryProps);
  // with queryProps do
  // begin
  // Close;
  // ParamByName('id').Value := IntToStr(category.id);
  // Open;
  // end;
end;

procedure TfrmCategoryEdit.InsUpdProp(isNew: Boolean);
var
  categoryProp: TCategoryProperty;
begin
  categoryProp := TCategoryProperty.Create;
  categoryProp.SetCategoryId(_category.id);
  Application.CreateForm(TfrmPropEdit, frmPropEdit);
  frmPropEdit.init(queryProps, isNew, categoryProp);
  frmPropEdit.ShowModal;
  if frmPropEdit.ModalResult = mrOk then
  begin
    if isNew = True then
      _category.AddProperty(_category.id, categoryProp.PropertyId, categoryProp.InName)
    else
      frmPropEdit.UpdateProp(queryProps);
    queryProps.Refresh;
  end;
end;

procedure TfrmCategoryEdit.viewPropDblClick(Sender: TObject);
begin
  InsUpdProp(false);
end;

end.
