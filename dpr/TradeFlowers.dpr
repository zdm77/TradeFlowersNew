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
  UProduct in '..\pas\View\Dictonary\Products\UProduct.pas' {frmProduct};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
//  Application.CreateForm(TfrmProductEdit, frmProductEdit);
//  Application.CreateForm(TfrmCategoryEdit, frmCategoryEdit);
//  Application.CreateForm(TfrmPropEdit, frmPropEdit);
//  Application.CreateForm(TDMMain, DMMain);
//  Application.CreateForm(TfrmProduct, frmProduct);
  Application.Run;
end.
