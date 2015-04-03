unit Pomocny;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables;

type
  TForm1 = class(TForm)
    T1: TTable;
    T2: TTable;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var i:integer;
begin
 T1.TableName:='c:\!data\v203u\data01\inf.db';
 T2.Tablename:='c:\!data\v211u\data01\inf.db';
 T1.Open;
 T2.Open;
 if (T1.FieldCount=32) and (T2.FieldCount=34) then
 begin
   while not T1.EOF do begin
     with T1 do
     T2.Insert;
     for i:=1 to 18 do T2.Fields[i-1]:=T1.Fields[i-1];
     T2.Fields[19-1].Value:=0;
     for i:=20 to 33 do T2.Fields[i-1]:=T1.Fields[i-2];
     T2.Fields[34-1].Value:=0;
     T2.Post;
     T1.Next;
   end;
 end;
 T2.Close;
 T1.Close;
end;

end.
