unit UfrmPropEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls, cxTextEdit,
  cxDBEdit, Data.DB, DBAccess, Uni, MemDS, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCheckBox;

type
  TfrmPropEditDict = class(TForm)
    btnSave: TButton;
    edtPropName: TcxLookupComboBox;
    chkInName: TcxCheckBox;
    dsProp: TUniDataSource;
    queryProp: TUniQuery;
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

procedure TfrmPropEditDict.setParam(senderQuery: TUniQuery; isNew: Boolean);
begin
 
end;

end.
