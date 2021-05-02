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
  cxGroupBox;

type
  TfrmClient = class(TForm)
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
    fieldQueryClientid: TIntegerField;
    fieldQueryClientname: TStringField;
    procedure btnProductAddClick(Sender: TObject);
    procedure btnProductEdtClick(Sender: TObject);
    procedure btnProductRefreshClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    procedure InsUpdClient(isNew: Boolean = true);
    { Private declarations }
  public
    procedure ShowClients(id: Integer);
    { Public declarations }
  end;

var
  frmClient: TfrmClient;

implementation

{$R *.dfm}

uses UfrmClientEdt, UFuncAndProc, UDmMain;

procedure TfrmClient.btnProductAddClick(Sender: TObject);
begin
  InsUpdClient(true);
end;

procedure TfrmClient.btnProductEdtClick(Sender: TObject);
begin
  InsUpdClient(false);
end;

procedure TfrmClient.btnProductRefreshClick(Sender: TObject);
begin

   QueryClient.Locate('id', 6, [loPartialKey])
end;

procedure TfrmClient.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmClient := nil;
end;

procedure TfrmClient.FormShow(Sender: TObject);
begin
  ShowClients(0);
end;

procedure TfrmClient.InsUpdClient(isNew: Boolean = true);
begin
  Application.CreateForm(TfrmClientEdt, frmClientEdt);
  viewProduct.DataController.BeginFullUpdate;
  if isNew = true then
    QueryClient.Insert
  else
    QueryClient.Edit;
  frmClientEdt.ShowModal;
  if frmClientEdt.isSave = true then
  begin
    if isNew then
      fieldQueryClientid.Value := UFuncAndProc.getNewId(DICT_TABLE_CLIENT);
    QueryClient.Post;
    QueryClient.Cancel;
    ShowClients(fieldQueryClientid.Value);
  end
  else
    QueryClient.Cancel;
  viewProduct.DataController.EndFullUpdate;
end;

procedure TfrmClient.ShowClients(id: Integer);
begin
  if QueryClient.Active = false then
    QueryClient.Open
  else
  begin
    QueryClient.Refresh;
    QueryClient.Locate('id', id, [])
  end;
end;

end.
