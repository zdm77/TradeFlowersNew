unit UfrmPropEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls, cxTextEdit,
  cxDBEdit, Data.DB, DBAccess, Uni, MemDS, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmPropEditDict = class(TForm)
    queryProps: TUniQuery;
    dsProps: TUniDataSource;
    edtname: TcxDBTextEdit;
    lbl1: TLabel;
    btnSave: TButton;
    queryProd: TUniQuery;
    dsProd: TUniDataSource;
    cbbProd: TcxDBLookupComboBox;
    procedure btnSaveClick(Sender: TObject);
  private
    _senderQuery: TUniQuery;
  public
    procedure setParam(senderQuery: TUniQuery; isNew: Boolean);
    { Public declarations }
  end;

var
  frmPropEditDict: TfrmPropEditDict;

implementation

{$R *.dfm}

procedure TfrmPropEditDict.btnSaveClick(Sender: TObject);
begin
  queryProps.Post;
  _senderQuery.Refresh;
  // ShowMessage(queryCategory.FieldByName('id').AsString);
  _senderQuery.Locate('id', queryProps.FieldByName('id').AsInteger, []);
end;

procedure TfrmPropEditDict.setParam(senderQuery: TUniQuery; isNew: Boolean);
begin
  _senderQuery := senderQuery;
  begin
    with queryProps do
    begin
      Close;
      // SQL.Text := 'select * from "Props" where id=' + _senderQuery.FieldByName('Id').AsString;
      sql.Text := 'SELECT * from view_prop_test where id=' +
        _senderQuery.FieldByName('Id').AsString;
      Open;
      if isNew = True then
        Insert
      else
        Update;
    end;
  end;
end;

end.
