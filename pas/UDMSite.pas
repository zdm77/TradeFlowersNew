unit UDMSite;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, Uni, UniProvider, MySQLUniProvider;

type
  TdmSite = class(TDataModule)
    conSite: TUniConnection;
    provSite: TMySQLUniProvider;
    querySiteUpd: TUniQuery;
    querySIte2: TUniQuery;
    querySite3: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSite: TdmSite;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
