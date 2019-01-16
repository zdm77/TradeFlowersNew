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
    FqueryCategory: TUniQuery;
    function GetdsCategory: TUniDataSource;
    procedure SetId(const Value: Integer);
    procedure SetlistProp(const Value: TList);
    procedure SetName(const Value: string);
    procedure SetParentId(const Value: Integer);
    procedure SetqueryCategory(const Value: TUniQuery);
  public
    constructor Create; overload; virtual;
    constructor Create(query: TUniQuery); overload; virtual;
    property dsCategory: TUniDataSource read GetdsCategory;
    property Id: Integer read FId write SetId;
    property listProp: TList read FlistProp write SetlistProp;
    /// <summary>������������
    /// </summary>
    /// type:string
    property Name: string read FName write SetName;
    property ParentId: Integer read FParentId write SetParentId;
    property queryCategory: TUniQuery read FqueryCategory write SetqueryCategory;
    procedure AddProperty(categoryId, propertyId: Integer; inName: Boolean);
    procedure GetCategories;
    procedure assignCategoryById(_id: Integer; query: TUniQuery);
    procedure DeleteCategory;
    /// <summary>������� ������ Category �� ��������� ��������
    /// </summary>
    /// <returns> TCategory
    /// </returns>
    /// <param name="_pid"> (Integer) </param>
    function GetParent(_pid: Integer): TCategory;
    procedure Refresh;
    procedure SetCategory;
  end;

implementation

uses UDmMain, UFuncAndProc;

constructor TCategory.Create;
begin
  inherited;
end;

constructor TCategory.Create(query: TUniQuery);
begin
  SetqueryCategory(query);
end;

procedure TCategory.AddProperty(categoryId, propertyId: Integer; inName: Boolean);
var
  query: TUniQuery;
  SQL: TStringBuilder;
  maxOrder: Integer;
begin
  query := TUniQuery.Create(nil);
  query.Connection := DMMain.conMain;
  SQL := TStringBuilder.Create;
  SQL.Append('select max(order_by) from dictonary.properties_category');
  SQL.Append(' where category_id=' + IntToStr(categoryId));
  query.SQL.Text := SQL.ToString;
  query.Open;
  if query.Fields[0].AsString <> '' then
    maxOrder := query.Fields[0].AsInteger + 1;
  query.Close;
  SQL.Clear;
  SQL.Append(' INSERT INTO');
  SQL.Append(' dictonary.properties_category');
  SQL.Append(' (');
  SQL.Append(' category_id,');
  SQL.Append(' prop_id,');
  SQL.Append(' order_by,');
  SQL.Append(' in_name');
  SQL.Append(' )');
  SQL.Append(' VALUES (');
  SQL.Append(' :category_id,');
  SQL.Append(' :prop_id,');
  SQL.Append(' :order_by,');
  SQL.Append(' :in_name');
  SQL.Append(' );');
  query.SQL.Text := SQL.ToString;
  query.ParamByName('category_id').Value := categoryId;
  query.ParamByName('prop_id').Value := propertyId;
  query.ParamByName('order_by').Value := maxOrder;
  query.ParamByName('in_name').Value := inName;
  query.ExecSQL;
  SetCategory;
end;

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
    SQL.Add(' FROM ');
    SQL.Add(TABLE_CATEGORY);
    Open;
  end;
  dsCategory.DataSet := query;
  Result := dsCategory;
end;

procedure TCategory.GetCategories;
var
  SQL: TStringBuilder;
begin
  SQL := TStringBuilder.Create;
  FqueryCategory.Close;
  SQL.Append(' SELECT');
  SQL.Append(' id,');
  SQL.Append(' name,');
  SQL.Append(' pid');
  SQL.Append(' FROM ');
  SQL.Append(TABLE_CATEGORY);
  FqueryCategory.SQL.Text := SQL.ToString;
  FqueryCategory.Open;
  SetCategory;
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
  SQL.Append(' FROM ');
  SQL.Append(TABLE_CATEGORY);
  SQL.Append(' where ');
  SQL.Append(' id= ');
  SQL.Append(IntToStr(_id));
  query.Close;
  query.SQL.Text := SQL.ToString;
  query.Open;
end;

procedure TCategory.DeleteCategory;
var
  query: TUniQuery;
  SQL: TStringBuilder;
begin
  query := TUniQuery.Create(nil);
  query.Connection := DMMain.conMain;
  SQL := TStringBuilder.Create;
  SQL.Append(' DELETE FROM ');
  SQL.Append(TABLE_CATEGORY);
  SQL.Append(' WHERE ID=');
  SQL.Append(queryCategory.FieldByName('id').AsString);
  query.SQL.Text := SQL.ToString;
  query.ExecSQL;
  // TODO -cMM: TCategory.DeleteCategory default body inserted
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
  SQL.Append(' SELECT');
  SQL.Append(' id,');
  SQL.Append(' name,');
  SQL.Append(' pid');
  SQL.Append(' FROM ');
  SQL.Append(TABLE_CATEGORY);
  SQL.Append(' where ');
  SQL.Append(' id= ');
  SQL.Append(IntToStr(_pid));
  query.Close;
  query.SQL.Text := SQL.ToString;
  query.Open;
  if query.RecordCount > 0 then
  begin
    category_out := TCategory.Create(query);
    category_out.SetParentId(query.FieldByName('id').Value);
    category_out.SetName(query.FieldByName('name').Value);
    Result := category_out;
  end;
end;

procedure TCategory.Refresh;
begin
  queryCategory.Refresh;
end;

procedure TCategory.SetCategory;
begin
  if FqueryCategory.RecordCount > 0 then
  begin
    SetId(FqueryCategory.FieldByName('id').Value);
    SetParentId(FqueryCategory.FieldByName('pid').Value);
    SetName(FqueryCategory.FieldByName('name').Value);
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

procedure TCategory.SetqueryCategory(const Value: TUniQuery);
begin
  FqueryCategory := Value;
end;

end.
