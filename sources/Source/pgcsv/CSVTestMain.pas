unit CSVTestMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, PgCSV;

type
  TCSVTester = class(TForm)
    Table1: TTable;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Table1F1: TStringField;
    Table1F2: TStringField;
    Table1F3: TIntegerField;
    Table1F4: TSmallintField;
    PgCSV1: TPgCSV;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure PgCSV1AfterCloseTable(Sender: TObject);
    procedure PgCSV1AfterEmptyTable(Sender: TObject);
    procedure PgCSV1AfterExport(Sender: TObject);
    procedure PgCSV1AfterImport(Sender: TObject);
    procedure PgCSV1AfterOpenTable(Sender: TObject);
    procedure PgCSV1BeforeCloseTable(Sender: TObject);
    procedure PgCSV1BeforeEmptyTable(Sender: TObject);
    procedure PgCSV1BeforeExport(Sender: TObject);
    procedure PgCSV1BeforeImport(Sender: TObject);
    procedure PgCSV1BeforeOpenTable(Sender: TObject);
    procedure PgCSV1ExportError(Sender: TObject; Mess: String;
      RecNo: Integer; var Response: TPgCSVErrorResponse);
    procedure PgCSV1AddRecord(Sender: TObject);
    procedure PgCSV1ExportProgress(Sender: TObject; AProgress: Integer;
      var StopIt: Boolean);
    procedure PgCSV1ImportProgress(Sender: TObject; AProgress: Integer;
      var StopIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CSVTester: TCSVTester;

implementation

{$R *.DFM}

procedure TCSVTester.Button1Click(Sender: TObject);
begin
 PgCSV1.CSVToDataSet;
end;

procedure TCSVTester.Button2Click(Sender: TObject);
begin
 PgCSV1.DataSetToCSV;
end;

procedure TCSVTester.PgCSV1AfterCloseTable(Sender: TObject);
begin
 Memo1.Lines.Add('Table closed');
end;

procedure TCSVTester.PgCSV1AfterEmptyTable(Sender: TObject);
begin
 Memo1.Lines.Add('Table emptied');
end;

procedure TCSVTester.PgCSV1AfterExport(Sender: TObject);
begin
 Memo1.Lines.Add('Export done');
end;

procedure TCSVTester.PgCSV1AfterImport(Sender: TObject);
begin
 Memo1.Lines.Add('Import done');
end;

procedure TCSVTester.PgCSV1AfterOpenTable(Sender: TObject);
begin
 Memo1.Lines.Add('Table openned');
end;

procedure TCSVTester.PgCSV1BeforeCloseTable(Sender: TObject);
begin
 Memo1.Lines.Add('Closing table');
end;

procedure TCSVTester.PgCSV1BeforeEmptyTable(Sender: TObject);
begin
 Memo1.Lines.Add('Empting table');
end;

procedure TCSVTester.PgCSV1BeforeExport(Sender: TObject);
begin
 Memo1.Lines.Add('Exporing...');
end;

procedure TCSVTester.PgCSV1BeforeImport(Sender: TObject);
begin
 Memo1.Lines.Add('Importing...');
end;

procedure TCSVTester.PgCSV1BeforeOpenTable(Sender: TObject);
begin
 Memo1.Lines.Add('Openning table...');
end;

procedure TCSVTester.PgCSV1ExportError(Sender: TObject; Mess: String;
  RecNo: Integer; var Response: TPgCSVErrorResponse);
begin
 if MessageDlg(Mess + ' @: ' + IntToStr(RecNo),mtError,[mbAbort,mbIgnore],0) = mrAbort then
  Response:=pgcsvAbort
 else
  Response:=pgcsvIgnore;
end;

procedure TCSVTester.PgCSV1AddRecord(Sender: TObject);
begin
 Memo1.Lines.Add('Record added');
end;

procedure TCSVTester.PgCSV1ExportProgress(Sender: TObject;
  AProgress: Integer; var StopIt: Boolean);
begin
 Memo1.Lines.Add('Export in progress ' + IntToStr(AProgress));
end;

procedure TCSVTester.PgCSV1ImportProgress(Sender: TObject;
  AProgress: Integer; var StopIt: Boolean);
begin
 Memo1.Lines.Add('Import in progress ' + IntToStr(AProgress));
end;

end.
