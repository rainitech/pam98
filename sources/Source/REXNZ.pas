unit REXNZ;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportNZ = class(TQuickRep)
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    PageHeaderBand1: TQRBand;
    QRLabel47: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel46: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel9: TQRLabel;
    DS0: TDataSource;
    T0_: TTable;
    T0_RIADOK: TSmallintField;
    T0_TEXT: TStringField;
    T0_SUMA: TCurrencyField;
    T0_IDENT_SYMBOL: TStringField;
    T0_IDENT_CISLO: TSmallintField;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    T0_CALC_FIRMA: TStringField;
    QRShape3: TQRShape;
    QRDBText4: TQRDBText;
    T0_SUMA1: TCurrencyField;
    QNaklGroup_: TQuery;
    QNaklGroup_riadok: TSmallintField;
    QNaklGroup_text: TStringField;
    QNaklGroup_suma: TCurrencyField;
    QNaklGroup_ident_symbol: TStringField;
    QNaklGroup_ident_cislo: TSmallintField;
    QNaklGroup_suma1: TCurrencyField;
    procedure T0_CalcFields(DataSet: TDataSet);
    procedure ReportNZBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    zp_preplatok,zp_nedoplatok,pom_bonus: double;
    X: TMyReportParam;
    first_preview : boolean;
  public
    CisloRiadku: integer;
    WriteToDb: boolean;
    MultipleSid: boolean;
    procedure ShowReport;
    procedure VymazPomocnuDatabazu
    (MyReportParam: TMyReportParam; xWriteToDB: boolean);
    procedure VytvorPomocnuDatabazu
    (MyReportParam: TMyReportParam; xWriteToDB: boolean);
    procedure VlozRiadok(const s:string;suma:double;sym1:string;sym2:integer);
    procedure VlozRiadok2(const s:string;suma,suma1:double;sym1:string;sym2:integer);
    procedure VlozZP;
    procedure VlozZP2005;
    procedure VlozSP;
    procedure VlozFZ;
    procedure VlozVY;
    procedure VlozVY_Open;
    procedure VlozVY_Dane;
    procedure VlozVY_Dane_Posun;
    procedure VlozVY_Spolocne;
    procedure VlozVY_Close;
    procedure VlozPOI;
    procedure VlozDDP;
    procedure SetX(const MyReportParam:TMyReportParam);
  end;

  TMesacneNaklady = record
    zp1,zp2:double;
    sp1,sp2:double;
    fz1,fz2,garf:double;
    poi1,poi2:double;
    vy,vy1,vy2,vy3,vy4,dan,dan1,dan2,dan2akt,dan3,dan4,dan5,nd,dan1x,dan2x,dan1rz,
    rzp_preplatok,rzp_nedoplatok:double;
    n_brutto:double;
    n_doplatok:double;
    f_poistne:double;
    pskod:double;
    zsf,sf:double;
  end;

var
  ReportNZ: TReportNZ;
  MesacneNaklady: TMesacneNaklady;

procedure RunReportNZ(const MyReportParam: TMyReportParam);

implementation

uses RexSP, RexZP, RexFZ1, RexVL3, Dm_main, DM_sql, REXFZ1A, REXPOI, REXPOI2, DM_ALL,
  Dm_vypl, REXSP1, ZP2005VY, SP2005VY;

{$R *.DFM}

procedure TReportNZ.VlozRiadok(const s:string;suma:double;sym1:string;sym2:integer);
begin
  if (X.Typ='PU') and (NOT (StrToChar(sym1) IN SetOf_PU_symboly)) then exit;
  if (X.Typ<>'PU') and (StrToChar(sym1) IN SetOf_PU_symboly) then exit;
  CisloRiadku:=CisloRiadku+1;
  if WriteToDB then
  begin
    T0_.Insert;
    T0_RIADOK.Value:=CisloRiadku;
    T0_TEXT.Value:=s;
    T0_SUMA.Value:=suma;
    T0_IDENT_SYMBOL.Value:=sym1;
    T0_IDENT_CISLO.Value:=sym2;
    T0_.Post;
  end;
end;

procedure TReportNZ.VlozRiadok2(const s:string;suma,suma1:double;sym1:string;sym2:integer);
begin
  CisloRiadku:=CisloRiadku+1;
  if WriteToDB then
  begin
    T0_.Insert;
    T0_RIADOK.Value:=CisloRiadku;
    T0_TEXT.Value:=s;
    T0_SUMA.Value:=suma;
    T0_SUMA1.Value:=suma1;
    T0_IDENT_SYMBOL.Value:=sym1;
    T0_IDENT_CISLO.Value:=sym2;
    T0_.Post;
  end;
end;

procedure TReportNZ.VlozZP;
var printband:boolean;
begin with MesacneNaklady do begin
  zp1:=0;
  zp2:=0;
  try
  ReportZP:=TReportZP.Create(Application);
  ReportZP.SetX(X);
  ReportZP.QCIS_.Close;
  ReportZP.Q0_.Close;
  ReportZP.Q0_.ParamByName('P1').AsInteger := X.AktObdobie;
  ReportZP.Q0_.ParamByName('P2').AsInteger := X.AktMinSid;
  ReportZP.Q0_.ParamByName('P3').AsInteger := X.AktMaxSid;
  ReportZP.Q0_.Open;
  ReportZP.QCIS_.Open;
  while not ReportZP.Q0_.EOF do
  begin
    printband:=false;
    ReportZP.DetailBand1BeforePrint(ReportZP.DetailBand1,printband);
    with RexZP.MyOdvody[0],RexZP.MySadzby do begin
      VlozRiadok2(
       'PoistnÈ do zdrav.poisùovne Ë.'+ReportZP.Q0_kzp.AsString+' - (zamestnanci/zamestn·vateæ)',
       o_zdravot+o_zdravot1,oz_zdravot+oz_zdravot1,'',0);
      VlozRiadok(
       'PoistnÈ do zdrav.poisùovne Ë.'+ReportZP.Q0_kzp.AsString+' - spolu',
       o_zdravot+o_zdravot1+oz_zdravot+oz_zdravot1,
       'Z',ReportZP.Q0_kzp.Value);
      VlozRiadok(
       'PoistnÈ do ZP Ë.'+ReportZP.Q0_kzp.AsString+' - zam.',o_zdravot+o_zdravot1,
       '[',ReportZP.Q0_kzp.Value);
      VlozRiadok(
       'PoistnÈ do ZP Ë.'+ReportZP.Q0_kzp.AsString+' - firma.',oz_zdravot+oz_zdravot1,
       ']',ReportZP.Q0_kzp.Value);
      zp1:=zp1+o_zdravot+o_zdravot1;
      zp2:=zp2+oz_zdravot+oz_zdravot1;
    end;
    ReportZP.Q0_.Next;
  end;
  ReportZP.QCIS_.Close;
  ReportZP.Q0_.Close;
  finally
  ReportZP.Free;
  end;
  {--}
  VlozRiadok2('PoistnÈ do zdrav.poisùovnÌ - (zamestnanci/zamestn·vateæ)',zp1,zp2,'',0);
  VlozRiadok('PoistnÈ do zdrav.poisùovnÌ - spolu',zp1+zp2,'',0);
  poi1:=poi1+zp1;
  poi2:=poi2+zp2;
end;end;

procedure TReportNZ.VlozZP2005;
var printband:boolean;
begin with MesacneNaklady do begin
  zp1:=0;
  zp2:=0;
  try
  ReportZP2005VY:=TReportZP2005VY.Create(Application);
  ReportZP2005VY.SetX(X);
  ReportZP2005VY.Q0_.Close;
  ReportZP2005VY.Q0_.Open;
  while not ReportZP2005VY.Q0_.EOF do
  begin
    printband:=false;
    ReportZP2005VY.DetailBand1BeforePrint(ReportZP2005VY.DetailBand1,printband);
    with ZP2005VY.MyOdvody[0],RexZP.MySadzby do begin
      VlozRiadok2(
       'PoistnÈ do zdrav.poisùovne Ë.'+ReportZP2005VY.Q0_kzp.AsString+' - (zamestnanci/zamestn·vateæ)',
       o_zdravot+o_zdravot1,oz_zdravot+oz_zdravot1,'',0);
      VlozRiadok(
       'PoistnÈ do zdrav.poisùovne Ë.'+ReportZP2005VY.Q0_kzp.AsString+' - spolu',
       o_zdravot+o_zdravot1+oz_zdravot+oz_zdravot1,
       'Z',ReportZP2005VY.Q0_kzp.Value);
      VlozRiadok(
       'PoistnÈ do ZP Ë.'+ReportZP2005VY.Q0_kzp.AsString+' - zam.',o_zdravot+o_zdravot1,
       '[',ReportZP2005VY.Q0_kzp.Value);
      VlozRiadok(
       'PoistnÈ do ZP Ë.'+ReportZP2005VY.Q0_kzp.AsString+' - firma.',oz_zdravot+oz_zdravot1,
       ']',ReportZP2005VY.Q0_kzp.Value);
      zp1:=zp1+o_zdravot+o_zdravot1;
      zp2:=zp2+oz_zdravot+oz_zdravot1;
    end;
    ReportZP2005VY.Q0_.Next;
  end;
  ReportZP2005VY.Q0_.Close;
  finally
  ReportZP2005VY.Free;
  end;
  {--}
  VlozRiadok2('PoistnÈ do zdrav.poisùovnÌ - (zamestnanci/zamestn·vateæ)',zp1,zp2,'',0);
  VlozRiadok('PoistnÈ do zdrav.poisùovnÌ - spolu',zp1+zp2,'',0);
  poi1:=poi1+zp1;
  poi2:=poi2+zp2;
end;end;

procedure TReportNZ.VlozSP;
begin with MesacneNaklady do begin
if X.AktObdobie < Zakon_2004_01 then
begin
  try
  ReportSP:=TReportSP.Create(Application);
  ReportSP.SetX(X);
  ReportSP.Q1_.Close;
  ReportSP.Q1_.Open;
  with RexSP.MyOdvody[0],RexSP.MySadzby do begin
    if (Copy(ReportSP.Q1_CALC_NAZOV_ADRESA.value,1,6)='T.M.K.') and
       (X.AktObdobie = 200001) and
       (z_nemoc=12947) then z_nemoc:=12948;
    VlozRiadok('Odvod nemoc.poistenia - zamestnanci',o_nemoc+o_nemoc1,'',0);
    VlozRiadok('Odvod nemoc.poistenia - zamestn·vateæ',z_nemoc+z_nemoc1,'',0);
    VlozRiadok('Odvod dÙchod.poistenia - zamestnanci',o_dochod+o_dochod1,'',0);
    VlozRiadok('Odvod dÙchod.poistenia - zamestn·vateæ',z_dochod+z_dochod1,'',0);
    sp1:=o_nemoc+o_nemoc1+o_dochod+o_dochod1;
    sp2:=z_nemoc+z_nemoc1+z_dochod+z_dochod1;
    VlozRiadok('Odvod poistnÈho do soc.poisùovne - zamestnanci',sp1,'',0);
    VlozRiadok('Odvod poistnÈho do soc.poisùovne - zamestn·vateæ',sp2,'',0);
    VlozRiadok('Odvod poistnÈho do soc.poisùovne - spolu',sp1+sp2,'',0);
  end;
  ReportSP.Q1_.Close;
  finally
  ReportSP.Free;
  end;
  poi1:=poi1+sp1;
  poi2:=poi2+sp2;
end else if X.AktObdobie < Zakon_2011_01 then
begin
  try
  ReportSP1:=TReportSP1.Create(Application);
  ReportSP1.SetX(X);
  ReportSP1.Q1_.Close;
  ReportSP1.Q1_.Open;
  with RexSP1.MyOdvody[0] do begin
    VlozRiadok2('NP (nemocenskÈ poistenie)    - (zamestnanci/zamestn·vateæ)',o_nemoc,z_nemoc,'',0);
    VlozRiadok2('SP (starobnÈ poistenie)      - (zamestnanci/zamestn·vateæ)',o_dochod,z_dochod,'',0);
    VlozRiadok2('IP (invalidnÈ poistenie)     - (zamestnanci/zamestn·vateæ)',o_invalid,z_invalid,'',0);
    VlozRiadok2('PvN(poist. v nezamestnanosti)- (zamestnanci/zamestn·vateæ)',o_fondzam,z_fondzam,'',0);
    VlozRiadok2('UP (˙razovÈ poistenie)       - (zamestnanci/zamestn·vateæ)',0,z_uraz,'',0);
    VlozRiadok2('GP (garanËnÈ poistenie)      - (zamestnanci/zamestn·vateæ)',0,z_garancne,'',0);
    VlozRiadok2('RFS(rezerv˝ fond solidarity) - (zamestnanci/zamestn·vateæ) ',0,z_rezerva,'',0);
  end;
  with RexSP1.MyOdvodyNp[0] do begin
    VlozRiadok2('Nepravideln˝ prÌjem NP         - (zamestnanci/zamestn·vateæ)',o_nemoc,z_nemoc,'',0);
    VlozRiadok2('Nepravideln˝ prÌjem SP         - (zamestnanci/zamestn·vateæ)',o_dochod,z_dochod,'',0);
    VlozRiadok2('Nepravideln˝ prÌjem IP         - (zamestnanci/zamestn·vateæ)',o_invalid,z_invalid,'',0);
    VlozRiadok2('Nepravideln˝ prÌjem PvN        - (zamestnanci/zamestn·vateæ)',o_fondzam,z_fondzam,'',0);
    VlozRiadok2('Nepravideln˝ prÌjem UP         - (zamestnanci/zamestn·vateæ)',0,z_uraz,'',0);
    VlozRiadok2('Nepravideln˝ prÌjem GP         - (zamestnanci/zamestn·vateæ)',0,z_garancne,'',0);
    VlozRiadok2('Nepravideln˝ prÌjem RFS        - (zamestnanci/zamestn·vateæ) ',0,z_rezerva,'',0);
  end;
  with RexSP1.MyOdvody[0] do begin
    VlozRiadok('NP (nemocenskÈ poistenie)    - zam.',o_nemoc    + RexSP1.MyOdvodyNp[0].o_nemoc,'+',30);
    VlozRiadok('SP (starobnÈ poistenie)      - zam.',o_dochod   + RexSP1.MyOdvodyNp[0].o_dochod,'+',31);
    VlozRiadok('IP (invalidnÈ poistenie)     - zam.',o_invalid  + RexSP1.MyOdvodyNp[0].o_invalid,'+',32);
    VlozRiadok('PvN(poist. v nezamestnanosti)- zam.',o_fondzam  + RexSP1.MyOdvodyNp[0].o_fondzam,'+',33);
    VlozRiadok('NP (nemocenskÈ poistenie)    - firma',z_nemoc   + RexSP1.MyOdvodyNp[0].z_nemoc,'+',36);
    VlozRiadok('SP (starobnÈ poistenie)      - firma',z_dochod  + RexSP1.MyOdvodyNp[0].z_dochod,'+',37);
    VlozRiadok('IP (invalidnÈ poistenie)     - firma',z_invalid + RexSP1.MyOdvodyNp[0].z_invalid,'+',38);
    VlozRiadok('PvN(poist. v nezamestnanosti)- firma',z_fondzam + RexSP1.MyOdvodyNp[0].z_fondzam,'+',39);
    VlozRiadok('UP (˙razovÈ poistenie)'              ,z_uraz    + RexSP1.MyOdvodyNp[0].z_uraz,'+',40);
    VlozRiadok('GP (garanËnÈ poistenie)'             ,z_garancne+ RexSP1.MyOdvodyNp[0].z_garancne,'+',41);
    VlozRiadok('RFS(rezerv˝ fond solidarity)'        ,z_rezerva + RexSP1.MyOdvodyNp[0].z_rezerva,'+',42);
  end;
  sp1:=0;
  sp2:=0;
  with RexSP1.MyOdvody[0] do begin
    sp1:=sp1+o_nemoc+o_dochod+o_invalid+o_fondzam;
    sp2:=sp2+z_nemoc+z_dochod+z_invalid+z_fondzam+z_uraz+z_garancne+z_rezerva;
  end;
  with RexSP1.MyOdvodyNp[0] do begin
    sp1:=sp1+o_nemoc+o_dochod+o_invalid+o_fondzam;
    sp2:=sp2+z_nemoc+z_dochod+z_invalid+z_fondzam+z_uraz+z_garancne+z_rezerva;
  end;
  VlozRiadok2('PoistnÈ do soc.poisùovne - (zamestnanci/zamestn·vateæ)',sp1,sp2,'',0);
  VlozRiadok('PoistnÈ do soc.poisùovne - spolu',sp1+sp2,'',0);
  ReportSP1.Q1_.Close;
  finally
  ReportSP1.Free;
  end;
  poi1:=poi1+sp1;
  poi2:=poi2+sp2;
end else
begin
  try
  ReportSP2005VY:=TReportSP2005VY.Create(Application);
  ReportSP2005VY.SetX(X);
  ReportSP2005VY.Q1_.Close;
  ReportSP2005VY.Q1_.Open;
  with SP2005VY.MyOdvody[0] do begin
    VlozRiadok2('NP (nemocenskÈ poistenie)    - (zamestnanci/zamestn·vateæ)',o_nemoc,z_nemoc,'',0);
    VlozRiadok2('SP (starobnÈ poistenie)      - (zamestnanci/zamestn·vateæ)',o_dochod,z_dochod,'',0);
    VlozRiadok2('IP (invalidnÈ poistenie)     - (zamestnanci/zamestn·vateæ)',o_invalid,z_invalid,'',0);
    VlozRiadok2('PvN(poist. v nezamestnanosti)- (zamestnanci/zamestn·vateæ)',o_fondzam,z_fondzam,'',0);
    VlozRiadok2('UP (˙razovÈ poistenie)       - (zamestnanci/zamestn·vateæ)',0,z_uraz,'',0);
    VlozRiadok2('GP (garanËnÈ poistenie)      - (zamestnanci/zamestn·vateæ)',0,z_garancne,'',0);
    VlozRiadok2('RFS(rezerv˝ fond solidarity) - (zamestnanci/zamestn·vateæ) ',0,z_rezerva,'',0);
  end;
  with SP2005VY.MyOdvodyNp[0] do begin
    VlozRiadok2('Nepravideln˝ prÌjem NP         - (zamestnanci/zamestn·vateæ)',o_nemoc,z_nemoc,'',0);
    VlozRiadok2('Nepravideln˝ prÌjem SP         - (zamestnanci/zamestn·vateæ)',o_dochod,z_dochod,'',0);
    VlozRiadok2('Nepravideln˝ prÌjem IP         - (zamestnanci/zamestn·vateæ)',o_invalid,z_invalid,'',0);
    VlozRiadok2('Nepravideln˝ prÌjem PvN        - (zamestnanci/zamestn·vateæ)',o_fondzam,z_fondzam,'',0);
    VlozRiadok2('Nepravideln˝ prÌjem UP         - (zamestnanci/zamestn·vateæ)',0,z_uraz,'',0);
    VlozRiadok2('Nepravideln˝ prÌjem GP         - (zamestnanci/zamestn·vateæ)',0,z_garancne,'',0);
    VlozRiadok2('Nepravideln˝ prÌjem RFS        - (zamestnanci/zamestn·vateæ) ',0,z_rezerva,'',0);
  end;
  with SP2005VY.MyOdvody[0] do begin
    VlozRiadok('NP (nemocenskÈ poistenie)    - zam.',o_nemoc    + SP2005VY.MyOdvodyNp[0].o_nemoc,'+',30);
    VlozRiadok('SP (starobnÈ poistenie)      - zam.',o_dochod   + SP2005VY.MyOdvodyNp[0].o_dochod,'+',31);
    VlozRiadok('IP (invalidnÈ poistenie)     - zam.',o_invalid  + SP2005VY.MyOdvodyNp[0].o_invalid,'+',32);
    VlozRiadok('PvN(poist. v nezamestnanosti)- zam.',o_fondzam  + SP2005VY.MyOdvodyNp[0].o_fondzam,'+',33);
    VlozRiadok('NP (nemocenskÈ poistenie)    - firma',z_nemoc   + SP2005VY.MyOdvodyNp[0].z_nemoc,'+',36);
    VlozRiadok('SP (starobnÈ poistenie)      - firma',z_dochod  + SP2005VY.MyOdvodyNp[0].z_dochod,'+',37);
    VlozRiadok('IP (invalidnÈ poistenie)     - firma',z_invalid + SP2005VY.MyOdvodyNp[0].z_invalid,'+',38);
    VlozRiadok('PvN(poist. v nezamestnanosti)- firma',z_fondzam + SP2005VY.MyOdvodyNp[0].z_fondzam,'+',39);
    VlozRiadok('UP (˙razovÈ poistenie)'              ,z_uraz    + SP2005VY.MyOdvodyNp[0].z_uraz,'+',40);
    VlozRiadok('GP (garanËnÈ poistenie)'             ,z_garancne+ SP2005VY.MyOdvodyNp[0].z_garancne,'+',41);
    VlozRiadok('RFS(rezerv˝ fond solidarity)'        ,z_rezerva + SP2005VY.MyOdvodyNp[0].z_rezerva,'+',42);
  end;
  sp1:=0;
  sp2:=0;
  with SP2005VY.MyOdvody[0] do begin
    sp1:=sp1+o_nemoc+o_dochod+o_invalid+o_fondzam;
    sp2:=sp2+z_nemoc+z_dochod+z_invalid+z_fondzam+z_uraz+z_garancne+z_rezerva;
  end;
  with SP2005VY.MyOdvodyNp[0] do begin
    sp1:=sp1+o_nemoc+o_dochod+o_invalid+o_fondzam;
    sp2:=sp2+z_nemoc+z_dochod+z_invalid+z_fondzam+z_uraz+z_garancne+z_rezerva;
  end;
  VlozRiadok2('PoistnÈ do soc.poisùovne - (zamestnanci/zamestn·vateæ)',sp1,sp2,'',0);
  VlozRiadok('PoistnÈ do soc.poisùovne - spolu',sp1+sp2,'',0);
  ReportSP2005VY.Q1_.Close;
  finally
  ReportSP2005VY.Free;
  end;
  poi1:=poi1+sp1;
  poi2:=poi2+sp2;
end;

end;end;

procedure TReportNZ.VlozPOI;
var MM:integer;
begin with MesacneNaklady do begin
if X.AktObdobie >= Zakon_2004_01 then exit
else
begin
  MM := MyMesiac(X.AktObdobie);
  pskod := 0;
  if MM in [3,6,9,12] then begin
    try
    if X.AktObdobie<Zakon_2002_01 then
    begin
     ReportPOI:=TReportPOI.Create(Application);
     ReportPOI.SetX(X);
     ReportPOI.Q0_.Close;
     ReportPOI.Q0_.ParamByName('P1').AsInteger := X.AktObdobie - 2;
     ReportPOI.Q0_.ParamByName('P2').AsInteger := X.AktObdobie;
     ReportPOI.Q0_.Open;
     pskod := ReportPOI.Q0_CALC_POISTNE.Value;
    end
    else if X.AktObdobie>=Zakon_2002_01 then
    begin
     ReportPOI2:=TReportPOI2.Create(Application);
     ReportPOI2.SetX(X);
     ReportPOI2.Q0_.Close;
     ReportPOI2.Q0_.ParamByName('P1').AsInteger := X.AktObdobie - 2;
     ReportPOI2.Q0_.ParamByName('P2').AsInteger := X.AktObdobie;
     ReportPOI2.Q0_.Open;
     pskod := ReportPOI2.Q0_CALC_POISTNE.Value;
    end;
    VlozRiadok('Z·konnÈ poistenie zodpovednosti organiz. za ökodu',pskod,'P',0);
    if X.AktObdobie<Zakon_2002_01 then
     ReportPOI.Q0_.Close
    else if X.AktObdobie>=Zakon_2002_01 then
      ReportPOI2.Q0_.Close;
    finally
    if X.AktObdobie<Zakon_2002_01 then ReportPOI.Free
    else if X.AktObdobie>=Zakon_2002_01 then ReportPOI2.Free;
    end;
  end;
end;
end;end;

procedure TReportNZ.VlozFZ;
begin with MesacneNaklady do begin
if X.AktObdobie >= Zakon_2004_01 then exit
else
if X.AktObdobie < Zakon_2000_05 then
begin
  try
  ReportFZ1:=TReportFZ1.Create(Application);
  ReportFZ1.SetX(X);
  ReportFZ1.Q0_.Close;
  ReportFZ1.Q0_.ParamByName('P1').AsInteger := X.AktObdobie;
  ReportFZ1.Q0_.ParamByName('P2').AsInteger := X.AktMinSid;
  ReportFZ1.Q0_.ParamByName('P3').AsInteger := X.AktMaxSid;
  ReportFZ1.Q0_.Open;
  ReportFZ1.T0_.Open;
  fz1:=ReportFZ1.Q0_o_fondzam.Value;
  fz2:=ReportFZ1.Q0_CALC_OZ_FONDZAM.Value+ReportFZ1.Q0_CALC_OZ_FONDZAM1.Value;
  garf:=0;
  VlozRiadok('Odvod na ˙rad pr·ce do fondu zam. - zamestnanci',fz1,'',0);
  VlozRiadok('Odvod na ˙rad pr·ce do fondu zam. - zamestn·vateæ',fz2,'',0);
  VlozRiadok('Odvod na ˙rad pr·ce do fondu zam. - spolu',fz1+fz2,'U',0);
  ReportFZ1.Q0_.Close;
  ReportFZ1.T0_.Close;
  finally;
  ReportFZ1.Free;
  end;
  poi1:=poi1+fz1;
  poi2:=poi2+fz2;
  VlozRiadok('PoistnÈ - zamestnanci',poi1,'',0);
  VlozRiadok('PoistnÈ - zamestn·vateæ',poi2,'',0);
  VlozRiadok('PoistnÈ - spolu',poi1+poi2,'',0);
end else
begin
  try
  ReportFZ1A:=TReportFZ1A.Create(Application);
  ReportFZ1A.SetX(X);
  ReportFZ1A.Q0_.Close;
  ReportFZ1A.Q0_.ParamByName('P1').AsInteger := X.AktObdobie;
  ReportFZ1A.Q0_.ParamByName('P2').AsInteger := X.AktMinSid;
  ReportFZ1A.Q0_.ParamByName('P3').AsInteger := X.AktMaxSid;
  ReportFZ1A.Q0_.Open;
  ReportFZ1A.T0_.Open;
  fz1:=ReportFZ1A.Q0_o_fondzam.Value;
  fz2:=ReportFZ1A.Q0_CALC_OZ_FONDZAM.Value+ReportFZ1A.Q0_CALC_OZ_FONDZAM1.Value;
  garf:=ReportFZ1A.Q0_CALC_OZ_GARFOND.Value+ReportFZ1A.Q0_CALC_OZ_GARFOND1.Value;
  VlozRiadok('Odvod na ˙rad pr·ce do fondu zam. - zamestnanci',fz1,'',0);
  VlozRiadok('Odvod na ˙rad pr·ce do fondu zam. - zamestn·vateæ',fz2,'',0);
  VlozRiadok('Odvod na ˙rad pr·ce do fondu zam. - spolu',fz1+fz2,'',0);
  VlozRiadok('Odvod na ˙rad pr·ce do garanËnÈho fondu',garf,'',0);
  VlozRiadok('Odvod na ˙rad pr·ce spolu',fz1+fz2+garf,'U',0);
  ReportFZ1A.Q0_.Close;
  ReportFZ1A.T0_.Close;
  finally
  ReportFZ1A.Free;
  end;
  poi1:=poi1+fz1;
  poi2:=poi2+fz2+garf;
  VlozRiadok('PoistnÈ - zamestnanci',poi1,'',0);
  VlozRiadok('PoistnÈ - zamestn·vateæ',poi2,'',0);
  VlozRiadok('PoistnÈ - spolu',poi1+poi2,'',0);
end;
end;end;

procedure TReportNZ.VlozVY_Open;
begin
  ReportVL3:=TReportVL3.Create(Application);
  ReportVL3.SetX(X);
  ReportVL3.Q1_.Close;
  ReportVL3.Q1_.ParamByName('P1').AsInteger := X.AktObdobie;
  ReportVL3.Q1_.ParamByName('P1X').AsInteger := X.AktObdobie;
  ReportVL3.Q1_.ParamByName('P2').AsInteger := X.AktMinSid;
  ReportVL3.Q1_.ParamByName('P3').AsInteger := X.AktMaxSid;
  ReportVL3.Q1_.Open;
  {--}
  ReportVL3.Q2a_.Close;
  ReportVL3.Q2a_.ParamByName('P1').AsInteger := X.AktObdobie;
  ReportVL3.Q2a_.ParamByName('P1X').AsInteger := X.AktObdobie;
  ReportVL3.Q2a_.ParamByName('P2').AsInteger := X.AktMinSid;
  ReportVL3.Q2a_.ParamByName('P3').AsInteger := X.AktMaxSid;
  ReportVL3.Q2a_.Open;
  {--}
  ReportVL3.Q2b_.Close;
  ReportVL3.Q2b_.ParamByName('P1').AsInteger := X.AktObdobie;
  ReportVL3.Q2b_.ParamByName('P1X').AsInteger := X.AktObdobie;
  ReportVL3.Q2b_.ParamByName('P2').AsInteger := X.AktMinSid;
  ReportVL3.Q2b_.ParamByName('P3').AsInteger := X.AktMaxSid;
  ReportVL3.Q2b_.Open;
  {--}
  ReportVL3.Q3_.Close;
  ReportVL3.Q3_.ParamByName('P1').AsInteger := Obdobie_Add_MM(X.AktObdobie,-1);
  ReportVL3.Q3_.ParamByName('P1X').AsInteger := Obdobie_Add_MM(X.AktObdobie,-1);
  ReportVL3.Q3_.ParamByName('P2').AsInteger := X.AktMinSid;
  ReportVL3.Q3_.ParamByName('P3').AsInteger := X.AktMaxSid;
  ReportVL3.Q3_.Open;
end;
procedure TReportNZ.VlozVY_Close;
begin
  ReportVL3.Q1_.Close;
  ReportVL3.Q2a_.Close;
  ReportVL3.Q2b_.Close;
  ReportVL3.Q3_.Close;
end;
procedure TReportNZ.VlozVY_Spolocne;
begin with MesacneNaklady do begin
  vy1:=ReportVL3.Q1_Vy_zaloha.Value;
  vy2:=ReportVL3.Q1_Vy_hot.Value;
  vy3:=ReportVL3.Q1_Vy_spor.Value;
  vy4:=ReportVL3.Q1_Vy_zraz.Value;
  vy:=vy1+vy2+vy3+vy4;
  nd:=ReportVL3.Q1_Nd_spolu.Value;
  n_brutto:=ReportVL3.Q1_N_brutto.Value;
  f_poistne:=ReportVL3.Q1_F_poistne.Value;
  VlozRiadok('V˝plata - z·lohy',vy1,'',0);
  VlozRiadok2('V˝plata - 1.v hotovosti/2.bezhotovostne',vy2,vy3,'',0);
  VlozRiadok('V˝plata - zr·ûky',vy4,'',0);
  VlozRiadok('V˝plata - spolu',vy,'',0);
  VlozRiadok2('Soci·lna poisùovÚa 1.PoistnÈ/2.D·vky NP',sp1+sp2,nd,'',0);
  VlozRiadok('Soci·lna poisùovÚa - v˝sledn· suma odvodu',sp1+sp2-nd,'S',0);
  VlozRiadok('Hrub˝ prÌjem',n_brutto,'',0);
  VlozRiadok('Hrub˝ prÌjem - zdanen˝ osob.sadzbou dane',ReportVL3.Q1_n_brutto_dohody.Value,'',0);
  VlozRiadok('VreckovÈ pri zahr.pr.cest·ch',ReportVL3.Q1_vreckove.Value,'',0);
  {}
  VlozRiadok('DaÚov˝ ˙rad - preddavky',dan1,'+',17);
  VlozRiadok('DaÚov˝ ˙rad - zr·ûky',dan2,'*',1750);
  VlozRiadok('DaÚov˝ ˙rad - nedoplatky z roËnÈho z˙Ët.',rzp_nedoplatok,'+',20);
  VlozRiadok('DaÚov˝ ˙rad - preplatky z roËnÈho z˙Ët.',rzp_preplatok,'+',21);
  {}
  zsf := ZAOKRUHLI(ReportVL3.Q1_n_mzda.Value,
    DM.TSET_ZAOKRUH7.Value,DM.TSET_ZAOKRUH7SM.Value);
  sf := ZAOKRUHLI(zsf * DM.TINF_F_socfond.Value / 100,
    DM.TSET_ZAOKRUH8.Value,DM.TSET_ZAOKRUH8SM.Value);
  VlozRiadok('Z·klad pre v˝poËet odvodu do soci·lneho fondu',zsf,'',0);
  VlozRiadok('Odvod do soci·lneho fondu',sf,'X',0);
  VlozRiadok('Odvod do soci·lneho fondu',sf,'+',44);
  VlozRiadok('Z·kladnÈ mzdy',ReportVL3.Q1_V_plat.Value,'+',1);
  VlozRiadok('MzdovÈ prÌplatky',ReportVL3.Q1_N_priplat.Value,'+',2);
  VlozRiadok('PrÈmie',ReportVL3.Q1_N_premie.Value,'+',3);
  VlozRiadok('Odmeny',ReportVL3.Q1_N_odmeny.Value,'+',4);
  VlozRiadok('N·hrady sviatok',ReportVL3.Q1_N_sviatok.Value,'+',5);
  VlozRiadok('N·hrady dovolenka',ReportVL3.Q1_N_holiday.Value,'+',6);
  VlozRiadok('N·hrady neprÌtomnosù',ReportVL3.Q1_N_nahrada.Value,'+',7);
  VlozRiadok('N·hrady za neprac. 60%',ReportVL3.Q1_N_nemohol.Value,'+',8);
  VlozRiadok('N·hrady za PN',ReportVL3.Q1_N_nahrada_pn.Value,'+',9);
  VlozRiadok('N·hrady za pohotovosù',ReportVL3.Q1_N_pohotovost.Value,'+',10);
  VlozRiadok('Odmeny z DoVP',ReportVL3.Q1_N_dohody_ovp.Value,'+',13);
  VlozRiadok('OdstupnÈ z·konnÈ',ReportVL3.Q1_N_odstupne.Value,'+',14);
  VlozRiadok('PrÌspevky zo SF',ReportVL3.Q1_N_socfond.Value,'+',15);
  VlozRiadok('PrÌjmy mimo poistnÈho',ReportVL3.Q1_N_mimo_poistne.Value,'+',16);
  zp_preplatok:=0;zp_nedoplatok:=0;
  if ReportVL3.Q1_Vyrovnanie_zp.Value>0
   then zp_preplatok:=ReportVL3.Q1_Vyrovnanie_zp.Value
   else zp_nedoplatok:=ReportVL3.Q1_Vyrovnanie_zp.Value;
  VlozRiadok2('RoËnÈ z˙Ëtovanie zdrav. poistenia 1.Preplatok/2.Nedoplatok',zp_preplatok,zp_nedoplatok,'',0);
  VlozRiadok('Z·lohy na mzdu',ReportVL3.Q1_Ne_zaloha.Value,'+',23);
  VlozRiadok('PÙûiËky',ReportVL3.Q1_Ne_pozicky.Value,'+',24);
  VlozRiadok('Odbory',ReportVL3.Q1_Ne_odborar.Value,'+',25);
  VlozRiadok('Poistenie',ReportVL3.Q1_Ne_poistovna.Value,'+',26);
  VlozRiadok('Ost.zr·ûky',ReportVL3.Q1_Ne_exekucia.Value,'+',27);
  VlozRiadok('StravnÈ',ReportVL3.Q1_Ne_stravne.Value,'+',28);
  VlozRiadok('DaÚov˝ bonus',ReportVL3.Q1_D_bonus_cerpany.Value,'+',22);
end;end;
{-------- VlozVY_DANE_POSUNUTE ---------- }
procedure TReportNZ.VlozVY_DANE_POSUN; {PARAMETER[32]='1'}
begin with MesacneNaklady do begin
  rzp_preplatok:=ReportVL3.Q2b_D_preplatok.Value;
  rzp_nedoplatok:=ReportVL3.Q2a_D_nedoplatok.Value;
  dan:=ReportVL3.Q1_Dan_spolu.Value;
  dan1:=ReportVL3.Q1_D_preddavok.Value;
  dan2:=ReportVL3.Q3_D_dan.Value;
  dan2akt:=ReportVL3.Q1_D_dan.Value;
  dan3:=ReportVL3.Q1_D_bonus_cerpany.Value;
  dan1rz:=dan1+rzp_nedoplatok-rzp_preplatok;
  pom_bonus:=dan3;
  //
  if pom_bonus<=0 then dan1x:=0 else
  if dan1rz<=0 then dan1x:=0 else
  if dan1rz>pom_bonus then dan1x:=pom_bonus
  else dan1x:=dan1rz;
  pom_bonus:=pom_bonus-dan1x;
  //
  if pom_bonus<=0 then dan2x:=0 else
  if dan2<=0 then dan2x:=0 else
  if dan2>pom_bonus then dan2x:=pom_bonus
  else dan2x:=dan2;
  VlozRiadok('DaÚov˝ ˙rad - preddavky dane',dan1,'',0);
  VlozRiadok2('DaÚov˝ ˙rad - 1.zr·ûkov· daÚ / 2.zr·ûkov· daÚ za minul˝ mesiac',dan2akt,dan2,'',0);
  VlozRiadok2('DaÚov˝ ˙rad - 1.nedoplatky dane z RZ / 2.preplatky dane z RZ',rzp_nedoplatok,rzp_preplatok,'',0);
  VlozRiadok('DaÚov˝ ˙rad - celkov· suma vyplatenÈho bonusu',dan3,'',0);
  VlozRiadok('DaÚov˝ ˙rad - preddavky + RZ - bonusy',dan1rz-dan1x,'E',0);
  VlozRiadok('DaÚov˝ ˙rad - zr·ûky - bonusy',dan2-dan2x,'F',0);
  dan5 := -dan1rz-dan2+dan3;
  VlozRiadok('DaÚov˝ ˙rad - odvod dane spolu',dan1rz-dan1x+dan2-dan2x,'D',0);
  if dan5>0 then VlozRiadok('DaÚov˝ ˙rad - PREPLATOK !!!',dan5,'',0);
end;end;
{-------- VlozVY_DANE ---------- }
procedure TReportNZ.VlozVY_Dane;
begin with MesacneNaklady do begin
  rzp_preplatok:=ReportVL3.Q2b_D_preplatok.Value;
  rzp_nedoplatok:=ReportVL3.Q2a_D_nedoplatok.Value;
  dan:=ReportVL3.Q1_Dan_spolu.Value;
  dan1:=ReportVL3.Q1_D_preddavok.Value;
  dan2:=ReportVL3.Q1_D_dan.Value;
  dan2akt:=ReportVL3.Q1_D_dan.Value;
  dan3:=ReportVL3.Q1_D_bonus_cerpany.Value;
  dan1rz:=dan1+rzp_nedoplatok-rzp_preplatok;
  pom_bonus:=dan3;
  //
  if pom_bonus<=0 then dan1x:=0 else
  if dan1rz<=0 then dan1x:=0 else
  if dan1rz>pom_bonus then dan1x:=pom_bonus
  else dan1x:=dan1rz;
  pom_bonus:=pom_bonus-dan1x;
  //
  if pom_bonus<=0 then dan2x:=0 else
  if dan2<=0 then dan2x:=0 else
  if dan2>pom_bonus then dan2x:=pom_bonus
  else dan2x:=dan2;
  VlozRiadok2('DaÚov˝ ˙rad - 1.preddavky dane / 2.zr·ûkov· daÚ',dan1,dan2,'',0);
  VlozRiadok2('DaÚov˝ ˙rad - 1.nedoplatky dane z RZ / 2.preplatky dane z RZ',rzp_nedoplatok,rzp_preplatok,'',0);
  VlozRiadok('DaÚov˝ ˙rad - celkov· suma vyplatenÈho bonusu',dan3,'',0);
  VlozRiadok('DaÚov˝ ˙rad - preddavky + RZ - bonusy',dan1rz-dan1x,'E',0);
  VlozRiadok('DaÚov˝ ˙rad - zr·ûky - bonusy',dan2-dan2x,'F',0);
  dan5 := -dan1rz-dan2+dan3;
  VlozRiadok('DaÚov˝ ˙rad - odvod dane spolu',dan1rz-dan1x+dan2-dan2x,'D',0);
  if dan5>0 then VlozRiadok('DaÚov˝ ˙rad - PREPLATOK !!!',dan5,'',0);
end;end;
{------- VlozVY --------}
procedure TReportNZ.VlozVY;
begin
  try
  VlozVY_Open;
  if PARAMETRE[32].Hodnota=0 then VlozVY_DANE
                             else VlozVY_DANE_POSUN;
  VlozVY_Spolocne;
  VlozVY_Close;
  finally
    ReportVL3.Free;
  end;
end;

procedure TReportNZ.ShowReport;
var sqlcmd: string;i,sid:integer;
begin
  first_preview := true;
  QRLabel47.Caption := 'REKAPITUL¡CIA N¡KLADOV ZA ' +
     Mesiac(X.AktObdobie mod 100,true)+' '+IntToStr(X.AktObdobie div 100);
  {--}
  MultipleSid := X.AktSidList <> '';
  if MultipleSid then begin
    T0_.Close;
    T0_.TableName := 'Naklsid.db';
    T0_.Open;
    DMSQL.ExecuteSql('delete from ":pam98_priv:nakl"');
    DMSQL.ExecuteSql('delete from ":pam98_priv:naklsid"');
    T0_.Refresh;
    sqlcmd := 'select * from ":pam98_data:cis_vm" where 1=1 '+X.AktSidList+#0;
    sqlcmd := StrReplaceX(sqlcmd, 'sid', 'id');
    DMSQL.ExecuteSql(sqlcmd);
    if DMSQL.Akt_rows > 0 then
    for i:=1 to DMSQL.Akt_Rows do begin
      sid:=StrToInt(DMSQL.Hodnoty[i,1]);
      X.AktSid := sid;
      X.AktMinSid := sid;
      X.AktMaxSid := sid;
      VytvorPomocnuDatabazu(X,True);
    end;
    T0_.Close;
    T0_.TableName := 'Nakl.db';
    T0_.Open;
    QNaklGroup_.Open;
    while not QNaklGroup_.EOF do begin
     T0_.Insert;
     T0_Riadok.Value       := QNaklGroup_Riadok.Value;
     T0_Text.Value         := QNaklGroup_Text.Value;
     T0_Suma.Value         := QNaklGroup_Suma.Value;
     T0_Ident_Symbol.Value := QNaklGroup_Ident_Symbol.Value;
     T0_Ident_cislo.Value  := QNaklGroup_Ident_cislo.Value;
     T0_Suma1.Value        := QNaklGroup_Suma1.Value;
     T0_.Post;
     QNaklGroup_.Next;
    end;
  end else
  begin
    T0_.Close;
    T0_.TableName := 'Nakl.db';
    VytvorPomocnuDatabazu(X,True);
  end;
  if not T0_.Active then T0_.Open;
  Preview;
  T0_.Close;
end;

procedure TReportNZ.VymazPomocnuDatabazu
(MyReportParam: TMyReportParam; xWriteToDB: boolean);
begin
  WriteToDb := xWriteToDB;
  if WriteToDB then begin
    T0_.Close;
    T0_.Open;
    DMSQL.ExecuteSql('delete from ":pam98_priv:nakl"');
    T0_.Refresh;
  end;
end;

procedure TReportNZ.VytvorPomocnuDatabazu
(MyReportParam: TMyReportParam; xWriteToDB: boolean);
begin with MesacneNaklady do begin
  SetX(MyReportParam);
  WriteToDB:= xWriteToDB;
  if not MultipleSid then VymazPomocnuDatabazu(MyReportParam,xWriteToDb);
  CisloRiadku:=0;
  poi1:=0;
  poi2:=0;
  try
  Progress(0);
  if X.AktObdobie < ZAKON_2005_01 then VlozZP
  else if X.AktObdobie >= ZAKON_2005_01 then VlozZP2005;
  Progress(25);
  VlozSP;
  Progress(50);
  VlozFZ;
  Progress(65);
  VlozVY;
  Progress(75);
  VlozPOI;
  Progress(85);
  VlozDDP;
  finally
  Progress(100);
  end;
end;end;

procedure TReportNZ.T0_CalcFields(DataSet: TDataSet);
begin
  T0_CALC_FIRMA.Value := X.AktFirmaStr;
end;

procedure RunReportNZ(const MyReportParam: TMyReportParam);
begin
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportNZ:=TReportNZ.Create(Application);
    ReportNZ.SetX(MyReportParam);
    if ReportNZ.X.DisableShape then QRDisableShape(ReportNZ);
    if ReportNZ.X.DisableLabel then QRDisableLabel(ReportNZ);
    Screen.Cursor:=crDefault;
    ReportNZ.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportNZ.Free;
  end;
end;

procedure TReportNZ.SetX(const MyReportParam:TMyReportParam);
begin
  X:=MyReportParam;
end;

procedure TReportNZ.VlozDDP;
var pom1,pom2:double;
    SQL_BACKUP: string;
begin with MesacneNaklady,DMV do begin
  try
    QDDP1_.Close;
    SQL_BACKUP := QDDP1_.SQL.Text;
(*
    QDDP1_.ParamByName('P1').AsInteger := X.AktObdobie;
    QDDP1_.ParamByName('P2').AsInteger := X.AktMinSid;
    QDDP1_.ParamByName('P3').AsInteger := X.AktMaxSid;
*)
    Q_SET(QDDP1_,':p1',IntToStr(X.AktObdobie)+' + 0');
    Q_SET_INT(QDDP1_,':p2',X.AktMinSid);
    Q_SET_INT(QDDP1_,':p3',X.AktMaxSid);
    QDDP1_.Open;
    while (not QDDP1_.EOF) do begin
      pom1:=QDDP1_N_DDP.Value;
      pom2:=QDDP1_Nz_DDP.Value;
      VlozRiadok2('DDP Ë.'+QDDP1_KDP.AsString+' - (zamestnanci/zamestn·vateæ)',pom1,pom2,'',0);
      VlozRiadok('DDP Ë.'+QDDP1_KDP.AsString+' - spolu',pom1+pom2,'Y',QDDP1_KDP.Value);
      VlozRiadok('DDP Ë.'+QDDP1_KDP.AsString+' - zam.',pom1,'(',QDDP1_KDP.Value);
      VlozRiadok('DDP Ë.'+QDDP1_KDP.AsString+' - firma',pom2,')',QDDP1_KDP.Value);
      QDDP1_.Next;
    end;
  finally
    QDDP1_.Close;
    QDDP1_.SQL.Text := SQL_BACKUP;
  end;
end;end;


procedure TReportNZ.ReportNZBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  if first_preview then begin
    first_preview := False;
    QRSetShapeWidth(Sender,1)
  end else
    QRSetShapeWidth(Sender,8);
end;

end.
