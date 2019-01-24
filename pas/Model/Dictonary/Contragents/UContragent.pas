unit UContragent;

interface

uses
  Uni, System.SysUtils;

procedure getContragents(var query: TUniQuery);

procedure GetTypes(query: TUniQuery);

implementation

uses UDmMain;

procedure getContragents(var query: TUniQuery);
var
  SQL: TStringBuilder;
begin
  SQL := TStringBuilder.Create;
  // SQL.Append(' SELECT c.id,');
  // SQL.Append(' c.name,');
  // SQL.Append(' c.contragent_type_id,');
  // SQL.Append(' ct.name type_name');
  // SQL.Append(' FROM dictonary.contragent c');
  // SQL.Append(' INNER JOIN dictonary.contragent_type ct ON (c.contragent_type_id = ct.id)');
  SQL.Append(' SELECT');
  SQL.Append(' id,');
  SQL.Append(' name,');
  SQL.Append(' contragent_type_id');
  SQL.Append(' FROM');
  SQL.Append(' dictonary.contragent ');
  SQL.Append(' ORDER BY name');
  query.Close;
  query.SQL.Text := SQL.ToString;
  query.Open;
end;

procedure GetTypes(query: TUniQuery);
var
  SQL: TStringBuilder;
begin
  SQL := TStringBuilder.Create;
  // SQL.Append(' SELECT c.id,');
  // SQL.Append(' c.name,');
  // SQL.Append(' c.contragent_type_id,');
  // SQL.Append(' ct.name type_name');
  // SQL.Append(' FROM dictonary.contragent c');
  // SQL.Append(' INNER JOIN dictonary.contragent_type ct ON (c.contragent_type_id = ct.id)');
  SQL.Append(' SELECT');
  SQL.Append(' id,');
  SQL.Append(' name');
  SQL.Append(' FROM');
  SQL.Append(' dictonary.contragent_type ');
  SQL.Append(' ORDER BY name');
  query.Close;
  query.SQL.Text := SQL.ToString;
  query.Open;
end;

end.
