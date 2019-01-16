unit UPropEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, Data.DB, MemDS, DBAccess, Uni, Vcl.StdCtrls,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCheckBox, UCategoryProperty;

type
  TfrmPropEdit = class(TForm)
    dsProp: TUniDataSource;
    queryProp: TUniQuery;
    btnSave: TButton;
    edtPropName: TcxLookupComboBox;
    chkInName: TcxCheckBox;
    procedure btnSaveClick(Sender: TObject);
  private
    _senderQuery: TUniQuery;
    categoryProp: TCategoryProperty;
    { Private declarations }
  public
    procedure init(senderQuery: TUniQuery; isNew: Boolean; _categoryProp:
        TCategoryProperty);
    { Public declarations }
  end;

var
  frmPropEdit: TfrmPropEdit;

implementation

{$R *.dfm}

uses UDmMain, UMain;

procedure TfrmPropEdit.btnSaveClick(Sender: TObject);
begin
  categoryProp.InName:= chkInName.Checked;
  categoryProp.PropertyId:=edtPropName.EditValue;
  ModalResult:=mrOk;
end;

procedure TfrmPropEdit.init(senderQuery: TUniQuery; isNew: Boolean;
    _categoryProp: TCategoryProperty);
begin
 // _senderQuery := senderQuery;

    categoryProp  := _categoryProp;
    with queryProp do
    begin
      Close;
      sql.Text := 'select * from dictonary.properties ';
      if (senderQuery.RecordCount > 0) then
      begin
        sql.Add(' where id not in (select prop_id from dictonary.properties_category where category_id=' +
       inttostr(  categoryProp.Id )+ ')');
      end;
      Open;
      edtPropName.EditValue:=Fields[0].AsInteger;
    end;

end;

end.
