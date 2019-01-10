unit UFrameProduct;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Vcl.StdCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, MemDS, DBAccess, Uni, cxCustomData,
  cxFilter, cxData;

type
  TframeProduct = class(TFrame)
    dsCategory: TUniDataSource;
    queryCategoty: TUniQuery;
    gridCategory: TcxGrid;
    viewCategory: TcxGridDBTableView;
    columnName: TcxGridDBColumn;
    levelGrid1Level1: TcxGridLevel;
    btnCategoryAdd: TButton;
    btnCategoryEdit: TButton;
    gridProduct: TcxGrid;
    viewProduct: TcxGridDBTableView;
    column1: TcxGridDBColumn;
    level1: TcxGridLevel;
    dsProduct: TUniDataSource;
    queryProduct: TUniQuery;
    procedure btnCategoryAddClick(Sender: TObject);
    procedure btnCategoryEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UCategoryEdit;

procedure TframeProduct.btnCategoryAddClick(Sender: TObject);
begin
  frmCategoryEdit.setParam(queryCategoty, true);
  frmCategoryEdit.Show;
end;

procedure TframeProduct.btnCategoryEditClick(Sender: TObject);
begin
  frmCategoryEdit.setParam(queryCategoty, false);
  frmCategoryEdit.Show;
end;

end.
