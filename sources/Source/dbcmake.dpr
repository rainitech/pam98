program dbcmake;
uses Forms;
var F1,F2:textfile;s:string;
begin
  assignfile(F1,'');
  assignfile(F2,'');
  reset(F1);
  rewrite(F2);
  while not EOF(F1) do begin
    readln(F1,s);
    writeln(F2,'dbcomp '+s+' >> vysl.txt');
  end;
  closefile(F1);
  closefile(F2);
end.
