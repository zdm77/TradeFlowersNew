unit UfrmImport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, Vcl.StdCtrls, Data.DB, MemDS, DBAccess, Uni, cxStyles, cxSpinEdit,
  cxDataControllerConditionalFormattingRulesManagerDialog, Vcl.Grids, cxVGrid, cxDBVGrid, cxInplaceContainer, ComObj,
  dxCore, dxCoreClasses, dxHashUtils, dxSpreadSheetCore, dxSpreadSheetCoreHistory, dxSpreadSheetCoreStyles,
  dxSpreadSheetCoreStrs, dxSpreadSheetConditionalFormatting, dxSpreadSheetConditionalFormattingRules,
  dxSpreadSheetClasses, dxSpreadSheetContainers, dxSpreadSheetFormulas, dxSpreadSheetHyperlinks, dxSpreadSheetFunctions,
  dxSpreadSheetStyles, dxSpreadSheetGraphics, dxSpreadSheetPrinting, dxSpreadSheetTypes, dxSpreadSheetUtils,
  dxSpreadSheetFormattedTextUtils, dxBarBuiltInMenu, dxSpreadSheet, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxGroupBox, CodeSiteLogging, MemTableDataEh, DataDriverEh, MemTableEh,
  System.Actions, Vcl.ActnList;

type
  TfrmImport = class(TForm)
    queryFieldValues: TUniQuery;
    dlgOpen1: TOpenDialog;
    dsFieldValues: TUniDataSource;
    grid1: TdxSpreadSheet;
    group1: TcxGroupBox;
    lbl1: TLabel;
    edtContrName: TcxButtonEdit;
    edtFile: TcxButtonEdit;
    group2: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1name: TcxGridDBColumn;
    cxGrid1DBTableView1barcode: TcxGridDBColumn;
    query1: TUniQuery;
    memProduct: TMemTableEh;
    DataDriverProduct: TDataSetDriverEh;
    fieldProductlevel: TStringField;
    fieldProductid: TIntegerField;
    fieldProductname: TStringField;
    fieldProductcategory_id: TIntegerField;
    fieldProductsuffix: TStringField;
    fieldProductbarcode: TStringField;
    fieldProductcategory_name: TStringField;
    lbl2: TLabel;
    edtCategory: TcxButtonEdit;
    Label1: TLabel;
    chkAuto: TCheckBox;
    actlst1: TActionList;
    actClear: TAction;
    actSelect: TAction;
    cxGroupBox2: TcxGroupBox;
    btnImport: TButton;
    procedure actClearExecute(Sender: TObject);
    procedure actSelectExecute(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure edtContrNameClick(Sender: TObject);
    procedure edtContrNamePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edtFileClick(Sender: TObject);
    procedure edt1PropertiesChange(Sender: TObject);
    procedure edtCategoryClick(Sender: TObject);
  private
    FContragentId: Integer;
    FIdCategory: Integer;
    FNextLevel: string;
    procedure SelectContragent;
    property ContragentId: Integer read FContragentId write FContragentId;
    property IdCategory: Integer read FIdCategory write FIdCategory;
    property NextLevel: string read FNextLevel write FNextLevel;
    { Private declarations }
  public
    procedure LoadExcel;
    procedure SelectCategory;
    { Public declarations }
  end;

var
  frmImport: TfrmImport;

implementation

{$R *.dfm}

uses UfrmContragent, UDmMain, UProductEdit, UfrmSelectTree;

procedure TfrmImport.actClearExecute(Sender: TObject);
begin
  edtCategory.Text := '';
  IdCategory := 0;
  chkAuto.Checked := False;
  chkAuto.Enabled := False;
end;

procedure TfrmImport.actSelectExecute(Sender: TObject);
begin
  SelectCategory;
end;

procedure TfrmImport.btnImportClick(Sender: TObject);
var
  i: Integer;
  ATable: TdxSpreadSheetTableView;
  AName, ABarcode: Integer;
  s: string;
var
  f: TfrmProductEdit;
begin
  // IdCategory := 0;
  CodeSite.Send(csmLevel1, 'data', fieldProductlevel.Value);
  query1.Close;
  query1.SQL.Text := 'select id from dictonary.product where barcode=:barcode';
  memProduct.Active := False;
  memProduct.Active := True;
  AName := queryFieldValues.FieldByName('name').AsInteger - 1;
  ABarcode := queryFieldValues.FieldByName('barcode').AsInteger - 1;
  ATable := (grid1.Sheets[0] as TdxSpreadSheetTableView);
  for i := 0 to ATable.Rows.Count - 1 do
  begin
    try
      s := 'Наименование : ' + ATable.Cells[i, AName].DisplayText + ' Штрих-код: ' + ATable.Cells[i, ABarcode]
        .DisplayText;
      // проверяем наименование
      if (ATable.Cells[i, AName].DisplayText) <> '' then
      begin
        // проверяем штрих-код
        if (ATable.Cells[i, ABarcode].DisplayText <> '') and (ATable.Cells[i, ABarcode].DisplayText.Length = 13) then
        begin
          // проверяем наличие
          memProduct.Filtered := False;
          memProduct.Filter := 'barcode=' + QuotedStr(ATable.Cells[i, ABarcode].DisplayText);
          memProduct.Filtered := True;
          if memProduct.IsEmpty = True then
          begin
            // если категория не выбрана, даем выбор
            if IdCategory = 0 then
            begin
              f := TfrmProductEdit.Create(Self, 0, IdCategory, '', ATable.Cells[i, AName].DisplayText,
                ATable.Cells[i, ABarcode].DisplayText);
              f.ShowModal;
              IdCategory := f.fieldProductcategory_id.Value;
            end
            else
            begin
              // если категория выбрана, но режим не автомат
              if chkAuto.Checked = False then
              begin
                f := TfrmProductEdit.Create(Self, 0, IdCategory, edtCategory.Text, ATable.Cells[i, AName].DisplayText,
                  ATable.Cells[i, ABarcode].DisplayText);
                f.ShowModal;
              end
              else
              // полный автомат
              begin
                memProduct.Insert;
                fieldProductcategory_id.Value := IdCategory;
                fieldProductbarcode.Value := ATable.Cells[i, ABarcode].DisplayText;
                fieldProductname.Value := ATable.Cells[i, AName].DisplayText;
               //fieldProductlevel.Value:=
                memProduct.Post;
              end;
            end;
            // CodeSite.Send('Найден', s);
          end;
        end
        else
          // CodeSite.Send('Нет штрих-кода: ', ATable.Cells[i, AName].DisplayText);
      end;
    except
      Continue;
    end;
  end;
  // qqq := TdxSpreadSheetFormulaErrorCode.ecValue;
  // ASheet := grid1.ActiveSheetAsTable;
  // ASheet.GetCellValue(1, 1, s, TdxSpreadSheetFormulaErrorCode.ecNone);
  // CodeSite.Send('Comment', ATable.Cells[i,2].DisplayText);
  // if ASheet.Selection.Count > 0 then
  // ASheet.Columns.Groups.Add(ASheet.Selection.Area.Left, ASheet.Selection.Area.Right);
  // with grid1 do
  // begin
  // while not eof do
  // begin
  // grid1.Sheets[1].
  // CodeSite.Send('Comment',       ACell[1,3]);
  // Next;
  // end;
  // end;
end;

procedure TfrmImport.edtContrNameClick(Sender: TObject);
begin
  SelectContragent;
end;

procedure TfrmImport.SelectContragent;
begin
  Application.CreateForm(TfrmContragent, frmContragent);
  frmContragent.FormStyle := fsNormal;
  frmContragent.Width := 640;
  frmContragent.ShowModal;
  if frmContragent.ModalResult = mrYes then
  begin
    edtContrName.Text := frmContragent.FrameContragent1.fieldContrname.Value;
    ContragentId := frmContragent.FrameContragent1.fieldContrid.Value;
    with queryFieldValues do
    begin
      Close;
      SQL.Text := 'select * from dictonary.product_contragent_field where contragent_id=' + IntToStr(ContragentId);
      Open;
    end;
  end;
  frmContragent := nil;
  frmContragent.Free;
end;

procedure TfrmImport.edtContrNamePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  SelectContragent;
end;

procedure TfrmImport.edtFileClick(Sender: TObject);
begin
  LoadExcel;
end;

procedure TfrmImport.LoadExcel;
const
  xlCellTypeLastCell = $0000000B;
var
  ExcelApp, ExcelSheet: OLEVariant;
  MyMass: Variant;
  // x, y: Integer;
begin
  if dlgOpen1.Execute then
  begin
    edtFile.Text := dlgOpen1.FileName;
    grid1.LoadFromFile(dlgOpen1.FileName);
    // // создание OLE-объекта Excel
    // ExcelApp := CreateOleObject('Excel.Application');
    // // открытие книги Excel
    // ExcelApp.Workbooks.Open(dlgOpen1.FileName);
    // // открытие листа книги
    // ExcelSheet := ExcelApp.Workbooks[1].WorkSheets[1];
    // // // выделение последней задействованной ячейки на листе
    // ExcelSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;
    // // получение значений размера выбранного диапазона
    // x := ExcelApp.ActiveCell.Row;
    // y := ExcelApp.ActiveCell.Column;
    //
    // // присвоение массиву диапазона ячеек на листе
    // MyMass := ExcelApp.Range['A1', ExcelApp.Cells.Item[x, y]].Value;
    // // закрытие книги и очистка переменных
    // // назначение размера StringGrid по размеру полученного диапазона ячеек
    // gridImport.RowCount := x;
    // gridImport.ColCount := y;
    // // заполнение таблицы StringGrid значениями массива
    // for x := 1 to gridImport.ColCount do
    // for y := 1 to gridImport.RowCount do
    // gridImport.Cells[x - 1, y - 1] := MyMass[y, x];
    // ExcelApp.Quit;
    // ExcelApp := Unassigned;
    // ExcelSheet := Unassigned;
  end;
end;

procedure TfrmImport.edt1PropertiesChange(Sender: TObject);
begin
  if edtCategory.Text <> '' then
    chkAuto.Enabled := True
  else
    chkAuto.Enabled := False;
end;

procedure TfrmImport.edtCategoryClick(Sender: TObject);
begin
  SelectCategory;
end;

procedure TfrmImport.SelectCategory;
begin
  Application.CreateForm(TfrmSelectTree, frmSelectTree);
  frmSelectTree.idLocate := fieldProductcategory_id.Value;
  frmSelectTree.lblProduct.Caption := 'Номенклатура: ' + fieldProductname.Value;
  frmSelectTree.ShowModal;
  if frmSelectTree.ModalResult = mrYes then
  begin
    IdCategory := frmSelectTree.idSelect;
    edtCategory.Text := frmSelectTree.nameSelect;
    NextLevel := frmSelectTree.selectNextLevel;
  end;
end;

end.
