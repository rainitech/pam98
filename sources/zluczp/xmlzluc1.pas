unit xmlzluc1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComObj, Menus, ComCtrls, Buttons, PgCSV, Db, DBTables;

type
  TForm1 = class(TForm)
    PC1: TPageControl;
    Tab_zluc: TTabSheet;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    Button3: TButton;
    PgCSV1: TPgCSV;
    T1: TTable;
    PgCSV2: TPgCSV;
    T2: TTable;
    PgCSV3: TPgCSV;
    TZLUC: TTable;
    MemoCsv: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sucet: array[0..1000] of double;
    msg: TStringList;
  end;

var
  Form1: TForm1;
  Dialog1: TOpenDialog;
  FNameXml: string;
  FPathXml: string;
  FVyslSub: string;
  F:TextFile;
  PomString: string;

implementation

uses MSXML2_TLB, MyConsts, UnicodeUtils, Inifiles, FmxUtils;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
  PomPath,PomFN,PomFN2,SumFN,LogFN,obd1,obd2:string;
  Riadok:integer;
  zp1,zp2,cpp1,cpp2,csv_riadok:string;
  ID:longint;
function PocetStlpcov(riadok:integer): integer;
begin
  case riadok of
  1: Result := 10;
  2: Result := 12;
  3: Result := 20;
  else Result := 10;
  end;
end;
begin try

  if not FileExists(Edit1.Text) then begin MyError('S˙bor Ë.1 neexistuje');exit;end;
  if not FileExists(Edit2.Text) then begin MyError('S˙bor Ë.2 neexistuje');exit;end;
  if not MyOtazka('Naozaj si ûel·te spustiù zl˙Ëenie d·tov˝ch s˙borov pre zdravotnÈ poisùovne (form·t N514) ?') then exit;

 PgCsv1.CSVFile := Edit1.Text;
 PgCsv2.CSVFile := Edit2.Text;

 TZLUC.Open;
     if not TZLUC.Active then begin MyError('Nepodarilo sa otvorit databazovy subor '+TZLUC.TableName); exit; end;
     while not TZLUC.EOF do TZLUC.Delete;
 T1.Open;
     if not T1.Active then begin MyError('Nepodarilo sa otvorit databazovy subor '+T1.TableName); exit; end;
     while not T1.EOF do T1.Delete;
 PgCsv1.CSVToDataSet;
 T2.Open;
     if not T2.Active then begin MyError('Nepodarilo sa otvorit databazovy subor '+T2.TableName); exit; end;
     while not T2.EOF do T2.Delete;
 PgCsv2.CSVToDataSet;

 Memo1.Clear;

{Spusti vypocet}
  FVyslSub := Edit1.Text;
  PomPath := ExtractFilePath(Edit1.Text);
  PomFN2 := ExtractFileName(Edit1.Text);
  PomFN := Copy(PomFN2,1,Length(PomFN2)-4)+'_zluc';
  SumFN := Copy(PomFN2,1,Length(PomFN2)-4)+'_sum.txt';
  LogFN := Copy(PomFN2,1,Length(PomFN2)-4)+'_log.txt';
  FVyslSub := PomPath+PomFN;

{===============  LOG ZACIATOK ========================}
  Memo1.Lines.Add('ZaËiatok : '+DateTimeToStr(Now));
  Memo1.Lines.Add('---');

  T1.First;
  T2.First;

{===============  Spracuj 1.riadok ========================}
  ID:=1;
  zp1 := IntToStr(StrToInt(T1.FieldByName('F5').AsString));
  zp2 := IntToStr(StrToInt(T2.FieldByName('F5').AsString));
  if (zp1 <> zp2) or (zp1='') then begin MyError('Chyba: Element "KÛd zdravotnej poisùovne" nie je rovnak˝ v obidvoch s˙boroch, s˙bory nie je moûnÈ zl˙Ëiù.');exit; end;

  cpp1 := T1.FieldByName('F3').AsString;
  cpp2 := T2.FieldByName('F3').AsString;
  if (cpp1 <> cpp2) or (cpp1='') then begin MyError('Chyba: Element "I»O platiteæa poistnÈho" nie je rovnakÈ v obidvoch s˙boroch, s˙bory nie je moûnÈ zl˙Ëiù.');exit; end;

  TZLUC.Insert;  TZLUC.Fields[0].Value := ID;
  for i:=1 to PocetStlpcov(1) do
    if i in [8] then TZLUC.Fields[i].AsFloat := T1.Fields[i-1].AsFloat + T2.Fields[i-1].AsFloat
              else TZLUC.Fields[i].AsString := T1.Fields[i-1].AsString;
  TZLUC.Post;
{===============  NEXT ========================}

  T1.Next;T2.Next;

{===============  Spracuj 2.riadok (1.veta zahlavia) ========================}
  ID:=2;

  obd1 := T1.FieldByName('F1').AsString;
  obd2 := T2.FieldByName('F1').AsString;
  if obd1 <> obd2 then begin MyError('Chyba: Element "Obdobie" nie je rovnak˝ v obidvoch s˙boroch, s˙bory nie je moûnÈ zl˙Ëiù.');exit; end;

  TZLUC.Insert; TZLUC.Fields[0].Value := ID;
  for i:=1 to PocetStlpcov(2) do TZLUC.Fields[i].AsString := T1.Fields[i-1].AsString;
  TZLUC.Post;

  {===============  NEXT ========================}
  T1.Next;T2.Next;

{===============  Spracuj 3.riadok (2.veta zahlavia) ========================}
  ID:=3;

  TZLUC.Insert; TZLUC.Fields[0].Value := ID;
  for i:=1 to PocetStlpcov(3) do
    if i in [19] then TZLUC.Fields[i].AsString := T1.Fields[i-1].AsString
    else if i in [1,6,7,8,9,10]
      then TZLUC.Fields[i].AsFloat := T1.Fields[i-1].AsFloat + T2.Fields[i-1].AsFloat
      else TZLUC.Fields[i].AsFloat := T1.Fields[i-1].AsFloat + T2.Fields[i-1].AsFloat;
  TZLUC.Post;

{===============  NEXT ========================}
  T1.Next;T2.Next;

{===============  Spracuj 4.riadok a ostatne z evidencie T1 ========================}
  while not T1.EOF do begin
   ID := ID + 1;
   TZLUC.Insert;
   TZLUC.Fields[0].Value := ID;
   TZLUC.Fields[1].Value := ID - 3;
   for i:=2 to PocetStlpcov(4) do TZLUC.Fields[i].AsString := T1.Fields[i-1].AsString;
   TZLUC.Post;
   T1.Next;
  end;
{===============  Spracuj 4.riadok a ostatne z evidencie T2 ========================}
  while not T2.EOF do begin
   ID := ID + 1;
   TZLUC.Insert;
   TZLUC.Fields[0].Value := ID;
   TZLUC.Fields[1].Value := ID - 3;
   for i:=2 to PocetStlpcov(4) do TZLUC.Fields[i].AsString := T2.Fields[i-1].AsString;
   TZLUC.Post;
   T2.Next;
  end;
{===============  Vyexportuj TZLUC do CSV suboru ========================}
  Riadok := 0;
  TZLUC.First;
  MemoCsv.Clear;
  while not TZLUC.EOF do begin
    inc(Riadok);
    csv_riadok := '';
    for i:=1 to PocetStlpcov(Riadok) do csv_riadok := csv_riadok + TZLUC.Fields[i].AsString + '|';
    MemoCsv.Lines.Append(csv_riadok);
    TZLUC.Next;
  end;
{
 PgCsv1.CSVFile := PgCsv1.CSVFile +'.csv';
 PgCsv1.CSVMap := '';
 PgCsv1.DataSetToCsv;
}
  MemoCsv.Lines.SaveToFile(FVyslSub);

  Memo1.Lines.Add('V˝sledn˝ s˙bor : '+FVyslSub);
  Memo1.Lines.Add('---');
  Memo1.Lines.Add('Koniec : '+DateTimeToStr(Now));
{  Memo1.Lines.SaveToFile(LogFN);  }
{  ExecuteFileX('notepad',LogFN,'',1);}
  MyMessage(Format('Zl˙Ëenie prebehlo v poriadku. V˝sledn˝ s˙bor je %s.',[FVyslSub]));

finally
  T1.Close;
  T2.Close;
  TZLUC.Close;
end;end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  DecimalSeparator := '.';
  PC1.ActivePage := tab_zluc;
  Memo1.Clear;
  Edit1.Text := '';
  Edit2.Text := '';
  msg:= TStringList.Create;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  FPath:string;
  FExt:String;
  FName:String;
begin
try
  Dialog1:=TOpenDialog.Create(Application);
  with Dialog1 do
  begin
    DefaultExt:='xml';
    Filter:='ZP - data files|*N514*|All files|*.*';
    FilterIndex:=1;
    InitialDir:=MyAppPath+MenoXMLDir;
    Options:=[ofFileMustExist,ofNoDereferenceLinks,ofPathMustExist{,ofExtensionDifferent},ofHideReadOnly];
    Title:=SMyAppXmlVyber;
    repeat
      if not Dialog1.Execute then exit;
      FPath:=ExtractFilePath(Dialog1.FileName);
      FName:=ExtractFileName(Dialog1.FileName);
      FExt :=UpperCase(ExtractFileExt(FName));
    until true; {(FExt='.XML');}
    Edit1.Text := Dialog1.FileName;
  end;
finally
  Dialog1.Free;
  SetCurrentDir(MyAppPath);
end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var
  FPath:string;
  FExt:String;
  FName:String;
begin
try
  Dialog1:=TOpenDialog.Create(Application);
  with Dialog1 do
  begin
    DefaultExt:='xml';
    Filter:='ZP - data files|*N514*|All files|*.*';
    FilterIndex:=1;
    InitialDir:=MyAppPath+MenoXMLDir;
    Options:=[ofFileMustExist,ofNoDereferenceLinks,ofPathMustExist{,ofExtensionDifferent},ofHideReadOnly];
    Title:=SMyAppXmlVyber;
    repeat
      if not Dialog1.Execute then exit;
      FPath:=ExtractFilePath(Dialog1.FileName);
      FName:=ExtractFileName(Dialog1.FileName);
      FExt :=UpperCase(ExtractFileExt(FName));
    until true; {(FExt='.XML');}
    Edit2.Text := Dialog1.FileName;
  end;
finally
  Dialog1.Free;
  SetCurrentDir(MyAppPath);
end;
end;


procedure TForm1.Button3Click(Sender: TObject);
begin
  Application.Terminate;
end;




end.

