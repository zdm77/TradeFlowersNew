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
  cxInplaceContainer, cxDBTL, cxTLData, UProductModel, cxDBNavigator;

type
  TframeProduct = class(TFrame)
    dsCategory: TUniDataSource;
    queryCategoty: TUniQuery;
    btnCategoryAdd: TButton;
    btnCategoryEdit: TButton;
    gridProduct: TcxGrid;
    viewProduct: TcxGridDBTableView;
    column1: TcxGridDBColumn;
    level1: TcxGridLevel;
    dsProduct: TUniDataSource;
    queryProduct: TUniQuery;
    btnProdAdd: TButton;
    btnProdEdit: TButton;
    lstCategory: TcxDBTreeList;
    columnNameC: TcxDBTreeListColumn;
    navCategory: TcxDBNavigator;
    procedure btnCategoryAddClick(Sender: TObject);
    procedure btnCategoryEditClick(Sender: TObject);
    procedure lstCategoryClick(Sender: TObject);
    procedure navCategoryButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
  private
    product: TProduct;
    category: TCategory;
    procedure CategoryInsEdt(isNew: Boolean);
    procedure ShowCategory;
    procedure ShowProduct;
    { Private declarations }
  public
    procedure Init;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UCategoryEdit, UDmMain;

procedure TframeProduct.btnCategoryAddClick(Sender: TObject);
begin
  CategoryInsEdt(true);
end;

procedure TframeProduct.btnCategoryEditClick(Sender: TObject);
begin
  CategoryInsEdt(false);
end;

procedure TframeProduct.CategoryInsEdt(isNew: Boolean);
begin
  Application.CreateForm(TfrmCategoryEdit, frmCategoryEdit);
  frmCategoryEdit.setParam(queryCategoty, isNew);
  frmCategoryEdit.Show;
end;

procedure TframeProduct.Init;
begin
  category := TCategory.Create;
  product := TProduct.Create;
  ShowCategory;
  ShowProduct;
end;

procedure TframeProduct.lstCategoryClick(Sender: TObject);
begin
  if category.Id <> queryCategoty.FieldByName('id').AsInteger then
  begin
    category.SetCategory(queryCategoty);
    ShowProduct;
  end;
end;



procedure TframeProduct.navCategoryButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
begin
case AButtonIndex of
//добавить
  16:  CategoryInsEdt(true);
  //редактировать
  17:  CategoryInsEdt(false);
end;
end;

procedure TframeProduct.ShowCategory;
begin
  category.GetCategories(queryCategoty);
end;

procedure TframeProduct.ShowProduct;
begin
  product.GetProducts(queryProduct, category.Id);
end;

end.
