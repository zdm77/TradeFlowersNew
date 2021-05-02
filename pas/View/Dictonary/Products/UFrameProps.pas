unit UFrameProps;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, MemDS,
  DBAccess, Uni, Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, UProps,
  cxDBLookupComboBox, dxLayoutContainer, cxGridInplaceEditForm, cxLabel,
  cxCheckBox, cxDBNavigator, cxTextEdit, cxContainer, cxGroupBox,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxDateRanges;

type
  TframeProps = class(TFrame)
    dsProps: TUniDataSource;
    queryProps: TUniQuery;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    gridProps: TcxGrid;
    viewProps: TcxGridDBTableView;
    columnName: TcxGridDBColumn;
    viewPropsRootGroup: TcxGridInplaceEditFormGroup;
    levelGrid1Level1: TcxGridLevel;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDel: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure nav1ButtonsButtonClick(Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
    procedure queryPropsBeforePost(DataSet: TDataSet);
    procedure queryPropsDeleteError(DataSet: TDataSet; E: EDatabaseError; var
        Action: TDataAction);
    procedure queryPropsPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure queryPropsUpdateError(DataSet: TDataSet; E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure viewPropsCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
      var AHandled: Boolean);
  private
    prop: TProps;
    procedure InsEdit(isNew: Boolean);
    procedure ShowProps;
    { Private declarations }
  public
    procedure Init;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UfrmPropEdit, UFuncAndProc, UfrmOnlyName, UDmMain;

procedure TframeProps.btnAddClick(Sender: TObject);
begin
  InsEdit(true);
end;

procedure TframeProps.btnDelClick(Sender: TObject);
begin
  prop.DeleteE;
end;

procedure TframeProps.btnEditClick(Sender: TObject);
begin

  InsEdit(false);
end;

procedure TframeProps.Init;
begin
  prop := TProps.Create(queryProps);
  ShowProps;
end;

procedure TframeProps.InsEdit(isNew: Boolean);
begin
  Application.CreateForm(TfrmOnlyName, frmOnlyName);
  frmOnlyName.Init(DICT_TABLE_PROPERTIES, true, isNew, queryProps, prop.Id, prop.Name);
  frmOnlyName.Show;
end;

procedure TframeProps.nav1ButtonsButtonClick(Sender: TObject; AButtonIndex: Integer;
  var ADone: Boolean);
begin
  // ShowMessage(IntToStr(AButtonIndex));
end;

procedure TframeProps.queryPropsBeforePost(DataSet: TDataSet);
begin
  // UFuncAndProc.
  // Application.MessageBox('','',MB_OK);
end;

procedure TframeProps.queryPropsDeleteError(DataSet: TDataSet; E:
    EDatabaseError; var Action: TDataAction);
begin
  if (Pos('constraint', E.Message) <> 0) then
  begin
    Application.MessageBox('Данное свойство используется. Удаление не возможно.', 'Ошибка', MB_OK+MB_ICONERROR);
    System.SysUtils.Abort;
  end;
end;

procedure TframeProps.queryPropsPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  if (Pos('duplicate', E.Message) <> 0) then
  begin
    Application.MessageBox('Данные с таким значением уже существуют', 'Ошибка', MB_OK+MB_ICONERROR);
    System.SysUtils.Abort;
  end;
  // DataSet.Cancel;
end;

procedure TframeProps.queryPropsUpdateError(DataSet: TDataSet; E: EDatabaseError;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  // Application.MessageBox('Jij','',MB_OK)  ;
end;

procedure TframeProps.ShowProps;
begin
  prop.GetProps;
end;

procedure TframeProps.viewPropsCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
  var AHandled: Boolean);
begin
  prop.SetProp;
end;

end.
