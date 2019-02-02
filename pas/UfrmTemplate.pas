unit UfrmTemplate;

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

  TfrmTemplateChild = class(TForm)
    frameTopPanel1: TframeTopPanel;
    grid1: TcxGrid;
    view1: TcxGridDBTableView;
    columnName: TcxGridDBColumn;
    level1: TcxGridLevel;
    Template_: TUniQuery;
    fieldTemplateId: TIntegerField;
    ds1: TUniDataSource;
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
    procedure ShowTemplate;
  end;

var
  frmTemplateChild: TfrmTemplateChild;

implementation

{$R *.dfm}
// constructor TfrmTemplateChild.Create(AOwner: TComponent; AId: Integer);
// begin
// Inherited Create(AOwner);
// Id := AId;
// end;

procedure TfrmTemplateChild.ShowTemplate;
begin
  with Template_ do
  begin
    Close;
    ParamByName('is_delete').AsBoolean := frameTopPanel1.isShowDel;
    Open;
    Locate('id', Id, []);
  end;
  // установить фокус в поиск
  TcxGridFindPanelAccess(TFindControl(view1.Controller).FindPanel).Edit.SetFocus;
end;

procedure TfrmTemplateChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Self := nil;
end;

procedure TfrmTemplateChild.FormShow(Sender: TObject);
begin
  ShowTemplate;
end;

procedure TfrmTemplateChild.frameTopPanel1btnAddClick(Sender: TObject);
begin
  InsUpd(0);
end;

procedure TfrmTemplateChild.frameTopPanel1btnDelClick(Sender: TObject);
begin
  // ------------------------------------------------------------------------------
  // ƒобавить им€ справочника
  // ------------------------------------------------------------------------------
  frameTopPanel1.DeleteRecord(Template_, 'dictonary.');
end;

procedure TfrmTemplateChild.frameTopPanel1btnEditClick(Sender: TObject);
begin
  InsUpd(fieldTemplateId.Value);
end;

procedure TfrmTemplateChild.frameTopPanel1btnRefreshClick(Sender: TObject);
begin
  ShowTemplate;

end;

procedure TfrmTemplateChild.frameTopPanel1btnRestoreClick(Sender: TObject);
begin
  // ------------------------------------------------------------------------------
  // ƒобавить им€ справочника
  // ------------------------------------------------------------------------------
  frameTopPanel1.RestoreRecord(Template_, 'dictonary.');
end;

procedure TfrmTemplateChild.frameTopPanel1chkShowDelClick(Sender: TObject);
begin
  frameTopPanel1.chkShowDelClick(Sender);
  ShowTemplate;
end;

// ==============================================================================
// раскоментировать
// ==============================================================================

procedure TfrmTemplateChild.InsUpd(AId: Integer);
// var
// f: TfrmContragentEdt;
begin
  // f := TfrmContragentEdt.Create(Self, AId, TypeId);
  // f.ShowModal;
  // if f.ModalResult = mrYes then
  // begin
  // Id:=  f.Id;
  //
  // ShowTemplate();
  // end;
end;

procedure TfrmTemplateChild.view1CellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  InsUpd(fieldTemplateId.Value);
end;

end.
