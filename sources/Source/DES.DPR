program DES;

uses
  Forms,
  MyDes in 'Mydes.pas';

{$R *.RES}

var f1,f2:TextFile;row:string;

begin
  AssignFile(f1,'DES.TXT');
  AssignFile(f2,'DES.OUT');
  try
  reset(f1);
  rewrite(f2);
  while not eof(f1) do begin
    readln(f1,row);
    writeln(f2,row,' -> ',EncryptKey(row));
  end;
  CloseFile(f1);
  CloseFile(f2);
  except end;
end.
