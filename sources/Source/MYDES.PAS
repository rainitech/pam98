unit MyDes;

interface

const
  des_p = 101;
  des_q = 11;
  des_fi:longint = (des_p - 1) * (des_q - 1);
  des_n:longint = des_p * des_q;
  des_a:longint=7;
  des_b:longint=143;

function EncryptKey(const s:string):string;
function DecryptKey(const s:string):string;

implementation

uses SysUtils;

procedure najdi_ab(var a:longint; var b:longint);
var i,j:longint;
begin
  for i:=3 to 1000 do
  for j:=3 to 9999 do
  begin
    if ((i*j) mod des_n) mod (des_fi mod des_n) = 1 then
    begin
      a:=i;
      b:=j;
      exit;
    end;
  end;
end;

function umocni(a,n:longint):longint;
var i:longint;ss:longint;
begin
  ss:=1;
  for i:=1 to n do
    ss:=(ss*a) mod des_n;
  umocni:=ss;
end;

function EncryptKey(const s:string):string;
var v:string;
begin
  try
  v:=FormatFloat('0000',umocni(StrToInt(Copy(s,1,3)),des_a));
  v:=v+FormatFloat('0000',umocni(StrToInt(Copy(s,4,2)),des_a));
  v:=v+'-';
  v:=v+FormatFloat('0000',umocni(StrToInt(Copy(s,7,3)),des_a));
  v:=v+FormatFloat('0000',umocni(StrToInt(Copy(s,10,2)),des_a));
  except v:='00000000-00000000'; end;
  EncryptKey:=v;
end;

function DecryptKey(const s:string):string;
var v:string;
begin
  try
  v:=FormatFloat('000',umocni(StrToInt(Copy(s,1,4)),des_b));
  v:=v+FormatFloat('00',umocni(StrToInt(Copy(s,5,4)),des_b));
  v:=v+'-';
  v:=v+FormatFloat('000',umocni(StrToInt(Copy(s,10,4)),des_b));
  v:=v+FormatFloat('00',umocni(StrToInt(Copy(s,14,4)),des_b));
  except v:='00000-00000'; end;
  DecryptKey:=v;
end;

end.
