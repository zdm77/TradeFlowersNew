unit UfrmUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UFrameTopPanel, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData, DBAccess, Uni, MemDS, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, CodeSiteLogging;

type
  TFindControl = class(TcxGridTableController);
  TcxGridFindPanelAccess = class(TcxGridFindPanel);

  TfrmUser = class(TForm)
    frameTopPanel1: TframeTopPanel;
    grid1: TcxGrid;
    view1: TcxGridDBTableView;
    columnName: TcxGridDBColumn;
    level1: TcxGridLevel;
    queryUser: TUniQuery;
    ds1: TUniDataSource;
    field_Userid: TIntegerField;
    field_Username: TStringField;
    field_Userlogin: TStringField;
    field_Useris_delete: TBooleanField;
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
    procedure ShowUser;
  end;

var
  frmUser: TfrmUser;

implementation

{$R *.dfm}

uses UfrmUserEdt;

procedure TfrmUser.ShowUser;
begin
  with queryUser do
  begin
    Close;
    ParamByName('is_delete').AsBoolean := frameTopPanel1.isShowDel;
    Open;
    Locate('id', Id, []);
  end;
  // установить фокус в поиск
  TcxGridFindPanelAccess(TFindControl(view1.Controller).FindPanel).Edit.SetFocus;
end;

procedure TfrmUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmUser := nil;
end;

procedure TfrmUser.FormShow(Sender: TObject);
begin
  ShowUser;
end;

procedure TfrmUser.frameTopPanel1btnAddClick(Sender: TObject);
begin
  InsUpd(0);
end;

procedure TfrmUser.frameTopPanel1btnDelClick(Sender: TObject);
begin
  frameTopPanel1.DeleteRecord(queryUser, 'dictonary.users');
end;

procedure TfrmUser.frameTopPanel1btnEditClick(Sender: TObject);
begin
  InsUpd(field_Userid.Value);
end;

procedure TfrmUser.frameTopPanel1btnRefreshClick(Sender: TObject);
begin
  ShowUser;
end;

procedure TfrmUser.frameTopPanel1btnRestoreClick(Sender: TObject);
begin
  frameTopPanel1.RestoreRecord(queryUser, 'dictonary.users');
end;

procedure TfrmUser.frameTopPanel1chkShowDelClick(Sender: TObject);
begin
  frameTopPanel1.chkShowDelClick(Sender);
  ShowUser;
end;

procedure TfrmUser.InsUpd(AId: Integer);
var
  f: TfrmUserEdt;
begin
  f := TfrmUserEdt.Create(Self, AId);
  f.ShowModal;
  if f.ModalResult = mrYes then
  begin
    Id := f.Id;
    ShowUser();
  end;
end;

procedure TfrmUser.view1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  InsUpd(field_Userid.Value);
end;

end.
