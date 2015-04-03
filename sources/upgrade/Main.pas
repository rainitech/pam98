unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Menus, StdCtrls, ExtCtrls, Buttons, Db, DBTables;

{$i include.inc}

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    OpenDialog1: TOpenDialog;
    Btn_upgrade: TButton;
    Btn_koniec: TButton;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    StatusBox: TRichEdit;
    Label2: TLabel;
    Label3: TLabel;
    Query1: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Btn_koniecClick(Sender: TObject);
    procedure Btn_upgradeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    adresar_data:string;
    function old_exe: string;
    function verzia_exe: string;
    procedure status(const s:string);
    procedure najdi_exe;
    function kontrola_exe:boolean;
    procedure upgrade_pam(var chyba:string);
    procedure upgrade;
  end;

var
  Form1: TForm1;

implementation

uses FMXUtils, MyConsts,
{$IFDEF UPGRADE_20_TO_21} Konv211, {$ENDIF}
{$IFDEF UPGRADE_21_TO_22} Konv220, {$ENDIF}
{$IFDEF UPGRADE_22_TO_23} Konv230, {$ENDIF}
{$IFDEF UPGRADE_23_TO_24} Konv240, {$ENDIF}
{$IFDEF UPGRADE_24_TO_25} Konv250, {$ENDIF}
{$IFDEF UPGRADE_25_TO_26} Konv260, {$ENDIF}
{$IFDEF UPGRADE_26_TO_27} Konv270, {$ENDIF}
{$IFDEF UPGRADE_27_TO_28} Konv280, {$ENDIF}
{$IFDEF UPGRADE_28_TO_29} Konv290, {$ENDIF}
{$IFDEF UPGRADE_29_TO_30} Konv300, {$ENDIF}
{$IFDEF UPGRADE_30_TO_31} Konv310, {$ENDIF}
{$IFDEF UPGRADE_31_TO_32} Konv320, {$ENDIF}
{$IFDEF UPGRADE_32_TO_33} Konv330, {$ENDIF}
{$IFDEF UPGRADE_33_TO_40} Konv400, {$ENDIF}
{$IFDEF UPGRADE_40_TO_41} Konv410, {$ENDIF}
{$IFDEF UPGRADE_41_TO_42} Konv420, {$ENDIF}
{$IFDEF UPGRADE_42_TO_43} Konv430, {$ENDIF}
{$IFDEF UPGRADE_43_TO_44} Konv440, {$ENDIF}
{$IFDEF UPGRADE_44_TO_50} Konv500, {$ENDIF}
ExecTh;

{$R *.DFM}

function TForm1.old_exe: string;
var pom1:string;
const prg='\PAM.EXE';
begin
  pom1:=':\Program Files\Pro26\';
  result:='C'+pom1+'Pam98'+prg;
  if FileExists(result) then exit;
  result:='D'+pom1+'Pam98'+prg;
  if FileExists(result) then exit;
  result:='C'+pom1+'Pam98v30'+prg;
  if FileExists(result) then exit;
  result:='D'+pom1+'Pam98v30'+prg;
  if FileExists(result) then exit;
  result:='C'+pom1+'Pam98v22'+prg;
  if FileExists(result) then exit;
  result:='D'+pom1+'Pam98v22'+prg;
  if FileExists(result) then exit;
  result:='C'+pom1+'Pam98v21'+prg;
  if FileExists(result) then exit;
  result:='D'+pom1+'Pam98v21'+prg;
  if FileExists(result) then exit;
  result:='';
end;

function TForm1.verzia_exe: string;
var f:file of char;c:char;s:string;i:integer;
begin
  assignfile(f,MyPamPath+'PAM.EXE');
  FileMode := 0;
  reset(f);
  result:='200';s:='';seek(f,765468);for i:=1 to 12 do begin read(f,c);s:=s+c;end;
  if Pos('Verzia 2.0.',s)<>0 then exit;
  result:='201';s:='';seek(f,770040);for i:=1 to 12 do begin read(f,c);s:=s+c;end;
  if Pos('Verzia 2.01.',s)<>0 then exit;
  result:='203';s:='';seek(f,770040);for i:=1 to 12 do begin read(f,c);s:=s+c;end;
  if Pos('Verzia 2.03.',s)<>0 then exit;
  result:='210';s:='';seek(f,770996);for i:=1 to 12 do begin read(f,c);s:=s+c;end;
  if Pos('Verzia 2.10.',s)<>0 then exit;
  result:='211';s:='';seek(f,771168);for i:=1 to 12 do begin read(f,c);s:=s+c;end;
  if Pos('Verzia 2.11.',s)<>0 then exit;
  result:='212';s:='';seek(f,771168);for i:=1 to 12 do begin read(f,c);s:=s+c;end;
  if Pos('Verzia 2.12.',s)<>0 then exit;
  result:='215';s:='';seek(f,773376);for i:=1 to 12 do begin read(f,c);s:=s+c;end;
  if Pos('Verzia 2.15.',s)<>0 then exit;
  result:='216';s:='';seek(f,773376);for i:=1 to 12 do begin read(f,c);s:=s+c;end;
  if Pos('Verzia 2.16.',s)<>0 then exit;
  result:='220';s:='';seek(f,807708);for i:=1 to 12 do begin read(f,c);s:=s+c;end;
  if Pos('Verzia 2.20.',s)<>0 then exit;
  result:='000';
  closefile(f);
end;

procedure TForm1.status(const s:string);
begin
  StatusBox.Text:=StatusBox.Text+s+#10;
  update;
end;

procedure TForm1.najdi_exe;
var Pom: String;
begin
  if OpenDialog1.Execute then
  begin
    Pom:=Copy(OpenDialog1.FileName,LENGTH(OpenDialog1.FileName)-7+1,7);
    if UpperCase(Pom)<>'PAM.EXE'
      then MyError('MusÌte vybraù s˙bor PAM.EXE')
      else Edit1.Text := UpperCase(OpenDialog1.FileName);
  end;
end;

function TForm1.kontrola_exe:boolean;
var Pom: String;
begin
  Edit1.Text := Trim(Edit1.Text);
  Result:=false;
  Pom:=Copy(Edit1.Text,LENGTH(Edit1.Text)-7+1,7);
  if UpperCase(Pom)<>'PAM.EXE'then begin
    MyError('V ˙plnej ceste musÌ byù uvedenÈ aj meno programu.');
    exit;
  end;
  if NOT FileExists(Edit1.Text) then begin
    MyError('Neexistuje s˙bor '+Edit1.Text);
    exit;
  end;
  MyPamPath:=ExtractFileDir(Edit1.Text)+'\';
  MyNetPath:=MyPamPath;
  Result:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DBTables.Session.ConfigMode := [cfmSession];
  DBTables.Session.Close;
  DBTables.Session.AddPassword(MyPassword(MyDbPassword));
  DBTables.Session.Open;
  Edit1.Text := old_exe;
  Caption := DEF_TITLE;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  najdi_exe;
end;

procedure TForm1.Btn_koniecClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.upgrade_pam(var chyba:string);
var old_verzia,parametre:string;
begin
  chyba:='';
  old_verzia:=DEF_BKP_EXT; {verzia_exe;}
  if NOT FileExists(MyPamPath+'PAM.'+OLD_VERZIA)
    then MoveFile(MyPamPath+'PAM.EXE',MyPamPath+'PAM.'+OLD_VERZIA);
  try
  if FileExists(DEF_DATA+'pam.arj') then begin
    CopyFile(DEF_DATA+'pam.arj',MyPamPath);
    CopyFile('ARJ.EXE',MyPamPath);
    parametre:='X -Y -D '+'pam';
    ExecuteFileX('ARJ.EXE',parametre,MyPamPath,1);
  end;
  if FileExists(DEF_DATA+'pam.zip') then begin
    ExecuteFileX('UNZIP.EXE','-o -d '+GetShortFilename(MyPamPath)+' '+DEF_DATA+'pam.zip','',1);
  end;
 except on E:Exception do begin chyba:=E.Message;end;end;
end;

procedure TForm1.upgrade;
var i:integer;s,s1,s2,chyba,vysledok:string;
begin
try
  MyCommPth:=MyPamPath+'COMMON\';
  MyPrivPth:=MyPamPath+'PRIVATE\';
  zalohovanie;
{$IFDEF UPGRADE_COMMON_ROK}
  for i:=DEF_ROK_OD to DEF_ROK_DO do
  begin
    s1:='COMMON\ROK'+IntToStr(i);
    upgrade_common_rok(i,chyba);
    if chyba='NEEXISTUJE' then chyba:=''
    else if chyba<>''
    then Form1.Status('Konverzia adres·ra '+s1+' : CHYBA '+chyba)
    else Form1.Status('Konverzia adres·ra '+s1+' : OK.');
    if chyba<>'' then begin
      MyError('Chyba konverzie adres·ra '+s1+' : '+chyba);
      exit;
    end;
  end;
{$ENDIF}
  upgrade_common(chyba);
  if chyba<>'' then begin
    MyError('Chyba konverzie adres·ra COMMON : '+chyba);
    exit;
  end;
  upgrade_private(chyba);
  if chyba<>''
    then Form1.Status('Konverzia adres·ra PRIVATE : CHYBA '+chyba)
    else Form1.Status('Konverzia adres·ra PRIVATE : OK.');
    if chyba<>'' then begin
      MyError('Chyba konverzie adres·ra PRIVATE : '+chyba);
      exit;
    end;
  for i:=0 to 99 do
  begin
    if i=0 then s:='' else s:=Format('%.2d',[i]);
    s1:='DATA'+s;
    adresar_data:=Copy(s1+'      ',1,6);
    {Upgrade pre DATAxx adres·r}
    MyDataPth:=MyPamPath+'DATA'+s+'\';
    if (FileExists(MyDataPth+'INF.DB')) and
       (FileExists(MyDataPth+'ZAM.DB')) and
       (FileExists(MyDataPth+'VYP.DB')) then
    try
      upgrade_data(chyba);
      if chyba<>''
      then Form1.Status('Konverzia adres·ra '+Form1.adresar_data+' : CHYBA '+chyba)
      else Form1.Status('Konverzia adres·ra '+Form1.adresar_data+' : OK.');
      if chyba<>'' then
        MyError('Chyba konverzie adres·ra '+s1+' : '+chyba);
    finally
    end;
    {Upgrade pre DATASKK adres·r}
    MyDataPth:=MyPamPath+'DATA'+s+'\datask\';
    if (FileExists(MyDataPth+'INF.DB')) and
       (FileExists(MyDataPth+'ZAM.DB')) and
       (FileExists(MyDataPth+'VYP.DB')) then
    try
      upgrade_data_skk(chyba);
      if chyba<>''
      then Form1.Status('Konverzia adres·ra '+Form1.adresar_data+' : CHYBA '+chyba)
      else Form1.Status('Konverzia adres·ra '+Form1.adresar_data+' : OK.');
      if chyba<>'' then
        MyError('Chyba konverzie adres·ra '+s1+' : '+chyba);
    finally
    end;
  end;
  try
    if DEF_ROK_DO=2013 then begin
      Status('V karte zamestnancov prebehlo rozdelenie ulice na samostatnÈ polia'#13#10'1.ulicu,2.orientaËnÈ ËÌslo,3.s˙pisnÈ ËÌslo.'#13#10'Protokol si mÙûete pozrieù v s˙bore: '+MyPamPath+'ADR'+IntToStr(DEF_ROK_DO)+'.html');
      MyMessage('V karte zamestnancov prebehlo rozdelenie ulice na samostatnÈ polia'#13#10'1.ulicu,2.orientaËnÈ ËÌslo,3.s˙pisnÈ ËÌslo.'#13#10'Protokol si mÙûete pozrieù v s˙bore: '+MyPamPath+'ADR'+IntToStr(DEF_ROK_DO)+'.html');
    end;
    upgrade_pam(chyba);
    if PocetChybKonverzie = 0
    then Status('Konverzia programu PAM98  : OK.')
    else Status('Konverzia programu PAM98  : PoËet ch˝b: '+IntToStr(PocetChybKonverzie)+',CHYBA '+chyba);
   {$IFDEF XXX_UPGRADE_25_TO_26}
       MyMessage('UPGRADE PAM98 ⁄SPEäNE UKON»EN›.');
   {$ELSE}
    if PocetChybKonverzie = 0 then begin
       s2:='UPGRADE PROGRAMU PAM98 BOL ⁄SPEäNE UKON»EN›.'#13#10'PRI PRVOM SPUSTENÕ PROGRAMU BUDE VYGENEROVAN› NOV› IDENTIFIKA»N› K”D.';
      {$IFDEF UPGRADE_30_TO_31}
         s2:=s2+#13#10#13#10+'Pre spr·vne fungovanie XFDF a PDF tlaËov˝ch zost·v je potrebnÈ'#13#10'maù nainötalovan˝ prehliadaË ADOBE READER 6.0 CE alebo vyööiu verziu. '#13#10#13#10'Upozornenie: MusÌ to byù verzia s oznaËenÌm "CE"';
      {$ENDIF}
    end else begin
       s2:='UPGRADE PROGRAMU PAM98 SKON»IL S PO»TOM CH›B '+IntToStr(PocetChybKonverzie);
    end;
       MyMessage(s2);
   {$ENDIF}
  finally
  end;
finally
  StatusBox.Lines.SaveToFile(MyPamPath+'AKT'+IntToStr(DEF_ROK_DO)+'.LOG');
end;
end;

procedure TForm1.Btn_upgradeClick(Sender: TObject);
begin
  PocetChybKonverzie := 0;
  if not kontrola_exe then exit;
  try
  upgrade;
  finally
  btn_upgrade.enabled:=false;
  end;
end;


end.
