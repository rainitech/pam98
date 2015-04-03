unit FmxUtils;

interface

uses SysUtils, Windows, Classes, Consts, IniFiles;

type
  EInvalidDest = class(EStreamError);
  EFCantMove = class(EStreamError);

Function File_Dir(                
  Action            : String;  {COPY, DELETE, MOVE, RENAME}
  RenameOnCollision : Boolean; {Renames if directory exists}
  NoConfirmation    : Boolean; {Responds "Yes to All" to any dialogs}
  Silent            : Boolean; {No progress dialog is shown}
  ShowProgress      : Boolean; {displays progress dialog but no file
                                names}
  FromDir           : String;  {From directory}
  ToDir             : String   {To directory}
  ): Boolean;

procedure DelTree(FolderName: String; AllowRecovery: Boolean; var Uspech:boolean);
procedure CopyFile(const FileName, DestName: string);
procedure MoveFile(const FileName, DestName: string);
function GetFileSize(const FileName: string): LongInt;
function FileDateTime(const FileName: string): TDateTime;
function HasAttr(const FileName: string; Attr: Word): Boolean;
function ExecuteFile(const FileName, Params, DefaultDir: string;
  ShowCmd: Integer): THandle;
function ExecuteFileX(const FileName, Params, DefaultDir: string;
  ShowCmd: Integer): integer;
function WinExecAndWait32(FileName: string; Visibility: Integer): dWord;
procedure ExecNewProcess(ProgramName : String; Wait: Boolean);
function StartAssociatedExe(FileName: string; var ErrorCode: longint): Boolean;
function GetShortFilename(const FileName: TFileName): TFileName;

implementation

uses Forms, ShellAPI;

const
  SInvalidDest = 'Destination %s does not exist';
  SFCantMove = 'Cannot move file %s';

{$IFDEF TEST}
var
  LogIniFile:TIniFile;
  LogRow:word;
{$ENDIF}


Function File_Dir(
  Action            : String;  {COPY, DELETE, MOVE, RENAME}
  RenameOnCollision : Boolean; {Renames if directory exists}
  NoConfirmation    : Boolean; {Responds "Yes to All" to any dialogs}
  Silent            : Boolean; {No progress dialog is shown}
  ShowProgress      : Boolean; {displays progress dialog but no file
                                names}
  FromDir           : String;  {From directory}
  ToDir             : String   {To directory}
  ): Boolean;
var
  SHFileOpStruct : TSHFileOpStruct;
  FromBuf, ToBuf: Array [0..255] of Char;
begin
Try
{
  If Not DirectoryExists(FromDir) Then
  Begin
    Result := False;
    Exit;
  End;
}  
  Fillchar(SHFileOpStruct, Sizeof(SHFileOpStruct), 0 );
  FillChar(FromBuf,        Sizeof(FromBuf),        0 );
  FillChar(ToBuf,          Sizeof(ToBuf),          0 );
  StrPCopy(FromBuf,        FromDir);
  StrPCopy(ToBuf,          ToDir);
  With SHFileOpStruct Do
  Begin
    Wnd    := 0;
    If UpperCase(Action) = 'COPY'   Then wFunc := FO_COPY;
    If UpperCase(Action) = 'DELETE' Then wFunc := FO_DELETE;
    If UpperCase(Action) = 'MOVE'   Then wFunc := FO_MOVE;
    If UpperCase(Action) = 'RENAME' Then wFunc := FO_RENAME;
    pFrom  := @FromBuf;
    pTo    := @ToBuf;
    fFlags := FOF_ALLOWUNDO or FOF_FILESONLY;
    If RenameOnCollision Then fFlags := fFlags or FOF_RENAMEONCOLLISION;
    If NoConfirmation    Then fFlags := fFlags or FOF_NOCONFIRMATION;
    If Silent            Then fFlags := fFlags or FOF_SILENT;
    If ShowProgress      Then fFlags := fFlags or FOF_SIMPLEPROGRESS;
    if wFunc = FO_COPY   Then fFlags := fFlags or FOF_NoConfirmMkDir;
  End;
  Result := (SHFileOperation(SHFileOpStruct) = 0)
            and (SHFileOpStruct.fAnyOperationsAborted=false);
Except
  Result := False;
End;
End;

procedure DelTree(FolderName: String; AllowRecovery: Boolean; var Uspech:boolean);
var
  shfo: TSHFileOpStruct;
begin
  Fillchar(shfo,Sizeof(shfo),0) ;
  with shfo do
  begin
    wFunc := FO_DELETE;
    pFrom := PChar(FolderName + #0 + #0);
    pTo := nil;
    fFlags := FOF_NOCONFIRMATION {or FOF_SILENT};
    if AllowRecovery then
    fFlags := FOF_NOCONFIRMATION {or FOF_SILENT} or FOF_ALLOWUNDO
  end;
  Uspech := SHFileOperation(shfo)=0;
{
  var
  SHFileOpStruct : TSHFileOpStruct;
  DirBuf : array [0..255] of char;
begin
  try
   Fillchar(SHFileOpStruct,Sizeof(SHFileOpStruct),0) ;
   FillChar(DirBuf, Sizeof(DirBuf), 0 ) ;
   StrPCopy(DirBuf, DirName) ;
   with SHFileOpStruct do begin
    Wnd := 0;
    pFrom := @DirBuf;
    wFunc := FO_DELETE;
    fFlags := FOF_ALLOWUNDO;
    fFlags := fFlags or FOF_NOCONFIRMATION;
    fFlags := fFlags or FOF_SILENT;
   end;
    Result := (SHFileOperation(SHFileOpStruct) = 0) ;
   except
    Result := False;
  end;
end;
}
end;

procedure CopyFile(const FileName, DestName: TFileName);
var
  CopyBuffer: Pointer; { buffer for copying }
  BytesCopied: Longint;
  Source, Dest: Integer; { handles }
  Destination: TFileName; { holder for expanded destination name }
const
  ChunkSize: Longint = 8192; { copy in 8K chunks }
begin
  Destination := ExpandFileName(DestName); { expand the destination path }
  if HasAttr(Destination, faDirectory) then { if destination is a directory... }
    Destination := Destination + '\' + ExtractFileName(FileName); { ...clone file name }
  GetMem(CopyBuffer, ChunkSize); { allocate the buffer }
  try
    Source := FileOpen(FileName, fmShareDenyWrite); { open source file }
    if Source < 0 then raise EFOpenError.CreateFmt(SFOpenError, [FileName]);
    try
      Dest := FileCreate(Destination); { create output file; overwrite existing }
      if Dest < 0 then raise EFCreateError.CreateFmt(SFCreateError, [Destination]);
      try
        repeat
          BytesCopied := FileRead(Source, CopyBuffer^, ChunkSize); { read chunk }
          if BytesCopied > 0 then { if we read anything... }
            FileWrite(Dest, CopyBuffer^, BytesCopied); { ...write chunk }
        until BytesCopied < ChunkSize; { until we run out of chunks }
      finally
        FileClose(Dest); { close the destination file }
      end;
    finally
      FileClose(Source); { close the source file }
    end;
  finally
    FreeMem(CopyBuffer, ChunkSize); { free the buffer }
  end;
end;

{ MoveFile procedure }
{
  Moves the file passed in FileName to the directory specified in DestDir.
  Tries to just rename the file.  If that fails, try to copy the file and
  delete the original.

  Raises an exception if the source file is read-only, and therefore cannot
  be deleted/moved.
}

procedure MoveFile(const FileName, DestName: string);
var
  Destination: string;
begin
  Destination := ExpandFileName(DestName); { expand the destination path }
  if not RenameFile(FileName, Destination) then { try just renaming }
  begin
    if HasAttr(FileName, faReadOnly) then  { if it's read-only... }
      raise EFCantMove.Create(Format(SFCantMove, [FileName])); { we wouldn't be able to delete it }
    CopyFile(FileName, Destination); { copy it over to destination...}
    SysUtils.DeleteFile(FileName); { ...and delete the original }
  end;
end;

{ GetFileSize function }
{
  Returns the size of the named file without opening the file.  If the file
  doesn't exist, returns -1.
}

function GetFileSize(const FileName: string): LongInt;
var
  SearchRec: TSearchRec;
begin
  if FindFirst(ExpandFileName(FileName), faAnyFile, SearchRec) = 0 then
    Result := SearchRec.Size
  else Result := -1;
end;

function FileDateTime(const FileName: string): System.TDateTime;
begin
  Result := FileDateToDateTime(FileAge(FileName));
end;

function HasAttr(const FileName: string; Attr: Word): Boolean;
begin
  Result := (FileGetAttr(FileName) and Attr) = Attr;
end;

function ExecuteFile(const FileName, Params, DefaultDir: string;
  ShowCmd: Integer): THandle;
var
  zFileName, zParams, zDir: array[0..255] of Char;
begin
  Result := ShellExecute(Application.MainForm.Handle, nil,
    StrPCopy(zFileName, FileName), StrPCopy(zParams, Params),
    StrPCopy(zDir, DefaultDir), ShowCmd);
end;

function ExecuteFileX(const FileName, Params, DefaultDir: string;
  ShowCmd: Integer): integer;
var
  SEInfo: TShellExecuteInfo;
  ProcHandle: Thandle;
begin
{$IFDEF TEST}
  LogRow:=LogRow+1;
  LogIniFile.WriteString('EXECUTE','RIADOK'+IntToStr(LogRow),FileName+' '+Params);
{$ENDIF}
try
  Application.MainForm.Visible:=False;
  ProcHandle := 0;
  FillChar(SEInfo, SizeOf(SEInfo), 0);
  SEInfo.cbSize := SizeOf(TShellExecuteInfo);
  with SEInfo do begin
    fMask := SEE_MASK_NOCLOSEPROCESS;
    Wnd := Application.Handle;
    lpFile := PChar(FileName);
    if Params<>'' then lpParameters := PChar(Params);
    if DefaultDir<>'' then lpDirectory := PChar(DefaultDir);
    nShow := ShowCmd;
  end;
  if ShellExecuteEx(@SEInfo) then begin
    ProcHandle := SEInfo.HProcess;
    repeat
      Application.ProcessMessages;
      GetExitCodeProcess(SEInfo.hProcess, ExitCode);
    until (ExitCode <> STILL_ACTIVE) or
	   Application.Terminated;
{    CloseHandle(SEInfo.hThread);}
{
    while WaitForSingleObject(SEInfo.hProcess, 50) <> WAIT_OBJECT_0 do
     Application.ProcessMessages;
}
    Result := GetLastError;
    CloseHandle(ProcHandle);
  end
  else Result:=-1;
finally
  Application.MainForm.Visible:=True;
  Application.MainForm.Show;
end;
end;

function WinExecAndWait32(FileName: string; Visibility: Integer): dWord;
var
  zAppName: array[0..512] of Char;
  zCurDir: array[0..255] of Char;
  WorkDir: string;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  StrPCopy(zAppName, FileName);
  GetDir(0, WorkDir);
  StrPCopy(zCurDir, WorkDir);
  FillChar(StartupInfo, Sizeof(StartupInfo), #0);
  StartupInfo.cb := Sizeof(StartupInfo);

  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  if not CreateProcess(zAppName,
           nil, { pointer to command line string }
           nil, { pointer to process security attributes }
           nil, { pointer to thread security attributes }
           false, { handle inheritance flag }
           CREATE_NEW_CONSOLE or { creation flags }
           NORMAL_PRIORITY_CLASS,
           nil, { pointer to new environment block }
           nil, { pointer to current directory name }
           StartupInfo, { pointer to STARTUPINFO }
           ProcessInfo) then
    Result := -1 { pointer to PROCESS_INF }
  else
  begin
    WaitforSingleObject(ProcessInfo.hProcess, INFINITE);
    GetExitCodeProcess(ProcessInfo.hProcess, Result);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
  end;
end;

procedure ExecNewProcess(ProgramName : String; Wait: Boolean);
var
  StartInfo : TStartupInfo;
  ProcInfo : TProcessInformation;
  CreateOK : Boolean;
begin
    { fill with known state }
  FillChar(StartInfo,SizeOf(TStartupInfo),#0);
  FillChar(ProcInfo,SizeOf(TProcessInformation),#0);
  StartInfo.cb := SizeOf(TStartupInfo);
  CreateOK := CreateProcess(nil, PChar(ProgramName), nil, nil,False,
              CREATE_NEW_PROCESS_GROUP+NORMAL_PRIORITY_CLASS,
              nil, nil, StartInfo, ProcInfo);
    { check to see if successful }
  if CreateOK then
    begin
        //may or may not be needed. Usually wait for child processes
      if Wait then
        WaitForSingleObject(ProcInfo.hProcess, INFINITE);
    end;
  CloseHandle(ProcInfo.hProcess);
  CloseHandle(ProcInfo.hThread);
end;

function StartAssociatedExe(FileName: string; var ErrorCode: longint): Boolean;
var
  Prg: string;
  ProcessInfo: TProcessInformation;
  StartupInfo: TStartupInfo;
begin
  SetLength(Prg, MAX_PATH);
  Result := False;
  ErrorCode := FindExecutable(PChar(FileName), nil, PChar(Prg));
  if ErrorCode >= 32 then
  begin
    SetLength(Prg, StrLen(PChar(Prg)));
    FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
    with StartupInfo do
    begin
      cb := SizeOf(TStartupInfo);
      wShowWindow := SW_SHOW;
    end;
    if CreateProcess(PChar(Prg), PChar(Format('%s %s', [Prg, FileName])),
      nil, nil, False, NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo) then
    begin
      WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
      GetExitCodeProcess(ProcessInfo.hProcess, ErrorCode);
      CloseHandle(ProcessInfo.hProcess);
      CloseHandle(ProcessInfo.hThread);
      Result := True;
    end
    else
      ErrorCode := GetLastError;
  end;
end;

function GetShortFilename(const FileName: TFileName): TFileName;
var
  buffer: array[0..MAX_PATH-1] of char;
begin
  SetString(Result, buffer, GetShortPathName(
    pchar(FileName), buffer, MAX_PATH-1));
end;

begin
{$IFDEF TEST}
  LogIniFile:=TIniFile.Create('C:\PAM98LOG.INI');
  LogRow:=0;
{$ENDIF}
end.
