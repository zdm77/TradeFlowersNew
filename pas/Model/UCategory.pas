unit UCategory;

interface

uses
  Classes, Uni, System.SysUtils;

type
  TCategory = class(TObject)
  private
    FId: Integer;
    FlistProp: TList;
    FName: string;
    function GetdsCategory: TUniDataSource;
    procedure SetId(const Value: Integer);
    procedure SetlistProp(const Value: TList);
    procedure SetName(const Value: string);
  public
    property dsCategory: TUniDataSource read GetdsCategory;
    property Id: Integer read FId write SetId;
    property listProp: TList read FlistProp write SetlistProp;
    property Name: string read FName write SetName;
    procedure GetSelectSQL(query: TUniQuery);
  end;

implementation

uses UDmMain;

function TCategory.GetdsCategory: TUniDataSource;
var
  query: TUniQuery;
begin
  query := TUniQuery.Create(nil);
  with query do
  begin
    Connection := DMMain.conMain;
    SQL.Clear;
    SQL.Add(' SELECT');
    SQL.Add(' id,');
    SQL.Add(' name,');
    SQL.Add(' pid');
    SQL.Add(' FROM');
    SQL.Add(' dictonary.category ;');
    Open;
  end;
  dsCategory.DataSet := query;
  Result := dsCategory;
end;

procedure TCategory.GetSelectSQL(query: TUniQuery);
var
  SQL: TStringBuilder;
begin
  SQL := TStringBuilder.Create;
  query.Close;
  SQL.Append(' SELECT');
  SQL.Append(' id,');
  SQL.Append(' name,');
  SQL.Append(' pid');
  SQL.Append(' FROM');
  SQL.Append(' dictonary.category ;');
  query.SQL.Text := SQL.ToString;
  query.Open;
  // Result := SQL.ToString;
end;

procedure TCategory.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TCategory.SetlistProp(const Value: TList);
begin
  FlistProp := Value;
end;

procedure TCategory.SetName(const Value: string);
begin
  FName := Value;
end;

end.
