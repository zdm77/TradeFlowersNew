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
    queryLevel: TUniQuery;
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
    query1: TUniQuery;
    procedure btn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure frameTopPanel1btnAddClick(Sender: TObject);
    procedure frameTopPanel1btnEditClick(Sender: TObject);
    procedure frameTopPanel2btnAddClick(Sender: TObject);
    procedure frameTopPanel2btnEditClick(Sender: TObject);
    procedure frameTopPanel2btnImportClick(Sender: TObject);
    procedure frameTopPanel2btnRefreshClick(Sender: TObject);
    procedure lstCategoryClick(Sender: TObject);
    procedure lstCategoryDblClick(Sender: TObject);
  private
    product: TProduct;
    category: TCategory;
    CountParent: Integer;
    FCategoryId: Integer;
    FProductId: Integer;
    // FSelCategoryID: Integer;
    procedure CategoryInsEdt(id: Integer);
    procedure ShowCategory;
    procedure ShowProduct;
    procedure Expand(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure InsUpd(AId: Integer);
    property CategoryId: Integer read FCategoryId write FCategoryId;
    property ProductId: Integer read FProductId write FProductId;
    { Private declarations }
  public
    procedure InsertLinks(AParentId, AId: Integer);
    // property SelCategoryID: Integer read FSelCategoryID write SetSelCategoryID;
    procedure Init;
    function GetCountParent(AParentId: Integer): Integer;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  UCategoryEdit, UDmMain, UProductEdit, UfrmImport, UDMSite;

procedure TframeProduct.btn1Click(Sender: TObject);
var
  level: Integer;

  I: Integer;
begin

end;

procedure TframeProduct.btnEditClick(Sender: TObject);
begin
  if (fieldCategorypid.Value <> 0) then
  begin
    CategoryInsEdt(fieldCategoryid.Value);
  end
  else
    Application.MessageBox('Данную категорию редактировать запрещено.', 'Ошибка', MB_OK + MB_ICONERROR)
end;

procedure TframeProduct.CategoryInsEdt(id: Integer);
var
  f: TfrmCategoryEdit;
begin
  f := TfrmCategoryEdit.Create(Self, memCategory, id);
  // Application.CreateForm(TfrmCategoryEdit, frmCategoryEdit);
  // frmCategoryEdit.Init(category, id, queryCategoty);
  f.ShowModal;
  if f.isSave = True then
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

procedure TframeProduct.frameTopPanel1btnEditClick(Sender: TObject);
begin
  CategoryInsEdt(fieldCategoryid.Value);
end;

procedure TframeProduct.frameTopPanel2btnAddClick(Sender: TObject);
begin
  InsUpd(0);
end;

procedure TframeProduct.frameTopPanel2btnEditClick(Sender: TObject);
begin
  InsUpd(fieldProductid.Value);
end;

procedure TframeProduct.frameTopPanel2btnImportClick(Sender: TObject);
begin
  if frmImport = nil then
    Application.CreateForm(TfrmImport, frmImport);
  frmImport.Show;
end;

procedure TframeProduct.frameTopPanel2btnRefreshClick(Sender: TObject);
begin
  memProduct.Active := false;
  ShowProduct;
end;

procedure TframeProduct.InsertLinks(AParentId, AId: Integer);
var
  I: Integer;
begin
  with query1 do
  begin
    Close;
    SQL.Text := 'select * from dictonary.category where id=' + AParentId.ToString;
    Open;
    if RecordCount > 0 then
    begin
      CountParent := CountParent - 1;
      dmSite.querySite3.Close;
      dmSite.querySite3.ParamByName('category_id').Value := AId;
      dmSite.querySite3.ParamByName('path_id').Value := FieldByName('id').Value;
      dmSite.querySite3.ParamByName('level').Value := CountParent;
      dmSite.querySite3.ExecSQL;
      InsertLinks(FieldByName('pid').AsInteger, AId);
    end;
  end;
end;

procedure TframeProduct.Init;
begin
  product := TProduct.Create;
  ShowCategory;
  ShowProduct;
end;

function TframeProduct.GetCountParent(AParentId: Integer): Integer;
var
  I: Integer;
begin
  with query1 do
  begin
    Close;
    SQL.Text := 'select * from dictonary.category where id=' + AParentId.ToString;
    Open;
    if RecordCount > 0 then
    begin
      CountParent := CountParent + 1;
      GetCountParent(FieldByName('pid').AsInteger);
    end;
  end;
end;

procedure TframeProduct.InsUpd(AId: Integer);
var
  f: TfrmProductEdit;
begin
  if AId = 0 then
    f := TfrmProductEdit.Create(Self, ProductId, fieldCategoryid.Value, fieldCategoryname.Value)
  else
    f := TfrmProductEdit.Create(Self, AId, fieldProductcategory_id.Value, fieldProductcategory_name.Value);
  // Application.CreateForm(TfrmCategoryEdit, frmCategoryEdit);
  // frmCategoryEdit.Init(category, id, queryCategoty);
  f.ShowModal;
  if f.isSave = True then
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
  memCategory.Active := True;
  memCategory.Locate('id', CategoryId, []);
end;

procedure TframeProduct.ShowProduct;
begin
  frameTopPanel2.btnImport.Visible := True;
  memProduct.Filtered := false;
  // memProduct.Filter := 'is_delete = ' + BoolToStr(frameTopPanel1.isShowDel);
  memProduct.Filter := ' level  like ' + QuotedStr(fieldCategorylevel.Value + '%');
  memProduct.Filtered := True;
  memProduct.Active := True;
  memProduct.Locate('id', ProductId, []);
end;

end.
