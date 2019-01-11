unit UFrameTopPanelMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxCheckBox, dxBar,
  cxBarEditItem, cxClasses;

type
  TframeTopPanelMain = class(TFrame)
    barProduct: TdxBarManager;
    dxbrBardxbrmngr1Bar1: TdxBar;
    btnAdd: TdxBarLargeButton;
    btnAddGroup: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    btnRest: TdxBarLargeButton;
    btnRefresh: TdxBarLargeButton;
    btnSel: TdxBarLargeButton;
    btnFilter: TdxBarLargeButton;
    btnPrint: TdxBarLargeButton;
    btnPrintLogistic: TdxBarButton;
    btnRazdel: TdxBarLargeButton;
    btn«‡Í‡Á: TdxBarButton;
    btn«‡ÍÛÔÍ‡: TdxBarButton;
    btnReportClients: TdxBarButton;
    btnCardClient: TdxBarButton;
    btnExport: TdxBarLargeButton;
    btnSave: TdxBarLargeButton;
    btnAWB: TdxBarLargeButton;
    btnArch: TcxBarEditItem;
    btnLoadPrice: TdxBarLargeButton;
    cxBarEditItem1: TcxBarEditItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UMain;

end.
