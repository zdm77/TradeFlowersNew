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
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TframeProduct = class(TFrame)
    dsCategory: TUniDataSource;
    queryCategoty: TUniQuery;
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
    column1: TcxGridDBColumn;
    level1: TcxGridLevel;
    cxGroupBox4: TcxGroupBox;
    btnProductAdd: TButton;
    btnProductEdt: TButton;
    btnProductDel: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnProductAddClick(Sender: TObject);
    procedure btnProductEdtClick(Sender: TObject);
    procedure lstCategoryClick(Sender: TObject);
    procedure lstCategoryDblClick(Sender: TObject);
    procedure navCategoryButtonsButtonClick(Sender: TObject; AButtonIndex: Integer;
      var ADone: Boolean);
  private
    product: TProduct;
    category: TCategory;
    // FSelCategoryID: Integer;
    procedure CategoryInsEdt(isNew: Boolean);
    procedure InsUpd(isNew: Boolean);
    procedure ShowCategory;
    procedure ShowProduct;
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
  CategoryInsEdt(true);
end;

procedure TframeProduct.btnDelClick(Sender: TObject);
begin
  if Application.MessageBox('Вы действительно хотите удалить группу и все пренадлежащие ей товары?',
    'Вопрос', MB_YESNO + MB_ICONWARNING) = mrYes then
  begin
    category.DeleteCategory();
    category.Refresh;
  end;
end;

procedure TframeProduct.btnEditClick(Sender: TObject);
begin
  CategoryInsEdt(false);
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

procedure TframeProduct.CategoryInsEdt(isNew: Boolean);
begin
  if category.ParentId <> 0 then
  begin
    Application.CreateForm(TfrmCategoryEdit, frmCategoryEdit);
    frmCategoryEdit.Init(category, isNew, queryCategoty);
    frmCategoryEdit.Show;
  end
  else
    Application.MessageBox('Данную категорию редактировать запрещено.', 'Ошибка',
      MB_OK + MB_ICONERROR)
end;

procedure TframeProduct.Init;
begin
  category := TCategory.Create(queryCategoty);
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
    product.categoryId := category.Id;

  end;
  frmProductEdit.Init(product, queryProduct, isNew);
  frmProductEdit.Show;
end;

procedure TframeProduct.lstCategoryClick(Sender: TObject);
begin
  if category.Id <> queryCategoty.FieldByName('id').AsInteger then
  begin
    // FSelCategoryID := queryCategoty.FieldByName('id').AsInteger;
    category.SetCategory;
    ShowProduct;
  end;
end;

procedure TframeProduct.lstCategoryDblClick(Sender: TObject);
begin
  CategoryInsEdt(false);
end;

procedure TframeProduct.navCategoryButtonsButtonClick(Sender: TObject; AButtonIndex: Integer;
  var ADone: Boolean);
begin
  case AButtonIndex of
    // добавить
    16:
      CategoryInsEdt(true);
    // редактировать
    17:
      CategoryInsEdt(false);
  end;
end;

procedure TframeProduct.ShowCategory;
begin
  category.GetCategories;
end;

procedure TframeProduct.ShowProduct;
begin
  // viewProduct.FindPanel
  product.GetProducts(queryProduct, category.Id);
end;

end.
