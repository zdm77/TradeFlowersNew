unit UCategory;

interface
uses
    Classes;
type
  TCategory = class(TObject)
  private
    FId: Integer;
    FlistProp: TList;
    FName: string;
    procedure SetId(const Value: Integer);
    procedure SetlistProp(const Value: TList);
    procedure SetName(const Value: string);
  public
    property Id: Integer read FId write SetId;
    property listProp: TList read FlistProp write SetlistProp;
    property Name: string read FName write SetName;
  end;

implementation

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

