unit xmlzluc1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComObj, Menus, ComCtrls, Buttons;

type
  TForm1 = class(TForm)
    PC1: TPageControl;
    Tab_zluc: TTabSheet;
    tab_pomoc: TTabSheet;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    Button3: TButton;
    CB_Nuluj: TCheckBox;
    Cb_integery: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

uses MSXML2_TLB, MyConsts, UnicodeUtils;

{$R *.DFM}

procedure VytvorConfSubor(iFPath,iFNameXML,iFNameConf:string);
var
  fc:TextFile;fx:text;
  r:integer;i,sum:longint;
  z:word;
  t:WideString;
  s:string;
begin
  assignfile(fx,iFPath+'\'+iFNameXml);
  assignfile(fc,iFPath+'\'+iFNameConf);
{  assignfile(ft,iFPath+'\'+'pokus.txt');}
  reset(fx);
  rewrite(fc);
{  rewrite(ft);}
  writeln(fc,'PAM98 Personalistika a Mzdy');
  writeln(fc,MyVerziaNum);
  writeln(fc,'Pro26 Software House');
  r:=0;sum:=0;
{
  t:=cp1250ToUTF16Char(ord('û'));
  writeln(ft,ord(t[1]));
  t:=cp1250ToUTF16Char(ord('·'));
  writeln(ft,ord(t[1]));
  t:=cp1250ToUTF16Char(ord('a'));
  writeln(ft,ord(t[1]));
}
  repeat
    readln(fx,s);
{    write(ft,s);}
    t:=UTF8ToUTF16BEStr(s);
    for i:=1 to length(t) do
    begin
      z:=word(t[i]);
      sum:=sum+z;
{      write(ft,IntToStr(ord(Z))+' + ');}
    end;
    sum:=sum+23;
    inc(r);{writeln(ft);}
    if r=100 then
    begin
      writeln(fc,IntToStr(sum));
       sum:=0;r:=0;
    end;
  until eof(fx);
  {writeln(ft);}
  writeln(fc,IntToStr(sum));
{  CloseFile(ft);}
  CloseFile(fc);
  CloseFile(fx);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Doc1,Doc2: IXMLDOMDocument;
  Len1,Len2,i,j: Integer;
  ElemList: IXMLDOMNodeList;
  EL1,EL2,N1,N2: IXMLDOMNodeList;
  EL1Z,EL2Z,POM: IXMLDOMNode;
  A1: IXMLDOMAttribute;
  PomPath,PomFN,PomFN2,obd1,obd2:string;
  Rok:integer;
procedure SucetInt(iNodeName:string);
  var H1,H2 : string; C1,C2:longint;
begin
  N1 := Doc1.documentElement.getElementsByTagName(iNodeName);
  N2 := Doc2.documentElement.getElementsByTagName(iNodeName);
  if (N1.length=0) or (N2.length=0) then exit;
  H1 := N1.item[0].Text;
  H2 := N2.item[0].Text;
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
  if CB_Integery.State=cbChecked then begin SucetInt(iNodeName);exit;end;
  N1 := Doc1.documentElement.getElementsByTagName(iNodeName);
  N2 := Doc2.documentElement.getElementsByTagName(iNodeName);
  if (N1.length=0) or (N2.length=0) then exit;
  H1 := N1.item[0].Text;
  H2 := N2.item[0].Text;
  try
    C1:=StrToFloat(H1);
    C2:=StrToFloat(H2);
    Doc1.documentElement.getElementsByTagName(iNodeName).item[0].Text:=Format('%-.2f',[C1+C2]);
    Memo1.Lines.Add(Format('%-40s %-.2f %-.2f %-.2f',[iNodeName,C1,C2,C1+C2]));
  except on EConvertError do MyMessage('chyba '+iNodeName);
  end;
end;
function ConvertNodeToFloat(iText:string): double;
  var H1,H2 : string; C1,C2:double;
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

  if not FileExists(Edit1.Text) then begin MyError('S˙bor Ë.1 neexistuje');exit;end;
  if not FileExists(Edit2.Text) then begin MyError('S˙bor Ë.2 neexistuje');exit;end;
  if not MyOtazka('Naozaj si ûel·te spustiù zl˙Ëenie XML s˙borov ?') then exit;

  FVyslXml := Edit1.Text;
  PomPath := ExtractFilePath(Edit1.Text);
  PomFN2 := ExtractFileName(Edit1.Text);
  PomFN := Copy(PomFN2,1,Length(PomFN2)-4)+'_zluc.xml';
  FVyslXml := PomPath+PomFN;

  Memo1.Clear;
  Doc1 := CreateOleObject('Microsoft.XMLDOM') as IXMLDomDocument;
  Doc2 := CreateOleObject('Microsoft.XMLDOM') as IXMLDomDocument;

  Doc1.load(Edit1.Text);
  Doc2.load(Edit2.Text);

  obd1 := Doc1.documentElement.getElementsByTagName('obdobie').item[0].Text;
  obd2 := Doc2.documentElement.getElementsByTagName('obdobie').item[0].Text;
  if obd1 <> obd2 then begin MyError('Chyba: Element obdobie nie je rovnak˝ v obidvoch s˙boroch, s˙ibory nie je moûnÈ zl˙Ëiù.');exit; end;
  Rok:=StrToInt(Copy(obd1,3,4));

  Memo1.Lines.Add('ZaËiatok : '+DateTimeToStr(Now));

  SucetInt('poistne/np/pocZamNP');
  SucetFloat('poistne/np/npZamtel');
  SucetFloat('poistne/np/npZamnec');

  SucetInt('poistne/sp/pocZamSP');
  SucetFloat('poistne/sp/spZamtel');
  SucetFloat('poistne/sp/spZamnec');

  SucetInt('poistne/ip/pocZamIP');
  SucetFloat('poistne/ip/ipZamtel');
  SucetFloat('poistne/ip/ipZamnec');

  SucetInt('poistne/pvn/pocZamPvN');
  SucetFloat('poistne/pvn/pvnZamtel');
  SucetFloat('poistne/pvn/pvnZamnec');

  SucetInt('poistne/up/pocZamUP');
  SucetFloat('poistne/up/upZamtel');

  SucetInt('poistne/gp/pocZamGP');
  SucetFloat('poistne/gp/gpZamtel');

  SucetInt('poistne/pdRf/pocZamPdRF');
  SucetFloat('poistne/pdRf/pdRfZamtel');

  //v2.7
  SucetInt('poistne/rfs/pocZamRfs');
  SucetFloat('poistne/rfs/rfsZamtel');

  SucetFloat('poistne/spoluPoistne');

  SucetFloat('davkyNP/nemocenske/suma');
  SucetInt('davkyNP/nemocenske/pocetPripadov');
  SucetInt('davkyNP/nemocenske/pocetDni');
  SucetInt('davkyNP/nemocenske/pocetZamncov');

  SucetFloat('davkyNP/osetrovne/suma');
  SucetInt('davkyNP/osetrovne/pocetPripadov');
  SucetInt('davkyNP/osetrovne/pocetDni');
  SucetInt('davkyNP/osetrovne/pocetZamncov');

  SucetFloat('davkyNP/materske/suma');
  SucetInt('davkyNP/materske/pocetPripadov');
  SucetInt('davkyNP/materske/pocetDni');
  SucetInt('davkyNP/materske/pocetZamncov');

  SucetFloat('davkyNP/vyrovnavaciaDavka/suma');
  SucetInt('davkyNP/vyrovnavaciaDavka/pocetPripadov');
  SucetInt('davkyNP/vyrovnavaciaDavka/pocetDni');
  SucetInt('davkyNP/vyrovnavaciaDavka/pocetZamncov');

  SucetFloat('davkyNP/spoluDavkyNP');
  SucetFloat('rozdielPoistneDavky');

  EL1Z:=Doc1.documentElement.getElementsByTagName('priloha/poistneZamestnancov').item[0];
  EL1:=EL1Z.ChildNodes;
  Len1 := EL1.Get_length;
  EL2Z:=Doc2.documentElement.getElementsByTagName('priloha/poistneZamestnancov').item[0];
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
       msg.SaveToFile('sucty-tagov.txt');
     end;
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
    POM := EL2.item[i].cloneNode(true);
    EL1Z.appendChild(POM);
  end;
  Memo1.Lines.Add('Spracovanie prÌlohy - koniec');
  Doc1.Save(FVyslXml);
  Memo1.Lines.Add('Koniec : '+DateTimeToStr(Now));
  //VytvorConfSubor(PomPath,PomFN,ChangeFileExt(PomFN,'.txt'));
  Memo1.Lines.Add('V˝sledn˝ s˙bor : '+FVyslXml);
  //Memo1.Lines.Add('Kontroln˝ s˙bor : '+PomPath+ChangeFileExt(PomFN,'.txt'));
  MyMessage(Format('Zl˙Ëenie prebehlo v poriadku. V˝sledn˝ s˙bor je %s.',[FVyslXml]));
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  DecimalSeparator := '.';
  PC1.ActivePage := tab_zluc;
  Memo1.Clear;
  Edit1.Text := '';
  Edit2.Text := '';
{  Edit1.Text := 'D:\!xml_gfk\SPV0405.XML';
  Edit2.Text := 'D:\!xml_gfk\SPVykaz_001.XML';}
  msg:= TStringList.Create;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  FPath:string;
  FExt:String;
  FName:String;
  Pismeno1:Char;
  Pismeno2:Char;
begin
try
  Dialog1:=TOpenDialog.Create(Application);
  with Dialog1 do
  begin
    DefaultExt:='xml';
    Filter:='SP - XML files|sp*.xml;mvpp*.xml;vykaz*.*|All XML files|*.xml';
    FilterIndex:=1;
    InitialDir:=MyAppPath+MenoXMLDir;
    Options:=[ofFileMustExist,ofNoDereferenceLinks,ofPathMustExist{,ofExtensionDifferent},ofHideReadOnly];
    Title:=SMyAppXmlVyber;
    repeat
      if not Dialog1.Execute then exit;
      FPath:=ExtractFilePath(Dialog1.FileName);
      FName:=ExtractFileName(Dialog1.FileName);
      FExt :=UpperCase(ExtractFileExt(FName));
      Pismeno1:=StrToChar(UpperCase(Copy(FName,1,1)));
      Pismeno2:=StrToChar(UpperCase(Copy(FName,2,1)));
    until (FExt='.XML');
  VytvorConfSubor(FPath,FName,ChangeFileExt(FName,'.txt'));
  MyMessage(Format(SMyAppHPCompletedXml,[ChangeFileExt(Dialog1.FileName,'.txt')]));
  end;
finally
  Dialog1.Free;
  SetCurrentDir(MyAppPath);
end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  FPath:string;
  FExt:String;
  FName:String;
  Pismeno1:Char;
  Pismeno2:Char;
begin
try
  Dialog1:=TOpenDialog.Create(Application);
  with Dialog1 do
  begin
    DefaultExt:='xml';
    Filter:='SP - XML files|sp*.xml;mvpp*.xml;vykaz*.*|All XML files|*.xml';
    FilterIndex:=1;
    InitialDir:=MyAppPath+MenoXMLDir;
    Options:=[ofFileMustExist,ofNoDereferenceLinks,ofPathMustExist{,ofExtensionDifferent},ofHideReadOnly];
    Title:=SMyAppXmlVyber;
    repeat
      if not Dialog1.Execute then exit;
      FPath:=ExtractFilePath(Dialog1.FileName);
      FName:=ExtractFileName(Dialog1.FileName);
      FExt :=UpperCase(ExtractFileExt(FName));
      Pismeno1:=StrToChar(UpperCase(Copy(FName,1,1)));
      Pismeno2:=StrToChar(UpperCase(Copy(FName,2,1)));
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
  Pismeno1:Char;
  Pismeno2:Char;
begin
try
  Dialog1:=TOpenDialog.Create(Application);
  with Dialog1 do
  begin
    DefaultExt:='xml';
    Filter:='SP - XML files|sp*.xml;mvpp*.xml;vykaz*.*|All XML files|*.xml';
    FilterIndex:=1;
    InitialDir:=MyAppPath+MenoXMLDir;
    Options:=[ofFileMustExist,ofNoDereferenceLinks,ofPathMustExist{,ofExtensionDifferent},ofHideReadOnly];
    Title:=SMyAppXmlVyber;
    repeat
      if not Dialog1.Execute then exit;
      FPath:=ExtractFilePath(Dialog1.FileName);
      FName:=ExtractFileName(Dialog1.FileName);
      FExt :=UpperCase(ExtractFileExt(FName));
      Pismeno1:=StrToChar(UpperCase(Copy(FName,1,1)));
      Pismeno2:=StrToChar(UpperCase(Copy(FName,2,1)));
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

