unit UfrmClientEdt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls, cxGroupBox,
  cxTextEdit, cxDBEdit, Vcl.Mask, Vcl.DBCtrls, UICrud, Data.DB, MemDS, DBAccess,
  Uni;

type
  TfrmClientEdt = class(TForm)
    edtname: TcxDBTextEdit;
    lbl1: TLabel;
    cxGroupBox3: TcxGroupBox;
    btnSave: TButton;
    dsClient: TUniDataSource;
    QueryClient: TUniQuery;
    fieldQueryClientid: TIntegerField;
    fieldQueryClientname: TStringField;
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Id: Integer;
    isNew: Boolean;
    iView: ICrud;
    procedure Save;
  public
    constructor Create(AOwner: TComponent; AId: Integer; AisNew: Boolean;
      AIView: ICrud);
    { Public declarations }
  end;

var
  frmClientEdt: TfrmClientEdt;

implementation

{$R *.dfm}

uses UFuncAndProc, UDmMain;

constructor TfrmClientEdt.Create(AOwner: TComponent; AId: Integer;
  AisNew: Boolean; AIView: ICrud);
begin
  inherited Create(AOwner);
  Id := AId;
  isNew := AisNew;
  iView := AIView;
  with QueryClient do
  begin
    Close;
    ParamByName('id').Value := Id;
    Open;
    if isNew then
      Insert
    else
      Edit;
  end;
end;

procedure TfrmClientEdt.btnSaveClick(Sender: TObject);
begin
  Save;
  Close;
end;

procedure TfrmClientEdt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmClientEdt := nil;
end;

procedure TfrmClientEdt.Save;
begin
  if isNew then
    fieldQueryClientid.Value := UFuncAndProc.getNewId(DICT_TABLE_CLIENT);
  QueryClient.Post;
  iView.ShowEntity(fieldQueryClientid.Value);
end;

end.
