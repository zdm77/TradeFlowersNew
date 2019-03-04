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
  cxNavigator, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxGroupBox, CodeSiteLogging, MemTableDataEh, DataDriverEh, MemTableEh,
  System.Actions, Vcl.ActnList, cxSplitter, cxMemo, cxRichEdit, DBSumLst, Vcl.Mask, Vcl.DBCtrls, dxDateRanges;

type
  TfrmImport = class(TForm)
    queryFieldValues: TUniQuery;
    dlgOpen1: TOpenDialog;
    dsFieldValues: TUniDataSource;
    group1: TcxGroupBox;
    queryProduct: TUniQuery;
    memProduct: TMemTableEh;
    DataDriverProduct: TDataSetDriverEh;
    actlst1: TActionList;
    actClear: TAction;
    actSelect: TAction;
    fieldProductid: TIntegerField;
    fieldProductname: TStringField;
    fieldProductcategory_id: TIntegerField;
    fieldProductsuffix: TStringField;
    fieldProductbarcode: TStringField;
    group2: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1name: TcxGridDBColumn;
    cxGrid1DBTableView1barcode: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    btnSavePos: TButton;
    group3: TcxGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    edtContrName: TcxButtonEdit;
    edtFile: TcxButtonEdit;
    chkAuto: TCheckBox;
    edtCategory: TcxButtonEdit;
    Label1: TLabel;
    cxGroupBox1: TcxGroupBox;
    grid1: TdxSpreadSheet;
    cxGroupBox2: TcxGroupBox;
    btnImport: TButton;
    cxSplitter1: TcxSplitter;
    field_ValuesName: TIntegerField;
    field_ValuesBarcode: TIntegerField;
    queryAssign: TUniQuery;
    mmo1: TcxRichEdit;
    FieldValuesid: TIntegerField;
    FieldValuescontragent_id: TIntegerField;
    FieldValuestest: TFloatField;
    Button1: TButton;
    Label2: TLabel;
    procedure actClearExecute(Sender: TObject);
    procedure actSelectExecute(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure btnSavePosClick(Sender: TObject);
    procedure edtContrNameClick(Sender: TObject);
    procedure edtContrNamePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edtFileClick(Sender: TObject);
    procedure edt1PropertiesChange(Sender: TObject);
    procedure edtCategoryClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    FContragentId: Integer;
    FIdCategory: Integer;
    FNextLevel: string;
    procedure AddAssign(AName, ABarCode: string; AId: Integer);
    function GetAssignBarCode(ABarCode: string): boolean;
    function GetAssignName(AName: string): boolean;
    procedure SelectContragent;
    property ContragentId: Integer read FContragentId write FContragentId;
    property IdCategory: Integer read FIdCategory write FIdCategory;
    property NextLevel: string read FNextLevel write FNextLevel;
    { Private declarations }
  public
    procedure EnableImport;
    procedure LoadExcel;
    procedure SelectCategory;
    { Public declarations }
  end;

var
  frmImport: TfrmImport;

implementation

{$R *.dfm}

uses UfrmContragent, UDmMain, UProductEdit, UfrmSelectTree, UfrmSplash, UFuncAndProc, UfrmQuestAssign, UProduct;

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

procedure TfrmImport.AddAssign(AName, ABarCode: string; AId: Integer);
begin
  with queryAssign do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' INSERT INTO');
    SQL.Add(' dictonary.assoc_product_client');
    SQL.Add(' (');
    SQL.Add(' contragent_id,');
    SQL.Add(' barcode,');
    SQL.Add(' name,');
    SQL.Add(' id_product');
    SQL.Add(' )');
    SQL.Add(' VALUES (');
    SQL.Add(' :contragent_id,');
    SQL.Add(' :barcode,');
    SQL.Add(' :name,');
    SQL.Add(' :id_product');
    SQL.Add(' );');
    ParamByName('contragent_id').Value := ContragentId;
    ParamByName('barcode').Value := ABarCode;
    ParamByName('name').Value := AName;
    ParamByName('id_product').Value := AId;
    ExecSQL;
  end;
end;

procedure TfrmImport.btnImportClick(Sender: TObject);
var
  i: Integer;
  ATable: TdxSpreadSheetTableView;
  // �������� ���� � ������� ������������ �������/�������
  AName, ABarCode: Integer;
  ANameValue, ABarcodeValue: string;
  s: string;
  // ������ � ����� ���� �� �� ������ � ������� ������������ ����������
  isAssign: boolean;
  f: TfrmProductEdit;
  fSplah: tfrmSplash;
begin
  CodeSite.Clear;
  mmo1.Lines.Clear;
  // fSplah := tfrmSplash.Create(Self);
  // fSplah.lblMessage.Caption := '����������� ������.';
  // fSplah.Show;
  // fSplah.Update;
  queryProduct.Close;
  queryProduct.Open;
  // query1.SQL.Text := 'select id from dictonary.product where barcode=:barcode';
  memProduct.Active := False;
  memProduct.Active := True;
  AName := queryFieldValues.FieldByName('name').AsInteger - 1;
  ABarCode := queryFieldValues.FieldByName('barcode').AsInteger - 1;
  ATable := (grid1.Sheets[0] as TdxSpreadSheetTableView);
  for i := 0 to ATable.Rows.Count - 1 do
  begin
    // fSplah.Update;
    try
      isAssign := False;
      ABarcodeValue := ATable.Cells[i, ABarCode].DisplayText;
      // ���� ���� ���������� �� �� 13 �������� �� ��� �� ����� �� ���
      // if (ABarcodeValue.Length +1<> 13) then
      // begin
      // Application.MessageBox('���� �����-���� �� 13 ��������, ��������� ������������ �����.', '���������',
      // MB_OK + MB_ICONERROR);
      // Exit;
      // end;
      ANameValue := ATable.Cells[i, AName].DisplayText;
      s := '������������ : ' + ANameValue + ' �����-���: ' + ABarcodeValue;
      // ��������� ������������
      if (ANameValue) <> '' then
      begin
        mmo1.Lines.Add('');
        // ��������� �����-���
        // if (ATable.Cells[i, ABarcode].DisplayText <> '') then
        // begin
        // if (ATable.Cells[i, ABarcode].DisplayText.Length = 13) then
        // begin
        // ==============================================================================
        // ������������
        // ==============================================================================
        // ��������� �� �����-���� � ������� ������� ���� �� ����
        // ���� ���� �� ��������� ��������
        if (ABarcodeValue <> '') then
          if GetAssignBarCode(ABarcodeValue) = False then
          begin
            mmo1.SelAttributes.Color := clBlue;
            mmo1.Lines.Add('����� "' + ANameValue + '" ������ �� �����-����');
            Continue;
          end;
        // ���� �� ����� �� ������ ��� �� ���� , ������� �� �����
        // ���� ���� �� ��������� �������� (���������� ���������� ���. �������������)
        if GetAssignName(ANameValue) = False then
        begin
          mmo1.SelAttributes.Color := clGreen;
          mmo1.Lines.Add('����� "' + ANameValue + '" ������ �� ������������');
          Continue;
        end;
        // ���� ����� �� ����, ������ �� �����
        mmo1.SelAttributes.Color := clRed;
        mmo1.Lines.Add('����� "' + ANameValue + '" �� ������ � ������� ������������');
        // ������� ����� � ����� ����
        memProduct.Filtered := False;
        memProduct.Filter := 'barcode=' + QuotedStr(ATable.Cells[i, ABarCode].DisplayText);
        memProduct.Filtered := True;
        // ���� ����� � ����� ����, �� ����� ��������� ������������
        if (memProduct.IsEmpty = False) then
        begin
          AddAssign(ANameValue, ABarcodeValue, memProduct.FieldByName('id').Value);
          mmo1.SelAttributes.Color := clBlack;
          mmo1.Lines.Add('����� "' + ANameValue + '" ������ �� �����-���� � ���� � �������� � ������������');
          Continue;
        end;
        // ���� �� ����� �����
        if (memProduct.IsEmpty = True) or (ATable.Cells[i, ABarCode].DisplayText = '') then
        begin
          // ���� �����, ����� ��� ������������
          Application.CreateForm(TfrmQuestAssign, frmQuestAssign);
          frmQuestAssign.lblProduct.Caption := '�����: "' + ANameValue + '" �� ������.';
          frmQuestAssign.ShowModal;
          if frmQuestAssign.ActionSelect = 0 then
            Continue;
          // �����
          if frmQuestAssign.ActionSelect = 1 then
          begin
            // ���� ��������� �� �������, ���� �����
            if IdCategory = 0 then
            begin
              f := TfrmProductEdit.Create(Self, 0, IdCategory, '', ATable.Cells[i, AName].DisplayText,
                ATable.Cells[i, ABarCode].DisplayText);
              f.frameSave1.btnAbort.Visible := True;
              f.ShowModal;
              if f.isAbortImport = True then
                break;
              IdCategory := f.fieldProductcategory_id.Value;
            end
            else
            begin
              // ���� ��������� �������, �� ����� �� �������
              if chkAuto.Checked = False then
              begin
                f := TfrmProductEdit.Create(Self, 0, IdCategory, edtCategory.Text, ATable.Cells[i, AName].DisplayText,
                  ATable.Cells[i, ABarCode].DisplayText);
                f.frameSave1.btnAbort.Visible := True;
                f.ShowModal;
                if f.isAbortImport = True then
                  break;
              end
              else
              // ������ �������
              begin
                queryProduct.Insert;
                fieldProductcategory_id.Value := IdCategory;
                fieldProductbarcode.Value := ATable.Cells[i, ABarCode].DisplayText;
                fieldProductname.Value := ATable.Cells[i, AName].DisplayText;
                // fieldProductlevel.Value:=
                queryProduct.Post;
              end;
            end;
            mmo1.SelAttributes.Color := clBlack;
            mmo1.Lines.Add('����� "' + ANameValue + '" ��������');
            AddAssign(ANameValue, ABarcodeValue, f.Id);
            // CodeSite.Send('������', s);
          end
          else
          begin
            Application.CreateForm(TfrmProduct, frmProduct);
            frmProduct.ShowModal;
            if frmProduct.isSelect = True then
            begin
              if ABarcodeValue = '' then
                ABarcodeValue := frmProduct.frameProduct1.fieldProductbarcode.Value;
              mmo1.SelAttributes.Color := clGreen;
              mmo1.Lines.Add('����� "' + ANameValue + '". ������������ � "' +
                frmProduct.frameProduct1.fieldProductname.Value + '"');
              AddAssign(ANameValue, ABarcodeValue, frmProduct.frameProduct1.fieldProductid.Value);
            end;
          end;
        end;
      end;
    except
      Continue;
    end
  end;
  // fSplah.Close;
  // fSplah.Free;
  Application.MessageBox('������ ��������.', '���������', MB_OK);
end;

procedure TfrmImport.btnSavePosClick(Sender: TObject);
begin
  queryFieldValues.Edit;
  queryFieldValues.Post;
  EnableImport;
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
  EnableImport;
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
    EnableImport;
    // // �������� OLE-������� Excel
    // ExcelApp := CreateOleObject('Excel.Application');
    // // �������� ����� Excel
    // ExcelApp.Workbooks.Open(dlgOpen1.FileName);
    // // �������� ����� �����
    // ExcelSheet := ExcelApp.Workbooks[1].WorkSheets[1];
    // // // ��������� ��������� ��������������� ������ �� �����
    // ExcelSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;
    // // ��������� �������� ������� ���������� ���������
    // x := ExcelApp.ActiveCell.Row;
    // y := ExcelApp.ActiveCell.Column;
    //
    // // ���������� ������� ��������� ����� �� �����
    // MyMass := ExcelApp.Range['A1', ExcelApp.Cells.Item[x, y]].Value;
    // // �������� ����� � ������� ����������
    // // ���������� ������� StringGrid �� ������� ����������� ��������� �����
    // gridImport.RowCount := x;
    // gridImport.ColCount := y;
    // // ���������� ������� StringGrid ���������� �������
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

procedure TfrmImport.EnableImport;
begin
  if (edtContrName.Text <> '') and (edtFile.Text <> '') and (field_ValuesName.Value <> 0) and
    (field_ValuesBarcode.Value <> 0) then
    btnImport.Enabled := True
  else
    btnImport.Enabled := False;
end;

procedure TfrmImport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmImport := nil;
end;

procedure TfrmImport.FormShow(Sender: TObject);
begin
  EnableImport;
end;

function TfrmImport.GetAssignBarCode(ABarCode: string): boolean;
begin
  queryAssign.Close;
  queryAssign.SQL.Text :=
    'select id from dictonary.assoc_product_client where barcode=:barcode and contragent_id=:contragent_id';
  queryAssign.ParamByName('barcode').asString := ABarCode;
  queryAssign.ParamByName('contragent_id').AsInteger := ContragentId;
  queryAssign.Open;
  Result := queryAssign.IsEmpty;
  // TODO -cMM: TfrmImport.GetAssignBarCode default body inserted
end;

function TfrmImport.GetAssignName(AName: string): boolean;
begin
  queryAssign.Close;
  queryAssign.SQL.Text :=
    'select id from dictonary.assoc_product_client where UPPER(name)=:name and contragent_id=:contragent_id';
  queryAssign.ParamByName('name').asString := AnsiUpperCase(AName);
  queryAssign.ParamByName('contragent_id').AsInteger := ContragentId;
  queryAssign.Open;
  Result := queryAssign.IsEmpty;
  // TODO -cMM: TfrmImport.GetAssignName default body inserted
end;

procedure TfrmImport.SelectCategory;
begin
  Application.CreateForm(TfrmSelectTree, frmSelectTree);
  frmSelectTree.idLocate := fieldProductcategory_id.Value;
  frmSelectTree.lblProduct.Caption := '������������: ' + fieldProductname.Value;
  frmSelectTree.ShowModal;
  if frmSelectTree.ModalResult = mrYes then
  begin
    IdCategory := frmSelectTree.idSelect;
    edtCategory.Text := frmSelectTree.nameSelect;
    NextLevel := frmSelectTree.selectNextLevel;
  end;
end;

end.
