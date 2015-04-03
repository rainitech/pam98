unit Progress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls;

type
  TFormProgress = class(TForm)
    PB1: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateProgress(x:integer);
  end;

var
  FormProgress: TFormProgress;

implementation

{$R *.DFM}

procedure TFormProgress.UpdateProgress(x:integer);
begin
  if x<0 then x:=0;
  if x>100 then x:=100;
  PB1.Position:=x;
  Update;
end;

end.
