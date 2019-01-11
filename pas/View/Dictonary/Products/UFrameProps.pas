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
  cxCheckBox;

type
  TframeProps = class(TFrame)
    gridProps: TcxGrid;
    viewProps: TcxGridDBTableView;
    columnName: TcxGridDBColumn;
    levelGrid1Level1: TcxGridLevel;
    btnAdd: TButton;
    btnEdit: TButton;
    dsProps: TUniDataSource;
    queryProps: TUniQuery;
    btnDel: TButton;
    columnProd: TcxGridDBColumn;
    queryProd: TUniQuery;
    dsProd: TUniDataSource;
    columnPropsColumn1: TcxGridDBColumn;
    procedure btnAddClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject); pascal;
    procedure btnEditClick(Sender: TObject);
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

uses UfrmPropEdit;

procedure TframeProps.btnAddClick(Sender: TObject);
begin
  InsEdit(true);
end;

procedure TframeProps.btnDelClick(Sender: TObject);
var i:Integer;
begin
//  prop.DeleteE;
for I := 0 to ComponentCount-1 do
 begin
   if (Components[i] is TEdit) then
   begin
      ShowMessage((Components[i] as TEdit).Name);
   end;

 end;
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
  Application.CreateForm(TfrmPropEditDict, frmPropEditDict);
  frmPropEditDict.setParam(queryProps, isNew);
  frmPropEditDict.Show;
end;

procedure TframeProps.ShowProps;
begin
//  prop.GetSelectSQL();
queryProps.Close;
queryProps.Open;
queryProd.Close;
queryProd.Open;

end;

end.
