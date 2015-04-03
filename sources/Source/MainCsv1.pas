unit MainCsv1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBCtrls, StdCtrls, Buttons, ExtCtrls, ComCtrls, Menus,
  DBTables, checklst, Mask;

type
  TFormCsv1 = class(TForm)
    Panel50: TPanel;
    Panel51: TPanel;
    Btn_navrat: TBitBtn;
    Panel52: TPanel;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Mnu_operacie: TMenuItem;
    N16: TMenuItem;
    Mnu_navrat: TMenuItem;
    Pomoc1: TMenuItem;
    Kalkulacka1: TMenuItem;
    N29: TMenuItem;
    Oprograme1: TMenuItem;
    Panel1: TPanel;
    SB1: TScrollBox;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Btn_vyrad: TButton;
    Btn_zarad: TButton;
    Btn_hore: TButton;
    Btn_dole: TButton;
    Btn_tlac: TButton;
    SB_GRIDY: TScrollBox;
    Panel_G1: TPanel;
    Panel_G2: TPanel;
    DBG_TL2a: TDBGrid;
    DBG_TL2b: TDBGrid;
    Panel_Zmena: TPanel;
    Panel4: TPanel;
    DBG_TL1: TDBGrid;
    Splitter2: TSplitter;
    mnu_vyrad: TMenuItem;
    mnu_zarad: TMenuItem;
    mnu_hore: TMenuItem;
    mnu_dole: TMenuItem;
    mnu_tlac: TMenuItem;
    DBN2: TDBNavigator;
    N1: TMenuItem;
    mnu_edit: TMenuItem;
    mnu_post: TMenuItem;
    mnu_cancel: TMenuItem;
    Panel5: TPanel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    N2: TMenuItem;
    Zobrazisasnchzamestanncov1: TMenuItem;
    Zobrazivyradenchzamestnancov1: TMenuItem;
    Zobrazivetkchzamestnancov1: TMenuItem;
    N3: TMenuItem;
    Button1: TButton;
    procedure Btn_navratClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Kalkulacka1Click(Sender: TObject);
    procedure Oprograme1Click(Sender: TObject);
    procedure DBN1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBN2Click(Sender: TObject; Button: TNavigateBtn);
    procedure Mnu_operacieClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Btn_vyradClick(Sender: TObject);
    procedure Btn_zaradClick(Sender: TObject);
    procedure Btn_horeClick(Sender: TObject);
    procedure Btn_doleClick(Sender: TObject);
    procedure Btn_tlacClick(Sender: TObject);
    procedure SB_GRIDYResize(Sender: TObject);
    procedure mnu_vyradClick(Sender: TObject);
    procedure mnu_zaradClick(Sender: TObject);
    procedure mnu_horeClick(Sender: TObject);
    procedure mnu_doleClick(Sender: TObject);
    procedure mnu_tlacClick(Sender: TObject);
    procedure mnu_editClick(Sender: TObject);
    procedure mnu_postClick(Sender: TObject);
    procedure mnu_cancelClick(Sender: TObject);
    procedure Akcia_zam_sucasny(Sender: TObject);
    procedure Akcia_zam_vyradeny(Sender: TObject);
    procedure Akcia_zam_vsetci(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f1,f2:text;
    fn1,fn2:string[128];
    rr,ss:integer;
    prvy1,prvy2:boolean;

    procedure UpdateStatus;
    procedure UpdateMenu;
    procedure PrecislujTlac2;
    procedure SpracujRiadokZam;
    procedure DisableDS;
    procedure EnableDS;
  end;

var
  FormCsv1: TFormCsv1;

type
  TMyParam = record
    DM:TDataModule;
    TAB:TTable;
  end;

var
  MyParam: TMyParam;

implementation

uses MyConsts, DB, Dm_zam, Dm_tlac, DM_sql, FmxUtils, RXCalc, About,
  Dm_main;

{$R *.DFM}

procedure TFormCsv1.UpdateMenu;
begin with DMTL do begin
  if TL2a_.State in [dsEdit,dsInsert] then begin
    Mnu_edit.Enabled:=False;
    Mnu_post.Enabled:=True;
    Mnu_cancel.Enabled:=True;
    Mnu_navrat.Enabled:=False;
    Btn_navrat.Enabled:=False;
    Mnu_vyrad.Enabled:=False;
    Mnu_zarad.Enabled:=False;
    Mnu_hore.Enabled:=False;
    Mnu_dole.Enabled:=False;
    Mnu_tlac.Enabled:=False;
    Btn_vyrad.Enabled:=False;
    Btn_zarad.Enabled:=False;
    Btn_hore.Enabled:=False;
    Btn_dole.Enabled:=False;
    Btn_tlac.Enabled:=False;
    Panel_Zmena.Visible:=True;
    DBG_TL1.Enabled:=False;
    DBG_TL2a.Enabled:=False;
    DBG_TL2b.Enabled:=False;
  end else
  begin
    Mnu_edit.Enabled:=True;
    Mnu_post.Enabled:=False;
    Mnu_cancel.Enabled:=False;
    Mnu_navrat.Enabled:=True;
    Btn_navrat.Enabled:=True;
    Mnu_vyrad.Enabled:=True;
    Mnu_zarad.Enabled:=True;
    Mnu_hore.Enabled:=True;
    Mnu_dole.Enabled:=True;
    Mnu_tlac.Enabled:=True;
    Btn_vyrad.Enabled:=True;
    Btn_zarad.Enabled:=True;
    Btn_hore.Enabled:=True;
    Btn_dole.Enabled:=True;
    Btn_tlac.Enabled:=True;
    Panel_Zmena.Visible:=False;
    DBG_TL1.Enabled:=True;
    DBG_TL2a.Enabled:=True;
    DBG_TL2b.Enabled:=True;
  end;
end;end;

procedure TFormCsv1.UpdateStatus;
begin
  StatusBar1.Panels[0].Text:=MyStatus;
  Caption := MyCaption;
end;

procedure TFormCsv1.Btn_navratClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCsv1.FormCreate(Sender: TObject);
begin with DMZ,DMTL do begin
  UpdateStatus;
  TL1_.Open;
  TL2a_.Open;
  TL2b_.Open;
  EnableDS;
end;end;

procedure TFormCsv1.Kalkulacka1Click(Sender: TObject);
begin
  FormCalc.Show;
end;

procedure TFormCsv1.Oprograme1Click(Sender: TObject);
begin
  if FormAbout=nil then Application.CreateForm(TFormAbout, FormAbout);
  FormAbout.ShowModal;
end;

procedure TFormCsv1.DBN1Click(Sender: TObject; Button: TNavigateBtn);
begin
  UpdateMenu;
end;

procedure TFormCsv1.DBN2Click(Sender: TObject; Button: TNavigateBtn);
begin
 UpdateMenu;
end;

procedure TFormCsv1.Mnu_operacieClick(Sender: TObject);
begin
  UpdateMenu;
end;

procedure TFormCsv1.FormDestroy(Sender: TObject);
begin with DMTL do begin
  DisableDS;
  TL2b_.Close;
  TL2a_.Close;
  TL1_.Close;
end;end;

procedure TFormCsv1.PrecislujTlac2;
var logid,tlid:longint;i:integer;
begin with DMTL do begin
  tlid:=TL1_TLID.Value;
  logid:=TL2a_LOGID.Value;
  try
  DisableDS;
  TL2a_.Filtered:=False;
  TL2a_.First;
  i:=0;
  while not TL2a_.EOF do begin
    TL2a_.Edit;
    TL2a_LOGID.Value:=i;
    TL2a_.Post;
    TL2a_.Next;
    inc(i);
  end;
  finally
    TL2a_.Filtered:=True;
    TL2a_.FindNearest([tlid,logid]);
    TL2a_.Refresh;
    TL2b_.Refresh;
    EnableDS;
  end;
end;end;

procedure TFormCsv1.Btn_vyradClick(Sender: TObject);
var tlid:longint;
begin with DMSQL,DMTL do begin
  if TL2a_.Recordcount = 0 then exit;
  try
  DisableDS;
  tlid:=TL1_TLID.Value;
{  logid:=TL2a_LOGID.Value;}
  ExecuteSql('select max(logid)+1 from ":pam98_comm:tlac2" where tlid='+IntToStr(tlid));
  TL2a_.Edit;
  TL2a_Tlacit.Value:=False;
  TL2a_Logid.Value:=StrToInt(results[1]);
  TL2a_.Post;
  PrecislujTlac2;
  DBG_TL2a.SetFocus;
  finally
  TL2a_.Cancel;
  EnableDS;
  end;
end;end;

procedure TFormCsv1.Btn_zaradClick(Sender: TObject);
var tlid:longint;
begin with DMSQL,DMTL do begin
  if TL2b_.Recordcount = 0 then exit;
  try
  DisableDS;
  tlid:=TL1_TLID.Value;
  ExecuteSql('select max(logid)+1 from ":pam98_comm:tlac2" where tlid='+IntToStr(tlid));
  TL2b_.Edit;
  TL2b_Tlacit.Value:=True;
  TL2b_Logid.Value:=StrToInt(results[1]);
  TL2b_.Post;
  PrecislujTlac2;
  DBG_TL2b.SetFocus;
  finally
  TL2b_.Cancel;
  TL2b_.First;
  EnableDS;
  end;
end;end;

procedure TFormCsv1.Btn_horeClick(Sender: TObject);
var logid,fyzid,tlid,maxid,predid:longint;
begin with DMSQL,DMTL do begin
  try
  DisableDS;
  tlid:=TL1_TLID.Value;
  logid:=TL2a_LOGID.Value;
  fyzid:=TL2a_FYZID.Value;
  if logid=0 then exit;
  ExecuteSql('select max(logid) from ":pam98_comm:tlac2" where tlid='+IntToStr(tlid)+
    ' and logid<'+IntToStr(logid)+' and tlacit=true');
  if results[1]='' then exit;
  predid:=StrToInt(results[1]);
  ExecuteSql('select max(logid)+1 from ":pam98_comm:tlac2" where tlid='+IntToStr(tlid));
  maxid:=StrToInt(results[1]);
  ExecuteSql('delete from ":pam98_comm:tlac2" where tlid='+IntToStr(tlid)+
    ' and logid=-1');
  ExecuteSql('update ":pam98_comm:tlac2" set logid=-1 where tlid='+IntToStr(tlid)+
    ' and logid='+IntToStr(predid));
  ExecuteSql('update ":pam98_comm:tlac2" set logid='+IntToStr(predid)+' where tlid='+IntToStr(tlid)+
    ' and logid='+IntToStr(logid));
  ExecuteSql('update ":pam98_comm:tlac2" set logid='+IntToStr(logid)+' where tlid='+IntToStr(tlid)+
    ' and logid=-1');
   TL2a_.FindKey([tlid,predid]);
  DBG_TL2a.SetFocus;
  finally
  EnableDS;
  end;
end;end;

procedure TFormCsv1.Btn_doleClick(Sender: TObject);
var logid,fyzid,tlid,maxid,naslid:longint;
begin with DMSQL,DMTL do begin
  try
  DisableDS;
  tlid:=TL1_TLID.Value;
  logid:=TL2a_LOGID.Value;
  fyzid:=TL2a_FYZID.Value;
  ExecuteSql('select min(logid) from ":pam98_comm:tlac2" where tlid='+IntToStr(tlid)+
    ' and logid>'+IntToStr(logid)+' and tlacit=true');
  if results[1]='' then exit;
  naslid:=StrToInt(results[1]);
  ExecuteSql('select max(logid)+1 from ":pam98_comm:tlac2" where tlid='+IntToStr(tlid));
  maxid:=StrToInt(results[1]);
  if logid=maxid then exit;
  ExecuteSql('update ":pam98_comm:tlac2" set logid=-1 where tlid='+IntToStr(tlid)+
    ' and logid='+IntToStr(naslid));
  ExecuteSql('update ":pam98_comm:tlac2" set logid='+IntToStr(naslid)+' where tlid='+IntToStr(tlid)+
    ' and logid='+IntToStr(logid));
  ExecuteSql('update ":pam98_comm:tlac2" set logid='+IntToStr(logid)+' where tlid='+IntToStr(tlid)+
    ' and logid=-1');
  TL2a_.FindKey([tlid,naslid]);
  DBG_TL2a.SetFocus;
  finally
  EnableDS;
  end;
end;end;

procedure TFormCsv1.SpracujRiadokZam;
begin with DMZ,DMTL do begin
  append(f1);
  if prvy1 then begin
    prvy1:=false;
    TL2a_.First;
    while not TL2a_.EOF do begin
      write(f1,'"'+TZAM_.FieldByName(TL2a_NAZOV.Value).DisplayLabel+'";');
      TL2a_.Next;
    end;
    writeln(f1);
  end;
  TL2a_.First;
  while not TL2a_.EOF do begin
    write(f1,'"'+TZAM_.FieldByName(TL2a_NAZOV.Value).AsString+'";');
    TL2a_.Next;
  end;
  writeln(f1);
  closefile(f1);
  {--}
  append(f2);
  if prvy2 then begin
    prvy2:=false;
    {--}
    TL2a_.First;
    ss:=1;
    while not TL2a_.EOF do begin
      writeln(f2,'F;W'+IntToStr(ss)+' '+IntToStr(ss)+' '+TL2a_SIRKA.AsString);
      inc(ss);
      TL2a_.Next;
    end;
    {--}
    TL2a_.First;
    ss:=1;
    while not TL2a_.EOF do begin
      writeln(f2,'C;Y'+IntToStr(rr)+';X'+IntToStr(ss)+';K"'+TZAM_.FieldByName(TL2a_NAZOV.Value).DisplayLabel+'"');
      ss:=ss+1;
      TL2a_.Next;
    end;
    rr:=rr+1;ss:=1;
  end;
  TL2a_.First;
  while not TL2a_.EOF do begin
    writeln(f2,'C;Y'+IntToStr(rr)+';X'+IntToStr(ss)+';K"'+TZAM_.FieldByName(TL2a_NAZOV.Value).AsString+'"');
    ss:=ss+1;
    TL2a_.Next;
  end;
  rr:=rr+1;ss:=1;
  closefile(f2);
end;end;

procedure TFormCsv1.Btn_tlacClick(Sender: TObject);
var tlid:longint;
begin with DMZ,DMTL do begin
  try
  tlid:=TL1_TLID.Value;
  CreateDir(MyAppPath+MenoTlacDir);
  fn1:=MyAppPath+MenoTlacDir+'\'+MenoTlacCsv+IntToStr(tlid)+'.CSV';
  fn2:=MyAppPath+MenoTlacDir+'\'+MenoTlacCsv+IntToStr(tlid)+'.SLK';
  assignfile(f1,fn1);
  assignfile(f2,fn2);
  prvy1:=true;
  prvy2:=true;
  rr:=1;
  ss:=1;
  try rewrite(f1);
  except
    MyError(Format(SMyAppCreateFileFailed,[fn1]));
    exit;
  end;
  try rewrite(f2);
  except
    closefile(f1);
    MyError(Format(SMyAppCreateFileFailed,[fn2]));
    exit;
  end;
  writeln(f2,'ID;PWXL;N;E');
  writeln(f2,'P;PGeneral');
  closefile(f1);
  closefile(f2);
  DisableDS;
  TZAM_.First;
  while not TZAM_.EOF do begin
    SpracujRiadokZam;
    TZAM_.Next;
  end;
  append(f2);
  writeln(f2,'E');
  closefile(f2);
  if MyOtazka(SMyAppRunExcel)
   then ExecuteFile('excel','"'+fn2+'"',MyAppPath+MenoTlacDir+'\',1)
   else   MyMessage(Format(SMyAppFileCreated,[fn2]));
  finally
  EnableDS;
  end;
end;end;

procedure TFormCsv1.SB_GRIDYResize(Sender: TObject);
begin
  Panel_G1.width:=SB_GRIDY.Width div 2;
  Panel_G2.width:=SB_GRIDY.Width div 2;
end;


procedure TFormCsv1.mnu_vyradClick(Sender: TObject);
begin
 Btn_vyrad.click;
end;

procedure TFormCsv1.mnu_zaradClick(Sender: TObject);
begin
 Btn_zarad.click;
end;

procedure TFormCsv1.mnu_horeClick(Sender: TObject);
begin
 Btn_hore.click;
end;

procedure TFormCsv1.mnu_doleClick(Sender: TObject);
begin
 Btn_dole.click;
end;

procedure TFormCsv1.mnu_tlacClick(Sender: TObject);
begin
 Btn_tlac.click;
end;


procedure TFormCsv1.mnu_editClick(Sender: TObject);
begin
  DBN2.BtnClick(nbEdit);
end;

procedure TFormCsv1.mnu_postClick(Sender: TObject);
begin
  DBN2.BtnClick(nbPost);
end;

procedure TFormCsv1.mnu_cancelClick(Sender: TObject);
begin
  DBN2.BtnClick(nbCancel);
end;

procedure TFormCsv1.DisableDS;
begin with DMTL do begin
  DS_TL2a.Enabled:=False;
  DS_TL2aG.Enabled:=False;
  DS_TL2b.Enabled:=False;
end;end;

procedure TFormCsv1.EnableDS;
begin with DMTL do begin
  DS_TL2a.Enabled:=True;
  DS_TL2aG.Enabled:=True;
  DS_TL2b.Enabled:=True;
end;end;

procedure TFormCsv1.Akcia_zam_sucasny(Sender: TObject);
begin with DM,DMZ do begin
   SET_FILTER('Vystup=null and '+AktSidFilter);
end;end;

procedure TFormCsv1.Akcia_zam_vyradeny(Sender: TObject);
begin with DM,DMZ do begin
   SET_FILTER('Vystup<>null and '+AktSidFilter);
end;end;

procedure TFormCsv1.Akcia_zam_vsetci(Sender: TObject);
begin with DM,DMZ do begin
   SET_FILTER(AktSidFilter);
end;end;

procedure TFormCsv1.Button1Click(Sender: TObject);
var s:string;i,j,lid:integer;
begin with DMZ,DMTL do begin
  if not MyOtazka(SMyAppZrusenieTlacovychDefinicii) then exit;
  try
  Progress(0);
  s:='delete from ":pam98_comm:tlac2"';
  DMSQL.ExecuteSql(s);
  lid:=0;
  for i:=0 to TZAM_.FieldCount-1 do
  begin
    Progress(trunc(i/(TZAM_.FieldCount-1)*100));
    if TZAM_.Fields[i].Tag <> 999 then
    begin
      inc(lid);
      for j:=1 to 10 do begin
        TL2b_.Insert;
        TL2b_TLID.Value := j;
        TL2b_LOGID.Value := lid;
        TL2b_FYZID.Value := 0;
        TL2b_NAZOV.Value := TZAM_.Fields[i].FieldName;
        TL2b_TLACIT.Value := False;
        TL2b_SIRKA.Value := 30;
        TL2b_.Post;
      end;
    end;
  end;
  finally
  TL2a_.Refresh;
  TL2b_.First;
  Progress(100);
  end;
end;end;

end.
