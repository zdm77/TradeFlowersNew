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
  Vcl.DBCtrls, cxCustomData, cxFilter, cxData,
  cxDataControllerConditionalFormattingRulesManagerDialog, UProductModel,
  cxMaskEdit, cxButtonEdit, UProps, cxGroupBox,  UFrameSave, CodeSiteLogging, dxDateRanges;

type
  TfrmProductEdit = class(TForm)
    dsProduct: TUniDataSource;
    queryProduct: TUniQuery;
    dsProps: TUniDataSource;
    queryProps: TUniQuery;
    fieldProductid: TIntegerField;
    fieldProductname: TStringField;
    fieldProductcategory_id: TIntegerField;
    fieldProductsuffix: TStringField;
    fieldProductbarcode: TStringField;
    cxGroupBox1: TcxGroupBox;
    lbl2: TLabel;
    edtParentName: TcxButtonEdit;
    edtname: TcxDBTextEdit;
    lbl1: TLabel;
    btnFromBase: TButton;
    cxGroupBox3: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    lbl3: TLabel;
    edtBarCode: TcxDBTextEdit;
    frameSave1: TframeSave;
    procedure btnFromBaseClick(Sender: TObject);
    procedure edtParentNameClick(Sender: TObject);
    procedure edtParentNamePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure frameSave1btnAbortClick(Sender: TObject);
    procedure frameSave1Button1Click(Sender: TObject);
  private
    FId: Integer;
    FisAbortImport: Boolean;
    FisSave: Boolean;
    FName: string;
    _senderQuery: TUniQuery;
    _product: TProduct;
    _props: TProps;
    procedure showProps;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; AId, AParentId: Integer; AParentName: string; AName: string = '';
      ABarcode: string = '');
    procedure init(product: TProduct; senderQuery: TUniQuery; isNew: Boolean);
    procedure SelectCategory;
    property Id: Integer read FId write FId;
    property isAbortImport: Boolean read FisAbortImport write FisAbortImport;
    property isSave: Boolean read FisSave write FisSave;
    { Public declarations }
  end;

var
  frmProductEdit: TfrmProductEdit;

implementation

uses
  UDmMain, UfrmSelectTree, UFuncAndProc;
{$R *.dfm}

constructor TfrmProductEdit.Create(AOwner: TComponent; AId, AParentId: Integer; AParentName: string; AName: string = '';
  ABarcode: string = '');
begin
  inherited Create(AOwner);
 // CodeSite.Send(csmLevel1, 'data', AId);
  Id := AId;
  queryProduct.ParamByName('id').AsInteger := Id;
  queryProduct.Open;
  if Id = 0 then
  begin
    queryProduct.Insert;
    fieldProductcategory_id.Value := AParentId;
    fieldProductname.Value := AName;
    fieldProductbarcode.Value := ABarcode;
    // edtname.Text:=AName;
    // edtBarCode.Text:=ABarcode;
  end
  else
    queryProduct.Edit;
  edtParentName.Text := AParentName;
end;

procedure TfrmProductEdit.btnFromBaseClick(Sender: TObject);
var
  queryTempPropCat: TUniQuery;
  queryUpd: TUniQuery;
begin
  if isSave = false then
  begin
    _product.Name := edtname.Text;
    _product.Save(_product);
    _product.getProductById(_product.Id, queryProduct);
    queryProduct.Edit;
    isSave := True;
  end;
  queryTempPropCat := TUniQuery.Create(nil);
  queryTempPropCat.Connection := DMMain.conMain;
  queryUpd := TUniQuery.Create(nil);
  queryUpd.Connection := DMMain.conMain;
  queryUpd.Close;
  queryUpd.SQL.Text :=
    'insert into  dictonary.properties_product ( category_props_id,  product_id) values (:category_props_id, :product_id)';
  with queryTempPropCat do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' select cp.id,');
    SQL.Add(' p.name');
    SQL.Add(' from');
    SQL.Add(' dictonary.properties_category');
    SQL.Add(' cp');
    SQL.Add(' inner join');
    SQL.Add(' dictonary.properties');
    SQL.Add(' p on p.id = cp.prop_id');
    SQL.Add(' where cp.category_id = ' + IntToStr(_product.categoryId) + ' and');
    SQL.Add(' cp.id not in (');
    SQL.Add(' select pp.category_props_id');
    SQL.Add(' from');
    SQL.Add(' dictonary.properties_product');
    SQL.Add(' pp');
    SQL.Add(' where pp.product_id = ' + IntToStr(_product.Id));
    SQL.Add(' )');
    Open;
    while not eof do
    begin
      queryUpd.ParamByName('category_props_id').Value := FieldByName('id').Value;
      queryUpd.ParamByName('product_id').Value := _product.Id;
      queryUpd.ExecSQL;
      Next;
    end;
  end;
  showProps;
end;

procedure TfrmProductEdit.edtParentNameClick(Sender: TObject);
begin
  SelectCategory;
end;

procedure TfrmProductEdit.edtParentNamePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  // Application.CreateForm(TfrmSelectTree, frmSelectTree);
  // frmSelectTree.init(_product.category);
  // frmSelectTree.ShowModal;
  // if frmSelectTree.ModalResult = mrOk then
  // begin
  // _product.categoryId := frmSelectTree.idSelect;
  // _product.categoryName := frmSelectTree.nameSelect;
  // edtParentName.Text := _product.categoryName;
  // end;
  SelectCategory;
end;

procedure TfrmProductEdit.FormShow(Sender: TObject);
begin
  edtname.SetFocus;
  if edtParentName.Text = '' then
    SelectCategory;
  if edtBarCode.Text = '' then
    if Application.MessageBox('������������� �����-���?', '������', MB_YESNO + MB_ICONQUESTION) = mrYes then
      edtBarCode.Text := UFuncAndProc.GenBarcode;
end;

procedure TfrmProductEdit.frameSave1btnAbortClick(Sender: TObject);
begin
  isAbortImport:=True;
end;

procedure TfrmProductEdit.frameSave1Button1Click(Sender: TObject);
begin
  if UFuncAndProc.Validate(queryProduct, fieldProductid, 'dictonary.product') = True then
  begin
    Id := fieldProductid.Value;
    isSave := True;
    Close;
  end;
end;

procedure TfrmProductEdit.init(product: TProduct; senderQuery: TUniQuery; isNew: Boolean);
begin
  _props := TProps.Create(queryProps);
  _senderQuery := senderQuery;
  _product := product;
  _product.getProductById(_product.Id, queryProduct);
  if isNew = True then
    queryProduct.Insert
  else
    queryProduct.Edit;
  edtParentName.Text := _product.categoryName;
  // prodId := _senderQuery.FieldByName('id').AsString;
  // begin
  // with queryProduct do
  // begin
  // Close;
  // sql.Text := 'select * from prod_poduct where id=' + prodId;
  // Open;
  // if isNew = True then
  // Insert
  // else
  // Update;
  // end;
  // end;
  showProps;
end;

procedure TfrmProductEdit.SelectCategory;
begin
  Application.CreateForm(TfrmSelectTree, frmSelectTree);
  frmSelectTree.idLocate := fieldProductcategory_id.Value;
  frmSelectTree.lblProduct.Caption := '������������: ' + fieldProductname.Value;
  frmSelectTree.ShowModal;
  if frmSelectTree.ModalResult = mrYes then
  begin
    fieldProductcategory_id.Value := frmSelectTree.idSelect;
    edtParentName.Text := frmSelectTree.nameSelect;
  end;
end;

procedure TfrmProductEdit.showProps;
begin

  with queryProps do
  begin
    Close;
    ParamByName('id').Value := _product.Id;
    Open;
  end;
end;

end.
