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
    procedure frameProduct1viewProductDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    isSelect: Boolean;
    { Public declarations }
  end;

var
  frmProduct: TfrmProduct;

implementation

{$R *.dfm}

procedure TfrmProduct.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then
  begin
    Action := caFree;
    frmProduct := nil;
  end;
end;

procedure TfrmProduct.FormShow(Sender: TObject);
begin
  frameProduct1.Init;
end;

procedure TfrmProduct.frameProduct1viewProductDblClick(Sender: TObject);
begin
  if FormStyle = fsNormal then
  begin
    isSelect := true;
    Close;
  end;
end;

end.
