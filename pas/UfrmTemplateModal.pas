unit UfrmTemplateModal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Data.DB, MemDS, DBAccess, Uni, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TfrmTemplateModal = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    lblName: TLabel;
    edtName: TDBEdit;
    query1: TUniQuery;
    fieldContragentid: TIntegerField;
    fieldContragentName: TStringField;
    fieldContragentTypeId: TIntegerField;
    fieldContragentTypeName: TStringField;
    queryL: TUniQuery;
    ds1: TDataSource;
    edtL: TcxLookupComboBox;
    lblL: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

constructor TfrmTemplateModal.Create(AOwner: TComponent; AId, ATypeId: Integer);
begin
  Inherited Create(AOwner);
  Id := AId;
end;

procedure TfrmTemplateModal.Button1Click(Sender: TObject);
begin
//  if Id = 0 then
//    fieldContragentid.Value := UFuncAndProc.getNewId('dictonary.contragent');
  query1.Post;
  ModalResult := mrYes;
  CloseModal;
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

end.
