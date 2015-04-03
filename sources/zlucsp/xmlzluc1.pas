unit xmlzluc1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComObj, Menus, ComCtrls, Buttons;

type
  TForm1 = class(TForm)
    PC1: TPageControl;
    Tab_zluc: TTabSheet;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    Button3: TButton;
    CB_Nuluj: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sucet: array[0..1000] of double;
    msg: TStringList;
  end;

var
  Form1: TForm1;
  Dialog1: TOpenDialog;
  FNameXml: string;
  FPathXml: string;
  FVyslXml: string;
  F:TextFile;
  PomString: string;

implementation

uses MSXML2_TLB, MyConsts, UnicodeUtils, Inifiles, FmxUtils;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
  F:TIniFile;s:string;hod:double;SL:TStringList;
  Doc1,Doc2: IXMLDOMDocument;
  Len1,Len2,i,j: Integer;
  EL1,EL2,N1,N2: IXMLDOMNodeList;
  EL1Z,EL2Z,POM: IXMLDOMNode;
  PomPath,PomFN,PomFN2,SumFN,LogFN,obd1,obd2:string;
  Rok:integer;
  TagNameOfPriloha: string;
  typDoc1,typDoc2:string;
  obdobieElement:string;
procedure SucetInt(iNodeName:string);
  var H1,H2 : string; C1,C2:longint;
begin
  N1 := Doc1.documentElement.getElementsByTagName(iNodeName);
  N2 := Doc2.documentElement.getElementsByTagName(iNodeName);
  if (N1.length=0) or (N2.length=0) then exit;
  H1 := N1.item[0].Text;
  H2 := N2.item[0].Text;
  if (H1='') and (H2='') then exit;
  if (H1='') then H1:='0';
  if (H2='') then H2:='0';
  try
    C1:=StrToInt(H1);
    C2:=StrToInt(H2);
    Doc1.documentElement.getElementsByTagName(iNodeName).item[0].Text:=IntToStr(C1+C2);
    Memo1.Lines.Add(Format('%-40s %-10d %-10d %-10d',[iNodeName,C1,C2,C1+C2]));
  except on EConvertError do MyMessage('chyba '+iNodeName);
  end;
end;
procedure SucetFloat(iNodeName:string);
  var H1,H2 : string; C1,C2:double;
begin
  N1 := Doc1.documentElement.getElementsByTagName(iNodeName);
  N2 := Doc2.documentElement.getElementsByTagName(iNodeName);
  if (N1.length=0) or (N2.length=0) then exit;
  H1 := N1.item[0].Text;
  H2 := N2.item[0].Text;
  if (H1='') and (H2='') then exit;
  if (H1='') then H1:='0';
  if (H2='') then H2:='0';
  try
    C1:=StrToFloat(H1);
    C2:=StrToFloat(H2);
    Doc1.documentElement.getElementsByTagName(iNodeName).item[0].Text:=Format('%-.2f',[C1+C2]);
    Memo1.Lines.Add(Format('%-40s %16.2f %16.2f %16.2f',[iNodeName,C1,C2,C1+C2]));
  except on EConvertError do MyMessage('chyba '+iNodeName);
  end;
end;
function ConvertNodeToFloat(iText:string): double;
  var H1 : string; C1:double;
begin
  Result:=0;
  H1 := iText;
  try
    C1:=StrToDouble(H1);
    Result := C1;
  except
  end;
end;
begin
  Memo1.Clear;

  if not FileExists(Edit1.Text) then begin MyError('S˙bor Ë.1 neexistuje');exit;end;
  if not FileExists(Edit2.Text) then begin MyError('S˙bor Ë.2 neexistuje');exit;end;
  if not MyOtazka('Naozaj si ûel·te spustiù zl˙Ëenie XML s˙borov ?') then exit;
{Precitaj konfiguraciu}
  SL:=TStringList.Create;
  MyIniFile.ReadSection('SUCET',SL);

{Spusti vypocet}
  FVyslXml := Edit1.Text;
  PomPath := ExtractFilePath(Edit1.Text);
  PomFN2 := ExtractFileName(Edit1.Text);
  PomFN := Copy(PomFN2,1,Length(PomFN2)-4)+'_zluc.xml';
  SumFN := PomPath + '_' + Copy(PomFN2,1,Length(PomFN2)-4)+'_sum.txt';
  LogFN := PomPath + '_' + Copy(PomFN2,1,Length(PomFN2)-4)+'_log.txt';
  FVyslXml := PomPath+PomFN;

  Doc1 := CreateOleObject('Microsoft.XMLDOM') as IXMLDomDocument;
  Doc2 := CreateOleObject('Microsoft.XMLDOM') as IXMLDomDocument;

  Doc1.load(Edit1.Text);
  Doc2.load(Edit2.Text);

  typDoc1 := Doc1.documentElement.getElementsByTagName('typDoc').item[0].Text;
  typDoc2 := Doc2.documentElement.getElementsByTagName('typDoc').item[0].Text;
  if (typDoc1<>'VPP00001') and (typDoc1<>'MVP00001') then begin MyError('Chyba: Element typDoc v dokumente 1 nem· povolen˙ hodnotu MVP00001 alebo VPP00001.');exit; end;
  if (typDoc2<>'VPP00001') and (typDoc2<>'MVP00001') then begin MyError('Chyba: Element typDoc v dokumente 2 nem· povolen˙ hodnotu MVP00001 alebo VPP00001.');exit; end;
  if typDoc1 <> typDoc2 then begin MyError('Chyba: Element typDoc nie je rovnak˝ v obidvoch s˙boroch, s˙bory nie je moûnÈ zl˙Ëiù.');exit; end;

  if typDoc1 = 'MVP00001' then obdobieElement:='obdobie' else obdobieElement:='obdobieVyplPrijmov';
  obd1 := Doc1.documentElement.getElementsByTagName(obdobieElement).item[0].Text;
  obd2 := Doc2.documentElement.getElementsByTagName(obdobieElement).item[0].Text;
  if obd1 <> obd2 then begin MyError('Chyba: Element "'+obdobieElement+'" nie je rovnak˝ v obidvoch s˙boroch, s˙bory nie je moûnÈ zl˙Ëiù.');exit; end;
  Rok:=StrToInt(Copy(obd1,3,4));

  Memo1.Lines.Add('ZaËiatok : '+DateTimeToStr(Now));
  Memo1.Lines.Add('---');
  {Scitaj polozky}
  for i:=0 to SL.Count-1 do
  begin
    SucetFloat(SL.Strings[i]);
  end;

  TagNameOfPriloha := MyIniFile.ReadString('MAIN','PRILOHA','');
  EL1Z:=Doc1.documentElement.getElementsByTagName(TagNameOfPriloha).item[0];
  EL1:=EL1Z.ChildNodes;
  Len1 := EL1.Get_length;
  EL2Z:=Doc2.documentElement.getElementsByTagName(TagNameOfPriloha).item[0];
  EL2:=EL2Z.ChildNodes;
  Len2 := EL2.Get_length;
  Memo1.Lines.Add('Spracovanie prÌlohy - zaËiatok');
  for i := 0 to Len2 - 1 do begin
    EL2.item[i].attributes.item[0].text := IntToStr(Len1 + StrToInt(EL2.item[i].attributes.item[0].text));
     if i=0 then for j:=0 to EL2.item[i].attributes.length-1 do sucet[j]:=0;
     for j:=0 to EL2.item[i].attributes.length-1 do begin
       PomString :=  EL2.item[i].attributes.item[j].text;
       sucet[j]:=sucet[j]+ConvertNodeToFloat(PomString);
       if i=Len2 - 1 then begin
         //MyMessage(EL2.item[i].attributes.item[j].nodeName+' = ');
         //MyMessage(Format('%14.2f',[sucet[j]]));
         msg.add(EL2.item[i].attributes.item[j].nodeName+' = '+Format('%.2n',[sucet[j]]));
         //MyMessage(EL2.item[i].attributes.item[j].nodeName+' = '+Format('%14.2f',[sucet[j]]));
       end;
     end;
     if i=Len2 - 1 then begin
       {msg.SaveToFile(SumFN);}
     end;
(*
    if CB_Nuluj.State=cbChecked then begin
      for j:=0 to EL2.item[i].attributes.length-1 do begin
        if (EL2.item[i].attributes.item[j].nodeName = 'vzNpGp') or
           (EL2.item[i].attributes.item[j].nodeName = 'vzSpIpPvnPdrf') or
           (EL2.item[i].attributes.item[j].nodeName = 'vzNp') or
           (EL2.item[i].attributes.item[j].nodeName = 'vzSp') or
           (EL2.item[i].attributes.item[j].nodeName = 'vzIp') or
           (EL2.item[i].attributes.item[j].nodeName = 'vzPvn') or
           (EL2.item[i].attributes.item[j].nodeName = 'vzRfs')
        then
        EL2.item[i].attributes.item[j].text := '0';
     end;
    end;
*)
    POM := EL2.item[i].cloneNode(true);
    EL1Z.appendChild(POM);
  end;
  Memo1.Lines.Add('Spracovanie prÌlohy - koniec');
  Doc1.Save(FVyslXml);
  Memo1.Lines.Add('V˝sledn˝ s˙bor : '+FVyslXml);
  Memo1.Lines.Add('---');
  Memo1.Lines.Add('Koniec : '+DateTimeToStr(Now));
  Memo1.Lines.SaveToFile(LogFN);
  ExecuteFileX('notepad',LogFN,'',1);
  MyMessage(Format('Zl˙Ëenie prebehlo v poriadku. V˝sledn˝ s˙bor je %s.',[FVyslXml]));
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  DecimalSeparator := '.';
  PC1.ActivePage := tab_zluc;
  Memo1.Clear;
  Edit1.Text := '';
  Edit2.Text := '';
  msg:= TStringList.Create;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  FPath:string;
  FExt:String;
  FName:String;
begin
try
  Dialog1:=TOpenDialog.Create(Application);
  with Dialog1 do
  begin
    DefaultExt:='xml';
    Filter:='SP - XML files|sp*.xml;mvpp*.xml;vpp*.xml;vykaz*.*|All XML files|*.xml';
    FilterIndex:=1;
    InitialDir:=MyAppPath+MenoXMLDir;
    Options:=[ofFileMustExist,ofNoDereferenceLinks,ofPathMustExist{,ofExtensionDifferent},ofHideReadOnly];
    Title:=SMyAppXmlVyber;
    repeat
      if not Dialog1.Execute then exit;
      FPath:=ExtractFilePath(Dialog1.FileName);
      FName:=ExtractFileName(Dialog1.FileName);
      FExt :=UpperCase(ExtractFileExt(FName));
    until (FExt='.XML');
    Edit1.Text := Dialog1.FileName;
  end;
finally
  Dialog1.Free;
  SetCurrentDir(MyAppPath);
end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var
  FPath:string;
  FExt:String;
  FName:String;
begin
try
  Dialog1:=TOpenDialog.Create(Application);
  with Dialog1 do
  begin
    DefaultExt:='xml';
    Filter:='SP - XML files|sp*.xml;mvpp*.xml;vpp*.xml;vykaz*.*|All XML files|*.xml';
    FilterIndex:=1;
    InitialDir:=MyAppPath+MenoXMLDir;
    Options:=[ofFileMustExist,ofNoDereferenceLinks,ofPathMustExist{,ofExtensionDifferent},ofHideReadOnly];
    Title:=SMyAppXmlVyber;
    repeat
      if not Dialog1.Execute then exit;
      FPath:=ExtractFilePath(Dialog1.FileName);
      FName:=ExtractFileName(Dialog1.FileName);
      FExt :=UpperCase(ExtractFileExt(FName));
    until (FExt='.XML');
    Edit2.Text := Dialog1.FileName;
  end;
finally
  Dialog1.Free;
  SetCurrentDir(MyAppPath);
end;
end;


procedure TForm1.Button3Click(Sender: TObject);
begin
  Application.Terminate;
end;



end.

