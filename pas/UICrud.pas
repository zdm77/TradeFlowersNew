unit UICrud;

interface

type
  ICrud = interface(IInterface)
    ['{D2AD54AD-05A8-432B-A0BD-0096056B4204}']
    procedure ShowEntity(id: Integer);
    procedure InsUpd(isNew: Boolean = true);
    procedure Delete(id: Integer);
    procedure Refresh();
  end;

implementation

end.
