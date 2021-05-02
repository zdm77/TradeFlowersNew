unit UfrmClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, dxDateRanges, Data.DB, cxDBData, MemDS,
  DBAccess, Uni, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls,
  cxGroupBox, UICrud;

type
  TfrmClient = class(TForm, ICrud)
    groupTop: TcxGroupBox;
    btnProductAdd: TButton;
    btnProductEdt: TButton;
    btnProductDel: TButton;
    btnProductRefresh: TButton;
    gridProduct: TcxGrid;
    viewProduct: TcxGridDBTableView;
    columnName: TcxGridDBColumn;
    level1: TcxGridLevel;
    dsClient: TUniDataSource;
    QueryClient: TUniQuery;
    procedure btnProductAddClick(Sender: TObject);
    procedure btnProductEdtClick(Sender: TObject);
    procedure btnProductRefreshClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    // procedure InsUpd(isNew: Boolean = true);
    { Private declarations }
    procedure ShowEntity(Id: integer);
    procedure InsUpd(isNew: boolean = true);
    procedure Delete(Id: integer);
    procedure Refresh();
  public
    // procedure SaveClient(id: Integer);
  end;

var
  frmClient: TfrmClient;

implementation

{$R *.dfm}

uses UfrmClientEdt, UFuncAndProc, UDmMain;

procedure TfrmClient.btnProductAddClick(Sender: TObject);
begin
  InsUpd(true);
end;

procedure TfrmClient.btnProductEdtClick(Sender: TObject);
begin
  InsUpd(false);
end;

procedure TfrmClient.btnProductRefreshClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmClient.Delete(Id: integer);
begin
  UFuncAndProc.deleteById(QueryClient['id'], DICT_TABLE_CLIENT);
end;

procedure TfrmClient.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmClient := nil;
end;

procedure TfrmClient.FormShow(Sender: TObject);
begin
  ShowEntity(0);
end;

procedure TfrmClient.InsUpd(isNew: boolean = true);
var
  Id: integer;
begin
  Id := 0;
  if frmClientEdt = nil then
  begin
    if isNew = false then
      Id := QueryClient['id'];
    frmClientEdt := TfrmClientEdt.Create(Self, Id, isNew, Self);
    // Application.CreateForm(TfrmClientEdt, frmClientEdt);
    // frmClientEdt.view := self;
    // frmClientEdt.Show;
    // frmClientEdt.isNew := isNew;
    // if isNew = false then
    // frmClientEdt.Id := QueryClient['id']
  end;
  frmClientEdt.Show;
end;

procedure TfrmClient.Refresh;
begin
  QueryClient.Refresh;
end;

procedure TfrmClient.ShowEntity(Id: integer);
begin
  if QueryClient.Active = false then
    QueryClient.Open
  else
  begin
    QueryClient.Refresh;
    QueryClient.Locate('id', Id, [])
  end;
end;

end.
