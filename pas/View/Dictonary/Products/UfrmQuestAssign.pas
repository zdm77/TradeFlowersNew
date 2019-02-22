unit UfrmQuestAssign;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmQuestAssign = class(TForm)
    btnNew: TButton;
    btnAssign: TButton;
    btnCancel: TButton;
    lblProduct: TLabel;
    procedure btnAssignClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    // что выбрали
    // 0 отмена, 1 новый, 2 ассоциация
    ActionSelect: Integer;
    { Public declarations }
  end;

var
  frmQuestAssign: TfrmQuestAssign;

implementation

{$R *.dfm}

procedure TfrmQuestAssign.btnAssignClick(Sender: TObject);
begin
  ActionSelect := 2;
  CLose;
 // Application.MessageBox('В разработке', 'Сообщение' , MB_OK);
end;

procedure TfrmQuestAssign.btnCancelClick(Sender: TObject);
begin
  ActionSelect := 0;
  CLose;
end;

procedure TfrmQuestAssign.btnNewClick(Sender: TObject);
begin
  ActionSelect := 1;
  CLose;
end;

end.
