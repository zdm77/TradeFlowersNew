unit UDmMain;

interface

uses
  System.SysUtils, System.Classes, Data.DB, DBAccess, Uni, UniProvider,
  PostgreSQLUniProvider, DASQLMonitor, UniSQLMonitor, MemDS, dxmdaset;

type
  TDMMain = class(TDataModule)
    conMain: TUniConnection;
    prov1: TPostgreSQLUniProvider;
    mon1: TUniSQLMonitor;
    queryPostMem: TUniQuery;
    memPost: TdxMemData;
    dsPostMem: TDataSource;
    queryContragentMem: TUniQuery;
    memContragentMem: TdxMemData;
    dsContragentMem: TDataSource;
    queryContrType: TUniQuery;
    memContrType: TdxMemData;
    dsContrType: TDataSource;
  private
    { Private declarations }
  public
    procedure LoadAnyMem(AQuery: TUniQuery; AMem: TdxMemData);
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

procedure TDMMain.LoadAnyMem(AQuery: TUniQuery; AMem: TdxMemData);
begin
  AQuery.Close;
  AQuery.Open;
  AMem.Active := false;
  AMem.LoadFromDataSet(AQuery);
  AMem.Active := True;
  AMem.First;
end;

procedure TDMMain.LoadContragent;
begin
  LoadAnyMem(queryContragentMem, memContragentMem);
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
