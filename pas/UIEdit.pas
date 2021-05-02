unit UIEdit;

interface

uses
  UICrud;

type
  IEdit = interface(IInterface)
  ['{95737346-47BE-42D6-9EB5-E975910B2746}']
    function GetEntityCrud: ICrud;
    procedure SetEntityCrud(const Value: ICrud);
    property EntityCrud: ICrud read GetEntityCrud write SetEntityCrud;

  end;

implementation

end.
