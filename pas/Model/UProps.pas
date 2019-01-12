unit UProps;

interface

uses
  Classes, Uni, System.SysUtils;

type
  TProps = class(TObject)
  private
    QueryProp: TUniQuery;
    FName: string;
    procedure SetName(const Value: string);
  public
    procedure DeleteE();
    procedure GetSelectSQL();
    property Name: string read FName write SetName;

    constructor Create(query: TUniQuery); overload;
  end;

implementation

uses UFuncAndProc;

constructor TProps.Create(query: TUniQuery);
begin

  QueryProp := query;
end;

procedure TProps.DeleteE();
begin
  UFuncAndProc.standartDelete(QueryProp);
end;

procedure TProps.GetSelectSQL();
var
  SQL: TStringBuilder;
begin
  SQL := TStringBuilder.Create;
  QueryProp.Close;
  SQL.Append(' SELECT');
  SQL.Append(' id,');
  SQL.Append(' name');
  SQL.Append(' FROM');
  SQL.Append(' properties ;');

  QueryProp.SQL.Text := SQL.ToString;
  QueryProp.Open;
end;

procedure TProps.SetName(const Value: string);
begin
  FName := Value;
end;

end.
