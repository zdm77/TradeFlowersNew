unit UDmMain;

interface

uses
  System.SysUtils, System.Classes, Data.DB, DBAccess, Uni, UniProvider,
  PostgreSQLUniProvider, DASQLMonitor, UniSQLMonitor;

type
  TDMMain = class(TDataModule)
    conMain: TUniConnection;
    prov1: TPostgreSQLUniProvider;
    mon1: TUniSQLMonitor;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMain: TDMMain;
 ///------Справочники------///////
const
  DICT_TABLE_CATEGORY = 'product_category';

const
  DICT_TABLE_PRODUCT = 'product';

const
  DICT_TABLE_PROPERTIES = 'properties';

const
  DICT_TABLE_CATEGORY_PROPERTY = 'properties_category';

const
  DICT_TABLE_PRODUCT_PROPERTY = 'properties_product';

const
  DICT_TABLE_CLIENT = 'client';

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }
{$R *.dfm}

end.
