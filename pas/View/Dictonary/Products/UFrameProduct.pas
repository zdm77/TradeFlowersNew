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
  cxInplaceContainer, cxDBTL, cxTLData;

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
    procedure btnCategoryAddClick(Sender: TObject);
    procedure btnCategoryEditClick(Sender: TObject);
  private
    category: TCategory;
    procedure CategoryInsEdt(isNew: Boolean);
    procedure ShowCategory;
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
  ShowCategory;
end;

procedure TframeProduct.ShowCategory;
begin
  category.GetSelectSQL(queryCategoty);
end;

end.
