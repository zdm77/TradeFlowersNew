unit UfrmInternetStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, MemDS, DBAccess, Uni, CodeSiteLogging;

type
  TfrmInternetStore = class(TForm)
    btnSinc: TButton;
    queryCategory: TUniQuery;
    query1: TUniQuery;
    btnDelAll: TButton;
    queryProduct: TUniQuery;
    queryUpd: TUniQuery;
    procedure btnDelAllClick(Sender: TObject);
    procedure btnSincClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CountParent: Integer;
    procedure DeleteAll;
    procedure DetectDeleteCategory;
    procedure DetectDeleteProduct;
    procedure GetCountParent(AParentId: Integer);
    procedure InsertCategory;
    /// <summary>Вставка категории
    ///
    /// </summary>
    procedure InsertCategoryDescription;
    procedure InsertCategoryPath;
    procedure InsertCategoryToStory;
    procedure InsertLinks(AParentId, AId: Integer);
    procedure InsertProduct;
    procedure InsertProductDescription;
    procedure InsertProductLinks;
    procedure SincCategory;
    procedure UpdateCategory(AParentId: Integer);
    procedure UpdateProduct;
  public
    { Public declarations }
  end;

var
  frmInternetStore: TfrmInternetStore;

implementation

uses
  UDmMain, UDMSite;
{$R *.dfm}

procedure TfrmInternetStore.btnDelAllClick(Sender: TObject);
begin
  dmSite.conSite.Connected := True;
  DeleteAll;
end;

procedure TfrmInternetStore.btnSincClick(Sender: TObject);
begin
  dmSite.conSite.Connected := True;
  // DeleteAll;
  SincCategory;
  dmSite.conSite.Connected := False;
end;

procedure TfrmInternetStore.DeleteAll;
var
  query: TUniQuery;
begin
  query := TUniQuery.Create(nil);
  query.Connection := dmSite.conSite;
  with query do
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
    Close;
    SQL.Text := 'delete from `product`';
    ExecSQL;
    Close;
    SQL.Text := 'delete from `product_description`';
    ExecSQL;
    Close;
    SQL.Text := 'delete from `product_to_category`';
    ExecSQL;
    Close;
    SQL.Text := 'delete from `product_to_store`';
    ExecSQL;
    Close;
    SQL.Text := 'delete from `product_to_layout`';
    ExecSQL;
    Close;
    SQL.Text := 'ALTER TABLE product AUTO_INCREMENT=0';
    ExecSQL;
  end;
end;

procedure TfrmInternetStore.DetectDeleteCategory;
var
  querySite, queryPG: TUniQuery;
  Id: Integer;
begin
  querySite := TUniQuery.Create(nil);
  queryPG := TUniQuery.Create(nil);
  queryPG.Connection := DMMain.conMain;
  querySite.Connection := dmSite.conSite;
  queryPG.Close;
  queryPG.SQL.Text := 'select id from dictonary.category where id=:id';
  with querySite do
  begin
    Close;
    SQL.Text := 'select category_id from category';
    Open;
    while not eof do
    begin
      queryPG.Close;
      queryPG.ParamByName('id').AsInteger := querySite.FieldByName('category_id').AsInteger;
      queryPG.Open;
      if queryPG.RecordCount = 0 then
      begin
        Id := FieldByName('category_id').AsInteger;
        Close;
        SQL.Text := 'delete from category where category_id=' + IntToStr(Id);
        ExecSQL;
        Close;
        SQL.Text := 'delete from category_description where category_id=' + IntToStr(Id);
        ExecSQL;
        Close;
        SQL.Text := 'delete from category_path where category_id=' + IntToStr(Id);
        ExecSQL;
        Close;
        SQL.Text := 'delete from category_to_store where category_id=' + IntToStr(Id);
        ExecSQL;
      end;
      Next;
    end;
  end;
end;

procedure TfrmInternetStore.DetectDeleteProduct;
var
  querySite, queryPG: TUniQuery;
  Id: Integer;
begin
  querySite := TUniQuery.Create(nil);
  queryPG := TUniQuery.Create(nil);
  queryPG.Connection := DMMain.conMain;
  querySite.Connection := dmSite.conSite;
  queryPG.Close;
  queryPG.SQL.Text := 'select id from dictonary.product where id=:id';
  with querySite do
  begin
    Close;
    SQL.Text := 'select product_id from `product` ';
    Open;
    while not eof do
    begin
      queryPG.Close;
      queryPG.ParamByName('id').AsInteger := querySite.FieldByName('product_id').AsInteger;
      queryPG.Open;
      if IsEmpty = True then
      begin
        Id := FieldByName('product_id').AsInteger;
        Close;
        SQL.Text := 'delete from product where product_id=' + IntToStr(Id);
        ExecSQL;
        Close;
        SQL.Text := 'delete from product_description where product_id=' + IntToStr(Id);
        ExecSQL;
        Close;
        SQL.Text := 'delete from product_to_category where product_id=' + IntToStr(Id);
        ExecSQL;
        Close;
        SQL.Text := 'delete from product_to_store where product_id=' + IntToStr(Id);
        ExecSQL;
        Close;
        SQL.Text := 'delete from product_to_layout where product_id=' + IntToStr(Id);
        ExecSQL;
      end;
      Next;
    end;
  end;
end;

procedure TfrmInternetStore.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmInternetStore := nil;
end;

procedure TfrmInternetStore.GetCountParent(AParentId: Integer);
begin
  with query1 do
  begin
    Close;
    SQL.Text := 'select * from dictonary.category where id=' + AParentId.ToString;
    Open;
    if IsEmpty = False then
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
    if IsEmpty = False then
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

procedure TfrmInternetStore.InsertProduct;
var
  querySite: TUniQuery;
begin
  querySite := TUniQuery.Create(nil);
  querySite.Connection := dmSite.conSite;
  with querySite do
  begin
    Close;
    SQL.Text := '';
    SQL.Add(' INSERT INTO');
    SQL.Add(' `product`');
    SQL.Add(' (');
    SQL.Add(' `product_id`,');
    SQL.Add(' `model`,');
    SQL.Add(' `sku`,');
    SQL.Add(' `upc`,');
    SQL.Add(' `ean`,');
    SQL.Add(' `jan`,');
    SQL.Add(' `isbn`,');
    SQL.Add(' `mpn`,');
    SQL.Add(' `location`,');
    SQL.Add(' `quantity`,');
    SQL.Add(' `stock_status_id`,');
    SQL.Add(' `image`,');
    SQL.Add(' `manufacturer_id`,');
    SQL.Add(' `shipping`,');
    SQL.Add(' `price`,');
    SQL.Add(' `points`,');
    SQL.Add(' `tax_class_id`,');
    SQL.Add(' `date_available`,');
    SQL.Add(' `weight`,');
    SQL.Add(' `weight_class_id`,');
    SQL.Add(' `length`,');
    SQL.Add(' `width`,');
    SQL.Add(' `height`,');
    SQL.Add(' `length_class_id`,');
    SQL.Add(' `subtract`,');
    SQL.Add(' `minimum`,');
    SQL.Add(' `sort_order`,');
    SQL.Add(' `status`,');
    SQL.Add(' `viewed`,');
    SQL.Add(' `date_added`,');
    SQL.Add(' `date_modified`)');
    SQL.Add(' VALUE (');
    SQL.Add(' :product_id,');
    SQL.Add(' :model,');
    SQL.Add(' :sku,');
    SQL.Add(' :upc,');
    SQL.Add(' :ean,');
    SQL.Add(' :jan,');
    SQL.Add(' :isbn,');
    SQL.Add(' :mpn,');
    SQL.Add(' :location,');
    SQL.Add(' :quantity,');
    SQL.Add(' :stock_status_id,');
    SQL.Add(' :image,');
    SQL.Add(' :manufacturer_id,');
    SQL.Add(' :shipping,');
    SQL.Add(' :price,');
    SQL.Add(' :points,');
    SQL.Add(' :tax_class_id,');
    SQL.Add(' :date_available,');
    SQL.Add(' :weight,');
    SQL.Add(' :weight_class_id,');
    SQL.Add(' :length,');
    SQL.Add(' :width,');
    SQL.Add(' :height,');
    SQL.Add(' :length_class_id,');
    SQL.Add(' :subtract,');
    SQL.Add(' :minimum,');
    SQL.Add(' :sort_order,');
    SQL.Add(' :status,');
    SQL.Add(' :viewed,');
    SQL.Add(' :date_added,');
    SQL.Add(' :date_modified);');
    ParamByName('product_id').Value := queryProduct.FieldByName('id').AsInteger;
    ParamByName('model').Value := queryProduct.FieldByName('id').AsString;
    ParamByName('sku').Value := queryProduct.FieldByName('id').AsString;
    ParamByName('upc').Value := '';
    ParamByName('ean').Value := queryProduct.FieldByName('barcode').AsString;
    ParamByName('jan').Value := '';
    ParamByName('isbn').Value := '';
    ParamByName('mpn').Value := '';
    ParamByName('location').Value := '';
    ParamByName('quantity').Value := 1;
    ParamByName('stock_status_id').Value := 7;
    ParamByName('manufacturer_id').Value := 0;
    ParamByName('shipping').Value := 1;
    ParamByName('price').Value := 0;
    ParamByName('points').Value := 0;
    ParamByName('tax_class_id').Value := 0;
    ParamByName('date_available').AsDate := now;
    ParamByName('weight').Value := 0;
    ParamByName('weight_class_id').Value := 0;
    ParamByName('length').Value := 0;
    ParamByName('width').Value := 0;
    ParamByName('height').Value := 0;
    ParamByName('length_class_id').Value := 1;
    ParamByName('subtract').Value := 1;
    ParamByName('minimum').Value := 1;
    ParamByName('sort_order').Value := 0;
    ParamByName('status').Value := 1;
    ParamByName('viewed').Value := 1;
    ParamByName('date_added').AsDateTime := now;
    ParamByName('date_modified').AsDateTime := now;
    ExecSQL;
  end;
end;

procedure TfrmInternetStore.InsertProductDescription;
var
  querySite: TUniQuery;
begin
  querySite := TUniQuery.Create(nil);
  querySite.Connection := dmSite.conSite;
  with querySite do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' INSERT INTO');
    SQL.Add(' `product_description`');
    SQL.Add(' (');
    SQL.Add(' `product_id`,');
    SQL.Add(' `language_id`,');
    SQL.Add(' `name`,');
    SQL.Add(' `description`,');
    SQL.Add(' `tag`,');
    SQL.Add(' `meta_title`,');
    SQL.Add(' `meta_description`,');
    SQL.Add(' `meta_keyword`)');
    SQL.Add(' VALUE (');
    SQL.Add(' :product_id,');
    SQL.Add(' :language_id,');
    SQL.Add(' :name,');
    SQL.Add(' :description,');
    SQL.Add(' :tag,');
    SQL.Add(' :meta_title,');
    SQL.Add(' :meta_description,');
    SQL.Add(' :meta_keyword);');
    ParamByName('product_id').Value := queryProduct.FieldByName('id').AsInteger;
    ParamByName('language_id').Value := 1;
    ParamByName('name').Value := queryProduct.FieldByName('name').AsString;
    ParamByName('description').Value := queryProduct.FieldByName('name').AsString;
    ParamByName('tag').Value := queryProduct.FieldByName('name').AsString;
    ParamByName('meta_title').Value := queryProduct.FieldByName('name').AsString;
    ParamByName('meta_description').Value := queryProduct.FieldByName('name').AsString;
    ParamByName('meta_keyword').Value := queryProduct.FieldByName('name').AsString;
    ExecSQL;
  end;
end;

procedure TfrmInternetStore.InsertProductLinks;
var
  querySite: TUniQuery;
begin
  querySite := TUniQuery.Create(nil);
  querySite.Connection := dmSite.conSite;
  with querySite do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' INSERT INTO');
    SQL.Add(' `product_to_category`');
    SQL.Add(' (');
    SQL.Add(' `product_id`,');
    SQL.Add(' `category_id`)');
    SQL.Add(' VALUE (');
    SQL.Add(' :product_id,');
    SQL.Add(' :category_id);');
    ParamByName('product_id').Value := queryProduct.FieldByName('id').AsInteger;
    ParamByName('category_id').Value := queryProduct.FieldByName('category_id').AsInteger;
    ExecSQL;
    Close;
    SQL.Clear;
    SQL.Add(' INSERT INTO');
    SQL.Add(' `product_to_store`');
    SQL.Add(' (');
    SQL.Add(' `product_id`,');
    SQL.Add(' `store_id`)');
    SQL.Add(' VALUE (');
    SQL.Add(' :product_id,');
    SQL.Add(' :store_id);');
    ParamByName('product_id').Value := queryProduct.FieldByName('id').AsInteger;
    ParamByName('store_id').Value := 0;
    ExecSQL;
    Close;
    SQL.Clear;
    SQL.Add(' INSERT INTO');
    SQL.Add(' `product_to_layout`');
    SQL.Add(' (');
    SQL.Add(' `product_id`,');
    SQL.Add(' `store_id`,');
    SQL.Add(' `layout_id`)');
    SQL.Add(' VALUE (');
    SQL.Add(' :product_id,');
    SQL.Add(' :store_id,');
    SQL.Add(' :layout_id);');
    ParamByName('product_id').Value := queryProduct.FieldByName('id').AsInteger;
    ParamByName('store_id').Value := 0;
    ParamByName('layout_id').Value := 0;
    ExecSQL;
  end;
end;

procedure TfrmInternetStore.SincCategory;
var
  querySite: TUniQuery;
begin
  querySite := TUniQuery.Create(nil);
  querySite.Connection := dmSite.conSite;
  // ==============================================================================
  // КАТЕГОРИИ
  // ==============================================================================
  queryCategory.Close;
  queryCategory.Open;
  querySite.SQL.Text := 'select * from `category` where category_id=:id';
  // определяем удаленные
  DetectDeleteCategory;
  while not queryCategory.eof do
  begin
    // определяем имеющиеся
    querySite.Close;
    querySite.ParamByName('id').AsInteger := queryCategory.FieldByName('id').AsInteger;
    querySite.Open;
    if querySite.IsEmpty = True then
    begin
      InsertCategory;
      InsertCategoryDescription;
      InsertCategoryPath;
      InsertCategoryToStory;
      // добавляем родителей
      InsertLinks(queryCategory.FieldByName('pid').AsInteger, queryCategory.FieldByName('id').AsInteger);
    end
    // обновляем
    else
      UpdateCategory(querySite.FieldByName('parent_id').AsInteger);
    queryCategory.Next;
  end;
  // ==============================================================================
  // ТОВАРЫ
  // ==============================================================================
  queryProduct.Close;
  queryProduct.Open;
  querySite.Close;
  querySite.SQL.Text := 'select * from `product` where product_id=:id';
  // определяем удаленные
  DetectDeleteProduct;
  while not queryProduct.eof do
  begin
    querySite.Close;
    // определяем имеющиеся
    querySite.ParamByName('id').AsInteger := queryProduct.FieldByName('id').AsInteger;
    querySite.Open;
    if querySite.IsEmpty = True then
    begin
      InsertProduct;
      InsertProductDescription;
      InsertProductLinks;
      queryProduct.Next;
    end
    else
      UpdateProduct;
    queryProduct.Next;
  end;
  Application.MessageBox('Синхронизация завершена', 'Сообщение', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmInternetStore.UpdateCategory(AParentId: Integer);
var
  query: TUniQuery;
begin
  query := TUniQuery.Create(nil);
  query.Connection := dmSite.conSite;
  // если изменился родитель
  if AParentId <> queryCategory.FieldByName('pid').AsInteger then
  begin
    // удаляем path
    query.Close;
    query.SQL.Text := 'delete from `category_path` where category_id=' + queryCategory.FieldByName('id').AsString;
    query.ExecSQL;
    InsertCategoryPath;
    // добавляем родителей
    InsertLinks(queryCategory.FieldByName('pid').AsInteger, queryCategory.FieldByName('id').AsInteger);
  end;
  query.Close;
  query.SQL.Text := 'UPDATE `category` SET `parent_id` = :parent_id WHERE  `category_id` = :category_id;';
  query.ParamByName('parent_id').AsInteger := queryCategory.FieldByName('pid').AsInteger;
  query.ParamByName('category_id').AsInteger := queryCategory.FieldByName('id').AsInteger;
  query.ExecSQL;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add(' UPDATE');
  query.SQL.Add(' `category_description`');
  query.SQL.Add(' SET');
  query.SQL.Add(' `name` = :name,');
  query.SQL.Add(' `description` = :description,');
  query.SQL.Add(' `meta_title` = :meta_title,');
  query.SQL.Add(' `meta_description` = :meta_description,');
  query.SQL.Add(' `meta_keyword` = :meta_keyword');
  query.SQL.Add(' WHERE');
  query.SQL.Add(' `category_id` = :category_id');
  query.ParamByName('category_id').AsInteger := queryCategory.FieldByName('id').AsInteger;
  query.ParamByName('name').Value := queryCategory.FieldByName('name').AsString;
  query.ParamByName('description').Value := queryCategory.FieldByName('name').AsString;;
  query.ParamByName('meta_title').Value := queryCategory.FieldByName('name').AsString;
  query.ParamByName('meta_description').Value := queryCategory.FieldByName('name').AsString;
  query.ParamByName('meta_keyword').Value := queryCategory.FieldByName('name').AsString;
  query.ExecSQL;
end;

procedure TfrmInternetStore.UpdateProduct;
var
  query: TUniQuery;
begin
  query := TUniQuery.Create(nil);
  query.Connection := dmSite.conSite;
  with query do
  begin
    Close;
    SQL.Clear;
    SQL.Clear;
    SQL.Add(' UPDATE');
    SQL.Add(' `product_description`');
    SQL.Add(' SET');
    SQL.Add(' `name` = :name,');
    SQL.Add(' `description` = :description');
    SQL.Add(' WHERE');
    SQL.Add(' `product_id` = :product_id');
    ParamByName('product_id').AsInteger := queryProduct.FieldByName('id').AsInteger;
    ParamByName('name').Value := queryProduct.FieldByName('name').AsString;
    ParamByName('description').Value := queryProduct.FieldByName('name').AsString;
    ExecSQL;
    SQL.Clear;
    SQL.Add(' UPDATE');
    SQL.Add(' `product_to_category`');
    SQL.Add(' SET');
    SQL.Add(' `category_id` = :category_id');
    SQL.Add(' WHERE');
    SQL.Add(' `product_id` = :product_id');
    ParamByName('product_id').AsInteger := queryProduct.FieldByName('id').AsInteger;
    ParamByName('category_id').Value := queryProduct.FieldByName('category_id').AsInteger;
    ExecSQL;
  end;
end;

end.
