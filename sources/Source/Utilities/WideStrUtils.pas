unit WideStrUtils;

// WideString Utilities 1.0.1
// Delphi 3/4/5/6/7 and Kylix Implementation
// September 2003
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
// The Original Code is "WideStrUtils.pas".
//
// The Initial Developer of the Original Code is Dieter K�hler (Heidelberg,
// Germany, "http://www.philo.de/"). Portions created by the Initial Developer
// are Copyright (C) 2003 Dieter K�hler. All Rights Reserved.
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
// 2003-09-20 Release of version 1.0.1
//            TranslateWideString function added.
// 2003-08-03 Release of version 1.0.0


interface

uses
  UnicodeUtils, SysUtils, Classes;

type

  TUtilsWideStringItem = record
    FString: WideString;
    FObject: TObject;
  end;

  PUtilsWideStringItemList = ^TUtilsWideStringItemList;
  TUtilsWideStringItemList = array[0..MaxListSize]  of TUtilsWideStringItem;

  TUtilsWideStringList = class(TPersistent)
  private
    FCapacity: Integer;
    FCount: Integer;
    FDuplicates: TDuplicates;
    FList: PUtilsWideStringItemList;
    FSorted: Boolean;
    FUpdateCount: Integer;
    FOnChange: TNotifyEvent;
    FOnChanging: TNotifyEvent;
    procedure ExchangeItems(Index1,
                            Index2: Integer);
    procedure Grow;
    procedure InsertItem(Index: Integer;
                         const S: WideString;
                         AObject: TObject);
    procedure QuickSort(L,
                        R: Integer);
    procedure SetSorted(const Value: Boolean);
  protected
    procedure Changed; virtual;
    procedure Changing; virtual;
    procedure Error(const Msg: string;
                    Data: Integer);
    function Get(Index: Integer): WideString; virtual;
    function GetCapacity: Integer; virtual;
    function GetCount: Integer; virtual;
    function GetObject(Index: Integer): TObject; virtual;
    procedure Put(Index: Integer;
                  const S: WideString); virtual;
    procedure PutObject(Index: Integer;
                        AObject: TObject); virtual;
    procedure SetCapacity(NewCapacity: Integer); virtual;
    procedure SetUpdateState(Updating: Boolean); virtual;
  public
    destructor Destroy; override;
    function Add(S: WideString): Integer; virtual;
    function AddObject(S: WideString; AObject: TObject): Integer; virtual;
    procedure AddWideStrings(Strings: TUtilsWideStringList); virtual;
    procedure Append(S: WideString); virtual;
    procedure Assign(Source: TPersistent); override;
    procedure BeginUpdate; virtual;
    procedure Clear; virtual;
    procedure Delete(Index: Integer); virtual;
    procedure EndUpdate; virtual;
    procedure Exchange(Index1, Index2: Integer); virtual;
    function Find(const S: WideString;
                    var Index: Integer): Boolean; virtual;
    function IndexOf(const S: WideString): Integer; virtual;
    procedure Insert(Index: Integer; const S: WideString); virtual;
    procedure InsertObject(Index: Integer; const S: WideString; AObject: TObject); virtual;
    procedure Sort; virtual;

    property Capacity: Integer read GetCapacity write SetCapacity;
    property Count: Integer read GetCount;
    property Duplicates: TDuplicates read FDuplicates write FDuplicates default dupIgnore;
    property Objects[Index: Integer]: TObject read GetObject write PutObject;
    property Sorted: Boolean read FSorted write SetSorted default False;
    property WideStrings[Index: Integer]: WideString read Get write Put; default;

    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnChanging: TNotifyEvent read FOnChanging write FOnChanging;
  end;

  TUtilsNameValueList = class(TPersistent)
  private
    FNames: TUtilsWideStringList;
    FValues: TUtilsWideStringList;
    procedure Error(const Msg: string;
                    Data: Integer);
    function GetLength: Integer; virtual;
    function GetCapacity: Integer; virtual;
    function GetDuplicates: TDuplicates;
    function GetName(Index: Integer): WideString; virtual;
    function GetObject(Index: Integer): TObject; virtual;
    function GetValue(Index: Integer): WideString; virtual;
    procedure PutObject(Index: Integer;
                        AObject: TObject); virtual;
    procedure SetCapacity(const Value: Integer); virtual;
    procedure SetDuplicates(const Value: TDuplicates);
    procedure SetSorted(const Value: Boolean);
    function GetSorted: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function Add(const Name,
                       Value: WideString): Integer; virtual;
    function AddObject(const Name,
                       Value: WideString;
                       AObject: TObject): Integer; virtual;
    procedure AddNameValueList(const Nvl: TUtilsNameValueList); virtual;
    procedure Assign(Source: TPersistent); override;
    procedure Clear; virtual;
    procedure Delete(const Index: Integer); virtual;
    procedure Exchange(const Index1,
                             Index2: Integer); virtual;
    function IndexOf(const Name,
                           Value: WideString): Integer; virtual;
    function IndexOfName(const Name: WideString): Integer; virtual;
    procedure Insert(const Index: Integer;
                     const Name,
                           Value: WideString); virtual;
    function Find(const Name,
                        Value: WideString;
                    var Index: Integer): Boolean; virtual;
    function FindOfName(const Name: WideString;
                          var Index: Integer): Boolean; virtual;
    procedure Sort; virtual;
    property Capacity: Integer read GetCapacity write SetCapacity;
    property Duplicates: TDuplicates read GetDuplicates write SetDuplicates default dupIgnore;
    property Length: Integer read GetLength;
    property Names[Index: Integer]: WideString read GetName;
    property Objects[Index: Integer]: TObject read GetObject write PutObject;
    property Sorted: Boolean read GetSorted write SetSorted default False;
    property Values[Index: Integer]: WideString read GetValue;
  end;

  TUtilsNameValueTree = class(TUtilsNameValueList)
  private
    FParentTree: TUtilsNameValueTree;
    function GetChild(Index: Integer): TUtilsNameValueTree;
  public
    destructor Destroy; override;
    function AddChild(const Name,
                            Value: WideString;
                      const child: TUtilsNameValueTree): Integer; virtual;
    function AddChildObject(const Name,
                                  Value: WideString;
                            const Child: TUtilsNameValueTree;
                            const AObject: TObject): Integer; virtual;
    procedure Assign(Source: TPersistent); override;
    procedure Clear; override;
    procedure Delete(const Index: Integer); override;
    function HasChild(const Index: Integer): Boolean; virtual;
    function IndexOfChild(const Child: TUtilsNameValueTree): Integer; virtual;
    procedure InsertChild(const Index: Integer;
                          const Name,
                                Value: WideString;
                          const Child: TUtilsNameValueTree); virtual;
    function IsDescendantOf(const Nvtree: TUtilsNameValueTree): Boolean; virtual;
    function ReplaceChild(const Index: Integer;
                          const NewChild: TUtilsNameValueTree): TUtilsNameValueTree; virtual;
    property Children[Index: Integer]: TUtilsNameValueTree read GetChild;
    property ParentTree: TUtilsNameValueTree read FParentTree;
  end;

  TUtilsCustomWideStr = class
  private
    FActualLen: Integer;
    FCapacity: Integer;
    FContent: WideString;
  protected
    function GetWideChars(Index: Integer): WideChar; virtual;
    procedure SetWideChars(Index: Integer;
                           C: WideChar); virtual;
  public
    constructor Create;
    procedure AddUCS4Char(const CodePoint: Longint); virtual;
    procedure AddWideChar(const C: WideChar); virtual;
    procedure AddWideString(const S: WideString); virtual;
    function  EndsWith(const S: WideString): Boolean; virtual;
    function  IsEqual(const S: WideString): Boolean; virtual;
    procedure Clear; virtual;
    function  StartsWith(const S: WideString): Boolean; virtual;
    function  Value: WideString; virtual;
              // Since calling the Value function involves time
              // consuming string copying, always use one of the
              // other TUtilsCustomWideStr access functions, if possible,
              // e.g. WideChars[Index] instead of Value[Index],
              // IsEqual[S] instead of (Value = S), or
              // Length instead of Length(Value).
    property  Length: Integer read FActualLen;
    property  WideChars[Index: Integer]: WideChar read GetWideChars write SetWideChars; default;
  end;

  TUtilsWideStringStream = class(TStream)
  private
    FDataStringP: PChar;
    FSize: Longint;
    FCapacity: Longint;
    FPosition: Longint;
  protected
    procedure SetCapacity(NewCapacity: Longint); virtual;
    procedure SetSize(NewSize: Longint); override;
    procedure SetStringPosition(Value: Longint);
    function GetStringPosition: Longint;
    procedure SetStringLength(Value: Longint);
    function GetStringLength: Longint;
    function GetDataString: WideString;
  public
    constructor Create(const AString: WideString);
    destructor Destroy; override;
    function Read(var Buffer; Count: Longint): Longint; override;
    function ReadString(Count: Longint): WideString;
    function Seek(offset: Longint; Origin: Word): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    procedure WriteString(const AString: WideString);

    property Capacity: Longint Read FCapacity Write SetCapacity;
    property StringLength: Longint Read GetStringLength Write SetStringLength;
    property StringPosition: Longint Read GetStringPosition Write SetStringPosition;
    property DataString: WideString Read GetDataString;
  end;

{ Helper functions }

function CompareWideStr(const S1,
                              S2: WideString): Integer;

function TranslateWideString(const S,
                                   Pattern_1,
                                   Pattern_2: WideString): WideString;

implementation

resourcestring

  // TUtilsWideStringStream error reports
  SCannotReadOddPos    = 'Cannot Read WideString from odd byte position';
  SCannotWriteOddPos   = 'Cannot Write WideString to odd byte position';
  SCapacityLessSize    = 'Capacity cannot be less than size';
  SOddSizeInvalid      = 'Odd size not valid for WideString';
  SNegativeSizeInvalid = 'Negative stream size invalid';
  SOddPosInvalid       = 'Odd byte position not valid for WideString';

  // TUtilsNameValueTree error reports 
  SInuse               = 'Child name-value tree is in use elsewhere';
  SCircularReference   = 'Circular references are not allowed';

  // TUtilsCustomWideStr error reports
  SInvalidCodePoint    = '%d is not a valid ISO-10646-UCS4 code point';

  // TUtilsWideStringList error reports
  SNoDuplicatesAllowed = 'String list does not allow duplicates';
  SIndexOutOfBounds    = 'List Index out of bounds (%d)';
  SOnlyWhenSorted      = 'Operation not allowed on Sorted string list';

{ Helper functions }

function CompareWideStr(const S1,
                              S2: WideString): Integer;
var
  Dif, I, Len, Len2: Integer;
  P1, P2: PWideChar;
begin
  Len := Length(S1);
  Len2 := Length(S2);
  Dif := Len - Len2;
  if Dif > 0 then Len := Len2;

  P1 := PWideChar(S1);
  P2 := PWideChar(S2);
  for I := 1 to Len do begin
    Result := Ord(P1^) - Ord(P2^);
    if Result <> 0 then exit;
    Inc(P1);
    Inc(P2);
  end;
  Result := Dif;
end;

function TranslateWideString(const S, Pattern_1, Pattern_2: WideString): WideString;
var
  I, J, K, L : Integer;
begin
  SetLength(Result, Length(S));
  L := Length(Pattern_2);

  if Length(Pattern_1) > L then begin
    // Character removal is possible:
    K := 0;
    for I := 1 to Length(S) do begin
      J := Pos(S[I], Pattern_1);
      if J > 0 then begin
        if J <= L then begin
          Inc(K);
          Result[K] := Pattern_2[J];
        end;
      end else begin
        Inc(K);
        Result[K] := S[I];
      end;
    end;
    SetLength(Result, K);
  end else
    // Character removal is not possible:
    for I := 1 to Length(S) do begin
      J := Pos(S[I], Pattern_1);
      if J > 0
        then Result[I] := Pattern_2[J]
        else Result[I] := S[I];
    end;
end;

{ TUtilsNameValueList }

constructor TUtilsNameValueList.Create;
begin
  inherited Create;
  FNames := TUtilsWideStringList.Create;
  FValues := TUtilsWideStringList.Create;
end;

destructor TUtilsNameValueList.Destroy;
begin
  FNames.free;
  FValues.free;
  inherited Destroy;
end;

procedure TUtilsNameValueList.Error(const Msg: string;
                                  Data: Integer);
  function ReturnAddr: Pointer;
  asm
          MOV     EAX,[EBP+4]
  end;
begin
  raise EStringListError.CreateFmt(Msg, [Data]) at ReturnAddr;
end;


function TUtilsNameValueList.GetLength: Integer;
begin
  Result := FNames.Count;
end;

function TUtilsNameValueList.GetCapacity: Integer;
begin
  Result := FNames.Capacity;
end;

function TUtilsNameValueList.GetDuplicates: TDuplicates;
begin
  Result := FNames.Duplicates;
end;

function TUtilsNameValueList.GetName(Index: Integer): WideString;
begin
  Result := FNames[Index];
end;

function TUtilsNameValueList.GetSorted: Boolean;
begin
  Result := FNames.Sorted;
end;

function TUtilsNameValueList.GetObject(Index: Integer): TObject;
begin
  Result := FValues.Objects[Integer(FNames.Objects[Index])];
end;

function TUtilsNameValueList.GetValue(Index: Integer): WideString;
begin
  Result := FValues[Integer(FNames.Objects[Index])];
end;

procedure TUtilsNameValueList.PutObject(Index: Integer; AObject: TObject);
begin
  FValues.Objects[Integer(FNames.Objects[Index])] := AObject;
end;

procedure TUtilsNameValueList.SetCapacity(const Value: Integer);
begin
  FNames.Capacity := Value;
  FValues.Capacity := Value;
end;

procedure TUtilsNameValueList.SetDuplicates(const Value: TDuplicates);
begin
  FNames.Duplicates := Value;
end;

procedure TUtilsNameValueList.SetSorted(const Value: Boolean);
begin
  FNames.Sorted := Value;
end;

function TUtilsNameValueList.Add(const Name,
                                       Value: WideString): Integer;
var
  VIndex: Integer;
begin
  VIndex := FValues.Add(Value);
  Result := FNames.AddObject(Name, Pointer(VIndex));
end;

procedure TUtilsNameValueList.AddNameValueList(const Nvl: TUtilsNameValueList);
var
  I: Integer;
begin
  Capacity := Capacity + Nvl.Length;
  with Nvl do
    for I := 0 to Pred(Length) do
      Self.AddObject(Names[I], Values[I], Objects[I]);
end;

function TUtilsNameValueList.AddObject(const Name,
                                             Value: WideString;
                                             AObject: TObject): Integer;
var
  VIndex: Integer;
begin
  VIndex := FValues.AddObject(Value,AObject);
  Result := FNames.AddObject(Name, Pointer(VIndex));
end;

procedure TUtilsNameValueList.Assign(Source: TPersistent);
begin
  if Source is TUtilsNameValueList then begin
    if Source = Self then Exit;
    Clear;
    AddNameValueList(TUtilsNameValueList(Source));
    Exit;
  end;
  inherited Assign(Source);
end;

procedure TUtilsNameValueList.Clear;
begin
  FNames.Clear;
  FValues.Clear;
end;

procedure TUtilsNameValueList.Delete(const Index: Integer);
begin
  FNames.Delete(Index);
end;

procedure TUtilsNameValueList.Exchange(const Index1,
                                           Index2: Integer);
begin
  FNames.Exchange(Index1, Index2);
end;

function TUtilsNameValueList.IndexOf(const Name,
                                           Value: WideString): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Pred(FNames.Count) do begin
    if FNames[I] = Name then
      if FValues[Integer(FNames.Objects[I])] = Value then begin
        Result := I;
        Exit;
      end;
  end;
end;

function TUtilsNameValueList.IndexOfName(const Name: WideString): Integer;
begin
  Result := FNames.IndexOf(Name);
end;

procedure TUtilsNameValueList.Insert(const Index: Integer;
                                     const Name,
                                           Value: WideString);
var
  VIndex: Integer;
begin
  VIndex := FValues.Add(Value);
  FNames.insertObject(Index, Name, Pointer(VIndex));
end;

function TUtilsNameValueList.Find(const Name,
                                        Value: WideString;
                                    var Index: Integer): Boolean;
begin
  if FNames.Duplicates = dupAccept then begin
    Index := IndexOf(Name, Value);
    Result := (Index > -1);
  end else begin
    Result := FNames.Find(Name,Index);
    if Result then begin
      if FValues[Integer(FNames.Objects[Index])] <> Value then begin
        Index := -1;
        Result := False;
      end;
    end;
  end;
end;

function TUtilsNameValueList.FindOfName(const Name: WideString;
                                          var Index: Integer): Boolean;
begin
  Result := FNames.Find(Name, Index);
end;

procedure TUtilsNameValueList.Sort;
begin
  FNames.Sort;
end;



{ TUtilsNameValueTree }

destructor TUtilsNameValueTree.Destroy;
var
  Index: Integer;
begin
  if Assigned(FParentTree)
    then FParentTree.ReplaceChild(FParentTree.IndexOfChild(Self), nil);
  for Index := 0 to Pred(FNames.Count) do
    Children[Index].Free;
  inherited;
end;

function TUtilsNameValueTree.AddChild(const Name,
                                            Value: WideString;
                                      const Child: TUtilsNameValueTree): Integer;
begin
  Result := AddChildObject(Name, Value, Child, nil);
end;

function TUtilsNameValueTree.AddChildObject(const Name, Value: WideString;
  const Child: TUtilsNameValueTree; const AObject: TObject): Integer;
begin
  if Assigned(Child) then begin
    if Assigned(Child.FParentTree)
      then Error(SInuse, 0);
    if IsDescendantOf(Child)
      then Error(SCircularReference, 0);
    Result := Self.AddObject(Name, Value, AObject);
    FValues.Objects[Integer(FNames.Objects[Result])] := Child;
    Child.FParentTree := Self;
  end else Result := AddObject(Name, Value, AObject);
end;

procedure TUtilsNameValueTree.Assign(Source: TPersistent);
var
  I: Integer;
  NewNameValueTree: TUtilsNameValueTree;
begin
  if Source is TUtilsNameValueTree then begin
    if Source = Self then Exit;
    Clear;
    with TUtilsNameValueTree(Source) do
      for I := 0 to Pred(Length) do begin
        if HasChild(I) then begin
          newNameValueTree := TUtilsNameValueTree.Create;
          Self.AddChildObject(Names[I], Values[I], NewNameValueTree, Objects[I]);
          NewNameValueTree.Assign(Children[I]);
        end else Self.AddObject(Names[I], Values[I], Objects[I]);
      end;
    Exit;
  end;
  inherited Assign(Source);
end;

procedure TUtilsNameValueTree.Clear;
var
  Index: Integer;
  Subtree: TUtilsNameValueTree;
begin
  for Index := 0 to Pred(FNames.Count) do begin
    Subtree := Children[Index];
    if Assigned(Subtree) then
      with Subtree do begin
        FParentTree := nil;
        Free;
      end;
  end;
  inherited;
end;

procedure TUtilsNameValueTree.Delete(const Index: Integer);
var
  Subtree: TUtilsNameValueTree;
begin
  Subtree := Children[Index];
  if Assigned(Subtree) then
    with Subtree do begin
      FParentTree := nil;
      Free;
    end;
  inherited;
end;

function TUtilsNameValueTree.GetChild(Index: Integer): TUtilsNameValueTree;
begin
  Result := TUtilsNameValueTree(FValues.Objects[Integer(FNames.Objects[Index])]);
end;

function TUtilsNameValueTree.HasChild(const Index: Integer): Boolean;
begin
  Result := Assigned(FValues.Objects[Integer(FNames.Objects[Index])]);
end;

function TUtilsNameValueTree.IndexOfChild(const Child: TUtilsNameValueTree): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Pred(FNames.Count) do begin
    if FValues.Objects[Integer(FNames.Objects[I])] = Child then begin
      Result := I;
      Exit;
    end;
  end;
end;

procedure TUtilsNameValueTree.InsertChild(const Index: Integer;
                                          const Name,
                                                Value: WideString;
                                          const Child: TUtilsNameValueTree);
begin
  if Assigned(Child) then begin
    if Assigned(Child.FParentTree)
      then Error(SInuse, 0);
    if IsDescendantOf(Child)
      then Error(SCircularReference, 0);
    Insert(Index,Name,Value);
    FValues.Objects[Integer(FNames.Objects[Index])] := Child;
    Child.FParentTree := Self;
  end else Insert(Index, Name, Value);
end;

function TUtilsNameValueTree.IsDescendantOf(const Nvtree: TUtilsNameValueTree): Boolean;
var
  Tree: TUtilsNameValueTree;
begin
  Tree := Self;
  Result := False;
  while Assigned(Tree) do begin
    Tree := Tree.ParentTree;
    if Tree = Nvtree
      then begin Result := True; Exit; end;
  end;
end;

function TUtilsNameValueTree.ReplaceChild(const Index: Integer;
                                          const NewChild: TUtilsNameValueTree): TUtilsNameValueTree;
begin
  if Assigned(NewChild) then begin
    if Assigned(NewChild.FParentTree)
      then Error(SInuse, 0);
    if IsDescendantOf(NewChild)
      then Error(SCircularReference, 0);
    Result := Children[Index];
    if Assigned(Result)
      then Result.FParentTree := nil;
    FValues.Objects[Integer(FNames.Objects[Index])] := NewChild;
    NewChild.FParentTree := Self;
  end else begin
    Result := Children[Index];
    if Assigned(Result)
      then Result.FParentTree := nil;
    FValues.Objects[Integer(FNames.Objects[Index])] := nil;
  end;
end;



{ TUtilsCustomWideStr }

constructor TUtilsCustomWideStr.Create;
begin
  inherited;
  Clear;
end;

function TUtilsCustomWideStr.GetWideChars(Index: Integer): WideChar;
begin
  Result := FContent[Index];
end;

procedure TUtilsCustomWideStr.SetWideChars(Index: Integer;
                                       C: WideChar);
begin
  FContent[Index] := C;
end;

procedure TUtilsCustomWideStr.AddUCS4Char(const CodePoint: Longint);
var
  HighSurrogat, LowSurrogat: WideChar;
begin
  // Remark: For typical XML documents the following nested if statements
  //         appear to be a little faster in Delphi 7 than an equivalent
  //         case statement.
  if CodePoint <= $D7FF then
    AddWideChar(WideChar(CodePoint))
  else if CodePoint <= $DFFF then // Do not accept surrogates
    raise EConvertError.CreateFmt(SInvalidCodePoint,[CodePoint])
  else if CodePoint <= $FFFF then
    AddWideChar(WideChar(CodePoint))
  else begin
    HighSurrogat := Utf16HighSurrogate(CodePoint);
    LowSurrogat := Utf16LowSurrogate(CodePoint);
    AddWideChar(HighSurrogat);
    AddWideChar(LowSurrogat);
  end;
end;

procedure TUtilsCustomWideStr.AddWideChar(const C: WideChar);
begin
  if FActualLen = FCapacity then begin  // Grow
    FCapacity := FCapacity + FCapacity div 4;
    SetLength(FContent,FCapacity);
  end;
  Inc(FActualLen);
  FContent[FActualLen] := C;
end;

procedure TUtilsCustomWideStr.AddWideString(const S: WideString);
var
  I,l: Integer;
begin
  l := System.Length(S);
  while FActualLen+l > FCapacity do begin  // Grow
    FCapacity := FCapacity + FCapacity div 4;
    SetLength(FContent,FCapacity);
  end;
  Inc(FActualLen,l);
  for I := 1 to l do
    FContent[FActualLen-l+I] := WideChar(S[I]);
end;

function  TUtilsCustomWideStr.EndsWith(const S: WideString): Boolean;
var
  I, Offset, SLength: Integer;
begin
  SLength := System.Length(S);
  Offset := FActualLen - SLength;
  if (Offset < 0) or (SLength = 0)
    then begin Result := False; Exit; end;
  I := 1;
  repeat
    Result := FContent[I + Offset] = S[I];
    Inc(I);
  until (not Result) or (I > sLength);
end;

function  TUtilsCustomWideStr.IsEqual(const S: WideString): Boolean;
var
  I, SLength: Integer;
begin
  SLength := System.Length(S);
  if FActualLen <> SLength
    then begin Result := False; Exit; end;
  if SLength = 0
    then begin Result := True; Exit; end;
  I := 1;
  repeat
    Result := FContent[I] = S[I];
    Inc(I);
  until (not Result) or (I > SLength);
end;

procedure TUtilsCustomWideStr.Clear;
begin
  FCapacity := 64;
  SetLength(FContent, FCapacity);
  FActualLen := 0;
end;

function  TUtilsCustomWideStr.StartsWith(const S: WideString): Boolean;
var
  I, SLength: Integer;
begin
  SLength := System.Length(S);
  if (FActualLen < SLength) or (SLength = 0)
    then begin Result := False; Exit; end;
  I := 1;
  repeat
    Result := FContent[I] = S[I];
    Inc(I);
  until (not Result) or (I > SLength);
end;

function TUtilsCustomWideStr.Value: WideString;
begin
  SetLength(Result, FActualLen);
  Move(Pointer(FContent)^, Pointer(Result)^, FActualLen shl 1);
end;



{ TUtilsWideStringList }

// The code of this class is based on Delphi's TStringList class

destructor TUtilsWideStringList.Destroy;
begin
  FOnChange := nil;
  FOnChanging := nil;
  inherited Destroy;
  if FCount <> 0 then Finalize(FList^[0], FCount);
  FCount := 0;
  SetCapacity(0);
end;

function TUtilsWideStringList.Add(S: WideString): Integer;
begin
  Result := AddObject(S, nil);
end;

function TUtilsWideStringList.AddObject(S: WideString;
                                        AObject: TObject): Integer;
begin
  if not Sorted then
    Result := FCount
  else
    if Find(S, Result) then
      case Duplicates of
        dupIgnore: Exit;
        dupError: Error(SNoDuplicatesAllowed, 0);
      end;
  InsertItem(Result, S, AObject);
end;

procedure TUtilsWideStringList.AddWideStrings(Strings: TUtilsWideStringList);
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := 0 to Pred(Strings.Count) do
      AddObject(Strings[I],Strings.Objects[I]);
  finally
    EndUpdate;
  end;
end;

procedure TUtilsWideStringList.Append(S: WideString);
begin
  Add(S);
end;

procedure TUtilsWideStringList.Assign(Source: TPersistent);
begin
  if Source is TUtilsWideStringList then begin
    if Source = Self then Exit;
    BeginUpdate;
    try
      Clear;
      AddWideStrings(TUtilsWideStringList(Source));
    finally
      EndUpdate;
    end;
    Exit;
  end;
  inherited Assign(Source);
end;

procedure TUtilsWideStringList.BeginUpdate;

begin
  if FUpdateCount = 0 then SetUpdateState(True);
  Inc(FUpdateCount);
end;

procedure TUtilsWideStringList.changed;
begin
  if (FUpdateCount = 0) and Assigned(FOnChange) then FOnChange(Self);
end;

procedure TUtilsWideStringList.changing;
begin
  if (FUpdateCount = 0) and Assigned(FOnChanging) then FOnChanging(Self);
end;

procedure TUtilsWideStringList.Clear;
begin
  if FCount <> 0 then begin
    Changing;
    Finalize(FList^[0], FCount);
    FCount := 0;
    SetCapacity(0);
    Changed;
  end;
end;

procedure TUtilsWideStringList.Delete(Index: Integer);
begin
  if (Index < 0) or (Index >= FCount) then Error(SIndexOutOfBounds, Index);
  Changing;
  Finalize(FList^[Index]);
  Dec(FCount);
  if Index < FCount then
    System.Move(FList^[Index + 1], FList^[Index],
      (FCount - Index) * SizeOf(TUtilsWideStringItem));
  Changed;
end;

procedure TUtilsWideStringList.EndUpdate;
begin
  Dec(FUpdateCount);
  if FUpdateCount = 0 then SetUpdateState(False);
end;

procedure TUtilsWideStringList.Error(const Msg: string;
                                         Data: Integer);
  function ReturnAddr: Pointer;
  asm
          MOV     EAX,[EBP+4]
  end;
begin
  raise EStringListError.CreateFmt(Msg, [Data]) at ReturnAddr;
end;

procedure TUtilsWideStringList.Exchange(Index1,
                                        Index2: Integer);
begin
  if (Index1 < 0) or (Index1 >= FCount) then Error(SIndexOutOfBounds, Index1);
  if (Index2 < 0) or (Index2 >= FCount) then Error(SIndexOutOfBounds, Index2);
  Changing;
  ExchangeItems(Index1, Index2);
  Changed;
end;

procedure TUtilsWideStringList.ExchangeItems(Index1,
                                           Index2: Integer);
var
  Temp: Integer;
  Item1, Item2: ^TUtilsWideStringItem;
begin
  Item1 := @FList^[Index1];
  Item2 := @FList^[Index2];
  Temp := Integer(Item1^.FString);
  Integer(Item1^.FString) := Integer(Item2^.FString);
  Integer(Item2^.FString) := Temp;
  Temp := Integer(Item1^.FObject);
  Integer(Item1^.FObject) := Integer(Item2^.FObject);
  Integer(Item2^.FObject) := Temp;
end;

function TUtilsWideStringList.Find(const S: WideString;
                                   var Index: Integer): Boolean;
var
  L, H, I, C: Integer;
begin
  Result := False;
  L := 0;
  H := FCount - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := CompareWideStr(FList^[I].FString, S);
    if C < 0 then L := I + 1 else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Result := True;
        if Duplicates <> dupAccept then L := I;
      end;
    end;
  end;
  Index := L;
end;

function TUtilsWideStringList.Get(Index: Integer): WideString;
begin
  if (Index < 0) or (Index >= FCount) then Error(SIndexOutOfBounds, Index);
  Result := FList^[Index].FString;
end;

function TUtilsWideStringList.GetCapacity: Integer;
begin
  Result := FCapacity;
end;

function TUtilsWideStringList.GetCount: Integer;
begin
  Result := FCount;
end;

function TUtilsWideStringList.GetObject(Index: Integer): TObject;
begin
  if (Index < 0) or (Index >= FCount) then Error(SIndexOutOfBounds, Index);
  Result := FList^[Index].FObject;
end;

procedure TUtilsWideStringList.grow;
var
  Delta: Integer;
begin
  if FCapacity > 64 then Delta := FCapacity div 4 else
    if FCapacity > 8 then Delta := 16 else
      Delta := 4;
  SetCapacity(FCapacity + Delta);
end;

function TUtilsWideStringList.IndexOf(const S: WideString): Integer;
begin
  if not Sorted then begin
    for Result := 0 to GetCount - 1 do
      if CompareWideStr(FList^[Result].FString, S) = 0 then Exit;
    Result := -1;
  end else
    if not Find(S, Result) then Result := -1;
end;

procedure TUtilsWideStringList.Insert(Index: Integer;
                                    const S: WideString);
begin
  InsertObject(Index, S, nil);
end;

procedure TUtilsWideStringList.insertObject(Index: Integer;
                                          const S: WideString;
                                          AObject: TObject);
begin
  if Sorted then Error(SOnlyWhenSorted, 0);
  if (Index < 0) or (Index > FCount) then Error(SIndexOutOfBounds, Index);
  InsertItem(Index, S, AObject);
end;

procedure TUtilsWideStringList.InsertItem(Index: Integer;
                                          const S: WideString;
                                          AObject: TObject);
begin
  Changing;
  if FCount = FCapacity then Grow;
  if Index < FCount then
    System.Move(FList^[Index], FList^[Index + 1],
      (FCount - Index) * SizeOf(TUtilsWideStringItem));
  with FList^[Index] do
  begin
    Pointer(FString) := nil;
    FObject := AObject;
    FString := S;
  end;
  Inc(FCount);
  Changed;
end;

procedure TUtilsWideStringList.Put(Index: Integer;
                                   const S: WideString);
begin
  if Sorted then Error(SOnlyWhenSorted, 0);
  if (Index < 0) or (Index >= FCount) then Error(SIndexOutOfBounds, Index);
  Changing;
  FList^[Index].FString := S;
  Changed;
end;

procedure TUtilsWideStringList.PutObject(Index: Integer;
                                         AObject: TObject);
begin
  if (Index < 0) or (Index >= FCount) then Error(SIndexOutOfBounds, Index);
  Changing;
  FList^[Index].FObject := AObject;
  Changed;
end;

procedure TUtilsWideStringList.QuickSort(L,
                                         R: Integer);
var
  I, J: Integer;
  P: WideString;
begin
  repeat
    I := L;
    J := R;
    P := FList[(L + R) shr 1].FString;
    repeat
      while CompareWideStr(FList^[I].FString, P) < 0 do Inc(I);
      while CompareWideStr(FList^[J].FString, P) > 0 do Dec(J);
      if I <= J then begin
        ExchangeItems(I, J);
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then QuickSort(L, J);
    L := I;
  until I >= R;
end;

procedure TUtilsWideStringList.SetCapacity(NewCapacity: Integer);
begin
  ReallocMem(FList, NewCapacity * SizeOf(TUtilsWideStringItem));
  FCapacity := NewCapacity;
end;

procedure TUtilsWideStringList.SetSorted(const Value: Boolean);
begin
  if FSorted <> Value then begin
    if Value then Sort;
    FSorted := Value;
  end;
end;

procedure TUtilsWideStringList.SetUpdateState(updating: Boolean);
begin
  if Updating then Changing else Changed;
end;

procedure TUtilsWideStringList.Sort;
begin
  if not Sorted and (FCount > 1) then begin
    Changing;
    QuickSort(0, FCount - 1);
    Changed;
  end;
end;



{ TUtilsWideStringStream }

// Provided by Karl Waclawek.
//
// This is a stream interface for WideStrings.
// Purpose: Avoid excessive memory re-allocations that occur with
//          WideStrings because they are not reference counted.
//  Note: When the DataString property is accessed, the complete
//        WideString will be copied out.

constructor TUtilsWideStringStream.Create(const AString: WideString);
begin
  inherited Create;
  SetSize(Length(AString) shl 1);
  Move(Pointer(AString)^, FDataStringP^, FSize);  // Make a copy of AString.
end;

destructor TUtilsWideStringStream.Destroy;
begin
  FreeMem(FDataStringP);
  inherited Destroy;
end;

function TUtilsWideStringStream.GetDataString: WideString;
begin
  SetLength(Result, StringLength);
  Move(FDataStringP^, Pointer(Result)^, FSize);
end;

function TUtilsWideStringStream.Read(var Buffer; Count: Longint): Longint;
begin
  Result := FSize - FPosition;
  if Result > Count then Result := Count;
  Move((FDataStringP + FPosition)^, Buffer, Result);
  Inc(FPosition, Result);
end;

function TUtilsWideStringStream.Write(const Buffer; Count: Longint): Longint;
var
  NewPos: Longint;
begin
  Result := Count;
  NewPos := FPosition + Result;
  if NewPos > FSize
    then SetSize(((NewPos + 1) shr 1) shl 1); // Next larger even Value
  Move(Buffer, (FDataStringP + FPosition)^, Result);
  FPosition := NewPos;
end;

function TUtilsWideStringStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
  case Origin of
    soFromBeginning: FPosition := Offset;
    soFromCurrent: FPosition := FPosition + Offset;
    soFromEnd: FPosition := FSize - Offset;
  end;
  if FPosition > FSize then FPosition := FSize
  else if FPosition < 0 then FPosition := 0;
  Result := FPosition;
end;

function TUtilsWideStringStream.ReadString(Count: Longint): WideString;
// Reads Count WideChars from stream and returns them as WideString.
var
  Len: Longint;
begin
  if Odd(FPosition) then raise EReadError.Create(SCannotReadOddPos);
  Len := (FSize - FPosition) shr 1;
  if Len > Count then Len := Count;
  SetLength(Result, Len);
  Read(Pointer(Result)^, Len shl 1);
end;

procedure TUtilsWideStringStream.WriteString(const AString: WideString);
// Writes AString into stream, starting at StringPosition, overwriting
// existing characters and extending the stream if necessary.
begin
  if Odd(FPosition) then raise EWriteError.Create(SCannotWriteOddPos);
  Write(Pointer(AString)^, Length(AString) shl 1);
end;

procedure TUtilsWideStringStream.SetCapacity(NewCapacity: Longint);
// Sets stream Capacity in bytes.
begin
  if NewCapacity < FSize then raise EStreamError.Create(SCapacityLessSize);
  ReallocMem(FDataStringP, NewCapacity);
  FCapacity := NewCapacity;
end;

procedure TUtilsWideStringStream.SetSize(NewSize: Longint);
// Sets stream size in bytes.
var
  Delta: Longint;
begin
  if Odd(NewSize) then raise EStreamError.Create(SOddSizeInvalid);
  if NewSize > Capacity then begin
    Delta := NewSize shr 2;
    if Delta < 8 then Delta := 8;
    SetCapacity(((NewSize + Delta) shr 2) shl 2); // Make it a multiple of 4
  end else
    if NewSize < 0 then raise EStreamError.Create(SNegativeSizeInvalid);
  FSize := NewSize;
  if FPosition > FSize then FPosition := FSize;
end;

procedure TUtilsWideStringStream.SetStringPosition(Value: Longint);
// Sets string position in terms of WideChars.
begin
  Position := (Value - 1) shl 1;
end;

function TUtilsWideStringStream.GetStringPosition: Longint;
// Sets string position in terms of WideChars.
begin
  if Odd(Position) then raise EStreamError.Create(SOddPosInvalid);
  Result := (Position shr 1) + 1;
end;

procedure TUtilsWideStringStream.SetStringLength(Value: Longint);
// Sets string Length in terms of WideChars.
begin
  SetSize(Value shl 1);
end;

function TUtilsWideStringStream.GetStringLength: Longint;
// Gets string Length in terms of WideChars.
begin
  Result := FSize shr 1;
end;

end.
