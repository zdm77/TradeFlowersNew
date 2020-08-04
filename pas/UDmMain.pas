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

const
  TABLE_CATEGORY = 'product_category';
 const
  TABLE_PRODUCT = 'product';
const
  TABLE_PROPERTIES = 'dictonary.properties';
 const
  TABLE_CATEGORY_PROPERTY = 'dictonary.properties_category';
  const
  TABLE_PRODUCT_PROPERTY = 'dictonary.properties_product';
implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }
{$R *.dfm}

end.
