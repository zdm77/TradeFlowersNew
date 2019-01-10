unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, MemDS, DBAccess,
  Uni, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls, UniProvider,
  PostgreSQLUniProvider, cxGridBandedTableView, System.Generics.Collections,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids;

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
    conMain: TUniConnection;
    viewGrid1DBTableView1: TcxGridDBTableView;
    levelGrid1Level1: TcxGridLevel;
    grid1: TcxGrid;
    dsMain: TUniDataSource;
    columnName: TcxGridDBColumn;
    queryMain: TUniQuery;
    btn1: TButton;
    prov1: TPostgreSQLUniProvider;
    btn2: TButton;
    btn3: TButton;
    Button1: TButton;
    Button2: TButton;
    dsProduct: TUniDataSource;
    queryProduct: TUniQuery;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  UCategory, UProductEdit, UCategoryEdit;

procedure TfrmMain.btn1Click(Sender: TObject);
var
  product: TProduct;
  i: Integer;
begin

  product := TProduct.Create;
  product.Name := 'Иван';
  listProduct := TList<TProduct>.Create;
  listProduct.Add(product);
  listProduct.Add(product);

//  for  I := 0 to listProduct.Count-1 do
//       OutputDebugString(PChar(product.Name));

end;

procedure TfrmMain.btn2Click(Sender: TObject);
begin
  frmCategoryEdit.setParam(queryMain, false);
  frmCategoryEdit.Show;
end;

procedure TfrmMain.btn3Click(Sender: TObject);
begin
  frmCategoryEdit.setParam(queryMain, true);
  frmCategoryEdit.Show;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  frmProductEdit.setParam(queryProduct, false);
  frmProductEdit.Show;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  with queryMain do
  begin
    Close;
    SQL.Text := 'select * from category';
    Open;
  end;
  with queryProduct do
  begin
    Close;
    SQL.Text := 'select * from prod_poduct';
    Open;
  end;
end;

end.
