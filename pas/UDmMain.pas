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
    dsPostMem: TDataSource;
    queryContragentMem: TUniQuery;
    dsContragentMem: TDataSource;
    queryContrType: TUniQuery;
    dsContrType: TDataSource;
    memPost: TMemTableEh;
    memContragent: TMemTableEh;
    memContrType: TMemTableEh;
    queryContrFields: TUniQuery;
    memContrFields: TMemTableEh;
    dsContrFields: TDataSource;
  private
    { Private declarations }
  public
    procedure LoadAnyMem(AQuery: TUniQuery; AMem: TMemTableEh);
    procedure LoadContragent;
    procedure LoadContrType;
    procedure LoadDictonary;
    procedure LoadPost;
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

uses UfrmSplash;
{$R *.dfm}

procedure TDMMain.LoadAnyMem(AQuery: TUniQuery; AMem: TMemTableEh);
begin
  AQuery.Close;
  AQuery.Open;
  AMem.Active := false;
  AMem.LoadFromDataSet(AQuery, -1, lmCopy, true);
  AMem.Active := True;
  AMem.First;
end;

procedure TDMMain.LoadContragent;
begin
  LoadAnyMem(queryContragentMem, memContragent);
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
  f.Close;
  f.Free;
end;

procedure TDMMain.LoadPost;
begin
  LoadAnyMem(queryPostMem, memPost);
end;

end.
