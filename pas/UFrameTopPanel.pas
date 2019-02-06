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
    btnSelect: TButton;
    btnImport: TButton;
    procedure btnSelectClick(Sender: TObject);
    procedure chkShowDelClick(Sender: TObject);
  private
    FisSelect: Boolean;
    FisShowDel: Boolean;
    procedure SetisShowDel(const Value: Boolean);
    { Private declarations }
  public
    procedure DeleteRecord(AQuery: TuniQuery; ATableName: string);
    procedure DeleteRecordMemo(AId: Integer; ATableName: string);
    procedure RestoreRecord(AQuery: TuniQuery; ATableName: string);
    procedure RestoreRecordMemo(AId: Integer; ATableName: string);
    property isSelect: Boolean read FisSelect write FisSelect;
    property isShowDel: Boolean read FisShowDel write SetisShowDel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UDmMain;

procedure TframeTopPanel.btnSelectClick(Sender: TObject);
begin
  isSelect := True;
end;

procedure TframeTopPanel.DeleteRecord(AQuery: TuniQuery; ATableName: string);
var
  query: TuniQuery;
begin
  query := TuniQuery.Create(nil);
  query.Connection := dmMain.conMain;
  if isShowDel = false then
    if Application.MessageBox('�� ������������� ������ �������� ������ �� ��������?', '��������������',
      MB_YESNO + MB_ICONWARNING) = mrYes then
      query.SQL.Text := 'update ' + ATableName + '  set is_delete=true where id=:id';
  if isShowDel = True then
    if Application.MessageBox('�� ������������� ������ ������������ ������� ������?', '��������������',
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

procedure TframeTopPanel.DeleteRecordMemo(AId: Integer; ATableName: string);
var
  query: TuniQuery;
begin
  query := TuniQuery.Create(nil);
  query.Connection := dmMain.conMain;
  if isShowDel = false then
    if Application.MessageBox('�� ������������� ������ �������� ������ �� ��������?', '��������������',
      MB_YESNO + MB_ICONWARNING) = mrYes then
      query.SQL.Text := 'update ' + ATableName + '  set is_delete=true where id=:id';
  if isShowDel = True then
    if Application.MessageBox('�� ������������� ������ ������������ ������� ������?', '��������������',
      MB_YESNO + MB_ICONWARNING) = mrYes then
      query.SQL.Text := 'delete from ' + ATableName + ' where id=:id';
  if query.SQL.Text <> '' then
  begin
    query.ParamByName('id').Value := AId;
    query.ExecSQL;
  end;
end;

procedure TframeTopPanel.SetisShowDel(const Value: Boolean);
begin
  FisShowDel := Value;
  chkShowDel.Checked := isShowDel;
  btnRestore.Enabled := isShowDel;
end;

procedure TframeTopPanel.RestoreRecord(AQuery: TuniQuery; ATableName: string);
var
  query: TuniQuery;
begin
  query := TuniQuery.Create(nil);
  query.Connection := dmMain.conMain;
  if Application.MessageBox('�� ������������� ������ ������������ ������?', '������', MB_YESNO + MB_ICONQUESTION) = mrYes
  then
  begin
    query.SQL.Text := 'update ' + ATableName + '  set is_delete=false where id=:id';
    query.ParamByName('id').Value := AQuery.FieldByName('id').Value;
    query.ExecSQL;
    AQuery.Refresh;
  end;
end;

procedure TframeTopPanel.RestoreRecordMemo(AId: Integer; ATableName: string);
var
  query: TuniQuery;
begin
  query := TuniQuery.Create(nil);
  query.Connection := dmMain.conMain;
  if Application.MessageBox('�� ������������� ������ ������������ ������?', '������', MB_YESNO + MB_ICONQUESTION) = mrYes
  then
  begin
    query.SQL.Text := 'update ' + ATableName + '  set is_delete=false where id=:id';
    query.ParamByName('id').Value := AId;
    query.ExecSQL;
  end;
end;

end.
