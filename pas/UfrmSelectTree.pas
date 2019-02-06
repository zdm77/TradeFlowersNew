unit UfrmSelectTree;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxCustomData,
  cxStyles, cxTL, cxMaskEdit, cxTLdxBarBuiltInMenu, Data.DB, MemDS, DBAccess,
  Uni, cxInplaceContainer, cxDBTL, cxTLData, Vcl.StdCtrls, cxGroupBox,
  UCategory, cxDataControllerConditionalFormattingRulesManagerDialog, MemTableDataEh, MemTableEh, DataDriverEh;

type
  TfrmSelectTree = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    btnSelect: TButton;
    lstCategory: TcxDBTreeList;
    columnNameC: TcxDBTreeListColumn;
    dsCategory: TUniDataSource;
    queryCategoty: TUniQuery;
    DataDriverCategory: TDataSetDriverEh;
    memCategory: TMemTableEh;
    fieldCategoryid: TIntegerField;
    fieldCategoryname: TStringField;
    fieldCategorypid: TIntegerField;
    fieldCategorylevel: TStringField;
    fieldCategoryNext_level: TMemoField;
    fieldCategoryCount: TLargeintField;
    fieldCategoryParent_name: TStringField;
    lblProduct: TLabel;
    procedure btnSelectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    CategorySelect: TCategory;
    FidLocate: Integer;
    FselectNextLevel: string;
    SenderCategory: TCategory;
    { Private declarations }
  public
    idSelect: integer;
    nameSelect: string;
    procedure init(category: TCategory);
    procedure ShowCategory;
    property idLocate: Integer read FidLocate write FidLocate;
    property selectNextLevel: string read FselectNextLevel write FselectNextLevel;
    { Public declarations }
  end;

var
  frmSelectTree: TfrmSelectTree;

implementation

{$R *.dfm}

uses UMain;

procedure TfrmSelectTree.btnSelectClick(Sender: TObject);
begin
  //CategorySelect.SetCategory;
  idSelect:=  fieldCategoryid.Value;
  nameSelect:= fieldCategoryname.Value;
  selectNextLevel:=fieldCategoryNext_level.Text;
  //ModalResult := mrOk;
end;

procedure TfrmSelectTree.FormShow(Sender: TObject);
begin
  memCategory.Active:=False;
  memCategory.Active:=True;
  memCategory.Locate('id',idLocate,[])  ;
  lstCategory.SetFocus;
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

end;

end.
