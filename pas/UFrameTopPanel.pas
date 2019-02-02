unit UFrameTopPanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Vcl.StdCtrls, cxGroupBox, UNI;

type
  TframeTopPanel = class(TFrame)
    cxGroupBox4: TcxGroupBox;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDel: TButton;
    btnRefresh: TButton;
    chkShowDel: TCheckBox;
    btnRestore: TButton;
    procedure chkShowDelClick(Sender: TObject);
  private
    FisShowDel: Boolean;
    procedure SetisShowDel(const Value: Boolean);
    { Private declarations }
  public
    procedure DeleteRecord(AQuery: TuniQuery; ATableName: string);
    procedure RestoreRecord(AQuery: TuniQuery; ATableName: string);
    property isShowDel: Boolean read FisShowDel write SetisShowDel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UDmMain;

procedure TframeTopPanel.DeleteRecord(AQuery: TuniQuery; ATableName: string);
var
  query: TuniQuery;
begin
  query := TuniQuery.Create(nil);
  query.Connection := dmMain.conMain;
  if isShowDel = false then
    if Application.MessageBox('Вы действительно хотите пометить запись на удаление?', 'Предупреждение',
      MB_YESNO + MB_ICONWARNING) = mrYes then
      query.SQL.Text := 'update ' + ATableName + '  set is_delete=true where id=:id';
  if isShowDel = true then
    if Application.MessageBox('Вы действительно хотите безвозвратно удалить запись?', 'Предупреждение',
      MB_YESNO + MB_ICONWARNING) = mrYes then
      query.SQL.Text := 'delete from ' + ATableName + ' where id=:id';
  if query.SQL.Text <> '' then
  begin
    query.ParamByName('id').Value := AQuery.FieldByName('id').Value;
    query.ExecSQL;
    AQuery.Refresh;
  end;
end;

procedure TframeTopPanel.chkShowDelClick(Sender: TObject);
begin
  isShowDel := chkShowDel.Checked;
end;

procedure TframeTopPanel.SetisShowDel(const Value: Boolean);
begin
  FisShowDel := Value;
  chkShowDel.Checked := isShowDel;
  btnRestore.Visible := isShowDel;
end;

procedure TframeTopPanel.RestoreRecord(AQuery: TuniQuery; ATableName: string);
var
  query: TuniQuery;
begin
  query := TuniQuery.Create(nil);
  query.Connection := dmMain.conMain;
  if Application.MessageBox('Вы действительно хотите восстановить запись?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = mrYes
  then
  begin
    query.SQL.Text := 'update ' + ATableName + '  set is_delete=false where id=:id';
    query.ParamByName('id').Value := AQuery.FieldByName('id').Value;
    query.ExecSQL;
    AQuery.Refresh;
  end;
end;

end.
