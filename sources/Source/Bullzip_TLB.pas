unit Bullzip_TLB;

{ This file contains pascal declarations imported from a type library.
  This file will be written during each import or refresh of the type
  library editor.  Changes to this file will be discarded during the
  refresh process. }

{ Version 3.2 }

{ Conversion log:
  Warning: _PDFPrinterSettings.GetCompatiblePrinters return parameter of type TSafeArray(WideString) was written as OleVariant
  Warning: _PDFPrinterSettings.GetCompatiblePrinters return parameter of type TSafeArray(WideString) was written as OleVariant
 }

interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL;

const
  Bullzip_PrinterName = 'Bullzip PDF Printer';

const
  LIBID_Bullzip: TGUID = '{61CB5BFA-AFE6-4B0F-A4BB-7F3D4999EE52}';

const

{ Component class GUIDs }
  Class_PDFPrinterSettings: TGUID = '{BEBDC1DF-D793-4F6C-B8FF-E831A1C2595C}';

type

{ Forward declarations: Interfaces }
  _PDFPrinterSettings = interface;
  _PDFPrinterSettingsDisp = dispinterface;

{ Forward declarations: CoClasses }
  PDFPrinterSettings = _PDFPrinterSettings;

  PDFPrinterSettings___v0 = _PDFPrinterSettings;

  PDFPrinterSettings___v1 = _PDFPrinterSettings;

  _PDFPrinterSettings = interface(IDispatch)
    ['{D383D87A-75F9-4660-82FF-D22F7ADCE86F}']
    procedure Init; safecall;
    procedure LoadSettings(isRunOnce: WordBool); safecall;
    procedure WriteSettings(isRunOnce: WordBool); safecall;
    procedure RemoveSettings(isRunOnce: WordBool); safecall;
    procedure SetValue(const configname, configvalue: WideString); safecall;
    function GetValue(const configname: WideString): WideString; safecall;
    procedure SetPrinterInstance(const instance: WideString); safecall;
    procedure SetPrinterName(const sPrinterName: WideString); safecall;
    function GetPrinterName: WideString; safecall;
    function GetSettingsFileName(isRunOnce: WordBool): WideString; safecall;
    function GetCompatiblePrinters: OleVariant; safecall;
    procedure ShowCompatiblePrinters; safecall;
    function GetVersion(var major, minor, revision: Integer): WideString; safecall;
  end;

{ DispInterface declaration for Dual Interface _PDFPrinterSettings }

  _PDFPrinterSettingsDisp = dispinterface
    ['{D383D87A-75F9-4660-82FF-D22F7ADCE86F}']
    procedure Init; dispid 1610809349;
    procedure LoadSettings(isRunOnce: WordBool); dispid 1610809350;
    procedure WriteSettings(isRunOnce: WordBool); dispid 1610809351;
    procedure RemoveSettings(isRunOnce: WordBool); dispid 1610809352;
    procedure SetValue(const configname, configvalue: WideString); dispid 1610809353;
    function GetValue(const configname: WideString): WideString; dispid 1610809354;
    procedure SetPrinterInstance(const instance: WideString); dispid 1610809356;
    procedure SetPrinterName(const sPrinterName: WideString); dispid 1610809358;
    function GetPrinterName: WideString; dispid 1610809359;
    function GetSettingsFileName(isRunOnce: WordBool): WideString; dispid 1610809360;
    function GetCompatiblePrinters: OleVariant; dispid 1610809361;
    procedure ShowCompatiblePrinters; dispid 1610809362;
    function GetVersion(var major, minor, revision: Integer): WideString; dispid 1610809363;
  end;

  CoPDFPrinterSettings = class
    class function Create: _PDFPrinterSettings;
    class function CreateRemote(const MachineName: string): _PDFPrinterSettings;
  end;

  procedure Bullzip_Initialization;
  procedure Bullzip_SetOutput(iFileName: string);
  procedure Bullzip_ResetOutput;

  var
  Bullzip_Active : boolean;
  BZ: _PDFPrinterSettings;

implementation

uses ComObj, MyConsts, inifiles, SysUtils;

class function CoPDFPrinterSettings.Create: _PDFPrinterSettings;
begin
  Result := CreateComObject(Class_PDFPrinterSettings) as _PDFPrinterSettings;
end;

class function CoPDFPrinterSettings.CreateRemote(const MachineName: string): _PDFPrinterSettings;
begin
  Result := CreateRemoteComObject(MachineName, Class_PDFPrinterSettings) as _PDFPrinterSettings;
end;

procedure Bullzip_Initialization;
begin if Bullzip_Active then begin    (*
  BZ.LoadSettings (True);
{  BZ.SetPrinterName (Bullzip_PrinterName);}
  BZ.SetValue ('Title','PAM98 Personalistika a Mzdy');
  BZ.SetValue ('Creator','PScript5.dll Version 5.2.2');
  BZ.SetValue ('Author','Rainitech, s.r.o.');
  BZ.SetValue ('ShowSettings','never');
  BZ.SetValue ('ShowSaveAs','never');
  BZ.SetValue ('ShowProgress','yes');
  BZ.SetValue ('ShowProgressFinished','no');
  BZ.SetValue ('ShowPDF','no');
  BZ.SetValue ('ConfirmOverwrite','no');
  BZ.WriteSettings (True); {Flag IsRunOnce}   *)
end;end;

procedure Bullzip_SetOutput(iFileName: string);
begin if Bullzip_Active then begin
  BZ.LoadSettings (False);
{  BZ.SetPrinterName (Bullzip_PrinterName); }
  BZ.SetValue ('Title','PAM98 Personalistika a Mzdy');
  BZ.SetValue ('Creator','PScript5.dll Version 5.2.2');
  BZ.SetValue ('Author','Rainitech, s.r.o.');
  BZ.SetValue ('ShowSettings','never');
  BZ.SetValue ('ShowSaveAs','never');
  BZ.SetValue ('ShowProgress','yes');
  BZ.SetValue ('ShowProgressFinished','no');
  BZ.SetValue ('ShowPDF','no');
  BZ.SetValue ('ConfirmOverwrite','no');
  BZ.SetValue ('Output',iFileName);
 { DeleteFile  (iFileName+'.txt');}
  BZ.SetValue ('StatusFile',iFileName+'.txt');
  BZ.SetValue ('StatusFile',iFileName+'.txt');
  BZ.SetValue ('StatusFileEncoding','ascii');
  BZ.SetValue ('OwnerPassword','');
  BZ.SetValue ('UserPassword','');
  BZ.WriteSettings (False); {Flag IsRunOnce}
end;end;

procedure Bullzip_ResetOutput;
begin if Bullzip_Active then begin
  BZ.LoadSettings (False);
 { BZ.SetPrinterName (Bullzip_PrinterName); }
  BZ.SetValue ('Title','');
  BZ.SetValue ('Creator','');
  BZ.SetValue ('Author','');
  BZ.SetValue ('ShowSettings','always');
  BZ.SetValue ('ShowSaveAs','always');
  BZ.SetValue ('ShowProgress','yes');
  BZ.SetValue ('ShowProgressFinished','no');
  BZ.SetValue ('ShowPDF','yes');
  BZ.SetValue ('ConfirmOverwrite','yes');
  BZ.SetValue ('Output','');
  BZ.SetValue ('StatusFile','');
  BZ.WriteSettings (False); {Flag IsRunOnce}
end;end;

begin
 try
 BZ := CoPDFPrinterSettings.Create;
 Bullzip_Active := TRUE;
 //MyMessage('Bullzip active');
 except
   Bullzip_Active := FALSE;
   //MyMessage('Bullzip not active');
 end;
end.
