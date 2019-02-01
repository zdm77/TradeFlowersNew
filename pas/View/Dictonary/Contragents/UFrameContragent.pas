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
  dxDateRanges, dxBarBuiltInMenu, cxPC;

type
  TFindControl = class(TcxGridTableController);
  TcxGridFindPanelAccess = class(TcxGridFindPanel);

  TFrameContragent = class(TFrame)
    queryType: TUniQuery;
    dsType: TUniDataSource;
    dsContragentView: TUniDataSource;
    queryContragentView: TUniQuery;
    fieldContragentId: TIntegerField;
    fieldContragentName: TStringField;
    fieldContragentTypeId: TIntegerField;
    tab1: TcxTabControl;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDel: TButton;
    btnRefresh: TButton;
    cxGroupBox5: TcxGroupBox;
    gridContragent: TcxGrid;
    viewContragent: TcxGridDBTableView;
    columnName: TcxGridDBColumn;
    level1: TcxGridLevel;
    query1: TUniQuery;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure tab1Change(Sender: TObject);
    procedure viewContragentDataControllerFilterRecord(ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var Accept: Boolean);
    procedure viewTypeCellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
  private
    IdFilter: Boolean;
    // FindPanel: TcxFindPanelMRUEdit;
    procedure Expand(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure InsUpd(AId: Integer);
    procedure ShowTypeTab;
  public
    procedure init;
    procedure ShowContragents(idLocate: Integer = 0);
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UfrmContragentEdt, UFuncAndProc;

procedure TFrameContragent.btnAddClick(Sender: TObject);
var
  f: TfrmContragentEdt;
begin
  // f := TfrmContragentEdt.Create(Self);
end;

procedure TFrameContragent.btnEditClick(Sender: TObject);
begin
  InsUpd(fieldContragentId.Value);
end;

procedure TFrameContragent.Expand(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CodeSite.send(TcxGridFindPanelAccess(TFindControl(viewContragent.Controller).FindPanel).Edit.ClassName);
end;

procedure TFrameContragent.init;
begin
  // FindPanel:= TcxGridFindPanelAccess(TFindControl(viewContragent.Controller)
  // .FindPanel);
  TcxGridFindPanelAccess(TFindControl(viewContragent.Controller).FindPanel).Edit.OnKeyUp := Self.Expand;
  ShowTypeTab;
end;

procedure TFrameContragent.InsUpd(AId: Integer);
var
  f: TfrmContragentEdt;
begin
  f := TfrmContragentEdt.Create(Self, AId);
  f.ShowModal;
  if f.ModalResult = mrYes then
  begin
    queryType.Locate('id', f.fieldContragentTypeId.Value, []);
    ShowContragents(fieldContragentId.Value);
  end;
end;

procedure TFrameContragent.ShowContragents(idLocate: Integer = 0);

begin
  // UContragent.GetTypes(queryType);
  // UContragent.getContragents(queryContragentView);
  with queryContragentView do
  begin
    Close;

    ParamByName('contragent_type_id').AsInteger := UFuncAndProc.getIdByName('dictonary.contragent_type',
      tab1.Tabs[tab1.TabIndex].Caption);
    Open;
    // queryContragentView.Locate('id', idLocate, []);
  end;
  // установить фокус в поиск
  TcxGridFindPanelAccess(TFindControl(viewContragent.Controller).FindPanel).Edit.SetFocus;
  // viewContragent .DataController.Groups.FullExpand;
end;

procedure TFrameContragent.ShowTypeTab;
begin
  tab1.Tabs.Clear;
  with queryType do
  begin
    Close;
    Open;
    while not eof do
    begin
      tab1.Tabs.Add(FieldByName('name').Value);
      next;
    end;
    if IsEmpty = false then
      ShowContragents();
  end;
end;

procedure TFrameContragent.tab1Change(Sender: TObject);
begin
 if queryContragentView.Active=true then
  ShowContragents();
end;

procedure TFrameContragent.viewContragentDataControllerFilterRecord(ADataController: TcxCustomDataController;
  ARecordIndex: Integer; var Accept: Boolean);
begin
  // OutputDebugString(pchar('Отладка: ' + TcxGridFindPanelAccess(TcxGridTableControllerAccess(viewContragent.Controller)
  // .FindPanel).Edit.Text));
  // if (TcxGridFindPanelAccess(TcxGridTableControllerAccess(viewContragent.Controller).FindPanel).Edit.Text <> '') and
  // (IdFilter = false) then
  // begin
  // IdFilter := true;
  // viewContragent.DataController.Groups.FullExpand;
  //
  //
  // end;
end;

procedure TFrameContragent.viewTypeCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  TcxGridFindPanelAccess(TFindControl(viewContragent.Controller).FindPanel).Edit.SetFocus;
end;

end.
