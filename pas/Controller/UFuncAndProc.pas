unit UFuncAndProc;

interface

uses
  Uni, Vcl.Forms, Winapi.Windows, Vcl.Controls, System.SysUtils, Data.DB;
procedure selectSQL(query: TUniQuery);
procedure standartSave(query: TUniQuery; isNew: Boolean);
procedure standartDelete(query: TUniQuery);
/// <summary>procedure standartValidateOnUnic
/// �������� �� ������������
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
  if Application.MessageBox('�� ������������� ������ ������� ������?', '������', MB_YESNO + MB_ICONWARNING) = mrYes then
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
  if Application.MessageBox('�� ������������� ������ ������� ������?', '������', MB_YESNO + MB_ICONWARNING) = mrYes then
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
          Application.MessageBox(PChar('��������� ������������ ����: ' + fields[i].DisplayLabel), '������',
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
          Application.MessageBox('��������� ������������ ����.', '������', MB_OK + MB_ICONERROR);
        if Pos('duplicate', E.Message) <> 0 then
          Application.MessageBox('�� ���������� ��������.', '������', MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
  end;
  Result := true;
end;

end.
