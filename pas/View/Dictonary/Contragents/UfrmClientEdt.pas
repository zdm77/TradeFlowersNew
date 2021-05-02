unit UfrmClientEdt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls, cxGroupBox,
  cxTextEdit, cxDBEdit, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmClientEdt = class(TForm)
    edtname: TcxDBTextEdit;
    lbl1: TLabel;
    cxGroupBox3: TcxGroupBox;
    btnSave: TButton;
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    isSave: boolean;
    { Public declarations }
  end;

var
  frmClientEdt: TfrmClientEdt;

implementation

{$R *.dfm}

uses UfrmClient;

procedure TfrmClientEdt.btnSaveClick(Sender: TObject);
begin
  isSave := true;
  Close;
end;

end.
