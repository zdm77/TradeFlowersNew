unit UProductModel;

interface

uses
  Classes, Uni, System.SysUtils, UCategory;

type
  TProduct = class(TObject)
  private
    Fcategory: TCategory;
    FcategoryId: Integer;
    FId: Integer;
    FName: string;

    FcategoryName: string;
    procedure Setcategory(const Value: TCategory);
    procedure SetcategoryId(const Value: Integer);
    procedure SetcategoryName(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetName(const Value: string);
  public
    constructor Create; overload; virtual;
    constructor Create(AFcategoryId, AId: Integer; AName: string); overload; virtual;
    procedure GetProducts(query: TUniQuery; parentId: Integer);
    procedure getProductById(Id: Integer; query: TUniQuery);
    procedure setProduct(query: TUniQuery);
    property category: TCategory read Fcategory write Setcategory;
    property categoryId: Integer read FcategoryId write SetcategoryId;
    property categoryName: string read FcategoryName write SetcategoryName;
    property Id: Integer read FId write SetId;
    property Name: string read FName write SetName;
  end;

implementation

uses UDmMain;

constructor TProduct.Create(AFcategoryId, AId: Integer; AName: string);
begin
  inherited Create;
  FcategoryId := AFcategoryId;
  FId := AId;
  FName := AName;
  category := TCategory.Create;
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
  SQL.Append(' select * ');
  SQL.Append(' from dictonary.product ');
  SQL.Append(' where category_id in (');
  SQL.Append(' SELECT id');
  SQL.Append(' FROM r');
  SQL.Append(' )  or category_id=' + IntToStr(parentId));
  SQL.Append(' order by name');
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

procedure TProduct.getProductById(Id: Integer; query: TUniQuery);
var
  SQL: TStringBuilder;
begin
  SQL := TStringBuilder.Create;
  SQL.Clear;
  SQL.Append(' SELECT');
  SQL.Append(' id,');
  SQL.Append(' name,');
  SQL.Append(' category_id,');
  SQL.Append(' suffix,');
  SQL.Append(' barcode');
  SQL.Append(' FROM ');
  SQL.Append(TABLE_PRODUCT);
  SQL.Append(' where id=');
  SQL.Append(IntToStr(Id));
  query.Close;
  query.SQL.Text := SQL.ToString;
  query.Open;
  // setProduct(query);
end;

procedure TProduct.Setcategory(const Value: TCategory);
begin
  Fcategory := Value;
end;

procedure TProduct.SetcategoryName(const Value: string);
begin
  FcategoryName := Value;
end;

procedure TProduct.setProduct(query: TUniQuery);
var QueryCat: TUniQuery;
begin
  QueryCat:=TUniQuery.Create(nil);
  QueryCat.Connection:=DMMain.conMain;
  Id := query.FieldByName('id').Value;
  categoryId := query.FieldByName('category_id').Value;
  category.assignCategoryById(categoryId, QueryCat);
  categoryName :=  QueryCat.FieldByName('name').Value;

end;

end.
