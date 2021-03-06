unit UFrameContragent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  DBAccess, Uni, MemDS, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxContainer,
  Vcl.StdCtrls, cxGroupBox, UContragent, cxSplitter, CodeSiteLogging,
   dxBarBuiltInMenu, cxPC, UFrameTopPanel, Vcl.Grids, Vcl.DBGrids, dxmdaset, MemTableDataEh, DataDriverEh,
  MemTableEh, dxDateRanges;

type
  TFindControl = class(TcxGridTableController);
  TcxGridFindPanelAccess = class(TcxGridFindPanel);

  TFrameContragent = class(TFrame)
    tab1: TcxTabControl;
    frameTopPanel1: TframeTopPanel;
    gridContragent: TcxGrid;
    viewContragent: TcxGridDBTableView;
    columnName: TcxGridDBColumn;
    level1: TcxGridLevel;
    memContrType: TMemTableEh;
    dsContr: TUniDataSource;
    memContr: TMemTableEh;
    fieldContrid: TIntegerField;
    fieldContrname: TStringField;
    fieldContrcontragent_type_id: TIntegerField;
    fieldContris_delete: TBooleanField;
    DataDriverContr: TDataSetDriverEh;
    DataDriverContrType: TDataSetDriverEh;
    procedure btnAddClick(Sender: TObject);
    procedure frameTopPanel1btnAddClick(Sender: TObject);
    procedure frameTopPanel1btnDelClick(Sender: TObject);
    procedure frameTopPanel1btnEditClick(Sender: TObject);
    procedure frameTopPanel1btnRestoreClick(Sender: TObject);
    procedure frameTopPanel1btnSelectClick(Sender: TObject);
    procedure frameTopPanel1chkShowDelClick(Sender: TObject);
    procedure tab1Change(Sender: TObject);
    procedure viewTypeCellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
  private
    FId: Integer;
    FTypeId: Integer;
    // FindPanel: TcxFindPanelMRUEdit;
    procedure Expand(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure InsUpd(AId: Integer);
    procedure ShowTypeTab;
    property Id: Integer read FId write FId;
    property TypeId: Integer read FTypeId write FTypeId;
    procedure ShowContragents(doRefresh: Boolean);
  public
    procedure init;
    procedure RefreshMemo;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UfrmContragentEdt, UFuncAndProc, UDmMain;

procedure TFrameContragent.btnAddClick(Sender: TObject);
begin
  InsUpd(0);
end;

procedure TFrameContragent.Expand(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
end;

procedure TFrameContragent.frameTopPanel1btnAddClick(Sender: TObject);
begin
  InsUpd(0);
end;

procedure TFrameContragent.frameTopPanel1btnDelClick(Sender: TObject);
begin
  frameTopPanel1.DeleteRecordMemo(fieldContrid.Value, 'dictonary.contragent');
  RefreshMemo;
end;

procedure TFrameContragent.frameTopPanel1btnEditClick(Sender: TObject);
begin
  InsUpd(fieldContrid.Value);
end;

procedure TFrameContragent.frameTopPanel1btnRestoreClick(Sender: TObject);
begin
  frameTopPanel1.RestoreRecordMemo(fieldContrid.Value, 'dictonary.contragent');
  RefreshMemo;
end;

procedure TFrameContragent.frameTopPanel1btnSelectClick(Sender: TObject);
begin
  frameTopPanel1.btnSelectClick(Sender);

end;

procedure TFrameContragent.frameTopPanel1chkShowDelClick(Sender: TObject);
begin
  frameTopPanel1.chkShowDelClick(Sender);
  RefreshMemo;
end;

procedure TFrameContragent.init;
begin
  TcxGridFindPanelAccess(TFindControl(viewContragent.Controller).FindPanel).Edit.OnKeyUp := Self.Expand;
  ShowTypeTab;
end;

procedure TFrameContragent.InsUpd(AId: Integer);
var
  f: TfrmContragentEdt;
begin
  f := TfrmContragentEdt.Create(Self, AId, TypeId);
  f.ShowModal;
  if f.ModalResult = mrYes then
  begin
    Id := f.Id;

    ShowContragents(true);
  end;
end;

procedure TFrameContragent.RefreshMemo;
begin

end;

procedure TFrameContragent.ShowContragents(doRefresh: Boolean);
begin
  if memContrType.IsEmpty = false then
  begin
    TypeId := memContrType.FieldByName('id').AsInteger;
    if doRefresh = true then
    begin
      memContr.Active := false;

      memContr.Active := true;
    end;
    memContr.Filtered := false;
    memContr.Filter := 'is_delete = ' + BoolToStr(frameTopPanel1.isShowDel);
    memContr.Filter := memContr.Filter + ' AND contragent_type_id=' + memContrType.FieldByName('id').AsString;
    memContr.Filtered := true;
    memContr.locate('id', Id, []);
    // ���������� ����� � �����
    TcxGridFindPanelAccess(TFindControl(viewContragent.Controller).FindPanel).Edit.SetFocus;
  end;
end;

procedure TFrameContragent.ShowTypeTab;
begin
  tab1.Tabs.Clear;
  with memContrType do
  begin
    Active := false;
    Active := true;
    First;
    while not eof do
    begin
      tab1.Tabs.Add(FieldByName('name').Value);
      next;
    end;
    if IsEmpty = false then
    begin
      memContrType.locate('name', tab1.Tabs[tab1.TabIndex].Caption, []);
      ShowContragents(true);
    end;
  end;
end;

procedure TFrameContragent.tab1Change(Sender: TObject);
begin
  if memContr.Active = true then
  begin
    memContrType.locate('name', tab1.Tabs[tab1.TabIndex].Caption, []);
    ShowContragents(false);
  end;
end;

procedure TFrameContragent.viewTypeCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  TcxGridFindPanelAccess(TFindControl(viewContragent.Controller).FindPanel).Edit.SetFocus;
end;

end.
