unit ParserUtils;

// TreeUtils 1.0.2
// Delphi 3/4/5/6/7 and Kylix Implementation
// January 2004
//
//
// LICENSE
//
// The contents of this file are subject to the Mozilla Public License Version
// 1.1 (the "License"); you may not use this file except in compliance with
// the License. You may obtain a copy of the License at
// "http://www.mozilla.org/MPL/"
//
// Software distributed under the License is distributed on an "AS IS" basis,
// WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
// the specific language governing rights and limitations under the License.
//
// The Original Code is "ParserUtils.pas".
//
// The Initial Developer of the Original Code is Dieter Köhler (Heidelberg,
// Germany, "http://www.philo.de/"). Portions created by the Initial Developer
// are Copyright (C) 2003 Dieter Köhler. All Rights Reserved.
//
// Alternatively, the contents of this file may be used under the terms of the
// GNU General Public License Version 2 or later (the "GPL"), in which case the
// provisions of the GPL are applicable instead of those above. If you wish to
// allow use of your version of this file only under the terms of the GPL, and
// not to allow others to use your version of this file under the terms of the
// MPL, indicate your decision by deleting the provisions above and replace them
// with the notice and other provisions required by the GPL. If you do not delete
// the provisions above, a recipient may use your version of this file under the
// terms of any one of the MPL or the GPL.

// HISTORY
//
// 2004-01-04 Release of version 1.0.2
//            TUtilsInputSource.Create: ColumnOffset parameter added.
//            TUtilsAutoDetectInputSource.Create: ColumnOffset parameter added.
//            TUtilsCustomReader.BufSize protected property added.
//            TUtilsCustomWriter.BufSize protected property added.
// 2003-11-16 Release of version 1.0.1
//            TUtilsInputSource.SkipNext is now a function.
// 2003-08-03 Release of version 1.0.0

interface

uses
  UnicodeUtils, WideStrUtils, SysUtils, Classes;

type
  TUtilsCustomReader = class
  protected
    FStream: TStream;
    FBuffer: PChar;
    FPosition: Integer;
    FRemaining: Integer;
    FBufSize: Integer;
    procedure FlushBuffer; virtual;
    function GetPosition: Longint;
    function Read(  var Buf;
                  const Count: Longint): Boolean; virtual;
    procedure SetPosition(Value: Integer);
    property BufSize: Integer read FBufSize;
    property Position: Longint read GetPosition write SetPosition;
  public
    constructor Create(const Stream: TStream;
                       const BufSize: Integer);
    destructor Destroy; override;
  end;

  TUtilsCustomWriter = class
  protected
    FStream: TStream;
    FBuffer: PChar;
    FPosition: Integer;
    FBufSize: Integer;
    procedure FlushBuffer; virtual;
    function GetPosition: Longint;
    procedure SetPosition(Value: Integer);
    procedure Write(const Buf;
                    const Count: Longint); virtual;
    property BufSize: Integer read FBufSize;
    property Position: Longint read GetPosition write SetPosition;
  public
    constructor Create(const Stream: TStream;
                       const BufSize: Integer);
    destructor Destroy; override;
  end;

  TUtilsInputSource = class(TUtilsCustomReader)
  private
    FCurrentCP: Longint;
    FEncoding: TdomEncodingType;
    FLine: Integer;
    FNextCP: Longint;
    FNormalizeLF: Boolean;
    FPreviousCP: Longint;
    FReadAhead: Longint; // Buffer storage for CR-LF normalization
    FRegularChars: Integer;
    FTabsInLine: Integer;
    FTabWidth: Integer;
    function GetBof: Boolean;
    function GetEof: Boolean;
    function GetInternalNextCodePoint: Longint;
    procedure UpdateLocator(CP: Longint);
  protected
    FCharToUTF16ConvFunc: TCharToUTF16ConvFunc;
    FResetPosition: Int64;
    FResetLine: Longint;
    FResetColumn: Longint;
    function GetColumn: Integer; virtual;
    function GetLine: Integer; virtual;
    function GetStreamAsWideString: WideString; virtual;
    function ReadNextUCS4CodePoint: Integer; virtual;
    procedure SetEncoding(Value: TdomEncodingType); virtual;
    procedure SetTabWidth(const Value: Integer); virtual;
    property Column: Integer read GetColumn;
    property Line: Integer read GetLine;
    property NormalizeLineFeed: Boolean read FNormalizeLF write FNormalizeLF; // Default is 'True'.
    property TabWidth: Integer read FTabWidth write SetTabWidth default 4;
  public
    constructor Create(const Stream: TStream;
                       const LineOffset,
                             ColumnOffset,
                             BufSize: Integer;
                       const AEncoding: TdomEncodingType);
    function Match(Ucs2Str: WideString): Boolean; virtual;
    procedure Next; virtual;
    procedure Reset; virtual;
    function SkipNext(Ucs2Str: WideString): Integer; virtual;

    property Bof: Boolean read GetBof;
    property CurrentCodePoint: Longint read FCurrentCP;
    property Encoding: TdomEncodingType read FEncoding;
    property Eof: Boolean read GetEof;
    property NextCodePoint: Longint read FNextCP;
    property PreviousCodePoint: Longint read FPreviousCP;
    property StreamAsWideString: WideString read GetStreamAsWideString;
  end;

  TUtilsBOMType = (bomNone, bomUTF16BE, bomUTF16LE, bomUTF8);

  TUtilsAutoDetectInputSource = class(TUtilsInputSource)
  private
    FBOMType: TUtilsBOMType;
    function ByteOrderMarkOf(const Stream: TStream): TUtilsBOMType;
  public
    constructor Create(const Stream: TStream;
                       const LineOffset,
                             ColumnOffset,
                             BufSize: Integer;
                       const AEncoding: TdomEncodingType);
    property ByteOrderMarkType: TUtilsBOMType Read FBOMType;
  end;

resourcestring
  SEncodingNotSupported = 'Encoding scheme not supported.';
  SInvalidUCS2 = 'Invalid ISO-10646-UCS-2 encoding at position %d';
  SInvalidUTF16BE = 'Invalid UTF-16BE sequence at position %d';
  SInvalidUTF16LE = 'Invalid UTF-16LE sequence at position %d';
  SInvalidUTF8 = 'Invalid UTF-8 sequence at position %d';
  SStreamNotSpecifiedError = 'Stream not specified.';

implementation

{ TUtilsCustomReader }

// TUtilsCustomReader was provided by Robert Marquardt.
// Modifications in TdomCustomReader.Read() by Dieter Köhler.

constructor TUtilsCustomReader.Create(const Stream: TStream;
                                      const BufSize: Integer);
begin
  inherited Create;
  FStream    := Stream;
  FBufSize   := BufSize;
  FPosition  := 0;
  FRemaining := 0;
  GetMem(FBuffer, BufSize);
end;

destructor TUtilsCustomReader.Destroy;
begin
  FlushBuffer;
  FreeMem(FBuffer);
  inherited;
end;

procedure TUtilsCustomReader.FlushBuffer;
begin
  FStream.Position:= FStream.Position - FRemaining;
  FRemaining := 0;
  FPosition  := 0;
end;

function TUtilsCustomReader.GetPosition: Longint;
begin
  Result := FStream.Position - FRemaining;
end;

function TUtilsCustomReader.Read(var Buf; const Count: Longint): Boolean;
var
  S, D: PChar;
  I: Integer;
begin
  Result:= True;

  if Count <= FRemaining then begin
    S := FBuffer + FPosition;
    D := @Buf;
    for I := Pred(Count) downto 0 do
      D[I] := S[I];
    Inc(FPosition, Count);
    Dec(FRemaining, Count);
    Exit;
  end else FlushBuffer;

  if Count > FBufSize then begin
    if FStream.Read(Buf, Count) = 0
      then Result:= False;
    Exit;
  end;

  if FRemaining = 0 then begin
    FRemaining := FStream.Read(FBuffer^, FBufSize);
    if FRemaining = 0 then begin
      Result:= False;
      Exit;
    end;
    FPosition := 0;
  end;

  S := FBuffer + FPosition;
  D := @Buf;
  for I := Pred(Count) downto 0 do
    D[I] := S[I];

  Inc(FPosition, Count);
  Dec(FRemaining, Count);
end;

procedure TUtilsCustomReader.SetPosition(Value: longint);
begin
  FStream.Position:= Value;
  FRemaining := 0;
  FPosition  := 0;
end;

{ TUtilsCustomWriter }

// TUtilsCustomWriter was provided by Robert Marquardt

constructor TUtilsCustomWriter.Create(const Stream: TStream;
                                    const BufSize: Integer);
begin
  inherited Create;
  FStream := Stream;
  GetMem(FBuffer, BufSize);
  FPosition := 0;
  FBufSize := BufSize;
end;

destructor TUtilsCustomWriter.Destroy;
begin
  FlushBuffer;
  FreeMem(FBuffer);
  inherited;
end;

procedure TUtilsCustomWriter.FlushBuffer;
begin                                        
  FStream.Write(FBuffer[0], FPosition);
  FPosition := 0;
end;

function TUtilsCustomWriter.GetPosition: Longint;
begin
  Result := FStream.Position + FPosition;
end;

procedure TUtilsCustomWriter.SetPosition(Value: Longint);
begin
  FlushBuffer;
  FStream.Position := Value;
end;

procedure TUtilsCustomWriter.Write(const Buf;
                                 const Count: Longint);
var
  S, D: PChar;
  I: Integer;
begin
  if FPosition + Count <= FBufSize then
  begin
    S := @Buf;
    D := FBuffer + FPosition;
    for I := Pred(Count) downto 0 do
      D[I] := S[I];
    Inc(FPosition, Count);
    Exit;
  end
  else
    FlushBuffer;
  if Count > FBufSize then
    FStream.Write(Buf, Count)
  else
  begin
    S := @Buf;
    D := FBuffer + FPosition;
    for I := Pred(Count) downto 0 do
      D[I] := S[I];
    Inc(FPosition, Count);
  end;
end;

{ TUtilsInputSource }

constructor TUtilsInputSource.Create(const Stream: TStream;
  const LineOffset, ColumnOffset, BufSize: Integer; const AEncoding:
  TdomEncodingType);
// Creation fails if the source stream's first character (if any) cannot be
// converted from the specified encoding to a UCS4 code point, because the
// call to GetInternalNextCodePoint() raises an EConvertError exception.
begin
  if not Assigned(Stream)
    then raise EStreamError.Create(SStreamNotSpecifiedError);
  inherited Create(Stream, BufSize);
  SetEncoding(AEncoding);
  FReadAhead := -1;
  FLine := LineOffset;
  FRegularChars := ColumnOffset;
  FNormalizeLF := True;
  FTabWidth := 4;
  FResetPosition := Stream.Position;
  FResetLine := LineOffset;
  FResetColumn := ColumnOffset;
  FPreviousCP := $98;  // START OF STRING
  FCurrentCP  := $98;  // START OF STRING
  FNextCP := GetInternalNextCodePoint;
end;

function TUtilsInputSource.GetBof: Boolean;
begin
  Result := CurrentCodePoint = $98;  // START OF STRING
end;

function TUtilsInputSource.GetColumn: Integer;
begin
  Result := FRegularChars + (FTabsInLine * TabWidth);
end;

function TUtilsInputSource.GetEof: Boolean;
begin
  Result :=  CurrentCodePoint = $9C;  // STRING TERMINATOR
end;

function TUtilsInputSource.GetInternalNextCodePoint: Longint;
// Raises an EConvertError exception via the call to ReadNextUCS4CodePoint(),
// if the next character of the source stream cannot be converted (according
// to the source's character encoding scheme) to a UCS4 code point.
const
  CR = $0D;
  LF = $0A;
begin
  if FReadAhead > -1 then begin
    Result := FReadAhead;
    FReadAhead := -1;
  end else Result := ReadNextUCS4CodePoint;

  // Adjust line breaks to Linux-style breaks with a single LINE FEED character:
  if (Result = CR) and NormalizeLineFeed then begin
    FReadAhead := ReadNextUCS4CodePoint;
    if FReadAhead = LF then FReadAhead := -1;
    Result := LF;
  end;
end;

function TUtilsInputSource.GetLine: Integer;
begin
  Result := FLine;
end;

function TUtilsInputSource.GetStreamAsWideString: WideString;
// Raises an EConvertError exception via the call to Next(), if the source
// stream contain a character that cannot be converted (according to the
// source's character encoding scheme) to a UCS4 code point.
var
  Content: TUtilsCustomWideStr;
  TempReadAhead: Longint;
  TempPosition: Longint;
  TempPreviousCP: Longint;
  TempCurrentCP: Longint;
  TempNextCP: Longint;
  TempLine: Longint;
  TempRegularChars: Longint;
  TempTabsInLine: Longint;
begin
  // Bookmark current state:
  TempReadAhead := FReadAhead;
  TempPosition := Position;
  TempPreviousCP := FPreviousCP;
  TempCurrentCP := FCurrentCP;
  TempNextCP := FNextCP;
  TempLine := FLine;
  TempRegularChars := FRegularChars;
  TempTabsInLine := FTabsInLine;

  Content := TUtilsCustomWideStr.create;
  try
    Reset;
    Next;
    while not Eof do begin
      Content.AddUCS4Char(CurrentCodePoint);
      Next;
    end;
    Result:= Content.value;
  finally

    // Roleback to bookmarked state:
    FReadAhead := TempReadAhead;
    Position := TempPosition;
    FPreviousCP := TempPreviousCP;
    FCurrentCP := TempCurrentCP;
    FNextCP := TempNextCP;
    FLine := TempLine;
    FRegularChars := TempRegularChars;
    FTabsInLine := TempTabsInLine;

    Content.Free;
  end;
end;

function TUtilsInputSource.Match(Ucs2Str: WideString): Boolean;
// Raises an EConvertError exception via the call to Next(), if the next
// character of the source stream cannot be converted (according to the
// source's character encoding scheme) to a UCS4 code point.
const
  STRING_TERMINATOR = $9C;
var
  I: Integer;
begin
  for I := 1 to Length(Ucs2Str) do begin
    Next;
    if CurrentCodePoint <> Ord(Ucs2Str[I]) then begin
      Result := False;
      Exit; // Missmatch found.
    end;
  end;
  Result := True;
end;

procedure TUtilsInputSource.Next;
// Raises an EConvertError exception via the call to GetInternalNextCodePoint(),
// if the next character of the source stream cannot be converted (according
// to the source's character encoding scheme) to a UCS4 code point.
const
  STRING_TERMINATOR = $9C;
var
  TempNextCP: Longint;
begin
  if FCurrentCP = STRING_TERMINATOR then Exit;
  if FNextCP    = STRING_TERMINATOR then begin
    FPreviousCP := FCurrentCP;
    FCurrentCP := FNextCP;
    Exit;
  end;
  TempNextCP := GetInternalNextCodePoint;
     // We use a temporary code point, so that the properties of TUtilsInputSource
     // remain unchanged if GetInternalNextCodePoint() raises an exception here.
  FPreviousCP := FCurrentCP;
  FCurrentCP := FNextCP;
  FNextCP := TempNextCP;
  UpdateLocator(FCurrentCP);
end;

function TUtilsInputSource.ReadNextUCS4CodePoint: Longint;
// Raises an EConvertError exception if the next character of the source
// stream contains code that cannot be converted (according to the source's
// character encoding scheme) to a UCS4 code point.
//
// If the end of the source stream is reached, $9C (STRING TERMINATOR) is
// returned.
const
  MaxCode: array[1..6] of Integer = ($7F,$7FF,$FFFF,$1FFFFF,$3FFFFFF,$7FFFFFFF);
var
  B, CharSize, Mask: Byte;
  LowSurrogate: Word;
  First: Byte;
begin
  Result := 0;
   // Result must be initialized, because the Read(Result, 2) call below does
   // not fill the whole variable!

  case FEncoding of

    etUTF_16BE:
    begin
      if not Read(Result, 2) then begin Result := $9C; Exit; end;
      case Result of
        $D800..$DBFF: // High surrogate of Unicode character [$10000..$10FFFF]
          begin
            if not Read(LowSurrogate, 2)
              then raise EConvertError.CreateFmt(SInvalidUTF16BE, [Position]);
            case LowSurrogate of
              $DC00..$DFFF:
                Result := ((Result - $D7C0) shl 10) + (LowSurrogate xor $DC00);
            else
              raise EConvertError.CreateFmt(SInvalidUTF16BE,[Position - 1]);
            end;
          end;
        $DC00..$DFFF: // Low surrogate of Unicode character [$10000..$10FFFF]
          raise EConvertError.CreateFmt(SInvalidUTF16BE, [Position - 1]);
      end;
    end;

    etUTF_8:
    begin
      if not Read(B, 1) then begin Result := $9C; Exit; end;
      Result := B;
      if Result >= $80 then begin // UTF-8 sequence
        CharSize := 1;
        First := B;
        Mask := $40;
        if (B and $C0 <> $C0) then
          raise EConvertError.CreateFmt(SInvalidUTF8, [Position - 1]);
        while (Mask and First <> 0) do begin
          if not Read(B, 1)
            then raise EConvertError.CreateFmt(SInvalidUTF8, [Position]);
          if (B and $C0) <> $80 then
            raise EConvertError.CreateFmt(SInvalidUTF8, [Position - 1]);
          Result := (Result shl 6) or (B and $3F); // Add bits to Result
          inc(CharSize);      // Increase sequence length
          Mask := Mask shr 1;	// Adjust Mask
        end;
        if CharSize > 6  // No 0 bit in sequence header 'First'
          then raise EConvertError.CreateFmt(SInvalidUTF8, [Position - 1]);
        Result := Result and MaxCode[CharSize];	// dispose of header bits
        // Check for invalid sequence as suggested by RFC2279
        if ((CharSize > 1) and (Result <= MaxCode[CharSize - 1])) then
            raise EConvertError.CreateFmt(SInvalidUTF8, [Position - 1]);
      end;
    end;

    etUTF_16LE:
    begin
      if not Read(Result, 2) then begin Result := $9C; Exit; end;
      Result := Swap(Result);
      case Result of
        $D800..$DBFF: // High surrogate of Unicode character [$10000..$10FFFF]
          begin
            if not Read(LowSurrogate, 2)
              then raise EConvertError.CreateFmt(SInvalidUTF16LE, [Position]);
            LowSurrogate:= Swap(LowSurrogate);
            case LowSurrogate of
              $DC00..$DFFF:
                Result := ((Result - $D7C0) shl 10) + (LowSurrogate xor $DC00);
            else
              raise EConvertError.CreateFmt(SInvalidUTF16LE, [Position - 1]);
            end;
          end;
        $DC00..$DFFF: // Low surrogate of Unicode character [$10000..$10FFFF]
          raise EConvertError.CreateFmt(SInvalidUTF16LE, [Position - 1]);
      end;
    end;

    etISO_10646_UCS_2:
    begin
      if not Read(Result, 2) then begin Result := $9C; Exit; end;
      case Result of
        $D800..$DFFF: // Do not accept surrogates
          raise EConvertError.CreateFmt(SInvalidUCS2,[Position - 1]);
      end;
    end;

  else

    if not Read(B, 1) then begin Result := $9C; Exit; end; // End of Stream.
    if not Assigned(FCharToUTF16ConvFunc)
      then raise EConvertError.Create(SEncodingNotSupported);
    Result := Ord(FCharToUTF16ConvFunc(B));

  end; {case ...}
end;

procedure TUtilsInputSource.Reset;
begin
  Position := FResetPosition;
  FPreviousCP := $98;  // START OF STRING
  FCurrentCP  := $98;  // START OF STRING
  FNextCP := GetInternalNextCodePoint;
  FLine := FResetLine;
  FRegularChars := FResetColumn;
  FTabsInLine := 0;
  FReadAhead := -1;
end;

procedure TUtilsInputSource.SetEncoding(Value: TdomEncodingType);
begin
  FEncoding := Value;
  FCharToUTF16ConvFunc:= GetCharToUTF16ConvFunc(Value);
end;

procedure TUtilsInputSource.SetTabWidth(const Value: Integer);
begin
  FTabWidth := Value;
end;

function TUtilsInputSource.SkipNext(Ucs2Str: WideString): Integer;
// Raises an EConvertError exception via the call to Next(), if the next
// character of the source stream cannot be converted (according to the
// source's character encoding scheme) to a UCS4 code point.
const
  STRING_TERMINATOR = $9C;
var
  I: Integer;
begin
  Result := 0;
  Next;
  if CurrentCodePoint = STRING_TERMINATOR then Exit;
  for I := 1 to Length(Ucs2Str) do
    if CurrentCodePoint = Ord(Ucs2Str[I]) then begin
      Result := SkipNext(Ucs2Str);
      Inc(Result);
      Exit;
    end;
end;

procedure TUtilsInputSource.UpdateLocator(CP: Longint);
begin
  case CP of
    $A: begin // LF
      Inc(FLine);
      FRegularChars := 0;
      FTabsInLine := 0;
    end;
    $9: Inc(FTabsInLine); // TAB
  else
    Inc(FRegularChars);
  end;
end;

{ TUtilsAutoDetectInputSource }

constructor TUtilsAutoDetectInputSource.Create(const Stream: TStream;
  const LineOffset, ColumnOffset, BufSize: Integer; const AEncoding:
  TdomEncodingType);
begin
  if not assigned(Stream)
    then raise EStreamError.create('Stream not specified.');
  FBOMType := ByteOrderMarkOf(Stream);
  case FBOMType of
    bomNone: begin
      inherited Create(Stream, LineOffset, ColumnOffset, BufSize, AEncoding);
    end;
    bomUTF16BE: begin
      with Stream do Position := Position + 2; // Skip BOM
      inherited Create(Stream, LineOffset, ColumnOffset, BufSize, etUTF_16BE);
    end;
    bomUTF16LE: begin
      with Stream do Position := Position + 2; // Skip BOM
      inherited Create(Stream, LineOffset, ColumnOffset, BufSize, etUTF_16LE);
    end;
    bomUTF8: begin
      with Stream do Position := Position + 3; // Skip BOM
      inherited Create(Stream, LineOffset, ColumnOffset, BufSize, etUTF_8);
    end;
  end;
end;

function TUtilsAutoDetectInputSource.ByteOrderMarkOf(
  const Stream: TStream): TUtilsBOMType;
var
  W: Word;
  B: Byte;
  Temp: longint;
begin
  Result := bomNone;
  with Stream do begin
    Temp := Position;
    try
      if Read(W, 2) = 2 then
        case W of
          $FEFF: Result := bomUTF16BE;
          $FFFE: Result := bomUTF16LE;
          $EFBB:
            if Read(B, 1) = 1 then
              if B = $BF then
                Result := bomUTF8;
        end;
    finally
      Position:= Temp; // Reset stream position.
    end;
  end;
end;

end.
