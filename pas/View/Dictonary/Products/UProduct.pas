unit UProduct;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrameProduct;

type
  TfrmProduct = class(TForm)
    frameProduct1: TframeProduct;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure frameTopPanel2btnImportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProduct: TfrmProduct;

implementation

{$R *.dfm}

procedure TfrmProduct.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
 frmProduct:=nil;
end;

procedure TfrmProduct.FormShow(Sender: TObject);
begin
  frameProduct1.Init;
end;

procedure TfrmProduct.frameTopPanel2btnImportClick(Sender: TObject);
begin
  frameProduct1.frameTopPanel2btnImportClick(Sender);

end;

end.
