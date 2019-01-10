unit UProps;

interface

uses
  Classes, Uni, System.SysUtils;
type
  TProps = class(TObject)
  private
    FName: string;
    procedure SetName(const Value: string);
  public
    property Name: string read FName write SetName;
  end;
implementation

procedure TProps.SetName(const Value: string);
begin
  FName := Value;
end;

end.
