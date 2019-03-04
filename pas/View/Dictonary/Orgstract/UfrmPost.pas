unit UfrmPost;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UFrameTopPanel, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData, DBAccess, Uni, MemDS, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, CodeSiteLogging,
  dxDateRanges;

type
  TFindControl = class(TcxGridTableController);
  TcxGridFindPanelAccess = class(TcxGridFindPanel);

  TfrmPost = class(TForm)
    frameTopPanel1: TframeTopPanel;
    grid1: TcxGrid;
    view1: TcxGridDBTableView;
    columnName: TcxGridDBColumn;
    level1: TcxGridLevel;
    queryPost: TUniQuery;
    fieldPostId: TIntegerField;
    dsPost: TUniDataSource;
    fieldPostName: TStringField;
    fieldPostis_delete: TBooleanField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure frameTopPanel1btnAddClick(Sender: TObject);
    procedure frameTopPanel1btnDelClick(Sender: TObject);
    procedure frameTopPanel1btnEditClick(Sender: TObject);
    procedure frameTopPanel1btnRefreshClick(Sender: TObject);
    procedure frameTopPanel1btnRestoreClick(Sender: TObject);
    procedure frameTopPanel1chkShowDelClick(Sender: TObject);
    procedure view1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
  private
    FId: Integer;
    property Id: Integer read FId write FId;
    procedure InsUpd(AId: Integer);
  public
    // constructor Create(AOwner: TComponent; AId: Integer);
    procedure ShowPost;
  end;

var
  frmPost: TfrmPost;

implementation

{$R *.dfm}

uses UfrmPostEdt, UDmMain;
// constructor TfrmTemplateChild.Create(AOwner: TComponent; AId: Integer);
// begin
// Inherited Create(AOwner);
// Id := AId;
// end;

procedure TfrmPost.ShowPost;
begin
  with queryPost do
  begin
    Close;
    ParamByName('is_delete').AsBoolean := frameTopPanel1.isShowDel;
    Open;
    Locate('id', Id, []);
  end;
  // установить фокус в поиск
  TcxGridFindPanelAccess(TFindControl(view1.Controller).FindPanel).Edit.SetFocus;
end;

procedure TfrmPost.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPost := nil;
end;

procedure TfrmPost.FormShow(Sender: TObject);
begin
  ShowPost;
end;

procedure TfrmPost.frameTopPanel1btnAddClick(Sender: TObject);
begin
  InsUpd(0);
end;

procedure TfrmPost.frameTopPanel1btnDelClick(Sender: TObject);
begin
  frameTopPanel1.DeleteRecord(queryPost, 'dictonary.post');
end;

procedure TfrmPost.frameTopPanel1btnEditClick(Sender: TObject);
begin
  InsUpd(fieldPostId.Value);
end;

procedure TfrmPost.frameTopPanel1btnRefreshClick(Sender: TObject);
begin
  ShowPost;
end;

procedure TfrmPost.frameTopPanel1btnRestoreClick(Sender: TObject);
begin
  frameTopPanel1.RestoreRecord(queryPost, 'dictonary.post');
end;

procedure TfrmPost.frameTopPanel1chkShowDelClick(Sender: TObject);
begin
  frameTopPanel1.chkShowDelClick(Sender);
  ShowPost;
end;

procedure TfrmPost.InsUpd(AId: Integer);
var
  f: TfrmPostEdt;
begin
  f := TfrmPostEdt.Create(Self, AId);
  f.ShowModal;
  if f.ModalResult = mrYes then
  begin
    Id := f.Id;
    ShowPost();
  end;
end;

procedure TfrmPost.view1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  InsUpd(fieldPostId.Value);
end;

end.
