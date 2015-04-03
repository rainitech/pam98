unit DM_sql;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

const
  Max_Results=100;
  Max_Rows=100;
  Max_Cols=10;

type
  TDMSQL = class(TDataModule)
    Q1_: TQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    results:array[1..Max_Results] of string[64];
    hodnoty:array[1..Max_Rows,1..Max_Cols] of string[64];
    Akt_Rows,Akt_Cols:longint;
    procedure ExecuteSql(sql:string);
  end;
  TDMSQL2 = class(TDMSQL)
  end;

var
  DMSQL: TDMSQL;
  DMSQL2: TDMSQL;
  DMSQL3: TDMSQL;

implementation

{$R *.DFM}

procedure TDMSQL.ExecuteSql(sql:string);
var i,r,m:integer;
begin
  Akt_Rows:=0;
  Akt_Cols:=0;
  Q1_.sql.Clear;
  Q1_.sql.Add(sql);
  Q1_.prepare;
  if UpperCase(Copy(sql,1,6))<>'SELECT' then begin
    Q1_.ExecSQL;
    Q1_.Close;
    exit;
  end;
  try
  Q1_.open;
  r:=0;
  m:=Q1_.FieldCount;
  Akt_Cols:=m;
  if m>Max_Cols then m:=Max_Cols;
  if NOT(Q1_.EOF) then
  repeat
    inc(r);
    for i:=1 to Max_Cols do hodnoty[r,i]:='';
    for i:=0 to m-1 do if (Q1_.Fields[i] is TFloatField) then hodnoty[r,i+1]:=FloatToStr(Q1_.Fields[i].Value)
      else hodnoty[r,i+1]:=Q1_.Fields[i].AsString;
    Q1_.Next;
  until (Q1_.EOF) or (r>=Max_Rows);
  Akt_Rows := r;
  for i:=1 to Akt_Rows do Results[i]:=hodnoty[1,i];
  finally
    Q1_.close;
  end;
end;

end.
