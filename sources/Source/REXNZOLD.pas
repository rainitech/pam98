unit REXNZOLD;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  MyConsts, MyQuick;

type
  TReportNZOLD = class(TQuickRep)
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
    procedure T0_CalcFields(DataSet: TDataSet);
  private
    X: TMyReportParam;

  public
    CisloRiadku: integer;
    WriteToDb: boolean;
    procedure ShowReport;
    procedure VytvorPomocnuDatabazu
    (MyReportParam: TMyReportParam; xWriteToDB: boolean);
    procedure VlozRiadok(const s:string;suma:double;sym1:string;sym2:integer);
    procedure VlozZP;
    procedure VlozSP;
    procedure VlozFZ;
    procedure VlozVY;
    procedure VlozPOI;
    procedure VlozDDP;
    procedure SetX(const MyReportParam:TMyReportParam);
  end;

  TMesacneNaklady = record
    zp1,zp2:double;
    sp1,sp2:double;
    fz1,fz2,garf:double;
    poi1,poi2:double;
    vy,vy1,vy2,vy3,vy4,dan,dan1,dan2,nd,
    rzp_preplatok,rzp_nedoplatok:double;
    n_brutto:double;
    n_doplatok:double;
    f_poistne:double;
    pskod:double;
    zsf,sf:double;
  end;

var
  ReportNZOLD: TReportNZOLD;
  MesacneNaklady: TMesacneNaklady;

procedure RunReportNZOLD(const MyReportParam: TMyReportParam);

implementation

uses RexSP, RexZP, RexFZ1, RexVL3, Dm_main, DM_sql, REXFZ1A, REXPOI, REXPOI2, DM_ALL,
  Dm_vypl;

{$R *.DFM}

procedure TReportNZOLD.VlozRiadok(const s:string;suma:double;sym1:string;sym2:integer);
begin
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

procedure TReportNZOLD.VlozZP;
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
      VlozRiadok(
       'Odvod do zdrav.poisùovne Ë.'+ReportZP.Q0_kzp.AsString+' - zamestnanci',
       o_zdravot+o_zdravot1,'',0);
      VlozRiadok(
       'Odvod do zdrav.poisùovne Ë.'+ReportZP.Q0_kzp.AsString+' - zamestn·vateæ',
       oz_zdravot+oz_zdravot1,'',0);
      VlozRiadok(
       'Odvod do zdrav.poisùovne Ë.'+ReportZP.Q0_kzp.AsString+' - spolu',
       o_zdravot+o_zdravot1+oz_zdravot+oz_zdravot1,
       'Z',ReportZP.Q0_kzp.Value);
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
  VlozRiadok('Odvod do vöetk˝ch zdrav.poisùovnÌ - zamestnanci',zp1,'',0);
  VlozRiadok('Odvod do vöetk˝ch zdrav.poisùovnÌ - zamestn·vateæ',zp2,'',0);
  VlozRiadok('Odvod do vöetk˝ch zdrav.poisùovnÌ - spolu',zp1+zp2,'',0);
  poi1:=poi1+zp1;
  poi2:=poi2+zp2;
end;end;

procedure TReportNZOLD.VlozSP;
begin with MesacneNaklady do begin
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
end;end;

procedure TReportNZOLD.VlozPOI;
var MM:integer;
begin with MesacneNaklady do begin
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
end;end;

procedure TReportNZOLD.VlozFZ;
begin with MesacneNaklady do begin
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

procedure TReportNZOLD.VlozVY;
begin with MesacneNaklady do begin
  try
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
{  ReportVL3.Prepare;}
  {--}
  dan:=ReportVL3.Q1_Dan_spolu.Value;
  dan1:=ReportVL3.Q1_D_preddavok.Value;
  dan2:=ReportVL3.Q1_D_dan.Value;
  rzp_preplatok:=ReportVL3.Q2b_D_preplatok.Value;
  rzp_nedoplatok:=ReportVL3.Q2a_D_nedoplatok.Value;
  vy1:=ReportVL3.Q1_Vy_zaloha.Value;
  vy2:=ReportVL3.Q1_Vy_hot.Value;
  vy3:=ReportVL3.Q1_Vy_spor.Value;
  vy4:=ReportVL3.Q1_Vy_zraz.Value;
  vy:=vy1+vy2+vy3+vy4;
  nd:=ReportVL3.Q1_Nd_spolu.Value;
  n_brutto:=ReportVL3.Q1_N_brutto.Value;
  f_poistne:=ReportVL3.Q1_F_poistne.Value;
  VlozRiadok('DaÚov˝ ˙rad - preddavky',dan1,'',0);
  VlozRiadok('DaÚov˝ ˙rad - zrazen· daÚ',dan2,'F',0);
  VlozRiadok('DaÚov˝ ˙rad - spolu preddavky + zr·ûky',dan,'',0);
  VlozRiadok('DaÚov˝ ˙rad - zrazenÈ nedoplatky z roËnÈho z˙Ëtovania',rzp_nedoplatok,'',0);
  VlozRiadok('DaÚov˝ ˙rad - vr·tenÈ preplatky z roËnÈho z˙Ëtovania',rzp_preplatok,'',0);
  VlozRiadok('DaÚov˝ ˙rad - roËn˝ nedoplatok(+)/preplatok(-) dane',rzp_nedoplatok-rzp_preplatok,'',0);
  VlozRiadok('DaÚov˝ ˙rad - spolu preddavky+roËnÈ z˙Ëtovanie',dan1+rzp_nedoplatok-rzp_preplatok,'E',0);
  VlozRiadok('DaÚov˝ ˙rad - spolu preddavky+zr·ûky+roËnÈ z˙Ëtovanie',dan+rzp_nedoplatok-rzp_preplatok,'D',0);
  VlozRiadok('V˝plata - z·lohy',vy1,'',0);
  VlozRiadok('V˝plata - v hotovosti',vy2,'',0);
  VlozRiadok('V˝plata - bezhotovostne',vy3,'',0);
  VlozRiadok('V˝plata - zr·ûky',vy4,'',0);
  VlozRiadok('V˝plata - spolu',vy,'',0);
  VlozRiadok('Odvod poistnÈho do soc.poisùovne - spolu',sp1+sp2,'',0);
  VlozRiadok('N·rok na d·vky nemoc.poistenia zo soc.poisùovne',nd,'',0);
  VlozRiadok('V˝sledn· suma odvodu do soc.poisùovne',sp1+sp2-nd,'S',0);
  VlozRiadok('Hrub˝ prÌjem',n_brutto,'',0);
  VlozRiadok('Hrub˝ prÌjem - zdanen˝ osob.sadzbou dane',ReportVL3.Q1_n_brutto_dohody.Value,'',0);
  {}
  zsf := ZAOKRUHLI(ReportVL3.Q1_n_mzda.Value,
    DM.TSET_ZAOKRUH7.Value,DM.TSET_ZAOKRUH7SM.Value);
  sf := ZAOKRUHLI(zsf * DM.TINF_F_socfond.Value / 100,
    DM.TSET_ZAOKRUH8.Value,DM.TSET_ZAOKRUH8SM.Value);
  VlozRiadok('Z·klad pre v˝poËet odvodu do soci·lneho fondu',zsf,'',0);
  VlozRiadok('Odvod do soci·lneho fondu',sf,'X',0);
  ReportVL3.Q1_.Close;
  finally
  ReportVL3.Free;
  end;
end;end;

procedure TReportNZOLD.ShowReport;
begin
  QRLabel47.Caption := 'REKAPITUL¡CIA N¡KLADOV ZA ' +
     Mesiac(X.AktObdobie mod 100,true)+' '+IntToStr(X.AktObdobie div 100);
  {--}
  VytvorPomocnuDatabazu(X,True);
  T0_.Open;
  Preview;
  T0_.Close;
end;

procedure TReportNZOLD.VytvorPomocnuDatabazu
(MyReportParam: TMyReportParam; xWriteToDB: boolean);
begin with MesacneNaklady do begin
  SetX(MyReportParam);
  WriteToDB:= xWriteToDB;
  CisloRiadku:=0;
  poi1:=0;
  poi2:=0;
  if WriteToDB then begin
    T0_.Close;
    T0_.Open;
    DMSQL.ExecuteSql('delete from ":pam98_priv:nakl"');
  end;
  try
  Progress(0);
  VlozZP;
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
  if WriteToDB then
  T0_.Close;
  end;
end;end;

procedure TReportNZOLD.T0_CalcFields(DataSet: TDataSet);
begin
  T0_CALC_FIRMA.Value := X.AktFirmaStr;
end;

procedure RunReportNZOLD(const MyReportParam: TMyReportParam);
begin
  Screen.Cursor:=crHourGlass;
  try
  try
    ReportNZOLD:=TReportNZOLD.Create(Application);
    ReportNZOLD.SetX(MyReportParam);
    if ReportNZOLD.X.DisableShape then QRDisableShape(ReportNZOLD);
    if ReportNZOLD.X.DisableLabel then QRDisableLabel(ReportNZOLD);
    Screen.Cursor:=crDefault;
    ReportNZOLD.ShowReport;
  except on E:Exception do
    MyError(SMyAppReportShowFailed+E.Message);
  end;
  finally
    Screen.Cursor:=crDefault;
    ReportNZOLD.Free;
  end;
end;

procedure TReportNZOLD.SetX(const MyReportParam:TMyReportParam);
begin
  X:=MyReportParam;
end;

procedure TReportNZOLD.VlozDDP;
var pom1,pom2:double;
begin with MesacneNaklady,DMV do begin
  try
    QDDP1_.Close;
    QDDP1_.ParamByName('P1').AsInteger := X.AktObdobie;
    QDDP1_.ParamByName('P2').AsInteger := X.AktMinSid;
    QDDP1_.ParamByName('P3').AsInteger := X.AktMaxSid;
    QDDP1_.Open;
    while (not QDDP1_.EOF) do begin
      pom1:=QDDP1_N_DDP.Value;
      pom2:=QDDP1_Nz_DDP.Value;
      VlozRiadok('DDP Ë.'+QDDP1_KDP.AsString+' - zamestnanci',pom1,'',0);
      VlozRiadok('DDP Ë.'+QDDP1_KDP.AsString+' - zamestn·vateæ',pom2,'',0);
      VlozRiadok('DDP Ë.'+QDDP1_KDP.AsString+' - spolu',pom1+pom2,'Y',QDDP1_KDP.Value);
      QDDP1_.Next;
    end;
  finally
    QDDP1_.Close;
  end;
end;end;

end.
