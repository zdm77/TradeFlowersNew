unit UfrmProps;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrameProps, UFrameTopPanelMain;

type
  TfrmProps = class(TForm)
    frameProps1: TframeProps;
    frameTopPanelMain1: TframeTopPanelMain;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProps: TfrmProps;

implementation

{$R *.dfm}



procedure TfrmProps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmProps := nil;
end;

procedure TfrmProps.FormShow(Sender: TObject);
begin
  frameProps1.Init;
end;

end.
