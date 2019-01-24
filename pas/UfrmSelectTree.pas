unit UfrmSelectTree;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxCustomData,
  cxStyles, cxTL, cxMaskEdit, cxTLdxBarBuiltInMenu, Data.DB, MemDS, DBAccess,
  Uni, cxInplaceContainer, cxDBTL, cxTLData, Vcl.StdCtrls, cxGroupBox,
  UCategory, cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmSelectTree = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    btnSelect: TButton;
    lstCategory: TcxDBTreeList;
    columnNameC: TcxDBTreeListColumn;
    dsCategory: TUniDataSource;
    queryCategoty: TUniQuery;
    procedure btnSelectClick(Sender: TObject);
  private
    CategorySelect: TCategory;
    SenderCategory: TCategory;
    { Private declarations }
  public
    idSelect: integer;
    nameSelect: string;
    procedure init(category: TCategory);
    procedure ShowCategory;
    { Public declarations }
  end;

var
  frmSelectTree: TfrmSelectTree;

implementation

{$R *.dfm}

uses UMain;

procedure TfrmSelectTree.btnSelectClick(Sender: TObject);
begin
  CategorySelect.SetCategory;
  idSelect:=  CategorySelect.Id;
  nameSelect:= queryCategoty.FieldByName('name').AsString;

  ModalResult := mrOk;
end;

procedure TfrmSelectTree.init(category: TCategory);
begin
  SenderCategory := category;
  CategorySelect := TCategory.Create(queryCategoty);
  CategorySelect.GetCategories;
  // CategorySelect :=category;
end;

procedure TfrmSelectTree.ShowCategory;
begin
  // with qu
end;

end.
