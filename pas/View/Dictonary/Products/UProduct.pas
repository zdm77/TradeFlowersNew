unit UProduct;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfrmProduct = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

end.
