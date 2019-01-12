unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, MemDS, DBAccess,
  Uni, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls,
  PostgreSQLUniProvider, cxGridBandedTableView, System.Generics.Collections,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, cxPC, dxBarBuiltInMenu, dxTabbedMDI,
  Vcl.Menus, Vcl.ImgList, cxLocalization, MemTableDataEh, MemTableEh;

type
  TProduct = class
  private
    FId: Integer;
    FName: string;
    FPid: Integer;
  public
    property Id: Integer read FId;
    property Name: string read FName write FName;
    property Pid: Integer read FPid;
  end;

  TfrmMain = class(TForm)
    mm1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    tabMain: TdxTabbedMDIManager;
    N3: TMenuItem;
    imgMidle: TcxImageList;
    imgSmall: TcxImageList;
    imgLarge: TcxImageList;
    cxLocalizer1: TcxLocalizer;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    listProduct: TList<TProduct>;
    { Private declarations }
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  UCategory, UProductEdit, UCategoryEdit, UProduct, UfrmProps;

procedure TfrmMain.btn1Click(Sender: TObject);
var
  product: TProduct;
  i: Integer;
  // s:TStringBuilder;
begin
  product := TProduct.Create;
  product.Name := 'Иван';
  listProduct := TList<TProduct>.Create;
  listProduct.Add(product);
  listProduct.Add(product);
  // for  I := 0 to listProduct.Count-1 do
  // OutputDebugString(PChar(product.Name));
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  cxLocalizer1.LoadFromFile(ExtractFileDir(Application.ExeName) + '\..\INI\LanguagesUnicode.ini');
  cxLocalizer1.Active := true;
  cxLocalizer1.Locale := 1049;
  // with queryMain do
  // begin
  // Close;
  // SQL.Text := 'select * from category';
  // Open;
  // end;
  // with queryProduct do
  // begin
  // Close;
  // SQL.Text := 'select * from prod_poduct';
  // Open;
  // end;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  if frmProduct = nil then
    Application.CreateForm(TfrmProduct, frmProduct);
  frmProduct.Show;
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
  if frmProps = nil then
    Application.CreateForm(TfrmProps, frmProps);
  frmProps.Show;
end;

end.
