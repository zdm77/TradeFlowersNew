unit UProductModel;

interface

uses
  Classes, Uni, System.SysUtils;

type
  TProduct = class(TObject)
  private
    FcategoryId: Integer;
    FId: Integer;
    FName: string;
    procedure SetcategoryId(const Value: Integer);
    procedure SetId(const Value: Integer);
    procedure SetName(const Value: string);
  public
    constructor Create; overload; virtual;
    constructor Create(AFcategoryId, AId: Integer; AName: string); overload; virtual;
    procedure GetProducts(query: TUniQuery; parentId: Integer);
    property categoryId: Integer read FcategoryId write SetcategoryId;
    property Id: Integer read FId write SetId;
    property Name: string read FName write SetName;
  end;

implementation

constructor TProduct.Create(AFcategoryId, AId: Integer; AName: string);
begin
  inherited Create;
  FcategoryId := AFcategoryId;
  FId := AId;
  FName := AName;
end;

constructor TProduct.Create;
begin
  inherited Create;
end;

procedure TProduct.GetProducts(query: TUniQuery; parentId: Integer);
var
  SQL: TStringBuilder;
begin
  SQL := TStringBuilder.Create;
  query.Close;
  SQL.Append(' WITH RECURSIVE r AS (');
  SQL.Append(' SELECT id');
  SQL.Append(' FROM dictonary.category');
  SQL.Append(' WHERE pid = ' + IntToStr(parentId));
  SQL.Append(' UNION');
  SQL.Append(' SELECT cat.id');
  SQL.Append(' FROM dictonary.category cat');
  SQL.Append(' JOIN r ON cat.pid = r.id)');
  SQL.Append(' select id, name, category_id ');
  SQL.Append(' from dictonary.product ');
  SQL.Append(' where category_id in (');
  SQL.Append(' SELECT id');
  SQL.Append(' FROM r');
  SQL.Append(' )  or category_id=' + IntToStr(parentId));
  query.SQL.Text := SQL.ToString;

  query.Open;
  if query.RecordCount > 0 then
  begin
    SetId(query.FieldByName('id').Value);
    SetcategoryId(query.FieldByName('category_id').Value);
    SetName(query.FieldByName('name').Value);
  end;
end;

procedure TProduct.SetcategoryId(const Value: Integer);
begin
  FcategoryId := Value;
end;

procedure TProduct.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TProduct.SetName(const Value: string);
begin
  FName := Value;
end;

end.
