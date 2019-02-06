unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, MemDS,
  DBAccess,
  Uni, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls,
  PostgreSQLUniProvider, cxGridBandedTableView, System.Generics.Collections,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, cxPC, dxBarBuiltInMenu, dxTabbedMDI,
  Vcl.Menus, Vcl.ImgList, cxLocalization, MemTableDataEh, MemTableEh,
  cxImageList, System.ImageList;

type
  TProduct = class
  private
    FId: Integer;
    FName: string;
    FPid: Integer;
  public
    property Id: Integer read FId;
    property Name: string read FName write FName;
    property Pid: Integer read FPid;
  end;

  TfrmMain = class(TForm)
    mm1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    tabMain: TdxTabbedMDIManager;
    N3: TMenuItem;
    imgMidle: TcxImageList;
    imgSmall: TcxImageList;
    imgLarge: TcxImageList;
    cxLocalizer1: TcxLocalizer;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    { Private declarations }
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  UCategory, UProductEdit, UCategoryEdit, UProduct, UfrmProps, UfrmContragent, UfrmUser, UfrmPost, UDmMain, UfrmSplash;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  cxLocalizer1.LoadFromFile(ExtractFileDir(Application.ExeName) + '\..\INI\LanguagesUnicode.ini');
  cxLocalizer1.Active := true;
  cxLocalizer1.Locale := 1049;
  frmMain.Enabled := False;
  DMMain.LoadDictonary;
  frmMain.Enabled := true;
  frmMain.BringToFront;
  // with queryMain do
  // begin
  // Close;
  // SQL.Text := 'select * from category';
  // Open;
  // end;
  // with queryProduct do
  // begin
  // Close;
  // SQL.Text := 'select * from prod_poduct';
  // Open;
  // end;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  if frmProduct = nil then
    Application.CreateForm(TfrmProduct, frmProduct);
  frmProduct.Show;
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
  if frmProps = nil then
    Application.CreateForm(TfrmProps, frmProps);
  frmProps.Show;
end;

procedure TfrmMain.N4Click(Sender: TObject);
begin
  if frmContragent = nil then
    Application.CreateForm(TfrmContragent, frmContragent);
  frmContragent.FormStyle := fsMDIChild;
  frmContragent.Show;
end;

procedure TfrmMain.N6Click(Sender: TObject);
begin
  if frmUser = nil then
    Application.CreateForm(TfrmUser, frmUser);
  frmUser.Show;
end;

procedure TfrmMain.N7Click(Sender: TObject);
begin
  if frmPost = nil then
    Application.CreateForm(TfrmPost, frmPost);
  frmPost.Show;
end;

end.
