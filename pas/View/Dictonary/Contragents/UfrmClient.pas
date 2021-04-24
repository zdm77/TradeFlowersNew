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
    procedure btnProductAddClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure InsUpdClient(isNew: Boolean = true);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClient: TfrmClient;

implementation

{$R *.dfm}

uses UfrmClientEdt;

procedure TfrmClient.btnProductAddClick(Sender: TObject);
begin
  InsUpdClient(true);
end;

procedure TfrmClient.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmClient := nil;
end;

procedure TfrmClient.InsUpdClient(isNew: Boolean = true);
begin
  Application.CreateForm(TfrmClientEdt, frmClientEdt);
  frmClientEdt.ShowModal;
end;

end.
