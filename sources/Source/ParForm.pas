unit ParForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, DBCtrls, ComCtrls, ExtCtrls, Mask,
  MyConsts, IniFiles, checklst;

type
  TFParForm = class(TForm)
    T1_: TTable;
    DS1: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CB_stred: TComboBox;
    CB_ZAM_NO: TComboBox;
    CB_rok: TComboBox;
    CB_mesiac: TComboBox;
    CB_stred_NO: TComboBox;
    PageControl2: TPageControl;
    PAGE_SPXML: TTabSheet;
    Label11: TLabel;
    Edit_vykaz_riadny: TEdit;
    PAGE_EMPTY: TTabSheet;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button5: TButton;
    Page_Control3: TPageControl;
    PAGE_VYBER_ZAM: TTabSheet;
    Label8: TLabel;
    CB_zam: TComboBox;
    PAGE_VYBER_ZP: TTabSheet;
    Label1: TLabel;
    Combo_ZP: TDBLookupComboBox;
    Cb_ramceky: TCheckBox;
    CB_nadpisy: TCheckBox;
    CB_abeceda: TCheckBox;
    T2_: TTable;
    PAGE_PZ2006: TTabSheet;
    Label3: TLabel;
    Edit_n_ddp: TEdit;
    Label4: TLabel;
    Edit_mesiace: TEdit;
    Label2: TLabel;
    Edit_nz_ddp: TEdit;
    Edit_zam_filter: TEdit;
    TabSheet2: TTabSheet;
    CB_Stred_Group: TCheckListBox;
    TabSheet3: TTabSheet;
    Label_ine: TLabel;
    Edit_ine: TEdit;
    Label_ine2: TLabel;
    Edit_ine2: TEdit;
    Edit_zam_filter_rc: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Panel3: TPanel;
    Edit_suffix: TEdit;
    Label13: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit_ineChange(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure CB_stredChange(Sender: TObject);
    procedure CB_zamDropDown(Sender: TObject);
  private
    { Private declarations }
    procedure NAPLN_COMBO_ZAM(Sender: TObject);
  public
    { Public declarations }
    procedure XToScreen(var X:TMyReportParam);
    procedure ScreenToX(var X:TMyReportParam);
  end;

var
  FParForm: TFParForm;
  FParForm_MR: TModalResult;

procedure ShowReport;
procedure RunReport(var MyReportParam:TMyReportParam);
procedure RunReportSP1PXLS(const MyReportParam: TMyReportParam);
procedure DBParamToX(var MyReportParam: TMyReportParam);
procedure RunReportVD2XLS(const MyReportParam: TMyReportParam);

implementation

uses RexML, Rexdov, QuickRpt, REXDPC, REXDVP, REXEN, REXFZ1, REXFZ2, REXHP,
  REXHP1, REXML2, REXNZ, REXODV, REXPOI, REXPP, REXPZ, REXRZ, REXRZ2, REXSP,
  REXVL, REXVL2, REXVL3, REXVP, REXZL, REXZML, RexZP, REXSPV, REXDNS2,
  REXODVZP, REXODV2, REXFZ1A, REXVLND, REXDNS3, REXHP2, RexELDZ1, REXPZ2,
  REXRZ3,REXVD,REXVD2,REXPOI2, REXRZ4, REXZML2, REXDPC2, REXDVP2, REXODVDP,
  RexSpXml, REXSP1, REXSP1P, REXVP2, RexML3, FmxUtils, REXNZOLD, REXDBPS,
  REXVLOLD, REXPU, REXDNS2A, REXPZ3, Dm_vypl, REXVP2t, REXVYK, REXZRAZ,
  RZ2004A, RZ2004B, REXPP2, VD2005A, VD2005B, SP2005PR, SP2005VY, REXVZ,
  VP2005C, VP2005B, VP2005A, Dm_main, ZP2005PR, ZP2005VY, PZ2005, BO2005, Dm_zam,
  RexZpTxt, ParForm2, RZ2005A, Main, RexRTF, ZP05OZVY, ZP05OZPR, PZ2006,
  PR2007, PZ2007, RZ2007A, RZ2005B, VD2007A, VD2007B, VLH2009, ZL2009,
  RZ2008A, RZ2008B, PZ2008, RZ2009A, RZ2009B, PZ2009, VD2009A, VD2009B,
  PZ2011, RZ2011A, RexDuXml, REXVL4, PZ2012, PZ2013, RZ2012A, RZ2012B,
  REXHP3, PZ2014, RZ2014A, RZ2014B;

{$R *.DFM}

var X:TMyReportParam;

procedure TFParForm.Button1Click(Sender: TObject);
begin
  if X.Typ='PZ' then begin
    If Edit_n_ddp.Text <> '' then
    if not IsNumeric(Edit_n_ddp.Text) then
       raise EMyError.Create('Suma DDP musÌ byù ËÌseln˝ form·t');
    If Edit_nz_ddp.Text <> '' then
    if not IsNumeric(Edit_nz_ddp.Text) then
       raise EMyError.Create('Suma DDP musÌ byù ËÌseln˝ form·t');
  end;
  ScreenToX(X);
  if X.Typ = 'DU_MESVYK_XML' then
    if MyOtazka(SMyAppOtazkaBoloRocneZuctovanieVTomtoMesiaci)
     then X.BoloRocneZuctovanie := true
     else X.BoloRocneZuctovanie := false;
  if (X.JedenPracovnik) AND (X.Code_emp1<>X.Code_emp2)
   then raise EMyError.Create(SMyRepJedenPracovnik);
  if (X.Vyber_ZP) and (Combo_ZP.KeyValue<=0)
   then raise EMyError.Create(SMyZamKZPMusiBytVyplneny);
  if (X.Typ='SPXML') and (not (StrToChar(Edit_vykaz_riadny.Text) in ['R','O']))
   then raise EMyError.Create(Format(SMyAppInvalid2Value,['v˝kaz riadny R/O']));
  FParForm_MR:=mrOK;
  Close;
end;

procedure TFParForm.NAPLN_COMBO_ZAM(Sender: TObject);
var i:integer;
begin
  T2_.DatabaseName:='PAM98_DATA';
  T2_.TableName:='ZAM.DB';
  T2_.IndexName:='ZAM1';
  T2_.FilterOptions := [foCaseInsensitive];
  T2_.Filter:=DMZ.GET_FILTER(MyZamFilter,'sid>='+IntToStr(X.AktMinSid)+' and sid<='+IntToStr(X.AktMaxSid));
  T2_.Filtered:=True;
  T2_.Open;
  CB_ZAM.Clear;
  CB_ZAM_NO.Clear;
  CB_ZAM.Items.Add(MenoCelaFirma);
  CB_ZAM.ItemIndex:=0;
  CB_ZAM_NO.Items.Add('0');
  while not T2_.EOF do begin
    CB_ZAM.Items.Add(
      LPAD(T2_.FieldByName('Code_numb').AsString,7,' ')+' '+
      Spoj(
      T2_.FieldByName('Title').AsString,
      T2_.FieldByName('Surname').AsString,
      T2_.FieldByName('Name').AsString)
    );
    CB_ZAM_NO.Items.Add(T2_.FieldByName('Code_emp').AsString);
    T2_.Next;
  end;
  T2_.Close;
end;

procedure TFParForm.FormCreate(Sender: TObject);
var i:integer;
begin
  PageControl1.ActivePage := TabSheet1;
  DM.TTLA_.Edit;
  DM.TTLA_Den.Value := Now;
  DM.TTLA_.Post;
  Edit_vykaz_riadny.Text := 'R';
  Edit_zam_filter.Text := '';
  for i:=1900 to 2099 do CB_rok.Items.Add(IntToStr(i));
  for i:=1 to 12 do CB_mesiac.Items.Add(IntToStr(i));
  T1_.Close;
  T2_.Close;
  {--}
  T1_.DatabaseName:='PAM98_DATA';
  T1_.TableName:='CIS_VM.DB';
  T1_.IndexName:='';
  T1_.Open;
  CB_STRED.Items.Add(MenoCelaFirma);
  CB_STRED.ItemIndex:=0;
  CB_STRED_NO.Items.Add('0');
  CB_STRED_GROUP.ItemIndex:=0;
  while not T1_.EOF do begin
    CB_STRED.Items.Add(
      Spoj(
      T1_.FieldByName('Id').AsString,
      T1_.FieldByName('Nazov').AsString,
      ''
    ));
    CB_STRED_NO.Items.Add(T1_.FieldByName('Id').AsString);
    {--}
    CB_STRED_GROUP.Items.Add(
      Spoj(
      T1_.FieldByName('Id').AsString,
      T1_.FieldByName('Nazov').AsString,
      ''
    ));
    {--}
    T1_.Next;
  end;
  T1_.Close;
  NAPLN_COMBO_ZAM(Sender);
  TabSheet2.TabVisible :=
     (MyVerziaMenu = 'EXT') and
     (
    (X.Typ = 'SP_PDF') or
    (X.Typ = 'SP_PDF_PR') or
    (Copy(X.Typ,1,5) = 'SPXML') or
    (Copy(X.Typ,1,6) = 'VPPXML') or
    (X.Typ = 'NZ') or
    (X.Typ = 'VL3')
    );
  Tabsheet3.Visible := X.AktObdobie < Zakon_2005_01;
end;

procedure ShowReport;
begin
try
  FormMain.Enabled:=False;
  if X.Typ='DOV' then RunReportDOV(X)
  else if X.Typ='DPC' then RunReportDPC(X)
  else if X.Typ='DPC2' then RunReportDPC2(X)
  else if X.Typ='DVP' then RunReportDVP(X)
  else if X.Typ='DVP2' then RunReportDVP2(X)
  else if X.Typ='DBPS' then RunReportDBPS(X)
  else if X.Typ='ELDZ1' then RunReportELDZ1(X)
  else if X.Typ='ELDP_PDF' then RunReportELDP_PDF(X)
  else if X.Typ='EN' then RunReportEN(X)
  else if X.Typ='DU_MESVYK_XML' then RunReportDuMesVyk_XML(X)
  else if X.Typ='DU_ROKVYK_XML' then RunReportDuRokVyk_XML(X)
  else if X.Typ='FZ1' then RunReportFZ1(X)
  else if X.Typ='FZ1A' then RunReportFZ1A(X)
  else if X.Typ='FZ2' then RunReportFZ2(X)
  else if X.Typ='HP' then RunReportHP(X)
  else if X.Typ='HP1' then RunReportHP1(X)
  else if X.Typ='HP2' then RunReportHP2(X)
  else if X.Typ='HP3' then RunReportHP3(X)
  else if (X.Typ='ML') and (X.AktObdobie<Zakon_2004_01) then RunReportML(X)
  else if (X.Typ='ML') and (X.AktObdobie>=Zakon_2004_01) then RunReportML3(X)
  else if X.Typ='ML2' then RunReportML2(X)
  else if (X.Typ='NZ') and (X.AktObdobie<Zakon_2004_01) then RunReportNZOLD(X)
  else if (X.Typ='NZ') and (X.AktObdobie>=Zakon_2004_01) then RunReportNZ(X)
  else if X.Typ='ODV' then RunReportODV(X)
  else if X.Typ='ODV2' then RunReportODV2(X)
  else if X.Typ='ODVZP' then RunReportODVZP(X)
  else if X.Typ='ODVDP' then RunReportODVDP(X)
  else if X.Typ='ZRAZ' then RunReportZRAZ(X)
  else if (X.Typ='POI') and (X.AktObdobie<Zakon_2002_01) then RunReportPOI(X)
  else if (X.Typ='POI') and (X.AktObdobie>=Zakon_2002_01) then RunReportPOI2(X)
  else if X.Typ='PP' then RunReportPP(X)
  else if X.Typ='VZ' then RunReportVZ(X)
  else if X.Typ='PP2' then RunReportPP2(X)
  else if X.Typ='PU' then RunReportPU(X)
  else if X.Typ='BO' then RunReportBO2005(X)
  else if (X.Typ='PZ') and (X.AktObdobie>=Zakon_2014_01) then RunReportPZ2014(X)
  else if (X.Typ='PZ') and (X.AktObdobie>=Zakon_2013_01) then RunReportPZ2013(X)
  else if (X.Typ='PZ') and (X.AktObdobie>=Zakon_2012_01) then RunReportPZ2012(X)
  else if (X.Typ='PZ') and (X.AktObdobie>=Zakon_2011_01) then RunReportPZ2011(X)
  else if (X.Typ='PZ') and (X.AktObdobie>=Zakon_2009_01) then RunReportPZ2009(X)
  else if (X.Typ='PZ') and (X.AktObdobie>=Zakon_2008_01) then RunReportPZ2008(X)
  else if (X.Typ='PZ') and (X.AktObdobie>=Zakon_2007_01) then RunReportPZ2007(X)
  else if (X.Typ='PZ') and (X.AktObdobie>=Zakon_2006_01) then RunReportPZ2006(X)
  else if (X.Typ='PZ') and (X.AktObdobie>=Zakon_2005_01) then RunReportPZ2005(X)
  else if (X.Typ='PZ') and (X.AktObdobie>=Zakon_2004_01) then RunReportPZ3(X)
  else if (X.Typ='PZ') and (X.AktObdobie>=Zakon_2001_01) then RunReportPZ2(X)
  else if (X.Typ='PZ') and (X.AktObdobie<Zakon_2001_01) then RunReportPZ(X)
  else if (X.Typ='RZ') and (X.AktObdobie<Zakon_2001_01) then RunReportRZ(X)
  else if (X.Typ='RZ') and (X.AktObdobie>=Zakon_2001_01) and (X.AktObdobie<Zakon_2002_01) then RunReportRZ3(X)
  else if (X.Typ='RZ') and (X.AktObdobie>=Zakon_2002_01) and (X.AktObdobie<Zakon_2004_01) then RunReportRZ4(X)
  else if (X.Typ='RZ') and (X.AktObdobie>=Zakon_2004_01) and (X.AktObdobie<Zakon_2005_01) then RunReportRZ_2004(X)
  else if (X.Typ='RZ') and (X.AktObdobie>=Zakon_2005_01) and (X.AktObdobie<Zakon_2007_01) then RunReportRZ_2005(X)
  else if (X.Typ='RZ') and (X.AktObdobie>=Zakon_2007_01) and (X.AktObdobie<Zakon_2008_01) then RunReportRZ_2007(X)
  else if (X.Typ='RZ') and (X.AktObdobie>=Zakon_2008_01) and (X.AktObdobie<Zakon_2009_01) then RunReportRZ_2008(X)
  else if (X.Typ='RZ') and (X.AktObdobie>=Zakon_2009_01) and (X.AktObdobie<Zakon_2011_01) then RunReportRZ_2009(X)
  else if (X.Typ='RZ') and (X.AktObdobie>=Zakon_2011_01) and (X.AktObdobie<Zakon_2012_01) then RunReportRZ_2011(X)
  else if (X.Typ='RZ') and (X.AktObdobie>=Zakon_2012_01) and (X.AktObdobie<Zakon_2014_01) then RunReportRZ_2012(X)
  else if (X.Typ='RZ') and (X.AktObdobie>=Zakon_2014_01) then RunReportRZ_2014(X)
  else if (X.Typ='NEZISK1') and (X.AktObdobie>=Zakon_2011_01) then RunReport_NEZISK1_2011(X)
  else if (X.Typ='NEZISK1') and (X.AktObdobie>=Zakon_2009_01) then RunReport_NEZISK1_2009(X)
  else if (X.Typ='NEZISK1') and (X.AktObdobie>=Zakon_2007_01) then RunReport_NEZISK1_2007(X)
  else if (X.Typ='NEZISK1') and (X.AktObdobie>=Zakon_2005_01) then RunReport_NEZISK1(X)
  else if (X.Typ='NEZISK2') and (X.AktObdobie>=Zakon_2005_01) and (X.AktObdobie<Zakon_2008_01) then RunReport_NEZISK2(X)
  else if (X.Typ='NEZISK2') and (X.AktObdobie>=Zakon_2008_01) and (X.AktObdobie<Zakon_2009_01) then RunReport_NEZISK2_2008(X)
  else if (X.Typ='NEZISK2') and (X.AktObdobie>=Zakon_2009_01) and (X.AktObdobie<Zakon_2011_01) then RunReport_NEZISK2_2009(X)
  else if (X.Typ='NEZISK2') and (X.AktObdobie>=Zakon_2011_01) then RunReport_NEZISK2_2011(X)
  else if (X.Typ='RZ2004B') and (X.AktObdobie<Zakon_2004_01) then MyError('Report je moûnÈ sp˙öùaù aû od roku 2004')
  else if (X.Typ='RZ2004B') and (X.AktObdobie>=Zakon_2004_01) and (X.AktObdobie<Zakon_2005_01) then RunReportRZ_2004B(X)
  else if (X.Typ='RZ2004B') and (X.AktObdobie>=Zakon_2005_01)  and (X.AktObdobie<Zakon_2008_01) then RunReportRZ_2005B(X)
  else if (X.Typ='RZ2004B') and (X.AktObdobie>=Zakon_2008_01)  and (X.AktObdobie<Zakon_2009_01) then RunReportRZ_2008B(X)
  else if (X.Typ='RZ2004B') and (X.AktObdobie>=Zakon_2009_01) and (X.AktObdobie<Zakon_2012_01) then RunReportRZ_2009B(X)
  else if (X.Typ='RZ2004B') and (X.AktObdobie>=Zakon_2012_01) and (X.AktObdobie<Zakon_2014_01) then RunReportRZ_2012B(X)
  else if (X.Typ='RZ2004B') and (X.AktObdobie>=Zakon_2014_01) then RunReportRZ_2014B(X)
  else if X.Typ='RZ2' then RunReportRZ2(X)
  else if (X.Typ='SP') and (X.AktObdobie>=Zakon_2005_01) then RunReportSP2005VY(X)
  else if (X.Typ='SP') and (X.AktObdobie>=Zakon_2004_01) then RunReportSP1(X)
  else if X.Typ='SP' then RunReportSP(X)
  else if ((X.Typ='SP_PDF') or (X.Typ='SP_PDF/NP')) then RunReportSP2005VY_PDF(X)
  else if ((X.Typ='SP_PDF_PR') or (X.Typ='SP_PDF_PR/NP')) then RunReportSP2005PR_PDF(X)
  else if (X.Typ='SP_PRIHLAS') then RunReport_SP_PRIHLAS(X)
  else if (X.Typ='SPV') and (X.AktObdobie>=Zakon_2005_01) then RunReportSP2005VY(X)
  else if (X.Typ='SPV') and (X.AktObdobie>=Zakon_2004_01) then RunReportSP1(X)
  else if X.Typ='SPV' then RunReportSPV(X)
  else if X.Typ='SP1' then RunReportSP1(X)
  else if (X.Typ='SP1P') and (X.AktObdobie>=Zakon_2005_01) then RunReportSP2005PR(X)
  else if X.Typ='SP1P' then RunReportSP1P(X)
  else if (X.Typ='VL') and (X.AktObdobie>=Zakon_2004_01) then RunReportVL(X)
  else if (X.Typ='VL') and (X.AktObdobie<Zakon_2004_01) then RunReportVLOLD(X)
  else if (X.Typ='VL2') and (X.AktObdobie>=Zakon_2009_01) then RunReportVLH2009(X)
  else if (X.Typ='VL2') and (X.AktObdobie<Zakon_2009_01) then RunReportVL2(X)
  else if X.Typ='VL3' then RunReportVL3(X)
  else if (X.Typ='VL4') then RunReportVL4(X)
  else if X.Typ='VLND' then RunReportVLND(X)
  else if (X.Typ='VP') and (X.AktObdobie>=Zakon_2005_01) then
  begin
    case DM.TINF_F_ODSTUP.Value of
      1:RunReportVP2005B(X);
      2:RunReportVP2005C(X);
      else RunReportVP2005A(X);
    end
  end
  else if (X.Typ='VP') and (X.AktObdobie>=Zakon_2004_01) then
  begin
    if DM.TINF_F_ODSTUP.Value=0 then RunReportVP2(X) else RunReportVP2T(X);
  end
  else if X.Typ='VP' then RunReportVP(X)
  else if X.Typ='VYK' then RunReportVYK(X)
  else if (X.Typ='ZL') and (X.AktObdobie<Zakon_2009_01) then RunReportZL(X)
  else if (X.Typ='ZL') and (X.AktObdobie>=Zakon_2009_01) then RunReportZL2009(X)
  else if X.Typ='ZML' then RunReportZML(X)
  else if X.Typ='ZML2' then RunReportZML2(X)
  else if X.Typ='ZMLD' then RunReportZML2(X)
  else if (X.Typ='ZP') and (X.AktObdobie<Zakon_2005_01) then RunReportZP(X)
  else if (X.Typ='ZP') and (X.AktObdobie>=Zakon_2005_01) then RunReportZP2005VY(X)
  else if (X.Typ='ZP_RTF') then RunReportZP2005VY_RTF(X)
  else if (X.Typ='ZP_PDF') then RunReportZP2005VY_PDF(X)
  else if (X.Typ='ZP2005PR') then RunReportZP2005PR(X)
  else if (X.Typ='DNS2') and (X.AktObdobie>=Zakon_2007_01) then RunReportPR2007(X)
  else if (X.Typ='DNS2') and (X.AktObdobie>=Zakon_2004_01) then RunReportDNS2A(X)
  else if (X.Typ='DNS2') and (X.AktObdobie<Zakon_2004_01) then RunReportDNS2(X)
  else if (X.Typ='DNS3') and (X.AktObdobie<Zakon_2001_01) then RunReportDNS3(X)
  else if (X.Typ='DNS3') and (X.AktObdobie<Zakon_2004_01) then RunReportVD(X)
  else if (X.Typ='DNS3') and (X.AktObdobie<Zakon_2007_01) then RunReportVD2005A(X)
  else if (X.Typ='DNS3') and (X.AktObdobie<Zakon_2009_01) then RunReportVD2007A(X)
  else if (X.Typ='DNS3') and (X.AktObdobie>=Zakon_2009_01) then RunReportVD2009A(X)
  else if (X.Typ='VD2')  and (X.AktObdobie<Zakon_2004_01) then RunReportVD2(X)
  else if (X.Typ='VD2')  and (X.AktObdobie<Zakon_2007_01)then RunReportVD2005B(X)
  else if (X.Typ='VD2')  and (X.AktObdobie<Zakon_2009_01)then RunReportVD2007B(X)
  else if (X.Typ='VD2')  and (X.AktObdobie>=Zakon_2009_01)then RunReportVD2009B(X)
  else if (X.Typ='VD2XLS') then RunReportVD2XLS(X)
  else if (X.Typ='VD_A_PDF') then RunReportVD2005A_PDF(X)
  else if (X.Typ='VD_B_PDF') then RunReportVD2005B_PDF(X)
  else if (Copy(X.Typ,1,5)='SPXML') then RunReportSPXML(X)
  else if (Copy(X.Typ,1,6)='VPPXML') then RunReportVPPXML(X)
  else if (X.Typ='ZPTXT') then RunReportZP514(X)
  else if (X.Typ='ZPTXT_ZLUC') then RunReportZP514_Zlucene(X)
  else if (X.Typ='ZP601') then RunReportZP514(X)
  else if (X.Typ='SP1PXLS') then RunReportSP1PXLS(X)
  else if (X.Typ='RTF_ZDR_DOKLAD') then RunReport_ZDR_DOKLAD(X)
  else if (X.Typ='RTF_ZDR_OZNAM') then RunReport_ZDR_OZNAM(X)
  else if (X.Typ='ZP05OZVY') then RunReportZP05OZVY(X)
  else if (X.Typ='ZP05OZPR') then RunReportZP05OZPR(X)
  else if (X.Typ='ZAPOCET') then RunReport_SP_ZAPOCET(X)
  else if (X.Typ='DHD') then RunReport_GfK_Dohodari(X)
  else if (X.Typ='ZP_580') then RunReportZp580(X)
  else if (X.Typ='ZP_580_CSV') then RunReportZp580_CSV(X)
  else MyError('Nenaöiel sa report');
finally
  FormMain.Enabled:=True;
{  FormMain.Show;}
end;
end;

procedure TFParForm.XToScreen(var X:TMyReportParam);
var i:integer;
begin
 Cb_rok.ItemIndex := X.AktObdobie div 100 - 1900;
 Cb_mesiac.ItemIndex := X.AktObdobie mod 100 - 1;
 {--}
 if X.AktMinSid<>X.AktMaxSid then Cb_stred.ItemIndex:=0
 else
 for i:=0 to Cb_stred_no.Items.Count-1 do
   if Cb_stred_no.Items[i]=IntToStr(X.AktMinSid) then
     begin Cb_stred.ItemIndex:=i; break; end;
 {--}
 if X.Code_emp1<>X.Code_emp2 then Cb_zam.ItemIndex:=0
 else
 for i:=0 to Cb_zam_no.Items.Count-1 do
   if Cb_zam_no.Items[i]=IntToStr(X.Code_emp1) then
     begin Cb_zam.ItemIndex:=i; break; end;
 {--}
 Cb_ramceky.Checked:= NOT X.DisableShape;
 Cb_nadpisy.Checked:= NOT X.DisableLabel;
 Cb_abeceda.Checked:= X.Abeceda;
 if (X.typ='PZ') then
 begin
   PAGE_PZ2006.TabVisible:=True;
   if X.AktObdobie>=Zakon_2005_01 then begin
     Edit_n_ddp.Text := '';
     Edit_nz_ddp.Text := '';
     Edit_mesiace.Text := '';
     Edit_ine.Visible:=False;
     Label_ine2.Caption:='Individu·lne hodnoty je moûnÈ nastaviù v samostatnej z·loûke.';
     Label_ine2.Visible:=True;
     Label_ine.Visible:=False;
     Edit_ine2.Visible:=False;
   end else
   if X.AktObdobie>=Zakon_2001_01 then begin
     Label_ine.Caption:='Nezd.Ë.na 1 dieùa za min.rok';
     Edit_ine.Text:='1400';
     Label_ine2.Caption:='';
     Edit_ine2.Text:='';
     Edit_ine.Visible:=True;
     Label_ine.Visible:=True;
     Edit_ine2.Visible:=False;
     Label_ine2.Visible:=False;
   end;
 end
 else begin
   PAGE_PZ2006.TabVisible:=False;
   Edit_ine.Visible:=False;
   Label_ine.Visible:=False;
   Label_ine2.Visible:=False;
   Edit_ine2.Visible:=False;
 end;
 if (X.typ='VL') or (X.typ='VL2') or (X.typ='VLND') or (X.typ='ZL')
   or (X.typ='RZ2') or (X.typ='DOV')
 then begin
   Cb_abeceda.Visible:=True;
 end
 else begin
   Cb_abeceda.Visible:=False;
 end;
 if (X.Typ = 'SPXML') or (X.Typ='SP_PDF') then
   PageControl2.Visible := true
 else
   PageControl2.Visible:=false;
 if X.Vyber_ZP then begin
   PAGE_VYBER_ZP.TabVisible:=True;
   PAGE_CONTROL3.ActivePage:=PAGE_VYBER_ZP;
   PAGE_VYBER_ZAM.TabVisible:=False;
   DM.DS_CIS1.Enabled:=True;
 end else
 begin
   PAGE_VYBER_ZAM.TabVisible:=True;
   PAGE_CONTROL3.ActivePage:=PAGE_VYBER_ZAM;
   PAGE_VYBER_ZP.TabVisible:=False;
 end;
 Combo_ZP.KeyValue := 25;
end;

procedure TFParForm.ScreenToX(var X:TMyReportParam);
var i:integer;
begin
 if trim(Edit_suffix.Text)<>'' then
    X.AktSidListSuffix := '_'+trim(Edit_suffix.Text)
 else
    X.AktSidListSuffix := '';
 {--}
 X.AktObdobie :=
  (CB_rok.ItemIndex + 1900)*100 +
   CB_mesiac.ItemIndex + 1;
 X.AktObdobieStrF := MESIAC(X.AktObdobie mod 100,False)+
                     ' '+IntToStr(X.AktObdobie div 100);
 X.AktObdobieStrT := MESIAC(X.AktObdobie mod 100,True)+
                     ' '+IntToStr(X.AktObdobie div 100);
 {--}
 X.AktSidList := '';
 for i:=0 to Cb_stred_group.Items.Count-1 do
 begin
   if Cb_stred_group.Checked[i] then
     if X.AktSidList=''
      then X.AktSidList:= ' and sid in ( '+ Cb_stred_NO.Items[i+1]
       else X.AktSidList:= X.AktSidList + ', ' +  Cb_stred_NO.Items[i+1];
 end;
 if X.AktSidList<>'' then  X.AktSidList:= X.AktSidList + ' )';
 if X.AktSidList<>'' then begin
     X.AktSid:=0;
     X.AktMinSid:=1;
     X.AktMaxSid:=99;
 end else
 begin
   if Cb_stred.ItemIndex=0 then begin
     X.AktSid:=0;
     X.AktMinSid:=1;
     X.AktMaxSid:=99;
   end else begin
     X.AktMinSid:=StrToInt(Cb_stred_no.Items[Cb_stred.ItemIndex]);
     X.AktMaxSid:=X.AktMinSid;
     X.AktSid:=X.AktMinSid;
   end;
 end;
 X.AktFirmaStr := TITULOK_REPORTU(X.AktIbaFirmaStr,X.AktSid);
 {--}
 if Cb_zam.ItemIndex=0 then begin
   X.Code_emp1:=1;
   X.Code_emp2:=MaxCodeEmp;
 end else begin
   X.Code_emp1:=StrToInt(Cb_zam_no.Items[Cb_zam.ItemIndex]);
   X.Code_emp2:=X.Code_emp1;
 end;
 {--}
 X.DisableShape:=NOT Cb_ramceky.Checked;
 X.DisableLabel:=NOT Cb_nadpisy.Checked;
 X.Abeceda:= Cb_abeceda.Checked;
 X.Vykaz_riadny:=Edit_vykaz_riadny.Text;
 {}
 DBParamToX(X);
 {}
 X.Kod_ZP := DM.CIS1_ID.Value;
 X.Nc_text:= Edit_ine.Text;
 X.Nc_ine2:= Edit_ine2.Text;
 if (X.Typ='PZ') and (X.AktObdobie>=Zakon_2005_01) then begin
   X.Nc_ine2:= Edit_n_ddp.Text;
   X.Nc_text:= Edit_mesiace.Text;
   X.YY[1]:=Edit_nz_ddp.Text;
 end;
end;

procedure RunReport(var MyReportParam:TMyReportParam);
begin
  X:=MyReportParam;
  FParForm:=TFParForm.Create(Application);
  try
    if X.Silent then begin
      FParForm.XToScreen(X);
      FParForm.ScreenToX(X);
      FParForm.Free;
      ShowReport;
    end
      else
    begin
      FParForm.XToScreen(X);
      FParForm.ShowModal;
      if FParForm_MR=mrOK then ShowReport;
    end;
  finally
  end;
end;

procedure TFParForm.Edit_ineChange(Sender: TObject);
begin
  If Edit_ine.Text <> '' then begin
    try
    X.Nc_ine:=StrToInt(Edit_ine.Text)
    except on EConvertError do begin
      X.Nc_ine:=0;
    end;
    end;
  end;
end;

procedure RunReportSP1PXLS_2010(const MyReportParam: TMyReportParam);
var i,ss,rr,smax:integer;
    fn1:string[128];
    f1:text;
begin
  smax:=17;
  CreateDir(MyAppPath+MenoTlacDir);
  fn1:=MyAppPath+MenoTlacDir+'\'+MenoTlacSp1p+IntToStr(X.AktObdobie)+'.SLK';
  assignfile(f1,fn1);
  try rewrite(f1);
  except
    MyError(Format(SMyAppCreateFileFailed,[fn1]));
    exit;
  end;
  writeln(f1,'ID;PWXL;N;E');
  writeln(f1,'P;PGeneral');
  try
  ReportSP1P:=TReportSP1P.Create(Application);
  ReportSP1P.SetX(X);
  ReportSP1P.Q0_.Close;
  ReportSP1P.Q0_.ParamByName('P1').Value := X.AktObdobie;
  ReportSP1P.Q0_.ParamByName('P2').Value := X.AktMinSid;
  ReportSP1P.Q0_.ParamByName('P3').Value := X.AktMaxSid;
  ReportSP1P.Q0_.Open;
  ReportSP1P.Q0_.First;
  writeln(f1,'F;W'+IntToStr(1)+' '+IntToStr(1)+' '+'5');
  writeln(f1,'F;W'+IntToStr(2)+' '+IntToStr(2)+' '+'11');
  writeln(f1,'F;W'+IntToStr(3)+' '+IntToStr(3)+' '+'5');
  writeln(f1,'F;W'+IntToStr(4)+' '+IntToStr(4)+' '+'5');
  writeln(f1,'F;W'+IntToStr(5)+' '+IntToStr(5)+' '+'5');
  writeln(f1,'F;W'+IntToStr(6)+' '+IntToStr(6)+' '+'10');
  writeln(f1,'F;W'+IntToStr(7)+' '+IntToStr(7)+' '+'8');
  writeln(f1,'F;W'+IntToStr(8)+' '+IntToStr(8)+' '+'8');
  writeln(f1,'F;W'+IntToStr(9)+' '+IntToStr(9)+' '+'8');
  writeln(f1,'F;W'+IntToStr(10)+' '+IntToStr(10)+' '+'8');
  writeln(f1,'F;W'+IntToStr(11)+' '+IntToStr(11)+' '+'10');
  writeln(f1,'F;W'+IntToStr(12)+' '+IntToStr(12)+' '+'8');
  writeln(f1,'F;W'+IntToStr(13)+' '+IntToStr(13)+' '+'8');
  writeln(f1,'F;W'+IntToStr(14)+' '+IntToStr(14)+' '+'8');
  writeln(f1,'F;W'+IntToStr(15)+' '+IntToStr(15)+' '+'8');
  writeln(f1,'F;W'+IntToStr(16)+' '+IntToStr(16)+' '+'10');
  writeln(f1,'F;W'+IntToStr(17)+' '+IntToStr(17)+' '+'8');
  {--}
  writeln(f1,'C;Y'+IntToStr(1)+';X'+IntToStr(1)+';K"Por.ËÌslo"');
  writeln(f1,'C;X'+IntToStr(2)+';K"RodnÈ ËÌslo"');
  writeln(f1,'C;X'+IntToStr(3)+';K"PoË.nezaop.detÌ"');
  writeln(f1,'C;X'+IntToStr(4)+';K"PoËet dnÌ"');
  writeln(f1,'C;X'+IntToStr(5)+';K"Na IP neplatÌ"');
  writeln(f1,'C;X'+IntToStr(6)+';K"Vym.z·k.NP"');
  writeln(f1,'C;X'+IntToStr(7)+';K"NP zamtel"');
  writeln(f1,'C;X'+IntToStr(8)+';K"NP zamnec"');
  writeln(f1,'C;X'+IntToStr(9)+';K"SP zamtel"');
  writeln(f1,'C;X'+IntToStr(10)+';K"SP zamnec"');
  writeln(f1,'C;X'+IntToStr(11)+';K"Vym.z·k.SP,IP a PvN"');
  writeln(f1,'C;X'+IntToStr(12)+';K"IP zamtel"');
  writeln(f1,'C;X'+IntToStr(13)+';K"IP zamnec"');
  writeln(f1,'C;X'+IntToStr(14)+';K"PvN zamtel"');
  writeln(f1,'C;X'+IntToStr(15)+';K"PvN zamnec"');
  writeln(f1,'C;X'+IntToStr(16)+';K"Vym.z·k.UP"');
  writeln(f1,'C;X'+IntToStr(17)+';K"UP zamtel"');
  ss:=1;rr:=2;
  while not ReportSP1P.Q0_.EOF do begin
    writeln(f1,'C;Y'+IntToStr(rr)+';X'+IntToStr(1)+';K"'+IntToStr(rr-1)+'"');
    writeln(f1,'C;X'+IntToStr(2)+';K"'+ReportSP1P.Q0_Calc_Born_numb.Value+'"');
    writeln(f1,'C;X'+IntToStr(3)+';K"'+ReportSP1P.Q0_Poc_nezaop_deti.AsString+'"');
    writeln(f1,'C;X'+IntToStr(4)+';K"'+ReportSP1P.Q0_V_dni.AsString+'"');
    writeln(f1,'C;X'+IntToStr(5)+';K"'+ReportSP1P.Q0_Calc_U_invalid.AsString+'"');
    writeln(f1,'C;X'+IntToStr(6)+';K"'+ReportSP1P.Q0_N_zaklad_np.AsString+'"');
    writeln(f1,'C;X'+IntToStr(7)+';K"'+ReportSP1P.Q0_Oz_nemoc.AsString+'"');
    writeln(f1,'C;X'+IntToStr(8)+';K"'+ReportSP1P.Q0_O_nemoc.AsString+'"');
    writeln(f1,'C;X'+IntToStr(9)+';K"'+ReportSP1P.Q0_Oz_dochod.AsString+'"');
    writeln(f1,'C;X'+IntToStr(10)+';K"'+ReportSP1P.Q0_O_dochod.AsString+'"');
    writeln(f1,'C;X'+IntToStr(11)+';K"'+ReportSP1P.Q0_N_zaklad_dp.AsString+'"');
    writeln(f1,'C;X'+IntToStr(12)+';K"'+ReportSP1P.Q0_Oz_invalid.AsString+'"');
    writeln(f1,'C;X'+IntToStr(13)+';K"'+ReportSP1P.Q0_O_invalid.AsString+'"');
    writeln(f1,'C;X'+IntToStr(14)+';K"'+ReportSP1P.Q0_Oz_fondzam.AsString+'"');
    writeln(f1,'C;X'+IntToStr(15)+';K"'+ReportSP1P.Q0_O_fondzam.AsString+'"');
    writeln(f1,'C;X'+IntToStr(16)+';K"'+ReportSP1P.Q0_N_zaklad_up.AsString+'"');
    writeln(f1,'C;X'+IntToStr(17)+';K"'+ReportSP1P.Q0_Oz_uraz.AsString+'"');
    rr:=rr+1;
    ReportSP1P.Q0_.Next;
  end;
  writeln(f1,'E');
  closefile(f1);
  if MyOtazka(SMyAppRunExcel)
   then ExecuteFile('excel','"'+fn1+'"',MyAppPath+MenoTlacDir+'\',1)
   else   MyMessage(Format(SMyAppFileCreated,[fn1]));
  ReportSP1P.Q0_.Close;
  finally
  ReportSP1P.Free;
  end;
end;

procedure RunReportSP1PXLS_2011(const MyReportParam: TMyReportParam);
var i,ss,rr,smax:integer;
    fn1:string[128];
    f1:text;
begin
  smax:=17;
  CreateDir(MyAppPath+MenoTlacDir);
  fn1:=MyAppPath+MenoTlacDir+'\'+MenoTlacSp1p+IntToStr(X.AktObdobie)+'.SLK';
  assignfile(f1,fn1);
  try rewrite(f1);
  except
    MyError(Format(SMyAppCreateFileFailed,[fn1]));
    exit;
  end;
  writeln(f1,'ID;PWXL;N;E');
  writeln(f1,'P;PGeneral');
  try
  ReportSP2005PR:=TReportSP2005PR.Create(Application);
  ReportSP2005PR.SetX(X);
  ReportSP2005PR.Q0_.Close;
  ReportSP2005PR.Q0_.ParamByName('P1').Value := X.AktObdobie;
  ReportSP2005PR.Q0_.ParamByName('P2').Value := X.AktMinSid;
  ReportSP2005PR.Q0_.ParamByName('P3').Value := X.AktMaxSid;
  ReportSP2005PR.Q0_.Open;
  ReportSP2005PR.Q0_.First;
  writeln(f1,'F;W'+IntToStr(1)+' '+IntToStr(1)+' '+'5');
  writeln(f1,'F;W'+IntToStr(2)+' '+IntToStr(2)+' '+'11');
  writeln(f1,'F;W'+IntToStr(3)+' '+IntToStr(3)+' '+'5');
  writeln(f1,'F;W'+IntToStr(4)+' '+IntToStr(4)+' '+'5');
  writeln(f1,'F;W'+IntToStr(5)+' '+IntToStr(5)+' '+'5');
  writeln(f1,'F;W'+IntToStr(6)+' '+IntToStr(6)+' '+'10');
  writeln(f1,'F;W'+IntToStr(7)+' '+IntToStr(7)+' '+'8');
  writeln(f1,'F;W'+IntToStr(8)+' '+IntToStr(8)+' '+'8');
  writeln(f1,'F;W'+IntToStr(9)+' '+IntToStr(9)+' '+'8');
  writeln(f1,'F;W'+IntToStr(10)+' '+IntToStr(10)+' '+'8');
  writeln(f1,'F;W'+IntToStr(11)+' '+IntToStr(11)+' '+'10');
  writeln(f1,'F;W'+IntToStr(12)+' '+IntToStr(12)+' '+'8');
  writeln(f1,'F;W'+IntToStr(13)+' '+IntToStr(13)+' '+'8');
  writeln(f1,'F;W'+IntToStr(14)+' '+IntToStr(14)+' '+'8');
  writeln(f1,'F;W'+IntToStr(15)+' '+IntToStr(15)+' '+'8');
  writeln(f1,'F;W'+IntToStr(16)+' '+IntToStr(16)+' '+'10');
  writeln(f1,'F;W'+IntToStr(17)+' '+IntToStr(17)+' '+'8');
  {--}
  writeln(f1,'C;Y'+IntToStr(1)+';X'+IntToStr(1)+';K"Por.ËÌslo"');
  writeln(f1,'C;X'+IntToStr(2)+';K"RodnÈ ËÌslo"');
  writeln(f1,'C;X'+IntToStr(3)+';K"PoË.nezaop.detÌ"');
  writeln(f1,'C;X'+IntToStr(4)+';K"PoËet dnÌ"');
  writeln(f1,'C;X'+IntToStr(5)+';K"Na IP neplatÌ"');
  writeln(f1,'C;X'+IntToStr(6)+';K"Vym.z·k.NP"');
  writeln(f1,'C;X'+IntToStr(7)+';K"NP zamtel"');
  writeln(f1,'C;X'+IntToStr(8)+';K"NP zamnec"');
  writeln(f1,'C;X'+IntToStr(9)+';K"SP zamtel"');
  writeln(f1,'C;X'+IntToStr(10)+';K"SP zamnec"');
  writeln(f1,'C;X'+IntToStr(11)+';K"Vym.z·k.SP,IP a PvN"');
  writeln(f1,'C;X'+IntToStr(12)+';K"IP zamtel"');
  writeln(f1,'C;X'+IntToStr(13)+';K"IP zamnec"');
  writeln(f1,'C;X'+IntToStr(14)+';K"PvN zamtel"');
  writeln(f1,'C;X'+IntToStr(15)+';K"PvN zamnec"');
  writeln(f1,'C;X'+IntToStr(16)+';K"Vym.z·k.UP"');
  writeln(f1,'C;X'+IntToStr(17)+';K"UP zamtel"');
  ss:=1;rr:=2;
  while not ReportSP2005PR.Q0_.EOF do begin
    writeln(f1,'C;Y'+IntToStr(rr)+';X'+IntToStr(1)+';K"'+IntToStr(rr-1)+'"');
    writeln(f1,'C;X'+IntToStr(2)+';K"'+ReportSP2005PR.Q0_Calc_Born_numb.Value+'"');
    writeln(f1,'C;X'+IntToStr(3)+';K"'+ReportSP2005PR.Q0_Poc_nezaop_deti.AsString+'"');
    writeln(f1,'C;X'+IntToStr(4)+';K"'+ReportSP2005PR.Q0_V_dni.AsString+'"');
    writeln(f1,'C;X'+IntToStr(5)+';K"'+ReportSP2005PR.Q0_Calc_U_invalid.AsString+'"');
    writeln(f1,'C;X'+IntToStr(6)+';K"'+ReportSP2005PR.Q0_N_zaklad_np.AsString+'"');
    writeln(f1,'C;X'+IntToStr(7)+';K"'+ReportSP2005PR.Q0_Oz_nemoc.AsString+'"');
    writeln(f1,'C;X'+IntToStr(8)+';K"'+ReportSP2005PR.Q0_O_nemoc.AsString+'"');
    writeln(f1,'C;X'+IntToStr(9)+';K"'+ReportSP2005PR.Q0_Oz_dochod.AsString+'"');
    writeln(f1,'C;X'+IntToStr(10)+';K"'+ReportSP2005PR.Q0_O_dochod.AsString+'"');
    writeln(f1,'C;X'+IntToStr(11)+';K"'+ReportSP2005PR.Q0_N_zaklad_dp.AsString+'"');
    writeln(f1,'C;X'+IntToStr(12)+';K"'+ReportSP2005PR.Q0_Oz_invalid.AsString+'"');
    writeln(f1,'C;X'+IntToStr(13)+';K"'+ReportSP2005PR.Q0_O_invalid.AsString+'"');
    writeln(f1,'C;X'+IntToStr(14)+';K"'+ReportSP2005PR.Q0_Oz_fondzam.AsString+'"');
    writeln(f1,'C;X'+IntToStr(15)+';K"'+ReportSP2005PR.Q0_O_fondzam.AsString+'"');
    writeln(f1,'C;X'+IntToStr(16)+';K"'+ReportSP2005PR.Q0_N_zaklad_up.AsString+'"');
    writeln(f1,'C;X'+IntToStr(17)+';K"'+ReportSP2005PR.Q0_Oz_uraz.AsString+'"');
    rr:=rr+1;
    ReportSP2005PR.Q0_.Next;
  end;
  writeln(f1,'E');
  closefile(f1);
  if MyOtazka(SMyAppRunExcel)
   then ExecuteFile('excel','"'+fn1+'"',MyAppPath+MenoTlacDir+'\',1)
   else   MyMessage(Format(SMyAppFileCreated,[fn1]));
  ReportSP2005PR.Q0_.Close;
  finally
  ReportSP2005PR.Free;
  end;
end;

procedure RunReportSP1PXLS(const MyReportParam: TMyReportParam);
begin
  X:=MyReportParam;
  if X.AktObdobie >= ZAKON_2011_01 then
    RunReportSP1PXLS_2011(X)
  else
    RunReportSP1PXLS_2010(X);
end;

procedure RunReportVD2XLS(const MyReportParam: TMyReportParam);
var i,ss,rr,smax:integer;
    fn1:string[128];
    f1:text;
    ulica,cislo:string;
    DS:char;
    pom:string[12];
begin
  smax:=17;
  CreateDir(MyAppPath+MenoTlacDir);
  fn1:=MyAppPath+MenoTlacDir+'\'+MenoTlacVd2Slk+IntToStr(X.AktObdobie)+'.SLK';
  assignfile(f1,fn1);
  try rewrite(f1);
  except
    MyError(Format(SMyAppCreateFileFailed,[fn1]));
    exit;
  end;
  writeln(f1,'ID;PWXL;N;E');
  writeln(f1,'P;PGeneral');
  try
  DS:=DecimalSeparator;
  DecimalSeparator:='.';
  ReportVD2009B:=TReportVD2009B.Create(Application);
  ReportVD2009B.SetX(X);
  ReportVD2009B.Q0_.Close;
  ReportVD2009B.Q0_.ParamByName('P1').Value := MyRok(X.AktObdobie)*100+1;
  ReportVD2009B.Q0_.ParamByName('P2').Value := MyRok(X.AktObdobie)*100+12;
  ReportVD2009B.Q0_.Open;
  ReportVD2009B.Q0_.First;
  ReportVD2009B.Q1_.Open;
  ReportVD2009B.QMES_.Params[1].Value:=MyRok(X.AktObdobie);
  ReportVD2009B.QMES_.Open;
  writeln(f1,'F;W'+IntToStr(1)+' '+IntToStr(1)+' '+'5');
  writeln(f1,'F;W'+IntToStr(2)+' '+IntToStr(2)+' '+'10');
  writeln(f1,'F;W'+IntToStr(3)+' '+IntToStr(3)+' '+'10');
  writeln(f1,'F;W'+IntToStr(4)+' '+IntToStr(4)+' '+'15');
  writeln(f1,'F;W'+IntToStr(5)+' '+IntToStr(5)+' '+'15');
  writeln(f1,'F;W'+IntToStr(6)+' '+IntToStr(6)+' '+'15');
  writeln(f1,'F;W'+IntToStr(7)+' '+IntToStr(7)+' '+'8');
  writeln(f1,'F;W'+IntToStr(8)+' '+IntToStr(8)+' '+'20');
  writeln(f1,'F;W'+IntToStr(9)+' '+IntToStr(9)+' '+'20');
  writeln(f1,'F;W'+IntToStr(10)+' '+IntToStr(10)+' '+'8');
  writeln(f1,'F;W'+IntToStr(11)+' '+IntToStr(11)+' '+'11');
  writeln(f1,'F;W'+IntToStr(12)+' '+IntToStr(12)+' '+'15');
  writeln(f1,'F;W'+IntToStr(13)+' '+IntToStr(13)+' '+'11');
  writeln(f1,'F;W'+IntToStr(14)+' '+IntToStr(14)+' '+'11');
  writeln(f1,'F;W'+IntToStr(15)+' '+IntToStr(15)+' '+'8');
  writeln(f1,'F;W'+IntToStr(16)+' '+IntToStr(16)+' '+'10');
  {--}
  writeln(f1,'C;Y'+IntToStr(1)+';X'+IntToStr(1)+';K"Por.ËÌslo"');
  writeln(f1,'C;X'+IntToStr(2)+';K"RodnÈ ËÌslo"');
  writeln(f1,'C;X'+IntToStr(3)+';K"D·tum narodenia"');
  writeln(f1,'C;X'+IntToStr(4)+';K"Priezvisko"');
  writeln(f1,'C;X'+IntToStr(5)+';K"Meno"');
  writeln(f1,'C;X'+IntToStr(6)+';K"Ulica"');
  writeln(f1,'C;X'+IntToStr(7)+';K"»Ìslo domu"');
  writeln(f1,'C;X'+IntToStr(8)+';K"Mesto"');
  writeln(f1,'C;X'+IntToStr(9)+';K"ät·t"');
  writeln(f1,'C;X'+IntToStr(10)+';K"PS»"');
  writeln(f1,'C;X'+IntToStr(11)+';K"⁄hrn prÌjmov"');
  writeln(f1,'C;X'+IntToStr(12)+';K"Z˙ËtovanÈ v mesiacoch"');
  writeln(f1,'C;X'+IntToStr(13)+';K"Z·klad dane"');
  writeln(f1,'C;X'+IntToStr(14)+';K"ZrazenÈ preddavky"');
  writeln(f1,'C;X'+IntToStr(15)+';K"Suma bonusu"');
  writeln(f1,'C;X'+IntToStr(16)+';K"PoËet detÌ"');
  ss:=1;rr:=2;
  while not ReportVD2009B.Q0_.EOF do begin
    ReportVD2009B.QMES_.Filtered:=False;
    ReportVD2009B.QMES_.Filter:='Code_emp='+ReportVD2009B.Q1_Code_emp.AsString;
    ReportVD2009B.QMES_.Filtered:=True;
    ReportVD2009B.QMES_.First;
    pom:='000000000000';
    while not ReportVD2009B.QMES_.EOF do begin
     pom[ReportVD2009B.QMES_V_mesiac.Value]:='1';
     ReportVD2009B.QMES_.Next;
    end;
    MyRozdelUlicu(ReportVD2009B.Q1_TP_street.Value,ulica,cislo);
    writeln(f1,'C;Y'+IntToStr(rr)+';X'+IntToStr(1)+';K"'+IntToStr(rr-1)+'"');
    writeln(f1,'C;X'+IntToStr(2)+';K"'+ReportVD2009B.Q1_Born_numb.Value+'"');
    writeln(f1,'C;X'+IntToStr(3)+';K"'+ReportVD2009B.Q1_Born_date.AsString+'"');
    writeln(f1,'C;X'+IntToStr(4)+';K"'+Uppercase(ReportVD2009B.Q1_Surname.Value)+'"');
    writeln(f1,'C;X'+IntToStr(5)+';K"'+Uppercase(ReportVD2009B.Q1_Name.Value)+'"');
    writeln(f1,'C;X'+IntToStr(6)+';K"'+Uppercase(ulica)+'"');
    writeln(f1,'C;X'+IntToStr(7)+';K"'+Uppercase(cislo)+'"');
    writeln(f1,'C;X'+IntToStr(8)+';K"'+Uppercase(ReportVD2009B.Q1_TP_city.Value)+'"');
    writeln(f1,'C;X'+IntToStr(9)+';K"'+Uppercase(ReportVD2009B.Q1_L_STAT_TP.Value)+'"');
    writeln(f1,'C;X'+IntToStr(10)+';K"'+Uppercase(ReportVD2009B.Q1_TP_zip.Value)+'"');
    writeln(f1,'C;X'+IntToStr(11)+';K'+Format('%0.2f',[ReportVD2009B.Q0_N_brutto.Value])+'');
    writeln(f1,'C;X'+IntToStr(12)+';K"'+pom+'"');
    writeln(f1,'C;X'+IntToStr(13)+';K'+Format('%0.2f',[ReportVD2009B.Q0_D_ciastzd.Value])+'');
    writeln(f1,'C;X'+IntToStr(14)+';K'+Format('%0.2f',[ReportVD2009B.Q0_D_preddavky.Value])+'');
    writeln(f1,'C;X'+IntToStr(15)+';K'+Format('%0.2f',[ReportVD2009B.Q0_D_bonus_cerpany.Value])+'');
    writeln(f1,'C;X'+IntToStr(16)+';K'+ReportVD2009B.Q0_Poc_deti.AsString+'');
    rr:=rr+1;
    ReportVD2009B.Q0_.Next;
  end;
  writeln(f1,'E');
  closefile(f1);
  if MyOtazka(SMyAppRunExcel)
   then ExecuteFile('excel','"'+fn1+'"',MyAppPath+MenoTlacDir+'\',1)
   else   MyMessage(Format(SMyAppFileCreated,[fn1]));
  ReportVD2009B.Q1_.Close;
  ReportVD2009B.Q0_.Close;
  ReportVD2009B.QMES_.Close;
  finally
  DecimalSeparator := DS;
  ReportVD2009B.Free;
  end;
end;

procedure TFParForm.Button5Click(Sender: TObject);
begin
  FormTLA1:=TFormTLA1.Create(Application);
  try
  FormTLA1.ShowModal;
  finally
  FormTLA1.Free;
  end;
end;


procedure TFParForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFParForm.Button2Click(Sender: TObject);
begin
  FParForm_MR:=mrCancel;
  Close;
end;

procedure DBParamToX(var MyReportParam: TMyReportParam);
begin with DM do begin
 try
 if not TTLA_.Active then
 begin
  TTLA_.Open;
 end;
 X.Vykaz_zostavil:=DM.TTLA_Vykaz_zostavil.Value; {Edit_vykaz_zostavil.Text;}
 X.Telefon:=DM.TTLA_Telefon.Value; {Edit_telefon.Text;}
 X.Fax:=DM.TTLA_Fax.Value; {Edit_fax.Text;}
 X.Vykaz_dna:=DM.TTLA_Den.AsString; {Edit_vykaz_dna.Text;  }
 X.Vykaz_dna_DT:=DM.TTLA_Den.Value; {Edit_vykaz_dna.Text;  }
 X.Vykaz_miesto:=DM.TTLA_Miesto.Value; {Edit_vykaz_miesto.Text;}
 X.Mail:=DM.TTLA_Mail.Value; {Edit_fax.Text;}
 {--}
 X.Ucto_priezvisko:=DM.TTLA_UCTO_Priezvisko.Value;
 X.Ucto_meno:=DM.TTLA_UCTO_meno.Value;
 X.Ucto_tel:=DM.TTLA_UCTO_Tel.Value;
 X.Ucto_mail:=DM.TTLA_UCTO_Mail.Value; 

 finally
 end;
end;end;

procedure TFParForm.CB_stredChange(Sender: TObject);
begin
 if Cb_stred.ItemIndex=0 then begin
   X.AktSid:=0;
   X.AktMinSid:=1;
   X.AktMaxSid:=99;
 end else begin
   X.AktMinSid:=StrToInt(Cb_stred_no.Items[Cb_stred.ItemIndex]);
   X.AktMaxSid:=X.AktMinSid;
   X.AktSid:=X.AktMinSid;
 end;
  NAPLN_COMBO_ZAM(Sender);
end;

procedure TFParForm.CB_zamDropDown(Sender: TObject);
var filter1,filter2: string;
begin with DMZ do begin
  if Edit_zam_filter.Text<>''
    then filter1 := 'Surname='''+Uppercase(Edit_zam_filter.Text)+'*'''
    else filter1:='';
  if Edit_zam_filter_rc.Text<>''
    then filter2 := 'Born_numb='''+Uppercase(Edit_zam_filter_rc.Text)+'*'''
    else filter2:='';
  {--}
  if filter1='' then
    PRIEZVISKO_FILTER:=filter2
  else if filter2='' then
    PRIEZVISKO_FILTER:=filter1
  else if (filter1='') and (filter2='') then
    PRIEZVISKO_FILTER:=''
  else PRIEZVISKO_FILTER:= filter1 + ' and ' + filter2;
  {-}
  if (PRIEZVISKO_FILTER<>'') then
  begin
    NAPLN_COMBO_ZAM(Sender);
  end;
end;end;








end.
