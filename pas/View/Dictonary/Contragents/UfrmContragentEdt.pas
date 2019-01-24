unit UfrmContragentEdt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Data.DB, MemDS, DBAccess, Uni;

type
  TfrmContragentEdt = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    queryContragent: TUniQuery;
    fieldContragentid: TIntegerField;
    fieldContragentName: TStringField;
    fieldContragentTypeId: TIntegerField;
    queryType: TUniQuery;
    fieldContragentTypeName: TStringField;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FId: Integer;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; AId: Integer = 0);
    destructor Destroy; override;
    property Id: Integer read FId write FId;
    { Public declarations }
  end;

var
  frmContragentEdt: TfrmContragentEdt;

implementation

{$R *.dfm}

uses UDmMain;

constructor TfrmContragentEdt.Create(AOwner: TComponent; AId: Integer = 0);
begin
  Inherited Create(AOwner);
  Id := AId;

end;

destructor TfrmContragentEdt.Destroy;
begin
  inherited Destroy;
end;

procedure TfrmContragentEdt.Button1Click(Sender: TObject);
begin
  queryContragent.Post;
  ModalResult := mrYes;
  CloseModal;
end;

procedure TfrmContragentEdt.FormShow(Sender: TObject);
begin
  queryContragent.ParamByName('id').Value := Id;
  queryContragent.Open;
  queryType.Open;
  if Id = 0 then
    queryContragent.Insert
  else
    queryContragent.Edit;
end;

end.
