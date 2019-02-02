unit UfrmPostEdt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Data.DB, MemDS, DBAccess, Uni, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, UFrameSave;

type
  TfrmPostEdt = class(TForm)
    lblName: TLabel;
    edtName: TDBEdit;
    queryPost: TUniQuery;
    fieldPostId: TIntegerField;
    fieldPostName: TStringField;
    dsPostEdt: TDataSource;
    frameSave1: TframeSave;
    procedure FormShow(Sender: TObject);
    procedure frameSave1Button1Click(Sender: TObject);
  private
    FId: Integer;
  public
    constructor Create(AOwner: TComponent; AId: Integer);
    property Id: Integer read FId write FId;
  end;

var
  frmPostEdt: TfrmPostEdt;

implementation

{$R *.dfm}

uses UDmMain, UFuncAndProc;

constructor TfrmPostEdt.Create(AOwner: TComponent; AId: Integer);
begin
  Inherited Create(AOwner);
  Id := AId;
end;

procedure TfrmPostEdt.FormShow(Sender: TObject);
begin
  queryPost.ParamByName('id').Value := Id;
  queryPost.Open;
  if Id = 0 then
    queryPost.Insert
  else
    queryPost.Edit;
end;

procedure TfrmPostEdt.frameSave1Button1Click(Sender: TObject);
begin
  if UFuncAndProc.Validate(queryPost, fieldPostId, 'dictonary.post') = true then
  begin
    Id := fieldPostId.Value;
    ModalResult := mrYes;
    CloseModal;
  end;
end;

end.
