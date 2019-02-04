unit UFrameProduct;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Vcl.StdCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, MemDS, DBAccess, Uni, cxCustomData,
  cxFilter, cxData, UCategory, cxTL, cxMaskEdit, cxTLdxBarBuiltInMenu,
  cxInplaceContainer, cxDBTL, cxTLData, UProductModel, cxDBNavigator,
  cxContainer, cxSplitter, cxGroupBox,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxDateRanges, MemTableDataEh, MemTableEh, cxMemo;

type
  TcxGridTableControllerAccess = class(TcxTreeListController);
  TcxGridFindPanelAccess = class(TcxGridFindPanel);

  TframeProduct = class(TFrame)
    dsCategory: TUniDataSource;
    dsProduct: TUniDataSource;
    queryProduct: TUniQuery;
    cxGroupBox1: TcxGroupBox;
    lstCategory: TcxDBTreeList;
    columnNameC: TcxDBTreeListColumn;
    cxSplitter1: TcxSplitter;
    cxGroupBox2: TcxGroupBox;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDel: TButton;
    cxGroupBox3: TcxGroupBox;
    gridProduct: TcxGrid;
    viewProduct: TcxGridDBTableView;
    columnName: TcxGridDBColumn;
    level1: TcxGridLevel;
    cxGroupBox4: TcxGroupBox;
    btnProductAdd: TButton;
    btnProductEdt: TButton;
    btnProductDel: TButton;
    columnBarCode: TcxGridDBColumn;
    btnProductRefresh: TButton;
    btnRefresh: TButton;
    memCategory: TMemTableEh;
    query1: TUniQuery;
    fieldCategoryid: TIntegerField;
    fieldCategoryname: TStringField;
    fieldCategorypid: TIntegerField;
    fieldCategorylevel: TStringField;
    fieldCategoryNext_level: TMemoField;
    fieldCategoryCount: TLargeintField;
    fieldCategoryParent_name: TStringField;
    procedure btnAddClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnProductAddClick(Sender: TObject);
    procedure btnProductEdtClick(Sender: TObject);
    procedure btnProductRefreshClick(Sender: TObject);
    procedure lstCategoryClick(Sender: TObject);
    procedure lstCategoryDblClick(Sender: TObject);
    procedure navCategoryButtonsButtonClick(Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
  private
    product: TProduct;
    category: TCategory;
    FCategoryId: Integer;
    // FSelCategoryID: Integer;
    procedure CategoryInsEdt(id: Integer);
    procedure InsUpd(isNew: Boolean);
    procedure ShowCategory;
    procedure ShowProduct;
    procedure Expand(Sender: TObject; var Key: Word; Shift: TShiftState);
    property CategoryId: Integer read FCategoryId write FCategoryId;
    { Private declarations }
  public
    // property SelCategoryID: Integer read FSelCategoryID write SetSelCategoryID;
    procedure Init;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UCategoryEdit, UDmMain, UProductEdit;

procedure TframeProduct.btnAddClick(Sender: TObject);
begin
  CategoryInsEdt(0);
end;

procedure TframeProduct.btnDelClick(Sender: TObject);
begin
  if Application.MessageBox('�� ������������� ������ ������� ������ � ��� ������������� �� ������?', '������',
    MB_YESNO + MB_ICONWARNING) = mrYes then
  begin
    category.DeleteCategory();
    category.Refresh;
  end;
end;

procedure TframeProduct.btnEditClick(Sender: TObject);
begin
  if (fieldCategorypid.Value <> 0) then
  begin
    CategoryInsEdt(fieldCategoryid.Value);
  end
  else
    Application.MessageBox('������ ��������� ������������� ���������.', '������', MB_OK + MB_ICONERROR)
end;

procedure TframeProduct.btnProductAddClick(Sender: TObject);
begin
  InsUpd(true);
end;

procedure TframeProduct.btnProductEdtClick(Sender: TObject);
begin
  product.setProduct(queryProduct);
  InsUpd(false);
end;

procedure TframeProduct.btnProductRefreshClick(Sender: TObject);
begin
  queryProduct.Refresh;
end;

procedure TframeProduct.CategoryInsEdt(id: Integer);
var
  f: TfrmCategoryEdit;
begin
  f := TfrmCategoryEdit.Create(Self, memCategory, id);
  // Application.CreateForm(TfrmCategoryEdit, frmCategoryEdit);
  // frmCategoryEdit.Init(category, id, queryCategoty);
  f.ShowModal;
  if f.isSave = true then
    CategoryId := f.id;
  ShowCategory;
  // frmCategoryEdit.Show;
end;

procedure TframeProduct.Expand(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
end;

procedure TframeProduct.Init;
begin
  // TcxGridFindPanelAccess(TFindControl(lst2.Controller)
  // .FindPanel).Edit.OnKeyUp := Self.Expand;
  // TcxGridFindPanelAccess(TcxGridTableControllerAccess(lst1. Controller).FindPanel).Edit.SetFocus;
  // category := TCategory.Create(queryCategoty);
  product := TProduct.Create;
  ShowCategory;
  ShowProduct;
end;

procedure TframeProduct.InsUpd(isNew: Boolean);
begin
  Application.CreateForm(TfrmProductEdit, frmProductEdit);
  if isNew = true then
  begin
    product.categoryName := category.Name;
    product.CategoryId := category.id;
  end;
  frmProductEdit.Init(product, queryProduct, isNew);
  frmProductEdit.ShowModal;
  // frmProductEdit.IDSave:=false;
  if frmProductEdit.IDSave = true then
  begin
    queryProduct.Refresh;
    // queryCategoty.Locate('id', product.categoryId, []);
    lstCategoryClick(nil);
    queryProduct.Locate('id', product.id, []);
    gridProduct.SetFocus;
  end;
end;

procedure TframeProduct.lstCategoryClick(Sender: TObject);
begin
  // if category.Id <> queryCategoty.FieldByName('id').AsInteger then
  // begin
  // // FSelCategoryID := queryCategoty.FieldByName('id').AsInteger;
  // category.SetCategory;
  // ShowProduct;
  // end;
  ShowProduct;
end;

procedure TframeProduct.lstCategoryDblClick(Sender: TObject);
begin
  btnEditClick(Sender);
end;

procedure TframeProduct.navCategoryButtonsButtonClick(Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
begin
  // case AButtonIndex of
  // // ��������
  // 16:
  // CategoryInsEdt(true);
  // // �������������
  // 17:
  // CategoryInsEdt(false);
  // end;
end;

procedure TframeProduct.ShowCategory;
begin
  // category.GetCategories;
  memCategory.Active := false;
  memCategory.LoadFromDataSet(DMMain.memCategory, -1, lmCopy, true);
  memCategory.Active := true;
  memCategory.Locate('id',CategoryId,[]);
end;

procedure TframeProduct.ShowProduct;
begin
  // viewProduct.FindPanel
  // product.GetProducts(queryProduct, fieldCategoryid.Value);
  with queryProduct do
  begin
    Close;
    SQL.Text := 'select * from dictonary.product where category_id in (';
    SQL.Add(' select id from dictonary.category where level like :level)');
    ParamByName('level').AsString := fieldCategorylevel.Value + '%';
    open;
  end;
end;

end.
