�
 TDMHP 0,  TPF0TDMHPDMHPLeft� Top}Height� Width TQueryQ0A_DatabaseName
PAM98_DATASQL.Stringsselect '3' poradie,x.suma sporenie,'      ' predcislo_u,
y.cislo_u,
y.banka_u,	y.ssym_u,y.ksym,y.vsym,y.buid_typ,y.buid_kod,y.iban"from ":pam98_priv:nakl" x,cis_bu ywhere   x.ident_symbol=y.buid_typ and  x.ident_cislo=y.buid_kod and  x.suma > 0 and  y.cislo_u <> '' LeftTop TStringFieldQ0A_poradie	FieldNameporadieSize  TCurrencyFieldQ0A_sporenie	FieldNamesporenie  TStringFieldQ0A_predcislo_u	FieldNamepredcislo_uSize  TStringFieldQ0A_cislo_u	FieldNamecislo_u  TStringFieldQ0A_banka_u	FieldNamebanka_uSize  TStringField
Q0A_ssym_u	FieldNamessym_uSize
  TStringFieldQ0A_ksym	FieldNameksymSize  TStringFieldQ0A_vsym	FieldNamevsymSize
  TStringFieldQ0A_buid_typ	FieldNamebuid_typSize  TSmallintFieldQ0A_buid_kod	FieldNamebuid_kod  TStringFieldQ0A_iban	FieldNameibanSize   TQueryQ0B_DatabaseName
PAM98_DATASQL.Stringsselect'1' poradie,v.sporenie,z.predcislo_u,
z.cislo_u,
z.banka_u,	z.ssym_u,z.ksym_u ksym,z.vsym_u vsym,v.ne_zaloha,z.born_numb born_numb,
z.surname,z.name,z.ibanfrom vyp v,zam z,inf iwhere   v.code_emp=z.code_emp and  v.v_obdobie = :p1 and  v.sid between :p2 and :p3 Params.Data
'     p1    p2    p3  c  Left9Top TStringFieldQ0B_poradie	FieldNameporadieSize  TCurrencyFieldQ0B_sporenie	FieldNamesporenie  TStringFieldQ0B_predcislo_u	FieldNamepredcislo_uSize  TStringFieldQ0B_cislo_u	FieldNamecislo_uSize
  TStringFieldQ0B_banka_u	FieldNamebanka_uSize  TStringField
Q0B_ssym_u	FieldNamessym_uSize
  TStringFieldQ0B_ksym	FieldNameksymSize  TStringFieldQ0B_vsym	FieldNamevsymSize
  TCurrencyFieldQ0B_ne_zaloha	FieldName	ne_zaloha  TStringFieldQ0B_born_numb	FieldName	born_numbSize  TStringFieldQ0B_surname	FieldNamesurname  TStringFieldQ0B_name	FieldNamename  TStringFieldQ0B_iban	FieldNameibanSize   TQueryQ0C_DatabaseName
PAM98_DATASQL.Stringsselect '2' poradie,v.vypocitana_suma suma,v.predcislo_u,
v.cislo_u,
v.banka_u,	v.ssym_u,v.ksym,v.vsym,v.iban,
z.surname,z.name,v.poznamka poznfrom zrv v,zam z,vyp xwhere   v.code_emp=z.code_emp and  v.v_obdobie = :p1 and  v.v_obdobie = x.v_obdobie and  v.code_emp = x.code_emp and  x.sid between :p2 and :p3 and  v.vypocitana_suma > 0 and  v.cislo_u <> '' Params.Data
+     p1        p2        p3        LeftiTop TStringFieldQ0C_poradie	FieldNameporadieSize  TCurrencyFieldQ0C_suma	FieldNamesuma  TStringFieldQ0C_predcislo_u	FieldNamepredcislo_uSize  TStringFieldQ0C_cislo_u	FieldNamecislo_uSize
  TStringFieldQ0C_banka_u	FieldNamebanka_uSize  TStringField
Q0C_ssym_u	FieldNamessym_uSize
  TStringFieldQ0C_ksym	FieldNameksymSize  TStringFieldQ0C_vsym	FieldNamevsymSize
  TStringFieldQ0C_surname	FieldNamesurname  TStringFieldQ0C_name	FieldNamename  TStringFieldQ0C_pozn	FieldNamepoznSize  TStringFieldQ0C_iban	FieldNameibanSize   TTableTHP1_BeforeDeleteTHP1_BeforeDeleteOnNewRecordTHP1_NewRecordDatabaseName
PAM98_DATASessionNameDefault	TableNameHp1.dbLeftTop3 TIntegerField	THP1_HPIDDisplayLabel
id z�znamu	FieldNameHPIDRequired	  TIntegerFieldTHP1_POR_CISLODisplayLabelporadov� ��slo	FieldName	POR_CISLORequired	  TStringFieldTHP1_CISLO_UDisplayLabel
��slo ��tu	FieldNameCISLO_URequired	  TStringFieldTHP1_BANKA_UDisplayLabel
banka ��tu	FieldNameBANKA_URequired	Size  
TDateFieldTHP1_DATUM_SPLATNOSTIDisplayLabeld�tum splatnosti	FieldNameDATUM_SPLATNOSTIRequired	  TStringField	THP1_IBAN	FieldNameIBANSize   TTableTHP2_BeforeInsertTHP2_BeforeInsertBeforeDeleteTHP2_BeforeDeleteOnNewRecordTHP2_NewRecordDatabaseName
PAM98_DATASessionNameDefaultIndexFieldNamesHPIDMasterFieldsHPIDMasterSourceDS_HP1	TableNameHp2.DBLeftTopc TIntegerField	THP2_HPID	FieldNameHPIDRequired	  TCurrencyField	THP2_SUMADisplayLabelSuma	FieldNameSUMARequired	DisplayFormat0.00  TStringFieldTHP2_CISLO_UDisplayLabel
��slo ��tu	FieldNameCISLO_URequired	  TStringFieldTHP2_BANKA_UDisplayLabel
banka ��tu	FieldNameBANKA_URequired	Size  TStringField	THP2_SSYM	FieldNameSSYMSize
  TStringField	THP2_KSYM	FieldNameKSYMSize  TStringField	THP2_VSYM	FieldNameVSYMSize
  TSmallintFieldTHP2_STRANA	FieldNameSTRANA  TStringField	THP2_IBAN	FieldNameIBANSize   TDataSourceDS_HP1AutoEditDataSetTHP1_OnStateChangeDS_HP1StateChangeLeft5Top3  TDataSourceDS_HP2AutoEditDataSetTHP2_OnStateChangeDS_HP2StateChangeLeft5Topc  TDataSourceDS_HP1GAutoEditDataSetTHP1_LeftmTop3  TDataSourceDS_HP2GAutoEditDataSetTHP2_LeftmTopc   