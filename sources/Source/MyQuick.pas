unit MyQuick;

interface

uses Quickrpt,QrCtrls;

procedure QRSetShapeWidth(QR: TQuickRep; W: integer);
procedure QRDisableShape(QR: TQuickRep);
procedure QRDisableLabel(QR: TQuickRep);

implementation

procedure QRSetShapeWidth(QR: TQuickRep; W: integer);
var i:longint;
begin with QR do begin
  for i:=0 to ComponentCount-1 do
  if Components[i].ClassName='TQRShape' then
  begin
    (Components[i] as TQRShape).Pen.Width := W;
  end;
end;end;

procedure QRDisableShape(QR: TQuickRep);
var i:longint;
begin with QR do begin
  for i:=0 to ComponentCount-1 do
  if Components[i].ClassName='TQRShape' then
  begin
    (Components[i] as TQRShape).Enabled := False;
  end;
end;end;

procedure QRDisableLabel(QR: TQuickRep);
var i:longint;
begin with QR do begin
  for i:=0 to ComponentCount-1 do
  if ((Components[i].ClassName='TQRLabel') or (Components[i].ClassName='TQRMemo' ))and
     (Components[i].Tag=0) then
  begin
    if Components[i].ClassName='TQRLabel' then
     (Components[i] as TQRLabel).Enabled := False
    else
     (Components[i] as TQRMemo).Enabled := False;
  end;
end;end;

end.
