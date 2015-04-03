unit Dm_hp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDMHP = class(TDataModule)
    Q0A_: TQuery;
    Q0B_: TQuery;
    Q0C_: TQuery;
    THP1_: TTable;
    THP1_HPID: TIntegerField;
    THP1_POR_CISLO: TIntegerField;
    THP1_CISLO_U: TStringField;
    THP1_BANKA_U: TStringField;
    THP1_DATUM_SPLATNOSTI: TDateField;
    THP2_: TTable;
    THP2_HPID: TIntegerField;
    THP2_SUMA: TCurrencyField;
    THP2_CISLO_U: TStringField;
    THP2_BANKA_U: TStringField;
    THP2_SSYM: TStringField;
    THP2_KSYM: TStringField;
    THP2_VSYM: TStringField;
    DS_HP1: TDataSource;
    DS_HP2: TDataSource;
    DS_HP1G: TDataSource;
    DS_HP2G: TDataSource;
    Q0A_poradie: TStringField;
    Q0A_sporenie: TCurrencyField;
    Q0A_predcislo_u: TStringField;
    Q0A_cislo_u: TStringField;
    Q0A_banka_u: TStringField;
    Q0A_ssym_u: TStringField;
    Q0A_ksym: TStringField;
    Q0A_vsym: TStringField;
    Q0B_poradie: TStringField;
    Q0B_sporenie: TCurrencyField;
    Q0B_predcislo_u: TStringField;
    Q0B_cislo_u: TStringField;
    Q0B_banka_u: TStringField;
    Q0B_ssym_u: TStringField;
    Q0B_ksym: TStringField;
    Q0B_vsym: TStringField;
    Q0C_poradie: TStringField;
    Q0C_suma: TCurrencyField;
    Q0C_predcislo_u: TStringField;
    Q0C_cislo_u: TStringField;
    Q0C_banka_u: TStringField;
    Q0C_ssym_u: TStringField;
    Q0C_ksym: TStringField;
    Q0C_vsym: TStringField;
    Q0B_ne_zaloha: TCurrencyField;
    Q0B_born_numb: TStringField;
    Q0A_buid_typ: TStringField;
    Q0A_buid_kod: TSmallintField;
    Q0B_surname: TStringField;
    Q0B_name: TStringField;
    Q0C_name: TStringField;
    Q0C_surname: TStringField;
    Q0C_pozn: TStringField;
    THP2_STRANA: TSmallintField;
    THP1_IBAN: TStringField;
    THP2_IBAN: TStringField;
    Q0B_iban: TStringField;
    Q0A_iban: TStringField;
    Q0C_iban: TStringField;
    procedure THP1_NewRecord(DataSet: TDataSet);
    procedure THP2_NewRecord(DataSet: TDataSet);
    procedure THP2_BeforeInsert(DataSet: TDataSet);
    procedure THP1_BeforeDelete(DataSet: TDataSet);
    procedure THP2_BeforeDelete(DataSet: TDataSet);
    procedure DS_HP1StateChange(Sender: TObject);
    procedure DS_HP2StateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMHP: TDMHP;

implementation

uses DM_sql, Dm_main, MyConsts;

{$R *.DFM}

procedure TDMHP.THP1_NewRecord(DataSet: TDataSet);
var s:string;
begin
  DMSQL.ExecuteSql('select max(hpid)+1 from ":pam98_data:hp1"');
  s:=DMSQL.results[1];
  if s=''
   then THP1_HPID.Value:=1
     else THP1_HPID.Value:=StrToInt(s);
  THP1_Cislo_u.Value := LongCisloU(DM.TINF_Predcislo_u.Value,DM.TINF_Cislo_u.Value);
  THP1_Banka_u.Value := DM.TINF_Banka_u.Value;
  THP1_Por_cislo.Value := 1;
  THP1_IBAN.Value := DM.TINF_IBAN.Value;
end;

procedure TDMHP.THP2_NewRecord(DataSet: TDataSet);
begin
  THP2_HPID.Value := THP1_HPID.Value;
end;

procedure TDMHP.THP2_BeforeInsert(DataSet: TDataSet);
begin
 if THP1_HPID.AsString='' then
   raise EMyError.Create(SMyAppChybaHlavickaHP);
end;

procedure TDMHP.THP1_BeforeDelete(DataSet: TDataSet);
var s:string;
begin
  if not MyOtazka(SMyCisDeleteQuestion) then
    raise EMyError.Create(SMyCisDeleteStopped);
  if not MyOtazka(SMyAppNaozajVymazatHromPrikaz) then
    raise EMyError.Create(SMyCisDeleteStopped);
  s:='delete from ":pam98_data:hp2" where hpid='+THP1_HPID.AsString;
  DMSQL.ExecuteSql(s);
end;

procedure TDMHP.THP2_BeforeDelete(DataSet: TDataSet);
begin
  if not MyOtazka(SMyCisDeleteQuestion) then
    raise EMyError.Create(SMyCisDeleteStopped);
end;

procedure TDMHP.DS_HP1StateChange(Sender: TObject);
begin
  if THP1_.State in [dsInsert,dsEdit] then
  begin
    DS_HP1G.Enabled := False;
    DS_HP2G.Enabled := False;
  end else
  begin
    DS_HP1G.Enabled := True;
    DS_HP2G.Enabled := True;
  end;
end;

procedure TDMHP.DS_HP2StateChange(Sender: TObject);
begin
  if THP2_.State in [dsInsert,dsEdit] then
  begin
    DS_HP1G.Enabled := False;
    DS_HP2G.Enabled := False;
  end else
  begin
    DS_HP1G.Enabled := True;
    DS_HP2G.Enabled := True;
  end;
end;


end.
