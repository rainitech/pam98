program ren1;

uses
  SysUtils,FmxUtils;

var predpona,s:string;
begin
  predpona:=ParamStr(1);
  if predpona='' then predpona:='_';
  while not EOF do begin
    readln(s);
    if FileExists(s) then RenameFile(s,predpona+s);
  end;
end.

