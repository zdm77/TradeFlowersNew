program TradeFlowers;

uses
  Vcl.Forms,
  UMain in '..\pas\UMain.pas' {frmMain},
  UFuncAndProc in '..\pas\Controller\UFuncAndProc.pas',
  UProductEdit in '..\pas\View\Dictonary\Products\UProductEdit.pas' {frmProductEdit},
  UCategory in '..\pas\Model\UCategory.pas',
  UCategoryEdit in '..\pas\View\Dictonary\Products\UCategoryEdit.pas' {frmCategoryEdit},
  UPropEdit in '..\pas\View\Dictonary\Products\UPropEdit.pas' {frmPropEdit},
  UFrameProduct in '..\pas\View\Dictonary\Products\UFrameProduct.pas' {frameProduct: TFrame},
  UDmMain in '..\pas\UDmMain.pas' {DMMain: TDataModule},
  UProduct in '..\pas\View\Dictonary\Products\UProduct.pas' {frmProduct},
  UProps in '..\pas\Model\UProps.pas',
  UPropController in '..\pas\Controller\UPropController.pas',
  UfrmProps in '..\pas\View\Dictonary\Products\UfrmProps.pas' {frmProps},
  UFrameProps in '..\pas\View\Dictonary\Products\UFrameProps.pas' {frameProps: TFrame},
  UfrmPropEdit in '..\pas\View\Dictonary\Products\UfrmPropEdit.pas' {frmPropEditDict},
  UFrameTopPanelMain in '..\pas\UFrameTopPanelMain.pas' {frameTopPanelMain: TFrame},
  UProductModel in '..\pas\Model\UProductModel.pas',
  UCategoruController in '..\pas\Controller\UCategoruController.pas',
  UfrmSelect in '..\pas\UfrmSelect.pas' {frmSelect},
  UfrmSelectTree in '..\pas\UfrmSelectTree.pas' {frmSelectTree},
  UCategoryProperty in '..\pas\Model\UCategoryProperty.pas',
  UfrmOnlyName in '..\pas\View\UfrmOnlyName.pas' {frmOnlyName},
  UFrameContragent in '..\pas\View\Dictonary\Contragents\UFrameContragent.pas' {FrameContragent: TFrame},
  UContragent in '..\pas\Model\Dictonary\Contragents\UContragent.pas',
  UfrmContragent in '..\pas\View\Dictonary\Contragents\UfrmContragent.pas' {frmContragent},
  UfrmContragentEdt in '..\pas\View\Dictonary\Contragents\UfrmContragentEdt.pas' {frmContragentEdt},
  Vcl.Themes,
  Vcl.Styles,
  UFrameTopPanel in '..\pas\UFrameTopPanel.pas' {frameTopPanel: TFrame},
  UfrmUser in '..\pas\View\Dictonary\Orgstract\UfrmUser.pas' {frmUser},
  UfrmPost in '..\pas\View\Dictonary\Orgstract\UfrmPost.pas' {frmPost};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDMMain, DMMain);
  Application.CreateForm(TfrmPost, frmPost);
  Application.Run;
end.
