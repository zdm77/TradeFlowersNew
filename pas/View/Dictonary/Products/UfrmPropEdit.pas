unit UfrmPropEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls, cxTextEdit,
  cxDBEdit, Data.DB, DBAccess, Uni, MemDS, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCheckBox, UProps;

type
  TfrmPropEditDict = class(TForm)
    dsProp: TUniDataSource;
    queryProp: TUniQuery;
    btnSave: TButton;
    edtname: TcxDBTextEdit;
    lbl1: TLabel;
  private
    _senderQuery: TUniQuery;
    prop: TProps;
  public
    procedure init(senderQuery: TUniQuery; isNew: Boolean);
    { Public declarations }
  end;

var
  frmPropEditDict: TfrmPropEditDict;

implementation

{$R *.dfm}

uses UMain;

procedure TfrmPropEditDict.init(senderQuery: TUniQuery; isNew: Boolean);
begin
  _senderQuery := senderQuery;
  if isNew = True then
  begin
    _senderQuery.Insert;
  end
  else
  begin
    _senderQuery.Edit;
  end;

end;

end.
