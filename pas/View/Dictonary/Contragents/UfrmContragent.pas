unit UfrmContragent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  MemDS, DBAccess, Uni, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls,
  cxGroupBox, UFrameContragent;

type
  TfrmContragent = class(TForm)
    FrameContragent1: TFrameContragent;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContragent: TfrmContragent;

implementation

{$R *.dfm}

procedure TfrmContragent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
  frmContragent:=nil;
end;

procedure TfrmContragent.FormShow(Sender: TObject);
begin
  FrameContragent1.init;
  //FrameContragent1.ShowContragents();
end;

end.
