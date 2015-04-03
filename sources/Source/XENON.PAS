unit Xenon;

interface

uses
 SysUtils,
 Math,
 Forms,
 Controls,
 MyConsts,
 Dm_main,
 RexNZ;

type
 TXenonRec = record
   hrube_mzdy : double;
   np12       : double;
   np38       : double;
   dan        : double;
   poistenie  : double;
   nemocenske : double;
   zrazky     : double;
   prijmy     : double;
 end;

procedure VytvorSubor;
procedure Zapis_Do_Suboru(mes: byte; const rec: TXenonRec);
procedure Export_Xenon98;

implementation

var XX:array[1..12] of TXenonRec;

function IntToStrFixed (a: longint; size: byte): string;
var s:string;
begin
  s:=IntToStr(a);
  while length(s)<size do s:='0'+s;
  Result:=s;
end;

function UplneMenoSuboru: string;
begin with DM do begin
 Result := MyDataPth + 'Xenon\Mzdy'+IntToStr(AktRok)+'.txt'
end;end;

function PomocneMenoSuboru: string;
begin with DM do begin
 Result := MyDataPth + 'Xenon\Temp.000';
end;end;


procedure VytvorSubor;
var f:TextFile;i:byte;rec1: TXenonRec;
begin with DM do begin
  if FileExists(UplneMenoSuboru) then exit;
  assignfile(f,UplneMenoSuboru);
  rewrite(f);
  for i:=1 to 12 do begin
  writeln(f,'------------------');
  writeln(f,'Mesiac '+IntToStrFixed(i,2));
  writeln(f,'hrube mzdy        0');
  writeln(f,'np12              0');
  writeln(f,'np38              0');
  writeln(f,'poistenie         0');
  writeln(f,'nemocenske        0');
  writeln(f,'zrazky            0');
  writeln(f,'prijmy            0');
  end;
  close(f);
  FillChar(rec1,SizeOf(rec1),0);
end;end;

procedure Zapis_Do_Suboru(mes: byte; const rec: TXenonRec);
var fi,fo:TextFile;i:byte;riadok:string;
begin with DM do begin
  if not FileExists(UplneMenoSuboru) then VytvorSubor;
  assignfile(fo,PomocneMenoSuboru);
  rewrite(fo);
  assignfile(fi,UplneMenoSuboru);
  reset(fi);
  i:=0;
  while not eof(fi) do begin
    readln(fi,riadok);
    writeln(fo,riadok);
    if uppercase(Copy(riadok,1,6))='MESIAC' then inc(i);
    if i=mes then
    begin
     readln(fi);
     writeln(fo,'hrube mzdy   '+Format('%7d',[floor(rec.hrube_mzdy)]));
     readln(fi);
     writeln(fo,'np12         '+Format('%7d',[floor(rec.np12)]));
     readln(fi);
     writeln(fo,'np38         '+Format('%7d',[floor(rec.np38)]));
     readln(fi);
     writeln(fo,'poistenie    '+Format('%7d',[floor(rec.poistenie)]));
     readln(fi);
     writeln(fo,'nemocenske   '+Format('%7d',[floor(rec.nemocenske)]));
     readln(fi);
     writeln(fo,'zrazky       '+Format('%7d',[floor(rec.zrazky)]));
     readln(fi);
     writeln(fo,'prijmy       '+Format('%7d',[floor(rec.prijmy)]));
     inc(i);
    end;
 end;
 close(fi);
 close(fo);
end;end;

procedure Zapis_Jeden_Mesiac(mes: byte; rec: TXenonRec);
var fo:TextFile;
begin with DM do begin
  assignfile(fo,UplneMenoSuboru);
  if not FileExists(UplneMenoSuboru)
   then rewrite(fo)
    else append(fo);

  writeln(fo,'------------------');
  writeln(fo,'Mesiac '+LPAD(IntToStr(mes),2,'0'));
  writeln(fo,'hrube mzdy   '+Format('%6d',[floor(rec.hrube_mzdy)]));
  writeln(fo,'np12         '+Format('%6d',[floor(rec.np12)]));
  writeln(fo,'np38         '+Format('%6d',[floor(rec.np38)]));
  writeln(fo,'dan          '+Format('%6d',[floor(rec.dan)]));
  writeln(fo,'poistenie    '+Format('%6d',[floor(rec.poistenie)]));
  writeln(fo,'nemocenske   '+Format('%6d',[floor(rec.nemocenske)]));
  writeln(fo,'zrazky       '+Format('%6d',[floor(rec.zrazky)]));
  writeln(fo,'prijmy       '+Format('%6d',[floor(rec.prijmy)]));
  close(fo);
end;end;

procedure Spocitaj_Jeden_Mesiac(mes: byte);
var X: TMyReportParam;
begin with DM,XX[mes] do begin
  DM.NaplnMyReportParam(X);
  X.AktObdobie:=AktRok * 100 + mes;
  ReportNZ.VytvorPomocnuDatabazu(X,False);
  hrube_mzdy  := RexNZ.MesacneNaklady.n_brutto;
  np12        := RexNZ.MesacneNaklady.poi1;
  np38        := RexNZ.MesacneNaklady.poi2;
  dan         := RexNZ.MesacneNaklady.dan;
  nemocenske  := RexNZ.MesacneNaklady.nd;
  zrazky      := RexNZ.MesacneNaklady.vy4;
  prijmy      := RexNZ.MesacneNaklady.n_doplatok{+RexNZ.MesacneNaklady.rzp};
  poistenie   := ZAOKRUHLI(hrube_mzdy*RexNZ.MesacneNaklady.f_poistne/1000,0,0);

  Zapis_Jeden_Mesiac(mes, XX[mes]);
end;end;

procedure Export_Xenon98;
var i:byte;fo:TextFile;
begin with DM do begin
  if not MyOtazka(SMyAppXenon98NaozajSpustit) then exit;
  assignfile(fo,UplneMenoSuboru);
  rewrite(fo);
  closefile(fo);
  FillChar(XX,sizeof(XX),0);
  Screen.Cursor:=crHourGlass;
  try
  Progress(0);
  ReportNZ:=TReportNZ.Create(Application);
  for i:=1 to 12 do begin
    Spocitaj_Jeden_Mesiac(i);
    Progress(trunc(i/12*100));
  end;  
  finally
  ReportNZ.Free;
  Progress(100);
  Screen.Cursor:=crDefault;
  end;
  MyMessage(Format(SMyAppXenon98Hotovo,[UplneMenoSuboru]));
end;end;

end.
