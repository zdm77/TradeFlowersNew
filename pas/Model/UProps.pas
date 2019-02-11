unit UProps;

interface

uses
  Classes, Uni, System.SysUtils, TypInfo;

type
  TProps = class(TObject)
  private
    FId: Integer;
    QueryProp: TUniQuery;
    FName: string;
    procedure SetId(const Value: Integer);
    procedure SetName(const Value: string);
  public
    procedure DeleteE();
    procedure GetProps();
    property Id: Integer read FId write SetId;
    property Name: string read FName write SetName;
    constructor Create(query: TUniQuery); overload;
    procedure GetPropsByCategoryId(category_id: Integer; query: TUniQuery);
    procedure SetCategory;
    procedure SetProp;
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
  // посмотреть не использоуется ли
end;

procedure TProps.GetProps();
var
  SQL: TStringBuilder;
begin
  SQL := TStringBuilder.Create;
  QueryProp.Close;
  SQL.Append(' SELECT');
  SQL.Append(' id,');
  SQL.Append(' name');
  SQL.Append(' FROM');
  SQL.Append(' dictonary.properties ');
  SQL.Append(' ORDER BY name ');
  QueryProp.SQL.Text := SQL.ToString;
  QueryProp.Open;
end;

procedure TProps.GetPropsByCategoryId(category_id: Integer; query: TUniQuery);
var
  SQL: TStringBuilder;
begin
  SQL := TStringBuilder.Create;
  query.Close;
  SQL.Append(' SELECT');
  SQL.Append(' pr.name,');
  SQL.Append(' pc.id,');
  SQL.Append(' pc.category_id,');
  SQL.Append(' pc.prop_id,');
  SQL.Append(' pc.order_by,');
  SQL.Append(' pc.in_name');
  SQL.Append(' FROM');
  SQL.Append(' dictonary.properties_category pc');
  SQL.Append(' INNER JOIN dictonary.properties pr ON (pc.prop_id = pr.id)');
  SQL.Append(' where pc.category_id=' + IntToStr(category_id));
  SQL.Append(' order by pc.order_by');
  query.SQL.Text := SQL.ToString();
  query.Open;
  end;

procedure TProps.SetCategory;
begin
  if QueryProp.RecordCount > 0 then
  begin
    SetId(QueryProp.FieldByName('id').Value);
    SetName(QueryProp.FieldByName('name').Value);
  end;
end;

procedure TProps.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TProps.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TProps.SetProp;
begin
  SetId(QueryProp.FieldByName('id').Value);
  SetName(QueryProp.FieldByName('name').Value);
end;

end.
