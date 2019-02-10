unit UfrmInternetStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, MemDS, DBAccess, Uni;

type
  TfrmInternetStore = class(TForm)
    btnSinc: TButton;
    queryCategory: TUniQuery;
    query1: TUniQuery;
    procedure btnSincClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CountParent: Integer;
  public
    procedure DeleteAll;
    function GetCountParent(AParentId: Integer): Integer;
    procedure InsertCategory;
    /// <summary>Вставка категории
    ///
    /// </summary>
    procedure InsertCategoryDescription;
    procedure InsertCategoryPath;
    procedure InsertCategoryToStory;
    procedure InsertLinks(AParentId, AId: Integer);
    procedure SincCategory;
    { Public declarations }
  end;

var
  frmInternetStore: TfrmInternetStore;

implementation

uses
  UDmMain, UDMSite;
{$R *.dfm}

procedure TfrmInternetStore.btnSincClick(Sender: TObject);
var
  I: Integer;
begin
  dmSite.conSite.Connected := True;
  DeleteAll;
  SincCategory;
  dmSite.conSite.Connected := False;
end;

procedure TfrmInternetStore.DeleteAll;
begin
  with dmSite.querySIte2 do
  begin
    Close;
    SQL.Text := 'delete from category';
    ExecSQL;
    Close;
    SQL.Text := 'delete from category_description';
    ExecSQL;
    Close;
    SQL.Text := 'delete from category_path';
    ExecSQL;
    Close;
    SQL.Text := 'delete from category_to_store';
    ExecSQL;
    Close;
    SQL.Text := 'ALTER TABLE category AUTO_INCREMENT=0';
    ExecSQL;
  end;
end;

procedure TfrmInternetStore.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmInternetStore := nil;
end;

function TfrmInternetStore.GetCountParent(AParentId: Integer): Integer;
begin
  with query1 do
  begin
    Close;
    SQL.Text := 'select * from dictonary.category where id=' + AParentId.ToString;
    Open;
    if RecordCount > 0 then
    begin
      CountParent := CountParent + 1;
      GetCountParent(FieldByName('pid').AsInteger);
    end;
  end;
end;

procedure TfrmInternetStore.InsertCategory;
var
  query: TUniQuery;
begin
  query := TUniQuery.Create(nil);
  query.Connection := dmSite.conSite;
  query.Close;
  query.SQL.Text :=
    concat('insert into category (category_id, parent_id, `top`, `column`, status, date_added, date_modified)',
    ' values (:category_id, :parent_id, 1, 5, :status, :date_added, :date_modified)');
  query.ParamByName('category_id').Value := queryCategory.FieldByName('id').Value;
  query.ParamByName('parent_id').Value := queryCategory.FieldByName('pid').Value;
  query.ParamByName('status').Value := 1;
  query.ParamByName('date_added').AsDateTime := now;
  query.ParamByName('date_modified').AsDateTime := now;
  query.ExecSQL;
end;

procedure TfrmInternetStore.InsertCategoryDescription;
var
  query: TUniQuery;
begin
  query := TUniQuery.Create(nil);
  query.Connection := dmSite.conSite;
  with query do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' INSERT INTO');
    SQL.Add(' `category_description`');
    SQL.Add(' (');
    SQL.Add(' `category_id`,');
    SQL.Add(' `language_id`,');
    SQL.Add(' `name`,');
    SQL.Add(' `description`,');
    SQL.Add(' `meta_title`,');
    SQL.Add(' `meta_description`,');
    SQL.Add(' `meta_keyword`)');
    SQL.Add(' VALUE (');
    SQL.Add(' :category_id,');
    SQL.Add(' :language_id,');
    SQL.Add(' :name,');
    SQL.Add(' :description,');
    SQL.Add(' :meta_title,');
    SQL.Add(' :meta_description,');
    SQL.Add(' :meta_keyword);');
    ParamByName('category_id').Value := queryCategory.FieldByName('id').Value;
    ParamByName('language_id').Value := 1;
    ParamByName('name').Value := queryCategory.FieldByName('name').Value;
    ParamByName('description').Value := queryCategory.FieldByName('name').Value;
    ParamByName('meta_title').Value := queryCategory.FieldByName('name').Value;
    ParamByName('meta_description').Value := queryCategory.FieldByName('name').Value;
    ParamByName('meta_keyword').Value := queryCategory.FieldByName('name').Value;
    ExecSQL;
  end;
end;

procedure TfrmInternetStore.InsertCategoryPath;
var
  query: TUniQuery;
begin
  query := TUniQuery.Create(nil);
  query.Connection := dmSite.conSite;
  CountParent := 0;
  with query do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' INSERT INTO');
    SQL.Add(' `category_path`');
    SQL.Add(' (');
    SQL.Add(' `category_id`,');
    SQL.Add(' `path_id`,');
    SQL.Add(' `level`)');
    SQL.Add(' VALUE (');
    SQL.Add(' :category_id,');
    SQL.Add(' :path_id,');
    SQL.Add(' :level);');
    // вычисляем сколько родителей
    GetCountParent(queryCategory.FieldByName('pid').Value);
    // добавляем себя с максимум родителей
    ParamByName('category_id').Value := queryCategory.FieldByName('id').Value;
    ParamByName('path_id').Value := queryCategory.FieldByName('id').Value;
    ParamByName('level').Value := CountParent;
    ExecSQL;
  end;
end;

procedure TfrmInternetStore.InsertCategoryToStory;
var
  query: TUniQuery;
begin
  query := TUniQuery.Create(nil);
  query.Connection := dmSite.conSite;
  with query do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' INSERT INTO');
    SQL.Add(' `category_to_store`');
    SQL.Add(' (');
    SQL.Add(' `category_id`,');
    SQL.Add(' `store_id`)');
    SQL.Add(' VALUE (');
    SQL.Add(' :category_id,');
    SQL.Add(' :store_id);');
    ParamByName('category_id').AsInteger := queryCategory.FieldByName('id').AsInteger;
    ParamByName('store_id').AsInteger := 0;
    ExecSQL;
  end;
end;

procedure TfrmInternetStore.InsertLinks(AParentId, AId: Integer);
var
  query: TUniQuery;
begin
  query := TUniQuery.Create(nil);
  query.Connection := dmSite.conSite;
  with query do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' INSERT INTO');
    SQL.Add(' `category_path`');
    SQL.Add(' (');
    SQL.Add(' `category_id`,');
    SQL.Add(' `path_id`,');
    SQL.Add(' `level`)');
    SQL.Add(' VALUE (');
    SQL.Add(' :category_id,');
    SQL.Add(' :path_id,');
    SQL.Add(' :level);');
  end;
  with query1 do
  begin
    Close;
    SQL.Text := 'select * from dictonary.category where id=' + AParentId.ToString;
    Open;
    if RecordCount > 0 then
    begin
      CountParent := CountParent - 1;
      query.Close;
      query.ParamByName('category_id').Value := AId;
      query.ParamByName('path_id').Value := FieldByName('id').Value;
      query.ParamByName('level').Value := CountParent;
      query.ExecSQL;
      InsertLinks(FieldByName('pid').AsInteger, AId);
    end;
  end;
end;

procedure TfrmInternetStore.SincCategory;
begin
  queryCategory.Close;
  queryCategory.Open;
  while not queryCategory.Eof do
  begin
    InsertCategory;
    InsertCategoryDescription;
    InsertCategoryPath;
    InsertCategoryToStory;
    // добавляем родителей
    InsertLinks(queryCategory.FieldByName('pid').AsInteger, queryCategory.FieldByName('id').AsInteger);
    queryCategory.Next;
  end;
end;

end.
