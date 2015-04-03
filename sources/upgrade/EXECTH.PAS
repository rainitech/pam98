unit ExecTh;

interface

uses
  Classes;

type
  TExecThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  public
    AFileName,AParams,ADefaultDir:string;
    AShowCmd:integer;
    constructor Create(const FileName, Params, DefaultDir: string;
                ShowCmd: Integer);
  end;

implementation

uses FMXUtils;

{ Important: Methods and properties of objects in VCL can only be used in a
  method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TExecThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TExecThread }

constructor TExecThread.Create
(const FileName, Params, DefaultDir: string;ShowCmd: Integer);
begin
 AFileName:=FileName;
 AParams:=Params;
 ADefaultDir:=DefaultDir;
 AShowCmd:=ShowCmd;
 inherited Create(False);
end;

procedure TExecThread.Execute;
begin
  ExecuteFile(AFileName,AParams,ADefaultDir,AShowCmd);
end;

end.
