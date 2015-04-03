unit uReplace;

interface

uses Dialogs, SysUtils, Classes;

function replacewords(FileName: PChar; KeyWords: PChar; FileNameOut: PChar): Integer; cdecl;

implementation

var
    slFile: TStringList;
    slKeyWords: TStringList;

const
    KEY_WORD  = '$OBJEKTY';
    DELIMITER = '~';
    RTF_EOL   = '\par }{\f1\fs18\insrsid16521357 ';

procedure OpenFile(FileName: String; slFile: TStringList);
begin
  slFile.Clear;
  slFile.LoadFromFile(FileName);
end;

procedure SaveFile(FileName: String; slFile: TStringList);
begin
  slFile.SaveToFile(FileName);
  slFile.Clear;
end;

function replacewords(FileName: PChar; KeyWords: PChar; FileNameOut: PChar): Integer; cdecl;
var i: Integer;
    sReplaceString: String;
begin
  try
    OpenFile(KeyWords, slKeyWords);
    sReplaceString := slKeyWords.Strings[0];
    OpenFile(FileName, slFile);
    for i := 0 to slFile.Count - 1 do
      begin
        slFile.Strings[i] := StringReplace(slFile.Strings[i], KEY_WORD, sReplaceString, [rfReplaceAll, rfIgnoreCase]);
        slFile.Strings[i] := StringReplace(slFile.Strings[i], DELIMITER, RTF_EOL, [rfReplaceAll, rfIgnoreCase]);
      end;
    SaveFile(FileNameOut, slFile);
    Result := 0;
  except
    on E:Exception do
      begin
        MessageDlg('Nastala chyba: ' + E.Message, mtError, [mbOK], 0);
        Result := 1;
      end;
  end;
end;

initialization
  slFile := TStringList.Create;
  slKeyWords := TStringList.Create;

finalization
  slFile.Free;
  slKeyWords.Free;

end.
