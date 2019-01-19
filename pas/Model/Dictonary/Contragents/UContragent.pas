unit UContragent;

interface

uses
  Uni, System.SysUtils;

procedure getContragents(query: TUniQuery);

implementation

uses UDmMain;

procedure getContragents(query: TUniQuery);
var
  SQL: TStringBuilder;
begin
  SQL := TStringBuilder.Create;
  SQL.Append(' SELECT c.id,');
  SQL.Append(' c.name,');
  SQL.Append(' c.contragent_type_id,');
  SQL.Append(' ct.name type_name');
  SQL.Append(' FROM dictonary.contragent c');
  SQL.Append(' INNER JOIN dictonary.contragent_type ct ON (c.contragent_type_id = ct.id)');
  SQL.Append(' ORDER BY name');
  with query do
  begin
    Close;
    SQL.Text := SQL.ToString;
    Open;
  end;
end;

end.
