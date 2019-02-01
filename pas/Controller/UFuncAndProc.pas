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
procedure deleteById(Id: Integer; tableName: string);
function getIdByName(ATableName, AName: string): Integer;

implementation

uses UDmMain;

procedure selectSQL(query: TUniQuery);
begin
  end;

procedure standartSave(query: TUniQuery; isNew: Boolean);
begin
  query.Post;
  query.Refresh;
  // query.Locate('id',queryMain.FieldByName('id').AsInteger,[]) ;
end;

procedure standartDelete(query: TUniQuery);
begin
  if Application.MessageBox('Вы действительно хотите удалить запись?', 'Вопрос', MB_YESNO + MB_ICONWARNING) = mrYes then
    query.Delete;
end;

function standartValidateOnUnic(fieldName: string): Boolean;
begin
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
begin
  query := TUniQuery.Create(nil);
  query.Connection := DMMain.conMain;
  query.SQL.Text := 'select nextval (' + QuotedStr(tableName + '_id_seq') + ')';
  query.Open;
  Result := query.fields[0].AsInteger;
end;

procedure deleteById(Id: Integer; tableName: string);
var
  query: TUniQuery;
begin
  query := TUniQuery.Create(nil);
  query.Connection := DMMain.conMain;
  if Application.MessageBox('Вы действительно хотите удалить запись?', 'Вопрос', MB_YESNO + MB_ICONWARNING) = mrYes then
  begin
    query.SQL.Text := 'delete from  ' + tableName + ' where id=' + IntToStr(Id);
    query.ExecSQL;
  end;
end;

function getIdByName(ATableName, AName: string): Integer;
var
  query: TUniQuery;
begin
  query := TUniQuery.Create(nil);
  query.Connection := DMMain.conMain;
  query.SQL.Text := 'select id from ' + ATableName + ' where name=' + QuotedStr(AName);
  query.Open;
  if query.IsEmpty = true then
    Result := 0
  else
    Result := query.fields[0].AsInteger;
end;

end.
