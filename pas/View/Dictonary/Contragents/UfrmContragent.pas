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
  cxGroupBox, UFrameContragent, CodeSiteLogging;

type
  TfrmContragent = class(TForm)
    FrameContragent1: TFrameContragent;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure frameTopPanel1btnAddClick(Sender: TObject);
    procedure frameTopPanel1btnEditClick(Sender: TObject);
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

  CodeSite.Send( csmLevel1, 'data', '' );
    if FormStyle = fsMDIChild then
    begin
      Action := caFree;
      frmContragent := nil;
    end;
end;

procedure TfrmContragent.FormShow(Sender: TObject);
begin
  FrameContragent1.init;
  if FormStyle = fsNormal then
    FrameContragent1.frameTopPanel1.btnSelect.Width := 80;
  FrameContragent1.frameTopPanel1.btnSelect.left := 0;
  // FrameContragent1.ShowContragents();
end;

procedure TfrmContragent.frameTopPanel1btnAddClick(Sender: TObject);
begin
  FrameContragent1.frameTopPanel1btnAddClick(Sender);
end;

procedure TfrmContragent.frameTopPanel1btnEditClick(Sender: TObject);
begin
  FrameContragent1.frameTopPanel1btnEditClick(Sender);
end;

end.
