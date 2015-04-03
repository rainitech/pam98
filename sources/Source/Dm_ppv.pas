unit Dm_ppv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDMP = class(TDataModule)
    TPPV_: TTable;
    DS_PPV: TDataSource;
    DS_PGRID: TDataSource;
    TPPV_CODE_EMP: TIntegerField;
    TPPV_PID: TAutoIncField;
    TPPV_NASTUP: TDateField;
    TPPV_VYSTUP: TDateField;
    TPPV_TYP: TSmallintField;
    TPPV_R1: TStringField;
    TPPV_R2: TStringField;
    TPPV_R3: TStringField;
    TPPV_R4: TStringField;
    TPPV_R5: TStringField;
    TPPV_R6: TStringField;
    TPPV_R7: TStringField;
    TPPV_R8: TStringField;
    TPPV_MIESTO: TStringField;
    TPPV_DATUM: TDateField;
    TPPV_R9: TStringField;
    TPPV_R10: TStringField;
    TPPV_R11: TStringField;
    TPPV_R12: TStringField;
    procedure TPPV_NewRecord(DataSet: TDataSet);
    procedure DS_PPVStateChange(Sender: TObject);
    procedure DS_PGRIDDataChange(Sender: TObject; Field: TField);
    procedure TPPV_BeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMP: TDMP;

implementation

uses Dm_main, Dm_zam, Main, MyConsts, Dm_vypl;

{$R *.DFM}

procedure TDMP.TPPV_NewRecord(DataSet: TDataSet);
begin
  TPPV_Code_emp.Value:=DMZ.TZAM_Code_emp.Value;
end;

procedure TDMP.DS_PPVStateChange(Sender: TObject);
begin with DMZ do begin
  if TPPV_.State in [dsInsert,dsEdit] then
  begin
    DS_PGRID.Enabled := False;
    DS_ZAMF.Enabled := False;
  end else
  begin
    DS_PGRID.Enabled := True;
    DS_ZAMF.Enabled := True;
  end;
end;end;

procedure TDMP.DS_PGRIDDataChange(Sender: TObject; Field: TField);
begin if FormMain<>nil then with FormMain do begin
  if PC_PPV<>nil then
  begin
    if TPPV_TYP.AsString='' then PC_PPV.ActivePage:=PAGE_PPV_EMPTY
    else
    case TPPV_TYP.Value of
      0,10:PC_PPV.ActivePage:=PAGE_PPV_ZML;
      1,11:PC_PPV.ActivePage:=PAGE_PPV_DVP;
      2,12:PC_PPV.ActivePage:=PAGE_PPV_DPC;
      3,13:PC_PPV.ActivePage:=PAGE_PPV_DBPS;
        14:PC_PPV.ActivePage:=PAGE_PPV_ZMLD;
      else PC_PPV.ActivePage:=PAGE_PPV_EMPTY;
    end;
  end;
end;end;

procedure TDMP.TPPV_BeforeDelete(DataSet: TDataSet);
begin
  if MyOtazka(SMyCisDeleteQuestion) then exit;
  raise EMyError.Create(SMyCisDeleteStopped);
end;

end.
