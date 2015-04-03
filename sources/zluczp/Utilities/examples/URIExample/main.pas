unit main;

// Code Example of using the URI Utilities Library
// Delphi implementation
//
// You need the Open XML Utilities Library 1.0.0 or above to use this source
// code.  The latest version can be found at "http://www.philo.de/xml/".
//
// This example source code shows how  to use
// the resolveRelativeURI() function  and the
// TUriAnalyzer class.

interface

uses
  UriUtils,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label34: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}


procedure TForm1.Edit1Change(Sender: TObject);
var
  UriAnalyzer: TUriStrAnalyzer;
  bufferStr: string;
begin
  UriAnalyzer:= TUriStrAnalyzer.create;
  try
    UriAnalyzer.setUriReference(Edit1.text);
    Label1.Caption:= UriAnalyzer.UriScheme;
    Label2.Caption:= UriAnalyzer.UriAuthority;
    Label3.Caption:= UriAnalyzer.UriPath;
    Label4.Caption:= UriAnalyzer.UriQuery;
    Label5.Caption:= UriAnalyzer.UriFragment;
  finally
    UriAnalyzer.free;
  end;
  resolveRelativeUriStr(Edit1.text,Edit2.text,bufferStr);
  Edit3.text:= bufferStr;
end;

procedure TForm1.Edit2Change(Sender: TObject);
var
  UriAnalyzer: TUriStrAnalyzer;
  bufferStr: string;
begin
  UriAnalyzer:= TUriStrAnalyzer.create;
  try
    UriAnalyzer.setUriReference(Edit2.text);
    Label13.Caption:= UriAnalyzer.UriScheme;
    Label14.Caption:= UriAnalyzer.UriAuthority;
    Label15.Caption:= UriAnalyzer.UriPath;
    Label16.Caption:= UriAnalyzer.UriQuery;
    Label17.Caption:= UriAnalyzer.UriFragment;
  finally
    UriAnalyzer.free;
  end;
  resolveRelativeUriStr(Edit1.text,Edit2.text,bufferStr);
  Edit3.text:= bufferStr;
end;

procedure TForm1.Edit3Change(Sender: TObject);
var
  UriAnalyzer: TUriStrAnalyzer;
begin
  UriAnalyzer:= TUriStrAnalyzer.create;
  try
    UriAnalyzer.setUriReference(Edit3.text);
    Label24.Caption:= UriAnalyzer.UriScheme;
    Label25.Caption:= UriAnalyzer.UriAuthority;
    Label26.Caption:= UriAnalyzer.UriPath;
    Label27.Caption:= UriAnalyzer.UriQuery;
    Label28.Caption:= UriAnalyzer.UriFragment;
  finally
    UriAnalyzer.free;
  end;
end;

end.
