program Dbcomp;

uses Db,DbTables,MyConsts,SysUtils;

var
 T1: TTable;
 T2: TTable;

function dbtyp(x:TFieldType):string;
begin
  case x of
  ftUnknown:      Result:='Unknown';
  ftString:       Result:='Alpha';
  ftSmallint:     Result:='Smallint';
  ftInteger:      Result:='Integer';
  ftWord:         Result:='Word';
  ftBoolean:      Result:='Logical';
  ftFloat:        Result:='Number';
  ftCurrency:     Result:='$(Money)';
  ftBCD:          Result:='BCD';
  ftDate:         Result:='Date';
  ftTime:         Result:='Time';
  ftDateTime:     Result:='DateTime';
  ftBytes:        Result:='Bytes';
  ftVarBytes:     Result:='Varbytes';
  ftAutoInc:      Result:='Autoinc';
  ftBlob:         Result:='Blob';
  ftMemo:         Result:='Memo';
  ftGraphic:      Result:='Graophic';
  ftFmtMemo:      Result:='FmtMemo';
  ftParadoxOle:   Result:='Paradox OLE';
  ftDBaseOle:     Result:='DBase OLE';
  ftTypedBinary:  Result:='Typed binary';
  ftCursor:       Result:='Cursor';
  else            Result:='';
  end;
end;

procedure WriteStruc(T:TTable);
var i:integer;
begin
  if T.TableName='' then exit;
  try
  T.Open;
  for i:=0 to T.FieldCount-1 do with T.Fields[i] do
  writeln(Rpad(DisplayName,12,' '),Rpad(dbtyp(DataType),10,' '),Rpad(IntToStr(DataSize),10,' '));
  finally
  T.Close;
  end;
end;

procedure Compare(T1,T2:TTable);
var i:integer;min,max:integer;MaxT:TTable;
begin
  if T1.TableName='' then exit;
  if T2.TableName='' then exit;
  try
  T1.Open;
  T2.Open;
  writeln('Comparing '+T1.TableName+'('+IntToSTr(T1.FieldCount)+') & '
                      +T2.TableName+'('+IntToSTr(T2.FieldCount)+') ...');
  if T1.FieldCount>T2.FieldCount then begin
    min:=T2.FieldCount;max:=T1.FieldCount;MaxT:=T1;
  end else
  begin
    min:=T1.FieldCount;max:=T2.FieldCount;MaxT:=T2;
  end;
  for i:=0 to min-1 do
  begin
    if (T1.Fields[i].DisplayName<>T2.Fields[i].DisplayName) or
       (T1.Fields[i].DataType<>T2.Fields[i].DataType) or
       (T1.Fields[i].DataSize<>T2.Fields[i].DataSize)
    then begin
      writeln(T1.TableName);
      with T1.Fields[i] do
      writeln(i+1:3,' ',Rpad(DisplayName,20,' '),Rpad(dbtyp(DataType),10,' '),Rpad(IntToStr(DataSize),10,' '));
      writeln(T2.TableName);
      with T2.Fields[i] do
      writeln(i+1:3,' ',Rpad(DisplayName,20,' '),Rpad(dbtyp(DataType),10,' '),Rpad(IntToStr(DataSize),10,' '));
    end;
  end;
  for i:=min to max-1 do with MaxT.Fields[i] do
  begin
      writeln(MaxT.TableName);
      writeln(i+1:3,' ',Rpad(DisplayName,20,' '),Rpad(dbtyp(DataType),10,' '),Rpad(IntToStr(DataSize),10,' '));
  end;
  finally
  T1.Close;
  T2.Close;
  end;
end;

begin
 DBTables.Session.AddPassword(MyPassword(MyDbPassword));
 T1:=TTable.Create(nil);
 T2:=TTable.Create(nil);
 T1.TableName:='adr1\'+ParamStr(1);
 T2.TableName:='adr2\'+ParamStr(1);
 if T1.TableName='' then begin
   writeln('Missing parameter');exit;
 end;
 Compare(T1,T2);
end.
