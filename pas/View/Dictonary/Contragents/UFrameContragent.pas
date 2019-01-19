unit UFrameContragent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  DBAccess, Uni, MemDS, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxContainer,
  Vcl.StdCtrls, cxGroupBox;

type
  TFrame1 = class(TFrame)
    queryContragent: TUniQuery;
    dsContragent: TUniDataSource;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    gridProduct: TcxGrid;
    viewProduct: TcxGridDBTableView;
    columnName: TcxGridDBColumn;
    columnType: TcxGridDBColumn;
    level1: TcxGridLevel;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDel: TButton;
    btnRefresh: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
