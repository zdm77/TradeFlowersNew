unit UfrmTemplateModal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Data.DB, MemDS, DBAccess, Uni, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, UFrameSave, CodeSiteLogging,
  cxDBEdit;

type
  TfrmTemplateModal = class(TForm)
    lblName: TLabel;
    query1: TUniQuery;
    fieldContragentid: TIntegerField;
    fieldContragentName: TStringField;
    fieldContragentTypeId: TIntegerField;
    fieldContragentTypeName: TStringField;
    queryL: TUniQuery;
    ds1: TDataSource;
    lblL: TLabel;
    frameSave1: TframeSave;
    edtPost: TcxDBLookupComboBox;
    edtName: TcxDBTextEdit;
    procedure FormShow(Sender: TObject);
    procedure frameSave1Button1Click(Sender: TObject);
  private
    FId: Integer;
  public
    constructor Create(AOwner: TComponent; AId: Integer);
    property Id: Integer read FId write FId;
  end;

var
  frmTemplateModal: TfrmTemplateModal;

implementation

{$R *.dfm}

uses UDmMain, UFuncAndProc;

constructor TfrmTemplateModal.Create(AOwner: TComponent; AId: Integer);
begin
  Inherited Create(AOwner);
  Id := AId;
end;

procedure TfrmTemplateModal.FormShow(Sender: TObject);
begin
  query1.ParamByName('id').Value := Id;
  query1.Open;
  queryL.Open;
  if Id = 0 then
    query1.Insert
  else
    query1.Edit;
end;

procedure TfrmTemplateModal.frameSave1Button1Click(Sender: TObject);
begin
  if UFuncAndProc.Validate(query1, fieldContragentid, 'dictonary.') = true then
  begin
    Id := fieldContragentid.Value;
    ModalResult := mrYes;
    CloseModal;
  end;
end;

end.
