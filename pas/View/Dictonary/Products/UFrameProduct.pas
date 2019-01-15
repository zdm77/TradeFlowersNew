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
  cxContainer, cxSplitter, cxGroupBox;

type

  TframeProduct = class(TFrame)
    dsCategory: TUniDataSource;
    queryCategoty: TUniQuery;
    gridProduct: TcxGrid;
    viewProduct: TcxGridDBTableView;
    column1: TcxGridDBColumn;
    level1: TcxGridLevel;
    dsProduct: TUniDataSource;
    queryProduct: TUniQuery;
    btnProdAdd: TButton;
    btnProdEdit: TButton;
    cxGroupBox1: TcxGroupBox;
    lstCategory: TcxDBTreeList;
    columnNameC: TcxDBTreeListColumn;
    cxSplitter1: TcxSplitter;
    cxGroupBox2: TcxGroupBox;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDel: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure lstCategoryClick(Sender: TObject);
    procedure navCategoryButtonsButtonClick(Sender: TObject; AButtonIndex: Integer;
      var ADone: Boolean);
  private
    product: TProduct;
    category: TCategory;
 //   FSelCategoryID: Integer;
    procedure CategoryInsEdt(isNew: Boolean);

    procedure ShowCategory;
    procedure ShowProduct;
    { Private declarations }
  public
 //   property SelCategoryID: Integer read FSelCategoryID write SetSelCategoryID;
    procedure Init;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UCategoryEdit, UDmMain;

procedure TframeProduct.btnAddClick(Sender: TObject);
begin
    CategoryInsEdt(true);
end;

procedure TframeProduct.btnEditClick(Sender: TObject);
begin
   CategoryInsEdt(false);
end;

procedure TframeProduct.CategoryInsEdt(isNew: Boolean);
begin
  Application.CreateForm(TfrmCategoryEdit, frmCategoryEdit);
  frmCategoryEdit.init(category, isNew, queryCategoty);
  frmCategoryEdit.Show;
end;

procedure TframeProduct.Init;
begin

  category := TCategory.Create(queryCategoty);
  product := TProduct.Create;
  ShowCategory;
  ShowProduct;
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
  product.GetProducts(queryProduct, category.Id);
end;

end.
