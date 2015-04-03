unit MSXML2_TLB;

{ This file contains pascal declarations imported from a type library.
  This file will be written during each import or refresh of the type
  library editor.  Changes to this file will be discarded during the
  refresh process. }

{ Microsoft XML, v6.0 }
{ Version 6.0 }

{ Conversion log:
  Warning: 'implementation' is a reserved word. IXMLDOMDocument.implementation changed to implementation_
  Warning: 'type' is a reserved word. Parameter 'type' in IXMLDOMDocument.createNode changed to 'type_'
  Warning: 'var' is a reserved word. Parameter 'var' in IXMLDOMSchemaCollection.add changed to 'var_'
  Warning: ISAXXMLReader.getBaseURL return parameter: Too many indirections, type changed to Pointer.. [ ^^Word ]
  Warning: ISAXXMLReader.getSecureBaseURL return parameter: Too many indirections, type changed to Pointer.. [ ^^Word ]
  Warning: ISAXLocator.getPublicId return parameter: Too many indirections, type changed to Pointer.. [ ^^Word ]
  Warning: ISAXLocator.getSystemId return parameter: Too many indirections, type changed to Pointer.. [ ^^Word ]
  Warning: ISAXAttributes.getURI parameter ppwchUri: Too many indirections, type changed to Pointer.. [ ^^Word ]
  Warning: ISAXAttributes.getLocalName parameter ppwchLocalName: Too many indirections, type changed to Pointer.. [ ^^Word ]
  Warning: ISAXAttributes.getQName parameter ppwchQName: Too many indirections, type changed to Pointer.. [ ^^Word ]
  Warning: ISAXAttributes.getName parameter ppwchUri: Too many indirections, type changed to Pointer.. [ ^^Word ]
  Warning: ISAXAttributes.getName parameter ppwchLocalName: Too many indirections, type changed to Pointer.. [ ^^Word ]
  Warning: ISAXAttributes.getName parameter ppwchQName: Too many indirections, type changed to Pointer.. [ ^^Word ]
  Warning: ISAXAttributes.getType parameter ppwchType: Too many indirections, type changed to Pointer.. [ ^^Word ]
  Warning: ISAXAttributes.getTypeFromName parameter ppwchType: Too many indirections, type changed to Pointer.. [ ^^Word ]
  Warning: ISAXAttributes.getTypeFromQName parameter ppwchType: Too many indirections, type changed to Pointer.. [ ^^Word ]
  Warning: ISAXAttributes.getValue parameter ppwchValue: Too many indirections, type changed to Pointer.. [ ^^Word ]
  Warning: ISAXAttributes.getValueFromName parameter ppwchValue: Too many indirections, type changed to Pointer.. [ ^^Word ]
  Warning: ISAXAttributes.getValueFromQName parameter ppwchValue: Too many indirections, type changed to Pointer.. [ ^^Word ]
  Warning: 'type' is a reserved word. ISchemaElement.type changed to type_
  Warning: 'type' is a reserved word. ISchemaAttribute.type changed to type_
 }

interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL;

const
  LIBID_MSXML2: TGUID = '{F5078F18-C551-11D3-89B9-0000F81FE221}';

const

{ Constants that define a node's type }

{ tagDOMNodeType }

  NODE_INVALID = 0;
  NODE_ELEMENT = 1;
  NODE_ATTRIBUTE = 2;
  NODE_TEXT = 3;
  NODE_CDATA_SECTION = 4;
  NODE_ENTITY_REFERENCE = 5;
  NODE_ENTITY = 6;
  NODE_PROCESSING_INSTRUCTION = 7;
  NODE_COMMENT = 8;
  NODE_DOCUMENT = 9;
  NODE_DOCUMENT_TYPE = 10;
  NODE_DOCUMENT_FRAGMENT = 11;
  NODE_NOTATION = 12;

{ Schema Object Model Item Types }

{ _SOMITEMTYPE }

  SOMITEM_SCHEMA = 4096;
  SOMITEM_ATTRIBUTE = 4097;
  SOMITEM_ATTRIBUTEGROUP = 4098;
  SOMITEM_NOTATION = 4099;
  SOMITEM_ANNOTATION = 4100;
  SOMITEM_IDENTITYCONSTRAINT = 4352;
  SOMITEM_KEY = 4353;
  SOMITEM_KEYREF = 4354;
  SOMITEM_UNIQUE = 4355;
  SOMITEM_ANYTYPE = 8192;
  SOMITEM_DATATYPE = 8448;
  SOMITEM_DATATYPE_ANYTYPE = 8449;
  SOMITEM_DATATYPE_ANYURI = 8450;
  SOMITEM_DATATYPE_BASE64BINARY = 8451;
  SOMITEM_DATATYPE_BOOLEAN = 8452;
  SOMITEM_DATATYPE_BYTE = 8453;
  SOMITEM_DATATYPE_DATE = 8454;
  SOMITEM_DATATYPE_DATETIME = 8455;
  SOMITEM_DATATYPE_DAY = 8456;
  SOMITEM_DATATYPE_DECIMAL = 8457;
  SOMITEM_DATATYPE_DOUBLE = 8458;
  SOMITEM_DATATYPE_DURATION = 8459;
  SOMITEM_DATATYPE_ENTITIES = 8460;
  SOMITEM_DATATYPE_ENTITY = 8461;
  SOMITEM_DATATYPE_FLOAT = 8462;
  SOMITEM_DATATYPE_HEXBINARY = 8463;
  SOMITEM_DATATYPE_ID = 8464;
  SOMITEM_DATATYPE_IDREF = 8465;
  SOMITEM_DATATYPE_IDREFS = 8466;
  SOMITEM_DATATYPE_INT = 8467;
  SOMITEM_DATATYPE_INTEGER = 8468;
  SOMITEM_DATATYPE_LANGUAGE = 8469;
  SOMITEM_DATATYPE_LONG = 8470;
  SOMITEM_DATATYPE_MONTH = 8471;
  SOMITEM_DATATYPE_MONTHDAY = 8472;
  SOMITEM_DATATYPE_NAME = 8473;
  SOMITEM_DATATYPE_NCNAME = 8474;
  SOMITEM_DATATYPE_NEGATIVEINTEGER = 8475;
  SOMITEM_DATATYPE_NMTOKEN = 8476;
  SOMITEM_DATATYPE_NMTOKENS = 8477;
  SOMITEM_DATATYPE_NONNEGATIVEINTEGER = 8478;
  SOMITEM_DATATYPE_NONPOSITIVEINTEGER = 8479;
  SOMITEM_DATATYPE_NORMALIZEDSTRING = 8480;
  SOMITEM_DATATYPE_NOTATION = 8481;
  SOMITEM_DATATYPE_POSITIVEINTEGER = 8482;
  SOMITEM_DATATYPE_QNAME = 8483;
  SOMITEM_DATATYPE_SHORT = 8484;
  SOMITEM_DATATYPE_STRING = 8485;
  SOMITEM_DATATYPE_TIME = 8486;
  SOMITEM_DATATYPE_TOKEN = 8487;
  SOMITEM_DATATYPE_UNSIGNEDBYTE = 8488;
  SOMITEM_DATATYPE_UNSIGNEDINT = 8489;
  SOMITEM_DATATYPE_UNSIGNEDLONG = 8490;
  SOMITEM_DATATYPE_UNSIGNEDSHORT = 8491;
  SOMITEM_DATATYPE_YEAR = 8492;
  SOMITEM_DATATYPE_YEARMONTH = 8493;
  SOMITEM_DATATYPE_ANYSIMPLETYPE = 8703;
  SOMITEM_SIMPLETYPE = 8704;
  SOMITEM_COMPLEXTYPE = 9216;
  SOMITEM_PARTICLE = 16384;
  SOMITEM_ANY = 16385;
  SOMITEM_ANYATTRIBUTE = 16386;
  SOMITEM_ELEMENT = 16387;
  SOMITEM_GROUP = 16640;
  SOMITEM_ALL = 16641;
  SOMITEM_CHOICE = 16642;
  SOMITEM_SEQUENCE = 16643;
  SOMITEM_EMPTYPARTICLE = 16644;
  SOMITEM_NULL = 2048;
  SOMITEM_NULL_TYPE = 10240;
  SOMITEM_NULL_ANY = 18433;
  SOMITEM_NULL_ANYATTRIBUTE = 18434;
  SOMITEM_NULL_ELEMENT = 18435;

{ Schema Object Model Filters }

{ _SCHEMADERIVATIONMETHOD }

  SCHEMADERIVATIONMETHOD_EMPTY = 0;
  SCHEMADERIVATIONMETHOD_SUBSTITUTION = 1;
  SCHEMADERIVATIONMETHOD_EXTENSION = 2;
  SCHEMADERIVATIONMETHOD_RESTRICTION = 4;
  SCHEMADERIVATIONMETHOD_LIST = 8;
  SCHEMADERIVATIONMETHOD_UNION = 16;
  SCHEMADERIVATIONMETHOD_ALL = 255;
  SCHEMADERIVATIONMETHOD_NONE = 256;

{ Schema Object Model Type variety values }

{ _SCHEMATYPEVARIETY }

  SCHEMATYPEVARIETY_NONE = -1;
  SCHEMATYPEVARIETY_ATOMIC = 0;
  SCHEMATYPEVARIETY_LIST = 1;
  SCHEMATYPEVARIETY_UNION = 2;

{ Schema Object Model Whitespace facet values }

{ _SCHEMAWHITESPACE }

  SCHEMAWHITESPACE_NONE = -1;
  SCHEMAWHITESPACE_PRESERVE = 0;
  SCHEMAWHITESPACE_REPLACE = 1;
  SCHEMAWHITESPACE_COLLAPSE = 2;

{ Schema Object Model Process Contents }

{ _SCHEMAPROCESSCONTENTS }

  SCHEMAPROCESSCONTENTS_NONE = 0;
  SCHEMAPROCESSCONTENTS_SKIP = 1;
  SCHEMAPROCESSCONTENTS_LAX = 2;
  SCHEMAPROCESSCONTENTS_STRICT = 3;

{ Schema Object Model Content Types }

{ _SCHEMACONTENTTYPE }

  SCHEMACONTENTTYPE_EMPTY = 0;
  SCHEMACONTENTTYPE_TEXTONLY = 1;
  SCHEMACONTENTTYPE_ELEMENTONLY = 2;
  SCHEMACONTENTTYPE_MIXED = 3;

{ Schema Object Model Attribute Uses }

{ _SCHEMAUSE }

  SCHEMAUSE_OPTIONAL = 0;
  SCHEMAUSE_PROHIBITED = 1;
  SCHEMAUSE_REQUIRED = 2;

{ Options for ServerXMLHTTPRequest Option property }

{ _SERVERXMLHTTP_OPTION }

  SXH_OPTION_URL = -1;
  SXH_OPTION_URL_CODEPAGE = 0;
  SXH_OPTION_ESCAPE_PERCENT_IN_URL = 1;
  SXH_OPTION_IGNORE_SERVER_SSL_CERT_ERROR_FLAGS = 2;
  SXH_OPTION_SELECT_CLIENT_SSL_CERT = 3;

{ Flags for SXH_OPTION_IGNORE_SERVER_SSL_CERT_ERROR_FLAGS option }

{ _SXH_SERVER_CERT_OPTION }

  SXH_SERVER_CERT_IGNORE_UNKNOWN_CA = 256;
  SXH_SERVER_CERT_IGNORE_WRONG_USAGE = 512;
  SXH_SERVER_CERT_IGNORE_CERT_CN_INVALID = 4096;
  SXH_SERVER_CERT_IGNORE_CERT_DATE_INVALID = 8192;
  SXH_SERVER_CERT_IGNORE_ALL_SERVER_ERRORS = 13056;

{ Settings for setProxy }

{ _SXH_PROXY_SETTING }

  SXH_PROXY_SET_DEFAULT = 0;
  SXH_PROXY_SET_PRECONFIG = 0;
  SXH_PROXY_SET_DIRECT = 1;
  SXH_PROXY_SET_PROXY = 2;

const

{ Component class GUIDs }
  Class_DOMDocument: TGUID = '{F6D90F11-9C73-11D3-B32E-00C04F990BB4}';
  Class_DOMDocument26: TGUID = '{F5078F1B-C551-11D3-89B9-0000F81FE221}';
  Class_DOMDocument30: TGUID = '{F5078F32-C551-11D3-89B9-0000F81FE221}';
  Class_DOMDocument40: TGUID = '{88D969C0-F192-11D4-A65F-0040963251E5}';
  Class_DOMDocument60: TGUID = '{88D96A05-F192-11D4-A65F-0040963251E5}';
  Class_FreeThreadedDOMDocument: TGUID = '{F6D90F12-9C73-11D3-B32E-00C04F990BB4}';
  Class_FreeThreadedDOMDocument26: TGUID = '{F5078F1C-C551-11D3-89B9-0000F81FE221}';
  Class_FreeThreadedDOMDocument30: TGUID = '{F5078F33-C551-11D3-89B9-0000F81FE221}';
  Class_FreeThreadedDOMDocument40: TGUID = '{88D969C1-F192-11D4-A65F-0040963251E5}';
  Class_FreeThreadedDOMDocument60: TGUID = '{88D96A06-F192-11D4-A65F-0040963251E5}';
  Class_XMLSchemaCache: TGUID = '{373984C9-B845-449B-91E7-45AC83036ADE}';
  Class_XMLSchemaCache26: TGUID = '{F5078F1D-C551-11D3-89B9-0000F81FE221}';
  Class_XMLSchemaCache30: TGUID = '{F5078F34-C551-11D3-89B9-0000F81FE221}';
  Class_XMLSchemaCache40: TGUID = '{88D969C2-F192-11D4-A65F-0040963251E5}';
  Class_XMLSchemaCache60: TGUID = '{88D96A07-F192-11D4-A65F-0040963251E5}';
  Class_XSLTemplate: TGUID = '{2933BF94-7B36-11D2-B20E-00C04F983E60}';
  Class_XSLTemplate26: TGUID = '{F5078F21-C551-11D3-89B9-0000F81FE221}';
  Class_XSLTemplate30: TGUID = '{F5078F36-C551-11D3-89B9-0000F81FE221}';
  Class_XSLTemplate40: TGUID = '{88D969C3-F192-11D4-A65F-0040963251E5}';
  Class_XSLTemplate60: TGUID = '{88D96A08-F192-11D4-A65F-0040963251E5}';
  Class_XMLHTTP: TGUID = '{F6D90F16-9C73-11D3-B32E-00C04F990BB4}';
  Class_XMLHTTP26: TGUID = '{F5078F1E-C551-11D3-89B9-0000F81FE221}';
  Class_XMLHTTP30: TGUID = '{F5078F35-C551-11D3-89B9-0000F81FE221}';
  Class_XMLHTTP40: TGUID = '{88D969C5-F192-11D4-A65F-0040963251E5}';
  Class_XMLHTTP60: TGUID = '{88D96A0A-F192-11D4-A65F-0040963251E5}';
  Class_ServerXMLHTTP: TGUID = '{AFBA6B42-5692-48EA-8141-DC517DCF0EF1}';
  Class_ServerXMLHTTP30: TGUID = '{AFB40FFD-B609-40A3-9828-F88BBE11E4E3}';
  Class_ServerXMLHTTP40: TGUID = '{88D969C6-F192-11D4-A65F-0040963251E5}';
  Class_ServerXMLHTTP60: TGUID = '{88D96A0B-F192-11D4-A65F-0040963251E5}';
  Class_SAXXMLReader: TGUID = '{079AA557-4A18-424A-8EEE-E39F0A8D41B9}';
  Class_SAXXMLReader30: TGUID = '{3124C396-FB13-4836-A6AD-1317F1713688}';
  Class_SAXXMLReader40: TGUID = '{7C6E29BC-8B8B-4C3D-859E-AF6CD158BE0F}';
  Class_SAXXMLReader60: TGUID = '{88D96A0C-F192-11D4-A65F-0040963251E5}';
  Class_MXXMLWriter: TGUID = '{FC220AD8-A72A-4EE8-926E-0B7AD152A020}';
  Class_MXXMLWriter30: TGUID = '{3D813DFE-6C91-4A4E-8F41-04346A841D9C}';
  Class_MXXMLWriter40: TGUID = '{88D969C8-F192-11D4-A65F-0040963251E5}';
  Class_MXXMLWriter60: TGUID = '{88D96A0F-F192-11D4-A65F-0040963251E5}';
  Class_MXHTMLWriter: TGUID = '{A4C23EC3-6B70-4466-9127-550077239978}';
  Class_MXHTMLWriter30: TGUID = '{853D1540-C1A7-4AA9-A226-4D3BD301146D}';
  Class_MXHTMLWriter40: TGUID = '{88D969C9-F192-11D4-A65F-0040963251E5}';
  Class_MXHTMLWriter60: TGUID = '{88D96A10-F192-11D4-A65F-0040963251E5}';
  Class_SAXAttributes: TGUID = '{4DD441AD-526D-4A77-9F1B-9841ED802FB0}';
  Class_SAXAttributes30: TGUID = '{3E784A01-F3AE-4DC0-9354-9526B9370EBA}';
  Class_SAXAttributes40: TGUID = '{88D969CA-F192-11D4-A65F-0040963251E5}';
  Class_SAXAttributes60: TGUID = '{88D96A0E-F192-11D4-A65F-0040963251E5}';
  Class_MXNamespaceManager: TGUID = '{88D969D5-F192-11D4-A65F-0040963251E5}';
  Class_MXNamespaceManager40: TGUID = '{88D969D6-F192-11D4-A65F-0040963251E5}';
  Class_MXNamespaceManager60: TGUID = '{88D96A11-F192-11D4-A65F-0040963251E5}';

type

{ Forward declarations: Interfaces }
  IXMLDOMImplementation = interface;
  IXMLDOMImplementationDisp = dispinterface;
  IXMLDOMNode = interface;
  IXMLDOMNodeDisp = dispinterface;
  IXMLDOMNodeList = interface;
  IXMLDOMNodeListDisp = dispinterface;
  IXMLDOMNamedNodeMap = interface;
  IXMLDOMNamedNodeMapDisp = dispinterface;
  IXMLDOMDocument = interface;
  IXMLDOMDocumentDisp = dispinterface;
  IXMLDOMDocumentType = interface;
  IXMLDOMDocumentTypeDisp = dispinterface;
  IXMLDOMElement = interface;
  IXMLDOMElementDisp = dispinterface;
  IXMLDOMAttribute = interface;
  IXMLDOMAttributeDisp = dispinterface;
  IXMLDOMDocumentFragment = interface;
  IXMLDOMDocumentFragmentDisp = dispinterface;
  IXMLDOMText = interface;
  IXMLDOMTextDisp = dispinterface;
  IXMLDOMCharacterData = interface;
  IXMLDOMCharacterDataDisp = dispinterface;
  IXMLDOMComment = interface;
  IXMLDOMCommentDisp = dispinterface;
  IXMLDOMCDATASection = interface;
  IXMLDOMCDATASectionDisp = dispinterface;
  IXMLDOMProcessingInstruction = interface;
  IXMLDOMProcessingInstructionDisp = dispinterface;
  IXMLDOMEntityReference = interface;
  IXMLDOMEntityReferenceDisp = dispinterface;
  IXMLDOMParseError = interface;
  IXMLDOMParseErrorDisp = dispinterface;
  IXMLDOMDocument2 = interface;
  IXMLDOMDocument2Disp = dispinterface;
  IXMLDOMSchemaCollection = interface;
  IXMLDOMSchemaCollectionDisp = dispinterface;
  IXMLDOMDocument3 = interface;
  IXMLDOMDocument3Disp = dispinterface;
  IXMLDOMNotation = interface;
  IXMLDOMNotationDisp = dispinterface;
  IXMLDOMEntity = interface;
  IXMLDOMEntityDisp = dispinterface;
  IXMLDOMParseError2 = interface;
  IXMLDOMParseError2Disp = dispinterface;
  IXMLDOMParseErrorCollection = interface;
  IXMLDOMParseErrorCollectionDisp = dispinterface;
  IXTLRuntime = interface;
  IXTLRuntimeDisp = dispinterface;
  IXSLTemplate = interface;
  IXSLTemplateDisp = dispinterface;
  IXSLProcessor = interface;
  IXSLProcessorDisp = dispinterface;
  ISAXXMLReader = interface;
  ISAXEntityResolver = interface;
  ISAXContentHandler = interface;
  ISAXLocator = interface;
  ISAXAttributes = interface;
  ISAXDTDHandler = interface;
  ISAXErrorHandler = interface;
  ISAXXMLFilter = interface;
  ISAXLexicalHandler = interface;
  ISAXDeclHandler = interface;
  IVBSAXXMLReader = interface;
  IVBSAXXMLReaderDisp = dispinterface;
  IVBSAXEntityResolver = interface;
  IVBSAXEntityResolverDisp = dispinterface;
  IVBSAXContentHandler = interface;
  IVBSAXContentHandlerDisp = dispinterface;
  IVBSAXLocator = interface;
  IVBSAXLocatorDisp = dispinterface;
  IVBSAXAttributes = interface;
  IVBSAXAttributesDisp = dispinterface;
  IVBSAXDTDHandler = interface;
  IVBSAXDTDHandlerDisp = dispinterface;
  IVBSAXErrorHandler = interface;
  IVBSAXErrorHandlerDisp = dispinterface;
  IVBSAXXMLFilter = interface;
  IVBSAXXMLFilterDisp = dispinterface;
  IVBSAXLexicalHandler = interface;
  IVBSAXLexicalHandlerDisp = dispinterface;
  IVBSAXDeclHandler = interface;
  IVBSAXDeclHandlerDisp = dispinterface;
  IMXWriter = interface;
  IMXWriterDisp = dispinterface;
  IMXAttributes = interface;
  IMXAttributesDisp = dispinterface;
  IMXReaderControl = interface;
  IMXReaderControlDisp = dispinterface;
  IMXSchemaDeclHandler = interface;
  IMXSchemaDeclHandlerDisp = dispinterface;
  ISchemaElement = interface;
  ISchemaElementDisp = dispinterface;
  ISchemaParticle = interface;
  ISchemaParticleDisp = dispinterface;
  ISchemaItem = interface;
  ISchemaItemDisp = dispinterface;
  ISchema = interface;
  ISchemaDisp = dispinterface;
  ISchemaItemCollection = interface;
  ISchemaItemCollectionDisp = dispinterface;
  ISchemaStringCollection = interface;
  ISchemaStringCollectionDisp = dispinterface;
  ISchemaType = interface;
  ISchemaTypeDisp = dispinterface;
  ISchemaComplexType = interface;
  ISchemaComplexTypeDisp = dispinterface;
  ISchemaAny = interface;
  ISchemaAnyDisp = dispinterface;
  ISchemaModelGroup = interface;
  ISchemaModelGroupDisp = dispinterface;
  IMXXMLFilter = interface;
  IMXXMLFilterDisp = dispinterface;
  IXMLDOMSchemaCollection2 = interface;
  IXMLDOMSchemaCollection2Disp = dispinterface;
  ISchemaAttribute = interface;
  ISchemaAttributeDisp = dispinterface;
  ISchemaAttributeGroup = interface;
  ISchemaAttributeGroupDisp = dispinterface;
  ISchemaIdentityConstraint = interface;
  ISchemaIdentityConstraintDisp = dispinterface;
  ISchemaNotation = interface;
  ISchemaNotationDisp = dispinterface;
  IXMLDOMSelection = interface;
  IXMLDOMSelectionDisp = dispinterface;
  XMLDOMDocumentEvents = dispinterface;
  IXMLHTTPRequest = interface;
  IXMLHTTPRequestDisp = dispinterface;
  IServerXMLHTTPRequest = interface;
  IServerXMLHTTPRequestDisp = dispinterface;
  IServerXMLHTTPRequest2 = interface;
  IServerXMLHTTPRequest2Disp = dispinterface;
  IMXNamespacePrefixes = interface;
  IMXNamespacePrefixesDisp = dispinterface;
  IVBMXNamespaceManager = interface;
  IVBMXNamespaceManagerDisp = dispinterface;
  IMXNamespaceManager = interface;

{ Forward declarations: CoClasses }
  DOMDocument = IXMLDOMDocument2;
  DOMDocument26 = IXMLDOMDocument2;
  DOMDocument30 = IXMLDOMDocument2;
  DOMDocument40 = IXMLDOMDocument2;
  DOMDocument60 = IXMLDOMDocument3;
  FreeThreadedDOMDocument = IXMLDOMDocument2;
  FreeThreadedDOMDocument26 = IXMLDOMDocument2;
  FreeThreadedDOMDocument30 = IXMLDOMDocument2;
  FreeThreadedDOMDocument40 = IXMLDOMDocument2;
  FreeThreadedDOMDocument60 = IXMLDOMDocument3;
  XMLSchemaCache = IXMLDOMSchemaCollection;
  XMLSchemaCache26 = IXMLDOMSchemaCollection;
  XMLSchemaCache30 = IXMLDOMSchemaCollection;
  XMLSchemaCache40 = IXMLDOMSchemaCollection2;
  XMLSchemaCache60 = IXMLDOMSchemaCollection2;
  XSLTemplate = IXSLTemplate;
  XSLTemplate26 = IXSLTemplate;
  XSLTemplate30 = IXSLTemplate;
  XSLTemplate40 = IXSLTemplate;
  XSLTemplate60 = IXSLTemplate;
  XMLHTTP = IXMLHTTPRequest;
  XMLHTTP26 = IXMLHTTPRequest;
  XMLHTTP30 = IXMLHTTPRequest;
  XMLHTTP40 = IXMLHTTPRequest;
  XMLHTTP60 = IXMLHTTPRequest;
  ServerXMLHTTP = IServerXMLHTTPRequest;
  ServerXMLHTTP30 = IServerXMLHTTPRequest;
  ServerXMLHTTP40 = IServerXMLHTTPRequest2;
  ServerXMLHTTP60 = IServerXMLHTTPRequest2;
  SAXXMLReader = IVBSAXXMLReader;
  SAXXMLReader30 = IVBSAXXMLReader;
  SAXXMLReader40 = IVBSAXXMLReader;
  SAXXMLReader60 = IVBSAXXMLReader;
  MXXMLWriter = IMXWriter;
  MXXMLWriter30 = IMXWriter;
  MXXMLWriter40 = IMXWriter;
  MXXMLWriter60 = IMXWriter;
  MXHTMLWriter = IMXWriter;
  MXHTMLWriter30 = IMXWriter;
  MXHTMLWriter40 = IMXWriter;
  MXHTMLWriter60 = IMXWriter;
  SAXAttributes = IMXAttributes;
  SAXAttributes30 = IMXAttributes;
  SAXAttributes40 = IMXAttributes;
  SAXAttributes60 = IMXAttributes;
  MXNamespaceManager = IVBMXNamespaceManager;
  MXNamespaceManager40 = IVBMXNamespaceManager;
  MXNamespaceManager60 = IVBMXNamespaceManager;

{ Forward declarations: Enums }
  tagDOMNodeType = TOleEnum;
  _SOMITEMTYPE = TOleEnum;
  _SCHEMADERIVATIONMETHOD = TOleEnum;
  _SCHEMATYPEVARIETY = TOleEnum;
  _SCHEMAWHITESPACE = TOleEnum;
  _SCHEMAPROCESSCONTENTS = TOleEnum;
  _SCHEMACONTENTTYPE = TOleEnum;
  _SCHEMAUSE = TOleEnum;
  _SERVERXMLHTTP_OPTION = TOleEnum;
  _SXH_SERVER_CERT_OPTION = TOleEnum;
  _SXH_PROXY_SETTING = TOleEnum;

{ Constants that define a node's type }

  DOMNodeType = tagDOMNodeType;

{ Schema Object Model Item Types }

  SOMITEMTYPE = _SOMITEMTYPE;

{ Schema Object Model Filters }

  SCHEMADERIVATIONMETHOD = _SCHEMADERIVATIONMETHOD;

{ Schema Object Model Type variety values }

  SCHEMATYPEVARIETY = _SCHEMATYPEVARIETY;

{ Schema Object Model Whitespace facet values }

  SCHEMAWHITESPACE = _SCHEMAWHITESPACE;

{ Schema Object Model Process Contents }

  SCHEMAPROCESSCONTENTS = _SCHEMAPROCESSCONTENTS;

{ Schema Object Model Content Types }

  SCHEMACONTENTTYPE = _SCHEMACONTENTTYPE;

{ Schema Object Model Attribute Uses }

  SCHEMAUSE = _SCHEMAUSE;

{ Options for ServerXMLHTTPRequest Option property }

  SERVERXMLHTTP_OPTION = _SERVERXMLHTTP_OPTION;

{ Flags for SXH_OPTION_IGNORE_SERVER_SSL_CERT_ERROR_FLAGS option }

  SXH_SERVER_CERT_OPTION = _SXH_SERVER_CERT_OPTION;

{ Settings for setProxy }

  SXH_PROXY_SETTING = _SXH_PROXY_SETTING;

  IXMLDOMImplementation = interface(IDispatch)
    ['{2933BF8F-7B36-11D2-B20E-00C04F983E60}']
    function hasFeature(const feature, version: WideString): WordBool; safecall;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMImplementation }

  IXMLDOMImplementationDisp = dispinterface
    ['{2933BF8F-7B36-11D2-B20E-00C04F983E60}']
    function hasFeature(const feature, version: WideString): WordBool; dispid 145;
  end;

{ Core DOM node interface }

  IXMLDOMNode = interface(IDispatch)
    ['{2933BF80-7B36-11D2-B20E-00C04F983E60}']
    function Get_nodeName: WideString; safecall;
    function Get_nodeValue: OleVariant; safecall;
    procedure Set_nodeValue(Value: OleVariant); safecall;
    function Get_nodeType: DOMNodeType; safecall;
    function Get_parentNode: IXMLDOMNode; safecall;
    function Get_childNodes: IXMLDOMNodeList; safecall;
    function Get_firstChild: IXMLDOMNode; safecall;
    function Get_lastChild: IXMLDOMNode; safecall;
    function Get_previousSibling: IXMLDOMNode; safecall;
    function Get_nextSibling: IXMLDOMNode; safecall;
    function Get_attributes: IXMLDOMNamedNodeMap; safecall;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; safecall;
    function replaceChild(const newChild, oldChild: IXMLDOMNode): IXMLDOMNode; safecall;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; safecall;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; safecall;
    function hasChildNodes: WordBool; safecall;
    function Get_ownerDocument: IXMLDOMDocument; safecall;
    function cloneNode(deep: WordBool): IXMLDOMNode; safecall;
    function Get_nodeTypeString: WideString; safecall;
    function Get_text: WideString; safecall;
    procedure Set_text(const Value: WideString); safecall;
    function Get_specified: WordBool; safecall;
    function Get_definition: IXMLDOMNode; safecall;
    function Get_nodeTypedValue: OleVariant; safecall;
    procedure Set_nodeTypedValue(Value: OleVariant); safecall;
    function Get_dataType: OleVariant; safecall;
    procedure Set_dataType(Value: OleVariant); safecall;
    function Get_xml: WideString; safecall;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; safecall;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; safecall;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; safecall;
    function Get_parsed: WordBool; safecall;
    function Get_namespaceURI: WideString; safecall;
    function Get_prefix: WideString; safecall;
    function Get_baseName: WideString; safecall;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); safecall;
    property nodeName: WideString read Get_nodeName;
    property nodeValue: OleVariant read Get_nodeValue write Set_nodeValue;
    property nodeType: DOMNodeType read Get_nodeType;
    property parentNode: IXMLDOMNode read Get_parentNode;
    property childNodes: IXMLDOMNodeList read Get_childNodes;
    property firstChild: IXMLDOMNode read Get_firstChild;
    property lastChild: IXMLDOMNode read Get_lastChild;
    property previousSibling: IXMLDOMNode read Get_previousSibling;
    property nextSibling: IXMLDOMNode read Get_nextSibling;
    property attributes: IXMLDOMNamedNodeMap read Get_attributes;
    property ownerDocument: IXMLDOMDocument read Get_ownerDocument;
    property nodeTypeString: WideString read Get_nodeTypeString;
    property text: WideString read Get_text write Set_text;
    property specified: WordBool read Get_specified;
    property definition: IXMLDOMNode read Get_definition;
    property nodeTypedValue: OleVariant read Get_nodeTypedValue write Set_nodeTypedValue;
    property dataType: OleVariant read Get_dataType write Set_dataType;
    property xml: WideString read Get_xml;
    property parsed: WordBool read Get_parsed;
    property namespaceURI: WideString read Get_namespaceURI;
    property prefix: WideString read Get_prefix;
    property baseName: WideString read Get_baseName;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMNode }

  IXMLDOMNodeDisp = dispinterface
    ['{2933BF80-7B36-11D2-B20E-00C04F983E60}']
    property nodeName: WideString readonly dispid 2;
    property nodeValue: OleVariant dispid 3;
    property nodeType: DOMNodeType readonly dispid 4;
    property parentNode: IXMLDOMNode readonly dispid 6;
    property childNodes: IXMLDOMNodeList readonly dispid 7;
    property firstChild: IXMLDOMNode readonly dispid 8;
    property lastChild: IXMLDOMNode readonly dispid 9;
    property previousSibling: IXMLDOMNode readonly dispid 10;
    property nextSibling: IXMLDOMNode readonly dispid 11;
    property attributes: IXMLDOMNamedNodeMap readonly dispid 12;
    function insertBefore(const newChild: IXMLDOMNode; refChild: OleVariant): IXMLDOMNode; dispid 13;
    function replaceChild(const newChild, oldChild: IXMLDOMNode): IXMLDOMNode; dispid 14;
    function removeChild(const childNode: IXMLDOMNode): IXMLDOMNode; dispid 15;
    function appendChild(const newChild: IXMLDOMNode): IXMLDOMNode; dispid 16;
    function hasChildNodes: WordBool; dispid 17;
    property ownerDocument: IXMLDOMDocument readonly dispid 18;
    function cloneNode(deep: WordBool): IXMLDOMNode; dispid 19;
    property nodeTypeString: WideString readonly dispid 21;
    property text: WideString dispid 24;
    property specified: WordBool readonly dispid 22;
    property definition: IXMLDOMNode readonly dispid 23;
    property nodeTypedValue: OleVariant dispid 25;
    property dataType: OleVariant dispid 26;
    property xml: WideString readonly dispid 27;
    function transformNode(const stylesheet: IXMLDOMNode): WideString; dispid 28;
    function selectNodes(const queryString: WideString): IXMLDOMNodeList; dispid 29;
    function selectSingleNode(const queryString: WideString): IXMLDOMNode; dispid 30;
    property parsed: WordBool readonly dispid 31;
    property namespaceURI: WideString readonly dispid 32;
    property prefix: WideString readonly dispid 33;
    property baseName: WideString readonly dispid 34;
    procedure transformNodeToObject(const stylesheet: IXMLDOMNode; outputObject: OleVariant); dispid 35;
  end;

  IXMLDOMNodeList = interface(IDispatch)
    ['{2933BF82-7B36-11D2-B20E-00C04F983E60}']
    function Get_item(index: Integer): IXMLDOMNode; safecall;
    function Get_length: Integer; safecall;
    function nextNode: IXMLDOMNode; safecall;
    procedure reset; safecall;
    function Get__newEnum: IUnknown; safecall;
    property item[index: Integer]: IXMLDOMNode read Get_item; default;
    property length: Integer read Get_length;
    property _newEnum: IUnknown read Get__newEnum;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMNodeList }

  IXMLDOMNodeListDisp = dispinterface
    ['{2933BF82-7B36-11D2-B20E-00C04F983E60}']
    property item[index: Integer]: IXMLDOMNode readonly dispid 0; default;
    property length: Integer readonly dispid 74;
    function nextNode: IXMLDOMNode; dispid 76;
    procedure reset; dispid 77;
  end;

  IXMLDOMNamedNodeMap = interface(IDispatch)
    ['{2933BF83-7B36-11D2-B20E-00C04F983E60}']
    function getNamedItem(const name: WideString): IXMLDOMNode; safecall;
    function setNamedItem(const newItem: IXMLDOMNode): IXMLDOMNode; safecall;
    function removeNamedItem(const name: WideString): IXMLDOMNode; safecall;
    function Get_item(index: Integer): IXMLDOMNode; safecall;
    function Get_length: Integer; safecall;
    function getQualifiedItem(const baseName, namespaceURI: WideString): IXMLDOMNode; safecall;
    function removeQualifiedItem(const baseName, namespaceURI: WideString): IXMLDOMNode; safecall;
    function nextNode: IXMLDOMNode; safecall;
    procedure reset; safecall;
    function Get__newEnum: IUnknown; safecall;
    property item[index: Integer]: IXMLDOMNode read Get_item; default;
    property length: Integer read Get_length;
    property _newEnum: IUnknown read Get__newEnum;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMNamedNodeMap }

  IXMLDOMNamedNodeMapDisp = dispinterface
    ['{2933BF83-7B36-11D2-B20E-00C04F983E60}']
    function getNamedItem(const name: WideString): IXMLDOMNode; dispid 83;
    function setNamedItem(const newItem: IXMLDOMNode): IXMLDOMNode; dispid 84;
    function removeNamedItem(const name: WideString): IXMLDOMNode; dispid 85;
    property item[index: Integer]: IXMLDOMNode readonly dispid 0; default;
    property length: Integer readonly dispid 74;
    function getQualifiedItem(const baseName, namespaceURI: WideString): IXMLDOMNode; dispid 87;
    function removeQualifiedItem(const baseName, namespaceURI: WideString): IXMLDOMNode; dispid 88;
    function nextNode: IXMLDOMNode; dispid 89;
    procedure reset; dispid 90;
  end;

  IXMLDOMDocument = interface(IXMLDOMNode)
    ['{2933BF81-7B36-11D2-B20E-00C04F983E60}']
    function Get_doctype: IXMLDOMDocumentType; safecall;
    function Get_implementation_: IXMLDOMImplementation; safecall;
    function Get_documentElement: IXMLDOMElement; safecall;
    procedure Set_documentElement(var Value: IXMLDOMElement); safecall;
    function createElement(const tagName: WideString): IXMLDOMElement; safecall;
    function createDocumentFragment: IXMLDOMDocumentFragment; safecall;
    function createTextNode(const data: WideString): IXMLDOMText; safecall;
    function createComment(const data: WideString): IXMLDOMComment; safecall;
    function createCDATASection(const data: WideString): IXMLDOMCDATASection; safecall;
    function createProcessingInstruction(const target, data: WideString): IXMLDOMProcessingInstruction; safecall;
    function createAttribute(const name: WideString): IXMLDOMAttribute; safecall;
    function createEntityReference(const name: WideString): IXMLDOMEntityReference; safecall;
    function getElementsByTagName(const tagName: WideString): IXMLDOMNodeList; safecall;
    function createNode(type_: OleVariant; const name, namespaceURI: WideString): IXMLDOMNode; safecall;
    function nodeFromID(const idString: WideString): IXMLDOMNode; safecall;
    function load(xmlSource: OleVariant): WordBool; safecall;
    function Get_readyState: Integer; safecall;
    function Get_parseError: IXMLDOMParseError; safecall;
    function Get_url: WideString; safecall;
    function Get_async: WordBool; safecall;
    procedure Set_async(Value: WordBool); safecall;
    procedure abort; safecall;
    function loadXML(const bstrXML: WideString): WordBool; safecall;
    procedure save(destination: OleVariant); safecall;
    function Get_validateOnParse: WordBool; safecall;
    procedure Set_validateOnParse(Value: WordBool); safecall;
    function Get_resolveExternals: WordBool; safecall;
    procedure Set_resolveExternals(Value: WordBool); safecall;
    function Get_preserveWhiteSpace: WordBool; safecall;
    procedure Set_preserveWhiteSpace(Value: WordBool); safecall;
    procedure Set_onreadystatechange(Value: OleVariant); safecall;
    procedure Set_ondataavailable(Value: OleVariant); safecall;
    procedure Set_ontransformnode(Value: OleVariant); safecall;
    property doctype: IXMLDOMDocumentType read Get_doctype;
    property implementation_: IXMLDOMImplementation read Get_implementation_;
    property documentElement: IXMLDOMElement read Get_documentElement write Set_documentElement;
    property readyState: Integer read Get_readyState;
    property parseError: IXMLDOMParseError read Get_parseError;
    property url: WideString read Get_url;
    property async: WordBool read Get_async write Set_async;
    property validateOnParse: WordBool read Get_validateOnParse write Set_validateOnParse;
    property resolveExternals: WordBool read Get_resolveExternals write Set_resolveExternals;
    property preserveWhiteSpace: WordBool read Get_preserveWhiteSpace write Set_preserveWhiteSpace;
    property onreadystatechange: OleVariant write Set_onreadystatechange;
    property ondataavailable: OleVariant write Set_ondataavailable;
    property ontransformnode: OleVariant write Set_ontransformnode;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMDocument }

  IXMLDOMDocumentDisp = dispinterface
    ['{2933BF81-7B36-11D2-B20E-00C04F983E60}']
    property doctype: IXMLDOMDocumentType readonly dispid 38;
    property implementation_: IXMLDOMImplementation readonly dispid 39;
    property documentElement: IXMLDOMElement dispid 40;
    function createElement(const tagName: WideString): IXMLDOMElement; dispid 41;
    function createDocumentFragment: IXMLDOMDocumentFragment; dispid 42;
    function createTextNode(const data: WideString): IXMLDOMText; dispid 43;
    function createComment(const data: WideString): IXMLDOMComment; dispid 44;
    function createCDATASection(const data: WideString): IXMLDOMCDATASection; dispid 45;
    function createProcessingInstruction(const target, data: WideString): IXMLDOMProcessingInstruction; dispid 46;
    function createAttribute(const name: WideString): IXMLDOMAttribute; dispid 47;
    function createEntityReference(const name: WideString): IXMLDOMEntityReference; dispid 49;
    function getElementsByTagName(const tagName: WideString): IXMLDOMNodeList; dispid 50;
    function createNode(type_: OleVariant; const name, namespaceURI: WideString): IXMLDOMNode; dispid 54;
    function nodeFromID(const idString: WideString): IXMLDOMNode; dispid 56;
    function load(xmlSource: OleVariant): WordBool; dispid 58;
    property readyState: Integer readonly dispid -525;
    property parseError: IXMLDOMParseError readonly dispid 59;
    property url: WideString readonly dispid 60;
    property async: WordBool dispid 61;
    procedure abort; dispid 62;
    function loadXML(const bstrXML: WideString): WordBool; dispid 63;
    procedure save(destination: OleVariant); dispid 64;
    property validateOnParse: WordBool dispid 65;
    property resolveExternals: WordBool dispid 66;
    property preserveWhiteSpace: WordBool dispid 67;
    property onreadystatechange: OleVariant writeonly dispid 68;
    property ondataavailable: OleVariant writeonly dispid 69;
    property ontransformnode: OleVariant writeonly dispid 70;
  end;

  IXMLDOMDocumentType = interface(IXMLDOMNode)
    ['{2933BF8B-7B36-11D2-B20E-00C04F983E60}']
    function Get_name: WideString; safecall;
    function Get_entities: IXMLDOMNamedNodeMap; safecall;
    function Get_notations: IXMLDOMNamedNodeMap; safecall;
    property name: WideString read Get_name;
    property entities: IXMLDOMNamedNodeMap read Get_entities;
    property notations: IXMLDOMNamedNodeMap read Get_notations;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMDocumentType }

  IXMLDOMDocumentTypeDisp = dispinterface
    ['{2933BF8B-7B36-11D2-B20E-00C04F983E60}']
    property name: WideString readonly dispid 131;
    property entities: IXMLDOMNamedNodeMap readonly dispid 132;
    property notations: IXMLDOMNamedNodeMap readonly dispid 133;
  end;

  IXMLDOMElement = interface(IXMLDOMNode)
    ['{2933BF86-7B36-11D2-B20E-00C04F983E60}']
    function Get_tagName: WideString; safecall;
    function getAttribute(const name: WideString): OleVariant; safecall;
    procedure setAttribute(const name: WideString; value: OleVariant); safecall;
    procedure removeAttribute(const name: WideString); safecall;
    function getAttributeNode(const name: WideString): IXMLDOMAttribute; safecall;
    function setAttributeNode(const DOMAttribute: IXMLDOMAttribute): IXMLDOMAttribute; safecall;
    function removeAttributeNode(const DOMAttribute: IXMLDOMAttribute): IXMLDOMAttribute; safecall;
    function getElementsByTagName(const tagName: WideString): IXMLDOMNodeList; safecall;
    procedure normalize; safecall;
    property tagName: WideString read Get_tagName;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMElement }

  IXMLDOMElementDisp = dispinterface
    ['{2933BF86-7B36-11D2-B20E-00C04F983E60}']
    property tagName: WideString readonly dispid 97;
    function getAttribute(const name: WideString): OleVariant; dispid 99;
    procedure setAttribute(const name: WideString; value: OleVariant); dispid 100;
    procedure removeAttribute(const name: WideString); dispid 101;
    function getAttributeNode(const name: WideString): IXMLDOMAttribute; dispid 102;
    function setAttributeNode(const DOMAttribute: IXMLDOMAttribute): IXMLDOMAttribute; dispid 103;
    function removeAttributeNode(const DOMAttribute: IXMLDOMAttribute): IXMLDOMAttribute; dispid 104;
    function getElementsByTagName(const tagName: WideString): IXMLDOMNodeList; dispid 105;
    procedure normalize; dispid 106;
  end;

  IXMLDOMAttribute = interface(IXMLDOMNode)
    ['{2933BF85-7B36-11D2-B20E-00C04F983E60}']
    function Get_name: WideString; safecall;
    function Get_value: OleVariant; safecall;
    procedure Set_value(Value: OleVariant); safecall;
    property name: WideString read Get_name;
    property value: OleVariant read Get_value write Set_value;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMAttribute }

  IXMLDOMAttributeDisp = dispinterface
    ['{2933BF85-7B36-11D2-B20E-00C04F983E60}']
    property name: WideString readonly dispid 118;
    property value: OleVariant dispid 120;
  end;

  IXMLDOMDocumentFragment = interface(IXMLDOMNode)
    ['{3EFAA413-272F-11D2-836F-0000F87A7782}']
  end;

{ DispInterface declaration for Dual Interface IXMLDOMDocumentFragment }

  IXMLDOMDocumentFragmentDisp = dispinterface
    ['{3EFAA413-272F-11D2-836F-0000F87A7782}']
  end;

  IXMLDOMCharacterData = interface(IXMLDOMNode)
    ['{2933BF84-7B36-11D2-B20E-00C04F983E60}']
    function Get_data: WideString; safecall;
    procedure Set_data(const Value: WideString); safecall;
    function Get_length: Integer; safecall;
    function substringData(offset, count: Integer): WideString; safecall;
    procedure appendData(const data: WideString); safecall;
    procedure insertData(offset: Integer; const data: WideString); safecall;
    procedure deleteData(offset, count: Integer); safecall;
    procedure replaceData(offset, count: Integer; const data: WideString); safecall;
    property data: WideString read Get_data write Set_data;
    property length: Integer read Get_length;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMCharacterData }

  IXMLDOMCharacterDataDisp = dispinterface
    ['{2933BF84-7B36-11D2-B20E-00C04F983E60}']
    property data: WideString dispid 109;
    property length: Integer readonly dispid 110;
    function substringData(offset, count: Integer): WideString; dispid 111;
    procedure appendData(const data: WideString); dispid 112;
    procedure insertData(offset: Integer; const data: WideString); dispid 113;
    procedure deleteData(offset, count: Integer); dispid 114;
    procedure replaceData(offset, count: Integer; const data: WideString); dispid 115;
  end;

  IXMLDOMText = interface(IXMLDOMCharacterData)
    ['{2933BF87-7B36-11D2-B20E-00C04F983E60}']
    function splitText(offset: Integer): IXMLDOMText; safecall;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMText }

  IXMLDOMTextDisp = dispinterface
    ['{2933BF87-7B36-11D2-B20E-00C04F983E60}']
    function splitText(offset: Integer): IXMLDOMText; dispid 123;
  end;

  IXMLDOMComment = interface(IXMLDOMCharacterData)
    ['{2933BF88-7B36-11D2-B20E-00C04F983E60}']
  end;

{ DispInterface declaration for Dual Interface IXMLDOMComment }

  IXMLDOMCommentDisp = dispinterface
    ['{2933BF88-7B36-11D2-B20E-00C04F983E60}']
  end;

  IXMLDOMCDATASection = interface(IXMLDOMText)
    ['{2933BF8A-7B36-11D2-B20E-00C04F983E60}']
  end;

{ DispInterface declaration for Dual Interface IXMLDOMCDATASection }

  IXMLDOMCDATASectionDisp = dispinterface
    ['{2933BF8A-7B36-11D2-B20E-00C04F983E60}']
  end;

  IXMLDOMProcessingInstruction = interface(IXMLDOMNode)
    ['{2933BF89-7B36-11D2-B20E-00C04F983E60}']
    function Get_target: WideString; safecall;
    function Get_data: WideString; safecall;
    procedure Set_data(const Value: WideString); safecall;
    property target: WideString read Get_target;
    property data: WideString read Get_data write Set_data;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMProcessingInstruction }

  IXMLDOMProcessingInstructionDisp = dispinterface
    ['{2933BF89-7B36-11D2-B20E-00C04F983E60}']
    property target: WideString readonly dispid 127;
    property data: WideString dispid 128;
  end;

  IXMLDOMEntityReference = interface(IXMLDOMNode)
    ['{2933BF8E-7B36-11D2-B20E-00C04F983E60}']
  end;

{ DispInterface declaration for Dual Interface IXMLDOMEntityReference }

  IXMLDOMEntityReferenceDisp = dispinterface
    ['{2933BF8E-7B36-11D2-B20E-00C04F983E60}']
  end;

{ structure for reporting parser errors }

  IXMLDOMParseError = interface(IDispatch)
    ['{3EFAA426-272F-11D2-836F-0000F87A7782}']
    function Get_errorCode: Integer; safecall;
    function Get_url: WideString; safecall;
    function Get_reason: WideString; safecall;
    function Get_srcText: WideString; safecall;
    function Get_line: Integer; safecall;
    function Get_linepos: Integer; safecall;
    function Get_filepos: Integer; safecall;
    property errorCode: Integer read Get_errorCode;
    property url: WideString read Get_url;
    property reason: WideString read Get_reason;
    property srcText: WideString read Get_srcText;
    property line: Integer read Get_line;
    property linepos: Integer read Get_linepos;
    property filepos: Integer read Get_filepos;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMParseError }

  IXMLDOMParseErrorDisp = dispinterface
    ['{3EFAA426-272F-11D2-836F-0000F87A7782}']
    property errorCode: Integer readonly dispid 0;
    property url: WideString readonly dispid 179;
    property reason: WideString readonly dispid 180;
    property srcText: WideString readonly dispid 181;
    property line: Integer readonly dispid 182;
    property linepos: Integer readonly dispid 183;
    property filepos: Integer readonly dispid 184;
  end;

  IXMLDOMDocument2 = interface(IXMLDOMDocument)
    ['{2933BF95-7B36-11D2-B20E-00C04F983E60}']
    function Get_namespaces: IXMLDOMSchemaCollection; safecall;
    function Get_schemas: OleVariant; safecall;
    procedure Set_schemas(var Value: OleVariant); safecall;
    function validate: IXMLDOMParseError; safecall;
    procedure setProperty(const name: WideString; value: OleVariant); safecall;
    function getProperty(const name: WideString): OleVariant; safecall;
    property namespaces: IXMLDOMSchemaCollection read Get_namespaces;
    property schemas: OleVariant read Get_schemas write Set_schemas;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMDocument2 }

  IXMLDOMDocument2Disp = dispinterface
    ['{2933BF95-7B36-11D2-B20E-00C04F983E60}']
    property namespaces: IXMLDOMSchemaCollection readonly dispid 201;
    property schemas: OleVariant dispid 202;
    function validate: IXMLDOMParseError; dispid 203;
    procedure setProperty(const name: WideString; value: OleVariant); dispid 204;
    function getProperty(const name: WideString): OleVariant; dispid 205;
  end;

{ XML Schemas Collection }

  IXMLDOMSchemaCollection = interface(IDispatch)
    ['{373984C8-B845-449B-91E7-45AC83036ADE}']
    procedure add(const namespaceURI: WideString; var_: OleVariant); safecall;
    function get(const namespaceURI: WideString): IXMLDOMNode; safecall;
    procedure remove(const namespaceURI: WideString); safecall;
    function Get_length: Integer; safecall;
    function Get_namespaceURI(index: Integer): WideString; safecall;
    procedure addCollection(const otherCollection: IXMLDOMSchemaCollection); safecall;
    function Get__newEnum: IUnknown; safecall;
    property length: Integer read Get_length;
    property namespaceURI[index: Integer]: WideString read Get_namespaceURI; default;
    property _newEnum: IUnknown read Get__newEnum;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMSchemaCollection }

  IXMLDOMSchemaCollectionDisp = dispinterface
    ['{373984C8-B845-449B-91E7-45AC83036ADE}']
    procedure add(const namespaceURI: WideString; var_: OleVariant); dispid 3;
    function get(const namespaceURI: WideString): IXMLDOMNode; dispid 4;
    procedure remove(const namespaceURI: WideString); dispid 5;
    property length: Integer readonly dispid 6;
    property namespaceURI[index: Integer]: WideString readonly dispid 0; default;
    procedure addCollection(const otherCollection: IXMLDOMSchemaCollection); dispid 8;
  end;

  IXMLDOMDocument3 = interface(IXMLDOMDocument2)
    ['{2933BF96-7B36-11D2-B20E-00C04F983E60}']
    function validateNode(const node: IXMLDOMNode): IXMLDOMParseError; safecall;
    function importNode(const node: IXMLDOMNode; deep: WordBool): IXMLDOMNode; safecall;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMDocument3 }

  IXMLDOMDocument3Disp = dispinterface
    ['{2933BF96-7B36-11D2-B20E-00C04F983E60}']
    function validateNode(const node: IXMLDOMNode): IXMLDOMParseError; dispid 208;
    function importNode(const node: IXMLDOMNode; deep: WordBool): IXMLDOMNode; dispid 209;
  end;

  IXMLDOMNotation = interface(IXMLDOMNode)
    ['{2933BF8C-7B36-11D2-B20E-00C04F983E60}']
    function Get_publicId: OleVariant; safecall;
    function Get_systemId: OleVariant; safecall;
    property publicId: OleVariant read Get_publicId;
    property systemId: OleVariant read Get_systemId;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMNotation }

  IXMLDOMNotationDisp = dispinterface
    ['{2933BF8C-7B36-11D2-B20E-00C04F983E60}']
    property publicId: OleVariant readonly dispid 136;
    property systemId: OleVariant readonly dispid 137;
  end;

  IXMLDOMEntity = interface(IXMLDOMNode)
    ['{2933BF8D-7B36-11D2-B20E-00C04F983E60}']
    function Get_publicId: OleVariant; safecall;
    function Get_systemId: OleVariant; safecall;
    function Get_notationName: WideString; safecall;
    property publicId: OleVariant read Get_publicId;
    property systemId: OleVariant read Get_systemId;
    property notationName: WideString read Get_notationName;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMEntity }

  IXMLDOMEntityDisp = dispinterface
    ['{2933BF8D-7B36-11D2-B20E-00C04F983E60}']
    property publicId: OleVariant readonly dispid 140;
    property systemId: OleVariant readonly dispid 141;
    property notationName: WideString readonly dispid 142;
  end;

{ structure for reporting parser errors }

  IXMLDOMParseError2 = interface(IXMLDOMParseError)
    ['{3EFAA428-272F-11D2-836F-0000F87A7782}']
    function Get_errorXPath: WideString; safecall;
    function Get_allErrors: IXMLDOMParseErrorCollection; safecall;
    function errorParameters(index: Integer): WideString; safecall;
    function Get_errorParametersCount: Integer; safecall;
    property errorXPath: WideString read Get_errorXPath;
    property allErrors: IXMLDOMParseErrorCollection read Get_allErrors;
    property errorParametersCount: Integer read Get_errorParametersCount;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMParseError2 }

  IXMLDOMParseError2Disp = dispinterface
    ['{3EFAA428-272F-11D2-836F-0000F87A7782}']
    property errorXPath: WideString readonly dispid 190;
    property allErrors: IXMLDOMParseErrorCollection readonly dispid 187;
    function errorParameters(index: Integer): WideString; dispid 188;
    property errorParametersCount: Integer readonly dispid 189;
  end;

{ structure for reporting parser errors }

  IXMLDOMParseErrorCollection = interface(IDispatch)
    ['{3EFAA429-272F-11D2-836F-0000F87A7782}']
    function Get_item(index: Integer): IXMLDOMParseError2; safecall;
    function Get_length: Integer; safecall;
    function Get_next: IXMLDOMParseError2; safecall;
    procedure reset; safecall;
    function Get__newEnum: IUnknown; safecall;
    property item[index: Integer]: IXMLDOMParseError2 read Get_item; default;
    property length: Integer read Get_length;
    property next: IXMLDOMParseError2 read Get_next;
    property _newEnum: IUnknown read Get__newEnum;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMParseErrorCollection }

  IXMLDOMParseErrorCollectionDisp = dispinterface
    ['{3EFAA429-272F-11D2-836F-0000F87A7782}']
    property item[index: Integer]: IXMLDOMParseError2 readonly dispid 0; default;
    property length: Integer readonly dispid 193;
    property next: IXMLDOMParseError2 readonly dispid 194;
    procedure reset; dispid 195;
  end;

{ XTL runtime object }

  IXTLRuntime = interface(IXMLDOMNode)
    ['{3EFAA425-272F-11D2-836F-0000F87A7782}']
    function uniqueID(const pNode: IXMLDOMNode): Integer; safecall;
    function depth(const pNode: IXMLDOMNode): Integer; safecall;
    function childNumber(const pNode: IXMLDOMNode): Integer; safecall;
    function ancestorChildNumber(const bstrNodeName: WideString; const pNode: IXMLDOMNode): Integer; safecall;
    function absoluteChildNumber(const pNode: IXMLDOMNode): Integer; safecall;
    function formatIndex(lIndex: Integer; const bstrFormat: WideString): WideString; safecall;
    function formatNumber(dblNumber: Double; const bstrFormat: WideString): WideString; safecall;
    function formatDate(varDate: OleVariant; const bstrFormat: WideString; varDestLocale: OleVariant): WideString; safecall;
    function formatTime(varTime: OleVariant; const bstrFormat: WideString; varDestLocale: OleVariant): WideString; safecall;
  end;

{ DispInterface declaration for Dual Interface IXTLRuntime }

  IXTLRuntimeDisp = dispinterface
    ['{3EFAA425-272F-11D2-836F-0000F87A7782}']
    function uniqueID(const pNode: IXMLDOMNode): Integer; dispid 187;
    function depth(const pNode: IXMLDOMNode): Integer; dispid 188;
    function childNumber(const pNode: IXMLDOMNode): Integer; dispid 189;
    function ancestorChildNumber(const bstrNodeName: WideString; const pNode: IXMLDOMNode): Integer; dispid 190;
    function absoluteChildNumber(const pNode: IXMLDOMNode): Integer; dispid 191;
    function formatIndex(lIndex: Integer; const bstrFormat: WideString): WideString; dispid 192;
    function formatNumber(dblNumber: Double; const bstrFormat: WideString): WideString; dispid 193;
    function formatDate(varDate: OleVariant; const bstrFormat: WideString; varDestLocale: OleVariant): WideString; dispid 194;
    function formatTime(varTime: OleVariant; const bstrFormat: WideString; varDestLocale: OleVariant): WideString; dispid 195;
  end;

{ IXSLTemplate Interface }

  IXSLTemplate = interface(IDispatch)
    ['{2933BF93-7B36-11D2-B20E-00C04F983E60}']
    procedure Set_stylesheet(var Value: IXMLDOMNode); safecall;
    function Get_stylesheet: IXMLDOMNode; safecall;
    function createProcessor: IXSLProcessor; safecall;
    property stylesheet: IXMLDOMNode read Get_stylesheet write Set_stylesheet;
  end;

{ DispInterface declaration for Dual Interface IXSLTemplate }

  IXSLTemplateDisp = dispinterface
    ['{2933BF93-7B36-11D2-B20E-00C04F983E60}']
    property stylesheet: IXMLDOMNode dispid 2;
    function createProcessor: IXSLProcessor; dispid 3;
  end;

{ IXSLProcessor Interface }

  IXSLProcessor = interface(IDispatch)
    ['{2933BF92-7B36-11D2-B20E-00C04F983E60}']
    procedure Set_input(Value: OleVariant); safecall;
    function Get_input: OleVariant; safecall;
    function Get_ownerTemplate: IXSLTemplate; safecall;
    procedure setStartMode(const mode, namespaceURI: WideString); safecall;
    function Get_startMode: WideString; safecall;
    function Get_startModeURI: WideString; safecall;
    procedure Set_output(Value: OleVariant); safecall;
    function Get_output: OleVariant; safecall;
    function transform: WordBool; safecall;
    procedure reset; safecall;
    function Get_readyState: Integer; safecall;
    procedure addParameter(const baseName: WideString; parameter: OleVariant; const namespaceURI: WideString); safecall;
    procedure addObject(obj: IDispatch; const namespaceURI: WideString); safecall;
    function Get_stylesheet: IXMLDOMNode; safecall;
    property input: OleVariant read Get_input write Set_input;
    property ownerTemplate: IXSLTemplate read Get_ownerTemplate;
    property startMode: WideString read Get_startMode;
    property startModeURI: WideString read Get_startModeURI;
    property output: OleVariant read Get_output write Set_output;
    property readyState: Integer read Get_readyState;
    property stylesheet: IXMLDOMNode read Get_stylesheet;
  end;

{ DispInterface declaration for Dual Interface IXSLProcessor }

  IXSLProcessorDisp = dispinterface
    ['{2933BF92-7B36-11D2-B20E-00C04F983E60}']
    property input: OleVariant dispid 2;
    property ownerTemplate: IXSLTemplate readonly dispid 3;
    procedure setStartMode(const mode, namespaceURI: WideString); dispid 4;
    property startMode: WideString readonly dispid 5;
    property startModeURI: WideString readonly dispid 6;
    property output: OleVariant dispid 7;
    function transform: WordBool; dispid 8;
    procedure reset; dispid 9;
    property readyState: Integer readonly dispid 10;
    procedure addParameter(const baseName: WideString; parameter: OleVariant; const namespaceURI: WideString); dispid 11;
    procedure addObject(obj: IDispatch; const namespaceURI: WideString); dispid 12;
    property stylesheet: IXMLDOMNode readonly dispid 13;
  end;

{ ISAXXMLReader interface }

  ISAXXMLReader = interface(IUnknown)
    ['{A4F96ED0-F829-476E-81C0-CDC7BD2A0802}']
    function getFeature(var pwchName: Word): WordBool; safecall;
    procedure putFeature(var pwchName: Word; vfValue: WordBool); safecall;
    function getProperty(var pwchName: Word): OleVariant; safecall;
    procedure putProperty(var pwchName: Word; varValue: OleVariant); safecall;
    function getEntityResolver: ISAXEntityResolver; safecall;
    procedure putEntityResolver(const pResolver: ISAXEntityResolver); safecall;
    function getContentHandler: ISAXContentHandler; safecall;
    procedure putContentHandler(const pHandler: ISAXContentHandler); safecall;
    function getDTDHandler: ISAXDTDHandler; safecall;
    procedure putDTDHandler(const pHandler: ISAXDTDHandler); safecall;
    function getErrorHandler: ISAXErrorHandler; safecall;
    procedure putErrorHandler(const pHandler: ISAXErrorHandler); safecall;
    function getBaseURL: Pointer; safecall;
    procedure putBaseURL(var pwchBaseUrl: Word); safecall;
    function getSecureBaseURL: Pointer; safecall;
    procedure putSecureBaseURL(var pwchSecureBaseUrl: Word); safecall;
    procedure parse(varInput: OleVariant); safecall;
    procedure parseURL(var pwchUrl: Word); safecall;
  end;

{ ISAXEntityResolver interface }

  ISAXEntityResolver = interface(IUnknown)
    ['{99BCA7BD-E8C4-4D5F-A0CF-6D907901FF07}']
    function resolveEntity(var pwchPublicId, pwchSystemId: Word): OleVariant; safecall;
  end;

{ ISAXContentHandler interface }

  ISAXContentHandler = interface(IUnknown)
    ['{1545CDFA-9E4E-4497-A8A4-2BF7D0112C44}']
    procedure putDocumentLocator(const pLocator: ISAXLocator); safecall;
    procedure startDocument; safecall;
    procedure endDocument; safecall;
    procedure startPrefixMapping(var pwchPrefix: Word; cchPrefix: SYSINT; var pwchUri: Word; cchUri: SYSINT); safecall;
    procedure endPrefixMapping(var pwchPrefix: Word; cchPrefix: SYSINT); safecall;
    procedure startElement(var pwchNamespaceUri: Word; cchNamespaceUri: SYSINT; var pwchLocalName: Word; cchLocalName: SYSINT; var pwchQName: Word; cchQName: SYSINT; const pAttributes: ISAXAttributes); safecall;
    procedure endElement(var pwchNamespaceUri: Word; cchNamespaceUri: SYSINT; var pwchLocalName: Word; cchLocalName: SYSINT; var pwchQName: Word; cchQName: SYSINT); safecall;
    procedure characters(var pwchChars: Word; cchChars: SYSINT); safecall;
    procedure ignorableWhitespace(var pwchChars: Word; cchChars: SYSINT); safecall;
    procedure processingInstruction(var pwchTarget: Word; cchTarget: SYSINT; var pwchData: Word; cchData: SYSINT); safecall;
    procedure skippedEntity(var pwchName: Word; cchName: SYSINT); safecall;
  end;

{ ISAXLocator interface }

  ISAXLocator = interface(IUnknown)
    ['{9B7E472A-0DE4-4640-BFF3-84D38A051C31}']
    function getColumnNumber: SYSINT; safecall;
    function getLineNumber: SYSINT; safecall;
    function getPublicId: Pointer; safecall;
    function getSystemId: Pointer; safecall;
  end;

{ ISAXAttributes interface }

  ISAXAttributes = interface(IUnknown)
    ['{F078ABE1-45D2-4832-91EA-4466CE2F25C9}']
    function getLength: SYSINT; safecall;
    procedure getURI(nIndex: SYSINT; out ppwchUri; out pcchUri: SYSINT); safecall;
    procedure getLocalName(nIndex: SYSINT; out ppwchLocalName; out pcchLocalName: SYSINT); safecall;
    procedure getQName(nIndex: SYSINT; out ppwchQName; out pcchQName: SYSINT); safecall;
    procedure getName(nIndex: SYSINT; out ppwchUri; out pcchUri: SYSINT; out ppwchLocalName; out pcchLocalName: SYSINT; out ppwchQName; out pcchQName: SYSINT); safecall;
    function getIndexFromName(var pwchUri: Word; cchUri: SYSINT; var pwchLocalName: Word; cchLocalName: SYSINT): SYSINT; safecall;
    function getIndexFromQName(var pwchQName: Word; cchQName: SYSINT): SYSINT; safecall;
    procedure getType(nIndex: SYSINT; out ppwchType; out pcchType: SYSINT); safecall;
    procedure getTypeFromName(var pwchUri: Word; cchUri: SYSINT; var pwchLocalName: Word; cchLocalName: SYSINT; out ppwchType; out pcchType: SYSINT); safecall;
    procedure getTypeFromQName(var pwchQName: Word; cchQName: SYSINT; out ppwchType; out pcchType: SYSINT); safecall;
    procedure getValue(nIndex: SYSINT; out ppwchValue; out pcchValue: SYSINT); safecall;
    procedure getValueFromName(var pwchUri: Word; cchUri: SYSINT; var pwchLocalName: Word; cchLocalName: SYSINT; out ppwchValue; out pcchValue: SYSINT); safecall;
    procedure getValueFromQName(var pwchQName: Word; cchQName: SYSINT; out ppwchValue; out pcchValue: SYSINT); safecall;
  end;

{ ISAXDTDHandler interface }

  ISAXDTDHandler = interface(IUnknown)
    ['{E15C1BAF-AFB3-4D60-8C36-19A8C45DEFED}']
    procedure notationDecl(var pwchName: Word; cchName: SYSINT; var pwchPublicId: Word; cchPublicId: SYSINT; var pwchSystemId: Word; cchSystemId: SYSINT); safecall;
    procedure unparsedEntityDecl(var pwchName: Word; cchName: SYSINT; var pwchPublicId: Word; cchPublicId: SYSINT; var pwchSystemId: Word; cchSystemId: SYSINT; var pwchNotationName: Word; cchNotationName: SYSINT); safecall;
  end;

{ ISAXErrorHandler interface }

  ISAXErrorHandler = interface(IUnknown)
    ['{A60511C4-CCF5-479E-98A3-DC8DC545B7D0}']
    procedure error(const pLocator: ISAXLocator; var pwchErrorMessage: Word; hrErrorCode: HResult); safecall;
    procedure fatalError(const pLocator: ISAXLocator; var pwchErrorMessage: Word; hrErrorCode: HResult); safecall;
    procedure ignorableWarning(const pLocator: ISAXLocator; var pwchErrorMessage: Word; hrErrorCode: HResult); safecall;
  end;

{ ISAXXMLFilter interface }

  ISAXXMLFilter = interface(ISAXXMLReader)
    ['{70409222-CA09-4475-ACB8-40312FE8D145}']
    function getParent: ISAXXMLReader; safecall;
    procedure putParent(const pReader: ISAXXMLReader); safecall;
  end;

{ ISAXLexicalHandler interface }

  ISAXLexicalHandler = interface(IUnknown)
    ['{7F85D5F5-47A8-4497-BDA5-84BA04819EA6}']
    procedure startDTD(var pwchName: Word; cchName: SYSINT; var pwchPublicId: Word; cchPublicId: SYSINT; var pwchSystemId: Word; cchSystemId: SYSINT); safecall;
    procedure endDTD; safecall;
    procedure startEntity(var pwchName: Word; cchName: SYSINT); safecall;
    procedure endEntity(var pwchName: Word; cchName: SYSINT); safecall;
    procedure startCDATA; safecall;
    procedure endCDATA; safecall;
    procedure comment(var pwchChars: Word; cchChars: SYSINT); safecall;
  end;

{ ISAXDeclHandler interface }

  ISAXDeclHandler = interface(IUnknown)
    ['{862629AC-771A-47B2-8337-4E6843C1BE90}']
    procedure elementDecl(var pwchName: Word; cchName: SYSINT; var pwchModel: Word; cchModel: SYSINT); safecall;
    procedure attributeDecl(var pwchElementName: Word; cchElementName: SYSINT; var pwchAttributeName: Word; cchAttributeName: SYSINT; var pwchType: Word; cchType: SYSINT; var pwchValueDefault: Word; cchValueDefault: SYSINT; var pwchValue: Word; cchValue: SYSINT); safecall;
    procedure internalEntityDecl(var pwchName: Word; cchName: SYSINT; var pwchValue: Word; cchValue: SYSINT); safecall;
    procedure externalEntityDecl(var pwchName: Word; cchName: SYSINT; var pwchPublicId: Word; cchPublicId: SYSINT; var pwchSystemId: Word; cchSystemId: SYSINT); safecall;
  end;

{ IVBSAXXMLReader interface }

  IVBSAXXMLReader = interface(IDispatch)
    ['{8C033CAA-6CD6-4F73-B728-4531AF74945F}']
    function getFeature(const strName: WideString): WordBool; safecall;
    procedure putFeature(const strName: WideString; fValue: WordBool); safecall;
    function getProperty(const strName: WideString): OleVariant; safecall;
    procedure putProperty(const strName: WideString; varValue: OleVariant); safecall;
    function Get_entityResolver: IVBSAXEntityResolver; safecall;
    procedure Set_entityResolver(var Value: IVBSAXEntityResolver); safecall;
    function Get_contentHandler: IVBSAXContentHandler; safecall;
    procedure Set_contentHandler(var Value: IVBSAXContentHandler); safecall;
    function Get_dtdHandler: IVBSAXDTDHandler; safecall;
    procedure Set_dtdHandler(var Value: IVBSAXDTDHandler); safecall;
    function Get_errorHandler: IVBSAXErrorHandler; safecall;
    procedure Set_errorHandler(var Value: IVBSAXErrorHandler); safecall;
    function Get_baseURL: WideString; safecall;
    procedure Set_baseURL(const Value: WideString); safecall;
    function Get_secureBaseURL: WideString; safecall;
    procedure Set_secureBaseURL(const Value: WideString); safecall;
    procedure parse(varInput: OleVariant); safecall;
    procedure parseURL(const strURL: WideString); safecall;
    property entityResolver: IVBSAXEntityResolver read Get_entityResolver write Set_entityResolver;
    property contentHandler: IVBSAXContentHandler read Get_contentHandler write Set_contentHandler;
    property dtdHandler: IVBSAXDTDHandler read Get_dtdHandler write Set_dtdHandler;
    property errorHandler: IVBSAXErrorHandler read Get_errorHandler write Set_errorHandler;
    property baseURL: WideString read Get_baseURL write Set_baseURL;
    property secureBaseURL: WideString read Get_secureBaseURL write Set_secureBaseURL;
  end;

{ DispInterface declaration for Dual Interface IVBSAXXMLReader }

  IVBSAXXMLReaderDisp = dispinterface
    ['{8C033CAA-6CD6-4F73-B728-4531AF74945F}']
    function getFeature(const strName: WideString): WordBool; dispid 1282;
    procedure putFeature(const strName: WideString; fValue: WordBool); dispid 1283;
    function getProperty(const strName: WideString): OleVariant; dispid 1284;
    procedure putProperty(const strName: WideString; varValue: OleVariant); dispid 1285;
    property entityResolver: IVBSAXEntityResolver dispid 1286;
    property contentHandler: IVBSAXContentHandler dispid 1287;
    property dtdHandler: IVBSAXDTDHandler dispid 1288;
    property errorHandler: IVBSAXErrorHandler dispid 1289;
    property baseURL: WideString dispid 1290;
    property secureBaseURL: WideString dispid 1291;
    procedure parse(varInput: OleVariant); dispid 1292;
    procedure parseURL(const strURL: WideString); dispid 1293;
  end;

{ IVBSAXEntityResolver interface }

  IVBSAXEntityResolver = interface(IDispatch)
    ['{0C05D096-F45B-4ACA-AD1A-AA0BC25518DC}']
    function resolveEntity(var strPublicId, strSystemId: WideString): OleVariant; safecall;
  end;

{ DispInterface declaration for Dual Interface IVBSAXEntityResolver }

  IVBSAXEntityResolverDisp = dispinterface
    ['{0C05D096-F45B-4ACA-AD1A-AA0BC25518DC}']
    function resolveEntity(var strPublicId, strSystemId: WideString): OleVariant; dispid 1319;
  end;

{ IVBSAXContentHandler interface }

  IVBSAXContentHandler = interface(IDispatch)
    ['{2ED7290A-4DD5-4B46-BB26-4E4155E77FAA}']
    procedure Set_documentLocator(var Value: IVBSAXLocator); safecall;
    procedure startDocument; safecall;
    procedure endDocument; safecall;
    procedure startPrefixMapping(var strPrefix, strURI: WideString); safecall;
    procedure endPrefixMapping(var strPrefix: WideString); safecall;
    procedure startElement(var strNamespaceURI, strLocalName, strQName: WideString; const oAttributes: IVBSAXAttributes); safecall;
    procedure endElement(var strNamespaceURI, strLocalName, strQName: WideString); safecall;
    procedure characters(var strChars: WideString); safecall;
    procedure ignorableWhitespace(var strChars: WideString); safecall;
    procedure processingInstruction(var strTarget, strData: WideString); safecall;
    procedure skippedEntity(var strName: WideString); safecall;
    property documentLocator: IVBSAXLocator write Set_documentLocator;
  end;

{ DispInterface declaration for Dual Interface IVBSAXContentHandler }

  IVBSAXContentHandlerDisp = dispinterface
    ['{2ED7290A-4DD5-4B46-BB26-4E4155E77FAA}']
    property documentLocator: IVBSAXLocator writeonly dispid 1322;
    procedure startDocument; dispid 1323;
    procedure endDocument; dispid 1324;
    procedure startPrefixMapping(var strPrefix, strURI: WideString); dispid 1325;
    procedure endPrefixMapping(var strPrefix: WideString); dispid 1326;
    procedure startElement(var strNamespaceURI, strLocalName, strQName: WideString; const oAttributes: IVBSAXAttributes); dispid 1327;
    procedure endElement(var strNamespaceURI, strLocalName, strQName: WideString); dispid 1328;
    procedure characters(var strChars: WideString); dispid 1329;
    procedure ignorableWhitespace(var strChars: WideString); dispid 1330;
    procedure processingInstruction(var strTarget, strData: WideString); dispid 1331;
    procedure skippedEntity(var strName: WideString); dispid 1332;
  end;

{ IVBSAXLocator interface }

  IVBSAXLocator = interface(IDispatch)
    ['{796E7AC5-5AA2-4EFF-ACAD-3FAAF01A3288}']
    function Get_columnNumber: SYSINT; safecall;
    function Get_lineNumber: SYSINT; safecall;
    function Get_publicId: WideString; safecall;
    function Get_systemId: WideString; safecall;
    property columnNumber: SYSINT read Get_columnNumber;
    property lineNumber: SYSINT read Get_lineNumber;
    property publicId: WideString read Get_publicId;
    property systemId: WideString read Get_systemId;
  end;

{ DispInterface declaration for Dual Interface IVBSAXLocator }

  IVBSAXLocatorDisp = dispinterface
    ['{796E7AC5-5AA2-4EFF-ACAD-3FAAF01A3288}']
    property columnNumber: SYSINT readonly dispid 1313;
    property lineNumber: SYSINT readonly dispid 1314;
    property publicId: WideString readonly dispid 1315;
    property systemId: WideString readonly dispid 1316;
  end;

{ IVBSAXAttributes interface }

  IVBSAXAttributes = interface(IDispatch)
    ['{10DC0586-132B-4CAC-8BB3-DB00AC8B7EE0}']
    function Get_length: SYSINT; safecall;
    function getURI(nIndex: SYSINT): WideString; safecall;
    function getLocalName(nIndex: SYSINT): WideString; safecall;
    function getQName(nIndex: SYSINT): WideString; safecall;
    function getIndexFromName(const strURI, strLocalName: WideString): SYSINT; safecall;
    function getIndexFromQName(const strQName: WideString): SYSINT; safecall;
    function getType(nIndex: SYSINT): WideString; safecall;
    function getTypeFromName(const strURI, strLocalName: WideString): WideString; safecall;
    function getTypeFromQName(const strQName: WideString): WideString; safecall;
    function getValue(nIndex: SYSINT): WideString; safecall;
    function getValueFromName(const strURI, strLocalName: WideString): WideString; safecall;
    function getValueFromQName(const strQName: WideString): WideString; safecall;
    property length: SYSINT read Get_length;
  end;

{ DispInterface declaration for Dual Interface IVBSAXAttributes }

  IVBSAXAttributesDisp = dispinterface
    ['{10DC0586-132B-4CAC-8BB3-DB00AC8B7EE0}']
    property length: SYSINT readonly dispid 1344;
    function getURI(nIndex: SYSINT): WideString; dispid 1345;
    function getLocalName(nIndex: SYSINT): WideString; dispid 1346;
    function getQName(nIndex: SYSINT): WideString; dispid 1347;
    function getIndexFromName(const strURI, strLocalName: WideString): SYSINT; dispid 1348;
    function getIndexFromQName(const strQName: WideString): SYSINT; dispid 1349;
    function getType(nIndex: SYSINT): WideString; dispid 1350;
    function getTypeFromName(const strURI, strLocalName: WideString): WideString; dispid 1351;
    function getTypeFromQName(const strQName: WideString): WideString; dispid 1352;
    function getValue(nIndex: SYSINT): WideString; dispid 1353;
    function getValueFromName(const strURI, strLocalName: WideString): WideString; dispid 1354;
    function getValueFromQName(const strQName: WideString): WideString; dispid 1355;
  end;

{ IVBSAXDTDHandler interface }

  IVBSAXDTDHandler = interface(IDispatch)
    ['{24FB3297-302D-4620-BA39-3A732D850558}']
    procedure notationDecl(var strName, strPublicId, strSystemId: WideString); safecall;
    procedure unparsedEntityDecl(var strName, strPublicId, strSystemId, strNotationName: WideString); safecall;
  end;

{ DispInterface declaration for Dual Interface IVBSAXDTDHandler }

  IVBSAXDTDHandlerDisp = dispinterface
    ['{24FB3297-302D-4620-BA39-3A732D850558}']
    procedure notationDecl(var strName, strPublicId, strSystemId: WideString); dispid 1335;
    procedure unparsedEntityDecl(var strName, strPublicId, strSystemId, strNotationName: WideString); dispid 1336;
  end;

{ IVBSAXErrorHandler interface }

  IVBSAXErrorHandler = interface(IDispatch)
    ['{D963D3FE-173C-4862-9095-B92F66995F52}']
    procedure error(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; nErrorCode: Integer); safecall;
    procedure fatalError(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; nErrorCode: Integer); safecall;
    procedure ignorableWarning(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; nErrorCode: Integer); safecall;
  end;

{ DispInterface declaration for Dual Interface IVBSAXErrorHandler }

  IVBSAXErrorHandlerDisp = dispinterface
    ['{D963D3FE-173C-4862-9095-B92F66995F52}']
    procedure error(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; nErrorCode: Integer); dispid 1339;
    procedure fatalError(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; nErrorCode: Integer); dispid 1340;
    procedure ignorableWarning(const oLocator: IVBSAXLocator; var strErrorMessage: WideString; nErrorCode: Integer); dispid 1341;
  end;

{ IVBSAXXMLFilter interface }

  IVBSAXXMLFilter = interface(IDispatch)
    ['{1299EB1B-5B88-433E-82DE-82CA75AD4E04}']
    function Get_parent: IVBSAXXMLReader; safecall;
    procedure Set_parent(var Value: IVBSAXXMLReader); safecall;
    property parent: IVBSAXXMLReader read Get_parent write Set_parent;
  end;

{ DispInterface declaration for Dual Interface IVBSAXXMLFilter }

  IVBSAXXMLFilterDisp = dispinterface
    ['{1299EB1B-5B88-433E-82DE-82CA75AD4E04}']
    property parent: IVBSAXXMLReader dispid 1309;
  end;

{ IVBSAXLexicalHandler interface }

  IVBSAXLexicalHandler = interface(IDispatch)
    ['{032AAC35-8C0E-4D9D-979F-E3B702935576}']
    procedure startDTD(var strName, strPublicId, strSystemId: WideString); safecall;
    procedure endDTD; safecall;
    procedure startEntity(var strName: WideString); safecall;
    procedure endEntity(var strName: WideString); safecall;
    procedure startCDATA; safecall;
    procedure endCDATA; safecall;
    procedure comment(var strChars: WideString); safecall;
  end;

{ DispInterface declaration for Dual Interface IVBSAXLexicalHandler }

  IVBSAXLexicalHandlerDisp = dispinterface
    ['{032AAC35-8C0E-4D9D-979F-E3B702935576}']
    procedure startDTD(var strName, strPublicId, strSystemId: WideString); dispid 1358;
    procedure endDTD; dispid 1359;
    procedure startEntity(var strName: WideString); dispid 1360;
    procedure endEntity(var strName: WideString); dispid 1361;
    procedure startCDATA; dispid 1362;
    procedure endCDATA; dispid 1363;
    procedure comment(var strChars: WideString); dispid 1364;
  end;

{ IVBSAXDeclHandler interface }

  IVBSAXDeclHandler = interface(IDispatch)
    ['{E8917260-7579-4BE1-B5DD-7AFBFA6F077B}']
    procedure elementDecl(var strName, strModel: WideString); safecall;
    procedure attributeDecl(var strElementName, strAttributeName, strType, strValueDefault, strValue: WideString); safecall;
    procedure internalEntityDecl(var strName, strValue: WideString); safecall;
    procedure externalEntityDecl(var strName, strPublicId, strSystemId: WideString); safecall;
  end;

{ DispInterface declaration for Dual Interface IVBSAXDeclHandler }

  IVBSAXDeclHandlerDisp = dispinterface
    ['{E8917260-7579-4BE1-B5DD-7AFBFA6F077B}']
    procedure elementDecl(var strName, strModel: WideString); dispid 1367;
    procedure attributeDecl(var strElementName, strAttributeName, strType, strValueDefault, strValue: WideString); dispid 1368;
    procedure internalEntityDecl(var strName, strValue: WideString); dispid 1369;
    procedure externalEntityDecl(var strName, strPublicId, strSystemId: WideString); dispid 1370;
  end;

{ IMXWriter interface }

  IMXWriter = interface(IDispatch)
    ['{4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}']
    procedure Set_output(Value: OleVariant); safecall;
    function Get_output: OleVariant; safecall;
    procedure Set_encoding(const Value: WideString); safecall;
    function Get_encoding: WideString; safecall;
    procedure Set_byteOrderMark(Value: WordBool); safecall;
    function Get_byteOrderMark: WordBool; safecall;
    procedure Set_indent(Value: WordBool); safecall;
    function Get_indent: WordBool; safecall;
    procedure Set_standalone(Value: WordBool); safecall;
    function Get_standalone: WordBool; safecall;
    procedure Set_omitXMLDeclaration(Value: WordBool); safecall;
    function Get_omitXMLDeclaration: WordBool; safecall;
    procedure Set_version(const Value: WideString); safecall;
    function Get_version: WideString; safecall;
    procedure Set_disableOutputEscaping(Value: WordBool); safecall;
    function Get_disableOutputEscaping: WordBool; safecall;
    procedure flush; safecall;
    property output: OleVariant read Get_output write Set_output;
    property encoding: WideString read Get_encoding write Set_encoding;
    property byteOrderMark: WordBool read Get_byteOrderMark write Set_byteOrderMark;
    property indent: WordBool read Get_indent write Set_indent;
    property standalone: WordBool read Get_standalone write Set_standalone;
    property omitXMLDeclaration: WordBool read Get_omitXMLDeclaration write Set_omitXMLDeclaration;
    property version: WideString read Get_version write Set_version;
    property disableOutputEscaping: WordBool read Get_disableOutputEscaping write Set_disableOutputEscaping;
  end;

{ DispInterface declaration for Dual Interface IMXWriter }

  IMXWriterDisp = dispinterface
    ['{4D7FF4BA-1565-4EA8-94E1-6E724A46F98D}']
    property output: OleVariant dispid 1385;
    property encoding: WideString dispid 1387;
    property byteOrderMark: WordBool dispid 1388;
    property indent: WordBool dispid 1389;
    property standalone: WordBool dispid 1390;
    property omitXMLDeclaration: WordBool dispid 1391;
    property version: WideString dispid 1392;
    property disableOutputEscaping: WordBool dispid 1393;
    procedure flush; dispid 1394;
  end;

{ IMXAttributes interface }

  IMXAttributes = interface(IDispatch)
    ['{F10D27CC-3EC0-415C-8ED8-77AB1C5E7262}']
    procedure addAttribute(const strURI, strLocalName, strQName, strType, strValue: WideString); safecall;
    procedure addAttributeFromIndex(varAtts: OleVariant; nIndex: SYSINT); safecall;
    procedure clear; safecall;
    procedure removeAttribute(nIndex: SYSINT); safecall;
    procedure setAttribute(nIndex: SYSINT; const strURI, strLocalName, strQName, strType, strValue: WideString); safecall;
    procedure setAttributes(varAtts: OleVariant); safecall;
    procedure setLocalName(nIndex: SYSINT; const strLocalName: WideString); safecall;
    procedure setQName(nIndex: SYSINT; const strQName: WideString); safecall;
    procedure setType(nIndex: SYSINT; const strType: WideString); safecall;
    procedure setURI(nIndex: SYSINT; const strURI: WideString); safecall;
    procedure setValue(nIndex: SYSINT; const strValue: WideString); safecall;
  end;

{ DispInterface declaration for Dual Interface IMXAttributes }

  IMXAttributesDisp = dispinterface
    ['{F10D27CC-3EC0-415C-8ED8-77AB1C5E7262}']
    procedure addAttribute(const strURI, strLocalName, strQName, strType, strValue: WideString); dispid 1373;
    procedure addAttributeFromIndex(varAtts: OleVariant; nIndex: SYSINT); dispid 1383;
    procedure clear; dispid 1374;
    procedure removeAttribute(nIndex: SYSINT); dispid 1375;
    procedure setAttribute(nIndex: SYSINT; const strURI, strLocalName, strQName, strType, strValue: WideString); dispid 1376;
    procedure setAttributes(varAtts: OleVariant); dispid 1377;
    procedure setLocalName(nIndex: SYSINT; const strLocalName: WideString); dispid 1378;
    procedure setQName(nIndex: SYSINT; const strQName: WideString); dispid 1379;
    procedure setType(nIndex: SYSINT; const strType: WideString); dispid 1380;
    procedure setURI(nIndex: SYSINT; const strURI: WideString); dispid 1381;
    procedure setValue(nIndex: SYSINT; const strValue: WideString); dispid 1382;
  end;

{ IMXReaderControl interface }

  IMXReaderControl = interface(IDispatch)
    ['{808F4E35-8D5A-4FBE-8466-33A41279ED30}']
    procedure abort; safecall;
    procedure resume; safecall;
    procedure suspend; safecall;
  end;

{ DispInterface declaration for Dual Interface IMXReaderControl }

  IMXReaderControlDisp = dispinterface
    ['{808F4E35-8D5A-4FBE-8466-33A41279ED30}']
    procedure abort; dispid 1398;
    procedure resume; dispid 1399;
    procedure suspend; dispid 1400;
  end;

{ IMXSchemaDeclHandler interface }

  IMXSchemaDeclHandler = interface(IDispatch)
    ['{FA4BB38C-FAF9-4CCA-9302-D1DD0FE520DB}']
    procedure schemaElementDecl(const oSchemaElement: ISchemaElement); safecall;
  end;

{ DispInterface declaration for Dual Interface IMXSchemaDeclHandler }

  IMXSchemaDeclHandlerDisp = dispinterface
    ['{FA4BB38C-FAF9-4CCA-9302-D1DD0FE520DB}']
    procedure schemaElementDecl(const oSchemaElement: ISchemaElement); dispid 1403;
  end;

{ XML Schema Item }

  ISchemaItem = interface(IDispatch)
    ['{50EA08B3-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_name: WideString; safecall;
    function Get_namespaceURI: WideString; safecall;
    function Get_schema: ISchema; safecall;
    function Get_id: WideString; safecall;
    function Get_itemType: SOMITEMTYPE; safecall;
    function Get_unhandledAttributes: IVBSAXAttributes; safecall;
    function writeAnnotation(annotationSink: IUnknown): WordBool; safecall;
    property name: WideString read Get_name;
    property namespaceURI: WideString read Get_namespaceURI;
    property schema: ISchema read Get_schema;
    property id: WideString read Get_id;
    property itemType: SOMITEMTYPE read Get_itemType;
    property unhandledAttributes: IVBSAXAttributes read Get_unhandledAttributes;
  end;

{ DispInterface declaration for Dual Interface ISchemaItem }

  ISchemaItemDisp = dispinterface
    ['{50EA08B3-DD1B-4664-9A50-C2F40F4BD79A}']
    property name: WideString readonly dispid 1457;
    property namespaceURI: WideString readonly dispid 1459;
    property schema: ISchema readonly dispid 1467;
    property id: WideString readonly dispid 1440;
    property itemType: SOMITEMTYPE readonly dispid 1446;
    property unhandledAttributes: IVBSAXAttributes readonly dispid 1478;
    function writeAnnotation(annotationSink: IUnknown): WordBool; dispid 1483;
  end;

{ XML Schema Particle }

  ISchemaParticle = interface(ISchemaItem)
    ['{50EA08B5-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_minOccurs: OleVariant; safecall;
    function Get_maxOccurs: OleVariant; safecall;
    property minOccurs: OleVariant read Get_minOccurs;
    property maxOccurs: OleVariant read Get_maxOccurs;
  end;

{ DispInterface declaration for Dual Interface ISchemaParticle }

  ISchemaParticleDisp = dispinterface
    ['{50EA08B5-DD1B-4664-9A50-C2F40F4BD79A}']
    property minOccurs: OleVariant readonly dispid 1455;
    property maxOccurs: OleVariant readonly dispid 1451;
  end;

{ XML Schema Element }

  ISchemaElement = interface(ISchemaParticle)
    ['{50EA08B7-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_type_: ISchemaType; safecall;
    function Get_scope: ISchemaComplexType; safecall;
    function Get_defaultValue: WideString; safecall;
    function Get_fixedValue: WideString; safecall;
    function Get_isNillable: WordBool; safecall;
    function Get_identityConstraints: ISchemaItemCollection; safecall;
    function Get_substitutionGroup: ISchemaElement; safecall;
    function Get_substitutionGroupExclusions: SCHEMADERIVATIONMETHOD; safecall;
    function Get_disallowedSubstitutions: SCHEMADERIVATIONMETHOD; safecall;
    function Get_isAbstract: WordBool; safecall;
    function Get_isReference: WordBool; safecall;
    property type_: ISchemaType read Get_type_;
    property scope: ISchemaComplexType read Get_scope;
    property defaultValue: WideString read Get_defaultValue;
    property fixedValue: WideString read Get_fixedValue;
    property isNillable: WordBool read Get_isNillable;
    property identityConstraints: ISchemaItemCollection read Get_identityConstraints;
    property substitutionGroup: ISchemaElement read Get_substitutionGroup;
    property substitutionGroupExclusions: SCHEMADERIVATIONMETHOD read Get_substitutionGroupExclusions;
    property disallowedSubstitutions: SCHEMADERIVATIONMETHOD read Get_disallowedSubstitutions;
    property isAbstract: WordBool read Get_isAbstract;
    property isReference: WordBool read Get_isReference;
  end;

{ DispInterface declaration for Dual Interface ISchemaElement }

  ISchemaElementDisp = dispinterface
    ['{50EA08B7-DD1B-4664-9A50-C2F40F4BD79A}']
    property type_: ISchemaType readonly dispid 1476;
    property scope: ISchemaComplexType readonly dispid 1469;
    property defaultValue: WideString readonly dispid 1431;
    property fixedValue: WideString readonly dispid 1438;
    property isNillable: WordBool readonly dispid 1443;
    property identityConstraints: ISchemaItemCollection readonly dispid 1441;
    property substitutionGroup: ISchemaElement readonly dispid 1471;
    property substitutionGroupExclusions: SCHEMADERIVATIONMETHOD readonly dispid 1472;
    property disallowedSubstitutions: SCHEMADERIVATIONMETHOD readonly dispid 1433;
    property isAbstract: WordBool readonly dispid 1442;
    property isReference: WordBool readonly dispid 1444;
  end;

{ XML Schema }

  ISchema = interface(ISchemaItem)
    ['{50EA08B4-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_targetNamespace: WideString; safecall;
    function Get_version: WideString; safecall;
    function Get_types: ISchemaItemCollection; safecall;
    function Get_elements: ISchemaItemCollection; safecall;
    function Get_attributes: ISchemaItemCollection; safecall;
    function Get_attributeGroups: ISchemaItemCollection; safecall;
    function Get_modelGroups: ISchemaItemCollection; safecall;
    function Get_notations: ISchemaItemCollection; safecall;
    function Get_schemaLocations: ISchemaStringCollection; safecall;
    property targetNamespace: WideString read Get_targetNamespace;
    property version: WideString read Get_version;
    property types: ISchemaItemCollection read Get_types;
    property elements: ISchemaItemCollection read Get_elements;
    property attributes: ISchemaItemCollection read Get_attributes;
    property attributeGroups: ISchemaItemCollection read Get_attributeGroups;
    property modelGroups: ISchemaItemCollection read Get_modelGroups;
    property notations: ISchemaItemCollection read Get_notations;
    property schemaLocations: ISchemaStringCollection read Get_schemaLocations;
  end;

{ DispInterface declaration for Dual Interface ISchema }

  ISchemaDisp = dispinterface
    ['{50EA08B4-DD1B-4664-9A50-C2F40F4BD79A}']
    property targetNamespace: WideString readonly dispid 1474;
    property version: WideString readonly dispid 1481;
    property types: ISchemaItemCollection readonly dispid 1477;
    property elements: ISchemaItemCollection readonly dispid 1434;
    property attributes: ISchemaItemCollection readonly dispid 1427;
    property attributeGroups: ISchemaItemCollection readonly dispid 1426;
    property modelGroups: ISchemaItemCollection readonly dispid 1456;
    property notations: ISchemaItemCollection readonly dispid 1460;
    property schemaLocations: ISchemaStringCollection readonly dispid 1468;
  end;

{ XML Schema Item Collection }

  ISchemaItemCollection = interface(IDispatch)
    ['{50EA08B2-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_item(index: Integer): ISchemaItem; safecall;
    function itemByName(const name: WideString): ISchemaItem; safecall;
    function itemByQName(const name, namespaceURI: WideString): ISchemaItem; safecall;
    function Get_length: Integer; safecall;
    function Get__newEnum: IUnknown; safecall;
    property item[index: Integer]: ISchemaItem read Get_item; default;
    property length: Integer read Get_length;
    property _newEnum: IUnknown read Get__newEnum;
  end;

{ DispInterface declaration for Dual Interface ISchemaItemCollection }

  ISchemaItemCollectionDisp = dispinterface
    ['{50EA08B2-DD1B-4664-9A50-C2F40F4BD79A}']
    property item[index: Integer]: ISchemaItem readonly dispid 0; default;
    function itemByName(const name: WideString): ISchemaItem; dispid 1423;
    function itemByQName(const name, namespaceURI: WideString): ISchemaItem; dispid 1424;
    property length: Integer readonly dispid 1447;
  end;

{ XML Schema String Collection }

  ISchemaStringCollection = interface(IDispatch)
    ['{50EA08B1-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_item(index: Integer): WideString; safecall;
    function Get_length: Integer; safecall;
    function Get__newEnum: IUnknown; safecall;
    property item[index: Integer]: WideString read Get_item; default;
    property length: Integer read Get_length;
    property _newEnum: IUnknown read Get__newEnum;
  end;

{ DispInterface declaration for Dual Interface ISchemaStringCollection }

  ISchemaStringCollectionDisp = dispinterface
    ['{50EA08B1-DD1B-4664-9A50-C2F40F4BD79A}']
    property item[index: Integer]: WideString readonly dispid 0; default;
    property length: Integer readonly dispid 1447;
  end;

{ XML Schema Type }

  ISchemaType = interface(ISchemaItem)
    ['{50EA08B8-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_baseTypes: ISchemaItemCollection; safecall;
    function Get_final: SCHEMADERIVATIONMETHOD; safecall;
    function Get_variety: SCHEMATYPEVARIETY; safecall;
    function Get_derivedBy: SCHEMADERIVATIONMETHOD; safecall;
    function isValid(const data: WideString): WordBool; safecall;
    function Get_minExclusive: WideString; safecall;
    function Get_minInclusive: WideString; safecall;
    function Get_maxExclusive: WideString; safecall;
    function Get_maxInclusive: WideString; safecall;
    function Get_totalDigits: OleVariant; safecall;
    function Get_fractionDigits: OleVariant; safecall;
    function Get_length: OleVariant; safecall;
    function Get_minLength: OleVariant; safecall;
    function Get_maxLength: OleVariant; safecall;
    function Get_enumeration: ISchemaStringCollection; safecall;
    function Get_whitespace: SCHEMAWHITESPACE; safecall;
    function Get_patterns: ISchemaStringCollection; safecall;
    property baseTypes: ISchemaItemCollection read Get_baseTypes;
    property final: SCHEMADERIVATIONMETHOD read Get_final;
    property variety: SCHEMATYPEVARIETY read Get_variety;
    property derivedBy: SCHEMADERIVATIONMETHOD read Get_derivedBy;
    property minExclusive: WideString read Get_minExclusive;
    property minInclusive: WideString read Get_minInclusive;
    property maxExclusive: WideString read Get_maxExclusive;
    property maxInclusive: WideString read Get_maxInclusive;
    property totalDigits: OleVariant read Get_totalDigits;
    property fractionDigits: OleVariant read Get_fractionDigits;
    property length: OleVariant read Get_length;
    property minLength: OleVariant read Get_minLength;
    property maxLength: OleVariant read Get_maxLength;
    property enumeration: ISchemaStringCollection read Get_enumeration;
    property whitespace: SCHEMAWHITESPACE read Get_whitespace;
    property patterns: ISchemaStringCollection read Get_patterns;
  end;

{ DispInterface declaration for Dual Interface ISchemaType }

  ISchemaTypeDisp = dispinterface
    ['{50EA08B8-DD1B-4664-9A50-C2F40F4BD79A}']
    property baseTypes: ISchemaItemCollection readonly dispid 1428;
    property final: SCHEMADERIVATIONMETHOD readonly dispid 1437;
    property variety: SCHEMATYPEVARIETY readonly dispid 1480;
    property derivedBy: SCHEMADERIVATIONMETHOD readonly dispid 1432;
    function isValid(const data: WideString): WordBool; dispid 1445;
    property minExclusive: WideString readonly dispid 1452;
    property minInclusive: WideString readonly dispid 1453;
    property maxExclusive: WideString readonly dispid 1448;
    property maxInclusive: WideString readonly dispid 1449;
    property totalDigits: OleVariant readonly dispid 1475;
    property fractionDigits: OleVariant readonly dispid 1439;
    property length: OleVariant readonly dispid 1447;
    property minLength: OleVariant readonly dispid 1454;
    property maxLength: OleVariant readonly dispid 1450;
    property enumeration: ISchemaStringCollection readonly dispid 1435;
    property whitespace: SCHEMAWHITESPACE readonly dispid 1482;
    property patterns: ISchemaStringCollection readonly dispid 1462;
  end;

{ XML Schema Complex Type }

  ISchemaComplexType = interface(ISchemaType)
    ['{50EA08B9-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_isAbstract: WordBool; safecall;
    function Get_anyAttribute: ISchemaAny; safecall;
    function Get_attributes: ISchemaItemCollection; safecall;
    function Get_contentType: SCHEMACONTENTTYPE; safecall;
    function Get_contentModel: ISchemaModelGroup; safecall;
    function Get_prohibitedSubstitutions: SCHEMADERIVATIONMETHOD; safecall;
    property isAbstract: WordBool read Get_isAbstract;
    property anyAttribute: ISchemaAny read Get_anyAttribute;
    property attributes: ISchemaItemCollection read Get_attributes;
    property contentType: SCHEMACONTENTTYPE read Get_contentType;
    property contentModel: ISchemaModelGroup read Get_contentModel;
    property prohibitedSubstitutions: SCHEMADERIVATIONMETHOD read Get_prohibitedSubstitutions;
  end;

{ DispInterface declaration for Dual Interface ISchemaComplexType }

  ISchemaComplexTypeDisp = dispinterface
    ['{50EA08B9-DD1B-4664-9A50-C2F40F4BD79A}']
    property isAbstract: WordBool readonly dispid 1442;
    property anyAttribute: ISchemaAny readonly dispid 1425;
    property attributes: ISchemaItemCollection readonly dispid 1427;
    property contentType: SCHEMACONTENTTYPE readonly dispid 1430;
    property contentModel: ISchemaModelGroup readonly dispid 1429;
    property prohibitedSubstitutions: SCHEMADERIVATIONMETHOD readonly dispid 1464;
  end;

{ XML Schema Any }

  ISchemaAny = interface(ISchemaParticle)
    ['{50EA08BC-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_namespaces: ISchemaStringCollection; safecall;
    function Get_processContents: SCHEMAPROCESSCONTENTS; safecall;
    property namespaces: ISchemaStringCollection read Get_namespaces;
    property processContents: SCHEMAPROCESSCONTENTS read Get_processContents;
  end;

{ DispInterface declaration for Dual Interface ISchemaAny }

  ISchemaAnyDisp = dispinterface
    ['{50EA08BC-DD1B-4664-9A50-C2F40F4BD79A}']
    property namespaces: ISchemaStringCollection readonly dispid 1458;
    property processContents: SCHEMAPROCESSCONTENTS readonly dispid 1463;
  end;

{ XML Schema Type }

  ISchemaModelGroup = interface(ISchemaParticle)
    ['{50EA08BB-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_particles: ISchemaItemCollection; safecall;
    property particles: ISchemaItemCollection read Get_particles;
  end;

{ DispInterface declaration for Dual Interface ISchemaModelGroup }

  ISchemaModelGroupDisp = dispinterface
    ['{50EA08BB-DD1B-4664-9A50-C2F40F4BD79A}']
    property particles: ISchemaItemCollection readonly dispid 1461;
  end;

{ IMXXMLFilter interface }

  IMXXMLFilter = interface(IDispatch)
    ['{C90352F7-643C-4FBC-BB23-E996EB2D51FD}']
    function getFeature(const strName: WideString): WordBool; safecall;
    procedure putFeature(const strName: WideString; fValue: WordBool); safecall;
    function getProperty(const strName: WideString): OleVariant; safecall;
    procedure putProperty(const strName: WideString; varValue: OleVariant); safecall;
    function Get_entityResolver: IUnknown; safecall;
    procedure Set_entityResolver(var Value: IUnknown); safecall;
    function Get_contentHandler: IUnknown; safecall;
    procedure Set_contentHandler(var Value: IUnknown); safecall;
    function Get_dtdHandler: IUnknown; safecall;
    procedure Set_dtdHandler(var Value: IUnknown); safecall;
    function Get_errorHandler: IUnknown; safecall;
    procedure Set_errorHandler(var Value: IUnknown); safecall;
    property entityResolver: IUnknown read Get_entityResolver write Set_entityResolver;
    property contentHandler: IUnknown read Get_contentHandler write Set_contentHandler;
    property dtdHandler: IUnknown read Get_dtdHandler write Set_dtdHandler;
    property errorHandler: IUnknown read Get_errorHandler write Set_errorHandler;
  end;

{ DispInterface declaration for Dual Interface IMXXMLFilter }

  IMXXMLFilterDisp = dispinterface
    ['{C90352F7-643C-4FBC-BB23-E996EB2D51FD}']
    function getFeature(const strName: WideString): WordBool; dispid 1423;
    procedure putFeature(const strName: WideString; fValue: WordBool); dispid 1425;
    function getProperty(const strName: WideString): OleVariant; dispid 1424;
    procedure putProperty(const strName: WideString; varValue: OleVariant); dispid 1426;
    property entityResolver: IUnknown dispid 1421;
    property contentHandler: IUnknown dispid 1419;
    property dtdHandler: IUnknown dispid 1420;
    property errorHandler: IUnknown dispid 1422;
  end;

{ XML Schemas Collection 2 }

  IXMLDOMSchemaCollection2 = interface(IXMLDOMSchemaCollection)
    ['{50EA08B0-DD1B-4664-9A50-C2F40F4BD79A}']
    procedure validate; safecall;
    procedure Set_validateOnLoad(Value: WordBool); safecall;
    function Get_validateOnLoad: WordBool; safecall;
    function getSchema(const namespaceURI: WideString): ISchema; safecall;
    function getDeclaration(const node: IXMLDOMNode): ISchemaItem; safecall;
    property validateOnLoad: WordBool read Get_validateOnLoad write Set_validateOnLoad;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMSchemaCollection2 }

  IXMLDOMSchemaCollection2Disp = dispinterface
    ['{50EA08B0-DD1B-4664-9A50-C2F40F4BD79A}']
    procedure validate; dispid 1419;
    property validateOnLoad: WordBool dispid 1420;
    function getSchema(const namespaceURI: WideString): ISchema; dispid 1421;
    function getDeclaration(const node: IXMLDOMNode): ISchemaItem; dispid 1422;
  end;

{ XML Schema Attribute }

  ISchemaAttribute = interface(ISchemaItem)
    ['{50EA08B6-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_type_: ISchemaType; safecall;
    function Get_scope: ISchemaComplexType; safecall;
    function Get_defaultValue: WideString; safecall;
    function Get_fixedValue: WideString; safecall;
    function Get_use: SCHEMAUSE; safecall;
    function Get_isReference: WordBool; safecall;
    property type_: ISchemaType read Get_type_;
    property scope: ISchemaComplexType read Get_scope;
    property defaultValue: WideString read Get_defaultValue;
    property fixedValue: WideString read Get_fixedValue;
    property use: SCHEMAUSE read Get_use;
    property isReference: WordBool read Get_isReference;
  end;

{ DispInterface declaration for Dual Interface ISchemaAttribute }

  ISchemaAttributeDisp = dispinterface
    ['{50EA08B6-DD1B-4664-9A50-C2F40F4BD79A}']
    property type_: ISchemaType readonly dispid 1476;
    property scope: ISchemaComplexType readonly dispid 1469;
    property defaultValue: WideString readonly dispid 1431;
    property fixedValue: WideString readonly dispid 1438;
    property use: SCHEMAUSE readonly dispid 1479;
    property isReference: WordBool readonly dispid 1444;
  end;

{ XML Schema Attribute Group }

  ISchemaAttributeGroup = interface(ISchemaItem)
    ['{50EA08BA-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_anyAttribute: ISchemaAny; safecall;
    function Get_attributes: ISchemaItemCollection; safecall;
    property anyAttribute: ISchemaAny read Get_anyAttribute;
    property attributes: ISchemaItemCollection read Get_attributes;
  end;

{ DispInterface declaration for Dual Interface ISchemaAttributeGroup }

  ISchemaAttributeGroupDisp = dispinterface
    ['{50EA08BA-DD1B-4664-9A50-C2F40F4BD79A}']
    property anyAttribute: ISchemaAny readonly dispid 1425;
    property attributes: ISchemaItemCollection readonly dispid 1427;
  end;

{ XML Schema Any }

  ISchemaIdentityConstraint = interface(ISchemaItem)
    ['{50EA08BD-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_selector: WideString; safecall;
    function Get_fields: ISchemaStringCollection; safecall;
    function Get_referencedKey: ISchemaIdentityConstraint; safecall;
    property selector: WideString read Get_selector;
    property fields: ISchemaStringCollection read Get_fields;
    property referencedKey: ISchemaIdentityConstraint read Get_referencedKey;
  end;

{ DispInterface declaration for Dual Interface ISchemaIdentityConstraint }

  ISchemaIdentityConstraintDisp = dispinterface
    ['{50EA08BD-DD1B-4664-9A50-C2F40F4BD79A}']
    property selector: WideString readonly dispid 1470;
    property fields: ISchemaStringCollection readonly dispid 1436;
    property referencedKey: ISchemaIdentityConstraint readonly dispid 1466;
  end;

{ XML Schema Notation }

  ISchemaNotation = interface(ISchemaItem)
    ['{50EA08BE-DD1B-4664-9A50-C2F40F4BD79A}']
    function Get_systemIdentifier: WideString; safecall;
    function Get_publicIdentifier: WideString; safecall;
    property systemIdentifier: WideString read Get_systemIdentifier;
    property publicIdentifier: WideString read Get_publicIdentifier;
  end;

{ DispInterface declaration for Dual Interface ISchemaNotation }

  ISchemaNotationDisp = dispinterface
    ['{50EA08BE-DD1B-4664-9A50-C2F40F4BD79A}']
    property systemIdentifier: WideString readonly dispid 1473;
    property publicIdentifier: WideString readonly dispid 1465;
  end;

  IXMLDOMSelection = interface(IXMLDOMNodeList)
    ['{AA634FC7-5888-44A7-A257-3A47150D3A0E}']
    function Get_expr: WideString; safecall;
    procedure Set_expr(const Value: WideString); safecall;
    function Get_context: IXMLDOMNode; safecall;
    procedure Set_context(var Value: IXMLDOMNode); safecall;
    function peekNode: IXMLDOMNode; safecall;
    function matches(const pNode: IXMLDOMNode): IXMLDOMNode; safecall;
    function removeNext: IXMLDOMNode; safecall;
    procedure removeAll; safecall;
    function clone: IXMLDOMSelection; safecall;
    function getProperty(const name: WideString): OleVariant; safecall;
    procedure setProperty(const name: WideString; value: OleVariant); safecall;
    property expr: WideString read Get_expr write Set_expr;
    property context: IXMLDOMNode read Get_context write Set_context;
  end;

{ DispInterface declaration for Dual Interface IXMLDOMSelection }

  IXMLDOMSelectionDisp = dispinterface
    ['{AA634FC7-5888-44A7-A257-3A47150D3A0E}']
    property expr: WideString dispid 81;
    property context: IXMLDOMNode dispid 82;
    function peekNode: IXMLDOMNode; dispid 83;
    function matches(const pNode: IXMLDOMNode): IXMLDOMNode; dispid 84;
    function removeNext: IXMLDOMNode; dispid 85;
    procedure removeAll; dispid 86;
    function clone: IXMLDOMSelection; dispid 87;
    function getProperty(const name: WideString): OleVariant; dispid 88;
    procedure setProperty(const name: WideString; value: OleVariant); dispid 89;
  end;

  XMLDOMDocumentEvents = dispinterface
    ['{3EFAA427-272F-11D2-836F-0000F87A7782}']
    procedure ondataavailable; dispid 198;
    procedure onreadystatechange; dispid -609;
  end;

{ IXMLHTTPRequest Interface }

  IXMLHTTPRequest = interface(IDispatch)
    ['{ED8C108D-4349-11D2-91A4-00C04F7969E8}']
    procedure open(const bstrMethod, bstrUrl: WideString; varAsync, bstrUser, bstrPassword: OleVariant); safecall;
    procedure setRequestHeader(const bstrHeader, bstrValue: WideString); safecall;
    function getResponseHeader(const bstrHeader: WideString): WideString; safecall;
    function getAllResponseHeaders: WideString; safecall;
    procedure send(varBody: OleVariant); safecall;
    procedure abort; safecall;
    function Get_status: Integer; safecall;
    function Get_statusText: WideString; safecall;
    function Get_responseXML: IDispatch; safecall;
    function Get_responseText: WideString; safecall;
    function Get_responseBody: OleVariant; safecall;
    function Get_responseStream: OleVariant; safecall;
    function Get_readyState: Integer; safecall;
    procedure Set_onreadystatechange(Value: IDispatch); safecall;
    property status: Integer read Get_status;
    property statusText: WideString read Get_statusText;
    property responseXML: IDispatch read Get_responseXML;
    property responseText: WideString read Get_responseText;
    property responseBody: OleVariant read Get_responseBody;
    property responseStream: OleVariant read Get_responseStream;
    property readyState: Integer read Get_readyState;
    property onreadystatechange: IDispatch write Set_onreadystatechange;
  end;

{ DispInterface declaration for Dual Interface IXMLHTTPRequest }

  IXMLHTTPRequestDisp = dispinterface
    ['{ED8C108D-4349-11D2-91A4-00C04F7969E8}']
    procedure open(const bstrMethod, bstrUrl: WideString; varAsync, bstrUser, bstrPassword: OleVariant); dispid 1;
    procedure setRequestHeader(const bstrHeader, bstrValue: WideString); dispid 2;
    function getResponseHeader(const bstrHeader: WideString): WideString; dispid 3;
    function getAllResponseHeaders: WideString; dispid 4;
    procedure send(varBody: OleVariant); dispid 5;
    procedure abort; dispid 6;
    property status: Integer readonly dispid 7;
    property statusText: WideString readonly dispid 8;
    property responseXML: IDispatch readonly dispid 9;
    property responseText: WideString readonly dispid 10;
    property responseBody: OleVariant readonly dispid 11;
    property responseStream: OleVariant readonly dispid 12;
    property readyState: Integer readonly dispid 13;
    property onreadystatechange: IDispatch writeonly dispid 14;
  end;

{ IServerXMLHTTPRequest Interface }

  IServerXMLHTTPRequest = interface(IXMLHTTPRequest)
    ['{2E9196BF-13BA-4DD4-91CA-6C571F281495}']
    procedure setTimeouts(resolveTimeout, connectTimeout, sendTimeout, receiveTimeout: Integer); safecall;
    function waitForResponse(timeoutInSeconds: OleVariant): WordBool; safecall;
    function getOption(option: SERVERXMLHTTP_OPTION): OleVariant; safecall;
    procedure setOption(option: SERVERXMLHTTP_OPTION; value: OleVariant); safecall;
  end;

{ DispInterface declaration for Dual Interface IServerXMLHTTPRequest }

  IServerXMLHTTPRequestDisp = dispinterface
    ['{2E9196BF-13BA-4DD4-91CA-6C571F281495}']
    procedure open(const bstrMethod, bstrUrl: WideString; varAsync, bstrUser, bstrPassword: OleVariant); dispid 1;
    procedure setRequestHeader(const bstrHeader, bstrValue: WideString); dispid 2;
    function getResponseHeader(const bstrHeader: WideString): WideString; dispid 3;
    function getAllResponseHeaders: WideString; dispid 4;
    procedure send(varBody: OleVariant); dispid 5;
    procedure abort; dispid 6;
    property status: Integer readonly dispid 7;
    property statusText: WideString readonly dispid 8;
    property responseXML: IDispatch readonly dispid 9;
    property responseText: WideString readonly dispid 10;
    property responseBody: OleVariant readonly dispid 11;
    property responseStream: OleVariant readonly dispid 12;
    property readyState: Integer readonly dispid 13;
    property onreadystatechange: IDispatch writeonly dispid 14;
    procedure setTimeouts(resolveTimeout, connectTimeout, sendTimeout, receiveTimeout: Integer); dispid 15;
    function waitForResponse(timeoutInSeconds: OleVariant): WordBool; dispid 16;
    function getOption(option: SERVERXMLHTTP_OPTION): OleVariant; dispid 17;
    procedure setOption(option: SERVERXMLHTTP_OPTION; value: OleVariant); dispid 18;
  end;

{ IServerXMLHTTPRequest2 Interface }

  IServerXMLHTTPRequest2 = interface(IServerXMLHTTPRequest)
    ['{2E01311B-C322-4B0A-BD77-B90CFDC8DCE7}']
    procedure setProxy(proxySetting: SXH_PROXY_SETTING; varProxyServer, varBypassList: OleVariant); safecall;
    procedure setProxyCredentials(const bstrUserName, bstrPassword: WideString); safecall;
  end;

{ DispInterface declaration for Dual Interface IServerXMLHTTPRequest2 }

  IServerXMLHTTPRequest2Disp = dispinterface
    ['{2E01311B-C322-4B0A-BD77-B90CFDC8DCE7}']
    procedure open(const bstrMethod, bstrUrl: WideString; varAsync, bstrUser, bstrPassword: OleVariant); dispid 1;
    procedure setRequestHeader(const bstrHeader, bstrValue: WideString); dispid 2;
    function getResponseHeader(const bstrHeader: WideString): WideString; dispid 3;
    function getAllResponseHeaders: WideString; dispid 4;
    procedure send(varBody: OleVariant); dispid 5;
    procedure abort; dispid 6;
    property status: Integer readonly dispid 7;
    property statusText: WideString readonly dispid 8;
    property responseXML: IDispatch readonly dispid 9;
    property responseText: WideString readonly dispid 10;
    property responseBody: OleVariant readonly dispid 11;
    property responseStream: OleVariant readonly dispid 12;
    property readyState: Integer readonly dispid 13;
    property onreadystatechange: IDispatch writeonly dispid 14;
    procedure setTimeouts(resolveTimeout, connectTimeout, sendTimeout, receiveTimeout: Integer); dispid 15;
    function waitForResponse(timeoutInSeconds: OleVariant): WordBool; dispid 16;
    function getOption(option: SERVERXMLHTTP_OPTION): OleVariant; dispid 17;
    procedure setOption(option: SERVERXMLHTTP_OPTION; value: OleVariant); dispid 18;
    procedure setProxy(proxySetting: SXH_PROXY_SETTING; varProxyServer, varBypassList: OleVariant); dispid 19;
    procedure setProxyCredentials(const bstrUserName, bstrPassword: WideString); dispid 20;
  end;

{ IMXNamespacePrefixes interface }

  IMXNamespacePrefixes = interface(IDispatch)
    ['{C90352F4-643C-4FBC-BB23-E996EB2D51FD}']
    function Get_item(index: Integer): WideString; safecall;
    function Get_length: Integer; safecall;
    function Get__newEnum: IUnknown; safecall;
    property item[index: Integer]: WideString read Get_item; default;
    property length: Integer read Get_length;
    property _newEnum: IUnknown read Get__newEnum;
  end;

{ DispInterface declaration for Dual Interface IMXNamespacePrefixes }

  IMXNamespacePrefixesDisp = dispinterface
    ['{C90352F4-643C-4FBC-BB23-E996EB2D51FD}']
    property item[index: Integer]: WideString readonly dispid 0; default;
    property length: Integer readonly dispid 1416;
  end;

{ IVBMXNamespaceManager interface }

  IVBMXNamespaceManager = interface(IDispatch)
    ['{C90352F5-643C-4FBC-BB23-E996EB2D51FD}']
    procedure Set_allowOverride(Value: WordBool); safecall;
    function Get_allowOverride: WordBool; safecall;
    procedure reset; safecall;
    procedure pushContext; safecall;
    procedure pushNodeContext(const contextNode: IXMLDOMNode; fDeep: WordBool); safecall;
    procedure popContext; safecall;
    procedure declarePrefix(const prefix, namespaceURI: WideString); safecall;
    function getDeclaredPrefixes: IMXNamespacePrefixes; safecall;
    function getPrefixes(const namespaceURI: WideString): IMXNamespacePrefixes; safecall;
    function getURI(const prefix: WideString): OleVariant; safecall;
    function getURIFromNode(const strPrefix: WideString; const contextNode: IXMLDOMNode): OleVariant; safecall;
    property allowOverride: WordBool read Get_allowOverride write Set_allowOverride;
  end;

{ DispInterface declaration for Dual Interface IVBMXNamespaceManager }

  IVBMXNamespaceManagerDisp = dispinterface
    ['{C90352F5-643C-4FBC-BB23-E996EB2D51FD}']
    property allowOverride: WordBool dispid 1406;
    procedure reset; dispid 1407;
    procedure pushContext; dispid 1408;
    procedure pushNodeContext(const contextNode: IXMLDOMNode; fDeep: WordBool); dispid 1409;
    procedure popContext; dispid 1410;
    procedure declarePrefix(const prefix, namespaceURI: WideString); dispid 1411;
    function getDeclaredPrefixes: IMXNamespacePrefixes; dispid 1412;
    function getPrefixes(const namespaceURI: WideString): IMXNamespacePrefixes; dispid 1413;
    function getURI(const prefix: WideString): OleVariant; dispid 1414;
    function getURIFromNode(const strPrefix: WideString; const contextNode: IXMLDOMNode): OleVariant; dispid 1415;
  end;

{ IMXNamespaceManager interface }

  IMXNamespaceManager = interface(IUnknown)
    ['{C90352F6-643C-4FBC-BB23-E996EB2D51FD}']
    procedure putAllowOverride(fOverride: WordBool); safecall;
    function getAllowOverride: WordBool; safecall;
    procedure reset; safecall;
    procedure pushContext; safecall;
    procedure pushNodeContext(const contextNode: IXMLDOMNode; fDeep: WordBool); safecall;
    procedure popContext; safecall;
    procedure declarePrefix(var prefix, namespaceURI: Word); safecall;
    procedure getDeclaredPrefix(nIndex: Integer; var pwchPrefix: Word; var pcchPrefix: SYSINT); safecall;
    procedure getPrefix(var pwszNamespaceURI: Word; nIndex: Integer; var pwchPrefix: Word; var pcchPrefix: SYSINT); safecall;
    procedure getURI(var pwchPrefix: Word; const pContextNode: IXMLDOMNode; var pwchUri: Word; var pcchUri: SYSINT); safecall;
  end;

{ W3C-DOM XML Document (Apartment) }

  CoDOMDocument = class
    class function Create: IXMLDOMDocument2;
    class function CreateRemote(const MachineName: string): IXMLDOMDocument2;
  end;

{ W3C-DOM XML Document (Apartment) }

  CoDOMDocument26 = class
    class function Create: IXMLDOMDocument2;
    class function CreateRemote(const MachineName: string): IXMLDOMDocument2;
  end;

{ W3C-DOM XML Document (Apartment) }

  CoDOMDocument30 = class
    class function Create: IXMLDOMDocument2;
    class function CreateRemote(const MachineName: string): IXMLDOMDocument2;
  end;

{ W3C-DOM XML Document (Apartment) }

  CoDOMDocument40 = class
    class function Create: IXMLDOMDocument2;
    class function CreateRemote(const MachineName: string): IXMLDOMDocument2;
  end;

{ W3C-DOM XML Document 6.0 (Apartment) }

  CoDOMDocument60 = class
    class function Create: IXMLDOMDocument3;
    class function CreateRemote(const MachineName: string): IXMLDOMDocument3;
  end;

{ W3C-DOM XML Document (Free threaded) }

  CoFreeThreadedDOMDocument = class
    class function Create: IXMLDOMDocument2;
    class function CreateRemote(const MachineName: string): IXMLDOMDocument2;
  end;

{ W3C-DOM XML Document (Free threaded) }

  CoFreeThreadedDOMDocument26 = class
    class function Create: IXMLDOMDocument2;
    class function CreateRemote(const MachineName: string): IXMLDOMDocument2;
  end;

{ W3C-DOM XML Document (Free threaded) }

  CoFreeThreadedDOMDocument30 = class
    class function Create: IXMLDOMDocument2;
    class function CreateRemote(const MachineName: string): IXMLDOMDocument2;
  end;

{ W3C-DOM XML Document (Free threaded) }

  CoFreeThreadedDOMDocument40 = class
    class function Create: IXMLDOMDocument2;
    class function CreateRemote(const MachineName: string): IXMLDOMDocument2;
  end;

{ W3C-DOM XML Document 6.0 (Free threaded) }

  CoFreeThreadedDOMDocument60 = class
    class function Create: IXMLDOMDocument3;
    class function CreateRemote(const MachineName: string): IXMLDOMDocument3;
  end;

{ XML Schema Cache }

  CoXMLSchemaCache = class
    class function Create: IXMLDOMSchemaCollection;
    class function CreateRemote(const MachineName: string): IXMLDOMSchemaCollection;
  end;

{ XML Schema Cache 2.6 }

  CoXMLSchemaCache26 = class
    class function Create: IXMLDOMSchemaCollection;
    class function CreateRemote(const MachineName: string): IXMLDOMSchemaCollection;
  end;

{ XML Schema Cache 3.0 }

  CoXMLSchemaCache30 = class
    class function Create: IXMLDOMSchemaCollection;
    class function CreateRemote(const MachineName: string): IXMLDOMSchemaCollection;
  end;

{ XML Schema Cache 4.0 }

  CoXMLSchemaCache40 = class
    class function Create: IXMLDOMSchemaCollection2;
    class function CreateRemote(const MachineName: string): IXMLDOMSchemaCollection2;
  end;

{ XML Schema Cache 6.0 }

  CoXMLSchemaCache60 = class
    class function Create: IXMLDOMSchemaCollection2;
    class function CreateRemote(const MachineName: string): IXMLDOMSchemaCollection2;
  end;

{ Compiled XSL Stylesheet Cache }

  CoXSLTemplate = class
    class function Create: IXSLTemplate;
    class function CreateRemote(const MachineName: string): IXSLTemplate;
  end;

{ Compiled XSL Stylesheet Cache 2.6 }

  CoXSLTemplate26 = class
    class function Create: IXSLTemplate;
    class function CreateRemote(const MachineName: string): IXSLTemplate;
  end;

{ Compiled XSL Stylesheet Cache 3.0 }

  CoXSLTemplate30 = class
    class function Create: IXSLTemplate;
    class function CreateRemote(const MachineName: string): IXSLTemplate;
  end;

{ Compiled XSL Stylesheet Cache 4.0 }

  CoXSLTemplate40 = class
    class function Create: IXSLTemplate;
    class function CreateRemote(const MachineName: string): IXSLTemplate;
  end;

{ XSL Stylesheet Cache 6.0 }

  CoXSLTemplate60 = class
    class function Create: IXSLTemplate;
    class function CreateRemote(const MachineName: string): IXSLTemplate;
  end;

{ XML HTTP Request class. }

  CoXMLHTTP = class
    class function Create: IXMLHTTPRequest;
    class function CreateRemote(const MachineName: string): IXMLHTTPRequest;
  end;

{ XML HTTP Request class. }

  CoXMLHTTP26 = class
    class function Create: IXMLHTTPRequest;
    class function CreateRemote(const MachineName: string): IXMLHTTPRequest;
  end;

{ XML HTTP Request class. }

  CoXMLHTTP30 = class
    class function Create: IXMLHTTPRequest;
    class function CreateRemote(const MachineName: string): IXMLHTTPRequest;
  end;

{ XML HTTP Request class. }

  CoXMLHTTP40 = class
    class function Create: IXMLHTTPRequest;
    class function CreateRemote(const MachineName: string): IXMLHTTPRequest;
  end;

{ XML HTTP Request class 6.0 }

  CoXMLHTTP60 = class
    class function Create: IXMLHTTPRequest;
    class function CreateRemote(const MachineName: string): IXMLHTTPRequest;
  end;

{ Server XML HTTP Request class. }

  CoServerXMLHTTP = class
    class function Create: IServerXMLHTTPRequest;
    class function CreateRemote(const MachineName: string): IServerXMLHTTPRequest;
  end;

{ Server XML HTTP Request class. }

  CoServerXMLHTTP30 = class
    class function Create: IServerXMLHTTPRequest;
    class function CreateRemote(const MachineName: string): IServerXMLHTTPRequest;
  end;

{ Server XML HTTP Request class. }

  CoServerXMLHTTP40 = class
    class function Create: IServerXMLHTTPRequest2;
    class function CreateRemote(const MachineName: string): IServerXMLHTTPRequest2;
  end;

{ Server XML HTTP Request 6.0  }

  CoServerXMLHTTP60 = class
    class function Create: IServerXMLHTTPRequest2;
    class function CreateRemote(const MachineName: string): IServerXMLHTTPRequest2;
  end;

{ SAX XML Reader (version independent) coclass }

  CoSAXXMLReader = class
    class function Create: IVBSAXXMLReader;
    class function CreateRemote(const MachineName: string): IVBSAXXMLReader;
  end;

{ SAX XML Reader 3.0 coclass }

  CoSAXXMLReader30 = class
    class function Create: IVBSAXXMLReader;
    class function CreateRemote(const MachineName: string): IVBSAXXMLReader;
  end;

{ SAX XML Reader 4.0 coclass }

  CoSAXXMLReader40 = class
    class function Create: IVBSAXXMLReader;
    class function CreateRemote(const MachineName: string): IVBSAXXMLReader;
  end;

{ SAX XML Reader 6.0 }

  CoSAXXMLReader60 = class
    class function Create: IVBSAXXMLReader;
    class function CreateRemote(const MachineName: string): IVBSAXXMLReader;
  end;

{ Microsoft XML Writer (version independent) coclass }

  CoMXXMLWriter = class
    class function Create: IMXWriter;
    class function CreateRemote(const MachineName: string): IMXWriter;
  end;

{ Microsoft XML Writer 3.0 coclass }

  CoMXXMLWriter30 = class
    class function Create: IMXWriter;
    class function CreateRemote(const MachineName: string): IMXWriter;
  end;

{ Microsoft XML Writer 4.0 coclass }

  CoMXXMLWriter40 = class
    class function Create: IMXWriter;
    class function CreateRemote(const MachineName: string): IMXWriter;
  end;

{ Microsoft XML Writer 6.0 }

  CoMXXMLWriter60 = class
    class function Create: IMXWriter;
    class function CreateRemote(const MachineName: string): IMXWriter;
  end;

{ Microsoft HTML Writer (version independent) coclass }

  CoMXHTMLWriter = class
    class function Create: IMXWriter;
    class function CreateRemote(const MachineName: string): IMXWriter;
  end;

{ Microsoft HTML Writer 3.0 coclass }

  CoMXHTMLWriter30 = class
    class function Create: IMXWriter;
    class function CreateRemote(const MachineName: string): IMXWriter;
  end;

{ Microsoft HTML Writer 4.0 coclass }

  CoMXHTMLWriter40 = class
    class function Create: IMXWriter;
    class function CreateRemote(const MachineName: string): IMXWriter;
  end;

{ Microsoft HTML Writer 6.0 }

  CoMXHTMLWriter60 = class
    class function Create: IMXWriter;
    class function CreateRemote(const MachineName: string): IMXWriter;
  end;

{ SAX Attributes (version independent) coclass }

  CoSAXAttributes = class
    class function Create: IMXAttributes;
    class function CreateRemote(const MachineName: string): IMXAttributes;
  end;

{ SAX Attributes 3.0 coclass }

  CoSAXAttributes30 = class
    class function Create: IMXAttributes;
    class function CreateRemote(const MachineName: string): IMXAttributes;
  end;

{ SAX Attributes 4.0 coclass }

  CoSAXAttributes40 = class
    class function Create: IMXAttributes;
    class function CreateRemote(const MachineName: string): IMXAttributes;
  end;

{ SAX Attributes 6.0 }

  CoSAXAttributes60 = class
    class function Create: IMXAttributes;
    class function CreateRemote(const MachineName: string): IMXAttributes;
  end;

{ MX Namespace Manager coclass }

  CoMXNamespaceManager = class
    class function Create: IVBMXNamespaceManager;
    class function CreateRemote(const MachineName: string): IVBMXNamespaceManager;
  end;

{ MX Namespace Manager 4.0 coclass }

  CoMXNamespaceManager40 = class
    class function Create: IVBMXNamespaceManager;
    class function CreateRemote(const MachineName: string): IVBMXNamespaceManager;
  end;

{ MX Namespace Manager 6.0 }

  CoMXNamespaceManager60 = class
    class function Create: IVBMXNamespaceManager;
    class function CreateRemote(const MachineName: string): IVBMXNamespaceManager;
  end;



implementation

uses ComObj;

class function CoDOMDocument.Create: IXMLDOMDocument2;
begin
  Result := CreateComObject(Class_DOMDocument) as IXMLDOMDocument2;
end;

class function CoDOMDocument.CreateRemote(const MachineName: string): IXMLDOMDocument2;
begin
  Result := CreateRemoteComObject(MachineName, Class_DOMDocument) as IXMLDOMDocument2;
end;

class function CoDOMDocument26.Create: IXMLDOMDocument2;
begin
  Result := CreateComObject(Class_DOMDocument26) as IXMLDOMDocument2;
end;

class function CoDOMDocument26.CreateRemote(const MachineName: string): IXMLDOMDocument2;
begin
  Result := CreateRemoteComObject(MachineName, Class_DOMDocument26) as IXMLDOMDocument2;
end;

class function CoDOMDocument30.Create: IXMLDOMDocument2;
begin
  Result := CreateComObject(Class_DOMDocument30) as IXMLDOMDocument2;
end;

class function CoDOMDocument30.CreateRemote(const MachineName: string): IXMLDOMDocument2;
begin
  Result := CreateRemoteComObject(MachineName, Class_DOMDocument30) as IXMLDOMDocument2;
end;

class function CoDOMDocument40.Create: IXMLDOMDocument2;
begin
  Result := CreateComObject(Class_DOMDocument40) as IXMLDOMDocument2;
end;

class function CoDOMDocument40.CreateRemote(const MachineName: string): IXMLDOMDocument2;
begin
  Result := CreateRemoteComObject(MachineName, Class_DOMDocument40) as IXMLDOMDocument2;
end;

class function CoDOMDocument60.Create: IXMLDOMDocument3;
begin
  Result := CreateComObject(Class_DOMDocument60) as IXMLDOMDocument3;
end;

class function CoDOMDocument60.CreateRemote(const MachineName: string): IXMLDOMDocument3;
begin
  Result := CreateRemoteComObject(MachineName, Class_DOMDocument60) as IXMLDOMDocument3;
end;

class function CoFreeThreadedDOMDocument.Create: IXMLDOMDocument2;
begin
  Result := CreateComObject(Class_FreeThreadedDOMDocument) as IXMLDOMDocument2;
end;

class function CoFreeThreadedDOMDocument.CreateRemote(const MachineName: string): IXMLDOMDocument2;
begin
  Result := CreateRemoteComObject(MachineName, Class_FreeThreadedDOMDocument) as IXMLDOMDocument2;
end;

class function CoFreeThreadedDOMDocument26.Create: IXMLDOMDocument2;
begin
  Result := CreateComObject(Class_FreeThreadedDOMDocument26) as IXMLDOMDocument2;
end;

class function CoFreeThreadedDOMDocument26.CreateRemote(const MachineName: string): IXMLDOMDocument2;
begin
  Result := CreateRemoteComObject(MachineName, Class_FreeThreadedDOMDocument26) as IXMLDOMDocument2;
end;

class function CoFreeThreadedDOMDocument30.Create: IXMLDOMDocument2;
begin
  Result := CreateComObject(Class_FreeThreadedDOMDocument30) as IXMLDOMDocument2;
end;

class function CoFreeThreadedDOMDocument30.CreateRemote(const MachineName: string): IXMLDOMDocument2;
begin
  Result := CreateRemoteComObject(MachineName, Class_FreeThreadedDOMDocument30) as IXMLDOMDocument2;
end;

class function CoFreeThreadedDOMDocument40.Create: IXMLDOMDocument2;
begin
  Result := CreateComObject(Class_FreeThreadedDOMDocument40) as IXMLDOMDocument2;
end;

class function CoFreeThreadedDOMDocument40.CreateRemote(const MachineName: string): IXMLDOMDocument2;
begin
  Result := CreateRemoteComObject(MachineName, Class_FreeThreadedDOMDocument40) as IXMLDOMDocument2;
end;

class function CoFreeThreadedDOMDocument60.Create: IXMLDOMDocument3;
begin
  Result := CreateComObject(Class_FreeThreadedDOMDocument60) as IXMLDOMDocument3;
end;

class function CoFreeThreadedDOMDocument60.CreateRemote(const MachineName: string): IXMLDOMDocument3;
begin
  Result := CreateRemoteComObject(MachineName, Class_FreeThreadedDOMDocument60) as IXMLDOMDocument3;
end;

class function CoXMLSchemaCache.Create: IXMLDOMSchemaCollection;
begin
  Result := CreateComObject(Class_XMLSchemaCache) as IXMLDOMSchemaCollection;
end;

class function CoXMLSchemaCache.CreateRemote(const MachineName: string): IXMLDOMSchemaCollection;
begin
  Result := CreateRemoteComObject(MachineName, Class_XMLSchemaCache) as IXMLDOMSchemaCollection;
end;

class function CoXMLSchemaCache26.Create: IXMLDOMSchemaCollection;
begin
  Result := CreateComObject(Class_XMLSchemaCache26) as IXMLDOMSchemaCollection;
end;

class function CoXMLSchemaCache26.CreateRemote(const MachineName: string): IXMLDOMSchemaCollection;
begin
  Result := CreateRemoteComObject(MachineName, Class_XMLSchemaCache26) as IXMLDOMSchemaCollection;
end;

class function CoXMLSchemaCache30.Create: IXMLDOMSchemaCollection;
begin
  Result := CreateComObject(Class_XMLSchemaCache30) as IXMLDOMSchemaCollection;
end;

class function CoXMLSchemaCache30.CreateRemote(const MachineName: string): IXMLDOMSchemaCollection;
begin
  Result := CreateRemoteComObject(MachineName, Class_XMLSchemaCache30) as IXMLDOMSchemaCollection;
end;

class function CoXMLSchemaCache40.Create: IXMLDOMSchemaCollection2;
begin
  Result := CreateComObject(Class_XMLSchemaCache40) as IXMLDOMSchemaCollection2;
end;

class function CoXMLSchemaCache40.CreateRemote(const MachineName: string): IXMLDOMSchemaCollection2;
begin
  Result := CreateRemoteComObject(MachineName, Class_XMLSchemaCache40) as IXMLDOMSchemaCollection2;
end;

class function CoXMLSchemaCache60.Create: IXMLDOMSchemaCollection2;
begin
  Result := CreateComObject(Class_XMLSchemaCache60) as IXMLDOMSchemaCollection2;
end;

class function CoXMLSchemaCache60.CreateRemote(const MachineName: string): IXMLDOMSchemaCollection2;
begin
  Result := CreateRemoteComObject(MachineName, Class_XMLSchemaCache60) as IXMLDOMSchemaCollection2;
end;

class function CoXSLTemplate.Create: IXSLTemplate;
begin
  Result := CreateComObject(Class_XSLTemplate) as IXSLTemplate;
end;

class function CoXSLTemplate.CreateRemote(const MachineName: string): IXSLTemplate;
begin
  Result := CreateRemoteComObject(MachineName, Class_XSLTemplate) as IXSLTemplate;
end;

class function CoXSLTemplate26.Create: IXSLTemplate;
begin
  Result := CreateComObject(Class_XSLTemplate26) as IXSLTemplate;
end;

class function CoXSLTemplate26.CreateRemote(const MachineName: string): IXSLTemplate;
begin
  Result := CreateRemoteComObject(MachineName, Class_XSLTemplate26) as IXSLTemplate;
end;

class function CoXSLTemplate30.Create: IXSLTemplate;
begin
  Result := CreateComObject(Class_XSLTemplate30) as IXSLTemplate;
end;

class function CoXSLTemplate30.CreateRemote(const MachineName: string): IXSLTemplate;
begin
  Result := CreateRemoteComObject(MachineName, Class_XSLTemplate30) as IXSLTemplate;
end;

class function CoXSLTemplate40.Create: IXSLTemplate;
begin
  Result := CreateComObject(Class_XSLTemplate40) as IXSLTemplate;
end;

class function CoXSLTemplate40.CreateRemote(const MachineName: string): IXSLTemplate;
begin
  Result := CreateRemoteComObject(MachineName, Class_XSLTemplate40) as IXSLTemplate;
end;

class function CoXSLTemplate60.Create: IXSLTemplate;
begin
  Result := CreateComObject(Class_XSLTemplate60) as IXSLTemplate;
end;

class function CoXSLTemplate60.CreateRemote(const MachineName: string): IXSLTemplate;
begin
  Result := CreateRemoteComObject(MachineName, Class_XSLTemplate60) as IXSLTemplate;
end;

class function CoXMLHTTP.Create: IXMLHTTPRequest;
begin
  Result := CreateComObject(Class_XMLHTTP) as IXMLHTTPRequest;
end;

class function CoXMLHTTP.CreateRemote(const MachineName: string): IXMLHTTPRequest;
begin
  Result := CreateRemoteComObject(MachineName, Class_XMLHTTP) as IXMLHTTPRequest;
end;

class function CoXMLHTTP26.Create: IXMLHTTPRequest;
begin
  Result := CreateComObject(Class_XMLHTTP26) as IXMLHTTPRequest;
end;

class function CoXMLHTTP26.CreateRemote(const MachineName: string): IXMLHTTPRequest;
begin
  Result := CreateRemoteComObject(MachineName, Class_XMLHTTP26) as IXMLHTTPRequest;
end;

class function CoXMLHTTP30.Create: IXMLHTTPRequest;
begin
  Result := CreateComObject(Class_XMLHTTP30) as IXMLHTTPRequest;
end;

class function CoXMLHTTP30.CreateRemote(const MachineName: string): IXMLHTTPRequest;
begin
  Result := CreateRemoteComObject(MachineName, Class_XMLHTTP30) as IXMLHTTPRequest;
end;

class function CoXMLHTTP40.Create: IXMLHTTPRequest;
begin
  Result := CreateComObject(Class_XMLHTTP40) as IXMLHTTPRequest;
end;

class function CoXMLHTTP40.CreateRemote(const MachineName: string): IXMLHTTPRequest;
begin
  Result := CreateRemoteComObject(MachineName, Class_XMLHTTP40) as IXMLHTTPRequest;
end;

class function CoXMLHTTP60.Create: IXMLHTTPRequest;
begin
  Result := CreateComObject(Class_XMLHTTP60) as IXMLHTTPRequest;
end;

class function CoXMLHTTP60.CreateRemote(const MachineName: string): IXMLHTTPRequest;
begin
  Result := CreateRemoteComObject(MachineName, Class_XMLHTTP60) as IXMLHTTPRequest;
end;

class function CoServerXMLHTTP.Create: IServerXMLHTTPRequest;
begin
  Result := CreateComObject(Class_ServerXMLHTTP) as IServerXMLHTTPRequest;
end;

class function CoServerXMLHTTP.CreateRemote(const MachineName: string): IServerXMLHTTPRequest;
begin
  Result := CreateRemoteComObject(MachineName, Class_ServerXMLHTTP) as IServerXMLHTTPRequest;
end;

class function CoServerXMLHTTP30.Create: IServerXMLHTTPRequest;
begin
  Result := CreateComObject(Class_ServerXMLHTTP30) as IServerXMLHTTPRequest;
end;

class function CoServerXMLHTTP30.CreateRemote(const MachineName: string): IServerXMLHTTPRequest;
begin
  Result := CreateRemoteComObject(MachineName, Class_ServerXMLHTTP30) as IServerXMLHTTPRequest;
end;

class function CoServerXMLHTTP40.Create: IServerXMLHTTPRequest2;
begin
  Result := CreateComObject(Class_ServerXMLHTTP40) as IServerXMLHTTPRequest2;
end;

class function CoServerXMLHTTP40.CreateRemote(const MachineName: string): IServerXMLHTTPRequest2;
begin
  Result := CreateRemoteComObject(MachineName, Class_ServerXMLHTTP40) as IServerXMLHTTPRequest2;
end;

class function CoServerXMLHTTP60.Create: IServerXMLHTTPRequest2;
begin
  Result := CreateComObject(Class_ServerXMLHTTP60) as IServerXMLHTTPRequest2;
end;

class function CoServerXMLHTTP60.CreateRemote(const MachineName: string): IServerXMLHTTPRequest2;
begin
  Result := CreateRemoteComObject(MachineName, Class_ServerXMLHTTP60) as IServerXMLHTTPRequest2;
end;

class function CoSAXXMLReader.Create: IVBSAXXMLReader;
begin
  Result := CreateComObject(Class_SAXXMLReader) as IVBSAXXMLReader;
end;

class function CoSAXXMLReader.CreateRemote(const MachineName: string): IVBSAXXMLReader;
begin
  Result := CreateRemoteComObject(MachineName, Class_SAXXMLReader) as IVBSAXXMLReader;
end;

class function CoSAXXMLReader30.Create: IVBSAXXMLReader;
begin
  Result := CreateComObject(Class_SAXXMLReader30) as IVBSAXXMLReader;
end;

class function CoSAXXMLReader30.CreateRemote(const MachineName: string): IVBSAXXMLReader;
begin
  Result := CreateRemoteComObject(MachineName, Class_SAXXMLReader30) as IVBSAXXMLReader;
end;

class function CoSAXXMLReader40.Create: IVBSAXXMLReader;
begin
  Result := CreateComObject(Class_SAXXMLReader40) as IVBSAXXMLReader;
end;

class function CoSAXXMLReader40.CreateRemote(const MachineName: string): IVBSAXXMLReader;
begin
  Result := CreateRemoteComObject(MachineName, Class_SAXXMLReader40) as IVBSAXXMLReader;
end;

class function CoSAXXMLReader60.Create: IVBSAXXMLReader;
begin
  Result := CreateComObject(Class_SAXXMLReader60) as IVBSAXXMLReader;
end;

class function CoSAXXMLReader60.CreateRemote(const MachineName: string): IVBSAXXMLReader;
begin
  Result := CreateRemoteComObject(MachineName, Class_SAXXMLReader60) as IVBSAXXMLReader;
end;

class function CoMXXMLWriter.Create: IMXWriter;
begin
  Result := CreateComObject(Class_MXXMLWriter) as IMXWriter;
end;

class function CoMXXMLWriter.CreateRemote(const MachineName: string): IMXWriter;
begin
  Result := CreateRemoteComObject(MachineName, Class_MXXMLWriter) as IMXWriter;
end;

class function CoMXXMLWriter30.Create: IMXWriter;
begin
  Result := CreateComObject(Class_MXXMLWriter30) as IMXWriter;
end;

class function CoMXXMLWriter30.CreateRemote(const MachineName: string): IMXWriter;
begin
  Result := CreateRemoteComObject(MachineName, Class_MXXMLWriter30) as IMXWriter;
end;

class function CoMXXMLWriter40.Create: IMXWriter;
begin
  Result := CreateComObject(Class_MXXMLWriter40) as IMXWriter;
end;

class function CoMXXMLWriter40.CreateRemote(const MachineName: string): IMXWriter;
begin
  Result := CreateRemoteComObject(MachineName, Class_MXXMLWriter40) as IMXWriter;
end;

class function CoMXXMLWriter60.Create: IMXWriter;
begin
  Result := CreateComObject(Class_MXXMLWriter60) as IMXWriter;
end;

class function CoMXXMLWriter60.CreateRemote(const MachineName: string): IMXWriter;
begin
  Result := CreateRemoteComObject(MachineName, Class_MXXMLWriter60) as IMXWriter;
end;

class function CoMXHTMLWriter.Create: IMXWriter;
begin
  Result := CreateComObject(Class_MXHTMLWriter) as IMXWriter;
end;

class function CoMXHTMLWriter.CreateRemote(const MachineName: string): IMXWriter;
begin
  Result := CreateRemoteComObject(MachineName, Class_MXHTMLWriter) as IMXWriter;
end;

class function CoMXHTMLWriter30.Create: IMXWriter;
begin
  Result := CreateComObject(Class_MXHTMLWriter30) as IMXWriter;
end;

class function CoMXHTMLWriter30.CreateRemote(const MachineName: string): IMXWriter;
begin
  Result := CreateRemoteComObject(MachineName, Class_MXHTMLWriter30) as IMXWriter;
end;

class function CoMXHTMLWriter40.Create: IMXWriter;
begin
  Result := CreateComObject(Class_MXHTMLWriter40) as IMXWriter;
end;

class function CoMXHTMLWriter40.CreateRemote(const MachineName: string): IMXWriter;
begin
  Result := CreateRemoteComObject(MachineName, Class_MXHTMLWriter40) as IMXWriter;
end;

class function CoMXHTMLWriter60.Create: IMXWriter;
begin
  Result := CreateComObject(Class_MXHTMLWriter60) as IMXWriter;
end;

class function CoMXHTMLWriter60.CreateRemote(const MachineName: string): IMXWriter;
begin
  Result := CreateRemoteComObject(MachineName, Class_MXHTMLWriter60) as IMXWriter;
end;

class function CoSAXAttributes.Create: IMXAttributes;
begin
  Result := CreateComObject(Class_SAXAttributes) as IMXAttributes;
end;

class function CoSAXAttributes.CreateRemote(const MachineName: string): IMXAttributes;
begin
  Result := CreateRemoteComObject(MachineName, Class_SAXAttributes) as IMXAttributes;
end;

class function CoSAXAttributes30.Create: IMXAttributes;
begin
  Result := CreateComObject(Class_SAXAttributes30) as IMXAttributes;
end;

class function CoSAXAttributes30.CreateRemote(const MachineName: string): IMXAttributes;
begin
  Result := CreateRemoteComObject(MachineName, Class_SAXAttributes30) as IMXAttributes;
end;

class function CoSAXAttributes40.Create: IMXAttributes;
begin
  Result := CreateComObject(Class_SAXAttributes40) as IMXAttributes;
end;

class function CoSAXAttributes40.CreateRemote(const MachineName: string): IMXAttributes;
begin
  Result := CreateRemoteComObject(MachineName, Class_SAXAttributes40) as IMXAttributes;
end;

class function CoSAXAttributes60.Create: IMXAttributes;
begin
  Result := CreateComObject(Class_SAXAttributes60) as IMXAttributes;
end;

class function CoSAXAttributes60.CreateRemote(const MachineName: string): IMXAttributes;
begin
  Result := CreateRemoteComObject(MachineName, Class_SAXAttributes60) as IMXAttributes;
end;

class function CoMXNamespaceManager.Create: IVBMXNamespaceManager;
begin
  Result := CreateComObject(Class_MXNamespaceManager) as IVBMXNamespaceManager;
end;

class function CoMXNamespaceManager.CreateRemote(const MachineName: string): IVBMXNamespaceManager;
begin
  Result := CreateRemoteComObject(MachineName, Class_MXNamespaceManager) as IVBMXNamespaceManager;
end;

class function CoMXNamespaceManager40.Create: IVBMXNamespaceManager;
begin
  Result := CreateComObject(Class_MXNamespaceManager40) as IVBMXNamespaceManager;
end;

class function CoMXNamespaceManager40.CreateRemote(const MachineName: string): IVBMXNamespaceManager;
begin
  Result := CreateRemoteComObject(MachineName, Class_MXNamespaceManager40) as IVBMXNamespaceManager;
end;

class function CoMXNamespaceManager60.Create: IVBMXNamespaceManager;
begin
  Result := CreateComObject(Class_MXNamespaceManager60) as IVBMXNamespaceManager;
end;

class function CoMXNamespaceManager60.CreateRemote(const MachineName: string): IVBMXNamespaceManager;
begin
  Result := CreateRemoteComObject(MachineName, Class_MXNamespaceManager60) as IVBMXNamespaceManager;
end;


end.
