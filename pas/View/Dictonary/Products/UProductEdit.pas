unit UProductEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxDBEdit, Vcl.StdCtrls, Data.DB, MemDS, DBAccess, Uni, cxStyles,
  cxVGrid, cxInplaceContainer, cxDBVGrid,
  cxDataStorage, cxNavigator, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls,
  Vcl.DBCtrls, cxCustomData, cxFilter, cxData,
  cxDataControllerConditionalFormattingRulesManagerDialog, UProductModel,
  cxMaskEdit, cxButtonEdit, UProps, cxGroupBox;

type
  TfrmProductEdit = class(TForm)
    dsProduct: TUniDataSource;
    queryProduct: TUniQuery;
    dsProps: TUniDataSource;
    queryProps: TUniQuery;
    fieldProductid: TIntegerField;
    fieldProductname: TStringField;
    fieldProductcategory_id: TIntegerField;
    fieldProductsuffix: TStringField;
    fieldProductbarcode: TStringField;
    cxGroupBox1: TcxGroupBox;
    lbl2: TLabel;
    edtParentName: TcxButtonEdit;
    edtname: TcxDBTextEdit;
    lbl1: TLabel;
    cxGroupBox2: TcxGroupBox;
    btnFromBase: TButton;
    gridProp: TcxGrid;
    viewProp: TcxGridDBTableView;
    columnName: TcxGridDBColumn;
    columnVal: TcxGridDBColumn;
    levelProp: TcxGridLevel;
    cxGroupBox3: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    btnSave: TButton;
    procedure btnFromBaseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edtParentNamePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  private

    FidSave: Boolean;
    _senderQuery: TUniQuery;
    _product: TProduct;
    _props: TProps;
    { Private declarations }
  public
    procedure init(product: TProduct; senderQuery: TUniQuery; isNew: Boolean);
    property idSave: Boolean read FidSave write FidSave;
    { Public declarations }
  end;

var
  frmProductEdit: TfrmProductEdit;

implementation

uses
  UDmMain, UfrmSelectTree;
{$R *.dfm}

procedure TfrmProductEdit.btnFromBaseClick(Sender: TObject);
var
  queryTempPropCat: TUniQuery;
  queryUpd: TUniQuery;
begin
  queryTempPropCat := TUniQuery.Create(nil);
  queryTempPropCat.Connection := DMMain.conMain;
  queryUpd := TUniQuery.Create(nil);
  queryUpd.Connection := DMMain.conMain;
  queryUpd.Close;
  queryUpd.SQL.Text :=
    'insert into  dictonary.properties_product ( category_props_id,  product_id) values (:category_props_id, :product_id)';
  with queryTempPropCat do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' select cp.id,');
    SQL.Add(' p.name');
    SQL.Add(' from');
    SQL.Add(' dictonary.properties_category');
    SQL.Add(' cp');
    SQL.Add(' inner join');
    SQL.Add(' dictonary.properties');
    SQL.Add(' p on p.id = cp.prop_id');
    SQL.Add(' where cp.category_id = ' + IntToStr(_product.categoryId) + ' and');
    SQL.Add(' cp.id not in (');
    SQL.Add(' select pp.category_props_id');
    SQL.Add(' from');
    SQL.Add(' dictonary.properties_product');
    SQL.Add(' pp');
    SQL.Add(' where pp.product_id = ' + IntToStr(_product.Id));
    SQL.Add(' )');
    Open;
    while not eof do
    begin
      queryUpd.ParamByName('category_props_id').Value := FieldByName('id').Value;
      queryUpd.ParamByName('product_id').Value := _product.Id;
      queryUpd.ExecSQL;
      Next;
    end;
  end;
  queryProps.Refresh;
end;

procedure TfrmProductEdit.btnSaveClick(Sender: TObject);
begin
  if (queryProps.State = dsEdit) or (queryProps.State = dsInsert) then
    try
      queryProps.UpdateRecord;
      queryProps.Post;
    except
    end;
  if (queryProduct.State = dsEdit) or (queryProduct.State = dsInsert) then
    try
      fieldProductcategory_id.Value := _product.categoryId;
      queryProduct.Post;
      _senderQuery.Refresh;
      _senderQuery.Locate('id', _product.Id, []);
    except
    end;
  frmProductEdit.idSave := true;
  Close;
end;

procedure TfrmProductEdit.edtParentNamePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSelectTree, frmSelectTree);
  frmSelectTree.init(_product.category);
  frmSelectTree.ShowModal;
  if frmSelectTree.ModalResult = mrOk then
  begin
    _product.categoryId := frmSelectTree.idSelect;
    _product.categoryName := frmSelectTree.nameSelect;
    edtParentName.Text := _product.categoryName;
  end;
end;

procedure TfrmProductEdit.init(product: TProduct; senderQuery: TUniQuery; isNew: Boolean);
begin
  _props := TProps.Create(queryProps);
  _senderQuery := senderQuery;
  _product := product;
  _product.getProductById(_product.Id, queryProduct);
  if isNew = True then
    queryProduct.Insert
  else
    queryProduct.Edit;
  edtParentName.Text := _product.categoryName;
  // prodId := _senderQuery.FieldByName('id').AsString;
  // begin
  // with queryProduct do
  // begin
  // Close;
  // sql.Text := 'select * from prod_poduct where id=' + prodId;
  // Open;
  // if isNew = True then
  // Insert
  // else
  // Update;
  // end;
  // end;
  with queryProps do
  begin
    Close;
    ParamByName('id').Value := product.Id;
    Open;
  end;
end;

end.
