unit UDmMain;

interface

uses
  System.SysUtils, System.Classes, Data.DB, DBAccess, Uni, UniProvider,
  PostgreSQLUniProvider, DASQLMonitor, UniSQLMonitor, MemDS, dxmdaset, MemTableDataEh, DataDriverEh, MemTableEh;

type
  TDMMain = class(TDataModule)
    conMain: TUniConnection;
    prov1: TPostgreSQLUniProvider;
    mon1: TUniSQLMonitor;
    queryPostMem: TUniQuery;
    queryContragentMem: TUniQuery;
    queryContrType: TUniQuery;
    memPost: TMemTableEh;
    memContragent: TMemTableEh;
    memContrType: TMemTableEh;
    queryContrFields: TUniQuery;
    memContrFields: TMemTableEh;
    queryCategory: TUniQuery;
    memCategory: TMemTableEh;
    mem1: TMemTableEh;
    mem2: TMemTableEh;
    queryProduct: TUniQuery;
    memProduct: TMemTableEh;
    fieldProductlevel: TStringField;
    fieldProductid: TIntegerField;
    fieldProductname: TStringField;
    fieldProductcategory_id: TIntegerField;
    fieldProductsuffix: TStringField;
    fieldProductbarcode: TStringField;
    fieldProductcategory_name: TStringField;
  private
    { Private declarations }
  public
    procedure LoadAnyMem(AQuery: TUniQuery; AMem: TMemTableEh);
    procedure LoadContragent;
    procedure LoadContrType;
    procedure LoadDictonary;
    procedure LoadPost;
    procedure LoadCategory;
    procedure LoadProduct;
  end;

var
  DMMain: TDMMain;

const
  /// таблица категорий
  TABLE_CATEGORY = 'dictonary.category';

const
  TABLE_PRODUCT = 'dictonary.product';

const
  TABLE_PROPERTIES = 'dictonary.properties';

const
  TABLE_CATEGORY_PROPERTY = 'dictonary.properties_category';

const
  TABLE_PRODUCT_PROPERTY = 'dictonary.properties_product';

const
  TABLE_CONTRAGENT = 'dictonary.contragent';

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

uses UfrmSplash, UMain;
{$R *.dfm}

procedure TDMMain.LoadAnyMem(AQuery: TUniQuery; AMem: TMemTableEh);
begin
  AQuery.Close;
  AQuery.Open;
  AMem.Active := false;
  AMem.LoadFromDataSet(AQuery, -1, lmCopy, true);
  AMem.Active := true;
  // AMem.First;
end;

procedure TDMMain.LoadContragent;
begin
  LoadAnyMem(queryContragentMem, memContragent);
  // LoadAnyMem(queryContragentMem, mem1);
  // LoadAnyMem(queryContragentMem, mem2);
  // queryContragentMem.Open;
end;

procedure TDMMain.LoadContrType;
begin
  LoadAnyMem(queryContrType, memContrType);
end;

procedure TDMMain.LoadDictonary;
var
  f: tfrmSplash;
begin
  f := tfrmSplash.Create(Self);
  f.Show;
  f.Update;
  LoadPost;
  f.Update;
  LoadContragent;
  f.Update;
  LoadContrType;
  f.Update;
  LoadCategory;
  f.Update;
  LoadProduct;
  f.Update;
 // f.Close;
//  f.Free;
  f.top:=-100;

end;

procedure TDMMain.LoadPost;
begin
  LoadAnyMem(queryPostMem, memPost);
end;

procedure TDMMain.LoadCategory;
begin
  LoadAnyMem(queryCategory, memCategory);
end;

procedure TDMMain.LoadProduct;
begin
  LoadAnyMem(queryProduct, memProduct);
end;

end.
