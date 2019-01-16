unit UFuncAndProc;

interface

uses
  Uni, Vcl.Forms, Winapi.Windows, Vcl.Controls, System.SysUtils;
procedure selectSQL(query: TUniQuery);
procedure standartSave(query: TUniQuery; isNew: Boolean);
procedure standartDelete(query: TUniQuery);
/// <summary>procedure standartValidateOnUnic
/// Проверка на уникальность
/// </summary>
/// <returns> Boolean
/// </returns>
/// <param name="fieldName"> (string) </param>
function standartValidateOnUnic(fieldName: string): Boolean;
procedure QueryCreate(query: TUniQuery);
function getNewId(tableName: string): Integer;

implementation

uses UDmMain;

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

procedure QueryCreate(query: TUniQuery);
begin
  query := TUniQuery.Create(nil);
  query.Connection := DMMain.conMain;
end;

function getNewId(tableName: string): Integer;
var
  query: TUniQuery;
  seq_name: TStringBuilder;
  pos_dom: Integer;
begin
//  pos_dom := Pos('.', tableName);
//  if pos_dom > 0 then
//    tableName := Copy(tableName, pos_dom+1, Length(tableName));
//  seq_name:= TStringBuilder.Create;
//  seq_name.Append(tableName);
//  seq_name.Append('_id_seq');
  query := TUniQuery.Create(nil);
  query.Connection := DMMain.conMain;
  query.SQL.Text := 'select nextval (' + QuotedStr(tableName+'_id_seq') + ')';

  query.Open;
  Result := query.fields[0].AsInteger;
end;

end.
