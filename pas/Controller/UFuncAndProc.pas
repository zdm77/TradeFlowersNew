unit UFuncAndProc;

interface

uses
  Uni;

procedure selectSQL(query: TUniQuery);

procedure standartSave(query: TUniQuery; isNew: Boolean);

implementation

procedure selectSQL(query: TUniQuery);
begin
  // TODO -cMM: selectSQL default body inserted
end;

procedure standartSave(query: TUniQuery; isNew: Boolean);
begin
  query.Post;
  query.Refresh;
 // query.Locate('id',queryMain.FieldByName('id').AsInteger,[]) ;
end;

end.

