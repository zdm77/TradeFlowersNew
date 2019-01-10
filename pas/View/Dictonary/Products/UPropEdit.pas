unit UPropEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxDBEdit, Data.DB, MemDS, DBAccess, Uni, Vcl.StdCtrls,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCheckBox;

type
  TfrmPropEdit = class(TForm)
    dsProp: TUniDataSource;
    queryProp: TUniQuery;
    btnSave: TButton;
    cbbPropName: TcxLookupComboBox;
    chkInName: TcxCheckBox;
  private
    _senderQuery: TUniQuery;
    { Private declarations }
  public
    procedure setParam(senderQuery: TUniQuery; isNew: Boolean);
    { Public declarations }
  end;

var
  frmPropEdit: TfrmPropEdit;

implementation

{$R *.dfm}

procedure TfrmPropEdit.setParam(senderQuery: TUniQuery; isNew: Boolean);
begin
  _senderQuery := senderQuery;
  begin
    with queryProp do
    begin
      Close;
      sql.Text := 'select * from "Props" ';
      if (senderQuery.RecordCount > 0) then
      begin
        sql.Add(' where id not in (select prop_id from category_props where category_id=' +
          _senderQuery.FieldByName('category_id').AsString + ')');
      end;
      Open;
       cbbPropName.EditValue:=Fields[0].AsInteger;
    end;
  end;
end;

end.
