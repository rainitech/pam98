unit Konv290;

interface

uses DBTables;

{$INCLUDE INCLUDE.INC}


procedure upgrade_data(var chyba:string);
procedure upgrade_common(var chyba:string);
procedure upgrade_private(var chyba:string);

type
 TMyUp=record
   nam:string[8];
   new:string[8];
   adr:string[8];
   typ:string[5];
   siz:integer;
 end;

const
 extsize = 5;
 ext:array[1..extsize] of string[10]=('db','val','px','xg0','yg0');
 _setup:TMyUp=(nam:'setup';new:'setup9';adr:'comm';typ:'11000';siz:96);
 _nakl:TMyUp=(nam:'nakl';new:'nakl9';adr:'priv';typ:'10111';siz:5);
 _vyp:TMyUp=(nam:'vyp';new:'vyp9';adr:'data';typ:'11111';siz:204);
 _zam:TMyUp=(nam:'zam';new:'zam9';adr:'data';typ:'11111';siz:97);
 _inf:TMyUp=(nam:'inf';new:'inf9';adr:'data';typ:'10000';siz:52);
 _deti:TMyUp=(nam:'deti';new:'deti9';adr:'data';typ:'11100';siz:11);
 _nep:TMyUp=(nam:'nep';new:'nep9';adr:'data';typ:'11100';siz:8);

implementation

uses
  classes,
  Forms,
  FMXUtils,
  db,
  SysUtils,
  MyConsts,
  Main;

var
  T1: TTable;
  T2: TTable;

procedure PrcUp(T1,T2:TTable;X:TMyUp);
 var oUlica,oCislo:string;
begin
 if X.nam='inf' then begin
   MyRozdelUlicu(T2.FieldByName('ADR_ULICA').Value,oUlica,oCislo);
   T2.FieldByName('ADR_ULICA').Value := oUlica;
   T2.FieldByName('ADR_CISLO').Value := oCislo;
   T2.FieldByName('ADR_TELEFON').Value := '';
   T2.FieldByName('ADR_FAX').Value := '';
   T2.FieldByName('ADR_EMAIL').Value := '';
   T2.FieldByName('ICZ').Value := '';
   T2.FieldByName('NAZOV_BANKY').Value := '';
   T2.FieldByName('RIADENIE').Value := 99;
 end else
 if X.nam='rzp' then begin
 end else
 if X.nam='vyp' then begin
    T2.FieldByName('F_invalid').Value := 0;
    T2.FieldByName('Fz_invalid').Value := 0;
    T2.FieldByName('Fz_uraz').Value := 0;
    T2.FieldByName('Fz_rezerva').Value := 0;
    T2.FieldByName('N_zaklad_up').Value := 0;
    T2.FieldByName('N_zaklad_ip').Value := 0;
    T2.FieldByName('N_zaklad_gp').Value := 0;
    T2.FieldByName('N_zaklad_rf').Value := 0;
    T2.FieldByName('Oz_zdravot').Value := 0;
    T2.FieldByName('Oz_nemoc').Value := 0;
    T2.FieldByName('Oz_dochod').Value := 0;
    T2.FieldByName('Oz_fondzam').Value := 0;
    T2.FieldByName('Oz_rezerva').Value := 0;
    T2.FieldByName('Oz_garancne').Value := 0;
    T2.FieldByName('Oz_invalid').Value := 0;
    T2.FieldByName('Oz_uraz').Value := 0;
    T2.FieldByName('O_invalid').Value := 0;
    T2.FieldByName('U_invalid').Value := 0;
    T2.FieldByName('U_uraz').Value := 0;
    T2.FieldByName('U_rezerva').Value := 0;
    T2.FieldByName('U_garancne').Value := 0;
    T2.FieldByName('Poc_nezaop_deti').Value := 0;
    T2.FieldByName('V_nahrada_pn1').Value := 0;
    T2.FieldByName('V_nahrada_pn2').Value := 0;
    T2.FieldByName('N_nahrada_pn').Value := 0;
    T2.FieldByName('D_bonus_predpis').Value := 0;
    T2.FieldByName('D_bonus_cerpany').Value := 0;
    T2.FieldByName('Poc_nezaop_deti').Value := 0;
    T2.FieldByName('Vynimka_VZ').Value := 0;
    T2.FieldByName('N_mimo_poistne').Value := 0;
    T2.FieldByName('V_kal_dni').Value := KAL_DNI(T2.FieldByName('V_obdobie').Value);
 end else
 if X.nam='zam' then begin
    T2.FieldByName('U_invalid').Value := T2.FieldByName('U_dochod').Value;
    T2.FieldByName('U_uraz').Value := 1;
    T2.FieldByName('U_rezerva').Value  := T2.FieldByName('U_dochod').Value;
    T2.FieldByName('U_garancne').Value := T2.FieldByName('U_dochod').Value;
    T2.FieldByName('PN_denne').Value := 0;

    if T2.FieldByName('DAN_ZRAZKOU').Value
     then T2.FieldByName('VYNIMKA_VZ').Value := '6'  {dohody mimopracovneho pomeru}
      else if T2.FieldByName('F_DOBA').Value < 8
            then T2.FieldByName('VYNIMKA_VZ').Value := '3' {kratsi pracovny cas}
             else T2.FieldByName('VYNIMKA_VZ').Value := '0';
 end else
 if X.nam='deti' then begin
    T2.FieldByName('Dan_bonus').Value    := T2.FieldByName('NC').Value;
    T2.FieldByName('Zniz_poistne').Value := T2.FieldByName('NC').Value;
 end else
 if X.nam='setup' then begin
 end
end;

procedure CopyFileX(const s1,s2:string);
begin if FileExists(s1) then CopyFile(s1,s2); end;

procedure Zalohuj_A_Prepis(const cesta,sub_old,sub_new:string);
begin
 MyBkpPath:=ExtractFileDir(cesta)+'.'+DEF_BKP_EXT;
 {$i-} mkdir(MyBkpPath); {$i+}
 CopyFileX(cesta+sub_old,MyBkpPath);
 MoveFile(cesta+sub_new,cesta+sub_old);
end;

procedure Dopln_A_Prepis(const sub_old,sub_new,cesta:string);
begin
 if not FileExists(cesta+sub_old) then
 begin
   CopyFile(DEF_DATA+sub_new,cesta);
   MoveFile(cesta+sub_new,cesta+sub_old);
 end;
end;

procedure Tvrdo_Prepis(const sub_old,sub_new,cesta:string);
begin
 MyBkpPath:=ExtractFileDir(cesta)+'.'+DEF_BKP_EXT;
 {$i-} mkdir(MyBkpPath); {$i+}
 CopyFile(DEF_DATA+sub_new,cesta);
 CopyFileX(cesta+sub_old,MyBkpPath);
 MoveFile(cesta+sub_new,cesta+sub_old);
end;

function GetDestPath(X:TMyUp):string;
begin
  if X.adr='data' then Result:=MyDataPth
  else if X.adr='priv' then Result:=MyPrivPth
  else if X.adr='comm' then Result:=MyCommPth
  else raise EMyError.Create('chyba');
end;

procedure upgrade_table(X:TMyUp;var chyba:string);
var i:integer;rc,pc:longint;
 DestData:string;
begin
 try
 chyba:='';
 T1.Close;
 T2.Close;
 DestData:=GetDestPath(X);
 T1.TableName:=DestData + X.nam+'.db';
 T1.Open;
 rc:=T1.recordcount;
 if rc=0 then rc:=1;
 pc:=0;
 if T1.FieldCount = X.siz then
 begin
   for i:=1 to extsize do if Copy(X.typ,i,1)='1' then
     CopyFile(DEF_DATA+X.new+'.'+EXT[i],DestData);
   T2.Tablename:=DestData + X.new+'.db';
   T2.EmptyTable;
   T2.Open;
   while not T1.EOF do begin
     inc(pc); Progress(trunc(pc/rc*100));
     with T1 do
     T2.Insert;
     for i:=1 to X.siz do T2.Fields[i-1].Value:=T1.Fields[i-1].Value;
     PrcUp(T1,T2,X);
     T2.Post;
     T1.Next;
   end;
   T2.Close;
   T1.Close;
   for i:=1 to extsize do if Copy(X.typ,i,1)='1' then
     Zalohuj_A_Prepis(DestData,X.nam+'.'+EXT[i],X.new+'.'+EXT[i]);
 end;
 Progress(100);
 except on E:Exception do begin Progress(100); chyba:=X.nam+':'+E.Message;end;end;
end;

procedure MyDeleteFile(const s:string);
begin
  if FileExists(s) then DeleteFile(s);
end;

procedure upgrade_data_vymaz;
  procedure MyVymaz(x:TMyUp);
  var i:integer;
  begin
    for i:=1 to extsize do if Copy(X.typ,i,1)='1' then
      MyDeleteFile(GetDestPath(X)+X.new+'.'+EXT[i]);
  end;
begin
end;

procedure upgrade_data(var chyba:string);
begin
  try
  if T1= nil then T1 := TTable.Create(Application);
  if T2= nil then T2 := TTable.Create(Application);
  upgrade_table(_vyp,chyba); if chyba<>'' then exit;
  upgrade_table(_zam,chyba); if chyba<>'' then exit;
  upgrade_table(_inf,chyba); if chyba<>'' then exit;
  upgrade_table(_deti,chyba); if chyba<>'' then exit;
  upgrade_table(_nep,chyba); if chyba<>'' then exit;
  except on E:Exception do begin chyba:='data:'+E.Message;end;end;
end;

procedure upgrade_common(var chyba:string);
begin
  try
  if T1= nil then T1 := TTable.Create(Application);
  if T2= nil then T2 := TTable.Create(Application);
  Dopln_a_prepis('cis_vvz.db','cis_vvz9.db',MyCommPth);
  Dopln_a_prepis('cis_vvz.px','cis_vvz9.px',MyCommPth);
  Dopln_a_prepis('p2004.db','p20049.db',MyCommPth);
  Dopln_a_prepis('p2004.px','p20049.px',MyCommPth);
  Dopln_a_prepis('p2004.val','p20049.val',MyCommPth);
  upgrade_table(_setup,chyba); if chyba<>'' then exit;
 except on E:Exception do begin chyba:='comm5:'+E.Message;end;end;
end;

procedure upgrade_priv(var chyba:string);
begin
 try
 chyba:='';
 T1.Close;
 T1.TableName:=MyPrivPth+'priv.db';
 T1.Open;
 T1.Edit;
 T1.FieldByName('ROK').AsString := '2003';
 T1.Post;
 T1.Close;
 Tvrdo_prepis('nakl.db','nakl9.db',MyPrivPth);
 Tvrdo_prepis('nakl.px','nakl9.px',MyPrivPth);
 Tvrdo_prepis('nakl.xg0','nakl9.xg0',MyPrivPth);
 Tvrdo_prepis('nakl.yg0','nakl9.yg0',MyPrivPth);
 except on E:Exception do begin chyba:='priv:'+E.Message;end;end;
end;

procedure upgrade_sys(var chyba:string);
begin
 try
 chyba:='';
 T1.Close;
 T1.TableName:=MyPrivPth+'sys.db';
 T1.Open;
 T1.Edit;
 T1.FieldByName('REGISTERED').AsBoolean := False;
 T1.FieldByName('REG_KEY').AsString := '';
 T1.FieldByName('VOLUME_SN').AsString := '';
 T1.FieldByName('DUMMY_KEY').AsString := '';
 T1.FieldByName('POCET_ZAM').AsInteger := 5;
 T1.FieldByName('POCET_FIRIEM').AsInteger := 1;
 T1.Post;
 T1.Close;
 except on E:Exception do begin chyba:='sys:'+E.Message;end;end;
end;

procedure upgrade_private(var chyba:string);
begin
 try
 if T1= nil then T1 := TTable.Create(Application);
 if T2= nil then T2 := TTable.Create(Application);
 chyba:='';
 upgrade_priv(chyba); if chyba<>'' then exit;
 upgrade_sys(chyba);  if chyba<>'' then exit;
 except on E:Exception do begin chyba:='priv:'+E.Message;end;end;
end;

end.
