unit UProps;

interface

uses
  Classes, Uni, System.SysUtils;

type
  TProps = class(TObject)
  private
    FName: string;
    procedure SetName(const Value: string);
  public
    procedure GetSelectSQL(query: TUniQuery);
    property Name: string read FName write SetName;
  end;

implementation

procedure TProps.GetSelectSQL(query: TUniQuery);
var
  SQL: TStringBuilder;
begin
  SQL := TStringBuilder.Create;
  query.Close;
  SQL.Append(' SELECT');
  SQL.Append(' id,');
  SQL.Append(' name');
  SQL.Append(' FROM');
  SQL.Append(' "Props" ;');
  query.SQL.Text := SQL.ToString;
  query.Open;
end;

procedure TProps.SetName(const Value: string);
begin
  FName := Value;
end;

end.
