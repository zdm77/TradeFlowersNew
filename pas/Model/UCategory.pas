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
    FParentId: Integer;
    function GetdsCategory: TUniDataSource;
    procedure SetId(const Value: Integer);
    procedure SetlistProp(const Value: TList);
    procedure SetName(const Value: string);
    procedure SetParentId(const Value: Integer);
  public
    property dsCategory: TUniDataSource read GetdsCategory;
    property Id: Integer read FId write SetId;
    property listProp: TList read FlistProp write SetlistProp;
    /// <summary>Наименование
    /// </summary>
    /// type:string
    property Name: string read FName write SetName;
    property ParentId: Integer read FParentId write SetParentId;
    procedure GetCategories(query: TUniQuery);
    procedure assignCategoryById(_id: Integer; query: TUniQuery);
    function GetParent(_pid: Integer): TCategory;
    procedure SetCategory(query: TUniQuery);
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

procedure TCategory.GetCategories(query: TUniQuery);
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
  SetCategory(query);
  // Result := SQL.ToString;
end;

procedure TCategory.assignCategoryById(_id: Integer; query: TUniQuery);
var
  SQL: TStringBuilder;
begin
  SQL := TStringBuilder.Create;
  SQL.Clear;
  SQL.Append(' SELECT');
  SQL.Append(' id,');
  SQL.Append(' name,');
  SQL.Append(' pid');
  SQL.Append(' FROM');
  SQL.Append(' dictonary.category');
  SQL.Append(' where ');
  SQL.Append(' id= ');
  SQL.Append(IntToStr(_id));
  query.Close;
  query.SQL.Text := SQL.ToString;
  query.Open;
end;

function TCategory.GetParent(_pid: Integer): TCategory;
var
  query: TUniQuery;
  category_out: TCategory;
  SQL: TStringBuilder;
begin
  query := TUniQuery.Create(nil);
  query.Connection := DMMain.conMain;
  SQL := TStringBuilder.Create;
  SQL.Clear;
  SQL.Append(' SELECT');
  SQL.Append(' id,');
  SQL.Append(' name,');
  SQL.Append(' pid');
  SQL.Append(' FROM');
  SQL.Append(' dictonary.category');
  SQL.Append(' where ');
  SQL.Append(' id= ');
  SQL.Append(IntToStr(_pid));
  query.Close;
  query.SQL.Text := SQL.ToString;
  query.Open;
  if query.RecordCount > 0 then
  begin
    category_out := TCategory.Create;
    category_out.SetCategory(query);
    Result := category_out;
  end;
  // TODO -cMM: TCategory.GetParent default body inserted
end;

procedure TCategory.SetCategory(query: TUniQuery);
begin
  if query.RecordCount > 0 then
  begin
    SetId(query.FieldByName('id').Value);
    SetParentId(query.FieldByName('pid').Value);
    SetName(query.FieldByName('name').Value);
  end;
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

procedure TCategory.SetParentId(const Value: Integer);
begin
  FParentId := Value;
end;

end.
