unit UFrameProps;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, MemDS,
  DBAccess, Uni, Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, UProps;

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
    procedure btnAddClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
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
  Application.CreateForm(TfrmPropEditDict, frmPropEditDict);
  frmPropEditDict.setParam(queryProps, isNew);
  frmPropEditDict.Show;
end;

procedure TframeProps.ShowProps;
begin
  prop.GetSelectSQL();
end;

end.
