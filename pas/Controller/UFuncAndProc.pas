unit UFuncAndProc;

interface

uses
  Uni, Vcl.Forms, Winapi.Windows, Vcl.Controls;
procedure selectSQL(query: TUniQuery);
procedure standartSave(query: TUniQuery; isNew: Boolean);
procedure standartDelete(query: TUniQuery);

/// <summary>procedure standartValidateOnUnic
///  �������� �� ������������
/// </summary>
/// <returns> Boolean
/// </returns>
/// <param name="fieldName"> (string) </param>
function standartValidateOnUnic(fieldName: string): Boolean;

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

procedure standartDelete(query: TUniQuery);
begin
  if Application.MessageBox('', '', MB_YESNO) = mrYes then
  begin
    query.Delete;
  end;
end;

function standartValidateOnUnic(fieldName: string): Boolean;
begin
  // TODO -cMM: standartValidateOnUnic default body inserted
  Result := true;
end;

end.
