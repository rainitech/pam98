unit DM_ALL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables,
  Dm_main, Dm_zam, Dm_vypl;

type
  TDMA = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DisableDataSources;
  end;

const
 MyDBX = 41;

var
  DMA: TDMA;
  MyDB:array[1..MyDBX] of TTable;
  MyDN:array[1..MyDBX] of string[32];


const
 MyMeno:array[1..MyDBX] of string[20]=
 (
  'TPRIV_',
  'TSYS_',
  'TINF_',
  'CIS0_',
  'CIS1_',
  'CIS2_',
  'CIS3_',
  'CIS4_',
  'CIS5_',
  'CIS6_',
  'CIS7_',
  'CIS8_',
  'CIS9_',
  'CIS10_',
  'CIS11_',
  'CIS12_',
  'CIS13_',
  'CIS14_',
  'TSET_',
  'TDZP_',
  'TDET_',
  'TRZP_',
  'TPPV_',
  'TZRZ_',
  'TZRV_',
  'TNEP_',
  'TDOCH_',
  'TCUK_',
  'TZUK_',
  'THSU_',
  'TTLA_',
  'TELDP_',
  'TVYP_',
  'TVYPNP_',
  'TZAM_',
  'TZP1_',
  'TZP2_',
  'TZP3_',
  'TZP4_',
  'TZP5_',
  'CIS15_'
 );

procedure MyDB_Init;
procedure MyDB_CloseAll;
function MyDB_Open(iAlias:string):boolean;

implementation

uses MyConsts, Dm_ppv, DBIProcs, DBITypes, DM_sql;

{$R *.DFM}

function GetAliasInfo_szPhyName(const iAlias:string): string;
var
  DbDes: DBDesc;
(*
  StringList.Add('Driver Name: '+szDbType);
  StringList.Add('AliasName: '+szName);
  StringList.Add('Text: '+szText);
  StringList.Add('Physical Name/Path: '+szPhyName);
*)
begin
  Check(DbiGetDatabaseDesc(PChar(iAlias), @DbDes));
  Result:=DbDes.szPhyName;
end;

procedure MyDB_Init;
var i:integer;x:TComponent;
begin
for i:=1 to MyDBX do begin
   x:=DMZ.FindComponent(MyMeno[i]);
   if x=nil then x:=DMV.FindComponent(MyMeno[i]);
   if x=nil then x:=DM.FindComponent(MyMeno[i]);
   if x=nil then x:=DMP.FindComponent(MyMeno[i]);
   if x=nil then MyError('nenasiel'+MyMeno[i])
   else begin
     MyDB[i]:=x as TTable;
     MyDN[i]:=UpperCase(MyDB[i].DatabaseName);
     MyDB[i].Close;
   end;
end;
end;

procedure MyDB_CloseAll;
var i:integer;
begin
for i:=1 to MyDBX do MyDB[i].Close;
end;

function MyDB_Open(iAlias:string):boolean;
var i:integer;DBOK:boolean;s:string; fc:word;
begin
  {Try open DB}
  for i:=1 to MyDBX do
  begin
    if (iAlias='') or ((iAlias<>'') and (MyDN[i]=iAlias)) then
    try
    if not MyDB[i].Active then MyDB[i].Open;
    except
       on E:Exception do begin MyError(MyDB[i].TableName+':'+E.Message);break; end;
    end;

  end;
  {Check DB status}
  DBOK:=TRUE;
  for i:=1 to MyDBX do
  begin
    if (iAlias='') or ((iAlias<>'') and (MyDN[i]=iAlias)) then
    if not MyDB[i].Active then begin
      DBOK:=FALSE;
      MyError(Format(SMyAppZlyhanieDB,[
        GetAliasInfo_szPhyName(MyDB[i].DatabaseName)+MyDB[i].TableName]));
      break;
    end;
  end;
  Result:=DBOK;
end;

procedure TDMA.DisableDataSources;
begin with DM,DMZ,DMV do begin
  DS_ZAM1.Enabled:=False;
  DS_ZGRID.Enabled:=False;
  DS_VYPL.Enabled:=False;
  DS_VYPNP.Enabled:=False;
  DS_VGRID.Enabled:=False;
  DS_DZP.Enabled:=False;
  DS_DZPG.Enabled:=False;
  DS_RZP.Enabled:=False;
  DS_RGRID.Enabled:=False;
  DS_HSV.Enabled:=False;
  DS_ZRZ.Enabled:=False;
  DS_ZRZG.Enabled:=False;
  DS_ZRV.Enabled:=False;
  DS_ZRVG.Enabled:=False;
  DS_NEP.Enabled:=False;
  DS_NEPG.Enabled:=False;
  DS_NEP2.Enabled:=False;
  DS_CUK.Enabled:=False;
  DS_HSU.Enabled:=False;
  DS_DOCH.Enabled:=False;
  DS_ELDP.Enabled:=False;
  DS_ZP1.Enabled:=False;
  DS_ZP2.Enabled:=False;
  DS_ZP3.Enabled:=False;
  DS_ZP4.Enabled:=False;
  DS_ZP5.Enabled:=False;
end;end;

end.
