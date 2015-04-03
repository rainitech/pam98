// TPgCSV component V 1.31
// Khashayar Sadjadi (khashi@pragena.8m.com)
// Pragena's Delphi Home (http://pragena.8m.com)

// Please send me notes, bugs and problems

// You can use this component for free in commercial or non-commercial programs
// Please send me the changes you made in source code, and do not forgret my credit!
// Read Readme.txt file included with the package for help and credits.

// History:
// 1.31 (Current version) A minor bug in DatasetToCSV and CSVToDataset fixed.
// 1.3                    Disable controls and enable controls added to import and export progress
//                        Setting default values on creation
//                        ShortDateFormat for Date fields
//                        TrimData property for Import and Export added (string values)
//                        DefaultInt property for defulat value of fault integer fields
//                        BufferSize property for buffered read/write from/to CSV files
//                        Faster process using cached field names and map items pre-calculating
//                        Stop feature in progress events
// 1.2                    Component renamed to TPgCSV to avoid name confilicts.
//                        ImportFromTable and ExportToTable renamed to DataSetToCSV and CSVToDataSet
//                        UseDelimiter property, for Import and Export.
//                        No need to Rx StrUtils.
//                        Bug in "two separators without space" solved.
//                        Some bugs in using Seprator within a quted (Demlimited) field fixed
//                        Some bugs in using Delimiter within a delimited field fixed
//                        Exception handling with error event added
// 1.1                    TTable to TDataset for using with TQuery, TStoredProc, ...
//                        Auto map builder for empty map strings. (this only works in ImportFromTable method)
// 1.0                    First release of TCSV.

unit PgCSV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db;

type
  TPgCSVErrorResponse     = (pgcsvAbort, pgcsvIgnore);

  TPgCSVProgressEvent     = procedure (Sender : TObject; AProgress: LongInt; var StopIt: Boolean) of object;
  TPgCSVExportErrorEvent  = procedure (Sender : TObject; Mess: string; RecNo: LongInt; var Response:TPgCSVErrorResponse) of object;

  TPgCSV = class(TComponent)
  private
   FDataset         : TDataset;
   FCSVMap,
   FCSVFile,
   FDateFormat,
   FIgnoreStr       : string;
   FSeprator,
   FDelimiter,
   FFieldIndicator  : Char;
   FAutoOpen,
   FUseDelimiter,
   FSilentExport,
   FTrimData,
   FStop,
   FEmptyTable      : Boolean;
   FBeforeOpenTable,
   FAfterOpenTable,
   FBeforeCloseTable,
   FAfterCloseTable,
   FBeforeEmptyTable,
   FAfterEmptyTable,
   FBeforeExport,
   FAfterExport,
   FBeforeImport,
   FAfterImport,
   FOnAddRecord     : TNotifyEvent;
   FExportProgress,
   FImportProgress  : TPgCSVProgressEvent;
   FExportError     : TPgCSVExportErrorEvent;
   FMapItems,        
   FDefaultInt      : Integer;
   FBufferSize      : LongInt;
   FFieldCache      : TList;
  protected
   FFile            : TextFile;
   function CountMapItems:Integer;
   function GetMapItem(ItemIndex:Integer;var AField:Boolean):string;
   function GetCSVRecordItem(ItemIndex:Integer;CSVRecord:string):string;
   function BuildMap:string;
   function ExtractWord(Item: Integer;S, WordDelim: string): string;
   function WordCount(const S ,WordDelim: string): Integer;
   function WordPosition(Item: Integer; const S, SubStr: string): Integer;
  public
   constructor Create(AOwner: TComponent); override;
  published
   //properties
   property Dataset          : TDataset               read FDataset          write FDataset;
   property CSVMap           : string                 read FCSVMap           write FCSVMap;
   property CSVFile          : string                 read FCSVFile          write FCSVFile;
   property Seprator         : Char                   read FSeprator         write FSeprator;
   property FieldIndicator   : Char                   read FFieldIndicator   write FFieldIndicator;
   property AutoOpen         : Boolean                read FAutoOpen         write FAutoOpen;
   property IgnoreString     : string                 read FIgnoreStr        write FIgnoreStr;
   property Delimiter        : Char                   read FDelimiter        write FDelimiter;
   property EmptyTable       : Boolean                read FEmptyTable       write FEmptyTable;
   property UseDelimiter     : Boolean                read FUseDelimiter     write FUseDelimiter;
   property SilentExport     : Boolean                read FSilentExport     write FSilentExport;
   property DateFormat       : string                 read FDateFormat       write FDateFormat;
   property TrimData         : Boolean                read FTrimData         write FTrimData;
   property DefaultInt       : Integer                read FDefaultInt       write FDefaultInt;
   property BufferSize       : LongInt                read FBufferSize       write FBufferSize;
   //events
   property BeforeOpenTable  : TNotifyEvent           read FBeforeOpenTable  write FBeforeOpenTable;
   property AfterOpenTable   : TNotifyEvent           read FAfterOpenTable   write FAfterOpenTable;
   property BeforeCloseTable : TNotifyEvent           read FBeforeCloseTable write FBeforeCloseTable;
   property AfterCloseTable  : TNotifyEvent           read FAfterCloseTable  write FAfterCloseTable;
   property BeforeEmptyTable : TNotifyEvent           read FBeforeEmptyTable write FBeforeEmptyTable;
   property AfterEmptyTable  : TNotifyEvent           read FAfterEmptyTable  write FAfterEmptyTable;
   property BeforeImport     : TNotifyEvent           read FBeforeImport     write FBeforeImport;
   property AfterImport      : TNotifyEvent           read FAfterImport      write FAfterImport;
   property BeforeExport     : TNotifyEvent           read FBeforeExport     write FBeforeExport;
   property AfterExport      : TNotifyEvent           read FAfterExport      write FAfterExport;
   property ExportProgress   : TPgCSVProgressEvent    read FExportProgress   write FExportProgress;
   property ImportProgress   : TPgCSVProgressEvent    read FImportProgress   write FImportProgress;
   property OnAddRecord      : TNotifyEvent           read FOnAddRecord      write FOnAddRecord;
   property ExportError      : TPgCSVExportErrorEvent read FExportError      write FExportError;
   //methodes
   procedure CSVToDataset;
   procedure DatasetToCSV;
  end;

procedure Register;

implementation

//published methodes
procedure TPgCSV.CSVToDataSet;
var
 RecordString,
 Temp          : string;
 i             : Integer;
 C             : LongInt;
 D             : Boolean;
 F             : Real;
 ErrorResponse : TPgCSVErrorResponse;
 Buffer        : Pointer;
begin
 //create field cache
 FFieldCache:=TList.Create;
 //initiate map items 
 FMapItems:=0;
 //allocate buffer size
 GetMem(Buffer,FBufferSize);
 //assign and open CSV file
 AssignFile(FFile,FCSVFile);
 SetTextBuf(FFile,Buffer^,FBufferSize);
 Reset(FFile);
 //open table if nessecary
 if FAutoOpen then
  begin
   if Assigned(FBeforeOpenTable) then
    FBeforeOpenTable(Self);
   FDataset.Open;
   if Assigned(FAfterOpenTable) then
    FAfterOpenTable(Self);
  end;
 //export to table from CSV file
 if Assigned(FBeforeExport) then
  FBeforeExport(Self);
 //set the counter to zero
 C:=0;
 Temp:=ShortDateFormat;
 ShortDateFormat:=FDateFormat;
 FDataset.DisableControls;
 while (not Eof(FFile)) and (not FStop) do
  begin
   //read from CSV
   Readln(FFile,RecordString);
   //add new record
   try
    FDataset.Append;
    for i:=1 to CountMapItems do
     if Uppercase(GetMapItem(i,D)) <> Uppercase(FIgnoreStr) then
     case FDataset.FieldByName(GetMapItem(i,D)).DataType of
      ftInteger:
       FDataset.FieldByName(GetMapItem(i,D)).AsInteger:=StrToIntDef(Trim(GetCSVRecordItem(i,RecordString)),FDefaultInt);
      ftFloat:
       begin
        try
         F:=StrToFloat(Trim(GetCSVRecordItem(i,RecordString)));
        except
         F:=FDefaultInt;
        end;
        FDataset.FieldByName(GetMapItem(i,D)).AsFloat:=F;
       end;
      else
       if FTrimData then
        FDataset.FieldByName(GetMapItem(i,D)).AsString:=Trim(GetCSVRecordItem(i,RecordString))
       else
        FDataset.FieldByName(GetMapItem(i,D)).AsString:=GetCSVRecordItem(i,RecordString);
     end;
    //post record
    FDataset.Post;
   except
    on E:Exception do
     if not FSilentExport then
      raise
     else
      if Assigned(FExportError) then
       begin
        FExportError(Self,E.Message,C,ErrorResponse);
        if ErrorResponse = pgcsvAbort then
         Break;
       end;
   end;
   if Assigned(FOnAddRecord) then
    FOnAddRecord(Self);
   if Assigned(FExportProgress) then
    FExportProgress(Self, C, FStop);
   Inc(C);
  end;
 FDataset.EnableControls;
 if Assigned(FAfterExport) then
  FAfterExport(Self);
 //close table if nessecary
 if FAutoOpen then
  begin
   if Assigned(FBeforeCloseTable) then
    FBeforeCloseTable(Self);
   FDataset.Close;
   if Assigned(FAfterCloseTable) then
    FAfterCloseTable(Self);
  end;
 //close CSV file
 CloseFile(FFile);
 //disallocate buffer
 FreeMem(Buffer);
 ShortDateFormat:=Temp;
 //free cache
 for i:=FFieldCache.Count - 1 downto 0 do
  Dispose(FFieldCache.Items[i]);
 FFieldCache.Free;
end;

function TPgCSV.BuildMap:string;
var
 i:Integer;
 S:string;
begin
 S:='';
 for i:=0 to FDataset.FieldCount - 1 do
  S:=S + FFieldIndicator + FDataset.Fields[i].FieldName + FSeprator;
 Delete(S,Length(S),1);
 Result:=S;
end;

procedure TPgCSV.DataSetToCSV;
var
 S,
 D,
 T : string;
 i : Integer;
 C : LongInt;
 B : Boolean;
 Buffer : Pointer;
begin
 //create field cache
 FFieldCache:=TList.Create;
 //initiate map items 
 FMapItems:=0;
 //allocate buffer
 GetMem(Buffer,FBufferSize);
 //assign and open CSV file
 AssignFile(FFile,FCSVFile);
 SetTextBuf(FFile,Buffer^,FBufferSize);
 //empty CSV if nessecary
 if FEmptyTable then
  begin
   if Assigned(FBeforeEmptyTable) then
    FBeforeEmptyTable(Self);
   Rewrite(FFile);
   if Assigned(FAfterEmptyTable) then
    FAfterEmptyTable(Self);
  end
 else
  Append(FFile);
 //open table if nessecary
 if FAutoOpen then
  begin
   if Assigned(FBeforeOpenTable) then
    FBeforeOpenTable(Self);
   FDataset.Open;
   if Assigned(FAfterOpenTable) then
    FAfterOpenTable(Self);
  end;
 //import from table to CSV file
 if Assigned(FBeforeImport) then
  FBeforeImport(Self);
 C:=0;
 FDataset.First;
 if Trim(FCSVMap) = '' then
  FCSVMap:=BuildMap;
 FDataset.DisableControls;
 while (not FDataset.Eof) and (not FStop) do
  begin
   S:='';
   for i:=1 to CountMapItems do
    begin
     D:=GetMapItem(i,B);
     if B then //is it a field definition
       begin
        if FTrimData then
         T:=Trim(FDataset.FieldByName(D).AsString)
        else
         T:=FDataset.FieldByName(D).AsString;
       end 
     else
      T:=D;
     if FUseDelimiter then
      T:=FDelimiter + T + FDelimiter;
     S:=S + T + FSeprator;
    end;
   //delete last seprator 
   Delete(S,Length(S),1);
   Writeln(FFile,S);
   FDataset.Next;
   //call progress event
   if Assigned(FImportProgress) then
    FImportProgress(Self, C, FStop);
   Inc(C);
  end;
 FDataset.EnableControls;  
 if Assigned(FAfterImport) then
  FAfterImport(Self);
 //close table if nessecary
 if FAutoOpen then
  begin
   if Assigned(FBeforeCloseTable) then
    FBeforeCloseTable(Self);
   FDataset.Close;
   if Assigned(FAfterCloseTable) then
    FAfterCloseTable(Self);
  end;
 //close CSV file
 CloseFile(FFile);
 //free buffer
 FreeMem(Buffer);
 //free field cache
 FFieldCache.Free;
end;

//internal methodes
function TPgCSV.CountMapItems:Integer;
begin
 if FMapItems = 0 then
  FMapItems:=WordCount(FCSVMap,FSeprator);
 Result:=FMapItems; 
end;

function TPgCSV.GetMapItem(ItemIndex:Integer;var AField:Boolean):string;
var
 S : string;
 P : ^ShortString;
begin
 if FFieldCache.Count < ItemIndex then
  begin
   S:=ExtractWord(ItemIndex,FCSVMap,FSeprator);
   New(P);
   P^:=S;
   FFieldCache.Add(P);
  end
 else
  S:=ShortString(FFieldCache.Items[ItemIndex - 1]^);
 AField:=True;
 if (Length(S) >= 1) and (S[1] = FFieldIndicator) then
  Result:=Copy(S,2,Length(S) - 1)
 else
  begin
   AField:=False;
   Result:=S;
  end;
end;

function TPgCSV.GetCSVRecordItem(ItemIndex:Integer;CSVRecord:string):string;
var
 S:string;
begin
 if FUseDelimiter then
  S:=ExtractWord(ItemIndex,CSVRecord,FDelimiter + FSeprator + FDelimiter)
 else
  S:=ExtractWord(ItemIndex,CSVRecord,FSeprator);
 if (FUseDelimiter) then
  begin
   if (ItemIndex = 1) and (S[1] = FDelimiter) then
    Delete(S,1,1);
   if (ItemIndex = WordCount(CSVRecord,FDelimiter + FSeprator + FDelimiter)) and (S[Length(S)] = FDelimiter) then
    Delete(S,Length(S),1);
  end; 
 Result:=S;
end;

function TPgCSV.WordPosition(Item: Integer; const S, SubStr: string): Integer;
var
 i,
 Count : Integer;
begin
 Count:=0;
 Result:=0;
 for i:=1 to Length(S) do
  begin
   if Copy(S,i,Length(SubStr)) = SubStr then
    Inc(Count);
   if Count = Item then
    begin
     Result:=i;
     Break;
    end;
  end;
end;

function TPgCSV.ExtractWord(Item: Integer;S, WordDelim: string): string;
var
 First,
 Second:Integer;
begin
 First:=WordPosition(Item - 1,S,WordDelim);
 Second:=WordPosition(Item,S,WordDelim);
 if First = 0 then
   begin Result := ''; exit; end;
 if Second = 0 then
  Second:=Length(S) + Length(WordDelim);
 if First = 1 then
  First:=-Length(WordDelim);
 Result:=Copy(S,First + Length(WordDelim),Second - (First + Length(WordDelim)));
 if Item = 1 then
  Delete(Result,Length(Result),1);
end;

function TPgCSV.WordCount(const S ,WordDelim: string): Integer;
var
 i,
 Count :Integer;
begin
 Count:=0;
 for i:=1 to Length(S) do
  if Copy(S,i,Length(WordDelim)) = WordDelim then
   Inc(Count);
 Result:=Count + 1;
end;

constructor TPgCSV.Create(AOwner: TComponent);
begin
 inherited Create(AOwner);
 FDelimiter:='"';
 FIgnoreStr:='(ignore)';
 FAutoOpen:=True;
 FUseDelimiter:=True;
 FSilentExport:=False;
 FEmptyTable:=False;
 FSeprator:=',';
 FFieldIndicator:='$';
 FDateFormat:='MM/DD/YY';
 FBufferSize:=1024;
 FStop:=False;
end;

procedure Register;
begin
  RegisterComponents('Pragena', [TPgCSV]);
end;

end.
