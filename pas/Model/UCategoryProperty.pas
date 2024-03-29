unit UCategoryProperty;

interface
uses
  UCategory, Uni, System.SysUtils;
 type
  TCategoryProperty = class(TCategory)
  private
    FInName: Boolean;
    FOrederBy: Integer;
    FPropertyId: Integer;
    procedure SetInName(const Value: Boolean);
    procedure SetOrederBy(const Value: Integer);
    procedure SetPropertyId(const Value: Integer);
  public
    procedure DeleteProperty;
    procedure SetCategoryId(const Value: Integer);
    property InName: Boolean read FInName write SetInName;
    property OrederBy: Integer read FOrederBy write SetOrederBy;
    property PropertyId: Integer read FPropertyId write SetPropertyId;
  end;
implementation

uses UFuncAndProc, UDmMain;

procedure TCategoryProperty.DeleteProperty;
begin
   UFuncAndProc.deleteById(Id, DICT_TABLE_CATEGORY_PROPERTY);
  // TODO -cMM: TCategoryProperty.DeleteProperty default body inserted
end;

procedure TCategoryProperty.SetCategoryId(const Value: Integer);
begin
  Id:=  Value;
end;

procedure TCategoryProperty.SetInName(const Value: Boolean);
begin
  FInName := Value;
end;

procedure TCategoryProperty.SetOrederBy(const Value: Integer);
begin
  FOrederBy := Value;
end;

procedure TCategoryProperty.SetPropertyId(const Value: Integer);
begin
  FPropertyId := Value;
end;

end.
