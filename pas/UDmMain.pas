unit UDmMain;

interface

uses
  System.SysUtils, System.Classes, Data.DB, DBAccess, Uni;

type
  TDMMain = class(TDataModule)
    conMain: TUniConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMain: TDMMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
