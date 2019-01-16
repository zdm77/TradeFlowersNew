unit UfrmOnlyName;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UNI, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls,
  cxTextEdit, cxDBEdit, Data.DB, MemDS, DBAccess;

type
  TfrmOnlyName = class(TForm)
    btnSave: TButton;
    dsProp: TUniDataSource;
    queryProp: TUniQuery;
    lbl1: TLabel;
    edtName: TcxTextEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure edtNamePropertiesChange(Sender: TObject);
  private
    FId: Integer;
    FName: string;
    FreturnId: Integer;
    QueryUpd: TUniQuery;
    tableName: string;
    isUniq: boolean;
    isNew: boolean;
    sendQuery: TUniQuery;
    procedure EnableSave;
    procedure getEntity;
    procedure Insert;
    function notUniq: boolean;
    procedure SetId(const Value: Integer);
    procedure SetName(const Value: string);
    procedure SetreturnId(const Value: Integer);
    procedure Update;
    property Id: Integer read FId write SetId;
    property Name: string read FName write SetName;
    { Private declarations }
  public
    /// <summary>TfrmOnlyName.init
    /// </summary>
    /// <param name="tableName"> (string) »м€ таблицы дл€ обновлени€/редактировани€
    /// </param>
    /// <param name="isUniq"> (boolean) признак уникальности наименовани€ </param>
    /// <param name="isNew"> (boolean) добавить или обновить</param>
    /// <param name="query"> (TUniQuery) дл€ Refresh </param>
    /// <param name="Id">Ќеоб€зательный (Integer) передаваемый ID, по умолчанию 0 в
    /// случае вставки</param>
    /// <param name="Name"> Ќеоб€зательный  (string)передаваемое Ќаименвоание, по
    /// умолчанию пустота в случае вставки </param>
    procedure init(tableName: string; isUniq, isNew: boolean; query: TUniQuery; Id: Integer = 0;
      Name: string = '');
    property returnId: Integer read FreturnId write SetreturnId;
    { Public declarations }
  end;

var
  frmOnlyName: TfrmOnlyName;

implementation

{$R *.dfm}

uses UDmMain, UFuncAndProc;

procedure TfrmOnlyName.btnSaveClick(Sender: TObject);
begin
  // если уникальность то провер€ем
  if isUniq = true then
    if notUniq = true then
    begin
      Application.MessageBox('«апись с таким наименованием уже существует', 'ќшибка',
        MB_OK + MB_ICONERROR);
      Exit;
    end;
  Name := edtName.Text;
  if isNew = true then
  begin
    Id := UFuncAndProc.getNewId(tableName);
    Insert;
  end
  else
    Update;
  sendQuery.Refresh;
  sendQuery.Locate('id', IntToStr(Id), []);
  close;
end;

procedure TfrmOnlyName.edtNamePropertiesChange(Sender: TObject);
begin
  EnableSave;
end;

procedure TfrmOnlyName.EnableSave;
begin
  if edtName.Text <> '' then
    btnSave.Enabled := true
  else
    btnSave.Enabled := false;
end;

procedure TfrmOnlyName.getEntity;
var
  SQL: TStringBuilder;
begin
  // SQL := TStringBuilder.Create;
  // SQL.Append('SELECT * FROM ');
  // SQL.Append(tableName);
  // SQL.Append(' WHERE ID=');
  // SQL.Append(IntToStr(Id));
  // QueryUpd.Close;
  // QueryUpd.SQL.Text:=sql.ToString;
  // QueryUpd.Open;
  // edtName.Text:=
end;

procedure TfrmOnlyName.init(tableName: string; isUniq, isNew: boolean; query: TUniQuery;
  Id: Integer = 0; Name: string = '');
begin
  Self.tableName := tableName;
  Self.isUniq := isUniq;
  Self.isNew := isNew;
  Self.Id := Id;
  Self.Name := Name;
  Self.sendQuery := query;
  edtName.Text := Name;
  QueryUpd := TUniQuery.Create(nil);
  QueryUpd.Connection := DMMain.conMain;
  EnableSave;
end;

procedure TfrmOnlyName.Insert;
var
  SQL: TStringBuilder;
begin
  SQL := TStringBuilder.Create;
  SQL.Append(' INSERT INTO  ');
  SQL.Append(tableName);
  SQL.Append(' (name, id) ');
  SQL.Append(' VALUES ');
  SQL.Append(' (:name, :id) ');
  QueryUpd.close;
  QueryUpd.SQL.Text := SQL.ToString;
  QueryUpd.ParamByName('id').Value := Id;
  QueryUpd.ParamByName('name').Value := Name;
  QueryUpd.ExecSQL;
end;

function TfrmOnlyName.notUniq: boolean;
var
  SQL: TStringBuilder;
begin
  SQL := TStringBuilder.Create;
  SQL.Append('SELECT id FROM ');
  SQL.Append(tableName);
  SQL.Append(' WHERE UPPER(name)=:name and id<>:id');
  QueryUpd.close;
  QueryUpd.SQL.Text := SQL.ToString;
  QueryUpd.ParamByName('id').AsInteger := Id;
  QueryUpd.ParamByName('name').AsString := AnsiUpperCase(edtName.Text);
  QueryUpd.Open;
  if QueryUpd.RecordCount > 0 then
    Result := true
  else
    Result := false;
  // TODO -cMM: TfrmOnlyName.notUniq default body inserted
end;

procedure TfrmOnlyName.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TfrmOnlyName.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TfrmOnlyName.SetreturnId(const Value: Integer);
begin
  FreturnId := Value;
end;

procedure TfrmOnlyName.Update;
var
  SQL: TStringBuilder;
begin
  SQL := TStringBuilder.Create;
  SQL.Append(' UPDATE ');
  SQL.Append(tableName);
  SQL.Append(' set name=:name where id=:id');
  QueryUpd.close;
  QueryUpd.SQL.Text := SQL.ToString;
  QueryUpd.ParamByName('id').Value := Id;
  QueryUpd.ParamByName('name').Value := Name;
  QueryUpd.ExecSQL;
end;

end.
