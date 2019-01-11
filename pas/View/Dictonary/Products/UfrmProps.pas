unit UfrmProps;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrameProps, UFrameTopPanelMain;

type
  TfrmProps = class(TForm)
    frameTopPanelMain1: TframeTopPanelMain;
    frameProps1: TframeProps;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure frameProps1btnDelClick(Sender: TObject);
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

procedure TfrmProps.frameProps1btnDelClick(Sender: TObject);
begin
  frameProps1.btnDelClick(Sender);

end;

end.
