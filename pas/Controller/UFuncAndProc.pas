unit UFuncAndProc;

interface

uses
  Uni, Vcl.Forms, Winapi.Windows, Vcl.Controls, System.SysUtils, Data.DB;
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
function Validate(AQuery: TUniQuery; AId: TIntegerField; ATableName: string): Boolean;
function GenBarcode: String;

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

function Validate(AQuery: TUniQuery; AId: TIntegerField; ATableName: string): Boolean;
var
  i: Integer;
begin
  Result := false;
  with AQuery do
  begin
    for i := 0 to FieldDefs.Count - 1 do
      if fields[i].Required = true then
        if fields[i].AsString = '' then
        begin
          Application.MessageBox(PChar('Заполните обязательное поле: ' + fields[i].DisplayLabel), 'Ошибка',
            MB_OK + MB_ICONERROR);
          Exit;
        end;
    try
      if AId.Value = 0 then
        AId.Value := getNewId(ATableName);
      Post;
    except
      on E: Exception do
      begin
        if Pos('null value', E.Message) <> 0 then
          Application.MessageBox('Заполните обязательные поля.', 'Ошибка', MB_OK + MB_ICONERROR);
        if Pos('duplicate', E.Message) <> 0 then
          Application.MessageBox('Не уникальное значение.', 'Ошибка', MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
  end;
  Result := true;
end;

function GenBarcode: String;
  function SumEven(S: String): Integer;
  const
    a: array [0 .. 5] of Integer = (2, 4, 6, 8, 10, 12);
  var
    i: Integer;
  begin
    Result := 0;
    for i := Low(a) to High(a) do
      Result := Result + StrToInt(S[a[i]]);
  end;
  function SumOdd(S: String): Integer;
  const
    a: array [0 .. 5] of Integer = (1, 3, 5, 7, 9, 11);
  var
    i: Integer;
  begin
    Result := 0;
    for i := Low(a) to High(a) do
      Result := Result + StrToInt(S[a[i]]);
  end;

var
  query: TUniQuery;
  lb: string;
begin
  query := TUniQuery.Create(nil);
  query.Connection := DMMain.conMain;
  // смотрим последний штрих-код
  with query do
  begin
    Close;
    SQL.Text := concat('SELECT CAST(last_barcode AS NUMERIC(12,0))+1 FROM DICTONARY.SETTINGS ');
    Open;
    lb := fields[0].AsString;
    Close;
    SQL.Text := 'UPDATE dictonary.settings SET  last_barcode = :last_barcode';
    ParamByName('last_barcode').AsString := lb;
    ExecSQL;
    Result := concat(lb, (IntToStr((10 - (SumOdd(lb) + SumEven(lb) * 3) mod 10) mod 10))[1]);
  end;
end;

end.
