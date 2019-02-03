unit UfrmUserEdt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Data.DB, MemDS, DBAccess, Uni, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, UFrameSave, CodeSiteLogging,
  cxDBEdit, dxmdaset, MemTableDataEh, MemTableEh, Vcl.Grids, Vcl.DBGrids;

type
  TfrmUserEdt = class(TForm)
    lblName: TLabel;
    queryUser: TUniQuery;
    dsUser: TDataSource;
    lblL: TLabel;
    frameSave1: TframeSave;
    fieldUserid: TIntegerField;
    queryUsername: TStringField;
    queryUserlogin: TStringField;
    queryUserpost_id: TIntegerField;
    fieldUserpost_name: TStringField;
    edtPost: TcxDBLookupComboBox;
    Label1: TLabel;
    edtName: TcxDBTextEdit;
    edtLogin: TcxDBTextEdit;
    memPost: TMemTableEh;
    procedure FormShow(Sender: TObject);
    procedure frameSave1Button1Click(Sender: TObject);
  private
    FId: Integer;
  public
    constructor Create(AOwner: TComponent; AId: Integer);
    property Id: Integer read FId write FId;
  end;

var
  frmUserEdt: TfrmUserEdt;

implementation

{$R *.dfm}

uses UDmMain, UFuncAndProc;

constructor TfrmUserEdt.Create(AOwner: TComponent; AId: Integer);
begin
  Inherited Create(AOwner);
  Id := AId;
end;

procedure TfrmUserEdt.FormShow(Sender: TObject);
begin
  memPost.LoadFromDataSet(DMMain.memPost, -1, lmCopy, true);
  memPost.Active := true;
  queryUser.ParamByName('id').Value := Id;
  queryUser.Open;
  // queryPost.Open;
  if Id = 0 then
    queryUser.Insert
  else
    queryUser.Edit;
end;

procedure TfrmUserEdt.frameSave1Button1Click(Sender: TObject);
begin
  if UFuncAndProc.Validate(queryUser, fieldUserid, 'dictonary.users') = true then
  begin
    Id := fieldUserid.Value;
    ModalResult := mrYes;
    CloseModal;
  end;
end;

end.
