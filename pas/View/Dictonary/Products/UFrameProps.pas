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
  cxCheckBox, cxDBNavigator;

type
  TframeProps = class(TFrame)
    gridProps: TcxGrid;
    viewProps: TcxGridDBTableView;
    columnName: TcxGridDBColumn;
    levelGrid1Level1: TcxGridLevel;
    dsProps: TUniDataSource;
    queryProps: TUniQuery;
    columnProd: TcxGridDBColumn;
    queryProd: TUniQuery;
    dsProd: TUniDataSource;
    columnPropsColumn1: TcxGridDBColumn;
    nav1: TcxDBNavigator;
    procedure btnAddClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject); pascal;
    procedure btnEditClick(Sender: TObject);
  private
    prop: TProps;
    procedure InsEdit(isNew: Boolean);
    procedure ShowProps;
    procedure UserNavigatorButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
    { Private declarations }
  public
    procedure Init;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UfrmPropEdit, UMain;

procedure TframeProps.btnAddClick(Sender: TObject);
begin
//  InsEdit(true);
end;

procedure TframeProps.btnDelClick(Sender: TObject);
var
  i: Integer;
begin
  // prop.DeleteE;
 
end;

procedure TframeProps.btnEditClick(Sender: TObject);
begin
//  InsEdit(false);
end;

procedure TframeProps.Init;
var
  AButton: TcxNavigatorCustomButton;
begin
  nav1.Buttons.OnButtonClick :=UserNavigatorButtonsButtonClick;
  prop := TProps.Create(queryProps);
  ShowProps;
end;

procedure TframeProps.InsEdit(isNew: Boolean);
begin
  Application.CreateForm(TfrmPropEditDict, frmPropEditDict);
  frmPropEditDict.setParam(queryProps, isNew);
  frmPropEditDict.Show;
end;

procedure TframeProps.ShowProps;
begin
  // prop.GetSelectSQL();
  queryProps.Close;
  queryProps.Open;
  queryProd.Close;
  queryProd.Open;
end;

procedure TframeProps.UserNavigatorButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
begin
end;

end.
