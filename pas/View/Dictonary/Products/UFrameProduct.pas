unit UFrameProduct;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, Vcl.StdCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, MemDS, DBAccess, Uni, cxCustomData, cxFilter, cxData,
  UCategory, cxTL, cxMaskEdit, cxTLdxBarBuiltInMenu, cxInplaceContainer, cxDBTL,
  cxTLData, UProductModel, cxDBNavigator, cxContainer, cxSplitter, cxGroupBox,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxDateRanges,
  MemTableDataEh, MemTableEh, cxMemo, CodeSiteLogging, UFrameTopPanel,
  DataDriverEh;

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
    cxGroupBox3: TcxGroupBox;
    gridProduct: TcxGrid;
    viewProduct: TcxGridDBTableView;
    columnName: TcxGridDBColumn;
    level1: TcxGridLevel;
    columnBarCode: TcxGridDBColumn;
    memCategory: TMemTableEh;
    query1: TUniQuery;
    fieldCategoryid: TIntegerField;
    fieldCategoryname: TStringField;
    fieldCategorypid: TIntegerField;
    fieldCategorylevel: TStringField;
    fieldCategoryNext_level: TMemoField;
    fieldCategoryCount: TLargeintField;
    fieldCategoryParent_name: TStringField;
    memProduct: TMemTableEh;
    memTmp: TMemTableEh;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    MemoField1: TMemoField;
    LargeintField1: TLargeintField;
    StringField3: TStringField;
    frameTopPanel1: TframeTopPanel;
    frameTopPanel2: TframeTopPanel;
    DataDriverCategory: TDataSetDriverEh;
    DataDriverProduct: TDataSetDriverEh;
    fieldProductlevel: TStringField;
    fieldProductid: TIntegerField;
    fieldProductname: TStringField;
    fieldProductcategory_id: TIntegerField;
    fieldProductsuffix: TStringField;
    fieldProductbarcode: TStringField;
    fieldProductcategory_name: TStringField;
    btnRestore: TButton;
    procedure btnEditClick(Sender: TObject);
    procedure btnRestoreClick(Sender: TObject);
    procedure frameTopPanel1btnAddClick(Sender: TObject);
    procedure frameTopPanel2btnAddClick(Sender: TObject);
    procedure frameTopPanel2btnEditClick(Sender: TObject);
    procedure lstCategoryClick(Sender: TObject);
    procedure lstCategoryDblClick(Sender: TObject);
  private
    product: TProduct;
    category: TCategory;
    FCategoryId: Integer;
    FProductId: Integer;
    // FSelCategoryID: Integer;
    procedure CategoryInsEdt(id: Integer);
    procedure InsUpd(AId: Integer);
    procedure ShowCategory;
    procedure ShowProduct;
    procedure Expand(Sender: TObject; var Key: Word; Shift: TShiftState);
    property CategoryId: Integer read FCategoryId write FCategoryId;
    property ProductId: Integer read FProductId write FProductId;
    { Private declarations }
  public
    // property SelCategoryID: Integer read FSelCategoryID write SetSelCategoryID;
    procedure Init;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  UCategoryEdit, UDmMain, UProductEdit, UfrmImport;

procedure TframeProduct.btnEditClick(Sender: TObject);
begin
  if (fieldCategorypid.Value <> 0) then
  begin
    CategoryInsEdt(fieldCategoryid.Value);
  end
  else
    Application.MessageBox('Данную категорию редактировать запрещено.', 'Ошибка', MB_OK + MB_ICONERROR)
end;

procedure TframeProduct.btnRestoreClick(Sender: TObject);
begin
  Application.CreateForm(TfrmImport, frmImport);
  frmImport.Show;
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

procedure TframeProduct.frameTopPanel1btnAddClick(Sender: TObject);
begin

  CategoryInsEdt(0);
end;

procedure TframeProduct.frameTopPanel2btnAddClick(Sender: TObject);
begin
  InsUpd(0);
end;

procedure TframeProduct.frameTopPanel2btnEditClick(Sender: TObject);
begin
  /// product.setProduct(queryProduct);
  InsUpd(fieldProductid.Value);
end;

procedure TframeProduct.Init;
begin
  product := TProduct.Create;
  ShowCategory;
  ShowProduct;
end;

procedure TframeProduct.InsUpd(AId: Integer);
var
  f: TfrmProductEdit;
begin


  if AId = 0 then
    f := TfrmProductEdit.Create(Self, ProductId, fieldCategoryid.Value, fieldCategoryname.Value)
  else
    f := TfrmProductEdit.Create(Self, ProductId, fieldProductcategory_id.Value, fieldProductcategory_name.Value);
  // Application.CreateForm(TfrmCategoryEdit, frmCategoryEdit);
  // frmCategoryEdit.Init(category, id, queryCategoty);
  f.ShowModal;
  if f.isSave = true then
    ProductId := f.id;
  ShowProduct;
  // Application.CreateForm(TfrmProductEdit, frmProductEdit);
  // if AId = 0 then
  // begin
  // //   product.categoryName := category.Name;
  // // product.CategoryId := category.id;
  // end;
  // frmProductEdit.Init(product, queryProduct, AId);
  // frmProductEdit.ShowModal;
  //
  // if frmProductEdit.IDSave = true then
  // begin
  // queryProduct.Refresh;
  // // queryCategoty.Locate('id', product.categoryId, []);
  // lstCategoryClick(nil);
  // queryProduct.Locate('id', product.id, []);
  // gridProduct.SetFocus;
  // end;
end;

procedure TframeProduct.lstCategoryClick(Sender: TObject);
begin
  ShowProduct;
end;

procedure TframeProduct.lstCategoryDblClick(Sender: TObject);
begin
  btnEditClick(Sender);
end;

procedure TframeProduct.ShowCategory;
begin
  memCategory.Active := false;
  memCategory.Active := true;
  memCategory.Locate('id', CategoryId, []);
end;

procedure TframeProduct.ShowProduct;
begin
  memProduct.Filtered := false;
  // memProduct.Filter := 'is_delete = ' + BoolToStr(frameTopPanel1.isShowDel);
  memProduct.Filter := ' level  like ' + QuotedStr(fieldCategorylevel.Value + '%');
  memProduct.Filtered := true;
  memProduct.Active := true;
  memProduct.Locate('id', ProductId, []);
end;

end.
