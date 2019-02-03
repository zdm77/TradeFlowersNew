unit UfrmContragentEdt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Data.DB, MemDS, DBAccess, Uni, UFrameSave, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxEdit, cxDataControllerConditionalFormattingRulesManagerDialog, cxVGrid, cxDBVGrid, cxInplaceContainer,
  cxSpinEdit, MemTableDataEh, MemTableEh;

type
  TfrmContragentEdt = class(TForm)
    queryContragent: TUniQuery;
    fieldContragentid: TIntegerField;
    fieldContragentName: TStringField;
    fieldContragentTypeId: TIntegerField;
    fieldContragentTypeName: TStringField;
    dsContragent: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    frameSave1: TframeSave;
    queryCat: TUniQuery;
    dsCat: TDataSource;
    gridCat: TcxDBVerticalGrid;
    gridCatname: TcxDBEditorRow;
    gridCatbarcode: TcxDBEditorRow;
    fieldCatid: TIntegerField;
    fieldCatcontragent_id: TIntegerField;
    fieldCatname: TIntegerField;
    fieldCatbarcode: TIntegerField;
    memContrType: TMemTableEh;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frameSave1Button1Click(Sender: TObject);
  private
    FId: Integer;
    FTypeId: Integer;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; AId, ATypeId: Integer);
    destructor Destroy; override;
    property Id: Integer read FId write FId;
    property TypeId: Integer read FTypeId write FTypeId;
    { Public declarations }
  end;

var
  frmContragentEdt: TfrmContragentEdt;

implementation

{$R *.dfm}

uses UDmMain, UFuncAndProc;

constructor TfrmContragentEdt.Create(AOwner: TComponent; AId, ATypeId: Integer);
begin
  Inherited Create(AOwner);
  Id := AId;
  TypeId := ATypeId;
end;

destructor TfrmContragentEdt.Destroy;
begin
  inherited Destroy;
end;

procedure TfrmContragentEdt.Button1Click(Sender: TObject);
begin
  // if Id = 0 then
  // fieldContragentid.Value := UFuncAndProc.getNewId('dictonary.contragent');
  // queryContragent.Post;
  // ModalResult := mrYes;
  // CloseModal;
end;

procedure TfrmContragentEdt.FormShow(Sender: TObject);
begin
  memContrType.LoadFromDataSet(DMMain.memContrType, -1, lmCopy, true);
  memContrType.Active := true;
  queryContragent.ParamByName('id').Value := Id;
  queryContragent.Open;
  queryCat.ParamByName('id').Value := Id;
  queryCat.Open;
  if Id = 0 then
  begin
    queryContragent.Insert;
    queryCat.Insert;
  end
  else
  begin
    queryContragent.Edit;
    queryCat.Edit;
  end;
  fieldContragentTypeId.Value := TypeId;
end;

procedure TfrmContragentEdt.frameSave1Button1Click(Sender: TObject);
begin
  if UFuncAndProc.Validate(queryContragent, fieldContragentid, 'dictonary.contragent') = true then
  begin
    Id := fieldContragentid.Value;
    if fieldCatcontragent_id.Value = 0 then
      fieldCatcontragent_id.Value := Id;
    queryCat.Post;
    ModalResult := mrYes;
    CloseModal;
  end;
end;

end.
