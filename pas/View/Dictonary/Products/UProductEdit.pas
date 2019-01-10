unit UProductEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxDBEdit, Vcl.StdCtrls, Data.DB, MemDS, DBAccess, Uni, cxStyles,
  cxVGrid, cxInplaceContainer, cxDBVGrid,
  cxDataStorage, cxNavigator, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls,
  Vcl.DBCtrls, cxCustomData, cxFilter, cxData;

type
  TfrmProductEdit = class(TForm)
    dsProduct: TUniDataSource;
    queryProduct: TUniQuery;
    lbl1: TLabel;
    edtname: TcxDBTextEdit;
    btn1: TButton;
    dsProps: TUniDataSource;
    queryProps: TUniQuery;
    viewProp: TcxGridDBTableView;
    levelProp: TcxGridLevel;
    gridProp: TcxGrid;
    columnName: TcxGridDBColumn;
    columnVal: TcxGridDBColumn;
    DBNavigator1: TDBNavigator;
    procedure btn1Click(Sender: TObject);
  private
    _senderQuery: TUniQuery;

    { Private declarations }
  public
    procedure setParam(senderQuery: TUniQuery; isNew: Boolean);
    { Public declarations }
  end;

var
  frmProductEdit: TfrmProductEdit;

implementation

uses
  UDmMain;

{$R *.dfm}

procedure TfrmProductEdit.btn1Click(Sender: TObject);
begin
  if (queryProps.State = dsEdit) or (queryProps.State = dsInsert) then
  try
    queryProps.UpdateRecord;
    queryProps.Post;
  except

  end;
  if (queryProduct.State = dsEdit) or (queryProduct.State = dsInsert) then
  try
    queryProduct.Post;
    _senderQuery.Refresh;
    _senderQuery.Locate('id', queryProduct.FieldByName('id').AsInteger, []);

  except

  end;

  Close;
end;

procedure TfrmProductEdit.setParam(senderQuery: TUniQuery; isNew: Boolean);
var
  queryTempPropCat: TUniQuery;
  queryUpd: TUniQuery;
  prodId: string;
begin
  _senderQuery := senderQuery;
  prodId := _senderQuery.FieldByName('id').AsString;
  begin
    with queryProduct do
    begin
      Close;
      sql.Text := 'select * from prod_poduct where id=' + prodId;
      Open;
      if isNew = True then
        Insert
      else
        Update;
    end;
  end;
  queryTempPropCat := TUniQuery.Create(nil);
  queryTempPropCat.Connection := DMMain.conMain;
  queryUpd := TUniQuery.Create(nil);
  queryUpd.Connection := DMMain.conMain;
  queryUpd.Close;
  queryUpd.SQL.Text := 'insert into prod_prop ( "category_propsId",  "productId") values (:category_propsId, :productId)';
  with queryTempPropCat do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' select cp.id, p.name');
    SQL.Add(' from category_props cp');
    SQL.Add(' inner join "Props" p on p.id = cp."propId"');
    SQL.Add(' where "categoryId" = ' + _senderQuery.FieldByName('product_category_id').AsString + ' and');
    SQL.Add(' cp.id not in (');
    SQL.Add(' select "category_propsId"');
    SQL.Add(' from prod_prop pp');
    SQL.Add(' where pp."productId" = ' + prodId);
    SQL.Add(' )');
    Open;
    while not eof do
    begin
      queryUpd.ParamByName('category_propsId').Value := FieldByName('id').Value;
      queryUpd.ParamByName('productId').Value := prodId;
      queryUpd.ExecSQL;
      Next;
    end;
  end;
  with queryProps do
  begin
    Close;
    ParamByName('id').Value := prodId;
    Open;
  end;

end;

end.

