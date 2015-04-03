UNIT Main;

{http://support.smartbear.com/articles/aqtime/leaks/leaksd3/}

interface

{$INCLUDE DEFINE.INC}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, Tabs,
  ComCtrls, Menus, DBConsts, DB, Spin, Tabnotbk, DBCGrids, DBTables,
  MyConsts,MainVzor, isp3, OleCtrls, SMDBGrid, OleCtnrs, checklst;

type
  TFormMain = class(TForm)
    N: TNotebook;
    MainMenu1: TMainMenu;
    Zamestnanci: TMenuItem;
    Prehlady: TMenuItem;
    DBGrid6: TDBGrid;
    Nastavenia_program: TMenuItem;
    Label94: TLabel;
    Panel_zamf: TPanel;
    Panel21: TPanel;
    Panel2: TPanel;
    Panel12: TPanel;
    Panel27: TPanel;
    DBN_dzp: TDBNavigator;
    Nastavenia_dzp: TMenuItem;
    Butt_dzp_navrat1: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn8: TBitBtn;
    Operacie_zam1: TMenuItem;
    Zam_insert1: TMenuItem;
    Zam_edit1: TMenuItem;
    Zam_post1: TMenuItem;
    Zam_cancel1: TMenuItem;
    N1: TMenuItem;
    Zam_navrat1: TMenuItem;
    Operacie_dzp1: TMenuItem;
    dzp_navrat1: TMenuItem;
    N6: TMenuItem;
    dzp_cancel1: TMenuItem;
    dzp_post1: TMenuItem;
    dzp_delete1: TMenuItem;
    dzp_edit1: TMenuItem;
    dzp_insert1: TMenuItem;
    tlac_vp1: TMenuItem;
    tlac_obdobie1: TMenuItem;
    tlac_pp1: TMenuItem;
    tlac_pd1: TMenuItem;
    Zam_delete1: TMenuItem;
    Nastavenia_firma: TMenuItem;
    System: TMenuItem;
    system_koniec: TMenuItem;
    Operacie_ppv1: TMenuItem;
    ppv_navrat1: TMenuItem;
    N9: TMenuItem;
    ppv_cancel1: TMenuItem;
    ppv_post1: TMenuItem;
    ppv_delete1: TMenuItem;
    ppv_edit1: TMenuItem;
    ppv_insert1: TMenuItem;
    Label37: TLabel;
    tlac_ml1: TMenuItem;
    tlac_fz1: TMenuItem;
    tlac_fz2: TMenuItem;
    Panel5: TPanel;
    DBText23: TDBText;
    Panel11: TPanel;
    Panel22: TPanel;
    DBN_RZP2: TDBNavigator;
    DBN_RZP1: TDBNavigator;
    Zuctovanie: TMenuItem;
    tlac_rz1: TMenuItem;
    Operacie_rzp1: TMenuItem;
    rzp_navrat1: TMenuItem;
    rzp_cancel1: TMenuItem;
    rzp_post1: TMenuItem;
    rzp_delete1: TMenuItem;
    rzp_edit1: TMenuItem;
    rzp_insert1: TMenuItem;
    N12: TMenuItem;
    rzp_tlac1: TMenuItem;
    N13: TMenuItem;
    Zam_tlac_ml: TMenuItem;
    Zam_tlac_pp: TMenuItem;
    Zam_tlac_pz: TMenuItem;
    Zam_tlac_rzp: TMenuItem;
    Hlavne: TMenuItem;
    Otvorenie_firmy: TMenuItem;
    N15: TMenuItem;
    mnu_ppv_dvp: TMenuItem;
    mnu_ppv_dpc: TMenuItem;
    mnu_ppv_pz: TMenuItem;
    N7: TMenuItem;
    Tla1: TMenuItem;
    tlac_vl1: TMenuItem;
    tlac_hp: TMenuItem;
    N18: TMenuItem;
    N14: TMenuItem;
    Zam_deti: TMenuItem;
    tvrronvkazzkpoisteniazodpovednostizakodu1: TMenuItem;
    mnu_cis_zp1: TMenuItem;
    Nastavenia: TMenuItem;
    N23: TMenuItem;
    Zam_osobne: TMenuItem;
    Zam_pracovne: TMenuItem;
    HSV: TMenuItem;
    DBGrid_HSV: TDBGrid;
    Panel17: TPanel;
    Panel24: TPanel;
    BitBtn1: TBitBtn;
    DBText10: TDBText;
    Panel31: TPanel;
    Vplatnlistinazoznamkvplatevhotovosti1: TMenuItem;
    Mesanrekapitulcia1: TMenuItem;
    Tlaovzostavy1: TMenuItem;
    N24: TMenuItem;
    zam_zoradit1: TMenuItem;
    zam_zoradit2: TMenuItem;
    N25: TMenuItem;
    zam_sucasny: TMenuItem;
    zam_vyradeny: TMenuItem;
    Btn_uctuj_hsv: TButton;
    N26: TMenuItem;
    tlac_dov: TMenuItem;
    DBGrid7: TDBGrid;
    mnu_cis_vm1: TMenuItem;
    mnu_zmena_strediska: TMenuItem;
    mnu_cis_pd1: TMenuItem;
    mnu_cis_par1: TMenuItem;
    Zobrazivyradenchzamestnancov1: TMenuItem;
    mnu_xenon1: TMenuItem;
    mnu_zaloha1: TMenuItem;
    zam_zrazky: TMenuItem;
    Label336: TLabel;
    Mesannkladyzamestnvatea1: TMenuItem;
    Ronrekapitulcia1: TMenuItem;
    Zlohovlistina1: TMenuItem;
    mnu_cis_bu1: TMenuItem;
    Evidencianeprtomnosti1: TMenuItem;
    Mzdovlistyevidencianeprtomnosti1: TMenuItem;
    zam_tlac_ml2: TMenuItem;
    N32: TMenuItem;
    system_pomocne: TMenuItem;
    system_zrus_reg: TMenuItem;
    pridanie_firmy: TMenuItem;
    Zrusenie_firmy: TMenuItem;
    Ronztovaniepreddavkovnadavkazy1: TMenuItem;
    Splitter_dzp: TSplitter;
    Panel_dzp: TPanel;
    SB_DZP: TScrollBox;
    Label124: TLabel;
    Label143: TLabel;
    Label145: TLabel;
    DZP_zaklad_od: TDBEdit;
    DZP_sadzba: TDBEdit;
    DZP_aditivna_suma: TDBEdit;
    Splitter_RZP: TSplitter;
    SB_RZP: TScrollBox;
    Label157: TLabel;
    Label163: TLabel;
    Label165: TLabel;
    Label167: TLabel;
    Label184: TLabel;
    Label187: TLabel;
    Label188: TLabel;
    Label202: TLabel;
    Label203: TLabel;
    Label204: TLabel;
    Label209: TLabel;
    Label210: TLabel;
    Label237: TLabel;
    Label239: TLabel;
    Label241: TLabel;
    Label242: TLabel;
    Label243: TLabel;
    Label244: TLabel;
    Label245: TLabel;
    DBText24: TDBText;
    Label246: TLabel;
    Label247: TLabel;
    DBText25: TDBText;
    DBEdit140: TDBEdit;
    DBEdit141: TDBEdit;
    DBEdit142: TDBEdit;
    DBEdit143: TDBEdit;
    DBEdit144: TDBEdit;
    DBEdit145: TDBEdit;
    DBEdit146: TDBEdit;
    DBEdit147: TDBEdit;
    DBEdit148: TDBEdit;
    DBEdit149: TDBEdit;
    DBEdit150: TDBEdit;
    DBEdit151: TDBEdit;
    DBEdit152: TDBEdit;
    DBEdit154: TDBEdit;
    DBEdit155: TDBEdit;
    DBEdit156: TDBEdit;
    Splitter_ZAM: TSplitter;
    Splitter_HSV: TSplitter;
    Label381: TLabel;
    Verzia2301: TMenuItem;
    TlazamestnacovExcel1: TMenuItem;
    Rozpisodvodovpoistnho1: TMenuItem;
    Panel59: TPanel;
    DBG_zamf: TDBGrid;
    Panel_hotova: TPanel;
    Splitter_ZAMF: TSplitter;
    blbina1: TMenuItem;
    Operacie_zamf1: TMenuItem;
    Nvrat1: TMenuItem;
    N27: TMenuItem;
    Zoradeniepodaosobnhosla1: TMenuItem;
    Zoradeniepodaabecedy1: TMenuItem;
    N33: TMenuItem;
    Vberzamestnanca1: TMenuItem;
    VyplatyNew: TMenuItem;
    Zaokrovanie1: TMenuItem;
    StatusBar1: TStatusBar;
    Zdravotnpoistenie1: TMenuItem;
    Vplatnlistinarozpisnemocenskchdvok1: TMenuItem;
    Panel1: TPanel;
    mnu_prepocet: TMenuItem;
    tvrronprehadpreddavkovadani1: TMenuItem;
    Evidennlistdchzabezpeeniadni1: TMenuItem;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label40: TLabel;
    DBEdit15: TDBEdit;
    hlasenievd2: TMenuItem;
    mnu_obnova1: TMenuItem;
    mnu_ukony1: TMenuItem;
    mnu_zam_ukony1: TMenuItem;
    Label43: TLabel;
    Label41: TLabel;
    DBEdit16: TDBEdit;
    Label42: TLabel;
    Label48: TLabel;
    DBEdit17: TDBEdit;
    Label50: TLabel;
    DBEdit18: TDBEdit;
    mnu_ppv_dbcs: TMenuItem;
    RozpisodvodovDDPpozamestnancoch1: TMenuItem;
    N5: TMenuItem;
    tlac_old: TMenuItem;
    tlac_sp_xml: TMenuItem;
    tlac_spv1: TMenuItem;
    tlac_sp1: TMenuItem;
    tlac_sp1p: TMenuItem;
    mnu_cis_vvz1: TMenuItem;
    N8: TMenuItem;
    mnu_cdm2004: TMenuItem;
    N10: TMenuItem;
    Inicializcianovhoroka1: TMenuItem;
    N17: TMenuItem;
    tlac_sp_xml_k: TMenuItem;
    tlac_sp1p_xls: TMenuItem;
    N20: TMenuItem;
    mnu_cis_pu1: TMenuItem;
    Exportdopodvojnhotovnctva1: TMenuItem;
    Vplatnpskyzamestnancov1: TMenuItem;
    PokusZrky1: TMenuItem;
    mnu_imp2: TMenuItem;
    mnu_db_zaloz_rok: TMenuItem;
    Panel7: TPanel;
    DBText1: TDBText;
    Panel9: TPanel;
    Panel10: TPanel;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    ScrollBox1: TScrollBox;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label96: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label118: TLabel;
    DBText15: TDBText;
    DBText16: TDBText;
    Label123: TLabel;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    DBEdit65: TDBEdit;
    DBEdit67: TDBEdit;
    DBEdit79: TDBEdit;
    DBEdit80: TDBEdit;
    DBEdit82: TDBEdit;
    DBEdit83: TDBEdit;
    DBEdit84: TDBEdit;
    DBEdit89: TDBEdit;
    Label125: TLabel;
    Label95: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label106: TLabel;
    DBEdit66: TDBEdit;
    Label109: TLabel;
    DBEdit76: TDBEdit;
    Label126: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    DBEdit77: TDBEdit;
    DBEdit78: TDBEdit;
    Label133: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label128: TLabel;
    DBText17: TDBText;
    Label129: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    Label112: TLabel;
    DBText18: TDBText;
    Label119: TLabel;
    DBText19: TDBText;
    Label136: TLabel;
    Label120: TLabel;
    Label137: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Label144: TLabel;
    Vplatnlistina1: TMenuItem;
    Rozpisodvodov1: TMenuItem;
    Socilnapoisova1: TMenuItem;
    Vkazy2strana1: TMenuItem;
    rzp_tlac3: TMenuItem;
    tlac_pp2: TMenuItem;
    N2: TMenuItem;
    tlac_vz1: TMenuItem;
    Ronztovaniepreddavkov2: TMenuItem;
    zauct_rzp: TMenuItem;
    Zdravotnpoisovne1: TMenuItem;
    tlac_zp1p: TMenuItem;
    tlac_bon1: TMenuItem;
    tlac_zp_txt: TMenuItem;
    sp_reglisty: TMenuItem;
    NX_ZAM: TPageControl;
    PAGE_UDAJE: TTabSheet;
    Panel6: TPanel;
    DBText2: TDBText;
    Panel3: TPanel;
    Panel26: TPanel;
    PAGE_ZRAZKY: TTabSheet;
    PAGE_DETI: TTabSheet;
    PAGE_VYKONY: TTabSheet;
    SB_DETI: TScrollBox;
    Label160: TLabel;
    Label166: TLabel;
    Label168: TLabel;
    Label169: TLabel;
    Label170: TLabel;
    Label251: TLabel;
    Label259: TLabel;
    Label260: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    DBEdit166: TDBEdit;
    DBEdit167: TDBEdit;
    DBEdit168: TDBEdit;
    DBCheckBox20: TDBCheckBox;
    DBEdit169: TDBEdit;
    DBEdit170: TDBEdit;
    DBEdit53: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBEdit192: TDBEdit;
    DBEdit193: TDBEdit;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBGrid5: TDBGrid;
    Panel25: TPanel;
    DBText9: TDBText;
    Panel29: TPanel;
    Panel30: TPanel;
    DBN_deti2: TDBNavigator;
    DBN_deti1: TDBNavigator;
    SB_ZRZ: TScrollBox;
    Label316: TLabel;
    Label317: TLabel;
    Label320: TLabel;
    Label231: TLabel;
    Label319: TLabel;
    Label321: TLabel;
    Label322: TLabel;
    Label323: TLabel;
    Label324: TLabel;
    Label326: TLabel;
    Label327: TLabel;
    Label337: TLabel;
    Label338: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    DBEdit197: TDBEdit;
    DBEdit198: TDBEdit;
    DBEdit199: TDBEdit;
    DBEdit200: TDBEdit;
    DBEdit201: TDBEdit;
    DBEdit203: TDBEdit;
    DBEdit204: TDBEdit;
    DBEdit205: TDBEdit;
    DBEdit206: TDBEdit;
    DBEdit207: TDBEdit;
    DBEdit209: TDBEdit;
    DBEdit228: TDBEdit;
    DBEdit229: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBGrid8: TDBGrid;
    Panel40: TPanel;
    DBText22: TDBText;
    Panel41: TPanel;
    Panel42: TPanel;
    DBN_Zrz2: TDBNavigator;
    DBN_zrz1: TDBNavigator;
    Panel0: TPanel;
    Panel13: TPanel;
    Panel19: TPanel;
    DBN_zuk1: TDBNavigator;
    DBN_zuk2: TDBNavigator;
    DBGrid10: TDBGrid;
    NY_ZAM: TPageControl;
    PAGE_OSOBNE: TTabSheet;
    PAGE_PRACOVNE: TTabSheet;
    ScrollBox2: TScrollBox;
    Label153: TLabel;
    Label172: TLabel;
    Label174: TLabel;
    Label228: TLabel;
    Label229: TLabel;
    Label249: TLabel;
    Label45: TLabel;
    Label299: TLabel;
    Label296: TLabel;
    Label297: TLabel;
    Label252: TLabel;
    Label253: TLabel;
    DBText12: TDBText;
    DBText13: TDBText;
    Label265: TLabel;
    Label313: TLabel;
    DBText_Premie: TDBText;
    Label392: TLabel;
    Label393: TLabel;
    Label401: TLabel;
    Label402: TLabel;
    Label403: TLabel;
    Label404: TLabel;
    Label411: TLabel;
    Label272: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label73: TLabel;
    Label146: TLabel;
    Label240: TLabel;
    Label248: TLabel;
    Label147: TLabel;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox18: TDBCheckBox;
    DBCheckBox19: TDBCheckBox;
    DBEdit174: TDBEdit;
    DBEdit175: TDBEdit;
    DBEdit177: TDBEdit;
    DBEdit181: TDBEdit;
    DBEdit182: TDBEdit;
    DBCheckBox25: TDBCheckBox;
    DBEdit185: TDBEdit;
    DBEdit54: TDBEdit;
    DBZ_Vystup: TDBEdit;
    DBZ_Nastup: TDBEdit;
    DBZ_zamestnanie: TDBEdit;
    DBEdit186: TDBEdit;
    DBEdit187: TDBEdit;
    DBCheckBox8: TDBCheckBox;
    DBEdit194: TDBEdit;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBEdit195: TDBEdit;
    DBEdit242: TDBEdit;
    DBEdit266: TDBEdit;
    DBEdit267: TDBEdit;
    DBEdit268: TDBEdit;
    DBEdit269: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit274: TDBEdit;
    DBCheckBox28: TDBCheckBox;
    DBEdit323: TDBEdit;
    DBCheckBox3: TDBCheckBox;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBE_U_garancne: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit81: TDBEdit;
    DBEdit183: TDBEdit;
    DBEdit184: TDBEdit;
    Panel4: TPanel;
    Panel20: TPanel;
    DBN_zam2: TDBNavigator;
    DBN_zam1: TDBNavigator;
    DBText20: TDBText;
    PAGE_NEP: TTabSheet;
    Panel23: TPanel;
    DBText21: TDBText;
    Panel28: TPanel;
    Panel33: TPanel;
    DBN_nep1: TDBNavigator;
    DBN_nep2: TDBNavigator;
    DBLookupComboBox5: TDBLookupComboBox;
    Label141: TLabel;
    PAGE_DOCH: TTabSheet;
    Panel34: TPanel;
    DBText6: TDBText;
    Panel35: TPanel;
    Panel36: TPanel;
    DBN_DOCH1: TDBNavigator;
    DBN_DOCH2: TDBNavigator;
    DBGrid9: TDBGrid;
    PAGE_KONTAKTY: TTabSheet;
    Label63: TLabel;
    Label5: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label290: TLabel;
    Label295: TLabel;
    Label148: TLabel;
    Label36: TLabel;
    Label150: TLabel;
    DBZ_Ulica: TDBEdit;
    DBZ_Mesto: TDBEdit;
    DBZ_PSC: TDBEdit;
    DBZ_Telefon1: TDBEdit;
    DBEdit109: TDBEdit;
    qx: TDBLookupComboBox;
    DBEdit86: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit88: TDBEdit;
    PAGE_PPV: TTabSheet;
    Panel14: TPanel;
    Panel15: TPanel;
    SpeedButton2: TSpeedButton;
    Panel16: TPanel;
    DBN_ppv2: TDBNavigator;
    DBN_ppv1: TDBNavigator;
    ScrollBox4: TScrollBox;
    DBGrid1: TDBGrid;
    SB_ZAM: TScrollBox;
    Label20: TLabel;
    Label13: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label127: TLabel;
    Label35: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label300: TLabel;
    Label138: TLabel;
    Label154: TLabel;
    Label158: TLabel;
    DBText5: TDBText;
    Label99: TLabel;
    Label46: TLabel;
    DBText11: TDBText;
    Label33: TLabel;
    Label38: TLabel;
    Label64: TLabel;
    Label74: TLabel;
    Label10: TLabel;
    Label47: TLabel;
    Label151: TLabel;
    DBZ_Narodnost: TDBEdit;
    DBZ_CisVodic: TDBEdit;
    DBZ_CisloPasu: TDBEdit;
    DBZ_COP: TDBEdit;
    DBZ_MiestoNar: TDBEdit;
    DBZ_RodCislo: TDBEdit;
    DBZ_DatNar: TDBEdit;
    DBZ_PredPriezvisko: TDBEdit;
    DBZ_Priezvisko: TDBEdit;
    DBZ_Meno: TDBEdit;
    DBZ_Titul: TDBEdit;
    DBZ_OsobCislo: TDBEdit;
    DBZ_education: TDBEdit;
    DBZ_Cislo_u: TDBEdit;
    DBZ_SSym_u: TDBEdit;
    DBZ_Banka_u: TDBEdit;
    DBZ_Predcislo_u: TDBEdit;
    DBEdit163: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBZ_SID: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit12: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBLookupComboBox7: TDBLookupComboBox;
    DBEdit8: TDBEdit;
    PAGE_ELDP: TTabSheet;
    Panel18: TPanel;
    DBText26: TDBText;
    Panel37: TPanel;
    Panel38: TPanel;
    DBN_eldp1: TDBNavigator;
    DBN_eldp2: TDBNavigator;
    DBGrid4: TDBGrid;
    ScrollBox3: TScrollBox;
    Label152: TLabel;
    Label155: TLabel;
    Label156: TLabel;
    Label171: TLabel;
    Label173: TLabel;
    Label175: TLabel;
    Label176: TLabel;
    Label178: TLabel;
    Label180: TLabel;
    Label182: TLabel;
    Label183: TLabel;
    Label185: TLabel;
    Label186: TLabel;
    DBText27: TDBText;
    DBText28: TDBText;
    Label190: TLabel;
    Label191: TLabel;
    Label193: TLabel;
    Label194: TLabel;
    Label195: TLabel;
    Label196: TLabel;
    Label197: TLabel;
    Label198: TLabel;
    Label199: TLabel;
    Label200: TLabel;
    Label205: TLabel;
    Label206: TLabel;
    Label207: TLabel;
    DBText29: TDBText;
    Label208: TLabel;
    Label211: TLabel;
    Label212: TLabel;
    DBText30: TDBText;
    Label213: TLabel;
    DBText31: TDBText;
    Label216: TLabel;
    Label221: TLabel;
    Label223: TLabel;
    Label224: TLabel;
    Label226: TLabel;
    Label227: TLabel;
    DBEdit90: TDBEdit;
    DBEdit91: TDBEdit;
    DBEdit92: TDBEdit;
    DBEdit93: TDBEdit;
    DBEdit94: TDBEdit;
    DBEdit95: TDBEdit;
    DBEdit96: TDBEdit;
    DBEdit97: TDBEdit;
    DBEdit98: TDBEdit;
    DBEdit99: TDBEdit;
    DBEdit100: TDBEdit;
    DBEdit101: TDBEdit;
    DBEdit103: TDBEdit;
    DBEdit104: TDBEdit;
    Panel39: TPanel;
    DBText32: TDBText;
    Panel43: TPanel;
    Panel44: TPanel;
    DBNavigator3: TDBNavigator;
    DBNavigator4: TDBNavigator;
    SB_ZAM_PRAVY: TScrollBox;
    Panel45: TPanel;
    BitBtn3: TBitBtn;
    Label230: TLabel;
    Label235: TLabel;
    DBEdit105: TDBEdit;
    Label236: TLabel;
    DBEdit108: TDBEdit;
    Label238: TLabel;
    DBEdit110: TDBEdit;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    DBCheckBox7: TDBCheckBox;
    PotvrdenieozaplatendanePrloha21: TMenuItem;
    Vyhlsenieopoukzan21: TMenuItem;
    Daovrad1: TMenuItem;
    Ronztovaniepreddavkovdane1: TMenuItem;
    Vyhlsenieopoukzan2Prloha11: TMenuItem;
    PotvrdenieozaplatendanePrloha22: TMenuItem;
    tlac_sp1_pdf: TMenuItem;
    SpeedButton1: TSpeedButton;
    ZdravpoisovnevkazRTF1: TMenuItem;
    N3: TMenuItem;
    N16: TMenuItem;
    N28: TMenuItem;
    TEST1: TMenuItem;
    N29: TMenuItem;
    HlsnieovutovandanezprjmovronPDFIII1: TMenuItem;
    PAGE_ZP: TTabSheet;
    NX_ZDR: TPageControl;
    PAGE_ZP_ZAMNEC: TTabSheet;
    N30: TMenuItem;
    DBG_ZAM_PRAVY: TDBGrid;
    SPEED_ZAM_PRAVY: TSpeedButton;
    PC_PPV: TPageControl;
    PAGE_PPV_ZML: TTabSheet;
    PAGE_PPV_DVP: TTabSheet;
    PAGE_PPV_DPC: TTabSheet;
    PAGE_PPV_DBPS: TTabSheet;
    ScrollBox5: TScrollBox;
    Label100: TLabel;
    Label177: TLabel;
    Label179: TLabel;
    DBText8: TDBText;
    Label181: TLabel;
    Label201: TLabel;
    Label214: TLabel;
    Label34: TLabel;
    Label84: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit69: TDBEdit;
    DBEdit74: TDBEdit;
    DBEdit153: TDBEdit;
    DBEdit157: TDBEdit;
    DBEdit158: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    ScrollBox6: TScrollBox;
    Label219: TLabel;
    Label217: TLabel;
    Label218: TLabel;
    Label220: TLabel;
    Label232: TLabel;
    Label222: TLabel;
    Label104: TLabel;
    DBText4: TDBText;
    Label105: TLabel;
    Label117: TLabel;
    Label44: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    DBEdit27: TDBEdit;
    DBEdit161: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit162: TDBEdit;
    DBEdit245: TDBEdit;
    DBEdit246: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    ScrollBox7: TScrollBox;
    Label161: TLabel;
    Label162: TLabel;
    Label164: TLabel;
    Label225: TLabel;
    Label233: TLabel;
    Label234: TLabel;
    Label85: TLabel;
    DBText3: TDBText;
    Label101: TLabel;
    Label103: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    DBEdit75: TDBEdit;
    DBEdit159: TDBEdit;
    DBEdit160: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit71: TDBEdit;
    DBEdit72: TDBEdit;
    DBEdit73: TDBEdit;
    DBEdit68: TDBEdit;
    DBEdit70: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    ScrollBox8: TScrollBox;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    DBText14: TDBText;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label89: TLabel;
    Label88: TLabel;
    Label90: TLabel;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    DBEdit55: TDBEdit;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    DBEdit61: TDBEdit;
    DBEdit62: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit58: TDBEdit;
    Label7: TLabel;
    PAGE_PPV_EMPTY: TTabSheet;
    Label75: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label102: TLabel;
    Label215: TLabel;
    DBEdit112: TDBEdit;
    mnu_rozdeldan1: TMenuItem;
    Nastroje1: TMenuItem;
    mnu_ppv_pz_dod: TMenuItem;
    PAGE_PPV_ZMLD: TTabSheet;
    ScrollBox9: TScrollBox;
    Label250: TLabel;
    Label254: TLabel;
    Label255: TLabel;
    Label256: TLabel;
    Label257: TLabel;
    Label258: TLabel;
    Label261: TLabel;
    DBText7: TDBText;
    Label262: TLabel;
    Label263: TLabel;
    Label264: TLabel;
    Label266: TLabel;
    Label267: TLabel;
    Label268: TLabel;
    DBEdit113: TDBEdit;
    DBEdit114: TDBEdit;
    DBEdit115: TDBEdit;
    DBEdit116: TDBEdit;
    DBEdit117: TDBEdit;
    DBEdit118: TDBEdit;
    DBEdit119: TDBEdit;
    DBEdit120: TDBEdit;
    DBEdit121: TDBEdit;
    DBEdit122: TDBEdit;
    DBEdit123: TDBEdit;
    DBEdit124: TDBEdit;
    DBEdit125: TDBEdit;
    Zamestnancizobrazovanie1: TMenuItem;
    mnu_zobr_s: TMenuItem;
    mnu_zobr_v: TMenuItem;
    mnu_zobr_a: TMenuItem;
    Ronztovanieodvodovzdravotnhopoistenia1: TMenuItem;
    tlac_zdr_doklad1: TMenuItem;
    PAGE_ZP_DOKLAD: TTabSheet;
    DBGrid11: TDBGrid;
    Panel51: TPanel;
    Panel52: TPanel;
    DBNavigator9: TDBNavigator;
    DBNavigator10: TDBNavigator;
    Panel53: TPanel;
    Panel54: TPanel;
    DBNavigator11: TDBNavigator;
    DBNavigator12: TDBNavigator;
    DBGrid12: TDBGrid;
    Panel55: TPanel;
    Panel56: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel46: TPanel;
    Panel48: TPanel;
    Panel50: TPanel;
    DBNavigator5: TDBNavigator;
    DBNavigator6: TDBNavigator;
    SB_ZP_ZAMNEC: TScrollBox;
    Label9: TLabel;
    Label14: TLabel;
    Label39: TLabel;
    Label72: TLabel;
    Label142: TLabel;
    Label159: TLabel;
    Label189: TLabel;
    Label192: TLabel;
    DBEdit3: TDBEdit;
    DBEdit50: TDBEdit;
    DBLookupComboBox8: TDBLookupComboBox;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    DBEdit85: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit111: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    Panel47: TPanel;
    Panel49: TPanel;
    Panel57: TPanel;
    DBNavigator7: TDBNavigator;
    DBNavigator8: TDBNavigator;
    ScrollBox10: TScrollBox;
    Label270: TLabel;
    DBEdit126: TDBEdit;
    DBEdit127: TDBEdit;
    DBEdit129: TDBEdit;
    DBRadioGroup3: TDBRadioGroup;
    Label269: TLabel;
    Label271: TLabel;
    DBEdit128: TDBEdit;
    Oznmeniezamestnvateaopreplatkochanedoplatkoch1: TMenuItem;
    Oznmeniezamestnvateaopreplatkochanedoplatkochprloha1: TMenuItem;
    Oznmeniezamestnvateao1: TMenuItem;
    rzzp_zauctovanie: TMenuItem;
    Panel58: TPanel;
    Button3: TButton;
    Label273: TLabel;
    DBEdit130: TDBEdit;
    Label274: TLabel;
    tlac_sp_xml_2_5: TMenuItem;
    mnu_garpoist: TMenuItem;
    PAGE_DAVKA601: TTabSheet;
    Panel60: TPanel;
    Panel61: TPanel;
    DBN601_1: TDBNavigator;
    DBN601_2: TDBNavigator;
    DBGrid2: TDBGrid;
    tlac_zp_601: TMenuItem;
    tlac_sp1p_pdf: TMenuItem;
    tlac_old1: TMenuItem;
    Socilnapoisova2: TMenuItem;
    Zamestnanci1: TMenuItem;
    N19: TMenuItem;
    Tlaivoprihlseniezamestnanca1: TMenuItem;
    SPEED_ZAM_DOLNY: TSpeedButton;
    SB_DBGRID3: TScrollBox;
    DBGrid13: TDBGrid;
    Panel62: TPanel;
    DBText33: TDBText;
    Panel63: TPanel;
    Panel64: TPanel;
    DBNavigator13: TDBNavigator;
    DBNavigator14: TDBNavigator;
    ScrollBox11: TScrollBox;
    Label275: TLabel;
    Label276: TLabel;
    Label277: TLabel;
    Label280: TLabel;
    Label281: TLabel;
    Label282: TLabel;
    Label283: TLabel;
    Label284: TLabel;
    Label285: TLabel;
    Label286: TLabel;
    DBText34: TDBText;
    DBText35: TDBText;
    Label287: TLabel;
    Label288: TLabel;
    Label289: TLabel;
    Label298: TLabel;
    Label301: TLabel;
    Label302: TLabel;
    Label303: TLabel;
    Label304: TLabel;
    Label305: TLabel;
    Label306: TLabel;
    Label307: TLabel;
    Label308: TLabel;
    DBText36: TDBText;
    Label309: TLabel;
    Label310: TLabel;
    Label311: TLabel;
    DBText37: TDBText;
    Label312: TLabel;
    DBText38: TDBText;
    Label314: TLabel;
    Label315: TLabel;
    Label318: TLabel;
    Label325: TLabel;
    Label328: TLabel;
    Label329: TLabel;
    Label330: TLabel;
    Label331: TLabel;
    Label332: TLabel;
    Label333: TLabel;
    Label334: TLabel;
    Label335: TLabel;
    Label339: TLabel;
    Label340: TLabel;
    Label341: TLabel;
    DBEdit131: TDBEdit;
    DBEdit132: TDBEdit;
    DBEdit133: TDBEdit;
    DBEdit134: TDBEdit;
    DBEdit135: TDBEdit;
    DBEdit136: TDBEdit;
    DBEdit137: TDBEdit;
    DBEdit138: TDBEdit;
    DBEdit139: TDBEdit;
    DBEdit164: TDBEdit;
    DBEdit165: TDBEdit;
    DBEdit171: TDBEdit;
    DBEdit172: TDBEdit;
    DBEdit173: TDBEdit;
    DBEdit176: TDBEdit;
    DBEdit178: TDBEdit;
    DBEdit179: TDBEdit;
    DBEdit180: TDBEdit;
    DBEdit188: TDBEdit;
    DBEdit189: TDBEdit;
    DBEdit190: TDBEdit;
    DBEdit191: TDBEdit;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    N21: TMenuItem;
    tvrronprehadpotvrdenie1: TMenuItem;
    Ronhlseniepotvrdenie1: TMenuItem;
    N22: TMenuItem;
    Ronztovaniezdravpoistenie1: TMenuItem;
    N4: TMenuItem;
    Zpotovlist1: TMenuItem;
    Edit_zam_filter: TEdit;
    Panel65: TPanel;
    Label278: TLabel;
    DBEdit196: TDBEdit;
    Panel67: TPanel;
    DBText39: TDBText;
    Panel69: TPanel;
    DBNavigator15: TDBNavigator;
    DBNavigator16: TDBNavigator;
    ScrollBox12: TScrollBox;
    Label279: TLabel;
    Label342: TLabel;
    Label343: TLabel;
    Label344: TLabel;
    Label345: TLabel;
    Label346: TLabel;
    Label347: TLabel;
    Label348: TLabel;
    Label350: TLabel;
    DBText40: TDBText;
    DBText41: TDBText;
    Label351: TLabel;
    Label352: TLabel;
    Label353: TLabel;
    Label354: TLabel;
    Label355: TLabel;
    Label356: TLabel;
    Label357: TLabel;
    Label358: TLabel;
    Label359: TLabel;
    Label360: TLabel;
    Label361: TLabel;
    DBText42: TDBText;
    Label363: TLabel;
    Label365: TLabel;
    Label367: TLabel;
    Label368: TLabel;
    Label369: TLabel;
    Label370: TLabel;
    Label373: TLabel;
    Label374: TLabel;
    Label375: TLabel;
    Label376: TLabel;
    Label377: TLabel;
    Label380: TLabel;
    Label383: TLabel;
    DBEdit202: TDBEdit;
    DBEdit208: TDBEdit;
    DBEdit210: TDBEdit;
    DBEdit211: TDBEdit;
    DBEdit212: TDBEdit;
    DBEdit213: TDBEdit;
    DBEdit214: TDBEdit;
    DBEdit215: TDBEdit;
    DBEdit216: TDBEdit;
    DBEdit217: TDBEdit;
    DBEdit218: TDBEdit;
    DBEdit219: TDBEdit;
    DBEdit220: TDBEdit;
    DBEdit221: TDBEdit;
    DBEdit222: TDBEdit;
    DBEdit223: TDBEdit;
    DBEdit224: TDBEdit;
    DBEdit227: TDBEdit;
    DBEdit230: TDBEdit;
    DBEdit231: TDBEdit;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    DBEdit232: TDBEdit;
    Label384: TLabel;
    DBEdit233: TDBEdit;
    Label385: TLabel;
    Label349: TLabel;
    Label378: TLabel;
    DBEdit225: TDBEdit;
    Label379: TLabel;
    DBEdit226: TDBEdit;
    Label382: TLabel;
    DBEdit234: TDBEdit;
    Label386: TLabel;
    DBEdit235: TDBEdit;
    DBEdit236: TDBEdit;
    Label387: TLabel;
    Label388: TLabel;
    Label389: TLabel;
    Label390: TLabel;
    Label391: TLabel;
    Label394: TLabel;
    Label395: TLabel;
    Label396: TLabel;
    DBEdit237: TDBEdit;
    DBText43: TDBText;
    DBText44: TDBText;
    DBCheckBox16: TDBCheckBox;
    Label362: TLabel;
    DBEdit238: TDBEdit;
    RonhlsenieaszamestnanciEXCEL1: TMenuItem;
    mnu_zobr_r: TMenuItem;
    zam_platni_vroku: TMenuItem;
    N31: TMenuItem;
    Zobrazovalenplatnchzamestancov1: TMenuItem;
    Zobrazovaplatnchvaktulnomroku1: TMenuItem;
    Zobrazovalenukonenchzamestnancov1: TMenuItem;
    Zobrazovavetkchzamestnancov1: TMenuItem;
    N34: TMenuItem;
    mnu_imp_csv_specif1: TMenuItem;
    VplatnpskycezEMAIL1: TMenuItem;
    N11: TMenuItem;
    NepravidelnprjemvkayPDF1: TMenuItem;
    NepravidelnprjemvkazPDF1: TMenuItem;
    NepravidelnprjemvkazpoistnhoXML1: TMenuItem;
    EXTZostavadohodrovvCSVformte1: TMenuItem;
    N35: TMenuItem;
    Edit_zam_filter_rc: TEdit;
    EXTImportvplatzCSVpodapecifikcie11: TMenuItem;
    EXTZmenavetkchzamestnancovnadohodrov1: TMenuItem;
    N36: TMenuItem;
    MesVykPdf: TMenuItem;
    Panel68: TPanel;
    DBText45: TDBText;
    Panel70: TPanel;
    DBNavigator17: TDBNavigator;
    DBNavigator18: TDBNavigator;
    ScrollBox13: TScrollBox;
    Label364: TLabel;
    Label366: TLabel;
    Label371: TLabel;
    Label372: TLabel;
    Label397: TLabel;
    Label398: TLabel;
    Label400: TLabel;
    Label405: TLabel;
    DBText46: TDBText;
    DBText47: TDBText;
    Label406: TLabel;
    Label407: TLabel;
    Label408: TLabel;
    Label409: TLabel;
    Label410: TLabel;
    Label412: TLabel;
    Label413: TLabel;
    Label414: TLabel;
    Label415: TLabel;
    Label416: TLabel;
    Label417: TLabel;
    DBText48: TDBText;
    Label418: TLabel;
    Label419: TLabel;
    Label420: TLabel;
    Label421: TLabel;
    Label422: TLabel;
    Label423: TLabel;
    Label429: TLabel;
    Label430: TLabel;
    Label431: TLabel;
    Label432: TLabel;
    Label433: TLabel;
    Label434: TLabel;
    Label435: TLabel;
    Label436: TLabel;
    Label437: TLabel;
    Label438: TLabel;
    Label439: TLabel;
    Label440: TLabel;
    Label441: TLabel;
    Label442: TLabel;
    Label443: TLabel;
    Label444: TLabel;
    Label445: TLabel;
    DBText49: TDBText;
    DBText50: TDBText;
    Label446: TLabel;
    DBEdit239: TDBEdit;
    DBEdit240: TDBEdit;
    DBEdit241: TDBEdit;
    DBEdit243: TDBEdit;
    DBEdit247: TDBEdit;
    DBEdit248: TDBEdit;
    DBEdit249: TDBEdit;
    DBEdit250: TDBEdit;
    DBEdit252: TDBEdit;
    DBEdit253: TDBEdit;
    DBEdit254: TDBEdit;
    DBEdit255: TDBEdit;
    DBEdit258: TDBEdit;
    DBEdit259: TDBEdit;
    DBEdit261: TDBEdit;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    DBEdit262: TDBEdit;
    DBEdit263: TDBEdit;
    DBEdit264: TDBEdit;
    DBEdit265: TDBEdit;
    DBEdit270: TDBEdit;
    DBEdit271: TDBEdit;
    DBEdit272: TDBEdit;
    DBCheckBox22: TDBCheckBox;
    DBEdit275: TDBEdit;
    Label424: TLabel;
    DBEdit251: TDBEdit;
    Label425: TLabel;
    Label426: TLabel;
    DBEdit244: TDBEdit;
    DBText51: TDBText;
    DBText52: TDBText;
    Label427: TLabel;
    Label428: TLabel;
    Label448: TLabel;
    Label450: TLabel;
    Label399: TLabel;
    DBEdit256: TDBEdit;
    MesanvkazpreddavkovXML1: TMenuItem;
    vykaz_580: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    RonztovanieCSV1: TMenuItem;
    Vypl4: TMenuItem;
    Panel71: TPanel;
    Image601_pomoc: TImage;
    Image601_Novinky: TImage;
    Image601_Zamtel: TImage;
    PC_NEP: TPageControl;
    TAB_NEP_SP_PRIHLASKA: TTabSheet;
    TAB_NEP_SP_ZMENA: TTabSheet;
    TAB_NEP_SP_PRERUSENIE: TTabSheet;
    TAB_NEP_SP_ODHLASKA: TTabSheet;
    TAB_NEP_SP_ZRUSENIE: TTabSheet;
    TAB_NEP_PN: TTabSheet;
    DBGrid3: TDBGrid;
    DBGrid_SP_PRIHLASKA: TDBGrid;
    DBGrid_SP_ZMENA: TDBGrid;
    DBGrid_CIS7: TDBGrid;
    DBGrid_SP_PRERUSENIE: TDBGrid;
    DBGrid17: TDBGrid;
    DBGrid18: TDBGrid;
    Panel72: TPanel;
    Memo1: TMemo;
    Memo2: TMemo;
    TAB_NEP_OCR: TTabSheet;
    TAB_NEP_INE: TTabSheet;
    DBGrid19: TDBGrid;
    DBGrid20: TDBGrid;
    Label447: TLabel;
    Label449: TLabel;
    DBEdit257: TDBEdit;
    DBEdit260: TDBEdit;
    Label27: TLabel;
    Label149: TLabel;
    Label291: TLabel;
    Label292: TLabel;
    Label293: TLabel;
    DBEdit87: TDBEdit;
    DBEdit102: TDBEdit;
    DBEdit106: TDBEdit;
    DBLookupComboBox6: TDBLookupComboBox;
    DBEdit107: TDBEdit;
    Label294: TLabel;
    Label451: TLabel;
    DBEdit273: TDBEdit;
    DBEdit276: TDBEdit;
    Label452: TLabel;
    Label453: TLabel;
    DBZ_RodnePriezvisko: TDBEdit;
    Label454: TLabel;
    DBZ_Titul_after: TDBEdit;
    Panel73: TPanel;
    DBText53: TDBText;
    Panel74: TPanel;
    DBNavigator19: TDBNavigator;
    DBNavigator20: TDBNavigator;
    ScrollBox14: TScrollBox;
    Label49: TLabel;
    Label455: TLabel;
    Label456: TLabel;
    Label457: TLabel;
    Label458: TLabel;
    Label459: TLabel;
    Label460: TLabel;
    Label461: TLabel;
    DBText54: TDBText;
    DBText55: TDBText;
    Label462: TLabel;
    Label463: TLabel;
    Label464: TLabel;
    Label465: TLabel;
    Label466: TLabel;
    Label467: TLabel;
    Label468: TLabel;
    Label469: TLabel;
    Label470: TLabel;
    Label471: TLabel;
    Label472: TLabel;
    DBText56: TDBText;
    Label473: TLabel;
    Label474: TLabel;
    Label475: TLabel;
    Label476: TLabel;
    Label477: TLabel;
    Label478: TLabel;
    Label479: TLabel;
    Label480: TLabel;
    Label481: TLabel;
    Label482: TLabel;
    Label483: TLabel;
    Label484: TLabel;
    Label485: TLabel;
    Label486: TLabel;
    Label487: TLabel;
    Label488: TLabel;
    Label489: TLabel;
    Label490: TLabel;
    Label491: TLabel;
    Label492: TLabel;
    Label493: TLabel;
    Label494: TLabel;
    Label495: TLabel;
    DBText57: TDBText;
    DBText58: TDBText;
    Label496: TLabel;
    Label497: TLabel;
    Label498: TLabel;
    Label499: TLabel;
    DBText59: TDBText;
    DBText60: TDBText;
    Label500: TLabel;
    Label501: TLabel;
    Label502: TLabel;
    Label503: TLabel;
    Label504: TLabel;
    DBEdit277: TDBEdit;
    DBEdit278: TDBEdit;
    DBEdit279: TDBEdit;
    DBEdit280: TDBEdit;
    DBEdit281: TDBEdit;
    DBEdit282: TDBEdit;
    DBEdit283: TDBEdit;
    DBEdit284: TDBEdit;
    DBEdit285: TDBEdit;
    DBEdit286: TDBEdit;
    DBEdit287: TDBEdit;
    DBEdit288: TDBEdit;
    DBEdit289: TDBEdit;
    DBEdit290: TDBEdit;
    DBEdit291: TDBEdit;
    DBCheckBox23: TDBCheckBox;
    DBCheckBox24: TDBCheckBox;
    DBEdit292: TDBEdit;
    DBEdit293: TDBEdit;
    DBEdit294: TDBEdit;
    DBEdit295: TDBEdit;
    DBEdit296: TDBEdit;
    DBEdit297: TDBEdit;
    DBEdit298: TDBEdit;
    DBCheckBox26: TDBCheckBox;
    DBEdit299: TDBEdit;
    DBEdit300: TDBEdit;
    DBEdit301: TDBEdit;
    DBEdit302: TDBEdit;
    Label505: TLabel;
    DBEdit303: TDBEdit;
    N39: TMenuItem;
    RocneHlaseniePreddavkoEdane: TMenuItem;
    Vkazpoistnhodvka514elektronick1: TMenuItem;
    Gfk1: TMenuItem;
    N11Spojeniestredskdatabz1: TMenuItem;
    N12Spojenieud1: TMenuItem;
    EXT1: TMenuItem;
    DBEdit304: TDBEdit;
    Label506: TLabel;
    DBEdit305: TDBEdit;
    DBCB_statutar: TDBCheckBox;
    DBCheckBox27: TDBCheckBox;
    Panel66: TPanel;
    Panel8: TPanel;
    Panel75: TPanel;
    Panel76: TPanel;
    Panel77: TPanel;
    DBText61: TDBText;
    Panel78: TPanel;
    DBNavigator21: TDBNavigator;
    DBNavigator22: TDBNavigator;
    ScrollBox15: TScrollBox;
    Label507: TLabel;
    Label508: TLabel;
    Label509: TLabel;
    Label510: TLabel;
    Label511: TLabel;
    Label512: TLabel;
    Label513: TLabel;
    Label514: TLabel;
    DBText62: TDBText;
    DBText63: TDBText;
    Label515: TLabel;
    Label516: TLabel;
    Label517: TLabel;
    Label518: TLabel;
    Label519: TLabel;
    Label520: TLabel;
    Label521: TLabel;
    Label522: TLabel;
    Label523: TLabel;
    Label524: TLabel;
    Label525: TLabel;
    DBText64: TDBText;
    Label526: TLabel;
    Label527: TLabel;
    Label528: TLabel;
    Label529: TLabel;
    Label530: TLabel;
    Label531: TLabel;
    Label532: TLabel;
    Label533: TLabel;
    Label534: TLabel;
    Label535: TLabel;
    Label536: TLabel;
    Label537: TLabel;
    Label538: TLabel;
    Label539: TLabel;
    Label540: TLabel;
    Label541: TLabel;
    Label542: TLabel;
    Label543: TLabel;
    Label544: TLabel;
    Label545: TLabel;
    Label546: TLabel;
    Label547: TLabel;
    Label548: TLabel;
    DBText65: TDBText;
    DBText66: TDBText;
    Label549: TLabel;
    Label550: TLabel;
    Label551: TLabel;
    Label552: TLabel;
    DBText67: TDBText;
    DBText68: TDBText;
    Label553: TLabel;
    Label554: TLabel;
    Label555: TLabel;
    Label556: TLabel;
    Label557: TLabel;
    Label558: TLabel;
    DBEdit39: TDBEdit;
    DBEdit306: TDBEdit;
    DBEdit307: TDBEdit;
    DBEdit308: TDBEdit;
    DBEdit309: TDBEdit;
    DBEdit310: TDBEdit;
    DBEdit311: TDBEdit;
    DBEdit312: TDBEdit;
    DBEdit313: TDBEdit;
    DBEdit314: TDBEdit;
    DBEdit315: TDBEdit;
    DBEdit316: TDBEdit;
    DBEdit317: TDBEdit;
    DBEdit318: TDBEdit;
    DBEdit319: TDBEdit;
    DBCheckBox29: TDBCheckBox;
    DBCheckBox30: TDBCheckBox;
    DBEdit320: TDBEdit;
    DBEdit321: TDBEdit;
    DBEdit322: TDBEdit;
    DBEdit324: TDBEdit;
    DBEdit325: TDBEdit;
    DBEdit326: TDBEdit;
    DBEdit327: TDBEdit;
    DBCheckBox31: TDBCheckBox;
    DBEdit328: TDBEdit;
    DBEdit329: TDBEdit;
    DBEdit330: TDBEdit;
    DBEdit331: TDBEdit;
    DBEdit332: TDBEdit;
    Label559: TLabel;
    DBEdit333: TDBEdit;
    DBEdit334: TDBEdit;
    Label560: TLabel;
    procedure BtnCancelClick(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure SET_ALL(Sender: TObject);
    procedure ZamestnanciClick(Sender: TObject);
    procedure Akcia_zamf_vyber(Sender: TObject);
    procedure NPageChanged(Sender: TObject);
    procedure Akcia_vypl_navrat(Sender: TObject);
    procedure Akcia_nastavenia_programu(Sender: TObject);
    procedure Nastavenia_dzpClick(Sender: TObject);
    procedure Akcia_obdobie(Sender: TObject);
    procedure Akcia_stredisko(Sender: TObject);
    procedure Akcia_priprav_zam1(Sender: TObject);
    procedure Akcia_zam_insert(Sender: TObject);
    procedure Akcia_zam_navrat(Sender: TObject);
    procedure Akcia_priprav_dzp(Sender: TObject);
    procedure Akcia_dzp_insert(Sender: TObject);
    procedure Akcia_dzp_edit(Sender: TObject);
    procedure Akcia_dzp_delete(Sender: TObject);
    procedure Akcia_dzp_post(Sender: TObject);
    procedure Akcia_dzp_cancel(Sender: TObject);
    procedure DBN_priprav_dzp(Sender: TObject; Button: TNavigateBtn);
    procedure Akcia_dzp_navrat(Sender: TObject);
    procedure Akcia_navrat(Sender: TObject);
    procedure DBN_zam2Click(Sender: TObject; Button: TNavigateBtn);
    procedure Akcia_zam_edit(Sender: TObject);
    procedure Akcia_zam_post(Sender: TObject);
    procedure Akcia_zam_cancel(Sender: TObject);
    procedure DBG_zamfKeyPress(Sender: TObject; var Key: Char);
    procedure Akcia_zam_delete(Sender: TObject);
    procedure Akcia_parametre_firmy(Sender: TObject);
    procedure Akcia_firma_navrat(Sender: TObject);
    procedure Akcia_priprav_menu(Sender: TObject);
    procedure Akcia_system_koniec(Sender: TObject);
    procedure Akcia_otvorenie_db(Sender: TObject);
    procedure Akcia_zatvorenie_db(Sender: TObject);
    procedure Akcia_ppv_navrat(Sender: TObject);
    procedure Akcia_priprav_ppv1(Sender: TObject);
    procedure Akcia_ppv_insert(Sender: TObject);
    procedure Akcia_ppv_edit(Sender: TObject);
    procedure Akcia_ppv_delete(Sender: TObject);
    procedure Akcia_ppv_post(Sender: TObject);
    procedure Akcia_ppv_cancel(Sender: TObject);
    procedure VztahyClick(Sender: TObject);
    procedure DBN_ppv_OnClick(Sender: TObject; Button: TNavigateBtn);
    procedure ZuctovanieClick(Sender: TObject);
    procedure SET_RZP(Sender: TObject);
    procedure Akcia_rzp_insert(Sender: TObject);
    procedure Akcia_rzp_edit(Sender: TObject);
    procedure Akcia_rzp_delete(Sender: TObject);
    procedure Akcia_rzp_post(Sender: TObject);
    procedure Akcia_rzp_cancel(Sender: TObject);
    procedure Akcia_priprav_rzp(Sender: TObject);
    procedure DBN_RZPOnClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBN_ppv2BeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure Z_ShowReportML(Sender: TObject);
    procedure Z_ShowReportPP(Sender: TObject);
    procedure Z_ShowReportPZ(Sender: TObject);
    procedure Z_ShowReportRZ(Sender: TObject);
    procedure ShowReportFZ1(Sender: TObject);
    procedure ShowReportML(Sender: TObject);
    procedure ShowReportPP1(Sender: TObject);
    procedure ShowReportPZ(Sender: TObject);
    procedure ShowReportSP(Sender: TObject);
    procedure ShowReportVP(Sender: TObject);
    procedure ShowReportVP1(Sender: TObject);
    procedure ShowReportZP(Sender: TObject);
    procedure ShowReportFZ2(Sender: TObject);
    procedure ShowReportRZ2004A(Sender: TObject);
    procedure Show1ReportRZ2004A(Sender: TObject);
    procedure ShowReportVL(Sender: TObject);
    procedure ShowReportVL2(Sender: TObject);
    procedure ShowReportVL3(Sender: TObject);
    procedure ShowReportHP_220(Sender: TObject);
    procedure ShowReportHP_230(Sender: TObject);
    procedure ShowReportPPV(Sender: TObject);
    procedure ShowReportDOV(Sender: TObject);
    procedure DBN_DetiOnClick(Sender: TObject; Button: TNavigateBtn);
    procedure ShowReportPOI(Sender: TObject);
    procedure mnu_cis_zp1Click(Sender: TObject);
    procedure HSVClick(Sender: TObject);
    procedure Akcia_zam_zoradit1(Sender: TObject);
    procedure Akcia_zam_zoradit2(Sender: TObject);
    procedure Akcia_zam_sucasny(Sender: TObject);
    procedure Akcia_zam_vyradeny(Sender: TObject);
    procedure Akcia_zam_vsetci(Sender: TObject);
    procedure Akcia_zam_obnov_filter(Sender: TObject);
    procedure Btn_Uctuj_HsvClick(Sender: TObject);
    procedure Akcia_hsv_navrat(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mnu_cis_vm1Click(Sender: TObject);
    procedure mnu_cis_pd1Click(Sender: TObject);
    procedure mnu_cis_par1Click(Sender: TObject);
    procedure Menu_maly_velky_zavod;
    procedure mnu_xenon1Click(Sender: TObject);
    procedure Hint_zobraz(Sender: TObject);
    procedure Hint_zmaz(Sender: TObject);
    procedure DBN_Zrz2Click(Sender: TObject; Button: TNavigateBtn);
    procedure ShowReportNZ(Sender: TObject);
    procedure ShowReportVL3_rok(Sender: TObject);
    procedure ShowReportZL(Sender: TObject);
    procedure mnu_cis_bu1Click(Sender: TObject);
    procedure ShowReportEN(Sender: TObject);
    procedure ShowReportML2(Sender: TObject);
    procedure Z_ShowReportML2(Sender: TObject);
    procedure Akcia_system_koniec_reg(Sender: TObject);
    procedure akcia_pridanie_firmy(Sender: TObject);
    procedure ShowReportRZ2(Sender: TObject);
    procedure DBComboBoxRp1Enter(Sender: TObject);
    procedure TlazamestnacovExcel1Click(Sender: TObject);
    procedure ShowReportOdv(Sender: TObject);
    procedure ShowReportSPV(Sender: TObject);
    procedure ShowReportDNS2(Sender: TObject);
    procedure VyplatyNewClick(Sender: TObject);
    procedure Akcia_zaokruhlovanie(Sender: TObject);
    procedure ShowReportOdvZp(Sender: TObject);
    procedure ShowReportVLND(Sender: TObject);
    procedure Akcia_start_pam98(Sender: TObject);
    procedure Akcia_prepocet(Sender: TObject);
    procedure tvrronprehadpreddavkovadani1Click(Sender: TObject);
    procedure DBG_zamfDblClick(Sender: TObject);
    procedure ShowReportELDZ1(Sender: TObject);
    procedure hlasenievd2Click(Sender: TObject);
    procedure akcia_zalohovanie(Sender: TObject);
    procedure akcia_obnova(Sender: TObject);
    procedure mnu_ukony1Click(Sender: TObject);
    procedure SPEED_ZAM_PRAVYClick(Sender: TObject);
    procedure ShowReportOdvDp(Sender: TObject);
    procedure tlac_sp_xmlClick(Sender: TObject);
    procedure tlac_sp1pClick(Sender: TObject);
    procedure mnu_cis_vvz1Click(Sender: TObject);
    procedure mnu_cdm2004Click(Sender: TObject);
    procedure tlac_sp_xml_kClick(Sender: TObject);
    procedure tlac_sp_xmleClick(Sender: TObject);
    procedure tlac_sp1p_xlsClick(Sender: TObject);
    procedure mnu_cis_pu1Click(Sender: TObject);
    procedure ShowReportPU(Sender: TObject);
    procedure ShowReportVYK(Sender: TObject);
    procedure ShowReportZraz(Sender: TObject);
    procedure mnu_imp2Click(Sender: TObject);
    procedure mnu_db_zaloz_rokClick(Sender: TObject);
    procedure ShowReportRZ2004B(Sender: TObject);
    procedure Show1ReportRZ2004B(Sender: TObject);
    procedure ShowReportPP2(Sender: TObject);
    procedure ShowReportVZ(Sender: TObject);
    procedure rzp_zauctovanie(Sender: TObject);
    procedure ShowReportZP2005PR(Sender: TObject);
    procedure ShowReportBO(Sender: TObject);
    procedure tlac_zp_txtClick(Sender: TObject);
    procedure sp_reglistyClick(Sender: TObject);
    procedure NX_ZAMChange(Sender: TObject);
    procedure NX_ZAMChanging(Sender: TObject; var AllowChange: Boolean);
    procedure DBN_DOCH1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBN_nep1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBN_zuk1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBG_ZAM_PRAVYTitleClick(Column: TColumn);
    procedure DBG_zamfTitleClick(Column: TColumn);
    procedure ShowRTF_Nezisk2(Sender: TObject);
    procedure Show_RTF_NEZISK1(Sender: TObject);
    procedure Show_RTF_Nezisk1_ALL(Sender: TObject);
    procedure Show_RTF_Nezisk2_ALL(Sender: TObject);
    procedure tlac_sp1_pdfClick(Sender: TObject);
    procedure ShowReportELDP(Sender: TObject);
    procedure ShowReportZP_RTF(Sender: TObject);
    procedure ShowReportVD_B_PDF(Sender: TObject);
    procedure ShowReportVD_A_PDF(Sender: TObject);
    procedure SpecialneCinnosti;
    procedure mnu_rozdeldan1Click(Sender: TObject);
    procedure Show_RTF_ZDR_DOKLAD(Sender: TObject);
    procedure Show_RTF_ZDR_OZNAM(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Oznmeniezamestnvateaopreplatkochanedoplatkoch1Click(
      Sender: TObject);
    procedure Oznmeniezamestnvateaopreplatkochanedoplatkochprloha1Click(
      Sender: TObject);
    procedure rzzp_zauctovanieClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure tlac_sp_xml_2_5Click(Sender: TObject);
    procedure mnu_garpoistClick(Sender: TObject);
    procedure tlac_zp_601Click(Sender: TObject);
    procedure tlac_sp1p_pdfClick(Sender: TObject);
    procedure Tlaivoprihlseniezamestnanca1Click(Sender: TObject);
    procedure SPEED_ZAM_DOLNYClick(Sender: TObject);
    procedure tvrronprehadpotvrdenie1Click(Sender: TObject);
    procedure Ronhlseniepotvrdenie1Click(Sender: TObject);
    procedure Zpotovlist1Click(Sender: TObject);
    procedure Edit_zam_filterKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Akcia_Start_Shoparena(Sender: TObject);
    procedure Servisnzsahvymazvyplat112008stredisko81Click(
      Sender: TObject);
    procedure RonhlsenieaszamestnanciEXCEL1Click(Sender: TObject);
    procedure Akcia_zam_platni_vroku(Sender: TObject);
    procedure mnu_imp_csv_specif1Click(Sender: TObject);
    procedure VplatnpskycezEMAIL1Click(Sender: TObject);
    procedure NepravidelnprjemvkayPDF1Click(Sender: TObject);
    procedure NepravidelnprjemvkazPDF1Click(Sender: TObject);
    procedure NepravidelnprjemvkazpoistnhoXML1Click(Sender: TObject);
    procedure EXTZostavadohodrovvCSVformte1Click(Sender: TObject);
    procedure EXTImportvplatzCSVpodapecifikcie11Click(Sender: TObject);
    procedure DBZ_RodCisloChange(Sender: TObject);
    procedure EXTZmenavetkchzamestnancovnadohodrov1Click(Sender: TObject);
    procedure MesVykPdfClick(Sender: TObject);
    procedure MesanvkazpreddavkovXML1Click(Sender: TObject);
    procedure vykaz_580Click(Sender: TObject);
    procedure RonztovanieCSV1Click(Sender: TObject);
    procedure Vypl4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Image601_pomocClick(Sender: TObject);
    procedure Image601_ZamtelClick(Sender: TObject);
    procedure Image601_NovinkyClick(Sender: TObject);
    procedure PC_NEPChange(Sender: TObject);
    procedure RocneHlaseniePreddavkoEdaneClick(Sender: TObject);
    procedure tlac_zp_zlucene_txtClick(Sender: TObject);
    procedure N11Spojeniestredskdatabz1Click(Sender: TObject);
    procedure N12Spojenieud1Click(Sender: TObject);
    procedure EXT1Click(Sender: TObject);
    procedure Akcia_start_itstudio(Sender: TObject);
    procedure Akcia_start_zelpsisa(Sender: TObject);
    procedure Akcia_start_audio(Sender: TObject);
    procedure Label561Click(Sender: TObject);
  private
    { Private declarations }
    OTVORENA_FIRMA: integer;
  public
    { Public declarations }
    X: TMyReportParam;
    SYS_START: Boolean;
    SYS_OPERACIA: Char; {Z-zamestnanci,V-v˝platy,P-prac.vzùahy}
    Operacie_doch1: TMyMenu;
    Operacie_nep1: TMyMenu;
    Operacie_vyk1: TMyMenu;
    Operacie_zrz1: TMyMenu;
    Operacie_deti1: TMyMenu;
    Operacie_eldp1: TMyMenu;
    Operacie_d601: TMyMenu;
    SL_Report: TStringList;
    procedure NACITAJ_FIRMY;
    procedure ZAZNI_MENU(ANO:boolean);
    function  VYPLNENE_POLE(F:TField):boolean;
    function  VYPLNENE: boolean;
    procedure NASTAV_PRVY;
    procedure DisableOperacie;
    procedure EnableMenuItem(i:TMenuItem);
    procedure DisableMenuItem(i:TMenuItem);
    procedure UpdateStatus;
    procedure UpdatePanelHotova;
    function  Open_db_common:boolean;
    function  Registracia:boolean;
    function  Prihlasenie:boolean;
    procedure RefreshDatabase;
    procedure akcia_zrusenie_firmy(Sender: TObject);
    function  SuRozpracovaneZmeny1: boolean;
    procedure MyMenuHandler(Sender: TObject);
    procedure VytvorMenu(var X:TMyMenu;iDS:TDataSource;var iDBN1,iDBN2: TDBNavigator;iNazov:string);
    procedure MyMenuUpdateState(Sender: TObject);
    procedure spusti_zalohovanie(Sender: TObject; BOOL_Vynutene: boolean);
  end;



var
  FormMain: TFormMain;
  AppCalc: Boolean;
  Dialog1: TOpenDialog;
  T1: TTable;
  T2: TTable;
  TID: TTable;

implementation

uses DM_Main, Dm_zam, Dm_vypl, Login, Obdobie,
  Dm_ppv, Myreg, Sc_main, Stred, Pridavky,
  Xenon, FmxUtils, FileCtrl, Progress, MainHP1, Pomoc, MainCsv1, ParForm,
  MainVyp, M_Pomoc, DM_ALL, MainSet, About, MainInf, RexSpXml, REXSP1P,
  DM_sql, REXNZ, NewFirma, MainNEP1, DM_ZDR, RexRTF, inifiles, regver;

type
  TFooClass = class(TControl); { needed to get at protected font property }

{$R *.DFM}

function  TFormMain.SuRozpracovaneZmeny1: boolean;
begin with DM,DMZ,DMV,DMP do begin
  Result :=
  (TZAM_.State in [dsEdit,dsInsert]) or
  (TRZP_.State in [dsEdit,dsInsert]) or
  (TZRZ_.State in [dsEdit,dsInsert]) or
  (TDET_.State in [dsEdit,dsInsert]) or
  (TNEP_.State in [dsEdit,dsInsert]) or
  (TDOCH_.State in [dsEdit,dsInsert]) or
  (TPPV_.State in [dsEdit,dsInsert]) or
  (TELDP_.State in [dsEdit,dsInsert]) or
  (TZP1_.State in [dsEdit,dsInsert]) or
  (TZP2_.State in [dsEdit,dsInsert]) or
  (TZP3_.State in [dsEdit,dsInsert]) or
  (TZP4_.State in [dsEdit,dsInsert]) or
  (TZP5_.State in [dsEdit,dsInsert]) or
  (TELDP_.State in [dsEdit,dsInsert]) or
  (TZUK_.State in [dsEdit,dsInsert]);
end;end;

procedure TFormMain.NACITAJ_FIRMY;
var i,r:integer;s,mf:string;NewItem1,NewItem2,NewItem3,PrvyItem: TMenuItem;
    prvy:boolean;
begin with DM do begin
  for i:=0 to Otvorenie_firmy.Count-1 do
    Otvorenie_firmy.Remove(Otvorenie_firmy.Items[0]);
  for i:=0 to Zrusenie_firmy.Count-1 do
    Zrusenie_firmy.Remove(Zrusenie_firmy.Items[0]);
  for i:=1 to 99 {TSYS_POCET_FIRIEM.Value} do
  begin
    prvy:=true;
    for r:=2004 to 2019 do
    if FileExists(MyNetPath+'COMMON\ROK'+IntToStr(r)+'\'+'cis_par.db') then
    begin
      s:=Format('%.2d',[i]);
      try
        if prvy then begin
          TXYZ_.Close;
          TXYZ_.TableName:=MyNetPath+'DATA'+s+{'\ROK'+IntToStr(r)}'\'+'INF.DB';
          TXYZ_.Open;
          mf:=TXYZ_Nazov.Value;
          TXYZ_.Close;
          {--otvorenie firmy 1.cast}
          NewItem1 := TMenuItem.Create(Self);
          NewItem1.Tag:=i;
          NewItem1.Caption := s+' '+mf;
          Otvorenie_firmy.Add(NewItem1);
          PrvyItem := NewItem1;
          prvy:=false;
          {--zrusenie firmy}
          NewItem2 := TMenuItem.Create(Self);
          NewItem2.Tag:=i;
          NewItem2.Caption := s+' '+mf;
          NewItem2.OnClick:=Akcia_zrusenie_firmy;
          Zrusenie_firmy.Add(NewItem2);
        end;
        {--otvorenie firmy 2.cast - roky}
        NewItem3 := TMenuItem.Create(Self);
        NewItem3.Caption := IntToStr(r);
        NewItem3.Tag:=i;
        NewItem3.OnClick:=Akcia_otvorenie_db;
        PrvyItem.Add(NewItem3);
      except on E:Exception do
      end;
    end;
  end;
  TXYZ_.Close;
end;end;

procedure TFormMain.UpdateStatus;
begin with DM do begin
  FormMenuPomoc.UpdateFormStatus((FormMain as TForm),StatusBar1);
end;end;

procedure TFormMain.UpdatePanelHotova;
begin

end;

procedure TFormMain.EnableMenuItem(i:TMenuItem);
begin
  i.Enabled:=True;
  i.Visible:=True;
end;

procedure TFormMain.DisableMenuItem(i:TMenuItem);
begin
  i.Enabled:=False;
  i.Visible:=False;
end;

procedure TFormMain.DisableOperacie;
begin
  DisableMenuItem(Operacie_zam1);
  DisableMenuItem(Operacie_zamf1);
  DisableMenuItem(Operacie_ppv1);
  DisableMenuItem(Operacie_dzp1);
  DisableMenuItem(Operacie_rzp1);
  DisableMenuItem(Operacie_deti1.Hlavny);
  DisableMenuItem(Operacie_zrz1.Hlavny);
  DisableMenuItem(Operacie_doch1.Hlavny);
  DisableMenuItem(Operacie_eldp1.Hlavny);
  DisableMenuItem(Operacie_nep1.Hlavny);
  DisableMenuItem(Operacie_vyk1.Hlavny);
  DisableMenuItem(Operacie_d601.Hlavny);
end;

procedure TFormMain.ZAZNI_MENU(ANO:boolean);
begin
  System.Enabled:=ANO;
  Hlavne.Enabled:=ANO;
  Prehlady.Enabled:=ANO;
  Nastavenia.Enabled:=ANO;
end;

function TFormMain.VYPLNENE_POLE(F:TField):boolean;
const
  CheckTypes = [ftString, ftSmallint, ftInteger, ftWord, ftBoolean, ftFloat,
    ftCurrency, ftBCD, ftDate, ftTime, ftDateTime, ftBytes, ftVarBytes];
begin
  VYPLNENE_POLE:=TRUE;
  with F do
  if Required and
    (DataSet.State in [dsEdit,dsInsert])and
    (FieldKind = fkData) and
    (DataType in CheckTypes) and IsNull then
  begin
    VYPLNENE_POLE:=FALSE;
    FocusControl;
    DatabaseError(Format(SFieldRequired, [DisplayName]));
  end;
end;

function TFormMain.VYPLNENE: boolean;
var i:integer;
begin
  VYPLNENE:=TRUE;
  for i:=0 to ComponentCount-1 do
  if (Components[i] is TDBEdit) then
  with Components[i] as TDBEdit do
  begin
    if CanFocus then
     VYPLNENE:=VYPLNENE_POLE(DataSource.Dataset.FieldByName(DataField));
  end;
end;

procedure TFormMain.NASTAV_PRVY;
var i:integer;
begin
  for i:=0 to ComponentCount-1 do
  if (Components[i] is TDBEdit) then
  begin
    if (Components[i] as TDBEdit).TabOrder=0 then
    if (Components[i] as TDBEdit).CanFocus then
    begin
      (Components[i] as TDBEdit).SetFocus;
      break;
    end;
  end
  else
  if (Components[i] is TEdit) then
  begin
    if (Components[i] as TEdit).TabOrder=0 then
    if (Components[i] as TEdit).CanFocus then
    begin
      (Components[i] as TEdit).SetFocus;
      break;
    end;
  end
end;

procedure TFormMain.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key)=13 then DBG_zamf.SetFocus;
end;

procedure TFormMain.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key)=13 then DBG_zamf.SetFocus;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  PAGE_PPV_ZML.TabVisible:= false;
  PAGE_PPV_ZMLD.TabVisible:= false;
  PAGE_PPV_DVP.TabVisible:= false;
  PAGE_PPV_DPC.TabVisible:= false;
  PAGE_PPV_DBPS.TabVisible:= false;
  PAGE_PPV_EMPTY.TabVisible:= false;
  VytvorMenu(Operacie_doch1,DMZ.DS_DOCH,DBN_doch1,DBN_doch2,'Oper·cie-ev.dÙchodkov');
  VytvorMenu(Operacie_nep1,DMZ.DS_NEP,DBN_nep1,DBN_nep2,'Oper·cie-neprÌtomnosù');
  VytvorMenu(Operacie_vyk1,DMV.DS_ZUK,DBN_zuk1,DBN_zuk2,'Oper·cie-v˝kony');
  VytvorMenu(Operacie_zrz1,DMZ.DS_ZRZ,DBN_zrz1,DBN_zrz2,'Oper·cie-zr·ûky');
  VytvorMenu(Operacie_deti1,DMZ.DS_DETI,DBN_deti1,DBN_deti2,'Oper·cie-evidencia detÌ');
  VytvorMenu(Operacie_eldp1,DMZ.DS_ELDP,DBN_deti1,DBN_deti2,'Oper·cie-ev.list dÙch.poist.');
  VytvorMenu(Operacie_d601,DMZ.DS_ZP5,DBN601_1,DBN601_2,'Oper·cie-˙daje pre ZP (d·vka 601)');
  Caption := MyWinCaption;
  SYS_START := True;
{  Update;
  if (Screen.width <> DesignScreenWidth) then begin
    height := longint(height) * longint(screen.width) div DesignScreenWidth;
    width := longint(width) * longint(screen.width) div DesignScreenWidth;

    for i := ControlCount - 1 downto 0 do
      TFooClass(Controls[i]).Font.Size :=
        Round((Screen.Width / DesignScreenWidth) *
         TFooClass(Controls[i]).Font.Size);

    FormMain.ChangeScale(Screen.width, DesignScreenWidth);

  end;
}
{
  try
    if not Open_db_common then Application.Terminate;
  except on E: Exception do
    begin
      MessageDlg('Exception: ' + E.Message, mtInformation, [mbOK], 0);
      Application.Terminate;
    end;
  end;
}
 with DM do if not TPRIV_.Active then TPRIV_.Open;
 with DM do if not TSYS_.Active then TSYS_.Open;

{$IFNDEF TEST}
  if not Registracia then begin
    MyError(SMyAppNotRegistered);
    Application.Terminate;
  end;
  if not Prihlasenie then begin
    MyError(SMyAppInvalidLogin);
    Application.Terminate;
  end;
{$ENDIF}
  NACITAJ_FIRMY;
  if Otvorenie_firmy.Count=0 then begin
    MyError(SMyAppDataNotFound);
    Application.Terminate;
  end;
  DMA.DisableDataSources;

  Nastav_Farbu(Self);

  NX_ZAM.ActivePage:=PAGE_UDAJE;
  N.Enabled:=True;
  Akcia_zam_sucasny(nil);
  N.ActivePage:='EMPTY';
end;

procedure TFormMain.SET_ALL(Sender: TObject);
begin
  DMV.SET_ALL;
  Hint_Zmaz(Sender);
end;

procedure TFormMain.ZamestnanciClick(Sender: TObject);
begin with DMZ do begin
  DS_ZAM1.Enabled:=True;
  DS_ZGRID.Enabled:=True;
  DS_NEP.Enabled:=True;
  SYS_Operacia:='Z';
  {Akcia_zam_sucasny(Sender);}
  N.ActivePage:='ZAM1';
end;end;

{
procedure TFormMain.VyplatyClick(Sender: TObject);
begin with DMZ,DMV do begin
  DS_VYPL.Enabled:=True;
  DS_VGRID.Enabled:=True;
  DS_ZGRID.Enabled:=True;
  SYS_Operacia:='V';
  Akcia_zam_sucasny(Sender);
  N.ActivePage:='ZAMF';
end;end;
}

procedure TFormMain.Akcia_zamf_vyber(Sender: TObject);
begin with DMZ,DMV,DMP do begin
  Case SYS_Operacia Of
'Z':begin N.ActivePage:='ZAM1'; end;
'V':begin
      if TZAM_.IsEmpty then raise EMyError.Create(SMyZamNotFound);
      N.ActivePage:='VYPL1';
    end;
'P':begin
      if TZAM_.IsEmpty then raise EMyError.Create(SMyZamNotFound);
      N.ActivePage:='PPV';
    end;
'R':begin
      if TZAM_.IsEmpty then raise EMyError.Create(SMyZamNotFound);
      N.ActivePage:='RZP2003';
    end;
  End;{Case}
end;end;

procedure TFormMain.NPageChanged(Sender: TObject);
begin with DM,DMZ,DMV,DMP do begin
  SB_ZAM.HorzScrollBar.Position := 0;
  SB_ZAM.VertScrollBar.Position := 0;
  {--}
  SB_ZAM_PRAVY.Visible:=False;
  DBG_ZAM_PRAVY.Columns[0].Width:=0;
  {--}
  DisableOperacie;
  Akcia_priprav_menu(Sender);
  if N.ActivePage='EMPTY' then
  begin
    if TVYP_.State in [dsEdit,dsInsert] then TVYP_.Cancel;
    if TDET_.State in [dsEdit,dsInsert] then TDET_.Cancel;
    if TZAM_.State in [dsEdit,dsInsert] then TZAM_.Cancel;
    if TELDP_.State in [dsEdit,dsInsert] then TELDP_.Cancel;
    if TDOCH_.State in [dsEdit,dsInsert] then TDOCH_.Cancel;
    if TSET_.State in [dsEdit,dsInsert] then TSET_.Cancel;
    if TRZP_.State in [dsEdit,dsInsert] then TRZP_.Cancel;
    if THSV_.State in [dsEdit,dsInsert] then THSV_.Cancel;
    if THSU_.State in [dsEdit,dsInsert] then THSU_.Cancel;
    if TNEP_.State in [dsEdit,dsInsert] then TNEP_.Cancel;
    TNEP_.Filtered := False;
    TNEP_.MasterSource:=nil;TNEP_.IndexName:='';
    TDOCH_.MasterSource:=nil;
    TZRZ_.MasterSource:=nil;
    TDET_.MasterSource:=nil;
    TPPV_.MasterSource:=nil;
    TZUK_.MasterSource:=nil;
    DMA.DisableDataSources;
    RefreshDatabase;
    PRIEZVISKO_FILTER:='';
    Edit_zam_filter.Text := '';
    Edit_zam_filter_rc.Text := '';
    SET_FILTER(GET_FILTER(MyZamFilter,AktSidFilter));
  end
  else if Copy(N.ActivePage,1,3)='RZP' then
  begin
    {--}
    SB_ZAM_PRAVY.Visible:=True;
    DBG_ZAM_PRAVY.Columns[0].Width:=42;
    {--}
    EnableMenuItem(Operacie_rzp1);
    TRZP_.Filtered:=False;
    TRZP_.Filter:='v_rok='+IntToStr(DM.AktRok);
    TRZP_.Filtered:=True;
  end
  else if N.ActivePage='ZAMF' then
  begin
    EnableMenuItem(Operacie_zamf1);
    Edit_zam_filter.Text := '';
    Edit_zam_filter_rc.Text := '';
    Case SYS_Operacia Of
     'Z':PANEL_ZAMF.Caption:='  1.04  Zamestnanci - v˝ber zamestnanca';
     'V':PANEL_ZAMF.Caption:='  1.04  V˝platy - v˝ber zamestnanca';
     'P':PANEL_ZAMF.Caption:='  1.04  Pracovnopr·vne vzùahy - v˝ber zamestnanca';
     'R':PANEL_ZAMF.Caption:='  1.04  RoËnÈ z˙Ëtovanie preddavkov - v˝ber zamestnanca';
    End;{Case}
    Panel_hotova.Visible := SYS_Operacia = 'V';
    UpdatePanelHotova;
    DBG_zamf.SetFocus;
  end
  else if N.ActivePage='ZAM1' then
  begin
    NX_ZAM.ActivePage:=PAGE_UDAJE;
    NY_ZAM.ActivePage:=PAGE_OSOBNE;
    EnableMenuItem(Operacie_zam1);
    {Akcia_zam_vsetci(Sender);}
    SB_ZAM_PRAVY.Visible:=True;
    Edit_zam_filter.SetFocus;
  end
  else if N.ActivePage='HSV' then
  begin
    DBGrid_HSV.SetFocus;
  end
  else if N.ActivePage='DZP' then EnableMenuItem(Operacie_dzp1);

  if (N.ActivePage<>'ZAMF') and (N.ActivePage<>'ZAM1') and (N.ActivePage<>'EMPTY')
  then NASTAV_PRVY;
end;end;

procedure TFormMain.Akcia_vypl_navrat(Sender: TObject);
begin with DMV do begin
  if TVYP_.State in [dsEdit,dsInsert]
  then raise EMyError.Create(SMyAppEditMode)
  else N.ActivePage:='ZAMF';
end;end;

procedure TFormMain.Akcia_nastavenia_programu(Sender: TObject);
begin
  RunFormSetup(1);
end;

procedure TFormMain.Nastavenia_dzpClick(Sender: TObject);
begin
  DM.DS_DZP.Enabled:=True;
  N.ActivePage:='DZP';
end;

procedure TFormMain.BtnCancelClick(Sender: TObject);
begin
  N.ActivePage:='EMPTY';
end;

procedure TFormMain.Akcia_obdobie(Sender: TObject);
begin with DM do begin
  if FormObdobie=nil then Application.CreateForm(TFormObdobie, FormObdobie);
  FormObdobie.ShowModal;
  UpdateStatus;
  Akcia_zam_obnov_filter(Sender);
end;end;

procedure TFormMain.Akcia_stredisko(Sender: TObject);
begin with DM do begin
  CIS2_.Filtered:=false;
  if CIS2_.RecordCount<=1 then
  begin
    if (Sender as TMenuItem).Name='mnu_zmena_strediska'
      then MyMessage(SMyAppIbaJednoStredisko);
    TPRIV_.Edit;
    TPRIV_SID.Value:=0;
    TPRIV_.Post;
    exit;
  end;
  if FormStred=nil then Application.CreateForm(TFormStred, FormStred);
  FormStred.ShowModal;
  UpdateStatus;
end;end;

procedure TFormMain.Akcia_priprav_zam1(Sender: TObject);
begin with DMZ do begin
  if TZAM_.State in [dsEdit,dsInsert] then begin
    Zam_insert1.Enabled:=False;
    Zam_edit1.Enabled:=False;
    Zam_delete1.Enabled:=False;
    Zam_post1.Enabled:=True;
    Zam_cancel1.Enabled:=True;
    Zam_navrat1.Enabled:=False;
  end else
  begin
    Zam_insert1.Enabled:=True;
    Zam_edit1.Enabled:=True;
    Zam_delete1.Enabled:=True;
    Zam_post1.Enabled:=False;
    Zam_cancel1.Enabled:=False;
    Zam_navrat1.Enabled:=True;
  end;
end;end;

procedure TFormMain.Akcia_zam_insert(Sender: TObject);
begin
  DBN_zam1.BtnClick(nbInsert);
end;

procedure TFormMain.Akcia_zam_navrat(Sender: TObject);
begin with DMZ do begin
  if SuRozpracovaneZmeny1
  then raise EMyError.Create(SMyAppEditMode)
  else N.ActivePage:='EMPTY';
end;end;

procedure TFormMain.Akcia_priprav_dzp(Sender: TObject);
begin with DM do begin
  if TDZP_.State in [dsEdit,dsInsert] then begin
    dzp_insert1.Enabled:=False;
    dzp_edit1.Enabled:=False;
    dzp_delete1.Enabled:=False;
    dzp_post1.Enabled:=True;
    dzp_cancel1.Enabled:=True;
    dzp_navrat1.Enabled:=False;
    butt_dzp_navrat1.Enabled:=False;
  end else
  begin
    dzp_insert1.Enabled:=True;
    dzp_edit1.Enabled:=True;
    dzp_delete1.Enabled:=True;
    dzp_post1.Enabled:=False;
    dzp_cancel1.Enabled:=False;
    dzp_navrat1.Enabled:=True;
    butt_dzp_navrat1.Enabled:=True;
  end;
end;end;

procedure TFormMain.Akcia_dzp_insert(Sender: TObject);
begin
  DBN_dzp.BtnClick(nbInsert);
end;

procedure TFormMain.Akcia_dzp_edit(Sender: TObject);
begin
  DBN_dzp.BtnClick(nbEdit);
end;

procedure TFormMain.Akcia_dzp_delete(Sender: TObject);
begin
  DBN_dzp.BtnClick(nbDelete);
end;

procedure TFormMain.Akcia_dzp_post(Sender: TObject);
begin
  DBN_dzp.BtnClick(nbPost);
end;

procedure TFormMain.Akcia_dzp_cancel(Sender: TObject);
begin
  DBN_dzp.BtnClick(nbCancel);
end;

procedure TFormMain.DBN_priprav_dzp(Sender: TObject;
  Button: TNavigateBtn);
begin
  Akcia_priprav_dzp(Sender);
end;

procedure TFormMain.Akcia_dzp_navrat(Sender: TObject);
begin with DM do begin
  if TDZP_.State in [dsEdit,dsInsert]
  then raise EMyError.Create(SMyAppEditMode)
  else N.ActivePage:='EMPTY';
end;end;

procedure TFormMain.Akcia_navrat(Sender: TObject);
begin
  N.ActivePage:='EMPTY';
end;

procedure TFormMain.DBN_zam2Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  Akcia_priprav_zam1(Sender);
end;

procedure TFormMain.Akcia_zam_edit(Sender: TObject);
begin
  DBN_zam2.BtnClick(nbEdit);
end;

procedure TFormMain.Akcia_zam_delete(Sender: TObject);
begin
  DBN_zam1.BtnClick(nbDelete);
end;

procedure TFormMain.Akcia_zam_post(Sender: TObject);
begin
  DBN_zam2.BtnClick(nbPost);
end;

procedure TFormMain.Akcia_zam_cancel(Sender: TObject);
begin
  DBN_zam2.BtnClick(nbCancel);
end;

procedure TFormMain.DBG_zamfKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key)=13 then Akcia_zamf_vyber(Sender);
end;

procedure TFormMain.Akcia_parametre_firmy(Sender: TObject);
begin
  RunFormInf;
end;

procedure TFormMain.Akcia_firma_navrat(Sender: TObject);
begin with DM do begin
  if TINF_.State in [dsEdit,dsInsert]
  then raise EMyError.Create(SMyAppEditMode)
  else begin Menu_maly_velky_zavod; N.ActivePage:='EMPTY'; end;
end;end;

procedure TFormMain.Akcia_priprav_menu(Sender: TObject);
begin with DM do begin
  if N.ActivePage = 'EMPTY' then
  begin
    if TINF_.State in [dsInactive] then
    begin
      ZAZNI_MENU(False);
      System.Enabled:=True;
    end
    else ZAZNI_MENU(True);
  end
    else ZAZNI_MENU(False);
end;end;

procedure TFormMain.Akcia_system_koniec(Sender: TObject);
begin
  if MyOtazka(SMyAppTerminate) then Application.Terminate;
end;

procedure TFormMain.Akcia_zatvorenie_db(Sender: TObject);
begin
  MyDB_CloseAll;
end;

procedure TFormMain.Akcia_otvorenie_db(Sender: TObject);
var s:string;DBOK:boolean;rok:integer;
begin with DM,DMZ,DMV,DMP do begin
  Akcia_zatvorenie_db(Sender);
  s:=Format('%.2d',[TMenuItem(Sender).Tag]);
  rok:=StrToInt(TMenuItem(Sender).Caption);
  DBTables.Session.Close;
  DBTables.Session.DeleteAlias(Alias_Private);
  DBTables.Session.AddStandardAlias(Alias_Private,MyPrivPth,'PARADOX');
  DBTables.Session.AddPassword(MyPassword(MyDbPassword));
  MyDataDir  := 'DATA'+s;
  if MyVerziaEuro=0 then begin
    if rok<=2004 then begin
      MyCommPth  := MyNetPath+'COMMON\ROK2004\';
      MyDataPth  := MyNetPath+'DATA'+s+'\'; // '\ROK2004\';
      MyDatxPth  := MyDataPth;
    end else begin
      MyCommPth  := MyNetPath+'COMMON\ROK'+IntToStr(rok)+'\';
      MyDataPth  := MyNetPath+'DATA'+s+'\'; // '\ROK'+IntToStr(rok)+'\';
      MyDatxPth  := MyNetPath+'DATA'+s+'\'; //'\ROK'+IntToStr(rok-1)+'\';
    end;
  end else begin
    if rok<=2004 then begin
      MyCommPth  := MyNetPath+'COMMON\ROK2004\';
      MyDataPth  := MyNetPath+'DATA'+s+'\DATASK\'; // '\ROK2004\';
      MyDatxPth  := MyDataPth;
    end else if rok=2009 then begin
      MyCommPth  := MyNetPath+'COMMON\ROK'+IntToStr(rok)+'\';
      MyDataPth  := MyNetPath+'DATA'+s+'\'; // '\ROK'+IntToStr(rok)+'\';
      MyDatxPth  := MyNetPath+'DATA'+s+'\DATASK\'; //'\ROK'+IntToStr(rok-1)+'\';
    end else if rok>2009 then begin
      MyCommPth  := MyNetPath+'COMMON\ROK'+IntToStr(rok)+'\';
      MyDataPth  := MyNetPath+'DATA'+s+'\'; // '\ROK'+IntToStr(rok)+'\';
      MyDatxPth  := MyNetPath+'DATA'+s+'\'; //'\ROK'+IntToStr(rok-1)+'\';
    end else begin
      MyCommPth  := MyNetPath+'COMMON\ROK'+IntToStr(rok)+'\';
      MyDataPth  := MyNetPath+'DATA'+s+'\DATASK\'; // '\ROK'+IntToStr(rok)+'\';
      MyDatxPth  := MyNetPath+'DATA'+s+'\DATASK\'; //'\ROK'+IntToStr(rok-1)+'\';
    end;
  end;
  MyDataSkk     := MyNetPath+'DATA'+s+'\DATASK\';
  if (not (  FileExists(MyDataSkk+'zam.db') and
             FileExists(MyDataSkk+'vyp.db')
          )
      )
  then MyDataSkk := '';
  MyRepPath1    := MyNetPath + MenoRepDir + '\' + MyDataDir + '\'+IntToStr(rok)+'\';
  MyMailPath    := MyRepPath1 + 'outbox\';
  MyBlatIniFile := TIniFile.Create(MyDataPth+'conf\blat.ini');
  NACITAJ_BLAT;
  ForceDirectories(MyRepPath1);
  ForceDirectories(MyMailPath);
  DBTables.Session.DeleteAlias(Alias_Data);
  DBTables.Session.AddStandardAlias(Alias_Data,MyDataPth,'PARADOX');
  DBTables.Session.DeleteAlias(Alias_Datx);
  DBTables.Session.AddStandardAlias(Alias_Datx,MyDatxPth,'PARADOX');
  DBTables.Session.DeleteAlias(Alias_Dskk);
  DBTables.Session.AddStandardAlias(Alias_Dskk,MyDataSkk,'PARADOX');
  DBTables.Session.DeleteAlias(Alias_Common);
  DBTables.Session.AddStandardAlias(Alias_Common,MyCommPth,'PARADOX');
  DBTables.Session.Open;
  if not TPRIV_.Active then begin
    TPRIV_.Open;
    TPRIV_.Edit;
    TPRIV_Rok.Value:= rok;
    TPRIV_.Post;
  end;
  DBOK:=MyDB_Open('');
  if DBOK then SpecialneCinnosti;
  if not DBOK then Akcia_zatvorenie_db(Sender);

  CIS10_.First;
  while not CIS10_.EOF do begin
    if CIS10_TYP.Value >= 0 then begin
      slTypZecPopis[CIS10_TYP.Value] := CIS10_CALC_POPIS.Value;
      slTypZecCode[CIS10_TYP.Value] := CIS10_POPIS.Value;
    end;
    CIS10_.Next;
  end;

  if AktObdobie >= ZAKON_2005_01
   then mnu_cis_pd1.Visible:=false
    else mnu_cis_pd1.Visible:=true;
  if AktObdobie >= ZAKON_2004_01
   then mnu_ppv_dpc.Visible:=false
    else mnu_ppv_dpc.Visible:=true;
  OTVORENA_FIRMA := TMenuItem(Sender).Tag;
  Akcia_priprav_menu(Sender);
  UpdateStatus;
  if DBOK then begin
    Menu_maly_velky_zavod;
    Akcia_stredisko(Sender);
    Akcia_obdobie(Sender);
    NacitajParametre(DM.AktRok,DM.AktMesiac);
    if DM.AktRok=2005 then begin
      if DM.AktMesiac<=8
        then PARAMETRE[28].Hodnota:=400
        else PARAMETRE[28].Hodnota:=450;
    end else
    if DM.AktRok=2007 then begin
      if DM.AktMesiac<=6
        then PARAMETRE[28].Hodnota:=540
        else PARAMETRE[28].Hodnota:=555;
    end;
  end;
  if DM.AktRok < 2006 then begin
    PAGE_ZP.Visible := False;
    PAGE_ZP.TabVisible:=False;
  end else begin
    //PAGE_ZP.Visible := True;
    PAGE_ZP.TabVisible:=True;
    PAGE_ZP_DOKLAD.Caption := 'Doklad o preddavkoch za rok '+IntToStr(DM.AktRok-1);
  end;
end;end;

procedure TFormMain.Akcia_ppv_navrat(Sender: TObject);
begin with DMP do begin
  if TPPV_.State in [dsEdit,dsInsert]
    then raise EMyError.Create(SMyAppEditMode)
    else N.ActivePage:='ZAMF';
end;end;

procedure TFormMain.Akcia_priprav_ppv1(Sender: TObject);
begin with DMP do begin
  if TPPV_.State in [dsEdit,dsInsert] then begin
    Ppv_insert1.Enabled:=False;
    Ppv_edit1.Enabled:=False;
    Ppv_delete1.Enabled:=False;
    Ppv_post1.Enabled:=True;
    Ppv_cancel1.Enabled:=True;
  end else
  begin
    Ppv_insert1.Enabled:=True;
    Ppv_edit1.Enabled:=True;
    Ppv_delete1.Enabled:=True;
    Ppv_post1.Enabled:=False;
    Ppv_cancel1.Enabled:=False;
  end;
end;end;

procedure TFormMain.Akcia_ppv_insert(Sender: TObject);
begin with DMP do begin
  TPPV_.Insert;
  TPPV_TYP.Value :=TMenuItem(Sender).Tag+10;
  case TPPV_TYP.Value Of
      0,10:PC_PPV.ActivePage:=PAGE_PPV_ZML;
      1,11:PC_PPV.ActivePage:=PAGE_PPV_DVP;
      2,12:PC_PPV.ActivePage:=PAGE_PPV_DPC;
      3,13:PC_PPV.ActivePage:=PAGE_PPV_DBPS;
        14:PC_PPV.ActivePage:=PAGE_PPV_ZMLD
      else PC_PPV.ActivePage:=PAGE_PPV_EMPTY;
  end;
end;end;

procedure TFormMain.Akcia_ppv_edit(Sender: TObject);
begin
  DBN_ppv2.BtnClick(nbEdit);
end;

procedure TFormMain.Akcia_ppv_delete(Sender: TObject);
begin
  DBN_ppv1.BtnClick(nbDelete);
end;

procedure TFormMain.Akcia_ppv_post(Sender: TObject);
begin
  DBN_ppv2.BtnClick(nbPost);
end;

procedure TFormMain.Akcia_ppv_cancel(Sender: TObject);
begin
  DBN_ppv2.BtnClick(nbCancel);
end;

procedure TFormMain.VztahyClick(Sender: TObject);
begin with DMZ,DMP do begin
  DS_ZGRID.Enabled:=True;
  DS_PPV.Enabled:=True;
  DS_PGRID.Enabled:=True;
  SYS_Operacia:='P';
  Akcia_zam_sucasny(Sender);
  N.ActivePage:='ZAMF';
end;end;

procedure TFormMain.DBN_ppv_OnClick(Sender: TObject; Button: TNavigateBtn);
begin
  Akcia_priprav_ppv1(Sender);
end;

procedure TFormMain.ZuctovanieClick(Sender: TObject);
begin with DM,DMZ,DMV do begin
  DS_ZGRID.Enabled:=True;
  DS_RZP.Enabled:=True;
  DS_RGRID.Enabled:=True;
  SYS_Operacia:='R';
  Akcia_zam_platni_vroku(Sender);
  if AktRok < 2004 then begin
    N.ActivePage:='RZP2003';
  end
  else if AktRok < 2005 then begin
    N.ActivePage:='RZP2004';
  end
  else if AktRok < 2007 then begin
    N.ActivePage:='RZP2005';
  end
  else if AktRok < 2009 then begin
    N.ActivePage:='RZP2007';
  end
  else if AktRok < 2011 then begin
    N.ActivePage:='RZP2009';
  end
  else if AktRok < 2012 then begin
    N.ActivePage:='RZP2011';
  end
  else if AktRok < 2014 then begin
    N.ActivePage:='RZP2012';
  end
  else if AktRok >= 2014 then begin
    N.ActivePage:='RZP2014';
  end;
end;end;

procedure TFormMain.SET_RZP(Sender: TObject);
begin
  DMV.SET_RZP;
end;

procedure TFormMain.Akcia_rzp_insert(Sender: TObject);
begin
  DBN_rzp1.BtnClick(nbInsert);
end;

procedure TFormMain.Akcia_rzp_edit(Sender: TObject);
begin
  DBN_rzp2.BtnClick(nbEdit);
end;

procedure TFormMain.Akcia_rzp_delete(Sender: TObject);
begin
  DBN_rzp1.BtnClick(nbDelete);
end;

procedure TFormMain.Akcia_rzp_post(Sender: TObject);
begin
  DBN_rzp2.BtnClick(nbPost);
end;

procedure TFormMain.Akcia_rzp_cancel(Sender: TObject);
begin
  DBN_rzp2.BtnClick(nbCancel);
end;

procedure TFormMain.Akcia_priprav_rzp(Sender: TObject);
begin with DMV do begin
  if TRZP_.State in [dsEdit,dsInsert] then begin
    Rzp_insert1.Enabled:=False;
    Rzp_edit1.Enabled:=False;
    Rzp_delete1.Enabled:=False;
    Rzp_post1.Enabled:=True;
    Rzp_cancel1.Enabled:=True;
    Rzp_navrat1.Enabled:=False;
  end else
  begin
    Rzp_insert1.Enabled:=True;
    Rzp_edit1.Enabled:=True;
    Rzp_delete1.Enabled:=True;
    Rzp_post1.Enabled:=False;
    Rzp_cancel1.Enabled:=False;
    Rzp_navrat1.Enabled:=True;
  end;
end;end;

procedure TFormMain.DBN_RZPOnClick(Sender: TObject; Button: TNavigateBtn);
begin
  Akcia_priprav_rzp(Sender);
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MyOtazka(SMyAppTerminate)
   then begin   DMA.DisableDataSources;
                Action := caFree;
        end        
   else Action := caNone;
end;

procedure TFormMain.DBN_ppv2BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin with DMP do begin
  if (Button=nbEdit) AND (TPPV_.EOF) THEN
  raise EMyError.Create(SMyAppCannotEdit);
end;end;

procedure TFormMain.ShowReportFZ1(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='FZ1';
  RunReport(X);
end;

procedure TFormMain.ShowReportML(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ML';
  RunReport(X);
end;

procedure TFormMain.ShowReportPP1(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='PP';
  RunReport(X);
end;

procedure TFormMain.ShowReportPZ(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='PZ';
  RunReport(X);
end;

procedure TFormMain.ShowReportSP(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='SP';
  RunReport(X);
end;

procedure TFormMain.ShowReportVP(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='VP';
  RunReport(X);
end;

procedure TFormMain.ShowReportVP1(Sender: TObject);
begin with DMV do if TVYP_.State = dsBrowse then begin
  DM.NaplnMyReportParam(X);
  X.Silent:=True;
  X.Code_emp1:=DMV.TVYP_Code_emp.Value;
  X.Code_emp2:=DMV.TVYP_Code_emp.Value;
  X.AktObdobie:=DMV.TVYP_V_obdobie.Value;
  X.Typ:='VP';
  RunReport(X);
end;end;

procedure TFormMain.ShowReportZP(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ZP';
  RunReport(X);
end;

procedure TFormMain.ShowReportFZ2(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='FZ2';
  RunReport(X);
end;

procedure TFormMain.ShowReportRZ2004A(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='RZ';
  RunReport(X);
end;

procedure TFormMain.Show1ReportRZ2004A(Sender: TObject);
begin with DMV do begin
  if TRZP_.State in [dsEdit,dsInsert] then raise EMyError.Create(SMyAppEditMode);
  DM.NaplnMyReportParam(X);
  X.Code_emp1:=TRZP_Code_emp.Value;
  X.Code_emp2:=TRZP_Code_emp.Value;
  X.AktObdobie:=TRZP_V_Rok.Value*100+12;
  X.Typ:='RZ';
  RunReport(X);
end;end;

procedure TFormMain.Z_ShowReportML(Sender: TObject);
begin with DM,DMZ do begin
  if TZAM_.State in [dsEdit,dsInsert] then raise EMyError.Create(SMyAppEditMode);
  DM.NaplnMyReportParam(X);
  X.Code_emp1:=TZAM_Code_emp.Value;
  X.Code_emp2:=TZAM_Code_emp.Value;
  X.Silent:=True;
  X.Typ:='ML';
  RunReport(X);
end;end;

procedure TFormMain.Z_ShowReportPP(Sender: TObject);
begin with DM,DMZ do begin
  if TZAM_.State in [dsEdit,dsInsert] then raise EMyError.Create(SMyAppEditMode);
  DM.NaplnMyReportParam(X);
  X.Code_emp1:=TZAM_Code_emp.Value;
  X.Code_emp2:=TZAM_Code_emp.Value;
  X.Silent:=True;
  X.Typ:='PP2';
  RunReport(X);
end;end;

procedure TFormMain.Z_ShowReportPZ(Sender: TObject);
begin with DM,DMZ do begin
  if TZAM_.State in [dsEdit,dsInsert] then raise EMyError.Create(SMyAppEditMode);
  DM.NaplnMyReportParam(X);
  X.Code_emp1:=TZAM_Code_emp.Value;
  X.Code_emp2:=TZAM_Code_emp.Value;
  X.JedenPracovnik := True;
  X.Silent:=False;
  X.Typ:='PZ';
  RunReport(X);
end;end;

procedure TFormMain.Z_ShowReportRZ(Sender: TObject);
begin with DM,DMZ do begin
  if TZAM_.State in [dsEdit,dsInsert] then raise EMyError.Create(SMyAppEditMode);
  DM.NaplnMyReportParam(X);
  X.Code_emp1:=TZAM_Code_emp.Value;
  X.Code_emp2:=TZAM_Code_emp.Value;
  X.JedenPracovnik := True;
  X.Silent:=True;
  X.Typ:='RZ';
  RunReport(X);
end;end;

procedure TFormMain.ShowReportVL(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='VL';
  RunReport(X);
end;

procedure TFormMain.ShowReportVL2(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='VL2';
  RunReport(X);
end;

procedure TFormMain.ShowReportVL3(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Obdobie1:=DM.AktObdobie;
  X.Obdobie2:=DM.AktObdobie;
  X.Typ:='VL3';
  RunReport(X);
end;

procedure TFormMain.ShowReportHP_230(Sender: TObject);
begin
  FormHP1:=TFormHP1.Create(Application);
  try
  FormHP1.ShowModal;
  finally
  FormHP1.Free;
  end;
end;

procedure TFormMain.ShowReportHP_220(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='HP';
  RunReport(X);
end;

procedure TFormMain.ShowReportPPV(Sender: TObject);
begin with DMP do begin
  if TPPV_.State in [dsEdit,dsInsert] then raise EMyError.Create(SMyAppEditMode);
  DM.NaplnMyReportParam(X);
  X.Silent := True;
  X.PID := TPPV_PID.Value;
  case TPPV_TYP.Value of
    0:X.Typ:='ZML';
    1:X.Typ:='DVP';
    2:X.Typ:='DPC';
   10:X.Typ:='ZML2';
   11:X.Typ:='DVP2';
   12:X.Typ:='DPC2';
   13:X.Typ:='DBPS';
   14:X.Typ:='ZMLD';
  else exit;
  end;
  RunReport(X);
end;end;

procedure TFormMain.ShowReportPOI(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='POI';
  RunReport(X);
end;

procedure TFormMain.ShowReportDOV(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='DOV';
  RunReport(X);
end;

function  TFormMain.Open_db_common:boolean;
begin with DM do begin
  Result:=MyDB_Open('PAM98_COMM');

end;end;

function TFormMain.Registracia:boolean;
var regver,regver1,regver2: string;
  function GetRegKey:string;
  begin with DM do begin
    Result:=
       'Software\'+
       TSYS_COMPANY_NAME.Value + '\' +
       TSYS_PRODUCT_NAME.Value + '\' +
       Copy(TSYS_REG_KEY.Value,1,11);
  end;end;

  function Kontrola: boolean;
  begin with DM do begin
    Result:=false;
    if TSYS_VOLUME_SN.Value <> GetVolumeSerialNumber then exit;
    if TSYS_DUMMY_KEY.Value <> RegGetStr(GetRegKey,'DUMMY_KEY','') then exit;
    Result:=true;
  end;end;

begin with DM do begin
{Kod na odstavenie registracie - START}
if NOT TSYS_REGISTERED.Value then begin
  TSYS_.Edit;
  TSYS_REGISTERED.Value  := True;
  TSYS_POCET_ZAM.AsInteger := 0;
  TSYS_POCET_FIRIEM.AsInteger := 99;
  TSYS_.Post;
end;
Result:=true;
exit;
{Kod na odstavenie registracie - END}

  Result:=false;
  if TSYS_PRODUCT_NAME.Value<>MyProductName then
  begin
      TSYS_.Edit;
      TSYS_REGISTERED.Value  := False;
      TSYS_PRODUCT_NAME.Value := MyProductName;
      TSYS_REG_KEY.AsString := '';
      TSYS_VOLUME_SN.AsString := '';
      TSYS_DUMMY_KEY.AsString := '';
      TSYS_POCET_ZAM.AsInteger := 5;
      TSYS_POCET_FIRIEM.AsInteger := 1;
      TSYS_.Post;
  end;
  if not TSYS_REGISTERED.Value then
  begin
    if (TSYS_REG_KEY.Value = '') or (length(TSYS_REG_KEY.Value)<26) then
    begin
      TSYS_.Edit;
      TSYS_VOLUME_SN.Value := GetVolumeSerialNumber;
      TSYS_REG_KEY.Value   := GenerateKey+'-'+StrReplaceX(MyVerziaNum,'.','')+'-'+Copy(TSYS_VOLUME_SN.Value,1,4)+'-DEMO';
      TSYS_DUMMY_KEY.Value := GenerateKey;
      RegSetStr (GetRegKey,'DUMMY_KEY',TSYS_DUMMY_KEY.Value);
      TSYS_.Post;
    end;
    if not Kontrola then exit;
    FormAbout.Hide;

    FormReg:=TFormReg.Create(Application);
    FormReg.Reg_Key.Text := TSYS_REG_KEY.Value;
    regver := GetVersionFromRegKey (TSYS_REG_KEY.Value);
    regver1 := Copy(regver,1,3);
    regver2 := Copy(regver,5,2);
    if regver = 'DEMO' then begin
      FormReg.RG1.ItemIndex := 0;
      FormReg.RG2.ItemIndex := 0;
    end
    else begin
      if regver1 = 'EXT' then FormReg.RG1.ItemIndex := 1
      else FormReg.RG1.ItemIndex := 0;
      if regver2 = '50' then FormReg.RG2.ItemIndex := 2
      else if regver2 = '20' then FormReg.RG2.ItemIndex := 1
      else if regver2 = 'MA' then FormReg.RG2.ItemIndex := 3
      else FormReg.RG2.ItemIndex := 0;
    end;
    FormReg.ShowModal;
    Result:=FormReg.RegResult;
    if Result then
    begin
      TSYS_.Edit;
      TSYS_REG_KEY.Value := FormReg.Reg_Key.Text;
      TSYS_.Post;
      if SysTest = 1 then begin
        MyVerziaMenu := 'EXT';
        EXIT;
      end
      else if FormReg.RegDemo then begin
        MyVerziaMenu := 'STA';
        EXIT;
      end
      else MyVerziaMenu := Copy(GetVersionFromRegKey(TSYS_REG_KEY.Value),1,3);
      TSYS_.Edit;
      TSYS_Registered.Value := True;
      TSYS_Pocet_zam.Value := FormReg.RegPocZam;
      TSYS_Pocet_firiem.Value := FormReg.RegPocFir;
      TSYS_.Post;
    end;
    FormReg.Destroy;
  end
    else
  begin
    if not Kontrola then exit;
      if SysTest = 1 then begin
        MyVerziaMenu := 'EXT';
      end
    else MyVerziaMenu := Copy(GetVersionFromRegKey(TSYS_REG_KEY.Value),1,3);
    Result:=True;
  end;
end;end;


function TFormMain.Prihlasenie:boolean;
begin
  Result:=False;
  try
   FormHeslo:=TFormHeslo.Create(Application);
   FormHeslo.ShowModal;
   Result:=FormHeslo.HesloResult;
   FormHeslo.Destroy;
  except end;
end;

procedure TFormMain.mnu_cis_zp1Click(Sender: TObject);
begin
  try FormCis:=TFormCis.Create(Application);
  FormCis.Startup(' 3.03 »ÌselnÌk zdravotn˝ch poisùovnÌ',DM.CIS1_);
  except end;
  FormCis.Free;
end;

procedure TFormMain.HSVClick(Sender: TObject);
begin
 Akcia_obdobie(Sender);
 Screen.Cursor:=crHourGlass;
 try
 DMV.PRIPRAV_HSV;
 DBGRID_HSV.Columns[16].Title.Caption := 'P-'+DM.TINF_F_PRIPLAT1_TEXT.Value;
 DBGRID_HSV.Columns[17].Title.Caption := 'P-'+DM.TINF_F_PRIPLAT2_TEXT.Value;
 DBGRID_HSV.Columns[18].Title.Caption := 'P-'+DM.TINF_F_PRIPLAT3_TEXT.Value;
 DBGRID_HSV.Columns[19].Title.Caption := 'P-'+DM.TINF_F_PRIPLAT4_TEXT.Value;
 DBGRID_HSV.Columns[20].Title.Caption := 'P-'+DM.TINF_F_PRIPLAT5_TEXT.Value;
 finally
 Screen.Cursor:=crDefault;
 end;
 N.ActivePage:='HSV';
end;

procedure TFormMain.Akcia_zam_zoradit1(Sender: TObject);
begin with DMZ do begin
  if not (TZAM_.State in [dsInsert,dsEdit])
   then TZAM_.IndexName:='ZAM1';
end;end;

procedure TFormMain.Akcia_zam_zoradit2(Sender: TObject);
begin with DMZ do begin
  if not (TZAM_.State in [dsInsert,dsEdit])
   then TZAM_.IndexName:='';
end;end;

procedure TFormMain.Akcia_zam_sucasny(Sender: TObject);
begin with DM,DMZ do begin
   MyZamFilter:='S';
   mnu_zobr_s.Checked := True;
   SET_FILTER(GET_FILTER(MyZamFilter,AktSidFilter));
{   SET_FILTER('(Vystup=null or Vystup>='''+DateToStr(EncodeDate(AktRok,AktMesiac,1))+''') and '
               +'Nastup<='''+DateToStr(LastDayDate(AktRok,AktMesiac,31))+''' and '+AktSidFilter);
}
end;end;

procedure TFormMain.Akcia_zam_vyradeny(Sender: TObject);
begin with DM,DMZ do begin
   MyZamFilter:='V';
   mnu_zobr_v.Checked := True;
   SET_FILTER(GET_FILTER(MyZamFilter,AktSidFilter));
 {
   SET_FILTER('(Vystup<>null and Vystup<'''+DateToStr(EncodeDate(AktRok,AktMesiac,1))+''') and '
               +'Nastup<='''+DateToStr(LastDayDate(AktRok,AktMesiac,31))+''' and '+AktSidFilter);
 }
end;end;

procedure TFormMain.Akcia_zam_vsetci(Sender: TObject);
begin with DM,DMZ do begin
   MyZamFilter:='A';
   mnu_zobr_a.Checked := True;
   SET_FILTER(GET_FILTER(MyZamFilter,AktSidFilter));
end;end;

procedure TFormMain.Akcia_zam_obnov_filter(Sender: TObject);
begin
 case MyZamFilter of
  'S': Akcia_zam_sucasny(Sender);
  'V': Akcia_zam_vyradeny(Sender);
  'A': Akcia_zam_vsetci(Sender);
  else Akcia_zam_sucasny(Sender);
 end;
end;

procedure TFormMain.Btn_Uctuj_HsvClick(Sender: TObject);
begin with DMV do begin
  if NOT MyOtazka(Format(SMyHsvOtazkaSpustit,[DM.AktObdobieStr(true)]))
    then exit;
  if THSV_.State in [dsEdit,dsInsert] then THSV_.Post;
  Btn_Uctuj_Hsv.Enabled:=False;
  Screen.Cursor:=crHourGlass;
  try DMV.ZAUCTUJ_HSV;
  finally
  Screen.Cursor:=crDefault;
  Btn_Uctuj_Hsv.Enabled:=True;
  DBGrid_HSV.SetFocus;
  MyMessage(Format(SMyHsvPocetZauctovanych,[DMV.POCET_HSV]));
  end;
end;end;

procedure TFormMain.Akcia_hsv_navrat(Sender: TObject);
begin
  if MyOtazka(SMyHsvOtazkaUkoncit)
   then N.ActivePage:='EMPTY';
end;

procedure TFormMain.FormActivate(Sender: TObject);
begin
  if SYS_START then
  begin
    SYS_START:=False;
{    if Otvorenie_firmy.Count=1 then begin
      Akcia_otvorenie_db(Otvorenie_firmy.Items[0]);
    end;}
    FormMenuPomoc.CreatemenuPomoc(MainMenu1);
  end;
  StatusBar1.Visible:=True;
end;

procedure TFormMain.mnu_cis_vm1Click(Sender: TObject);
begin
  DM.CIS2_.Filtered := False;
  try FormCis:=TFormCis.Create(Application);
  FormCis.Startup(' 3.02 »ÌselnÌk stredÌsk',DM.CIS2_);
  except end;
  FormCis.Free;
end;

procedure TFormMain.mnu_cis_pd1Click(Sender: TObject);
begin
  DM.CIS3_.Filtered := False;
  try FormCis:=TFormCis.Create(Application);
  FormCis.Startup(' 3.04 »ÌselnÌk v˝öky prÌspevkov k prÌdavkom na deti',DM.CIS3_);
  except end;
  FormCis.Free;
end;

procedure TFormMain.mnu_cis_par1Click(Sender: TObject);
begin
  DM.CIS0_.Close;
  DM.CIS0_.TableName:=MyCisPar(DM.AktRok);
  DM.CIS0_.Open;
  try FormCis:=TFormCis.Create(Application);
  FormCis.Startup(' 3.01 »ÌselnÌk parametrov programu',DM.CIS0_);
  except end;
  FormCis.Free;
  NacitajParametre(DM.AktRok,DM.AktMesiac);
end;

procedure TFormMain.Menu_maly_velky_zavod;
begin with DM do begin
  if not AktVelkyZavod then begin
    mnu_zmena_strediska.enabled := true;
    mnu_cis_vm1.enabled := true;
    tlac_sp1.visible:=true;
    tlac_spv1.visible:=false;
  end
  else begin
    mnu_zmena_strediska.enabled := true;
    mnu_cis_vm1.enabled := true;
    tlac_sp1.visible:=false;
    tlac_spv1.visible:=true;
  end;
end;end;

procedure TFormMain.mnu_xenon1Click(Sender: TObject);
begin
  Export_Xenon98;
end;

procedure TFormMain.RefreshDatabase;
var i:integer;
begin with DBTables.Session.Databases[0] do begin
  for I := 0 to DataSetCount - 1 do
   if DataSets[I] is TTable then
    DataSets[I].FlushBuffers;
end;end;

procedure TFormMain.Hint_zobraz(Sender: TObject);
begin
  if (Sender as TWinControl).Hint = '%SMyAppHintPoistenie'
    then StatusBar1.Panels[1].Text:= SMyAppHintPoistenie
  else if (Sender as TWinControl).Hint = '%SMyAppHintPoistenie2'
    then StatusBar1.Panels[1].Text:= SMyAppHintPoistenie2
  else StatusBar1.Panels[1].Text:=(Sender as TWinControl).Hint;
end;

procedure TFormMain.Hint_zmaz(Sender: TObject);
begin
  StatusBar1.Panels[1].Text:='';
end;

procedure TFormMain.ShowReportNZ(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='NZ';
  RunReport(X);
end;

procedure TFormMain.ShowReportVL3_rok(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Obdobie1:=DM.AktRok*100+1;
  X.Obdobie2:=DM.AktRok*100+12;
  X.Typ:='VL3';
  RunReport(X);
end;

procedure TFormMain.ShowReportZL(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ZL';
  RunReport(X);
end;

procedure TFormMain.mnu_cis_bu1Click(Sender: TObject);
begin
  DM.CIS4_.Filtered := False;
  try FormCis:=TFormCis.Create(Application);
  FormCis.Startup(' 3.05 »ÌselnÌk bankov˝ch ˙Ëtov',DM.CIS4_);
  DM.QDDP_.Close;
  DM.QDDP_.Open;
  DMZ.TZAM_.Refresh;
  except end;
  FormCis.Free;
end;

procedure TFormMain.ShowReportEN(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='EN';
  RunReport(X);
end;

procedure TFormMain.ShowReportML2(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ML2';
  RunReport(X);
end;

procedure TFormMain.Z_ShowReportML2(Sender: TObject);
begin with DMZ do begin
  DM.NaplnMyReportParam(X);
  X.Code_emp1:=TZAM_Code_emp.Value;
  X.Code_emp2:=TZAM_Code_emp.Value;
  X.Typ:='ML2';
  RunReport(X);
end;end;

procedure TFormMain.Akcia_system_koniec_reg(Sender: TObject);
begin with DM do begin
  if not TSYS_Registered.Value then
    raise EMyError.Create(SMyAppRegistraciaNejdeZrusit);
  if not MyOtazka(SMyAppOtazkaZrusitRegistraciu) then exit;
  if not MyOtazka(Format(SMyAppOtazkaNaozajZrusit,['registr·ciu programu'])) then exit;
  TSYS_.Edit;
  TSYS_Registered.Value:=False;
  TSYS_Reg_key.Value:='';
  TSYS_Dummy_key.Value:='';
  TSYS_Pocet_zam.Value:=5;
  TSYS_Pocet_firiem.Value:=1;
  TSYS_.Post;
  MyMessage(SMyAppRegistraciaZrusena);
  Application.Terminate;
end;end;

procedure TFormMain.akcia_pridanie_firmy(Sender: TObject);
var i:integer;s:string;SearchRec:TSearchRec;Found:integer;uspech:boolean;
begin with DM do begin
  if not MyOtazka(SMyAppZalozitNovuFirmu) then exit;
{
  if FormNovaFirma=nil then Application.CreateForm(TFormNovaFirma, FormNovaFirma);
  FormNovaFirma.ShowModal;
  if not(FormNovaFirma.ok) then exit;
}
  if TSYS_POCET_FIRIEM.value=1 then
   raise EMyError.Create(SMyAppIbaMultiverzia);
  uspech:=false;
  for i:=1 to TSYS_POCET_FIRIEM.Value do
  begin
    s:=Format('%.2d',[i]);
    MyDataPth := MyNetPath+'DATA'+s;
    if NOT DirectoryExists(MyDataPth) then begin
      CreateDir(MyDataPth);
{      try
      Chdir(MyDataPth);
      rr:=StrToInt(FormNovaFirma.CB_Rok.Text);
      MyDataPth := MyDataPth + '\' + MyAdrRok(rr);
      if NOT DirectoryExists(MyDataPth) then CreateDir(MyDataPth);
      MyDataPth:=MyDataPth+'\';
      finally
      Chdir(MyAppPath);
      end;
}
      {--}
      Found := FindFirst(MyNetPath+'DATA\*.*', faAnyFile, SearchRec);
      while Found = 0 do
      begin
        if SearchRec.Attr and faDirectory = 0 then
          CopyFile(MyNetPath+'DATA\'+Searchrec.Name,MyDataPth);
        if Uppercase(SearchRec.Name)='INF.DB' then uspech:=true;
        Found := FindNext(SearchRec);
      end;
      FindClose(SearchRec);
{      if FormNovaFirma.Edit_nazov.Text='' then FormNovaFirma.Edit_nazov.Text := 'BEZ MENA';
      TPOM_.TableName:=MyDataPth+'inf.db';
      TPOM_.Open;
      TPOM_.Edit;
      TPOM_.FieldByName('Nazov').Value := NVL(FormNovaFirma.Edit_nazov.Text);
      TPOM_.Post;
      TPOM_.Close;
}
      NACITAJ_FIRMY;
      if uspech
       then MyMessage(Format(SMyApppridanieFirmyUspech,[i]))
        else raise EMyError.Create(SMyApppridanieFirmyNeuspech);
      exit;
    end;
  end;
  raise EMyError.Create(SMyApppridanieFirmyNeuspech);
end;end;

procedure TFormMain.akcia_zrusenie_firmy(Sender: TObject);
var cesta,cesta_pre_zmazany:string;u:boolean;
begin with DM do begin
 if TSYS_Pocet_firiem.Value=1 then
   raise EMyError.Create(SMyAppIbaMultiverzia);
 if OTVORENA_FIRMA=TMenuItem(Sender).Tag then
   raise EMyError.Create(SMyAppZrusenieFirmyOtvorena);
 if not MyOtazka(Format(SMyAppZrusenieFirmyPopis,[TMenuItem(Sender).Caption])) then exit;
 if not MyOtazka(Format(SMyAppOtazkaNaozajZrusit,['firmu '+TMenuItem(Sender).Caption])) then exit;
 try
 cesta:=MyNetPath+'DATA'+Format('%.2d',[TMenuItem(Sender).Tag]);
 cesta_pre_zmazany:='c:\temp.pam98\';
 ForceDirectories(cesta_pre_zmazany);
 File_Dir(
  'COPY',   {COPY, DELETE, MOVE, RENAME}
  true,     {Renames if directory exists}
  true,     {Responds "Yes to All" to any dialogs}
  true,     {No progress dialog is shown}
  false,     {displays progress dialog but no file
                                names}
  cesta,    {From directory}
  cesta_pre_zmazany {To directory}
  );

 DelTree(cesta,true,u);
 NACITAJ_FIRMY;
 if not(u) then begin
   MyError(Format(SMyAppZrusenieFirmyNeuspech,[TMenuItem(Sender).Caption]));
   exit;
 end;
 MyMessage(Format(SMyAppZrusenieFirmyUspech,[TMenuItem(Sender).Caption]));
 except
 MyError(Format(SMyAppZrusenieFirmyNeuspech,[TMenuItem(Sender).Caption]));
 end;
end;end;

procedure TFormMain.ShowReportRZ2(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='RZ2';
  RunReport(X);
end;

procedure TFormMain.DBComboBoxRp1Enter(Sender: TObject);
begin
  Height:=20;
end;

procedure TFormMain.TlazamestnacovExcel1Click(Sender: TObject);
begin
  FormCsv1:=TFormCsv1.Create(Application);
  try
  FormCsv1.ShowModal;
  finally
  FormCsv1.Free;
  end;
end;

procedure TFormMain.ShowReportOdv(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ODV';
  RunReport(X);
end;

procedure TFormMain.ShowReportSPV(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='SPV';
  RunReport(X);
end;

procedure TFormMain.ShowReportDNS2(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='DNS2';
  RunReport(X);
end;

procedure TFormMain.VyplatyNewClick(Sender: TObject);
begin
  FormMainVyp:=TFormMainVyp.Create(Application);
  try
  FormMainVyp.ShowModal;
  finally
  FormMainVyp.Free;
  with DM,DMZ do begin
    PRIEZVISKO_FILTER:='';
    Edit_zam_filter.Text := '';
    Edit_zam_filter_rc.Text := '';
    SET_FILTER(GET_FILTER(MyZamFilter,AktSidFilter));
  end;
  end;
end;

procedure TFormMain.Akcia_zaokruhlovanie(Sender: TObject);
begin
  RunFormSetup(2);
end;

procedure TFormMain.ShowReportOdvZp(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ODVZP';
  RunReport(X);
end;


procedure TFormMain.ShowReportVLND(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='VLND';
  RunReport(X);
end;

procedure TFormMain.Akcia_start_pam98(Sender: TObject);
begin
  ExecuteFile('http://pam98.eu/wp/archives/136','','',1)
end;

procedure TFormMain.Akcia_prepocet(Sender: TObject);
begin
  DMV.AKTUALIZUJ_VYPLATY(0);
end;

procedure TFormMain.tvrronprehadpreddavkovadani1Click(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='DNS3';
  RunReport(X);
end;

procedure TFormMain.DBG_zamfDblClick(Sender: TObject);
begin
  Akcia_zamf_vyber(Sender);
end;

procedure TFormMain.ShowReportELDZ1(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ELDZ1';
  RunReport(X);
end;

procedure TFormMain.hlasenievd2Click(
  Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='VD2';
  RunReport(X);
end;

procedure TFormMain.akcia_zalohovanie(Sender: TObject);
begin
  spusti_zalohovanie(Sender, false); {false => nie je vynutene}
end;

procedure TFormMain.akcia_obnova(Sender: TObject);
var
  FExt:String[3];
  FName:String[8];
  Pismeno:Char;
  DataAdr:string[6];
  DataPath:string[128];
  ZipName:string[128];
  x:integer;
begin
  if NOT DirectoryExists('Zaloha') then begin
    CreateDir('Zaloha');
  End;
  If NOT DirectoryExists('Sklad') then begin
    CreateDir('Sklad');
  End;
  DataAdr:='Data'+Format('%.2d',[OTVORENA_FIRMA]);
  DataPath:=MyDataPth;
try
  Dialog1:=TOpenDialog.Create(Application);
  with Dialog1 do
  begin
    DefaultExt:='zip';
    Filter:='PAM98 zip files (z*.zip)|z*.zip';
    FilterIndex:=1;
    InitialDir:=MyBkpPath;
    Options:=[ofFileMustExist,ofNoDereferenceLinks,ofPathMustExist{,ofExtensionDifferent},ofHideReadOnly];
    Title:=SMyAppObnovaVyber;
    repeat
      if not Dialog1.Execute then exit;
      FExt:=UpperCase(Copy(Dialog1.FileName,LENGTH(Dialog1.FileName)-3+1,3));
      FName:=UpperCase(Copy(Dialog1.FileName,LENGTH(Dialog1.FileName)-12+1,8));
      Pismeno:=StrToChar(Copy(FName,6,1));
    until (FExt='ZIP') AND (Pismeno IN ['C','D']);
    SetCurrentDir(MyAppPath);
  end;
  if Pismeno='D' then
  if NOT MyOtazka(Format(SMyAppRunObnova,[DM.AktFirmaStr])) then exit;
  if Pismeno='C' then
  if NOT MyOtazka(Format(SMyAppRunObnovaCommon,[DM.AktRok])) then exit;
  Akcia_zatvorenie_db(nil);
  Akcia_priprav_menu(Sender);
  x:=NajdiPosledny(MySklPath+MenoSkladovehoSuboru,'zip',4);
  ZipName:=MySklPath+MenoSkladovehoSuboru+Format('%.4d',[x]);
  if Pismeno='C' then begin
    ExecuteFileX(MenoZip,ParametreZip+'"'+ZipName+'" '+'"'+MyCommPth+'*"',MyAppPath,1);
    ExecuteFileX(MenoUnzip,ParametreUnzip+'"'+Dialog1.FileName+'"'+' -d '+'"'+CLC(MyCommPth)+'"',MyAppPath,1);
  end
  else if Pismeno='D' then begin
    ExecuteFileX(MenoZip,ParametreZip+'"'+ZipName+'" "'+DataPath+'*"',MyAppPath,1);
    ExecuteFileX(MenoUnzip,ParametreUnzip+'"'+Dialog1.FileName+'"'+' -d '+'"'+CLC(DataPath)+'"',MyAppPath,1);
    Nacitaj_Firmy;
  end;
finally
  Dialog1.Free;
end;
end;

procedure TFormMain.mnu_ukony1Click(Sender: TObject);
begin
  DMV.TCUK_.Filtered := False;
  try FormCis:=TFormCis.Create(Application);
  FormCis.Startup(' 3.06 »ÌselnÌk pracovn˝ch v˝konov',DMV.TCUK_);
  except end;
  FormCis.Free;
end;

procedure TFormMain.SPEED_ZAM_PRAVYClick(Sender: TObject);
begin
  SB_ZAM_PRAVY.Visible := not SB_ZAM_PRAVY.Visible;
  SPEED_ZAM_PRAVY.Down := not SPEED_ZAM_PRAVY.Down;
end;

procedure TFormMain.ShowReportOdvDp(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ODVDP';
  RunReport(X);
end;

procedure TFormMain.tlac_sp_xmlClick(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='SPXML';
  RunReport(X);
end;

procedure TFormMain.tlac_sp1pClick(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='SP1P';
  RunReport(X);
end;

procedure TFormMain.mnu_cis_vvz1Click(Sender: TObject);
begin
  try FormCis:=TFormCis.Create(Application);
  FormCis.Startup(' 3.07 »ÌselnÌk v˝nimiek z vymer.z·kladu',DM.CIS5_);
  except end;
  FormCis.Free;
end;

procedure TFormMain.mnu_cdm2004Click(Sender: TObject);
var rok:integer;
begin
  rok:=MyRok(DM.AktObdobie);
  if not MyOtazka(Format(SMyAppSpustitVypocetCDM,[rok])) then exit;
  DMV.NASTAV_Cistu_Dennu_Mzdu(rok);
  MyMessage(SMyAppVypocetCDM_Hotovo);
end;

procedure TFormMain.tlac_sp_xml_kClick(Sender: TObject);
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
    Filter:='SP - XML files (sp*.xml)|sp*.xml';
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
    until (FExt='.XML') AND (Pismeno1='S') and (Pismeno2='P');
  VytvorConfSubor(FPath,FName,ChangeFileExt(FName,'.txt'));
  MyMessage(Format(SMyAppHPCompletedXml,[ChangeFileExt(Dialog1.FileName,'.txt')]));
  end;
finally
  Dialog1.Free;
  SetCurrentDir(MyAppPath);
end;
end;

procedure TFormMain.tlac_sp_xmleClick(Sender: TObject);
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
    Filter:='SP - XML files (sp*.xml)|sp*.xml';
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
    until (FExt='.XML') AND (Pismeno1='S') and (Pismeno2='P');
    ExecuteFile(MyAppPath+'xmlviewer.exe',Dialog1.FileName,InitialDir,SW_MAXIMIZE);
  end;
finally
  Dialog1.Free;
  SetCurrentDir(MyAppPath);
end;
end;

procedure TFormMain.tlac_sp1p_xlsClick(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='SP1PXLS';
  RunReport(X);
end;

procedure TFormMain.mnu_cis_pu1Click(Sender: TObject);
begin
  try
  DM.CISPUX_.Open;
  try FormCis:=TFormCis.Create(Application);
    FormCis.Startup(' 3.08 »ÌselnÌk pre vstupy do podvojnÈho ˙ËtovnÌctva',DM.CISPUX_);
  except end;
  finally
    FormCis.Free;
    DM.CISPUX_.Close;
  end;
end;

procedure TFormMain.ShowReportPU(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='PU';
  RunReport(X);
end;

procedure TFormMain.ShowReportVYK(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='VYK';
  RunReport(X);
end;

procedure TFormMain.ShowReportZraz(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ZRAZ';
  RunReport(X);
end;

procedure TFormMain.mnu_imp2Click(Sender: TObject);
var ii:integer;FN,FNI,FNJ,s,s1,s2,df,pom:string;pp,pz,pc,pch,ank,dohoda,pomsid:longint;
  F1,FI:TextFile;
  Stred:array[1..99] of integer;
  prvok:integer;
  U1,U2,U3:string;
begin with DM,DMZ,DMV do begin
  for ii:=1 to 99 do Stred[ii]:=0;
  if NOT DirectoryExists(MyAppPath+MenoXmlDir+'\') then
      CreateDir(MyAppPath+MenoXmlDir+'\');
  FN :=MyAppPath+MenoXmlDir+'\'+MenoTlacChyby1+IntToStr(DM.AktObdobie)+'.txt';
  FNJ:=Copy(IntToStr(DM.AktRok),3,4)+LPAD(IntToStr(DM.Aktmesiac),2,'0')+'.txt';
  FNI:=MyImpPath+FNJ;
  if not MyOtazka(Format(SMyAppImportAnketarovNaozajSpustit,[FNI,DM.AktMesiac,DM.AktRok])) then exit;
  try
  DMZ.DS_ZAM1.Enabled := True;
  TZAM_.Filtered := False;
  Screen.Cursor:=crHourGlass;
  Chdir(MyImpPath);
  if not FileExists(FNJ) then begin MyMessage(Format(SMyAppFileNotFound,[FNI])); exit; end;
  assignfile(F1,FN);
  assignfile(FI,FNI);
  rewrite(F1);
  reset(FI);
  writeln(F1,'NA»ÕTANIE ⁄DAJOV O ANKET¡ROCH - ZOZNAM CH›B');
  writeln(F1,'-------------------------------------------');
  pp:=0;pz:=0;pch:=0;
  Myconsts.Progress(0);
  UCTUJ_HSV:=true;
  UCTUJ_MDB:=true;
  pc:=0;
  while not eof(FI) do begin
    readln(FI,s); parseCsv(s); inc(pc);
    try
      prvok := StrToInt(MyParser[20]);
    except
      on EConvertError do prvok:=0;
    end;
    if (prvok>=1) and (prvok<=99) then Stred[prvok]:=1;
  end;
  pom:='';
  for ii:=99 downto 1 do if Stred[ii]=1 then begin
    if pom='' then pom:=IntToStr(ii)
              else pom:=IntToStr(ii)+','+pom;
  end;
  CloseFile(FI);

  s:='delete from ":pam98_data:vyp" where v_obdobie='+IntToStr(DM.AktObdobie)
    +' and sid in ('+pom+')';
(*
  s1:='delete from ":pam98_data:vypank" where v_obdobie='+IntToStr(DM.AktObdobie)
    +' and sid in ('+pom+')';
*)
  if pom<>'' then begin
    if not MyOtazka(Format(SMyAppVymazVyplatAnketarov,[DM.AktMesiac,DM.AktRok,pom])) then exit;
    DMSQL.ExecuteSql(s);
    {DMSQL.ExecuteSql(s1);}
  end;
  TVYP_.Refresh;

  reset(FI);
  while not eof(FI) do begin
    readln(FI,s); parseCsv(s);
    if MyParser[1]='' then continue;
  try
    if (MyParser[3] = IntToStr(DM.AktRok)) and
       (MyParser[2] = IntToStr(DM.AktMesiac)) then
    begin
      if MyParser[20]='' then pomsid := 1
      else if MyParser[20]='0' then pomsid := 1
      else pomsid := StrToInt(MyParser[20]);

      ank:=StrToLongint(MyParser[1]);
      if pomsid = 10 then dohoda:=0
      else dohoda:=StrToLongint(MyParser[25]);

      if EXISTUJE_ZAM_ANK(ank,dohoda)
      then TZAM_.Edit else TZAM_.Insert;
      TZAM_Code_numb.Value := ank;
      TZAM_C_pasu.AsInteger := dohoda; {MyParser[25];}

      if TZAM_.State in [dsInsert] then begin
        TZAM_C_vodicaku.Value:= MyParser[23];
        TZAM_Education.Value := MyParser[24];
      end else begin
        if TZAM_C_vodicaku.Value <> MyParser[23] then
          writeln(F1,'Os.ËÌslo: '+RPAD(FloatToStr(ank),8,' ')+' Warn: c.zakazky nie je mozne menit: '+MyParser[23]);
        if TZAM_Education.Value <> MyParser[24] then
          writeln(F1,'Os.ËÌslo: '+RPAD(FloatToStr(ank),8,' ')+' Warn: c.listu nie je mozne menit: '+MyParser[24]);
      end;
      TZAM_Surname.Value   := MyParser[7];
      TZAM_Name.Value      := MyParser[6];
      TZAM_Born_numb.Value := RC_BEZ(MyParser[17]);

      DBZ_RodCisloChange(Sender);

      TZAM_Zamestnanie.Value := 'neuveden·';
      TZAM_Tp_city.Value   := MyParser[9];
      TZAM_Tp_zip.Value    := MyParser[10];
      if DM.AktObdobie >= ZAKON_2013_01 then begin

         { ----- TRVALY POBYT -----}
         MyRozdelUlicuExt(MyParser[8],U1,U2,U3);
         TZAM_Tp_ulica.Value := U1;
         TZAM_Tp_ocislo.Value := U2;
         try
         TZAM_Tp_supcislo.AsString := U3;
         except end;

      end else begin
        TZAM_Tp_street.Value := MyParser[8];
      end;
      df                   := TZAM_Nastup.DisplayFormat;
      MyParser[13]         :=StrReplaceX(MyParser[13],' 0:00:00','');
      TZAM_Nastup.DisplayFormat :='d.m.yy';
      TZAM_Nastup.AsString      := MyParser[13];
      TZAM_Nastup.DisplayFormat := df;
      TZAM_Fz_Hlavne.Value := False;
      TZAM_U_sviatky.Value := False;
      if DM.AktObdobie >= ZAKON_2013_01 then
        TZAM_Typzec.AsString := MyParser[21]
      else
        TZAM_Typzec.Value := 2;
      if MyParser[15]='0'
       then TZAM_VYHL.Value:=false
       else TZAM_VYHL.Value:=true;
      if MyParser[16]=''
       then TZAM_KZP.Value  :=0
        else TZAM_KZP.Value := StrToInt(cleanCsv(MyParser[16]));
      try
        MyRozdelCisloU(MyParser[11],s1,s2);
        if (s1='000000') and (s2='0000000000') then begin
          inc(pch);
          writeln(F1,'Os.ËÌslo: '+RPAD(FloatToStr(ank),8,' ')+' chybnÈ ËÌslo ˙Ëtu');
        end;
        TZAM_Predcislo_U.Value:=s1;
        TZAM_Cislo_U.Value    :=s2;
        TZAM_Banka_u.Value    := MyParser[14];
        TZAM_SSym_u.Value     := MyParser[12];
      except
      on E:Exception do begin
        inc(pch);
        writeln(F1,'Os.ËÌslo: '+RPAD(IntToStr(ank),8,' ')+' chyba:'+E.Message);
      end;
      end;
      if DM.AktObdobie >= ZAKON_2013_01 then begin
        TZAM_U_zdrav.Value   := 0;
        TZAM_U_nemoc.Value   := 0;
        TZAM_U_dochod.Value  := 0;
        TZAM_U_fondzam.Value := 0;
        TZAM_U_invalid.Value := 0;
        TZAM_U_garancne.Value:= 0;
        TZAM_U_rezerva.Value := 0;
        TZAM_U_uraz.Value    := 1;
(*
     1:CIS10_CALC_POPIS.Value := 'Zamestnanec - pravideln˝ prÌjem';
     2:CIS10_CALC_POPIS.Value := 'Dohoda do 31.12.2012';
     3:CIS10_CALC_POPIS.Value := 'Zamestnanec - nepravideln˝ prÌjem';
    10:CIS10_CALC_POPIS.Value := 'DoVP (Dohoda o†vykonanÌ pr·ce) ñ pravideln˝ prÌjem';
    11:CIS10_CALC_POPIS.Value := 'DoVP - nepravideln˝ prÌjem';
    12:CIS10_CALC_POPIS.Value := 'DoP» (Dohoda o†pracovnej Ëinnosti) ñ pravideln˝ prÌjem';
    13:CIS10_CALC_POPIS.Value := 'DoP» ñ nepravideln˝ prÌjem';
    14:CIS10_CALC_POPIS.Value := 'DoBPä (Dohoda o†brig·dnickej pr·ci ötudentov) ñ pravideln˝ prÌjem';
    15:CIS10_CALC_POPIS.Value := 'DoBPä ñ nepravideln˝ prÌjem';
    16:CIS10_CALC_POPIS.Value := 'DoBPä bez dÙchodkovÈho poistenia - pravideln˝ prÌjem';
    17:CIS10_CALC_POPIS.Value := 'DoBPä bez dÙchodkovÈho poistenia - nepravideln˝ prÌjem';
    18:CIS10_CALC_POPIS.Value := 'DoBPä len na dÙchodkovÈ poistenie - pravideln˝ prÌjem';
    19:CIS10_CALC_POPIS.Value := 'DoBPä len na dÙchodkovÈ poistenie - nepravideln˝ prÌjem';
*)
        {Vyhodnot socialne poistenie}
(*
InvalidnÈ poistenie musÌte platit, aj ked ste invalidn˝ dÙchodca a vyzer· to nelogicky. TakÈ s˙ moment·lne predpisy.
Od platenia invalidnÈho poistenia je osloboden˝ iba poistenec, ktor˝ pober· starobn˝ dÙchodok alebo predcasn˝ starobn˝ dÙchodok.
*)
        CASE TZAM_TypZec.Value OF
          1:raise EMyError.Create('Zamestnanec - pravideln˝ prÌjem');
          2:raise EMyError.Create('Nepovolen˝ typ zamestnanca - Dohoda do 31.12.2012');
          3:raise EMyError.Create('Zamestnanec - nepravideln˝ prÌjem');
          10,12:
                begin
                  TZAM_U_dochod.Value  := 1;
                  TZAM_U_invalid.Value := 1;
                  TZAM_U_rezerva.Value := 1;
                  if MyParser[22] = 'D' then begin
                    TZAM_U_invalid.Value := 0; {docasne nastavene pre vsetkych dochodcov, ze neplatia invalidne}
                  end;
                  {dochodcovia neplatia, invalidi neplatia}
                  if (MyParser[22] <> 'D') and (MyParser[22] <> 'I') then begin
                    TZAM_U_nemoc.Value   := 1;
                    TZAM_U_fondzam.Value := 1;
                  end;
                end;
          11,13:begin
                  TZAM_U_dochod.Value  := 1;
                  TZAM_U_invalid.Value := 1;
                  TZAM_U_rezerva.Value := 1;
                  if MyParser[22] = 'D' then begin
                    TZAM_U_invalid.Value := 0; {docasne nastavene pre vsetkych dochodcov, ze neplatia invalidne}
                  end;
                end;
          14,15:begin
                  TZAM_U_dochod.Value  := 1;
                  TZAM_U_invalid.Value := 1;
                  TZAM_U_rezerva.Value := 1;
                end;
          16,17:begin
                  TZAM_U_dochod.Value  := 1;
                  TZAM_U_invalid.Value := 1;
                  TZAM_U_rezerva.Value := 1;
                end;
          18,19:begin
                  TZAM_U_dochod.Value  := 1;
                  TZAM_U_invalid.Value := 1;
                  TZAM_U_rezerva.Value := 1;
                end;
          else raise EMyError.Create('Nepovolen˝ typ zamestnanca - hodnota typzec='+TZAM_TypZec.AsString);
        END;
        {Vyhodnot zdravotne poistenie}
        CASE TZAM_TypZec.Value OF
          10,11,12,13: if (MyParser[22] <> 'D') and (MyParser[22] <> 'I') then TZAM_U_zdrav.Value  := 1;
        END;
      end else begin
        TZAM_U_zdrav.Value   := 0;
        TZAM_U_nemoc.Value   := 0;
        TZAM_U_dochod.Value  := 0;
        TZAM_U_fondzam.Value := 0;
        TZAM_U_invalid.Value := 0;
        TZAM_U_garancne.Value:= 0;
        TZAM_U_rezerva.Value := 0;
        TZAM_U_uraz.Value    := 1;
      end;
      if MyParser[20]='' then TZAM_SID.Value       := 1
      else if MyParser[20]='0' then TZAM_SID.Value := 1
      else TZAM_SID.Value := StrToInt(MyParser[20]);
      if MyParser[19]='0'
       then  TZAM_Spor_plat.Value := 0
        else TZAM_Spor_plat.Value := 1;
      TZAM_.Post;
      {--}
      inc(pz);
      TVYP_.Insert;

      if DM.AktObdobie >= ZAKON_2013_01 then
        TVYP_N_odmeny.Value := StrToFloat(MyParser[4])
      else
        TVYP_N_dohody_ovp.Value := StrToFloat(MyParser[4]);
      TVYP_N_doplatok.Value   := StrToFloat(MyParser[5]);
      if MyParser[15]='0'
        then TVYP_U_nezdc.Value  := false
        else TVYP_U_nezdc.Value  := true;

      if DM.AktObdobie >= ZAKON_2013_01 then
        TVYP_Vynimka_VZ.Value   := '0'
      else
        TVYP_Vynimka_VZ.Value   := '6';
      {--Zabezpecenie automatickeho nastavovania dane zrazkou/preddavkami--}
      if TVYP_V_Obdobie.Value >= ZAKON_2011_01 then
        TVYP_Dan_vyrovnana.Value := 0
      else
      if TVYP_U_nezdc.Value then
        TVYP_Dan_vyrovnana.Value := 0
      else begin
        if TVYP_N_dohody_ovp.Value > PARAMETRE[31].Hodnota
        then TVYP_Dan_vyrovnana.Value := 0
        else TVYP_Dan_vyrovnana.Value := 1;
      end;
      if TVYP_V_obdobie.Value >= ZAKON_2006_08 then begin
        TVYP_U_garancne.Value := 1;
        TVYP_Rezerva1.Value := 1;
      end;
      TVYP_.Post;
(*
      TANK_.Insert;
      TANK_Code_emp.Value  := TVYP_Code_emp.Value;
      TANK_V_obdobie.Value := TVYP_V_obdobie.Value;
      TANK_SID.Value       := TVYP_SID.Value;
      TANK_Cis_zakazky.Value        := MyParser[23];
      TANK_Cis_kvotneho_listu.Value := MyParser[24];
      TANK_Dohoda_Id.AsString       := MyParser[25];
      TANK_.Post;
*)
      {--}
    end;
    except
      on E:Exception do begin
      TVYP_.Cancel;
      TZAM_.Cancel;
      inc(pch);
      writeln(F1,Format('Os.ËÌslo: %d chyba:'+E.Message,[ank]));
      end;
    end;
    inc(pp);
    {if pp=20 then break;}
    Myconsts.Progress(trunc(pp/pc*100));
  end;
  finally
  Screen.Cursor:=crDefault;
  Chdir(MyAppPath);
  UCTUJ_HSV:=false;
  UCTUJ_MDB:=false;
  Myconsts.Progress(100);
  DMZ.DS_ZAM1.Enabled := False;
  TZAM_.Filtered := True;
  TANK_.Close;
  try
  CloseFile(F1);
  CloseFile(FI);except end;
  end;
  if pch=0 then MyMessage(Format(SMyAppAccessImportHotovo,[pz]))
  else ExecuteFileX('notepad',FN,'',1);
end;end;

procedure TFormMain.mnu_db_zaloz_rokClick(Sender: TObject);
var rr:integer;SearchRec:TSearchRec;Found:integer;uspech:boolean;
ss,SrcDir,DestDir:string;
begin with DM do begin
 rr:=AktRok;
  if NOT MyOtazka(Format(SMyAppOtazkaPridatRok,[IntToStr(rr+1)]))
    then exit;
 SrcDir := MyCommPth;
 DestDir := Copy(MyCommPth,1,length(MyCommPth)-5)+IntToStr(rr+1)+'\';
 if DirectoryExists(DestDir) then
   raise EMyError.Create(Format(SMyAppRokUzExistuje,[Copy(DestDir,length(DestDir)-4,4)]));
 Akcia_zatvorenie_db(Sender);
 Akcia_priprav_menu(Sender);
 CreateDir(DestDir);
 uspech:=false;
 try
    Found := FindFirst(SrcDir+'*.*', faAnyFile, SearchRec);
    while Found = 0 do
    begin
      if SearchRec.Attr and faDirectory = 0 then
      begin
        ss:=Copy(Uppercase(SearchRec.Name),1,4);
        CopyFile(SrcDir+Searchrec.Name,DestDir);
      end;
      if Uppercase(SearchRec.Name)='CIS_PAR.DB' then uspech:=true;
      Found := FindNext(SearchRec);
    end;
    FindClose(SearchRec);
    NACITAJ_FIRMY;
    if uspech
     then MyMessage(Format(SMyAppZalozenieRokuUspech,[rr+1,DestDir]))
      else raise EMyError.Create(Format(SMyAppZalozenieRokuNeuspech,[rr+1]));
    exit;
  except
    raise EMyError.Create(Format(SMyAppZalozenieRokuNeuspech,[rr+1]));
  end;
end;end;

procedure TFormMain.ShowReportRZ2004B(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='RZ2004B';
  RunReport(X);
end;

procedure TFormMain.Show1ReportRZ2004B(Sender: TObject);
begin with DMV do begin
  if TRZP_.State in [dsEdit,dsInsert] then raise EMyError.Create(SMyAppEditMode);
  DM.NaplnMyReportParam(X);
  X.Code_emp1:=TRZP_Code_emp.Value;
  X.Code_emp2:=TRZP_Code_emp.Value;
  X.AktObdobie:=TRZP_V_Rok.Value*100+12;
  X.Typ:='RZ2005B';
  RunReport(X);
end;end;

procedure TFormMain.ShowReportPP2(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='PP2';
  RunReport(X);
end;

procedure TFormMain.ShowReportVZ(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='VZ';
  RunReport(X);
end;

procedure TFormMain.rzp_zauctovanie(Sender: TObject);
begin
  DMV.Zauctuj_RZP_Do_Vyplaty;
end;

procedure TFormMain.ShowReportZP2005PR(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ZP2005PR';
  X.Vyber_ZP:=True;
  RunReport(X);
end;

procedure TFormMain.ShowReportBO(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='BO';
  RunReport(X);
end;

procedure TFormMain.tlac_zp_txtClick(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ZPTXT';
  X.Vyber_ZP:=True;
  RunReport(X);
end;

procedure TFormMain.sp_reglistyClick(Sender: TObject);
begin
  FormNEP1:=TFormNEP1.Create(Application);
  try
  FormNEP1.ShowModal;
  finally
  FormNEP1.Free;
  DMZ.TNEP_.Filtered:=False;
  {Akcia_zam_obnov_filter(Sender);}
  end;
end;

procedure TFormMain.NX_ZAMChange(Sender: TObject);
begin with DM,DMZ,DMV,DMP do begin
  SB_ZAM.HorzScrollBar.Position := 0;
  SB_ZAM.VertScrollBar.Position := 0;
  DisableOperacie;
  Akcia_priprav_menu(Sender);
  if NX_ZAM.ActivePage=PAGE_UDAJE then begin
    EnableMenuItem(Operacie_zam1)
  end
  else if NX_ZAM.ActivePage=PAGE_DETI then begin
    EnableMenuItem(Operacie_deti1.Hlavny);
    TDET_.MasterSource:=DS_ZAM1;
    TDET_.MasterFields:='Code_emp';
    TDET_.First;
    TDET_.Filtered:=False;
  end
  else if NX_ZAM.ActivePage=PAGE_VYKONY then begin
    EnableMenuItem(Operacie_vyk1.Hlavny);
    TZUK_.MasterSource:=DS_ZAM1;
    TZUK_.MasterFields:='Code_numb;Code_emp';
    DS_ZUK.Enabled:=True;
    DMV.TZUK_Code_numb.Visible := false;
  end
  else if NX_ZAM.ActivePage=PAGE_ZRAZKY then begin
    EnableMenuItem(Operacie_zrz1.Hlavny);
    TZRZ_.MasterSource:=DS_ZAM1;
    TZRZ_.MasterFields:='Code_emp';
    TZRZ_.First;
    TZRZ_.Filtered:=False;
    DMZ.DS_ZRZ.Enabled:=True;
    DMZ.DS_ZRZG.Enabled:=True;
  end
  else if NX_ZAM.ActivePage=PAGE_NEP then begin
    EnableMenuItem(Operacie_nep1.Hlavny);
    PC_NEP.ActivePage := TAB_NEP_SP_PRIHLASKA;
    if DBGrid_SP_PRIHLASKA.CanFocus then DBGrid_SP_PRIHLASKA.SetFocus;
    TNEP_.IndexName:='NEP1';
    TNEP_.MasterSource:=DS_ZAM1;
    TNEP_.MasterFields:='Code_emp';
    TNEP_.Filtered:=False;
    TNEP_.Filter:='typrl=''PA''';
    TNEP_.Filtered:=True;
    TNEP_.Last;
    DS_NEP.Enabled:=True;
    DS_NEPG.Enabled:=True;
  end
  else if NX_ZAM.ActivePage=PAGE_DOCH then begin
    EnableMenuItem(Operacie_doch1.Hlavny);
    TDOCH_.MasterSource:=DS_ZAM1;
    TDOCH_.MasterFields:='Code_emp';
    TDOCH_.Last;
    DS_DOCH.Enabled:=True;
  end
  else if NX_ZAM.ActivePage=PAGE_PPV then begin
    EnableMenuItem(Operacie_ppv1);
    TPPV_.MasterSource:=DS_ZAM1;
    TPPV_.MasterFields:='Code_emp';
    TPPV_.First;
    TPPV_.Filtered:=False;
  end
  else if NX_ZAM.ActivePage=PAGE_ELDP then begin
    EnableMenuItem(Operacie_eldp1.Hlavny);
    TELDP_.MasterSource:=DS_ZAM1;
    TELDP_.MasterFields:='Code_emp';
    TELDP_.Last;
    DS_ELDP.Enabled:=True;
  end
  else if NX_ZAM.ActivePage=PAGE_ZP then begin
    REZIM_ZP3:='PAGE_ZP';
    NX_ZDR.ActivePage := PAGE_ZP_ZAMNEC;
    {EnableMenuItem(Operacie_eldp1.Hlavny);}
    TZP1_.MasterSource:=DS_ZAM1;
    TZP1_.MasterFields:='Code_emp';
    TZP1_.Filter:='v_rok='+IntToStr(DM.AktRok);
    TZP1_.Filtered:=TRUE;
    TZP2_.MasterSource:=DS_ZAM1;
    TZP2_.MasterFields:='Code_emp';
    TZP3_.MasterSource:=DS_ZAM1;
    TZP3_.MasterFields:='Code_emp';
    TZP3_.Filter:='v_rok='+IntToStr(DM.AktRok)+' and typ=''VV''';
    TZP3_.Filtered:=TRUE;
    TZP4_.MasterSource:=DS_ZAM1;
    TZP4_.MasterFields:='Code_emp';
    TZP4_.Filter:='v_rok='+IntToStr(DM.AktRok-1)+' and typ=1';
    TZP4_.Filtered:=TRUE;
    DS_ZP1.Enabled:=True;
    DS_ZP2.Enabled:=True;
    DS_ZP3.Enabled:=True;
    DS_ZP4.Enabled:=True;
  end
  else if NX_ZAM.ActivePage=PAGE_DAVKA601
   then begin
    EnableMenuItem(Operacie_d601.Hlavny);
    TZP5_.MasterSource:=DS_ZAM1;
    TZP5_.MasterFields:='Code_emp';
    TZP5_.Filter:='v_rok='+IntToStr(DM.AktRok);
    TZP5_.Filtered:=TRUE;
    DS_ZP5.Enabled:=True;
    TZP5_.Open;
  end;
end;end;

procedure TFormMain.NX_ZAMChanging(Sender: TObject;
  var AllowChange: Boolean);
begin with DM,DMZ,DMV,DMP do begin
  AllowChange:=not SuRozpracovaneZmeny1;
  if not AllowChange then MyMessage(SMyAppEditMode);
end;end;

procedure TFormMain.MyMenuUpdateState(Sender: TObject);
var M:TMyMenuItem;
begin
  M:=TMyMenuItem(Sender);
  if M.DS.Dataset.State in [dsInsert,dsEdit] then
  begin
    M.MM.Polozky[1].Enabled:=False;
    M.MM.Polozky[2].Enabled:=False;
    M.MM.Polozky[3].Enabled:=False;
    M.MM.Polozky[4].Enabled:=True;
    M.MM.Polozky[5].Enabled:=True;
  end else
  begin
    M.MM.Polozky[1].Enabled:=True;
    M.MM.Polozky[2].Enabled:=True;
    M.MM.Polozky[3].Enabled:=True;
    M.MM.Polozky[4].Enabled:=False;
    M.MM.Polozky[5].Enabled:=False;
{    M.DBN1.Enabled:=True;    }
  end;
end;

procedure TFormMain.MyMenuHandler(Sender: TObject);
var M:TMyMenuItem;
begin
  M:=TMyMenuItem(Sender);
  case M.Tag of
  0:;
  1: M.DS.Dataset.Insert;
  2: if not M.DS.Dataset.IsEmpty then M.DS.Dataset.Edit;
  3: if not M.DS.Dataset.IsEmpty then M.DS.Dataset.Delete;
  4: M.DS.Dataset.Post;
  5: M.DS.Dataset.Cancel;
  end;
  MyMenuUpdateState(Sender);
end;

procedure TFormMain.VytvorMenu(var X:TMyMenu;iDS:TDataSource;var iDBN1,iDBN2: TDBNavigator;iNazov:string);
var NewItem1,NewItem2: TMyMenuItem;
  AOwner: TComponent;
  i:integer;
procedure VytvorItem(var MMI: TMyMenuItem);
begin
  MMI:= TMyMenuItem.Create(AOwner);
  MMI.DS:=iDS;
  MMI.MM:=X;
  X.Polozky[i]:=MMI;
  inc(i);
  MMI.DBN1:=iDBN1;
  MMI.DBN2:=iDBN2;
end;
begin
  X:=TMyMenu.Create(Self);
  AOwner:=FormMain;i:=0;
  VytvorItem(NewItem1);
  NewItem1.Tag := 0; {hlavny}
  NewItem1.Caption := iNazov;
  NewItem1.OnClick:=MyMenuHandler;
  FormMain.MainMenu1.Items.Add(NewItem1);
  VytvorItem(NewItem2);
  NewItem2.Caption := 'Nov˝ z·znam';
  NewItem2.OnClick:=MyMenuHandler;
  NewItem2.Tag := 1; {insert}
  NewItem1.Add(NewItem2);
  VytvorItem(NewItem2);
  NewItem2.Caption := 'Oprava ˙dajov';
  NewItem2.OnClick:=MyMenuHandler;
  NewItem2.Tag := 2; {edit}
  NewItem1.Add(NewItem2);
  VytvorItem(NewItem2);
  NewItem2.Caption := 'Vymazanie z·znamu';
  NewItem2.OnClick:=MyMenuHandler;
  NewItem2.Tag := 3; {delete}
  NewItem1.Add(NewItem2);
  VytvorItem(NewItem2);
  NewItem2.Caption := 'Z·pis zmien';
  NewItem2.OnClick:=MyMenuHandler;
  NewItem2.Tag := 4; {post}
  NewItem1.Add(NewItem2);
  VytvorItem(NewItem2);
  NewItem2.Caption := 'Ignorovanie zmien';
  NewItem2.OnClick:=MyMenuHandler;
  NewItem2.Tag := 5; {cancel}
  NewItem1.Add(NewItem2);
  X.Hlavny:=NewItem1;
  MyMenuUpdateState(NewItem2);
end;

procedure TFormMain.DBN_DOCH1Click(Sender: TObject; Button: TNavigateBtn);
begin
  MyMenuUpdateState(Operacie_doch1.Polozky[1]);
end;

procedure TFormMain.DBN_nep1Click(Sender: TObject; Button: TNavigateBtn);
begin
  MyMenuUpdateState(Operacie_nep1.Polozky[1]);
end;

procedure TFormMain.DBN_Zrz2Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  MyMenuUpdateState(Operacie_zrz1.Polozky[1]);
end;

procedure TFormMain.DBN_zuk1Click(Sender: TObject; Button: TNavigateBtn);
begin
  MyMenuUpdateState(Operacie_vyk1.Polozky[1]);
end;

procedure TFormMain.DBN_DetiOnClick(Sender: TObject; Button: TNavigateBtn);
begin
  MyMenuUpdateState(Operacie_deti1.Polozky[1]);
end;

procedure TFormMain.DBG_ZAM_PRAVYTitleClick(Column: TColumn);
begin
 if UpperCase(Column.FieldName)='CODE_NUMB' then
   akcia_zam_zoradit2(nil)
 else
   akcia_zam_zoradit1(nil);
end;

procedure TFormMain.DBG_zamfTitleClick(Column: TColumn);
begin
 if UpperCase(Column.FieldName)='CODE_NUMB' then
   akcia_zam_zoradit2(nil)
 else if UpperCase(Column.FieldName)='PMT' then
   akcia_zam_zoradit1(nil);
end;

procedure TFormMain.Show_RTF_NEZISK1(Sender: TObject);
begin with DMV do begin
 if TRZP_.State in [dsEdit,dsInsert] then raise EMyError.Create(SMyAppEditMode);
 if TRZP_V_rok.AsString='' then raise EMyError.Create(SMyRzpNeexistuje);
  DM.NaplnMyReportParam(X);
  X.Code_emp1:=TRZP_Code_emp.Value;
  X.Code_emp2:=TRZP_Code_emp.Value;
  X.AktObdobie:=TRZP_V_Rok.Value*100+12;
  X.Typ:='NEZISK1';
  X.JedenPracovnik:=True;
  RunReport(X);
end;end;

procedure TFormMain.ShowRTF_Nezisk2(Sender: TObject);
begin with DMV do begin
 if TRZP_.State in [dsEdit,dsInsert] then raise EMyError.Create(SMyAppEditMode);
 if TRZP_V_rok.AsString='' then raise EMyError.Create(SMyRzpNeexistuje);
  DM.NaplnMyReportParam(X);
  X.Code_emp1:=TRZP_Code_emp.Value;
  X.Code_emp2:=TRZP_Code_emp.Value;
  X.AktObdobie:=TRZP_V_Rok.Value*100+12;
  X.Typ:='NEZISK2';
  X.JedenPracovnik:=True;
  RunReport(X);
end;end;

procedure TFormMain.Show_RTF_Nezisk1_ALL(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='NEZISK1';
  X.AktObdobie:=DM.AktObdobie;
  X.JedenPracovnik:=True;
  RunReport(X);
end;

procedure TFormMain.Show_RTF_Nezisk2_ALL(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='NEZISK2';
  X.AktObdobie:=DM.AktObdobie;
  X.JedenPracovnik:=True;
  RunReport(X);
end;

procedure TFormMain.tlac_sp1_pdfClick(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='SP_PDF';
  RunReport(X);
end;


procedure TFormMain.ShowReportELDP(Sender: TObject);
begin with DMZ do begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ELDP_PDF';
  X.JedenPracovnik:=TRUE;
  X.Code_emp1:=TZAM_Code_emp.Value;
  X.Code_emp2:=TZAM_Code_emp.Value;
  RunReport(X);
end;end;

procedure TFormMain.ShowReportZP_RTF(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ZP_RTF';
  X.Vyber_ZP:=True;
  RunReport(X);
end;

procedure TFormMain.ShowReportVD_B_PDF(Sender: TObject);
begin with DMZ do begin
  DM.NaplnMyReportParam(X);
  X.Typ:='VD_B_PDF';
  RunReport(X);
end;end;

procedure TFormMain.ShowReportVD_A_PDF(
  Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='VD_A_PDF';
  RunReport(X);
end;

procedure TFormMain.SpecialneCinnosti;
var s:string;pocetVyplat:longint;
 verzia_last: integer;
 verzia_data: integer;
begin
  EXIT;
  verzia_last := 1;
{ Uvodny krok na zistenie aktualnej verzie databazy }

  s:= 'select riadenie from ":pam98_data:inf"';
  DMSQL.ExecuteSql(s);
  if DMSQL.Results[1]='' then verzia_data := 0
  else verzia_data := StrToInt(DMSQL.Results[1]);
//1A.krok
  s:= 'select count(*) from ":pam98_comm:cis_par" where id=32';
  DMSQL.ExecuteSql(s);
  if Copy(DMSQL.Results[1],1,1)='0' then begin
    s:= 'insert into ":pam98_comm:cis_par" values (32,1,12,"ZRAZ_DAN_POSUN","0","Zr·ûkov· daÚ k preddavkovej posunut· o 1 mesiac(¡NO=1,NIE=0)")';
    DMSQL.ExecuteSql(s);
  end;
//1B.krok
  s:= 'select count(*) from ":pam98_comm:cis_par" where id=33';
  DMSQL.ExecuteSql(s);
  if Copy(DMSQL.Results[1],1,1)='0' then begin
    s:= 'insert into ":pam98_comm:cis_par" values (33,1,12,"POCITANIE_PRIPL","'+IntToStr(KOMP_PRIPL)+'","PoËÌtanie prÌplatkov: 0=z hod.sadz.,1=z priem.mzdy")';
    DMSQL.ExecuteSql(s);
  end;
//1C.krok
  s:= 'select count(*) from ":pam98_comm:cis_par" where id=36';
  DMSQL.ExecuteSql(s);
  if Copy(DMSQL.Results[1],1,1)='0' then begin
    s:= 'insert into ":pam98_comm:cis_par" values (36,1,12,"NC_OSOBA_HRANICA","498000","Hranica z·kl.dane pre nekr·tenie nezd.Ëiastky na daÚovnÌka")';
    DMSQL.ExecuteSql(s);
  end;
//1D.krok
  s:= 'select count(*) from ":pam98_comm:typrl" where typ="RD"';
  DMSQL.ExecuteSql(s);
  if Copy(DMSQL.Results[1],1,1)='0' then begin
    s:= 'insert into ":pam98_comm:typrl" values ("RD","SP-rodiËovsk· dovolenka")';
    DMSQL.ExecuteSql(s);
  end;
//1E.krok
  if DM.AktRok=2009 then begin
    s:= 'select count(*) from ":pam98_comm:cis_par" where id=23';
    DMSQL.ExecuteSql(s);
    if Copy(DMSQL.Results[1],1,1)='1' then begin
      s:='delete from ":pam98_comm:cis_par" where id=23';
      DMSQL.ExecuteSql(s);
      s:= 'insert into ":pam98_comm:cis_par" values (23,1,2,"NC_OSOBA","286.27","Nezdaniteæn· mesaËn· Ëiastka na daÚovnÌka")';
      DMSQL.ExecuteSql(s);
      s:= 'insert into ":pam98_comm:cis_par" values (23,3,12,"NC_OSOBA","335.47","Nezdaniteæn· mesaËn· Ëiastka na daÚovnÌka")';
      DMSQL.ExecuteSql(s);
    end;
  end;
  //1F.krok
  s:= 'select count(*) from ":pam98_comm:typzec" where typ=3';
  DMSQL.ExecuteSql(s);
  if Copy(DMSQL.Results[1],1,1)='0' then begin
    s:= 'insert into ":pam98_comm:typzec" values (3,"prÌkazn· zmluva")';
    DMSQL.ExecuteSql(s);
  end;
//1G.krok
  if DM.AktRok=2009 then begin
    s:= 'select count(*) from ":pam98_comm:cis_par" where id=28 and mesiac_od=7 and hodnota=20';
    DMSQL.ExecuteSql(s);
    if Copy(DMSQL.Results[1],1,1)='0' then begin
      s:='update ":pam98_comm:cis_par" set hodnota=20 where id=28 and mesiac_od=7';
      DMSQL.ExecuteSql(s);
    end;
  end;
//1H1.krok
  if DM.AktRok=2009 then begin
    s:= 'select count(*) from ":pam98_comm:cis_par" where id=20';
    DMSQL.ExecuteSql(s);
    if Copy(DMSQL.Results[1],1,1)='1' then begin
      s:='delete from ":pam98_comm:cis_par" where id=20';
      DMSQL.ExecuteSql(s);
      s:= 'insert into ":pam98_comm:cis_par" values (20,1,6,"MAX_ZAKLAD_NP","1003.09","Max.z·klad pre nemocenskÈ a gar.poistenie")';
      DMSQL.ExecuteSql(s);
      s:= 'insert into ":pam98_comm:cis_par" values (20,7,12,"MAX_ZAKLAD_NP","1084.55","Max.z·klad pre nemocenskÈ a gar.poistenie")';
      DMSQL.ExecuteSql(s);
    end;
  end;
//1H2.krok
  if DM.AktRok=2009 then begin
    s:= 'select count(*) from ":pam98_comm:cis_par" where id=21';
    DMSQL.ExecuteSql(s);
    if Copy(DMSQL.Results[1],1,1)='1' then begin
      s:='delete from ":pam98_comm:cis_par" where id=21';
      DMSQL.ExecuteSql(s);
      s:= 'insert into ":pam98_comm:cis_par" values (21,1,6,"MAX_ZAKLAD_DP","2674.90","Max.z·klad pre odvod dÙchod.poistenia a RF")';
      DMSQL.ExecuteSql(s);
      s:= 'insert into ":pam98_comm:cis_par" values (21,7,12,"MAX_ZAKLAD_DP","2892.12","Max.z·klad pre odvod dÙchod.poistenia a RF")';
      DMSQL.ExecuteSql(s);
    end;
  end;
//1H3.krok
  if DM.AktRok=2009 then begin
    s:= 'select count(*) from ":pam98_comm:cis_par" where id=22';
    DMSQL.ExecuteSql(s);
    if Copy(DMSQL.Results[1],1,1)='1' then begin
      s:='delete from ":pam98_comm:cis_par" where id=22';
      DMSQL.ExecuteSql(s);
      s:= 'insert into ":pam98_comm:cis_par" values (22,1,6,"MAX_ZAKLAD_FZ","2674.90","Max.z·klad pre odvod do fondu zamest.")';
      DMSQL.ExecuteSql(s);
      s:= 'insert into ":pam98_comm:cis_par" values (22,7,12,"MAX_ZAKLAD_FZ","2892.12","Max.z·klad pre odvod do fondu zamest.")';
      DMSQL.ExecuteSql(s);
    end;
  end;
//2A.krok
  if DM.AktRok=2009 then begin
    s:= 'select count(*) from ":pam98_comm:cis_par" where id=37';
    DMSQL.ExecuteSql(s);
    if Copy(DMSQL.Results[1],1,1)='0' then begin
      s:= 'insert into ":pam98_comm:cis_par" values (37,1,12,"NC_OSOBA_ROK","4025.70","Nezdaniteæn· roËn· Ëiastka na daÚovnÌka")';
      DMSQL.ExecuteSql(s);
    end;
  end;
//2B1.krok
  if DM.AktRok=2009 then begin
    s:= 'select count(*) from ":pam98_comm:cis_par" where id=38';
    DMSQL.ExecuteSql(s);
    if Copy(DMSQL.Results[1],1,1)='0' then begin
      s:= 'insert into ":pam98_comm:cis_par" values (38,1,12,"NC_OSOBA_POISTNE","398.33","Nezdaniteæn· Ëiastka na DDS, éP, ⁄S roËne")';
      DMSQL.ExecuteSql(s);
    end;
  end;
//2B2.krok
  if DM.AktRok=2008 then begin
    s:= 'select count(*) from ":pam98_comm:cis_par" where id=38';
    DMSQL.ExecuteSql(s);
    if Copy(DMSQL.Results[1],1,1)='0' then begin
      s:= 'insert into ":pam98_comm:cis_par" values (38,1,12,"NC_OSOBA_POISTNE","12000","Nezdaniteæn· Ëiastka na DDS, éP, ⁄S roËne")';
      DMSQL.ExecuteSql(s);
    end;
  end;
//2C.krok
  if DM.AktRok=2009 then begin
    s:= 'select count(*) from ":pam98_comm:cis_par" where id=36 and hodnota=15387.12';
    DMSQL.ExecuteSql(s);
    if Copy(DMSQL.Results[1],1,1)='0' then begin
      s:='update ":pam98_comm:cis_par" set hodnota=15387.12 where id=36';
      DMSQL.ExecuteSql(s);
    end;
  end;
//3A.krok
  if DM.AktRok=2011 then begin
    s:= 'select count(*) from ":pam98_data:zam" where dan_zrazkou=true';
    DMSQL.ExecuteSql(s);
    if Copy(DMSQL.Results[1],1,1)='0' then begin
      s:='update ":pam98_data:zam" set dan_zrazkou=false where dan_zrazkou=true';
      DMSQL.ExecuteSql(s);
    end;
  end;
//3B.krok
  if DM.AktRok=2011 then begin
    s:= 'select count(*) from ":pam98_data:zam" where vynimka_vz<>''0'' and vynimka_vz<>''1''';
    DMSQL.ExecuteSql(s);
    if Copy(DMSQL.Results[1],1,1)='0' then begin
      s:='update ":pam98_data:zam" set vynimka_vz=''0'' where vynimka_vz<>''0'' and vynimka_vz<>''1''';
      DMSQL.ExecuteSql(s);
    end;
  end;
  { Zaverecny krok pre nastavenie spravnej verzie}
  if verzia_data <> verzia_last then
  begin
    s:= 'update ":pam98_data:inf" set riadenie='+IntToStr(verzia_last);
    DMSQL.ExecuteSql(s);
  end;
  //4A.krok
  if DM.AktRok>=2005 then begin
    s:= 'select count(*) from ":pam98_comm:cis_par" where id=40';
    DMSQL.ExecuteSql(s);
    if Copy(DMSQL.Results[1],1,1)='0' then begin
      s:= 'insert into ":pam98_comm:cis_par" values (40,1,12,"DOH_VYKAZ","0","Dohod·ri do v˝kazu pre SP, 0=vûdy,1=len ak maj˙ z·klad")';
      DMSQL.ExecuteSql(s);
    end;
  end;
{
//1.krok
  s:= 'select count(*) from ":pam98_data:vyp" where v_nepoist_zp is null';
  DMSQL.ExecuteSql(s);
  if Copy(DMSQL.Results[1],1,1)>'0' then begin
    s:= 'update ":pam98_data:vyp" set v_nepoist_zp=0 where v_nepoist_zp is null';
    DMSQL.ExecuteSql(s);
  end;
//2.krok
  s:= 'select count(*) from ":pam98_comm:typrl"';
  DMSQL.ExecuteSql(s);
  if Copy(DMSQL.Results[1],1,1)<='6' then begin
    s:='insert into ":pam98_comm:typrl" values ("10","PN")';
    DMSQL.ExecuteSql(s);
    s:='insert into ":pam98_comm:typrl" values ("11","O»R");';
    DMSQL.ExecuteSql(s);
    s:='update ":pam98_data:nep" set typrl="10",typRL2=1,prerusenie=null where v_obdobie is not null and typ=1';
    DMSQL.ExecuteSql(s);
    s:='update ":pam98_data:nep" set typrl="11",typRL2=1,prerusenie=null where v_obdobie is not null and typ=2';
    DMSQL.ExecuteSql(s);
  end else
  if Copy(DMSQL.Results[1],1,1)<='8' then begin
    s:='insert into ":pam98_comm:typrl" values ("MD","SP-matersk· dovolenka")';
    DMSQL.ExecuteSql(s);
  end;
//3.krok
  s:= 'select text from ":pam98_data:dual"';
  DMSQL.ExecuteSql(s);
  if LENGTH(DMSQL.Results[1])<>3 then begin
    s:='update ":pam98_data:zam" set nc_minimum=null';
    DMSQL.ExecuteSql(s);
    s:='update ":pam98_data:dual" set text="SYS"';
    DMSQL.ExecuteSql(s);
  end;
//4.krok
  s:= 'select 1 from ":pam98_data:cis_pu" where id=17.50';
  DMSQL.ExecuteSql(s);
  if DMSQL.Results[1]<>'1' then begin
    s:='insert into ":pam98_data:cis_pu" values (17.50,null,null,"daÚ zr·ûky",null,null,null,null,null);';
    DMSQL.ExecuteSql(s);
  end;
//5.krok
  s:= 'select count(*) from ":pam98_data:vyp" where vyrovnanie_zp is null';
  DMSQL.ExecuteSql(s);
  if DMSQL.Results[1]<>'0' then begin
    s:='update ":pam98_data:vyp" set vyrovnanie_zp=0 where vyrovnanie_zp is null;';
    DMSQL.ExecuteSql(s);
  end;
//6.krok
  s:= 'select count(*) from ":pam98_data:inf" where f_odstupm<>1';
  DMSQL.ExecuteSql(s);
  if DMSQL.Results[1]<>'0' then begin
    s:='update ":pam98_data:inf" set f_odstupm=1 where f_odstupm<>1;';
    DMSQL.ExecuteSql(s);
  end;
//7.krok
  s:= 'select count(*) from ":pam98_data:vyp" where rezerva1 is null';
  DMSQL.ExecuteSql(s);
  if DMSQL.Results[1]<>'0' then begin
    s:='update ":pam98_data:vyp" set rezerva1=0 where rezerva1 is null;';
    DMSQL.ExecuteSql(s);
  end;
//8.krok
  s:= 'select count(*) from ":pam98_data:vyp" where v_obdobie between 200601 and 200612 and vyrovnanie_zp<>0 and '+
    'V_PLAT+N_premie+N_odmeny+N_clenovia_organov+N_priplat+N_Nahrada+N_Nemohol+N_HOLIDAY+N_SVIATOK+'+
    'N_DOHODY_OVP+N_DOHODY_OPC+N_socfond+N_pohotovost+N_odstupne+N_jednoraz1+N_jednoraz2+N_nahrada_pn+N_mimo_poistne<>n_brutto';
  DMSQL.ExecuteSql(s);
  if Copy(DMSQL.Results[1],1,1)>'0' then begin
    s:= 'update ":pam98_data:vyp" '+
        'set n_brutto='+
        'V_PLAT+N_premie+N_odmeny+N_clenovia_organov+N_priplat+N_Nahrada+N_Nemohol+N_HOLIDAY+N_SVIATOK+'+
        'N_DOHODY_OVP+N_DOHODY_OPC+N_socfond+N_pohotovost+N_odstupne+N_jednoraz1+N_jednoraz2+N_nahrada_pn+N_mimo_poistne'+
        ' where v_obdobie between 200601 and 200612 and vyrovnanie_zp<>0 and '+
        'V_PLAT+N_premie+N_odmeny+N_clenovia_organov+N_priplat+N_Nahrada+N_Nemohol+N_HOLIDAY+N_SVIATOK+'+
        'N_DOHODY_OVP+N_DOHODY_OPC+N_socfond+N_pohotovost+N_odstupne+N_jednoraz1+N_jednoraz2+N_nahrada_pn+N_mimo_poistne<>n_brutto';
    DMSQL.ExecuteSql(s);
  end;
//11.krok
  s:= 'select max(id) from ":pam98_comm:prerus1"';
  DMSQL.ExecuteSql(s);
  if Copy(DMSQL.Results[1],1,1)<='7' then begin
    s:='insert into ":pam98_comm:prerus1" values ("8","trvanie doËasnej pracovnej neschopnosti odo dÚa nasleduj˙ceho po uplynutÌ 52 t˝ûdÚov")';
    DMSQL.ExecuteSql(s);
    s:='update ":pam98_comm:prerus1" set popis="zamestnanec Ëerp· rodiËovsk˙ dovolenku" where id=6';
    DMSQL.ExecuteSql(s);
    s:='update ":pam98_comm:prerus1" set popis="SZ»O m· n·rok na rodiËovsk˝ prÌspevok" where id=7';
    DMSQL.ExecuteSql(s);
  end;
//12.krok
  s:= 'select max(typ) from ":pam98_comm:cis_doch"';
  DMSQL.ExecuteSql(s);
  if Copy(DMSQL.Results[1],1,1)='7' then begin
    s:='delete from ":pam98_comm:cis_doch" where typ=6';
    DMSQL.ExecuteSql(s);
    s:='update ":pam98_comm:cis_doch" set typ=6 where typ=7';
    DMSQL.ExecuteSql(s);
  end;
//13.krok
  s:= 'select max(typ) from ":pam98_data:doch"';
  DMSQL.ExecuteSql(s);
  if Copy(DMSQL.Results[1],1,1)='7' then begin
    s:='update ":pam98_data:doch" set typ=6 where typ=7';
    DMSQL.ExecuteSql(s);
  end;
//14.krok
  s:= 'select min(id) from ":pam98_comm:prerus1"';
  DMSQL.ExecuteSql(s);
  if Copy(DMSQL.Results[1],1,1)='0' then begin
    s:='delete from ":pam98_comm:prerus1" where id=0';
    DMSQL.ExecuteSql(s);
  end;
//15.krok
if UpperCase(Copy(DM.TINF_Nazov.Value,1,8))='DEKTRADE' then
begin
  s:= 'select count(*) from ":pam98_data:vyp" where v_obdobie=200707 and n_brutto-n_poist-d_preddavok-d_dan+d_bonus_cerpany+vyrovnanie_zp-n_netto<>0';
  DMSQL.ExecuteSql(s);
  pocetVyplat := StrToInt(DMSQL.Results[1]);
  if pocetVyplat > 0 then begin
    s:='update ":pam98_data:vyp" set vyrovnanie_zp=0 where v_obdobie=200707 and n_brutto-n_poist-d_preddavok-d_dan+d_bonus_cerpany+vyrovnanie_zp-n_netto<>0';
    DMSQL.ExecuteSql(s);
    MyMessage('Bol identifikovan˝ problÈm so za˙ËtovanÌm roËnÈho z˙Ëtovania zdravotnÈho poistenia v mesiaci 7/2007, bolo opraven˝ch '+IntToStr(pocetVyplat)+' v˝plat.');
  end;
end;
//16.krok
  s:= 'select count(*) from ":pam98_comm:cis_par" where id=34';
  DMSQL.ExecuteSql(s);
  if Copy(DMSQL.Results[1],1,1)='0' then begin
    s:= 'insert into ":pam98_comm:cis_par" values (34,1,12,"IDENT_SOCPOIST","0","Identifik·cia pre soc.poisùovÚu: 0=I»O,1=DI»")';
    DMSQL.ExecuteSql(s);
  end;
//17.krok
  s:= 'select min(typ) from ":pam98_comm:typzec"';
  DMSQL.ExecuteSql(s);
  if Copy(DMSQL.Results[1],1,1)='1' then begin
    s:='insert into ":pam98_comm:typzec" values ("0","zamestnanec na dobu urËit˙")';
    DMSQL.ExecuteSql(s);
  end;
//19.krok
  s:= 'select count(*) from ":pam98_comm:cis_par" where id=36';
  DMSQL.ExecuteSql(s);
  if Copy(DMSQL.Results[1],1,1)='0' then begin
    s:= 'insert into ":pam98_comm:cis_par" values (36,1,12,"NC_OSOBA_PRIJEM_MIN","498000","Hranica z·kl.dane pre nekr·tenie nezd.Ëiastky na osobu")';
    DMSQL.ExecuteSql(s);
  end;
}
end;

procedure TFormMain.mnu_rozdeldan1Click(Sender: TObject);
begin
  DMV.ROZDEL_DAN;
end;

procedure TFormMain.Show_RTF_ZDR_DOKLAD(Sender: TObject);
begin with DMZ do begin
  DM.NaplnMyReportParam(X);
  X.Code_emp1:=TZAM_Code_emp.Value;
  X.Code_emp2:=TZAM_Code_emp.Value;
  X.AktObdobie:=DM.AktObdobie;
  X.Typ:='RTF_ZDR_DOKLAD';
  X.JedenPracovnik:=True;
  X.Silent:=True;
  RunReport(X);
end;end;

procedure TFormMain.Show_RTF_ZDR_OZNAM(Sender: TObject);
begin with DMZ do begin
  DM.NaplnMyReportParam(X);
  X.Code_emp1:=TZAM_Code_emp.Value;
  X.Code_emp2:=TZAM_Code_emp.Value;
  X.AktObdobie:=DM.AktObdobie;
  X.Typ:='RTF_ZDR_OZNAM';
  X.JedenPracovnik:=True;
  X.Silent:=True;
  RunReport(X);
end;end;

procedure TFormMain.Button1Click(Sender: TObject);
begin
 DMZ.ZDR_VYPOCET_DOKLADU;
end;

procedure TFormMain.Button2Click(Sender: TObject);
begin
  if SuRozpracovaneZmeny1
  then raise EMyError.Create(SMyAppEditMode);
  Show_RTF_ZDR_DOKLAD(Sender);
end;

procedure TFormMain.Oznmeniezamestnvateaopreplatkochanedoplatkoch1Click(
  Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ZP05OZVY';
  RunReport(X);
end;

procedure TFormMain.Oznmeniezamestnvateaopreplatkochanedoplatkochprloha1Click(
  Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ZP05OZPR';
  RunReport(X);
end;

procedure TFormMain.rzzp_zauctovanieClick(Sender: TObject);
begin
  DMV.Zauctuj_RZZP_Do_Vyplaty;
end;

procedure TFormMain.Button3Click(Sender: TObject);
begin
  if SuRozpracovaneZmeny1
  then raise EMyError.Create(SMyAppEditMode);
  Show_RTF_ZDR_OZNAM(Sender);
end;

procedure TFormMain.tlac_sp_xml_2_5Click(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  if X.AktObdobie>=ZAKON_2014_01
    then X.Typ := 'SPXML/v2014'
  else if X.AktObdobie>=ZAKON_2013_01
    then X.Typ := 'SPXML/v2013'
  else if X.AktObdobie>=ZAKON_2011_01
    then X.Typ := 'SPXML/v2011'
  else if X.AktObdobie>=ZAKON_2008_07
    then X.Typ := 'SPXML/2.7'
  else if X.AktObdobie>=200608
    then X.Typ := 'SPXML/2.5'
  else if X.AktObdobie<200608
    then X.Typ := 'SPXML';
  RunReport(X);
end;

procedure TFormMain.mnu_garpoistClick(Sender: TObject);
var s:string;
begin
 if not MyOtazka(SMyAppNaozajSpustitGfkGarancne) then exit;
{1.krok-zamestnanci}
  s:= 'select count(*) from ":pam98_data:zam" where u_garancne=0';
  DMSQL.ExecuteSql(s);
  if Copy(DMSQL.Results[1],1,1)>'0' then begin
    s:= 'update ":pam98_data:zam" set u_garancne=1 where u_garancne=0';
    DMSQL.ExecuteSql(s);
  end;
{2.krok-v˝platy v aktu·lnom mesiaci}
  s:= 'select count(*) from ":pam98_data:vyp" where (u_garancne=0 or rezerva1=0)and v_obdobie='+IntToStr(DM.AktObdobie);
  DMSQL.ExecuteSql(s);
  if DMSQL.Results[1]<>'0' then begin
    s:='update ":pam98_data:vyp" set u_garancne=1,rezerva1=1 where (u_garancne=0 or rezerva1=0) and v_obdobie='+IntToStr(DM.AktObdobie)+';';
    DMSQL.ExecuteSql(s);
  end;
  DMV.AKTUALIZUJ_VYPLATY(3);
  MyMessage(SMyAppGfkGarancneHotovo);
end;

procedure TFormMain.tlac_zp_601Click(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ZP601';
  RunReport(X);
end;

procedure TFormMain.tlac_sp1p_pdfClick(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='SP_PDF_PR';
  RunReport(X);
end;

procedure TFormMain.Tlaivoprihlseniezamestnanca1Click(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  TDateTimePicker.Create(Application);
  X.Typ:='SP_PRIHLAS';
  RunReport(X);
end;

procedure TFormMain.SPEED_ZAM_DOLNYClick(Sender: TObject);
begin
  DbGrid_cis7.Visible := not DbGrid_cis7.Visible;
  SPEED_ZAM_DOLNY.Down := not SPEED_ZAM_DOLNY.Down;
end;

procedure TFormMain.tvrronprehadpotvrdenie1Click(Sender: TObject);
begin
  ExecuteFileX(MyFrmPath+'Du_potvrd_stvrtrocne_hlasenie_2007.pdf','','',1);
end;

procedure TFormMain.Ronhlseniepotvrdenie1Click(Sender: TObject);
begin
  ExecuteFileX(MyFrmPath+'Du_potvrd_rocne_hlasenie_2007.pdf','','',1);
end;

procedure TFormMain.Zpotovlist1Click(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.AktObdobie:=DM.AktObdobie;
  X.Typ:='ZAPOCET';
  X.JedenPracovnik:=True;
  RunReport(X);
end;

procedure TFormMain.Edit_zam_filterKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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
  SET_FILTER(GET_FILTER(MyZamFilter,DM.AktSidFilter));
end;end;

procedure TFormMain.Akcia_Start_Shoparena(Sender: TObject);
begin
  ExecuteFile('http://www.shoparena.sk','','',1)
end;

procedure TFormMain.Servisnzsahvymazvyplat112008stredisko81Click(
  Sender: TObject);
var s: string;
begin
//1A.krok
  if not MyOtazka ('Bud˙ vymazanÈ vöetky v˝platy strediska 8 v mesiaci 11/2008. Pred t˝mto krokom najskÙr vykonajte z·lohu ˙dajov!!!. PokraËovaù ?')
  then exit;
  s:= 'select count(*) from ":pam98_data:vyp" where v_obdobie=200811 and sid=8';
  DMSQL.ExecuteSql(s);
  if DMSQL.Results[1]<>'0' then begin
    s:= 'delete from ":pam98_data:vyp" where v_obdobie=200811 and sid=8';
    DMSQL.ExecuteSql(s);
    MyMessage('Vsetky v˝platy v mesiaci 11/2008 na stredisku 8 boli vymazanÈ.');
  end else MyMessage('éiadne v˝platy v mesiaci 11/2008 na stredisku 8 neboli n·jdenÈ.');
end;

procedure TFormMain.RonhlsenieaszamestnanciEXCEL1Click(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='VD2XLS';
  RunReport(X);
end;

procedure TFormMain.Akcia_zam_platni_vroku(Sender: TObject);
begin with DM,DMZ do begin
   MyZamFilter:='R';
   mnu_zobr_r.Checked := True;
   SET_FILTER(GET_FILTER(MyZamFilter,AktSidFilter));
{   SET_FILTER('(Vystup=null or Vystup>='''+DateToStr(EncodeDate(AktRok,AktMesiac,1))+''') and '
               +'Nastup<='''+DateToStr(LastDayDate(AktRok,AktMesiac,31))+''' and '+AktSidFilter);
}
end;end;

procedure TFormMain.mnu_imp_csv_specif1Click(Sender: TObject);
var ii:integer;FNLOG,FNI,s,s1,s2,df,pom:string;pp,pz,pc,pch,ank:longint;
  F1,FI:TextFile;
  Stred:array[1..99] of integer;
  prvok:integer;
begin with DM,DMZ,DMV do begin
  if MyVerziaMenu <> 'EXT' then begin
    MyMessage(SMyAppOnlyForExtendedVersion);
    exit;
  end;
  for ii:=1 to 99 do Stred[ii]:=0;
  if NOT DirectoryExists(MyAppPath+MenoXmlDir+'\') then
      CreateDir(MyAppPath+MenoXmlDir+'\');
  FNI := VyberSuboru1(MyStdImpPath,'CSV files (*.csv)|*.csv');
  if FNI='' then exit;
  FNLOG := FNI + '.log';
  if not MyOtazka(Format(SMyAppImportVyplatNaozajSpustit,[FNI,DM.AktMesiac,DM.AktRok])) then exit;
  try
  TZAM_.Filtered := False;
  Screen.Cursor:=crHourGlass;
  if not FileExists(FNI) then begin MyMessage(Format(SMyAppFileNotFound,[FNI])); exit; end;
  assignfile(F1,FNLOG);
  assignfile(FI,FNI);
  rewrite(F1);
  reset(FI);
  writeln(F1,'NA»ÕTANIE ⁄DAJOV - ZOZNAM CH›B');
  writeln(F1,'-------------------------------------------');
  pp:=0;pz:=0;pch:=0;
  Myconsts.Progress(0);
  UCTUJ_HSV:=true;
  UCTUJ_MDB:=true;
  pc:=0;
  reset(FI);
  while not eof(FI) do begin
    readln(FI,s); inc(pc);
  end;
  s:='delete from ":pam98_data:vyp" where v_obdobie='+IntToStr(DM.AktObdobie);
  //if MyOtazka(Format(SMyAppVymazVyplatPriImporte,[DM.AktMesiac,DM.AktRok])) then DMSQL.ExecuteSql(s);
  TVYP_.Refresh;
  reset(FI);
  while not eof(FI) do begin
    readln(FI,s); parseCsv(s);
  try
    begin
      ank:=StrToInt(MyParser[1]);
      if EXISTUJE_ZAM(ank) then begin
        inc(pz);
        if TVYP_.FindKey([TZAM_Code_emp.Value,DM.AktObdobie])
         then TVYP_.Edit
          else TVYP_.Insert;
        TVYP_V_den.Value := StrToFloat(MyParser[2]);
        TVYP_V_hodina.Value := StrToFloat(MyParser[3]);
        TVYP_F_sadzba_premii.Value := StrToFloat(MyParser[4]);
        TVYP_N_mimo_poistne.Value := StrToFloat(MyParser[5]);
        TVYP_V_holiday.Value := StrToFloat(MyParser[6]);
        TVYP_Ne_stravne.Value := StrToFloat(MyParser[7]);
        TVYP_Vh_nadcas.Value := StrToFloat(MyParser[8]);
        TVYP_Vh_nedela.Value := StrToFloat(MyParser[9]);
        TVYP_.Post;
        writeln(F1,'Os.ËÌslo: '+RPAD(FloatToStr(ank),6,' ')+' O.K.');
      end
      else begin
        inc(pch);
        writeln(F1,'Os.ËÌslo: '+RPAD(FloatToStr(ank),6,' ')+' chyba: Zamestnanec nen·jden˝');
      end;
    end;
    except
      on E:Exception do begin
      TVYP_.Cancel;
      TZAM_.Cancel;
      inc(pch);
      writeln(F1,'Os.ËÌslo: '+RPAD(FloatToStr(ank),6,' ')+' chyba:'+E.Message);
      end;
    end;
    inc(pp);
    Myconsts.Progress(trunc(pp/pc*100));
  end;
  finally
  Screen.Cursor:=crDefault;
  Chdir(MyAppPath);
  UCTUJ_HSV:=false;
  UCTUJ_MDB:=false;
  Myconsts.Progress(100);
  TZAM_.Filtered := True;
  try
  CloseFile(F1);
  CloseFile(FI);except end;
  end;
  if pch=0 then MyMessage(Format(SMyAppAccessImportHotovo,[pz]))
  else ExecuteFileX('notepad',FNLOG,'',1);
end;end;

procedure TFormMain.VplatnpskycezEMAIL1Click(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='VP';
  X.Bullzip:=TRUE;
  RunReport(X);
end;

procedure TFormMain.NepravidelnprjemvkayPDF1Click(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='SP_PDF/NP';
  RunReport(X);
end;

procedure TFormMain.NepravidelnprjemvkazPDF1Click(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='SP_PDF_PR/NP';
  RunReport(X);
end;

procedure TFormMain.NepravidelnprjemvkazpoistnhoXML1Click(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  if X.AktObdobie >= ZAKON_2013_12 then X.Typ := 'VPPXML/v2014'
  else if X.AktObdobie >= ZAKON_2013_01 then X.Typ := 'VPPXML/v2013'
  else X.Typ := 'VPPXML/v2011';
  RunReport(X);
end;

procedure TFormMain.EXTZostavadohodrovvCSVformte1Click(Sender: TObject);
begin
  if MyVerziaMenu <> 'EXT' then begin
    MyMessage(SMyAppOnlyForExtendedVersion);
    exit;
  end;
  DM.NaplnMyReportParam(X);
  X.Typ := 'DHD';
  RunReport(X);
end;


procedure TFormMain.EXTImportvplatzCSVpodapecifikcie11Click(
  Sender: TObject);
var s: string;
begin
  if MyVerziaMenu <> 'EXT' then begin
    MyMessage(SMyAppOnlyForExtendedVersion);
    exit;
  end;
  if not MyOtazka (SMyAppNaozajSpustitGfkZmenaNaDohodarov) then exit;
//Vykonna cast ZAM
  s:= 'select count(*) from ":pam98_data:zam" where typzec<>2 or vynimka_vz<>''0''';
  DMSQL.ExecuteSql(s);
  MyMessage('Pocet menenych ZAM zaznamov je '+DMSQL.Results[1]);
  if (StrToInt(DMSQL.Results[1])<>0) then begin
    s:='update ":pam98_data:zam" set typzec=2, vynimka_vz=''0''';
    DMSQL.ExecuteSql(s);
    DMZ.TZAM_.Refresh;
  end;
//Vykonna cast VYP
  s:= 'select count(*) from ":pam98_data:vyp" where vynimka_vz<>''0''';
  DMSQL.ExecuteSql(s);
  MyMessage('Pocet menenych VYP zaznamov je '+DMSQL.Results[1]);
  if (StrToInt(DMSQL.Results[1])<>0) then begin
    s:='update ":pam98_data:vyp" set vynimka_vz=''0''';
    DMSQL.ExecuteSql(s);
    DMV.TVYP_.Refresh;
  end;
  MyMessage(SMyAppCompleted);
end;
procedure TFormMain.DBZ_RodCisloChange(Sender: TObject);
var rc:string; X:TDateTime; YY,MM,DD: word;
begin with DMZ do begin
  if not (TZAM_.State in [dsEdit,dsInsert]) then exit;
  rc := DBZ_RodCislo.Text;
  if length(rc)<9 then exit;
  if (Copy(rc,3,1)='5') or (Copy(rc,3,1)='6')
   then TZAM_Pohlavie.Value := 'Z'
     else TZAM_Pohlavie.Value := 'M';
  try
    YY:=StrToInt(Copy(rc,1,2));
    MM:=StrToInt(Copy(rc,3,2));
    DD:=StrToInt(Copy(rc,5,2));
    if YY>=20 then YY:=1900+YY else YY:=2000+YY;
    if (MM-50>=1) and (MM-50<=12) then MM:=MM-50;
    if (MM<1) or (MM>12) then exit;
    if (DD<1) or (DD>31) then exit;
    TZAM_Born_date.Value := EncodeDate(YY,MM,DD);
  except
    exit;
  end;
end;end;

procedure TFormMain.EXTZmenavetkchzamestnancovnadohodrov1Click(
  Sender: TObject);
var CC: longint;
begin with DMZ do begin
  CC:=0;
  DMZ.DS_ZAM1.Enabled := True;
  TZAM_.First;
  while not TZAM_.EOF do begin
    TZAM_.Edit;
    DBZ_RodCisloChange(Sender);
    CC:=CC+1;
    TZAM_.Post;
    TZAM_.Next;
  end;
  DMZ.DS_ZAM1.Enabled := False;
  MyMessage('Pocet spracovanych zaznamov: '+IntToStr(CC));
end;end;

procedure TFormMain.MesVykPdfClick(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ZP_PDF';
  X.Vyber_ZP:=True;
  RunReport(X);
end;

procedure TFormMain.MesanvkazpreddavkovXML1Click(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='DU_MESVYK_XML';
  RunReport(X);
end;

procedure TFormMain.vykaz_580Click(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ZP_580';
  X.Vyber_ZP:=True;
  RunReport(X);
end;

procedure TFormMain.RonztovanieCSV1Click(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ZP_580_CSV';
  X.Vyber_ZP:=True;
  RunReport(X);
end;

procedure TFormMain.Vypl4Click(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='VL4';
  RunReport(X);
end;

procedure TFormMain.SpeedButton3Click(Sender: TObject);
begin
 ExecuteFile(MyFrmPath+'pdf\Novinky od 01.01.pdf','','',1)
end;

procedure TFormMain.Image601_pomocClick(Sender: TObject);
begin
 ExecuteFileX(MyFrmPath+'help\ZP_Davka601.pdf','','',1);
 Show;
end;

procedure TFormMain.Image601_NovinkyClick(Sender: TObject);
begin
 ExecuteFileX(MyFrmPath+'help\VSZP_2013_Novinky.pdf','','',1);
 Show;
end;

procedure TFormMain.Image601_ZamtelClick(Sender: TObject);
begin
 ExecuteFileX(MyFrmPath+'help\VSZP_2013_Zamestnavatel.pdf','','',1);
 Show;
end;

procedure TFormMain.PC_NEPChange(Sender: TObject);
begin with DMZ do begin
  TNEP_.Filtered:=False;
  if PC_NEP.ActivePage=TAB_NEP_SP_PRIHLASKA then begin
    TNEP_.Filter:='typrl=''PA''';
  end
  else if PC_NEP.ActivePage=TAB_NEP_SP_ODHLASKA then begin
    TNEP_.Filter:='typrl=''OD''';
  end
  else if PC_NEP.ActivePage=TAB_NEP_SP_ZMENA then begin
    TNEP_.Filter:='typrl=''ZM''';
  end
  else if PC_NEP.ActivePage=TAB_NEP_SP_ZRUSENIE then begin
    TNEP_.Filter:='typrl=''ZP''';
  end
  else if PC_NEP.ActivePage=TAB_NEP_SP_PRERUSENIE then begin
    TNEP_.Filter:='typrl=''PE''';
    if DBGrid_SP_PRERUSENIE.CanFocus then DBGrid_SP_PRERUSENIE.SetFocus;
  end
  else if PC_NEP.ActivePage=TAB_NEP_PN then begin
    TNEP_.Filter:='typrl=''10''';
  end
  else if PC_NEP.ActivePage=TAB_NEP_OCR then begin
    TNEP_.Filter:='typrl=''11''';
  end
  else if PC_NEP.ActivePage=TAB_NEP_INE then begin
    TNEP_.Filter:='typrl=''00''';
  end;
  TNEP_.Filtered:=True;
end;end;

procedure TFormMain.spusti_zalohovanie(Sender: TObject; BOOL_Vynutene: boolean);
var i,zz:integer;s,nazov5,AdrRok:string;
  AYear,AMonth,ADay:word;mmdd:string[4];
begin
  if NOT DirectoryExists('Zaloha') then CreateDir('Zaloha');
  try
  Chdir('Zaloha');
  finally
  Chdir(MyAppPath);
  end;
  DecodeDate(Now, AYear, AMonth, ADay);
  mmdd:= Format('%.2d%.2d',[AMonth,ADay]);
  MyBkpPath:=MyNetPath+'ZALOHA\';
  if BOOL_Vynutene then begin
    if NOT MyOtazka(Format(SMyAppRunZalohovanieVynutene,['"'+MyBkpPath+'"'])) then exit;
  end else begin
    if NOT MyOtazka(Format(SMyAppRunZalohovanie,['"'+MyBkpPath+'"'])) then exit;
  end;
  {}
  Akcia_zatvorenie_db(nil);
  Akcia_priprav_menu(Sender);
  {}
  if FileExists(MyCommPth+'setup.db') then begin
    ExecuteFileX(MenoZip,ParametreZip+'"'+MyBkpPath+nazov5+'com" "'+MyCommPth+'*"',MyAppPath,1);
  end;
  MyBkpPath:=MyNetPath+'ZALOHA\';
  for i:=1 to 99 do
  begin
   if i=0 then s:='' else s:=Format('%.2d',[i]);
   if FileExists(MyNetPath+'DATA'+s+'\inf.db') then begin
      for zz:=1 to 9999 do begin
         nazov5:='z'+IntToStr(AYear)+'.'+IntToStr(zz)+'.';
         if not FileExists(MyBkpPath+nazov5+'data'+s+'.zip') then begin
           ExecuteFileX(MyAppPath+MenoZip,' -r -9 "'+MyBkpPath+nazov5+'data'+s+'.zip" "./*.*"',MyNetPath+'data'+s+'\',1);
           break;
         end;
      end;
   end;
  end;
  ZapisDatumPoslednejZalohy;
end;

procedure TFormMain.RocneHlaseniePreddavkoEdaneClick(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='DU_ROKVYK_XML';
  RunReport(X);
end;

procedure TFormMain.tlac_zp_zlucene_txtClick(Sender: TObject);
begin
  DM.NaplnMyReportParam(X);
  X.Typ:='ZPTXT_ZLUC';
  X.Vyber_ZP:=True;
  RunReport(X);
end;

procedure TFormMain.N11Spojeniestredskdatabz1Click(Sender: TObject);
var
  s,LogFN: string;
  i,new_code_emp,pc,pp: longint;
begin
  if not MyOtazka('Naozaj si zelate vykonat spojenie databaz v adresaroch __DATA01 a __DATA02 ?') then exit;
  SL_Report := TStringList.Create;
  SL_Report.Add('  PROTOKOL - SPOJENIE DATABAZ __DATA01 a __DATA02');
  SL_Report.Add('================================================================================');
  DBTables.Session.DeleteAlias('__DATA01');
  DBTables.Session.AddStandardAlias('__DATA01',MyNetPath + '__DATA01','PARADOX');
  DBTables.Session.DeleteAlias('__DATA02');
  DBTables.Session.AddStandardAlias('__DATA02',MyNetPath + '__DATA02','PARADOX');
  ForceDirectories(MyNetPath + '__DATA02\logs');
  LogFN := MyNetPath + '__DATA02\logs\spojdata.log';

  s:= 'select MAX(code_emp)+1 from ":__DATA01:zam"';
  DMSQL.ExecuteSql(s);
  new_code_emp := StrToInt(DMSQL.Results[1]);

  try
  T1 := TTable.Create(Application);
  T2 := TTable.Create(Application);
  TID:= TTable.Create(Application);
  T1.DatabaseName := '__DATA01';
  T2.DatabaseName := '__DATA02';
  TID.DatabaseName := '__DATA02';
{Spracuj ZAM tabulku}
  T1.TableName := 'zam.db';
  T2.TableName := 'zam.db';
  TID.TableName := 'IDS.db';
  T1.Open;
  T2.Open;
  TID.Open;
  while not TID.EOF do TID.Delete;
  Myconsts.Progress(0);
  pc:= T2.RecordCount;
  pp:= 0;
  while not T2.EOF do Begin
    inc(pp);
    Myconsts.Progress(trunc(pp/pc*100));
    T1.Insert;
    TID.Insert;
    T1.Fields[0].AsString := T2.Fields[0].AsString;
    T1.Fields[1].Value := new_code_emp; new_code_emp := new_code_emp + 1;
    for i := 2 to T1.FieldDefs.Count-1 do T1.Fields[i] := T2.Fields[i];
    T1.Post;
    TID.Insert;
    TID.Fields[0].AsString := T2.Fields[1].AsString;
    TID.Fields[1].AsString := T1.Fields[1].AsString;
    TID.Post;
    SL_Report.Add('OK: '+TID.Fields[0].AsString+' => '+TID.Fields[1].AsString+','+T1.Fields[4].AsString+' '+T1.Fields[3].AsString);
    T2.Next;
  end;
  T1.Close;
  T2.Close;
{Spracuj VYP tabulku}
  T1.TableName := 'vyp.db';
  T2.TableName := 'vyp.db';
  T1.Open;
  T2.Open;
  Myconsts.Progress(0);
  pc:= T2.RecordCount;
  pp:= 0;
  while not T2.EOF do Begin
    inc(pp);
    Myconsts.Progress(trunc(pp/pc*100));
    T1.Insert;
    TID.FindKey([T2.Fields[0].Value]);
    T1.Fields[0].Value := TID.Fields[1].Value;
    for i := 1 to T1.FieldDefs.Count-1 do T1.Fields[i].Value := T2.Fields[i].Value;
    T1.Post;
    T2.Next;
  end;
  T1.Close;
  T2.Close;
  TID.Close;
  SL_Report.SaveToFile(LogFN);
  ExecuteFileX('notepad',LogFN,'',1);
  finally
    Myconsts.Progress(100);
    if T1 <> nil then T1.Destroy;
    if T2 <> nil then T2.Destroy;
    if TID <> nil then TID.Destroy;
  end;
end;

procedure TFormMain.N12Spojenieud1Click(Sender: TObject);
var
  s,LogFN: string;
  i,new_code_emp,pc,pp: longint;
begin
  if not MyOtazka('Naozaj si zelate vykonat spojenie ludi na stredisku 10 podla rodneho cisla v adresari __DATA00 ?') then exit;
  try
  SL_Report := TStringList.Create;
  SL_Report.Add('  PROTOKOL - SPOJENIE LUDI - STREDISKO 10 - PODLA RODNEHO CISLA');
  SL_Report.Add('================================================================================');
  DBTables.Session.DeleteAlias('__DATA00');
  DBTables.Session.AddStandardAlias('__DATA00',MyNetPath + '__DATA00','PARADOX');
  ForceDirectories(MyNetPath + '__DATA00\logs');
  LogFN := MyNetPath + '__DATA00\logs\spojludi.log';

  s:= 'delete from ":__DATA00:IDS"';
  DMSQL.ExecuteSql(s);
{Spracuj ZAM tabulku}
  s:=
   'INSERT INTO ":__DATA00:IDS" ' +
   'SELECT a.CODE_EMP AS OLD_ID, ' +
   '                 MIN(b.CODE_EMP) AS NEW_ID ' +
   'FROM ":__DATA00:ZAM" a, ":__DATA00:ZAM" b ' +
   'WHERE a.SID = 10 AND b.born_numb = a.born_numb ' +
   'GROUP BY a.CODE_EMP';
  DMSQL.ExecuteSql(s);
  s:= 'delete from ":__DATA00:IDS" WHERE OLD_ID IS NULL';
  DMSQL.ExecuteSql(s);

  s:= 'update ":__DATA00:ZAM" SET C_PASU=''0'' WHERE CODE_EMP IN (SELECT OLD_ID FROM ":__DATA00:IDS" WHERE OLD_ID = NEW_ID)';
  DMSQL.ExecuteSql(s);

  s:= 'delete from ":__DATA00:IDS" WHERE OLD_ID = NEW_ID';
  DMSQL.ExecuteSql(s);

  try
  TID:= TTable.Create(Application);
  TID.DatabaseName := '__DATA00';
  TID.TableName := 'IDS';
  TID.Open;
  Myconsts.Progress(0);
  pc:= TID.RecordCount;
  pp:= 0;
  SL_Report.Add('Pocet duplicitnych zamestnancov: '+IntToStr(pc));
  while not TID.EOF do Begin
    inc(pp);
    Myconsts.Progress(trunc(pp/pc*100));
    s:= 'update ":__DATA00:VYP" SET CODE_EMP = '+TID.Fields[1].AsString + ' WHERE CODE_EMP = ' + TID.Fields[0].AsString;
    DMSQL.ExecuteSql(s);
    TID.Next;
  end;
{Zmaz nepotrebnych zamestnancov}
  TID.First;
  Myconsts.Progress(0);
  pc:= TID.RecordCount;
  pp:= 0;
  while not TID.EOF do Begin
    inc(pp);
    Myconsts.Progress(trunc(pp/pc*100));
    try
    s:= 'delete from ":__DATA00:ZAM" WHERE CODE_EMP = '+TID.Fields[0].AsString;
    DMSQL.ExecuteSql(s);
    SL_Report.Add('OK: '+TID.Fields[0].AsString+' => '+TID.Fields[1].AsString);
    except
    SL_Report.Add('ERR: '+TID.Fields[0].AsString+' => '+TID.Fields[1].AsString);
    end;
    TID.Next;
  end;
  SL_Report.SaveToFile(LogFN);
  ExecuteFileX('notepad',LogFN,'',1);
finally
    TID.Close;
    Myconsts.Progress(100);
    if TID <> nil then TID.Destroy;
  end;
  finally
    if SL_Report <> nil then SL_Report.Destroy;
  end;
end;

procedure TFormMain.EXT1Click(Sender: TObject);
begin
  if MyVerziaMenu <> 'EXT' then begin
    MyMessage(SMyAppOnlyForExtendedVersion);
    exit;
  end;
  DM.NaplnMyReportParam(X);
  X.Typ := 'DHD2';
  RunReport(X);
end;

procedure TFormMain.Akcia_start_itstudio(Sender: TObject);
begin
  ExecuteFile('http://www.itstudio24.eu','','',1)
end;

procedure TFormMain.Akcia_start_zelpsisa(Sender: TObject);
begin
  ExecuteFile('http://www.keratin-exclusive.sk','','',1)
end;


procedure TFormMain.Akcia_start_audio(Sender: TObject);
begin
  ExecuteFile('http://www.audiotuningclub.com','','',1)
end;






procedure TFormMain.Label561Click(Sender: TObject);
begin
  ExecuteFile('http://pam98.eu/wp/archives/136','','',1);
end;



end.

