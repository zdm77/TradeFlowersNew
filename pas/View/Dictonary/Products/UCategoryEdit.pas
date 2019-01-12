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
  cxMaskEdit;

type
  TfrmCategoryEdit = class(TForm)
    dsMain: TUniDataSource;
    queryCategory: TUniQuery;
    fieldMainid: TIntegerField;
    fieldMainname: TStringField;
    lbl1: TLabel;
    edtname: TcxDBTextEdit;
    btnSave: TButton;
    dsProps: TUniDataSource;
    queryProps: TUniQuery;
    gridProp: TcxGrid;
    viewProp: TcxGridDBTableView;
    columnName: TcxGridDBColumn;
    levelProp: TcxGridLevel;
    columnOrder: TcxGridDBColumn;
    btnUp: TButton;
    btnDawn: TButton;
    columnInName: TcxGridDBColumn;
    btnPropAdd: TButton;
    btnPropEdit: TButton;
    btnFormat: TButton;
    lbl2: TLabel;
    bind1: TBindSourceDB;
    bindList1: TBindingsList;
    queryCategorypid: TIntegerField;
    edtParentName: TcxButtonEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure btnDawnClick(Sender: TObject);
    procedure btnPropAddClick(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure queryPropsAfterScroll(DataSet: TDataSet);
  private
    FEnableDawn: Boolean;
    FEnableUp: Boolean;
    _senderQuery: TUniQuery;
    _category: TCategory;
    procedure SetEnableDawn(const Value: Boolean);
    procedure SetEnableUp(const Value: Boolean);
    procedure UpDawnProp(up: Boolean);
    { Private declarations }
  public
    procedure init(category: TCategory; isNew: Boolean; senderQuery: TUniQuery);
    property EnableDawn: Boolean read FEnableDawn write SetEnableDawn;
    property EnableUp: Boolean read FEnableUp write SetEnableUp;
    // property EnableDawn: Boolean read FEnableDawn write SetEnableDawn;
  end;

var
  frmCategoryEdit: TfrmCategoryEdit;

implementation

{$R *.dfm}

uses
  UMain, UPropEdit, UDmMain;

procedure TfrmCategoryEdit.UpDawnProp(up: Boolean);
var
  queryUpd: TUniQuery;
  order: integer;
  new_order: integer;
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
    queryUpd.SQL.Text := 'update category_props set order_by=' + IntToStr(new_order) +
      ' where id=' + id;
    queryUpd.ExecSQL;
    if (up = True) then
      queryProps.Prior
    else
      queryProps.Next;
    id := queryProps.FieldByName('id').AsString;
    queryUpd.Close;
    queryUpd.SQL.Text := 'update category_props set order_by=' + IntToStr(order) +
      ' where id=' + id;
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

procedure TfrmCategoryEdit.btnPropAddClick(Sender: TObject);
var
  queryUpd: TUniQuery;
begin
  Application.CreateForm(TfrmPropEdit, frmPropEdit);
  frmPropEdit.setParam(queryProps, True);
  frmPropEdit.ShowModal;
  if frmMain.ModalResult = mrOk then
  begin
    queryUpd := TUniQuery.Create(nil);
    with queryUpd do
    begin
      queryUpd.Connection := DMMain.conMain;
      queryUpd.Close;
      SQL.Clear;
      SQL.Add(' INSERT INTO');
      SQL.Add(' public.category_props');
      SQL.Add(' (');
      SQL.Add(' category_id,');
      SQL.Add(' prop_id,');
      SQL.Add(' order_by,');
      SQL.Add(' in_name');
      SQL.Add(' )');
      SQL.Add(' VALUES (');
      SQL.Add(' :id,');
      SQL.Add(' :category_id,');
      SQL.Add(' :prop_id,');
      SQL.Add(' :order_by,');
      SQL.Add(' :in_name');
      SQL.Add(' );');
      // ParamByName('category_id').Value:= .Value;
      // ParamByName('prop_id').Value:= .Value;
      // ParamByName('order_by').Value:= .Value;
      // ParamByName('in_name').Value:= .Value ;
    end;
  end;
end;

procedure TfrmCategoryEdit.btnUpClick(Sender: TObject);
begin
  UpDawnProp(True);
end;

procedure TfrmCategoryEdit.queryPropsAfterScroll(DataSet: TDataSet);
begin
  // if DataSet.RecordCount > 0 then
  // begin
  // EnableUp :=true;
  // EnableDawn:=true;
  // if DataSet.FieldByName('order_by').AsInteger = 1 then
  // EnableUp := false
  // else
  // EnableUp := true;
  // if DataSet.FieldByName('order_by').AsInteger = DataSet.RecordCount  then
  // EnableDawn := false
  // else
  // EnableDawn := true;
  //
  // end;
  // ShowMessage(DataSet.FieldByName('name').AsString);
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
      Insert;
      edtParentName.Text := _category.Name;
      _category.ParentId := category.id;
    end
    else
    begin
      edtParentName.Text := _category.GetParent(category.ParentId).Name;
      Update;
    end;
  end;
  with queryProps do
  begin
    Close;
    ParamByName('id').Value := IntToStr(category.id);
    Open;
  end;
end;

end.
