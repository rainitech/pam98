unit Dm_tlac;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDMTL = class(TDataModule)
    TL1_: TTable;
    DS_TL1: TDataSource;
    DS_TL2a: TDataSource;
    TL2a_: TTable;
    TL1_TLID: TSmallintField;
    TL1_TABULKA: TStringField;
    TL2a_TLID: TSmallintField;
    TL2a_LOGID: TSmallintField;
    TL2a_FYZID: TSmallintField;
    TL2a_NAZOV: TStringField;
    TL2b_: TTable;
    DS_TL2b: TDataSource;
    TL2a_TLACIT: TBooleanField;
    TL2b_TLID: TSmallintField;
    TL2b_LOGID: TSmallintField;
    TL2b_FYZID: TSmallintField;
    TL2b_NAZOV: TStringField;
    TL2b_TLACIT: TBooleanField;
    TL1_POPIS: TStringField;
    TL2a_SIRKA: TSmallintField;
    TL2b_SIRKA: TSmallintField;
    DS_TL2aG: TDataSource;
    TL2a_CALC_POPISOK: TStringField;
    TL2b_CALC_POPISOK: TStringField;
    procedure TL2a_CalcFields(DataSet: TDataSet);
    procedure TL2b_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTL: TDMTL;

implementation

uses Dm_zam;

{$R *.DFM}

procedure TDMTL.TL2a_CalcFields(DataSet: TDataSet);
begin with DMZ do begin
  try
  TL2a_CALC_POPISOK.Value := TZAM_.FieldByName(TL2a_NAZOV.Value).DisplayLabel;
  except
  TL2a_CALC_POPISOK.Value := 'neuvedený';
  end;
end;end;

procedure TDMTL.TL2b_CalcFields(DataSet: TDataSet);
begin with DMZ do begin
  try
  TL2b_CALC_POPISOK.Value := TZAM_.FieldByName(TL2b_NAZOV.Value).DisplayLabel;
  except
  TL2b_CALC_POPISOK.Value := 'neuvedený';
  end;
end;end;

end.
