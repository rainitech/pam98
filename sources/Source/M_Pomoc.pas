unit M_Pomoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls;

type
  TFormMenuPomoc = class(TForm)
    procedure Akcia_zoznam_zmien_verzie(Sender: TObject);
    procedure Akcia_zoznam_zmien_2008(Sender: TObject);
    procedure Akcia_zoznam_zmien_080701(Sender: TObject);
    procedure Akcia_zoznam_zmien_2009(Sender: TObject);
    procedure Akcia_zoznam_zmien_2010(Sender: TObject);
    procedure Akcia_zoznam_zmien_2011(Sender: TObject);
    procedure Akcia_zoznam_zmien_2012(Sender: TObject);
   procedure Akcia_zoznam_zmien_090701(Sender: TObject);
    procedure Akcia_kalkulacka(Sender: TObject);
    procedure Zoznamskratiek1Click(Sender: TObject);
    procedure XmlEditor1Click(Sender: TObject);
    procedure VyberTlacovehoSuboruClick(Sender: TObject);
    procedure OdbcManazer1Click(Sender: TObject);
    procedure InternetMain(Sender: TObject);
    procedure Show_FormAbout(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateFormStatus(const F:TForm;const SB:TStatusBar);
    procedure CreateMenuPomoc(M:TMainMenu);
  end;

var
  FormMenuPomoc: TFormMenuPomoc;
  Dialog1: TOpenDialog;

implementation

uses RXCalc, Pomoc, About, Dm_main, MyConsts, FmxUtils;

{$R *.DFM}


procedure TFormMenuPomoc.Akcia_zoznam_zmien_verzie(Sender: TObject);
begin
  ExecuteFile(MyFrmPath+'pam98_zmeny_verzie.rtf','','',1)
end;

procedure TFormMenuPomoc.Akcia_zoznam_zmien_2008(Sender: TObject);
begin
  ExecuteFile(MyFrmPath+'pam98_zmeny_2008.rtf','','',1)
end;

procedure TFormMenuPomoc.Akcia_zoznam_zmien_080701(Sender: TObject);
begin
  ExecuteFile(MyFrmPath+'pam98_zmeny_080701.rtf','','',1)
end;

procedure TFormMenuPomoc.Akcia_zoznam_zmien_2009(Sender: TObject);
begin
  ExecuteFile(MyFrmPath+'pam98_zmeny_2009.rtf','','',1)
end;

procedure TFormMenuPomoc.Akcia_zoznam_zmien_2010(Sender: TObject);
begin
  ExecuteFile(MyFrmPath+'pam98_zmeny_2010.rtf','','',1)
end;

procedure TFormMenuPomoc.Akcia_zoznam_zmien_2011(Sender: TObject);
begin
  ExecuteFile(MyFrmPath+'pam98_zmeny_2011.rtf','','',1)
end;

procedure TFormMenuPomoc.Akcia_zoznam_zmien_2012(Sender: TObject);
begin
  ExecuteFile(MyFrmPath+'pam98_zmeny_2012.rtf','','',1)
end;

procedure TFormMenuPomoc.Akcia_zoznam_zmien_090701(Sender: TObject);
begin
  ExecuteFile(MyFrmPath+'pam98_zmeny_090701.rtf','','',1)
end;

procedure TFormMenuPomoc.Akcia_kalkulacka(Sender: TObject);
begin
  FormCalc.Show;
end;

procedure TFormMenuPomoc.InternetMain(Sender: TObject);
begin
  ExecuteFile('iexplore','http://www.pam98.eu/','',1)
end;

procedure TFormMenuPomoc.Zoznamskratiek1Click(Sender: TObject);
begin
  FormPomoc:=TFormPomoc.Create(Application);
  try
  FormPomoc.ShowModal;
  finally
  FormPomoc.Free;
  end;
end;

procedure TFormMenuPomoc.XmlEditor1Click(Sender: TObject);
begin
try
  Dialog1:=TOpenDialog.Create(Application);
  with Dialog1 do
  begin
    InitialDir:=MyAppPath+MenoXMLDir;
{
    DefaultExt:='xml';
    Filter:='SP - XML files (sp*.xml)|sp*.xml';
    FilterIndex:=1;
    Options:=[ofFileMustExist,ofNoDereferenceLinks,ofPathMustExist,ofHideReadOnly];
    Title:=SMyAppXmlVyber;
    repeat
      if not Dialog1.Execute then exit;
      FPath:=ExtractFilePath(Dialog1.FileName);
      FName:=ExtractFileName(Dialog1.FileName);
      FExt :=UpperCase(ExtractFileExt(FName));
      Pismeno1:=StrToChar(UpperCase(Copy(FName,1,1)));
      Pismeno2:=StrToChar(UpperCase(Copy(FName,2,1)));
    until (FExt='.XML') AND (Pismeno1='S') and (Pismeno2='P');
    MyMessage(Dialog1.FileName);
}
    ExecuteFile(MyAppPath+'pxe.exe','',InitialDir,SW_MAXIMIZE);
  end;
finally
  Dialog1.Free;
  SetCurrentDir(MyAppPath);
end;
end;

procedure TFormMenuPomoc.OdbcManazer1Click(Sender: TObject);
begin
try
  Dialog1:=TOpenDialog.Create(Application);
  with Dialog1 do
  begin
    InitialDir:=MyAppPath;
    ExecuteFile('odbcad32','',InitialDir,SW_NORMAL);
  end;
finally
  Dialog1.Free;
  SetCurrentDir(MyAppPath);
end;
end;

procedure TFormMenuPomoc.VyberTlacovehoSuboruClick(Sender: TObject);
begin
try
  Dialog1:=TOpenDialog.Create(Application);
  with Dialog1 do
  begin
    if MyRepPath1=''
    then InitialDir:=MyNetPath+MenoXMLDir
    else InitialDir:=MyRepPath1;
    DefaultExt:='';
    Filter:='*.*';
    FilterIndex:=1;
    Options:=[ofFileMustExist,ofNoDereferenceLinks,ofPathMustExist,ofHideReadOnly];
    Title:='Výber súboru';
    repeat
      if not Dialog1.Execute then exit;
      ExecuteFileX(Dialog1.FileName,'',InitialDir,SW_MAXIMIZE);
    until false;
  end;
finally
  Dialog1.Free;
  SetCurrentDir(MyAppPath);
end;
end;

procedure TFormMenuPomoc.Show_FormAbout(Sender: TObject);
begin
  if FormAbout=nil then Application.CreateForm(TFormAbout, FormAbout);
  FormAbout.ShowModal;
end;

procedure TFormMenuPomoc.UpdateFormStatus(const F:TForm;const SB:TStatusBar);
begin with DM do begin
 MyStatus:='Výplatné obdobie: '+AktObdobieStr2;
 MyCaption:='PAM98 '+UpperCase(Copy(MyVerzia,1,Length(MyVerzia)-1))+' - Firma: '+TINF_Nazov.Value+
             ' - Stredisko: '+AktStrediskoStr;
 SB.Panels[0].Text:= MyStatus;
 F.Caption := MyCaption;
end;end;

procedure TFormMenuPomoc.CreateMenuPomoc(M:TMainMenu);
var Item1,Item2:TMenuItem;
begin
  Item1 := TMenuItem.Create(M);
  Item1.Caption := 'Pomoc';
  M.Items.Add(Item1);
  {}
  Item2 := TMenuItem.Create(Item1);
  Item2.Caption := 'PAM98 - popis zmien programu';
  Item2.OnClick := Akcia_zoznam_zmien_verzie;
  Item1.Add(Item2);
  {}
  Item2 := TMenuItem.Create(Item1);
  Item2.Caption := 'PAM98 - zmeny platné od 1.1.2008';
  Item2.OnClick := Akcia_zoznam_zmien_2008;
  Item1.Add(Item2);
  {}
  Item2 := TMenuItem.Create(Item1);
  Item2.Caption := 'PAM98 - zmeny platné od 1.7.2008';
  Item2.OnClick := Akcia_zoznam_zmien_080701;
  Item1.Add(Item2);
  {}
  Item2 := TMenuItem.Create(Item1);
  Item2.Caption := 'PAM98 - zmeny platné od 1.1.2009';
  Item2.OnClick := Akcia_zoznam_zmien_2009;
  Item1.Add(Item2);
  {}
  Item2 := TMenuItem.Create(Item1);
  Item2.Caption := 'PAM98 - zmeny platné od 1.7.2009';
  Item2.OnClick := Akcia_zoznam_zmien_090701;
  Item1.Add(Item2);
  {}
  Item2 := TMenuItem.Create(Item1);
  Item2.Caption := 'PAM98 - zmeny platné od 1.1.2010';
  Item2.OnClick := Akcia_zoznam_zmien_2010;
  Item1.Add(Item2);
  {}
  Item2 := TMenuItem.Create(Item1);
  Item2.Caption := 'PAM98 - zmeny platné od 1.1.2011';
  Item2.OnClick := Akcia_zoznam_zmien_2011;
  Item1.Add(Item2);
  {}
  Item2 := TMenuItem.Create(Item1);
  Item2.Caption := 'PAM98 - zmeny platné od 1.1.2012';
  Item2.OnClick := Akcia_zoznam_zmien_2012;
  Item1.Add(Item2);
  {}
  Item2 := TMenuItem.Create(Item1);
  Item2.Caption := '-';
  Item1.Add(Item2);
  {}
  Item2 := TMenuItem.Create(Item1);
  Item2.Caption := 'Kalkulaèka';
  Item2.OnClick := Akcia_kalkulacka;
  Item1.Add(Item2);
  {}
  Item2 := TMenuItem.Create(Item1);
  Item2.Caption := '&XML editor';
  Item2.OnClick := XmlEditor1Click;
  Item1.Add(Item2);
  {}
  Item2 := TMenuItem.Create(Item1);
  Item2.Caption := '&ODBC manažér';
  Item2.OnClick := OdbcManazer1Click;
  Item1.Add(Item2);
  {}
  Item2 := TMenuItem.Create(Item1);
  Item2.Caption := '&Popis významu skratiek vo výplate';
  Item2.OnClick := Zoznamskratiek1Click;
  Item1.Add(Item2);
  {}
  Item2 := TMenuItem.Create(Item1);
  Item2.Caption := '-';
  Item1.Add(Item2);
  {}
  Item2 := TMenuItem.Create(Item1);
  Item2.Caption := '&Výber súboru';
  Item2.OnClick := VyberTlacovehoSuboruClick;
  Item1.Add(Item2);
  {}
  Item2 := TMenuItem.Create(Item1);
  Item2.Caption := '-';
  Item1.Add(Item2);
  {}
  Item2 := TMenuItem.Create(Item1);
  Item2.Caption := 'Internet - informácie o PAM98';
  Item2.OnClick := InternetMain;
  Item1.Add(Item2);
  {}
  Item2 := TMenuItem.Create(Item1);
  Item2.Caption := '-';
  Item1.Add(Item2);
  {}
  Item2 := TMenuItem.Create(Item1);
  Item2.Caption := '&O programe (verzia programu)';
  Item2.OnClick := Show_FormAbout;
  Item1.Add(Item2);
end;


end.
