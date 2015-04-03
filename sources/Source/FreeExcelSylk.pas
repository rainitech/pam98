unit FreeExcelSylk;

    { ************************************************************
      FREEEXCEL SYLK 1.10.beta   rann� vyd�n� Talpa


Zm�ny:
  * P�id�na mo�nost form�t bun�k
  (fce cislo byla rozd�lena na Float a Float_Mathematic)
  (nov� fce Date,DateTime),
  fce NumericType, kde je mo�no zadat vlastn� form�t bun�k kter� najdete p�i v exportovan�m souboru,
  po��t� se od 'P;PGeneral'=0 .....  atd.

  * POZOR:fce SetFont odstran�no ohrani�en� sloupc�, a p�esunuto do vlastn� fce
    SetBorder;

  Oprava chyb:
  * O�et�ena "chyba" #13#10 tj. je ji� mo�no vkladat bloby do pole


   ************************************************************

 FREEEXCEL SYLK 1.09.beta   no�n� vyd�n� Talpa


Zm�ny:
  * P�id�na mo�nost volby barvy
  * POZOR:fce SetFont odstran�no ohrani�en� sloupc�, a p�esunuto do vlastn� fce
    SetBorder;

  Oprava chyb:
  * O�et�ena chyba MS Excel ve fcich v pozn�mce ";"

   ************************************************************
 FREEEXCEL SYLK 1.08.beta   rann� vyd�n� Davida Lebedy


Zm�ny (op�t pod taktovkou Davida Lebedy, d�kujeme za �pravy):
  * Zrychlen export vytvo�en�m TEMP souboru p�i vytv��en� exportovan�ho souboru
  * ���ka sloupce koncep�n� �prava dle chodu unity

  Oprava chyb:
  * O�et�ena chyba MS Excel ve funkci �et�zec,objevuj�c� se p�i zad�n� hodnoty ";"


   **************************************************************

   FREEEXCEL SYLK 1.07.beta   vecerni vydani -
   Form�tovan� export do excelu

   Zm�na:
   * Nov� fce sirkasloupce  vytvoril ji David Lebeda jemu� budi� vzd�na chv�la - podruh�:-))
   * Nov� hodnota POZN�MKA Modifikace vkl�dan�ch pol� a funkc� je ji� mo�no p�id�vat i pozn�mky - to jsem kupodivu d�lal s�m (Talpa)
   **************************************************************


   FREEEXCEL SYLK 1.06.beta   rann� vyd�n�
   Form�tovan� export do excelu
   (Opraveny a zjednodu�eny n�kter� kontrukce  a jedna f�n� chyba Davidem Lebedou jemu� budi� vzd�na chv�la)
   Zm�na
   * Zjednodu�en destruktor,kostruktor
   * Odstran�no zbyte�n� uvol�ov�n�

   Oprava chyb:
   * Opravena chyba nevracej�c�ho se p�vodn�ho decimalsepar�toru:-((

   **************************************************************


   FREEEXCEL SYLK 1.05.beta  no�n� vyd�n�
   Form�tovan� export do excelu

   Zm�na
   * upravena chybn� strukturovan� podm�nka
   * Opravena drobn� pravopisn� chyba v typu - BoBotton/BoBottom
   * Vylep�eno hl�en� chyby tj. p�id�n E.Message (na n�vrh internetov�ho kolegy:-)

   **************************************************************

   FREEEXCEL SYLK 1.04.beta  ranni vyd�n�
   Form�tovan� export do excelu

   Zm�na
   * P�id�n Ohrani�en�(Border) bu�ky do SetFont
   * Zaru�ena blbovzdornost,tj. z�kaz hodnot 0 a m�n� u X,Y

   **************************************************************


   FREEEXCEL SYLK 1.03.beta  ve�ern� vyd�n�
    Form�tovan� export do excelu
   Zm�na
   * P�id�n SUM polo�ek
   * Za�i�t�n� drobn�ch chyb ve sloupc�ch a ��dc�ch


 **************************************************************  }

interface


uses
 Windows, SysUtils, Classes;


type
 TFormatFont =(B,I,U,S);
 TColumnsBorder =(BoLeft,BoRight,BoTop,BoBottom);
 TFormatFonts = set of TFormatFont;
 TColumnsBorders =set of TColumnsBorder;
 TFonts=
        (Courier,CourierNewCE,CourierNewBaltic,CourierNewCYR,CourierNewGreek,CourierNewTUR,
        TimesNewRomanCE,
        Arial,ArialNewCE,ArialBaltic,ArialBlack,ArialCYR,ArialGreek,ArialNarrow,ArialTUR,
        AvantGardeBkBT,AvantGardeMdBT,
        BookAntiqua,BookmanOldStyle,
        CenturyGothic,
        ComicSansMS,
        CommonBullets,
        EstrangeloEdessa,
        Fixedsys,
        FranklinGothicMedium,
        Garamond,
        Gautami,
        Georgia,
        Haettenschweiler,
        Impact,
        Latha,
        LucidaBlackletter,
        LucidaBright,
        LucidaCalligraphy
         );

 TFontColor=(FcRed,FcGreen,FcYellow,FcBlue,FcBlack);
 TFontSize = ShortInt;
 TTextPosition = (TP_Center,TP_Left,TP_Right);

const
 StartSYLK ='ID;PWXL;N;E'+#13#10;
 FormatFields ='P;PGeneral'+#13#10+
 'P;P0'+#13#10+
 'P;P0.00'+#13#10+
 'P;P#,##0'+#13#10+
 'P;P#,##0.00'+#13#10+
 'P;P#,##0\ _K_NAe;;\-#,##0\ _K_NAe'+#13#10+
 'P;P#,##0\ _K_NAe;;[Red]\-#,##0\ _K_NAe'+#13#10+
 'P;P#,##0.00\ _K_NAe;;\-#,##0.00\ _K_NAe'+#13#10+
 'P;P#,##0.00\ _K_NAe;;[Red]\-#,##0.00\ _K_NAe'+#13#10+
'P;P#,##0\ "$";;\-#,##0\ "$"'+#13#10+
'P;P#,##0\ "$";;[Red]\-#,##0\ "$"'+#13#10+
'P;P#,##0.00\ "$";;\-#,##0.00\ "$"'+#13#10+
'P;P#,##0.00\ "$";;[Red]\-#,##0.00\ "$"'+#13#10+
'P;P0%'+#13#10+
'P;P0.00%'+#13#10+
'P;P0.00E+00'+#13#10+
'P;P##0.0E+0'+#13#10+
'P;P#" "?/?'+#13#10+
'P;P#" "??/??'+#13#10+
'P;Pd/m/yyyy'+#13#10+
'P;Pd/mmm/yy'+#13#10+
'P;Pd/mmm'+#13#10+
'P;Pmmm/yy'+#13#10+
'P;Ph:mm\ dop./odp.'+#13#10+
'P;Ph:mm:ss\ dop./odp.'+#13#10+
'P;Ph:mm'+#13#10+
'P;Ph:mm:ss'+#13#10+
'P;Pd/m/yyyy\ h:mm'+#13#10+
'P;Pmm:ss'+#13#10+
'P;Pmm:ss.0'+#13#10+
'P;P@'+#13#10+
'P;P[h]:mm:ss'+#13#10+
'P;P_-* #,##0\ "$"_-;;\-* #,##0\ "$"_-;;_-* "-"\ "$"_-;;_-@_-'+#13#10+
'P;P_-* #,##0\ _K_NAe_-;;\-* #,##0\ _K_NAe_-;;_-* "-"\ _K_NAe_-;;_-@_-'+#13#10+
'P;P_-* #,##0.00\ "$"_-;;\-* #,##0.00\ "$"_-;;_-* "-"??\ "$"_-;;_-@_-'+#13#10+
'P;P_-* #,##0.00\ _K_NAe_-;;\-* #,##0.00\ _K_NAe_-;;_-* "-"??\ _K_NAe_-;;_-@_-'+#13#10+
'P;FArial CE;M200'+#13#10+
'P;FArial CE;M200'+#13#10+
'P;FArial CE;M200'+#13#10+
'P;FArial CE;M200'+#13#10;

FormatMiddle ='F;P0;DG0G8;M255'+#13#10+
'B;Y1;X1;D0 0 0 0'+#13#10+
'O;D;V0;K47;G100 0.001'+#13#10;



C_CourierNewCE              = 'P;ECourier New CE;M%d%s';
C_ArialNewCE            = 'P;EArial CE;M%d%s';
C_TimesNewRomanCE       = 'P;ETimes New Roman CE;M%d%s';
C_Arial                 = 'P;EArial;M%d%s';
C_ArialBaltic           = 'P;EArial Baltic;M%d%s';
C_ArialBlack            = 'P;EArial Black;M%d%s';
C_ArialCYR              = 'P;EArial CYR;M%d%s';
C_ArialGreek            = 'P;EArial Greek;M%d%s';
C_ArialNarrow           = 'P;EArial Narrow;M%d%s';
C_ArialTUR              = 'P;EArial TUR;M%d%s';
C_AvantGardeBkBT        = 'P;EAvantGarde Bk BT;M%d%s';
C_AvantGardeMdBT        = 'P;EAvantGarde Md BT;M%d%s';
C_BookAntiqua           = 'P;EBook Antiqua;M%d%s';
C_BookmanOldStyle       = 'P;EBookman Old Style;M%d%s';
C_CenturyGothic         = 'P;ECentury Gothic;M%d%s';
C_ComicSansMS           = 'P;EComic Sans MS;M%d%s';
C_CommonBullets         = 'P;ECommonBullets;M%d%s';
C_Courier               = 'P;ECourier;M%d%s';
C_CourierNewBaltic      = 'P;ECourier New Baltic;M%d%s';
C_CourierNewCYR         = 'P;ECourier New CYR;M%d%s';
C_CourierNewGreek       = 'P;ECourier New Greek;M%d%s';
C_CourierNewTUR         = 'P;ECourier New TUR;M%d%s';
C_EstrangeloEdessa      = 'P;EEstrangelo Edessa;M%d%s';
C_Fixedsys              = 'P;EFixedsys;M%d%s';
C_FranklinGothicMedium  = 'P;EFranklin Gothic Medium;M%d%s';
C_Garamond              = 'P;EGaramond;M%d%s';
C_Gautami               = 'P;EGautami;M%d%s';
C_Georgia               = 'P;EGeorgia;M%d%s';
C_Haettenschweiler      = 'P;EHaettenschweiler;M%d%s';
C_Impact                = 'P;EImpact;M%d%s';
C_Latha                 = 'P;ELatha;M%d%s';
C_LucidaBlackletter     = 'P;ELucida Blackletter;M%d%s';
C_LucidaBright          = 'P;ELucida Bright;M%d%s';
C_LucidaCalligraphy     = 'P;ELucida Calligraphy;M%d%s';




C_ColorFormat      = ';L%d';
C_RowFormat        = 'F;P%d;%sS%sM%d;Y%d;X%d ';
C_ColWidth         = 'F;W%d %d %d';
C_ColPosition      = 'FG0%s;';

C_Position         = 'C;Y%d;X%d;';
C_ColFormatStr     = 'K"%s"';
C_ColFormatNumber  = 'K%e';
C_Poznamka_Pole    = ';A%s  :'+#13#10;

F_SOUCET    = 'ESUM(%s)';
F_SOUCIN    = 'EPRODUCT(%s)';
F_PRUMER    = 'EAVERAGE(%s)';
F_ODMOCNINA = 'ESQRT(%s)';


C_NewLine = #13#10;
C_ColFormatSum_Values ='(Rs% Cs%)';
C_ColFormatSum_ValuePlus ='[+%d]';
C_ColFormatSum_ValueMinus ='[%d]';



EndSYLK          = 'E'+#13#10;

resourcestring
    CantCreate       = 'Soubor "%s" nelze vytvo�it - chyba:'+#13#10+'%s';
    CantClose        = 'Soubor "%s" nelze uzav��t - chyba:'+#13#10+'%s';
    CantWriteBegin   = 'Nelze zapsat po��te�n� hodnoty do souboru "%s" - chyba:'+#13#10+'%s';
    CantWriteEnd   =   'Nelze zapsat kone�n� hodnoty do souboru "%s" a ulo�it - chyba:'+#13#10+'%s';

    CantWriteInteger = 'Chyba z�pisu hodnoty decimal do souboru na ��dku %d a sloupci %d - chyba:'+#13#10+'%s';
    CantWriteDecimal = 'Chyba z�pisu ��seln� hodnoty do souboru %s na ��dku %d a sloupci %d - chyba:'+#13#10+'%s';
    CantWriteString  = 'Chyba z�pisu  textov� hodnoty do souboru %s na ��dku %d a sloupci %d - chyba:'+#13#10+'%s';
    LowNumberValues  = 'Mal� po�et hodnot X,Y %d';
    NoDualValues  = 'Hodnoty (X,Y) se nep�ruj�, ��slo %d je lich�';
    NoNullValues = 'Hodnoty (X,Y) nesm�j� dos�hnout hodnotu 0';
    WrongIndex = 'Index sloupce mus� b�t mezi 1 a 256';

type

 TFreeExcelS = class
  private
    { Private declarations }
    FFileName           : String;
    FFileStream         : TFileStream;
    FFontList           : TStringList;
    FColWidths          : TStringList;
    FSirky              : array [1..256] of integer;
    FTempFile           : string;
    FAlign              :TTextPosition;
    FSAlign             :String;
    FBackground         :Boolean;

    FFontIndex          : Integer;
    FFont               : TFonts;
    FSize               : Integer;
    FFontTypes          : TFormatFonts;
    FFontColor          : TFontColor;
    FColumnsBorders     : TColumnsBorders;
    FSColumnsBorders    : String;
    procedure           GetFont;
    procedure           XlsBeginStream;
    procedure           XlsEndStream;
    function            FindFont(FontValue:String):Integer;
    procedure           FreeComp;

  public
    { Public declarations }
    constructor         Create(FileName:String); reintroduce;
    Destructor          Destroy                                  ;override;
    procedure           NumericType     ( const ARow,ACol: Integer;const AValue: Double;const Type_Number:ShortInt;Poznamka:String='');
    procedure           Float           ( const ARow,ACol: Integer;const AValue: Double;Poznamka:String = '');
    procedure           Float_Mathematic( const ARow,ACol: Integer;const AValue: Double;Poznamka:String = '');
    procedure           DateTime        ( const ARow,ACol: Integer;const AValue: TDateTime;Poznamka:String='');
    procedure           Date            ( const ARow,ACol: Integer;const AValue: TDateTime;Poznamka:String='');
    procedure           Retezec         ( const ARow,ACol: Integer;const AValue: string;Poznamka:String = '');
    procedure           SetFont         ( const Font:TFonts;Size: TFontSize;FontTypes:TFormatFonts);
    procedure           SetBorder       ( const ColBorders:TColumnsBorders);
    procedure           SetFontColor    ( const FontColor:TFontColor);
    procedure           SetBackground(const Background:Boolean);

    procedure           Soucet          ( const ARow,ACol : Integer;Fields:Array of Integer;Poznamka:String = '');
    procedure           Soucin          ( const ARow,ACol: Integer;Fields:Array of Integer;Poznamka:String = '');
    procedure           Prumer          ( const ARow,ACol: Integer;Fields:Array of Integer;Poznamka:String = '');
    procedure           SirkaSloupce    ( const Index, Sirka: integer);
    procedure           Funkce          ( const ARow,ACol: Integer;Fields:Array of Integer;Const Funkce:String;Poznamka:String = '');
    procedure           TextPosition    ( const Align:TTextPosition);
  end;

implementation


Constructor TFreeExcelS.Create(FileName:String);
begin
 FFileName := FileName;
 try
  FTempFile := ChangeFileExt(FileName, '.$$$');
  FFileStream     := TFileStream.Create(FTempFile,fmCreate);
  FFontList       := TStringList.Create;
  FColWidths      := TStringList.Create;
 ZeroMemory(@(FSirky[1]), sizeof(FSirky));
 except
  on E: Exception do
  begin
   FreeComp;
   raise Exception.CreateFmt( CantCreate,[FTempFile,E.Message]);
  end;
 end;
 FFontColor:=FcBlack;
 FAlign:=TP_Right;
 FColumnsBorders:=[];
 FBackground:=false;
 SetFont(CourierNewCE, 10, []);
 XlsBeginStream;
end;

Destructor TFreeExcelS.Destroy;
begin
 try
  try
   XlsEndStream;
  except
   on E: Exception do
    raise Exception.CreateFmt(CantClose,[FFileName, E.Message]);
  end;
 finally
  FreeComp;
  DeleteFile(FTempFile);
 end;
end;

procedure TFreeExcelS.XlsBeginStream;
var
 Value:String;
begin
 value:=StartSYLK+FormatFields;
 try
  FFileStream.WriteBuffer(Pointer(Value)^,Length(Value));
 except
  on E: Exception do
   Raise Exception.CreateFmt(CantWriteBegin,[FTempFile,E.Message]);
 end;
end;

procedure TFreeExcelS.XlsEndStream;
var
 i: integer;
 FS: TFileStream;
begin
 FS := TFileStream.Create(FFileName, fmCreate);
 try
  FFileStream.Seek(0, soFromBeginning);
  FS.CopyFrom(FFileStream, length(STARTSYLK + FormatFields));
  FFontList.SaveToStream(FS);
  FS.Write(FormatMiddle,Length(FormatMiddle));
  FColWidths.Clear;
  for i := 1 to 256 do
   if FSirky[i] <> 0 then
    FColWidths.Add(Format(C_ColWidth,[i, i, FSirky[i]]));
  FColWidths.SaveToStream(FS);
  FFileStream.Seek(length(StartSYLK + FormatFields), soFromBeginning);
  FS.CopyFrom(FFileStream, FFileStream.Size - FFileStream.Position);
  FS.Write(EndSYLK,Length(EndSYLK));
 finally
  FS.Free;
 end;
end;

procedure TFreeExcelS.SirkaSloupce(const Index, Sirka: integer);
begin
 if (Index<1) or (Index > 256) then
  raise Exception.Create(WrongIndex);
 FSirky[Index] := Sirka;
end;
procedure TFreeExcelS.Float( const  ARow,ACol: Integer;const AValue: Double;Poznamka:String);
begin
NumericType( ARow,ACol,AValue,0,Poznamka);
end;

procedure TFreeExcelS.Float_Mathematic( const  ARow,ACol: Integer;const AValue: Double;Poznamka:String);
begin
NumericType( ARow,ACol,AValue,15,Poznamka);
end;

procedure TFreeExcelS.NumericType( const  ARow,ACol: Integer;const AValue: Double;const Type_Number:ShortInt;Poznamka:String);
var
 Value,pom,FSColumnsBorders:String;
 OldDecSep: char;
begin
 if (ARow<1) or (ACol<1) then
  raise Exception.Create(NoNullValues)
 else
 begin
  OldDecSep := DecimalSeparator;
  DecimalSeparator:='.';
  try

   Value:=Format(C_RowFormat,[Type_Number,FSAlign,FSColumnsBorders,FFontIndex,ARow,ACol])+#13#10;
   Value := Value + Format(C_Position,[ARow,ACol]);
   Value := Value + Format(C_ColFormatNumber,[AValue]);
     If Poznamka<>'' then
     begin
     pom := StringReplace(Poznamka, ';', ';;', [rfReplaceAll]);
     pom := StringReplace(pom, #13#10, ' :', [rfReplaceAll]);
     pom:=TrimRight(pom);
     while copy(pom,0,Length(pom)-3)=' :' do
     begin
     pom:=copy(pom,0,Length(pom)-3);
     pom:=TrimRight(pom);
     end;

     Value:=Value+Format(C_Poznamka_Pole,[Pom])
     end
     else
     Value:=Value+#13#10;

   try
    FFileStream.Write(PChar(Value)^, length(Value));
   except
    on E: Exception do
     Raise Exception.CreateFmt(CantWriteDecimal,[FTempFile,ARow,ACol,E.Message]);
   end;
  finally
   DecimalSeparator := OldDecSep;
  end;
 end;
end;

procedure TFreeExcelS.DateTime( const  ARow,ACol: Integer;const AValue: TDateTime;Poznamka:String);
begin
NumericType( ARow,ACol,AValue,27,Poznamka);
end;

procedure TFreeExcelS.Date( const  ARow,ACol: Integer;const AValue: TDateTime;Poznamka:String);
begin
NumericType( ARow,ACol,AValue,19,Poznamka);
end;


procedure TFreeExcelS.Retezec( const  ARow,ACol: Integer;const AValue: string;Poznamka:String);
var
 Value, pom:String;
begin
 If  (ARow<1) or (ACol<1) then
  Raise Exception.Create(NoNullValues)
 else
 begin

  Value:=Format(C_RowFormat,[0,FSAlign,FSColumnsBorders,FFontIndex,ARow,ACol])+#13#10;
  Value:=Value+Format(C_Position,[ARow,ACol]);

  pom := StringReplace(AValue, ';', ';;', [rfReplaceAll]);
  pom := StringReplace(pom, #13#10, ' :', [rfReplaceAll]);
  pom:=TrimRight(pom);
     while copy(pom,Length(pom)-2,Length(pom))=' :' do
     begin
     pom:=copy(pom,0,Length(pom)-2);
     pom:=TrimRight(pom);
     end;

  Value:=Value+Format(C_ColFormatStr,[pom]);
  If Poznamka<>'' then
     begin
     pom := StringReplace(Poznamka, ';', ';;', [rfReplaceAll]);
     pom := StringReplace(pom, #13#10, ' :', [rfReplaceAll]);
     pom:=TrimRight(pom);
     while copy(pom,Length(pom)-2,Length(pom))=' :' do
     begin
     pom:=copy(pom,0,Length(pom)-2);
     pom:=TrimRight(pom);
     end;

     Value:=Value+Format(C_Poznamka_Pole,[Pom])
     end
     else
     Value:=Value+#13#10;

  try
    FFileStream.Write(PChar(Value)^, length(Value));
  except
   on E: Exception do
    Raise Exception.CreateFmt(CantWriteString,[FTempFile,ARow,ACol,E.Message]);
  end;
 end;
end;

procedure TFreeExcelS.SetFont(Const Font:TFonts;Size:TFontSize;FontTypes:TFormatFonts);
begin
 FFont:=Font;
 FSize:=Size;
 FFontTypes:=FontTypes;
 GetFont;
end;

procedure TFreeExcelS.SetFontColor(const FontColor:TFontColor);
begin
  FFontColor:=FontColor;
  GetFont;
end;
procedure TFreeExcelS.SetBackground(const Background:Boolean);
begin
  FBackground:=Background;
  GetFont;
end;

procedure TFreeExcelS.SetBorder   ( const ColBorders:TColumnsBorders);
begin
  FColumnsBorders:=ColBorders;
  GetFont;
end;
procedure  TFreeExcelS.TextPosition    ( const Align:TTextPosition);
begin
  FAlign:=Align;
  GetFont;
end;

function TFreeExcelS.FindFont(FontValue:String):Integer;
begin
 Result:=FFontList.IndexOf(FontValue)+5;
end;

procedure TFreeExcelS.GetFont;

var
 LI_FontNumber  :Integer;
 LS_FontLabel   :String;
 LI_FontSize    :Integer;
 LS_FontType    :String;
 LS_ColumnBorder:String;
 LI_FontColor   :ShortInt;
 LS_Align       :String;
begin
 LI_FontSize:=FSize*20;

Case FAlign of
        TP_Center:LS_Align:=Format(C_ColPosition,['C']);
        TP_Right:LS_Align:=Format(C_ColPosition,['R']);
        TP_Left:LS_Align:='';

end;

If (FFontTypes<>[]) OR (FColumnsBorders<>[]) OR (FBackground) then
    LS_FontType:=';S';

If S in FFontTypes then
        LS_FontType:=LS_FontType+'S';

If B in FFontTypes then
        LS_FontType:=LS_FontType+'B';

If I in FFontTypes then
        LS_FontType:=LS_FontType+'I';

If U in FFontTypes then
        LS_FontType:=LS_FontType+'U';


If FBackground then
         LS_ColumnBorder:= 'S';
If BoLeft in FColumnsBorders then
         LS_ColumnBorder:= LS_ColumnBorder+'L';

If BoRight in FColumnsBorders then
         LS_ColumnBorder:= LS_ColumnBorder+'R';

If BoTop in FColumnsBorders then
         LS_ColumnBorder:= LS_ColumnBorder+'T';

If BoBottom in FColumnsBorders then
         LS_ColumnBorder:= LS_ColumnBorder+'B';

Case FFont of
        CourierNewCE            :        LS_FontLabel:=Format(C_CourierNewCE,[LI_FontSize,LS_FontType]);
        ArialNewCE              :        LS_FontLabel:=Format(C_ArialNewCE,[LI_FontSize,LS_FontType]);
        TimesNewRomanCE         :        LS_FontLabel:=Format(C_TimesNewRomanCE,[LI_FontSize,LS_FontType]);
        Arial                   :        LS_FontLabel:=Format(C_Arial,[LI_FontSize,LS_FontType]);
        ArialBaltic             :        LS_FontLabel:=Format(C_ArialBaltic,[LI_FontSize,LS_FontType]);
        ArialBlack              :        LS_FontLabel:=Format(C_ArialBlack,[LI_FontSize,LS_FontType]);
        ArialCYR                :        LS_FontLabel:=Format(C_ArialCYR,[LI_FontSize,LS_FontType]);
        ArialGreek              :        LS_FontLabel:=Format(C_ArialGreek,[LI_FontSize,LS_FontType]);
        ArialNarrow             :        LS_FontLabel:=Format(C_ArialNarrow,[LI_FontSize,LS_FontType]);
        ArialTUR                :        LS_FontLabel:=Format(C_ArialTUR,[LI_FontSize,LS_FontType]);
        AvantGardeBkBT          :        LS_FontLabel:=Format(C_AvantGardeBkBT,[LI_FontSize,LS_FontType]);
        AvantGardeMdBT          :        LS_FontLabel:=Format(C_AvantGardeMdBT,[LI_FontSize,LS_FontType]);
        BookAntiqua             :        LS_FontLabel:=Format(C_BookAntiqua,[LI_FontSize,LS_FontType]);
        BookmanOldStyle         :        LS_FontLabel:=Format(C_BookmanOldStyle,[LI_FontSize,LS_FontType]);
        CenturyGothic           :        LS_FontLabel:=Format(C_CenturyGothic,[LI_FontSize,LS_FontType]);
        ComicSansMS             :        LS_FontLabel:=Format(C_ComicSansMS,[LI_FontSize,LS_FontType]);
        CommonBullets           :        LS_FontLabel:=Format(C_CommonBullets,[LI_FontSize,LS_FontType]);
        Courier                 :        LS_FontLabel:=Format(C_Courier,[LI_FontSize,LS_FontType]);
        CourierNewBaltic        :        LS_FontLabel:=Format(C_CourierNewBaltic,[LI_FontSize,LS_FontType]);
        CourierNewCYR           :        LS_FontLabel:=Format(C_CourierNewCYR ,[LI_FontSize,LS_FontType]);
        CourierNewGreek         :        LS_FontLabel:=Format(C_CourierNewGreek,[LI_FontSize,LS_FontType]);
        CourierNewTUR           :        LS_FontLabel:=Format(C_CourierNewTUR,[LI_FontSize,LS_FontType]);
        EstrangeloEdessa        :        LS_FontLabel:=Format(C_EstrangeloEdessa,[LI_FontSize,LS_FontType]);
        Fixedsys                :        LS_FontLabel:=Format(C_Fixedsys,[LI_FontSize,LS_FontType]);
        FranklinGothicMedium    :        LS_FontLabel:=Format(C_FranklinGothicMedium,[LI_FontSize,LS_FontType]);
        Garamond                :        LS_FontLabel:=Format(C_Garamond,[LI_FontSize,LS_FontType]);
        Gautami                 :        LS_FontLabel:=Format(C_Gautami,[LI_FontSize,LS_FontType]);
        Georgia                 :        LS_FontLabel:=Format(C_Georgia,[LI_FontSize,LS_FontType]);
        Haettenschweiler        :        LS_FontLabel:=Format(C_Haettenschweiler,[LI_FontSize,LS_FontType]);
        Impact                  :        LS_FontLabel:=Format(C_Impact,[LI_FontSize,LS_FontType]);
        Latha                   :        LS_FontLabel:=Format(C_Latha,[LI_FontSize,LS_FontType]);
        LucidaBlackletter       :        LS_FontLabel:=Format(C_LucidaBlackletter,[LI_FontSize,LS_FontType]);
        LucidaBright            :        LS_FontLabel:=Format(C_LucidaBright,[LI_FontSize,LS_FontType]);
        LucidaCalligraphy       :        LS_FontLabel:=Format(C_LucidaCalligraphy,[LI_FontSize,LS_FontType]);


end;

Case FFontColor of
FcRed   :       LI_FontColor:=11;
FcGreen :       LI_FontColor:=12;
FcYellow:       LI_FontColor:=14;
FcBlue  :       LI_FontColor:=13;
FcBlack :       LI_FontColor:=9;
end;
LS_FontLabel:=LS_FontLabel+Format(C_ColorFormat,[LI_FontColor]);

LI_FontNumber:=FindFont(LS_FontLabel);

If LI_FontNumber = 4 then
   LI_FontNumber:=FFontList.Add(LS_FontLabel)+5;

FFontIndex:=LI_FontNumber;
FSColumnsBorders:=LS_ColumnBorder;
FSAlign:=LS_Align;
end;

procedure TFreeExcelS.Soucet( Const ARow,ACol: Integer;Fields:Array of Integer;Poznamka:String);
begin
 Funkce(ARow,ACol,Fields,F_SOUCET,Poznamka);
end;

procedure TFreeExcelS.Soucin( Const ARow,ACol: Integer;Fields:Array of Integer;Poznamka:String);
begin
 Funkce(ARow,ACol,Fields,F_SOUCIN,Poznamka);
end;

procedure TFreeExcelS.Prumer( Const ARow,ACol: Integer;Fields:Array of Integer;Poznamka:String);
begin
 Funkce(ARow,ACol,Fields,F_PRUMER,Poznamka);
end;

procedure TFreeExcelS.Funkce( Const ARow,ACol: Integer;Fields:Array of Integer;Const Funkce:String;Poznamka:String);
var i:Integer;
   Length_Fields,X,Y,Pecko:Integer;
   WriteLabel,pom:String;
   Separator:Char;
begin
Length_Fields:=length(Fields);
If  (ARow<1) or (ACol<1) then Raise Exception.Create(NoNullValues) else

If  Length_Fields mod 2<>0 then   Raise Exception.CreateFmt(NoDualValues,[Length(Fields)-1]) else


Case Length_Fields of
4:   Separator:=':';
2:   Separator:=#0 ;
else
Separator:=',';
end;


          begin
                For i:=0 to Length(Fields)-1 do
                        begin

                       If (i mod 2)=0 then
                         begin
                                X:=Fields[i]-ARow;
                                WriteLabel:=WriteLabel+Format('R[%d]',[X])
                         end
                         else
                         begin
                                Y:=Fields[i]-ACol;
                                WriteLabel:=WriteLabel+Format('C[%d]%s',[Y,Separator]);
                         end;

                        end;
                          WriteLabel:=Copy(WriteLabel,0,Length(WriteLabel)-1);
          end;





WriteLabel:=Format(C_RowFormat,[0,FSAlign,FSColumnsBorders,FFontIndex,ARow,ACol])+#13#10+
           Format(C_Position,[ARow,ACol])
           +Format(Funkce,[WriteLabel]);

If Poznamka<>'' then
     begin
     pom := StringReplace(Poznamka, ';', ';;', [rfReplaceAll]);
     pom := StringReplace(pom, #13#10, ' :', [rfReplaceAll]);
     pom:=TrimRight(pom);
     while copy(pom,0,Length(pom)-3)=' :' do
     begin
     pom:=copy(pom,0,Length(pom)-3);
     pom:=TrimRight(pom);
     end;
     WriteLabel:=WriteLabel+Format(C_Poznamka_Pole,[Pom])
     end
     else
     WriteLabel:=WriteLabel+#13#10;

 try
                FFileStream.Write(PChar(WriteLabel)^, length(WriteLabel));
        except


                on E: Exception do
                 Raise Exception.CreateFmt(CantWriteString,[FTempFile,ACol,ARow,E.Message]);

        end;
end;


procedure         TFreeExcelS.FreeComp;
begin
 FreeAndNil(FFileStream);
 FreeAndNil(FFontList);
 FreeAndNil(FColWidths);
end;

end.


