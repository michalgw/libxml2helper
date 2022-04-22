unit xml2helpers;

{$mode ObjFPC}{$H+}
{$modeswitch TypeHelpers}

interface

uses
  Classes, SysUtils, xml2;

type

  { TxmlCharHelper }

  TxmlCharHelper = type helper for xmlCharPtr
    procedure Free; inline;
    function CharStrdup: xmlCharPtr; inline;
    function CharStrndup(Len: Integer): xmlCharPtr; inline;
    function CheckUTF8: Boolean; inline;
    function GetUTF8Char(var Len: Integer): Integer; inline;
    function StrEqual(const Str2: String): Boolean; overload; inline;
    function StrEqual(const Str2: xmlCharPtr): Boolean; overload; inline;
    function Strcasecmp(const Str2: String): Integer; overload; inline;
    function Strcasecmp(const Str2: xmlCharPtr): Integer; overload; inline;
    function Strcasestr(const Str2: xmlCharPtr): xmlCharPtr; inline;
    function Strcat(const Add: String): xmlCharPtr; overload inline;
    function Strcat(const Add: xmlCharPtr): xmlCharPtr; overload inline;
    function Strchr(Value: xmlChar): xmlCharPtr; inline;
    function Strcmp(const Str2: String): Integer; overload; inline;
    function Strcmp(const Str2: xmlCharPtr): Integer; overload; inline;
    function Strdup: xmlCharPtr; inline;
    function Strlen: Integer; inline;
    function Strncasecmp(const Str2: String; Len: Integer): Integer; overload; inline;
    function Strncasecmp(const Str2: xmlCharPtr; Len: Integer): Integer; overload; inline;
    function Strncat(const Str2: String; Len: Integer): xmlCharPtr; overload; inline;
    function Strncat(const Str2: xmlCharPtr; Len: Integer): xmlCharPtr; overload; inline;
    function StrncatNew(const Str2: String; Len: Integer): xmlCharPtr; overload; inline;
    function StrncatNew(const Str2: xmlCharPtr; Len: Integer): xmlCharPtr; overload; inline;
    function Strndup(Len: Integer): xmlCharPtr; inline;
    function Strstr(Value: String): xmlCharPtr; overload; inline;
    function Strstr(Value: xmlCharPtr): xmlCharPtr; overload; inline;
    function Strsub(Start, Len: Integer): xmlCharPtr; inline;
    function UTF8Charcmp(const Str2: String): Integer; overload; inline;
    function UTF8Charcmp(const Str2: xmlCharPtr): Integer; overload; inline;
    function UTF8Size: Integer; inline;
    function UTF8Strlen: Integer; inline;
    function UTF8Strloc(UTFChar: String): Integer; overload; inline;
    function UTF8Strloc(UTFChar: xmlCharPtr): Integer; overload; inline;
    function UTF8Strndup(Len: Integer): xmlCharPtr; inline;
    function UTF8Strpos(Pos: Integer): xmlCharPtr; inline;
    function UTF8Strsize(Len: Integer): Integer; inline;
    function UTF8Strsub(Start, Len: Integer): xmlCharPtr; inline;
  end;

  { TxmlDocHelper }

  TxmlDocHelper = type helper for xmlDocPtr
    class function ParseFile(AFileName: String): xmlDocPtr; static; inline;
    class function ParseFile(AFileName: PChar): xmlDocPtr; static; inline;
    class function ParseDoc(AContent: String): xmlDocPtr; overload; static; inline;
    class function ParseDoc(AContent: PChar): xmlDocPtr; overload; static; inline;
    class function ParseMemory(AData: PChar; Len: Integer): xmlDocPtr; static; inline;
    class function RecoverFile(AFileName: String): xmlDocPtr; static; inline;
    class function RecoverDoc(AContent: String): xmlDocPtr; overload; static; inline;
    class function RecoverDoc(AContent: PChar): xmlDocPtr; overload; static; inline;
    class function RecoverMemory(AData: PChar; Len: Integer): xmlDocPtr; static; inline;
    class function ReadFile(AFileName, Encoding: String; Options: Integer): xmlDocPtr; static; inline;
    class function ReadDoc(AContent, URL, Encoding: String; Options: Integer): xmlDocPtr; overload; static; inline;
    class function ReadDoc(AContent, URL, Encoding: PChar; Options: Integer): xmlDocPtr; overload; static; inline;
    class function ReadMemory(AData: PChar; Len: Integer; URL, Encoding: String; Options: Integer): xmlDocPtr; static; inline;
    class function NewDoc(AVersion: String = XML_DEFAULT_VERSION): xmlDocPtr; static; inline;

    procedure Free; inline;
    procedure FreeAndNil; inline;

    function GetRootElement: xmlNodePtr; inline;
    procedure SetRootElement(ARoot: xmlNodePtr); inline;
    function GetCompressMode: Integer; inline;
    procedure SetCompressMode(AValue: Integer); inline;
    function GetDocEntity(AName: String): xmlEntityPtr; inline;
    function GetDtdEntity(AName: String): xmlEntityPtr; inline;
    function GetIntSubset: xmlDtdPtr; inline;
    function GetNsList(Node: xmlNodePtr): xmlNsPtrPtr; inline;

    function AddDocEntity(const Name: String; &Type: Integer; const ExternalID, SystemID, Content: String): xmlEntityPtr; overload; inline;
    function AddDocEntity(const Name: xmlCharPtr; &Type: Integer; const ExternalID, SystemID, Content: xmlCharPtr): xmlEntityPtr; overload; inline;
    function AddDtdEntity(const Name: String; &Type: Integer; const ExternalID, SystemID, Content: String): xmlEntityPtr; overload; inline;
    function AddDtdEntity(const Name: xmlCharPtr; &Type: Integer; const ExternalID, SystemID, Content: xmlCharPtr): xmlEntityPtr; overload; inline;

    function C14NDocDumpMemory(Nodes: xmlNodeSetPtr; Mode: xmlC14NMode; InclusiveNsPrefixes: array of String; WithComments: Boolean; out DocTxtPtr: String): Integer; overload; inline;
    function C14NDocDumpMemory(Nodes: xmlNodeSetPtr; Mode: xmlC14NMode; InclusiveNsPrefixes: xmlCharPtrPtr; WithComments: Boolean; var DocTxtPtr: xmlCharPtr): Integer; overload; inline;
    function C14NDocSave(Nodes: xmlNodeSetPtr; Mode: xmlC14NMode; InclusiveNsPrefixes: array of String; WithComments: Boolean; const FileName: String; Compression: Integer): Integer; overload; inline;
    function C14NDocSave(Nodes: xmlNodeSetPtr; Mode: xmlC14NMode; InclusiveNsPrefixes: xmlCharPtrPtr; WithComments: Boolean; const FileName: xmlCharPtr; Compression: Integer): Integer; overload; inline;
    function C14NExecute(IsVisibleCallback: xmlC14NIsVisibleCallback; UserData: Pointer; Mode: xmlC14NMode; InclusiveNsPrefixes: array of String; WithComments: Boolean; Buf: xmlOutputBufferPtr): Integer; overload; inline;
    function C14NExecute(IsVisibleCallback: xmlC14NIsVisibleCallback; UserData: Pointer; Mode: xmlC14NMode; InclusiveNsPrefixes: xmlCharPtrPtr; WithComments: Boolean; Buf: xmlOutputBufferPtr): Integer; overload; inline;

    function CopyDoc(Recursive: Boolean): xmlDocPtr; inline;
    function CopyDocElementContent(Cur: xmlElementContentPtr): xmlElementContentPtr; inline;
    function CreateIntSubset(const Name, ExternalID, SystemID: String): xmlDtdPtr; overload; inline;
    function CreateIntSubset(const Name, ExternalID, SystemID: xmlCharPtr): xmlDtdPtr; overload; inline;
    function DocCopyNodeList(Node: xmlNodePtr): xmlNodePtr; inline;

    procedure DocDumpFormatMemory(out Mem: String; Format: Integer); overload; inline;
    procedure DocDumpFormatMemory(var Mem: xmlCharPtr; var Size: Integer; Format: Integer); overload; inline;
    procedure DocDumpFormatMemoryEnc(out Mem: String; const Encoding: String; Format: Integer); overload; inline;
    procedure DocDumpFormatMemoryEnc(var Mem: xmlCharPtr; var Size: Integer; const Encoding: PChar; Format: Integer); overload; inline;
    procedure DocDumpMemory(out Mem: String); inline; overload;
    procedure DocDumpMemory(out Mem: xmlCharPtr; var Size: Integer); inline; overload;
    procedure DocDumpMemoryEnc(out Mem: String; const Encoding: String); overload; inline;
    procedure DocDumpMemoryEnc(var Mem: xmlCharPtr; var Size: Integer; const Encoding: PChar); overload; inline;

    function EncodeEntitiesReentrant(Input: String): String; overload; inline;
    function EncodeEntitiesReentrant(Input: xmlCharPtr): xmlCharPtr; overload; inline;
    function EncodeSpecialChars(AInput: String): String; overload; inline;
    function EncodeSpecialChars(AInput: xmlCharPtr): xmlCharPtr; overload; inline;

    procedure FreeDoc; inline;
    procedure FreeDocElementContent(Element: xmlElementContentPtr); inline;

    function GetID(const ID: String): xmlAttrPtr; overload; inline;
    function GetID(const ID: xmlCharPtr): xmlAttrPtr; overload; inline;
    function GetParameterEntity(const Name: String): xmlEntityPtr; overload; inline;
    function GetParameterEntity(const Name: xmlCharPtr): xmlEntityPtr; overload; inline;
    function GetRefs(const ID: String): xmlListPtr; overload; inline;
    function GetRefs(const ID: xmlCharPtr): xmlListPtr; overload; inline;

    function IsID(Elem: xmlNodePtr; Attr: xmlAttrPtr): Boolean; inline;
    function IsMixedElement(Name: String): Boolean; overload; inline;
    function IsMixedElement(Name: xmlCharPtr): Boolean; overload; inline;
    function IsRef(Elem: xmlNodePtr; Attr: xmlAttrPtr): Boolean; inline;

    function NewCDataBlock(const Content: RawByteString): xmlNodePtr; overload; inline;
    function NewCDataBlock(const Content: xmlCharPtr; Len: Integer): xmlNodePtr; overload; inline;
    function NewCharRef(const Name: String): xmlNodePtr; overload; inline;
    function NewCharRef(const Name: xmlCharPtr): xmlNodePtr; overload; inline;
    function NewDocComment(Content: String): xmlNodePtr; overload; inline;
    function NewDocComment(Content: PChar): xmlNodePtr; overload; inline;
    function NewDocElementContent(const Name: String; &Type: xmlElementContentType): xmlElementContentPtr; overload; inline;
    function NewDocElementContent(const Name: xmlCharPtr; &Type: xmlElementContentType): xmlElementContentPtr; overload; inline;
    function NewDocFragment: xmlNodePtr; inline;
    function NewDocNode(const Name: String; Ns: xmlNsPtr = nil; Content: String = ''): xmlNodePtr; overload; inline;
    function NewDocNode(const Name: PChar; Ns: xmlNsPtr = nil; Content: PChar = nil): xmlNodePtr; overload; inline;
    function NewDocNodeEatName(const Name: String; Ns: xmlNsPtr = nil; Content: String = ''): xmlNodePtr; overload; inline;
    function NewDocNodeEatName(const Name: PChar; Ns: xmlNsPtr = nil; Content: PChar = nil): xmlNodePtr; overload; inline;
    function NewDocPI(const Name, Content: String): xmlNodePtr; overload; inline;
    function NewDocPI(const Name, Content: PChar): xmlNodePtr; overload; inline;
    function NewDocProp(const Name, Value: String): xmlAttrPtr; overload; inline;
    function NewDocProp(const Name, Value: PChar): xmlAttrPtr; overload; inline;
    function NewDocRawNode(const Name: String; Ns: xmlNsPtr = nil; Content: String = ''): xmlNodePtr; overload; inline;
    function NewDocRawNode(const Name: PChar; Ns: xmlNsPtr = nil; Content: PChar = nil): xmlNodePtr; overload; inline;
    function NewDocText(Content: String): xmlNodePtr; overload; inline;
    function NewDocText(Content: PChar): xmlNodePtr; overload; inline;
    function NewDocTextLen(Content: String; Len: Integer): xmlNodePtr; overload; inline;
    function NewDocTextLen(Content: PChar; Len: Integer): xmlNodePtr; overload; inline;
    function NewDtd(const Name, ExternalID, SystemID: String): xmlDtdPtr; overload; inline;
    function NewDtd(const Name, ExternalID, SystemID: PChar): xmlDtdPtr; overload; inline;
    function NewEntity(const Name: String; &Type: Integer; const ExternalID, SystemID, Content: String): xmlEntityPtr; overload; inline;
    function NewEntity(const Name: xmlCharPtr; &Type: Integer; const ExternalID, SystemID, Content: xmlCharPtr): xmlEntityPtr; overload; inline;
    function NewTextWriterTree(Node: xmlNodePtr; Compression: Integer): xmlTextWriterPtr; inline;
    function NewReference(const Name: String): xmlNodePtr; overload; inline;
    function NewReference(const Name: PChar): xmlNodePtr; overload; inline;

    function NodeGetBaseS(const Cur: xmlNodePtr): String; inline;
    function NodeGetBase(const Cur: xmlNodePtr): xmlCharPtr; inline;
    function NodeListGetRawStringS(const List: xmlNodePtr; &InLine: LongBool): String; inline;
    function NodeListGetRawString(const List: xmlNodePtr; &InLine: LongBool): xmlCharPtr; inline;
    function NodeListGetStringS(const List: xmlNodePtr; &InLine: LongBool): String; inline;
    function NodeListGetString(const List: xmlNodePtr; &InLine: LongBool): xmlCharPtr; inline;
    function StringGetNodeList(const Value: String): xmlNodePtr; overload; inline;
    function StringGetNodeList(const Value: xmlCharPtr): xmlNodePtr; overload; inline;
    function StringLenGetNodeList(const Value: String; Len: Integer): xmlNodePtr; overload; inline;
    function StringLenGetNodeList(const Value: xmlCharPtr; Len: Integer): xmlNodePtr; overload; inline;

    function ParseBalancedChunkMemory(Sax: xmlSAXHandlerPtr; UserData: Pointer; Depth: Integer; InString: String; out List: xmlNodePtr): Integer; overload; inline;
    function ParseBalancedChunkMemory(Sax: xmlSAXHandlerPtr; UserData: Pointer; Depth: Integer; InString: xmlCharPtr; out List: xmlNodePtr): Integer; overload; inline;
    function ParseBalancedChunkMemoryRecover(Sax: xmlSAXHandlerPtr; UserData: Pointer; Depth: Integer; InString: String; out List: xmlNodePtr; Recover: Integer): Integer; overload; inline;
    function ParseBalancedChunkMemoryRecover(Sax: xmlSAXHandlerPtr; UserData: Pointer; Depth: Integer; InString: xmlCharPtr; out List: xmlNodePtr; Recover: Integer): Integer; overload; inline;
    function ParseExternalEntity(Sax: xmlSAXHandlerPtr; UserData: Pointer; Depth: Integer; const URL, ID: String; out List: xmlNodePtr): Integer; overload; inline;
    function ParseExternalEntity(Sax: xmlSAXHandlerPtr; UserData: Pointer; Depth: Integer; const URL, ID: xmlCharPtr; out List: xmlNodePtr): Integer; overload; inline;

    function ReaderWalker: xmlTextReaderPtr; inline;
    function ReconciliateNs(Tree: xmlNodePtr): Integer; inline;
    function RelaxNGNewDocParserCtxt: xmlRelaxNGParserCtxtPtr; inline;

    function RemoveID(Attr: xmlAttrPtr): Boolean; inline;
    function RemoveRef(Attr: xmlAttrPtr): Boolean; inline;

    function SaveDoc(Ctxt: xmlSaveCtxtPtr): Integer; inline;
    function SaveFile(const FileName: String): Integer; overload; inline;
    function SaveFile(const FileName: PChar): Integer; overload; inline;
    function SaveFileEnc(const FileName, Encoding: String): Integer; overload; inline;
    function SaveFileEnc(const FileName, Encoding: PChar): Integer; overload; inline;
    function SaveFileTo(Buf: xmlOutputBufferPtr; const Encoding: String): Integer; overload; inline;
    function SaveFileTo(Buf: xmlOutputBufferPtr; const Encoding: PChar): Integer; overload; inline;
    function SaveFormatFile(const FileName: String; Format: Integer): Integer; overload; inline;
    function SaveFormatFile(const FileName: PChar; Format: Integer): Integer; overload; inline;
    function SaveFormatFileEnc(const FileName, Encoding: String; Format: Integer): Integer; overload; inline;
    function SaveFormatFileEnc(const FileName, Encoding: PChar; Format: Integer): Integer; overload; inline;
    function SaveFormatFileTo(Buf: xmlOutputBufferPtr; const Encoding: String; Format: Integer): Integer; overload; inline;
    function SaveFormatFileTo(Buf: xmlOutputBufferPtr; const Encoding: PChar; Format: Integer): Integer; overload; inline;

    function SchemaNewDocParserCtxt: xmlSchemaParserCtxtPtr; inline;

    function SchematronNewDocParserCtxt: xmlSchematronParserCtxtPtr; inline;

    function SearchNs(Node: xmlNodePtr; const NameSpace: String): xmlNsPtr; overload; inline;
    function SearchNs(Node: xmlNodePtr; const NameSpace: xmlCharPtr): xmlNsPtr; overload; inline;
    function SearchNsByHref(Node: xmlNodePtr; const HRef: String): xmlNsPtr; overload; inline;
    function SearchNsByHref(Node: xmlNodePtr; const HRef: xmlCharPtr): xmlNsPtr; overload; inline;

    function ValidNormalizeAttributeValue(Elem: xmlNodePtr; const Name, Value: String): String; overload; inline;
    function ValidNormalizeAttributeValue(Elem: xmlNodePtr; const Name, Value: xmlCharPtr): xmlCharPtr; overload; inline;

    function XIncludeNewContext: xmlXIncludeCtxtPtr; inline;
    function XIncludeProcess: Integer; inline;
    function XIncludeProcessFlags(Flags: Integer): Integer; inline;
    function XIncludeProcessFlagsData(Flags: Integer; Data: Pointer): Integer; inline;

    function XPathNewContext: xmlXPathContextPtr; inline;
    function XPathOrderDocElems: Integer; inline;
    function XPtrNewContext(Here, Origin: xmlNodePtr): xmlXPathContextPtr; inline;

    property RootElement: xmlNodePtr read GetRootElement write SetRootElement;
    property CompressMode: Integer read GetCompressMode write SetCompressMode;
    property DocEntity[AName: String]: xmlEntityPtr read GetDocEntity;
    property DtdEntity[AName: String]: xmlEntityPtr read GetDtdEntity;
    property IntSubset: xmlDtdPtr read GetIntSubset;
    property ID[AName: String]: xmlAttrPtr read GetID;
    property ParameterEntity[AName: String]: xmlEntityPtr read GetParameterEntity;
    property Refs[AID: String]: xmlListPtr read GetRefs;
  end;

  { TxmlNodePtrHelper }

  TxmlNodePtrHelper = type helper for xmlNodePtr
    function AddChild(Cur: xmlNodePtr): xmlNodePtr; inline;
    function AddChildList(Cur: xmlNodePtr): xmlNodePtr; inline;
    function AddNextSibling(Cur: xmlNodePtr): xmlNodePtr; inline;
    function AddPrevSibling(Cur: xmlNodePtr): xmlNodePtr; inline;
    function AddSibling(Cur: xmlNodePtr): xmlNodePtr; inline;
    function ChildElementCount: LongWord; inline;
    function CopyNode(Extended: Integer): xmlNodePtr; inline;
    function CopyNodeList: xmlNodePtr; inline;
    function CopyProp(Cur: xmlAttrPtr): xmlAttrPtr; inline;
    function CopyPropList(Cur: xmlAttrPtr): xmlAttrPtr; inline;
    function FirstElementChild: xmlNodePtr; inline;
    procedure FreeNode; inline;
    procedure FreeNodeList; inline;
    function GetLastChild: xmlNodePtr; inline;
    function GetLineNo: Integer; inline;
    function GetNoNsProp(const Name: String): xmlCharPtr; overload; inline;
    function GetNoNsProp(const Name: xmlCharPtr): xmlCharPtr; overload; inline;
    function GetNodePath: xmlCharPtr; inline;
    function GetNodePathS: String; inline;
    function GetNsProp(const Name, NameSpace: String): String; overload; inline;
    function GetNsProp(const Name, NameSpace: xmlCharPtr): xmlCharPtr; overload; inline;
    function GetProp(const Name: String): String; overload; inline;
    function GetProp(const Name: xmlCharPtr): xmlCharPtr overload; inline;
    function HasNsProp(const Name, NameSpace: String): xmlAttrPtr; overload; inline;
    function HasNsProp(const Name, NameSpace: xmlCharPtr): xmlAttrPtr; overload; inline;
    function HasProp(const Name: String): xmlAttrPtr; overload; inline;
    function HasProp(const Name: xmlCharPtr): xmlAttrPtr; overload; inline;
    function IsBlankNode: Boolean; inline;
    function LastElementChild: xmlNodePtr; inline;
    function NewChild(Ns: xmlNsPtr; const Name, Content: String): xmlNodePtr; overload; inline;
    function NewChild(Ns: xmlNsPtr; const Name, Content: xmlCharPtr): xmlNodePtr; overload; inline;
    function NewNs(const HRef, Prefix: String): xmlNsPtr; overload; inline;
    function NewNs(const HRef, Prefix: xmlCharPtr): xmlNsPtr; overload; inline;
    function NewNsProp(Ns: xmlNsPtr; const Name, Value: String): xmlAttrPtr; overload; inline;
    function NewNsProp(Ns: xmlNsPtr; const Name, Value: xmlCharPtr): xmlAttrPtr; overload; inline;
    function NewNsPropEatName(Ns: xmlNsPtr; const Name, Value: String): xmlAttrPtr; overload; inline;
    function NewNsPropEatName(Ns: xmlNsPtr; const Name, Value: xmlCharPtr): xmlAttrPtr; overload; inline;
    function NewProp(const Name, Value: String): xmlAttrPtr; overload; inline;
    function NewProp(const Name, Value: xmlCharPtr): xmlAttrPtr; overload; inline;
    function NewTextChild(Ns: xmlNsPtr; const Name, Content: String): xmlNodePtr; overload; inline;
    function NewTextChild(Ns: xmlNsPtr; const Name, Content: xmlCharPtr): xmlNodePtr; overload; inline;
    function NextElementSibling: xmlNodePtr; inline;
    procedure NodeAddContent(const Content: String); overload; inline;
    procedure NodeAddContent(const Content: xmlCharPtr); overload; inline;
    procedure NodeAddContentLen(const Content: String; Len: Integer); overload; inline;
    procedure NodeAddContentLen(const Content: xmlCharPtr; Len: Integer); overload; inline;
    function NodeGetContentS: String; inline;
    function NodeGetContent: xmlCharPtr; inline;
    function NodeGetLangS: String; inline;
    function NodeGetLang: xmlCharPtr; inline;
    function NodeGetSpacePreserve: Integer; inline;
    function NodeIsText: Boolean; inline;
    procedure NodeSetBase(const URI: String); overload; inline;
    procedure NodeSetBase(const URI: xmlCharPtr); overload; inline;
    procedure NodeSetContent(const Content: String); overload; inline;
    procedure NodeSetContent(const Content: xmlCharPtr); overload; inline;
    procedure NodeSetContentLen(const Content: String; Len: Integer = 0); overload; inline;
    procedure NodeSetContentLen(const Content: xmlCharPtr; Len: Integer); overload; inline;
    procedure NodeSetLang(const Lang: String); overload; inline;
    procedure NodeSetLang(const Lang: xmlCharPtr); overload; inline;
    procedure NodeSetName(const Name: String); overload; inline;
    procedure NodeSetName(const Name: xmlCharPtr); overload; inline;
    procedure NodeSetSpacePreserve(Value: Integer); inline;
    function PreviousElementSibling: xmlNodePtr; inline;
    function ReplaceNode(Cur: xmlNodePtr): xmlNodePtr; inline;
    procedure SetListDoc(Doc: xmlDocPtr); inline;
    procedure SetNs(Ns: xmlNsPtr); inline;
    function SetNsProp(Ns: xmlNsPtr; const Name, Value: String): xmlAttrPtr; overload; inline;
    function SetNsProp(Ns: xmlNsPtr; const Name, Value: xmlCharPtr): xmlAttrPtr; overload; inline;
    function SetProp(const Name, Value: String): xmlAttrPtr; overload; inline;
    function SetProp(const Name, Value: xmlCharPtr): xmlAttrPtr; overload; inline;
    procedure SetTreeDoc(Doc: xmlDocPtr); inline;
    function TextConcat(const Content: String; Len: Integer = 0): Boolean; overload; inline;
    function TextConcat(const Content: xmlCharPtr; Len: Integer): Boolean; overload; inline;
    function TextMerge(Second: xmlNodePtr): xmlNodePtr; inline;
    procedure UnlinkNode; inline;
    function UnsetNsProp(Ns: xmlNsPtr; const Name: String): Boolean; overload; inline;
    function UnsetNsProp(Ns: xmlNsPtr; const Name: xmlCharPtr): Boolean; overload; inline;
    function UnsetProp(const Name: String): Boolean; overload; inline;
    function UnsetProp(const Name: xmlCharPtr): Boolean; overload; inline;

    function XIncludeProcessTree: Integer; inline;
    function XIncludeProcessTreeFlags(Flags: Integer): Integer; inline;
    function XIncludeProcessTreeFlagsData(Flags: Integer; Data: Pointer): Integer; inline;

    function XPathCastNodeToNumber: Double; inline;
    function XPathCastNodeToString: xmlCharPtr; inline;
    function XPathCastNodeToStringS: String; inline;
    function XPathCmpNodes(Node2: xmlNodePtr): Integer; inline;
    function XPathNodeEval(const Str: String; Ctx: xmlXPathContextPtr): xmlXPathObjectPtr; overload; inline;
    function XPathNodeEval(const Str: xmlCharPtr; Ctx: xmlXPathContextPtr): xmlXPathObjectPtr; overload; inline;
    function XPathNodeSetCreate: xmlNodeSetPtr; inline;
    function XPathSetContextNode(Ctx: xmlXPathContextPtr): Boolean; inline;

    function HasNs(const Prefix: String): Boolean; overload;
    function HasNs(const Prefix: xmlCharPtr): Boolean; overload;
    function FindNs(const Prefix: String): xmlNsPtr; overload;
    function FindNs(const Prefix: xmlCharPtr): xmlNsPtr; overload;

    property NoNsProp[AName: String]: xmlCharPtr read GetNoNsProp;
    property NodePath: xmlCharPtr read GetNodePath;
    property NodePathS: String read GetNodePathS;
    property Prop[AName: String]: String read GetProp;
    property Content: String read NodeGetContentS;
  end;

  { TxmlNsPtrPtrHelper }

  TxmlNsPtrPtrHelper = type helper for xmlNsPtrPtr
    procedure Free; inline;
    function Count: Integer; inline;
  end;

implementation

{ TxmlNodePtrHelper }

function TxmlNodePtrHelper.AddChild(Cur: xmlNodePtr): xmlNodePtr;
begin
  Result := xmlAddChild(Self, Cur);
end;

function TxmlNodePtrHelper.AddChildList(Cur: xmlNodePtr): xmlNodePtr;
begin
  Result := xmlAddChildList(Self, Cur);
end;

function TxmlNodePtrHelper.AddNextSibling(Cur: xmlNodePtr): xmlNodePtr;
begin
  Result := xmlAddNextSibling(Self, Cur);
end;

function TxmlNodePtrHelper.AddPrevSibling(Cur: xmlNodePtr): xmlNodePtr;
begin
  Result := xmlAddPrevSibling(Self, Cur);
end;

function TxmlNodePtrHelper.AddSibling(Cur: xmlNodePtr): xmlNodePtr;
begin
  Result := xmlAddSibling(Self, Cur);
end;

function TxmlNodePtrHelper.ChildElementCount: LongWord;
begin
  Result := xmlChildElementCount(Self);
end;

function TxmlNodePtrHelper.CopyNode(Extended: Integer): xmlNodePtr;
begin
  Result := xmlCopyNode(Self, Extended);
end;

function TxmlNodePtrHelper.CopyNodeList: xmlNodePtr;
begin
  Result := xmlCopyNodeList(Self);
end;

function TxmlNodePtrHelper.CopyProp(Cur: xmlAttrPtr): xmlAttrPtr;
begin
  Result := xmlCopyProp(Self, Cur);
end;

function TxmlNodePtrHelper.CopyPropList(Cur: xmlAttrPtr): xmlAttrPtr;
begin
  Result := xmlCopyPropList(Self, Cur);
end;

function TxmlNodePtrHelper.FirstElementChild: xmlNodePtr;
begin
  Result := xmlFirstElementChild(Self);
end;

procedure TxmlNodePtrHelper.FreeNode;
begin
  xmlFreeNode(Self);
end;

procedure TxmlNodePtrHelper.FreeNodeList;
begin
  xmlFreeNodeList(Self);
end;

function TxmlNodePtrHelper.GetLastChild: xmlNodePtr;
begin
  Result := xmlGetLastChild(Self);
end;

function TxmlNodePtrHelper.GetLineNo: Integer;
begin
  Result := xmlGetLineNo(Self);
end;

function TxmlNodePtrHelper.GetNoNsProp(const Name: String): xmlCharPtr;
begin
  Result := xmlGetNoNsProp(Self, xmlCharPtr(Name));
end;

function TxmlNodePtrHelper.GetNoNsProp(const Name: xmlCharPtr): xmlCharPtr;
begin
  Result := xmlGetNoNsProp(Self, Name);
end;

function TxmlNodePtrHelper.GetNodePath: xmlCharPtr;
begin
  Result := xmlGetNodePath(Self);
end;

function TxmlNodePtrHelper.GetNodePathS: String;
var
  Res: xmlCharPtr;
begin
  Res := xmlGetNodePath(Self);
  if Res <> nil then
  begin
    Result := Res;
    xmlFree(Res);
  end
  else
    Result := '';
end;

function TxmlNodePtrHelper.GetNsProp(const Name, NameSpace: String): String;
var
  Res: xmlCharPtr;
begin
  Res := xmlGetNsProp(Self, xmlCharPtr(Name), xmlCharPtr(NameSpace));
  if Res <> nil then
  begin
    Result := Res;
    xmlFree(Res);
  end
  else
    Result := '';
end;

function TxmlNodePtrHelper.GetNsProp(const Name, NameSpace: xmlCharPtr
  ): xmlCharPtr;
begin
  Result := xmlGetNsProp(Self, Name, NameSpace);
end;

function TxmlNodePtrHelper.GetProp(const Name: String): String;
var
  Res: xmlCharPtr;
begin
  Res := xmlGetProp(Self, xmlCharPtr(Name));
  if Res <> nil then
  begin
    Result := Res;
    xmlFree(Res);
  end
  else
    Result := '';
end;

function TxmlNodePtrHelper.GetProp(const Name: xmlCharPtr): xmlCharPtr;
begin
  Result := xmlGetProp(Self, Name);
end;

function TxmlNodePtrHelper.HasNsProp(const Name, NameSpace: String): xmlAttrPtr;
begin
  Result := xmlHasNsProp(Self, xmlCharPtr(Name), xmlCharPtr(NameSpace));
end;

function TxmlNodePtrHelper.HasNsProp(const Name, NameSpace: xmlCharPtr
  ): xmlAttrPtr;
begin
  Result := xmlHasNsProp(Self, Name, NameSpace);
end;

function TxmlNodePtrHelper.HasProp(const Name: String): xmlAttrPtr;
begin
  Result := xmlHasProp(Self, xmlCharPtr(Name));
end;

function TxmlNodePtrHelper.HasProp(const Name: xmlCharPtr): xmlAttrPtr;
begin
  Result := xmlHasProp(Self, Name);
end;

function TxmlNodePtrHelper.IsBlankNode: Boolean;
begin
  Result := LongBool(xmlIsBlankNode(Self));
end;

function TxmlNodePtrHelper.LastElementChild: xmlNodePtr;
begin
  Result := xmlLastElementChild(Self);
end;

function TxmlNodePtrHelper.NewChild(Ns: xmlNsPtr; const Name, Content: String
  ): xmlNodePtr;
begin
  Result := xmlNewChild(Self, Ns, xmlCharPtr(Name), xmlCharPtr(Content));
end;

function TxmlNodePtrHelper.NewChild(Ns: xmlNsPtr; const Name,
  Content: xmlCharPtr): xmlNodePtr;
begin
  Result := xmlNewChild(Self, Ns, Name, Content);
end;

function TxmlNodePtrHelper.NewNs(const HRef, Prefix: String): xmlNsPtr;
begin
  Result := xmlNewNs(Self, xmlCharPtr(HRef), xmlCharPtr(Prefix));
end;

function TxmlNodePtrHelper.NewNs(const HRef, Prefix: xmlCharPtr): xmlNsPtr;
begin
  Result := xmlNewNs(Self, HRef, Prefix);
end;

function TxmlNodePtrHelper.NewNsProp(Ns: xmlNsPtr; const Name, Value: String
  ): xmlAttrPtr;
begin
  Result := xmlNewNsProp(Self, Ns, xmlCharPtr(Name), xmlCharPtr(Value));
end;

function TxmlNodePtrHelper.NewNsProp(Ns: xmlNsPtr; const Name, Value: xmlCharPtr
  ): xmlAttrPtr;
begin
  Result := xmlNewNsProp(Self, Ns, Name, Value);
end;

function TxmlNodePtrHelper.NewNsPropEatName(Ns: xmlNsPtr; const Name,
  Value: String): xmlAttrPtr;
begin
  Result := xmlNewNsPropEatName(Self, Ns, xmlCharPtr(Name), xmlCharPtr(Value));
end;

function TxmlNodePtrHelper.NewNsPropEatName(Ns: xmlNsPtr; const Name,
  Value: xmlCharPtr): xmlAttrPtr;
begin
  Result := xmlNewNsPropEatName(Self, Ns, Name, Value);
end;

function TxmlNodePtrHelper.NewProp(const Name, Value: String): xmlAttrPtr;
begin
  Result := xmlNewProp(Self, xmlCharPtr(Name), xmlCharPtr(Value));
end;

function TxmlNodePtrHelper.NewProp(const Name, Value: xmlCharPtr): xmlAttrPtr;
begin
  Result := xmlNewProp(Self, Name, Value);
end;

function TxmlNodePtrHelper.NewTextChild(Ns: xmlNsPtr; const Name,
  Content: String): xmlNodePtr;
begin
  Result := xmlNewTextChild(Self, Ns, xmlCharPtr(Name), xmlCharPtr(Content));
end;

function TxmlNodePtrHelper.NewTextChild(Ns: xmlNsPtr; const Name,
  Content: xmlCharPtr): xmlNodePtr;
begin
  Result := xmlNewTextChild(Self, Ns, Name, Content);
end;

function TxmlNodePtrHelper.NextElementSibling: xmlNodePtr;
begin
  Result := xmlNextElementSibling(Self);
end;

procedure TxmlNodePtrHelper.NodeAddContent(const Content: String);
begin
  xmlNodeAddContent(Self, xmlCharPtr(Content));
end;

procedure TxmlNodePtrHelper.NodeAddContent(const Content: xmlCharPtr);
begin
  xmlNodeAddContent(Self, Content);
end;

procedure TxmlNodePtrHelper.NodeAddContentLen(const Content: String;
  Len: Integer);
begin
  xmlNodeAddContentLen(Self, xmlCharPtr(Content),
    specialize IfThen<Integer>(Len > 0, Len, Length(Content)));
end;

procedure TxmlNodePtrHelper.NodeAddContentLen(const Content: xmlCharPtr;
  Len: Integer);
begin
  xmlNodeAddContentLen(Self, Content, Len);
end;

function TxmlNodePtrHelper.NodeGetContentS: String;
var
  Res: xmlCharPtr;
begin
  Res := xmlNodeGetContent(Self);
  if Res <> nil then
  begin
    Result := Res;
    xmlFree(Res);
  end
  else
    Result := '';
end;

function TxmlNodePtrHelper.NodeGetContent: xmlCharPtr;
begin
  Result := xmlNodeGetContent(Self);
end;

function TxmlNodePtrHelper.NodeGetLangS: String;
var
  Res: xmlCharPtr;
begin
  Res := xmlNodeGetLang(Self);
  if Res <> nil then
  begin
    Result := Res;
    xmlFree(Res);
  end
  else
    Result := '';
end;

function TxmlNodePtrHelper.NodeGetLang: xmlCharPtr;
begin
  Result := xmlNodeGetLang(Self);
end;

function TxmlNodePtrHelper.NodeGetSpacePreserve: Integer;
begin
  Result := xmlNodeGetSpacePreserve(Self);
end;

function TxmlNodePtrHelper.NodeIsText: Boolean;
begin
  Result := LongBool(xmlNodeIsText(Self));
end;

procedure TxmlNodePtrHelper.NodeSetBase(const URI: String);
begin
  xmlNodeSetBase(Self, xmlCharPtr(URI));
end;

procedure TxmlNodePtrHelper.NodeSetBase(const URI: xmlCharPtr);
begin
  xmlNodeSetBase(Self, URI);
end;

procedure TxmlNodePtrHelper.NodeSetContent(const Content: String);
begin
  xmlNodeSetContent(Self, xmlCharPtr(Content));
end;

procedure TxmlNodePtrHelper.NodeSetContent(const Content: xmlCharPtr);
begin
  xmlNodeSetContent(Self, Content);
end;

procedure TxmlNodePtrHelper.NodeSetContentLen(const Content: String;
  Len: Integer);
begin
  xmlNodeSetContentLen(Self, xmlCharPtr(Content),
    specialize IfThen<Integer>(Len > 0, Len, Length(Content)));
end;

procedure TxmlNodePtrHelper.NodeSetContentLen(const Content: xmlCharPtr;
  Len: Integer);
begin
  xmlNodeSetContentLen(Self, Content, Len);
end;

procedure TxmlNodePtrHelper.NodeSetLang(const Lang: String);
begin
  xmlNodeSetLang(Self, xmlCharPtr(Lang));
end;

procedure TxmlNodePtrHelper.NodeSetLang(const Lang: xmlCharPtr);
begin
  xmlNodeSetLang(Self, Lang);
end;

procedure TxmlNodePtrHelper.NodeSetName(const Name: String);
begin
  xmlNodeSetName(Self, xmlCharPtr(Name));
end;

procedure TxmlNodePtrHelper.NodeSetName(const Name: xmlCharPtr);
begin
  xmlNodeSetName(Self, Name);
end;

procedure TxmlNodePtrHelper.NodeSetSpacePreserve(Value: Integer);
begin
  xmlNodeSetSpacePreserve(Self, Value);
end;

function TxmlNodePtrHelper.PreviousElementSibling: xmlNodePtr;
begin
  Result := xmlPreviousElementSibling(Self);
end;

function TxmlNodePtrHelper.ReplaceNode(Cur: xmlNodePtr): xmlNodePtr;
begin
  Result := xmlReplaceNode(Self, Cur);
end;

procedure TxmlNodePtrHelper.SetListDoc(Doc: xmlDocPtr);
begin
  xmlSetListDoc(Self, Doc);
end;

procedure TxmlNodePtrHelper.SetNs(Ns: xmlNsPtr);
begin
  xmlSetNs(Self, Ns);
end;

function TxmlNodePtrHelper.SetNsProp(Ns: xmlNsPtr; const Name, Value: String
  ): xmlAttrPtr;
begin
  Result := xmlSetNsProp(Self, Ns, xmlCharPtr(Name), xmlCharPtr(Value));
end;

function TxmlNodePtrHelper.SetNsProp(Ns: xmlNsPtr; const Name, Value: xmlCharPtr
  ): xmlAttrPtr;
begin
  Result := xmlSetNsProp(Self, Ns, Name, Value);
end;

function TxmlNodePtrHelper.SetProp(const Name, Value: String): xmlAttrPtr;
begin
  Result := xmlSetProp(Self, xmlCharPtr(Name), xmlCharPtr(Value));
end;

function TxmlNodePtrHelper.SetProp(const Name, Value: xmlCharPtr): xmlAttrPtr;
begin
  Result := xmlSetProp(Self, Name, Value);
end;

procedure TxmlNodePtrHelper.SetTreeDoc(Doc: xmlDocPtr);
begin
  xmlSetTreeDoc(Self, Doc);
end;

function TxmlNodePtrHelper.TextConcat(const Content: String; Len: Integer
  ): Boolean;
begin
  Result := xmlTextConcat(Self, xmlCharPtr(Content),
    specialize IfThen<Integer>(Len > 0, Len, Length(Content))) = 0;
end;

function TxmlNodePtrHelper.TextConcat(const Content: xmlCharPtr; Len: Integer
  ): Boolean;
begin
  Result := xmlTextConcat(Self, Content, Len) = 0;
end;

function TxmlNodePtrHelper.TextMerge(Second: xmlNodePtr): xmlNodePtr;
begin
  Result := xmlTextMerge(Self, Second);
end;

procedure TxmlNodePtrHelper.UnlinkNode;
begin
  xmlUnlinkNode(Self);
end;

function TxmlNodePtrHelper.UnsetNsProp(Ns: xmlNsPtr; const Name: String
  ): Boolean;
begin
  Result := xmlUnsetNsProp(Self, Ns, xmlCharPtr(Name)) = 0;
end;

function TxmlNodePtrHelper.UnsetNsProp(Ns: xmlNsPtr; const Name: xmlCharPtr
  ): Boolean;
begin
  Result := xmlUnsetNsProp(Self, Ns, Name) = 0;
end;

function TxmlNodePtrHelper.UnsetProp(const Name: String): Boolean;
begin
  Result := xmlUnsetProp(Self, xmlCharPtr(Name)) = 0;
end;

function TxmlNodePtrHelper.UnsetProp(const Name: xmlCharPtr): Boolean;
begin
  Result := xmlUnsetProp(Self, Name) = 0;
end;

function TxmlNodePtrHelper.XIncludeProcessTree: Integer;
begin
  Result := xmlXIncludeProcessTree(Self);
end;

function TxmlNodePtrHelper.XIncludeProcessTreeFlags(Flags: Integer): Integer;
begin
  Result := xmlXIncludeProcessTreeFlags(Self, Flags);
end;

function TxmlNodePtrHelper.XIncludeProcessTreeFlagsData(Flags: Integer;
  Data: Pointer): Integer;
begin
  Result := xmlXIncludeProcessTreeFlagsData(Self, Flags, Data);
end;

function TxmlNodePtrHelper.XPathCastNodeToNumber: Double;
begin
  Result := xmlXPathCastNodeToNumber(Self);
end;

function TxmlNodePtrHelper.XPathCastNodeToString: xmlCharPtr;
begin
  Result := xmlXPathCastNodeToString(Self);
end;

function TxmlNodePtrHelper.XPathCastNodeToStringS: String;
var
  Res: xmlCharPtr;
begin
  Res := xmlXPathCastNodeToString(Self);
  if Res <> nil then
  begin
    Result := Res;
    xmlFree(Res);
  end
  else
    Result := '';
end;

function TxmlNodePtrHelper.XPathCmpNodes(Node2: xmlNodePtr): Integer;
begin
  Result := xmlXPathCmpNodes(Self, Node2);
end;

function TxmlNodePtrHelper.XPathNodeEval(const Str: String;
  Ctx: xmlXPathContextPtr): xmlXPathObjectPtr;
begin
  Result := xmlXPathNodeEval(Self, xmlCharPtr(Str), Ctx);
end;

function TxmlNodePtrHelper.XPathNodeEval(const Str: xmlCharPtr;
  Ctx: xmlXPathContextPtr): xmlXPathObjectPtr;
begin
  Result := xmlXPathNodeEval(Self, Str, Ctx);
end;

function TxmlNodePtrHelper.XPathNodeSetCreate: xmlNodeSetPtr;
begin
  Result := xmlXPathNodeSetCreate(Self);
end;

function TxmlNodePtrHelper.XPathSetContextNode(Ctx: xmlXPathContextPtr
  ): Boolean;
begin
  Result := xmlXPathSetContextNode(Self, Ctx) = 0;
end;

function TxmlNodePtrHelper.HasNs(const Prefix: String): Boolean;
begin
  Result := FindNs(Prefix) <> nil;
end;

function TxmlNodePtrHelper.HasNs(const Prefix: xmlCharPtr): Boolean;
begin
  Result := FindNs(Prefix) <> nil;
end;

function TxmlNodePtrHelper.FindNs(const Prefix: String): xmlNsPtr;
begin
  Result := FindNs(xmlCharPtr(Prefix));
end;

function TxmlNodePtrHelper.FindNs(const Prefix: xmlCharPtr): xmlNsPtr;
var
  CurentNs: xmlNsPtr;
begin
  CurentNs := Self^.ns;
  while CurentNs <> nil do
  begin
    if (((Prefix = nil) or (Prefix = '')) and ((CurentNs^.prefix = nil) or (CurentNs^.prefix = '')))
      or (xmlStrcmp(Prefix, CurentNs^.prefix) = 0) then
      Exit(CurentNs);
    CurentNs := CurentNs^.next;
  end;
  Result := nil;
end;

{ TxmlNsPtrPtrHelper }

procedure TxmlNsPtrPtrHelper.Free;
begin
  xmlFree(Self);
end;

function TxmlNsPtrPtrHelper.Count: Integer;
begin
  Result := 0;
  while Self[Result] <> nil do
    Inc(Result);
end;

{ TxmlCharHelper }

procedure TxmlCharHelper.Free;
begin
  xmlFree(Self);
end;

function TxmlCharHelper.CharStrdup: xmlCharPtr;
begin
  Result := xmlCharStrdup(Self);
end;

function TxmlCharHelper.CharStrndup(Len: Integer): xmlCharPtr;
begin
  Result := xmlCharStrndup(Self, Len);
end;

function TxmlCharHelper.CheckUTF8: Boolean;
begin
   Result := xmlCheckUTF8(Self) <> 0;
end;

function TxmlCharHelper.GetUTF8Char(var Len: Integer): Integer;
begin
  Result := xmlGetUTF8Char(Self, Len);
end;

function TxmlCharHelper.StrEqual(const Str2: String): Boolean;
begin
  Result := xmlStrEqual(Self, xmlCharPtr(Str2)) <> 0;
end;

function TxmlCharHelper.StrEqual(const Str2: xmlCharPtr): Boolean;
begin
  Result := xmlStrEqual(Self, Str2) <> 0;
end;

function TxmlCharHelper.Strcasecmp(const Str2: String): Integer;
begin
  Result := xmlStrcasecmp(Self, xmlCharPtr(Str2));
end;

function TxmlCharHelper.Strcasecmp(const Str2: xmlCharPtr): Integer;
begin
  Result := xmlStrcasecmp(Self, Str2);
end;

function TxmlCharHelper.Strcasestr(const Str2: xmlCharPtr): xmlCharPtr;
begin
  Result := xmlStrcasestr(Self, xmlCharPtr(Str2));
end;

function TxmlCharHelper.Strcat(const Add: String): xmlCharPtr;
begin
  Result := xmlStrcat(Self, xmlCharPtr(Add));
end;

function TxmlCharHelper.Strcat(const Add: xmlCharPtr): xmlCharPtr;
begin
  Result := xmlStrcat(Self, Add);
end;

function TxmlCharHelper.Strchr(Value: xmlChar): xmlCharPtr;
begin
  Result := xmlStrchr(Self, Value);
end;

function TxmlCharHelper.Strcmp(const Str2: String): Integer;
begin
  Result := xmlStrcmp(Self, xmlCharPtr(Str2));
end;

function TxmlCharHelper.Strcmp(const Str2: xmlCharPtr): Integer;
begin
  Result := xmlStrcmp(Self, Str2);
end;

function TxmlCharHelper.Strdup: xmlCharPtr;
begin
  Result := xmlStrdup(Self);
end;

function TxmlCharHelper.Strlen: Integer;
begin
  Result := xmlStrlen(Self);
end;

function TxmlCharHelper.Strncasecmp(const Str2: String; Len: Integer): Integer;
begin
  Result := xmlStrncasecmp(Self, xmlCharPtr(Str2), Len);
end;

function TxmlCharHelper.Strncasecmp(const Str2: xmlCharPtr; Len: Integer
  ): Integer;
begin
  Result := xmlStrncasecmp(Self, Str2, Len);
end;

function TxmlCharHelper.Strncat(const Str2: String; Len: Integer): xmlCharPtr;
begin
  Result := xmlStrncat(Self, xmlCharPtr(Str2), Len);
end;

function TxmlCharHelper.Strncat(const Str2: xmlCharPtr; Len: Integer
  ): xmlCharPtr;
begin
  Result := xmlStrncat(Self, Str2, Len);
end;

function TxmlCharHelper.StrncatNew(const Str2: String; Len: Integer
  ): xmlCharPtr;
begin
  Result := xmlStrncatNew(Self, xmlCharPtr(Str2), Len);
end;

function TxmlCharHelper.StrncatNew(const Str2: xmlCharPtr; Len: Integer
  ): xmlCharPtr;
begin
  Result := xmlStrncatNew(Self, Str2, Len);
end;

function TxmlCharHelper.Strndup(Len: Integer): xmlCharPtr;
begin
  Result := xmlStrndup(Self, Len);
end;

function TxmlCharHelper.Strstr(Value: String): xmlCharPtr;
begin
  Result := xmlStrstr(Self, xmlCharPtr(Value));
end;

function TxmlCharHelper.Strstr(Value: xmlCharPtr): xmlCharPtr;
begin
  Result := xmlStrstr(Self, Value);
end;

function TxmlCharHelper.Strsub(Start, Len: Integer): xmlCharPtr;
begin
  Result := xmlStrsub(Self, Start, Len);
end;

function TxmlCharHelper.UTF8Charcmp(const Str2: String): Integer;
begin
  Result := xmlUTF8Charcmp(Self, xmlCharPtr(Str2));
end;

function TxmlCharHelper.UTF8Charcmp(const Str2: xmlCharPtr): Integer;
begin
  Result := xmlUTF8Charcmp(Self, xmlCharPtr(Str2));
end;

function TxmlCharHelper.UTF8Size: Integer;
begin
  Result := xmlUTF8Size(Self);
end;

function TxmlCharHelper.UTF8Strlen: Integer;
begin
  Result := xmlUTF8Strlen(Self);
end;

function TxmlCharHelper.UTF8Strloc(UTFChar: String): Integer;
begin
  Result := xmlUTF8Strloc(Self, xmlCharPtr(UTFChar));
end;

function TxmlCharHelper.UTF8Strloc(UTFChar: xmlCharPtr): Integer;
begin
  Result := xmlUTF8Strloc(Self, UTFChar);
end;

function TxmlCharHelper.UTF8Strndup(Len: Integer): xmlCharPtr;
begin
  Result := xmlUTF8Strndup(Self, Len);
end;

function TxmlCharHelper.UTF8Strpos(Pos: Integer): xmlCharPtr;
begin
  Result := xmlUTF8Strpos(Self, Pos);
end;

function TxmlCharHelper.UTF8Strsize(Len: Integer): Integer;
begin
  Result := xmlUTF8Strsize(Self, Len);
end;

function TxmlCharHelper.UTF8Strsub(Start, Len: Integer): xmlCharPtr;
begin
  Result := xmlUTF8Strsub(Self, Start, Len);
end;

{ TxmlDocHelper }

class function TxmlDocHelper.ParseFile(AFileName: String): xmlDocPtr;
begin
  Result := xmlParseFile(PChar(AFileName));
end;

class function TxmlDocHelper.ParseFile(AFileName: PChar): xmlDocPtr;
begin
  Result := xmlParseFile(AFileName);
end;

class function TxmlDocHelper.ParseDoc(AContent: String): xmlDocPtr;
begin
  Result := xmlParseDoc(PChar(AContent));
end;

class function TxmlDocHelper.ParseDoc(AContent: PChar): xmlDocPtr;
begin
  Result := xmlParseDoc(AContent);
end;

class function TxmlDocHelper.ParseMemory(AData: PChar; Len: Integer): xmlDocPtr;
begin
  Result := xmlParseMemory(AData, Len);
end;

class function TxmlDocHelper.RecoverFile(AFileName: String): xmlDocPtr;
begin
  Result := xmlRecoverFile(PChar(AFileName));
end;

class function TxmlDocHelper.RecoverDoc(AContent: String): xmlDocPtr;
begin
  Result := xmlRecoverDoc(PChar(AContent));
end;

class function TxmlDocHelper.RecoverDoc(AContent: PChar): xmlDocPtr;
begin
  Result := xmlRecoverDoc(AContent);
end;

class function TxmlDocHelper.RecoverMemory(AData: PChar; Len: Integer
  ): xmlDocPtr;
begin
  Result := xmlRecoverMemory(AData, Len);
end;

class function TxmlDocHelper.ReadFile(AFileName, Encoding: String;
  Options: Integer): xmlDocPtr;
begin
  Result := xmlReadFile(PChar(AFileName), PChar(Encoding), Options);
end;

class function TxmlDocHelper.ReadDoc(AContent, URL, Encoding: String;
  Options: Integer): xmlDocPtr;
begin
  Result := xmlReadDoc(PChar(AContent), PChar(URL), PChar(Encoding), Options);
end;

class function TxmlDocHelper.ReadDoc(AContent, URL, Encoding: PChar;
  Options: Integer): xmlDocPtr;
begin
  Result := xmlReadDoc(AContent, URL, Encoding, Options);
end;

class function TxmlDocHelper.ReadMemory(AData: PChar; Len: Integer; URL,
  Encoding: String; Options: Integer): xmlDocPtr;
begin
  Result := xmlReadMemory(AData, Len, PChar(URL), PChar(Encoding), Options);
end;

class function TxmlDocHelper.NewDoc(AVersion: String): xmlDocPtr;
begin
  Result := xmlNewDoc(PChar(AVersion));
end;

procedure TxmlDocHelper.Free;
begin
  xmlFreeDoc(Self);
end;

procedure TxmlDocHelper.FreeAndNil;
begin
  xmlFreeDoc(Self);
  Self := nil;
end;

function TxmlDocHelper.GetRootElement: xmlNodePtr;
begin
  Result := xmlDocGetRootElement(Self);
end;

procedure TxmlDocHelper.SetRootElement(ARoot: xmlNodePtr);
begin
  xmlDocSetRootElement(Self, ARoot);
end;

function TxmlDocHelper.GetCompressMode: Integer;
begin
  Result := xmlGetDocCompressMode(Self);
end;

procedure TxmlDocHelper.SetCompressMode(AValue: Integer);
begin
  xmlSetDocCompressMode(Self, AValue);
end;

function TxmlDocHelper.GetDocEntity(AName: String): xmlEntityPtr;
begin
  Result := xmlGetDocEntity(Self, PChar(AName));
end;

function TxmlDocHelper.GetDtdEntity(AName: String): xmlEntityPtr;
begin
  Result := xmlGetDtdEntity(Self, PChar(AName));
end;

function TxmlDocHelper.GetIntSubset: xmlDtdPtr;
begin
  Result := xmlGetIntSubset(Self);
end;

function TxmlDocHelper.GetNsList(Node: xmlNodePtr): xmlNsPtrPtr;
begin
  Result := xmlGetNsList(Self, Node);
end;

function TxmlDocHelper.AddDocEntity(const Name: String; &Type: Integer;
  const ExternalID, SystemID, Content: String): xmlEntityPtr;
begin
  Result := xmlAddDocEntity(Self, xmlCharPtr(Name), &Type, xmlCharPtr(ExternalID),
    xmlCharPtr(SystemID), xmlCharPtr(Content));
end;

function TxmlDocHelper.AddDocEntity(const Name: xmlCharPtr; &Type: Integer;
  const ExternalID, SystemID, Content: xmlCharPtr): xmlEntityPtr;
begin
  Result := xmlAddDocEntity(Self, Name, &Type, ExternalID, SystemID, Content);
end;

function TxmlDocHelper.AddDtdEntity(const Name: String; &Type: Integer;
  const ExternalID, SystemID, Content: String): xmlEntityPtr;
begin
  Result := xmlAddDocEntity(Self, xmlCharPtr(Name), &Type, xmlCharPtr(ExternalID),
    xmlCharPtr(SystemID), xmlCharPtr(Content));
end;

function TxmlDocHelper.AddDtdEntity(const Name: xmlCharPtr; &Type: Integer;
  const ExternalID, SystemID, Content: xmlCharPtr): xmlEntityPtr;
begin
  Result := xmlAddDocEntity(Self, Name, &Type, ExternalID, SystemID, Content);
end;

function TxmlDocHelper.C14NDocDumpMemory(Nodes: xmlNodeSetPtr; Mode: xmlC14NMode;
  InclusiveNsPrefixes: array of String; WithComments: Boolean; out
  DocTxtPtr: String): Integer;
var
  NsPrefs: xmlCharPtrPtr;
  Res: xmlCharPtr;
  I: Integer;
begin
  Res := nil;
  if Length(InclusiveNsPrefixes) > 0 then
  begin
    NsPrefs := GetMem((Length(InclusiveNsPrefixes) + 1) * SizeOf(xmlCharPtr));
    for I := 0 to Length(InclusiveNsPrefixes) - 1 do
      NsPrefs[I] := PChar(InclusiveNsPrefixes[I]);
    NsPrefs[Length(InclusiveNsPrefixes)] := nil;
  end
  else
    NsPrefs := nil;
  Result := xmlC14NDocDumpMemory(Self, Nodes, Integer(Mode), NsPrefs, Integer(WithComments), Res);
  if Res <> nil then
  begin
    DocTxtPtr := Res;
    xmlFree(Res);
  end
  else
    DocTxtPtr := '';
  if NsPrefs <> nil then
    Freemem(NsPrefs);
end;

function TxmlDocHelper.C14NDocDumpMemory(Nodes: xmlNodeSetPtr; Mode: xmlC14NMode;
  InclusiveNsPrefixes: xmlCharPtrPtr; WithComments: Boolean;
  var DocTxtPtr: xmlCharPtr): Integer;
begin
  Result := xmlC14NDocDumpMemory(Self, Nodes, Integer(Mode), InclusiveNsPrefixes, Integer(WithComments), DocTxtPtr);
end;

function TxmlDocHelper.C14NDocSave(Nodes: xmlNodeSetPtr; Mode: xmlC14NMode;
  InclusiveNsPrefixes: array of String; WithComments: Boolean;
  const FileName: String; Compression: Integer): Integer;
var
  NsPrefs: xmlCharPtrPtr;
  I: Integer;
begin
  if Length(InclusiveNsPrefixes) > 0 then
  begin
    NsPrefs := GetMem((Length(InclusiveNsPrefixes) + 1) * SizeOf(xmlCharPtr));
    for I := 0 to Length(InclusiveNsPrefixes) - 1 do
      NsPrefs[I] := PChar(InclusiveNsPrefixes[I]);
    NsPrefs[Length(InclusiveNsPrefixes)] := nil;
  end
  else
    NsPrefs := nil;
  Result := xmlC14NDocSave(Self, Nodes, Integer(Mode), NsPrefs, Integer(WithComments), PChar(FileName), Compression);
  if NsPrefs <> nil then
    Freemem(NsPrefs);
end;

function TxmlDocHelper.C14NDocSave(Nodes: xmlNodeSetPtr; Mode: xmlC14NMode;
  InclusiveNsPrefixes: xmlCharPtrPtr; WithComments: Boolean;
  const FileName: xmlCharPtr; Compression: Integer): Integer;
begin
  Result := xmlC14NDocSave(Self, Nodes, Integer(Mode), InclusiveNsPrefixes, Integer(WithComments), PChar(FileName), Compression);
end;

function TxmlDocHelper.C14NExecute(IsVisibleCallback: xmlC14NIsVisibleCallback;
  UserData: Pointer; Mode: xmlC14NMode; InclusiveNsPrefixes: array of String;
  WithComments: Boolean; Buf: xmlOutputBufferPtr): Integer;
var
  NsPrefs: xmlCharPtrPtr;
  I: Integer;
begin
  if Length(InclusiveNsPrefixes) > 0 then
  begin
    NsPrefs := GetMem((Length(InclusiveNsPrefixes) + 1) * SizeOf(xmlCharPtr));
    for I := 0 to Length(InclusiveNsPrefixes) - 1 do
      NsPrefs[I] := PChar(InclusiveNsPrefixes[I]);
    NsPrefs[Length(InclusiveNsPrefixes)] := nil;
  end
  else
    NsPrefs := nil;
  Result := xmlC14NExecute(Self, IsVisibleCallback, UserData, Integer(Mode), NsPrefs, Integer(WithComments), Buf);
  if NsPrefs <> nil then
    Freemem(NsPrefs);
end;

function TxmlDocHelper.C14NExecute(IsVisibleCallback: xmlC14NIsVisibleCallback;
  UserData: Pointer; Mode: xmlC14NMode; InclusiveNsPrefixes: xmlCharPtrPtr; WithComments: Boolean;
  Buf: xmlOutputBufferPtr): Integer;
begin
  Result := xmlC14NExecute(Self, IsVisibleCallback, UserData, Integer(Mode), InclusiveNsPrefixes, Integer(WithComments), Buf);
end;

function TxmlDocHelper.CopyDoc(Recursive: Boolean): xmlDocPtr;
begin
  Result := xmlCopyDoc(Self, Integer(Recursive));
end;

function TxmlDocHelper.CopyDocElementContent(Cur: xmlElementContentPtr
  ): xmlElementContentPtr;
begin
  Result := xmlCopyDocElementContent(Self, Cur);
end;

function TxmlDocHelper.CreateIntSubset(const Name, ExternalID, SystemID: String
  ): xmlDtdPtr;
begin
  Result := xmlCreateIntSubset(Self, PChar(Name), PChar(ExternalID), PChar(SystemID));
end;

function TxmlDocHelper.CreateIntSubset(const Name, ExternalID,
  SystemID: xmlCharPtr): xmlDtdPtr;
begin
  Result := xmlCreateIntSubset(Self, Name, ExternalID, SystemID);
end;

function TxmlDocHelper.DocCopyNodeList(Node: xmlNodePtr): xmlNodePtr;
begin
  Result := xmlDocCopyNodeList(Self, Node);
end;

procedure TxmlDocHelper.DocDumpFormatMemory(out Mem: String; Format: Integer);
var
  Res: xmlCharPtr;
  Len: Integer;
begin
  Res := nil;
  xmlDocDumpFormatMemory(Self, Res, Len, Format);
  if Res <> nil then
  begin
    SetLength(Mem, Len);
    Move(Res^, Mem[1], Len);
    xmlFree(Res);
  end
  else
    Mem := '';
end;

procedure TxmlDocHelper.DocDumpFormatMemory(var Mem: xmlCharPtr;
  var Size: Integer; Format: Integer);
begin
  xmlDocDumpFormatMemory(Self, Mem, Size, Format);
end;

procedure TxmlDocHelper.DocDumpFormatMemoryEnc(out Mem: String;
  const Encoding: String; Format: Integer);
var
  Res: xmlCharPtr;
  Len: Integer;
begin
  Res := nil;
  xmlDocDumpFormatMemoryEnc(Self, Res, Len, PChar(Encoding), Format);
  if Res <> nil then
  begin
    SetLength(Mem, Len);
    Move(Res^, Mem[1], Len);
    xmlFree(Res);
  end
  else
    Mem := '';
end;

procedure TxmlDocHelper.DocDumpFormatMemoryEnc(var Mem: xmlCharPtr;
  var Size: Integer; const Encoding: PChar; Format: Integer);
begin
  xmlDocDumpFormatMemoryEnc(Self, Mem, Size, Encoding, Format);
end;

procedure TxmlDocHelper.DocDumpMemory(out Mem: String);
var
  Res: xmlCharPtr;
  Len: Integer;
begin
  Res := nil;
  xmlDocDumpMemory(Self, Res, Len);
  if Res <> nil then
  begin
    SetLength(Mem, Len);
    Move(Res^, Mem[1], Len);
    xmlFree(Res);
  end
  else
    Mem := '';
end;

procedure TxmlDocHelper.DocDumpMemory(out Mem: xmlCharPtr; var Size: Integer);
begin
  xmlDocDumpMemory(Self, Mem, Size);
end;

procedure TxmlDocHelper.DocDumpMemoryEnc(out Mem: String; const Encoding: String
  );
var
  Res: xmlCharPtr;
  Len: Integer;
begin
  Res := nil;
  xmlDocDumpMemoryEnc(Self, Res, Len, PChar(Encoding));
  if Res <> nil then
  begin
    SetLength(Mem, Len);
    Move(Res^, Mem[1], Len);
    xmlFree(Res);
  end
  else
    Mem := '';
end;

procedure TxmlDocHelper.DocDumpMemoryEnc(var Mem: xmlCharPtr;
  var Size: Integer; const Encoding: PChar);
begin
  xmlDocDumpMemoryEnc(Self, Mem, Size, Encoding);
end;

function TxmlDocHelper.EncodeEntitiesReentrant(Input: String): String;
var
  Res: xmlCharPtr;
begin
  Res := xmlEncodeEntitiesReentrant(Self, PChar(Input));
  if Res <> nil then
  begin
    Result := Res;
    xmlFree(Res);
  end
  else
    Result := '';
end;

function TxmlDocHelper.EncodeEntitiesReentrant(Input: xmlCharPtr): xmlCharPtr;
begin
  Result := xmlEncodeEntitiesReentrant(Self, Input);
end;

function TxmlDocHelper.EncodeSpecialChars(AInput: String): String;
var
  Res: xmlCharPtr;
begin
  Res := xmlEncodeSpecialChars(Self, PChar(AInput));
  if Res <> nil then
  begin
    Result := Res;
    xmlFree(Res);
  end
  else
    Result := '';
end;

function TxmlDocHelper.EncodeSpecialChars(AInput: xmlCharPtr): xmlCharPtr;
begin
  Result := xmlEncodeSpecialChars(Self, AInput);
end;

procedure TxmlDocHelper.FreeDoc;
begin
  xmlFreeDoc(Self);
end;

procedure TxmlDocHelper.FreeDocElementContent(Element: xmlElementContentPtr);
begin
  xmlFreeDocElementContent(Self, Element);
end;

function TxmlDocHelper.GetID(const ID: String): xmlAttrPtr;
begin
  Result := xmlGetID(Self, xmlCharPtr(ID));
end;

function TxmlDocHelper.GetID(const ID: xmlCharPtr): xmlAttrPtr;
begin
  Result := xmlGetID(Self, ID);
end;

function TxmlDocHelper.GetParameterEntity(const Name: String): xmlEntityPtr;
begin
  Result := xmlGetParameterEntity(Self, xmlCharPtr(Name));
end;

function TxmlDocHelper.GetParameterEntity(const Name: xmlCharPtr): xmlEntityPtr;
begin
  Result := xmlGetParameterEntity(Self, Name);
end;

function TxmlDocHelper.GetRefs(const ID: String): xmlListPtr;
begin
  Result := xmlGetRefs(Self, PChar(ID));
end;

function TxmlDocHelper.GetRefs(const ID: xmlCharPtr): xmlListPtr;
begin
  Result := xmlGetRefs(Self, ID);
end;

function TxmlDocHelper.IsID(Elem: xmlNodePtr; Attr: xmlAttrPtr): Boolean;
begin
  Result := LongBool(xmlIsID(Self, Elem, Attr));
end;

function TxmlDocHelper.IsMixedElement(Name: String): Boolean;
begin
  Result := LongBool(xmlIsMixedElement(Self, xmlCharPtr(Name)));
end;

function TxmlDocHelper.IsMixedElement(Name: xmlCharPtr): Boolean;
begin
  Result := LongBool(xmlIsMixedElement(Self, Name));
end;

function TxmlDocHelper.IsRef(Elem: xmlNodePtr; Attr: xmlAttrPtr): Boolean;
begin
  Result := LongBool(xmlIsRef(Self, Elem, Attr));
end;

function TxmlDocHelper.NewCDataBlock(const Content: RawByteString): xmlNodePtr;
begin
  Result := xmlNewCDataBlock(Self, PChar(Content), Length(Content));
end;

function TxmlDocHelper.NewCDataBlock(const Content: xmlCharPtr; Len: Integer
  ): xmlNodePtr;
begin
  Result := xmlNewCDataBlock(Self, Content, Len);
end;

function TxmlDocHelper.NewCharRef(const Name: String): xmlNodePtr;
begin
  Result := xmlNewCharRef(Self, xmlCharPtr(Name));
end;

function TxmlDocHelper.NewCharRef(const Name: xmlCharPtr): xmlNodePtr;
begin
  Result := xmlNewCharRef(Self, Name);
end;

function TxmlDocHelper.NewDocComment(Content: String): xmlNodePtr;
begin
  Result := xmlNewDocComment(Self, PChar(Content));
end;

function TxmlDocHelper.NewDocComment(Content: PChar): xmlNodePtr;
begin
  Result := xmlNewDocComment(Self, Content);
end;

function TxmlDocHelper.NewDocElementContent(const Name: String;
  &Type: xmlElementContentType): xmlElementContentPtr;
begin
  Result := xmlNewDocElementContent(Self, xmlCharPtr(Name), &Type);
end;

function TxmlDocHelper.NewDocElementContent(const Name: xmlCharPtr;
  &Type: xmlElementContentType): xmlElementContentPtr;
begin
  Result := xmlNewDocElementContent(Self, Name, &Type);
end;

function TxmlDocHelper.NewDocFragment: xmlNodePtr;
begin
  Result := xmlNewDocFragment(Self);
end;

function TxmlDocHelper.NewDocNode(const Name: String; Ns: xmlNsPtr;
  Content: String): xmlNodePtr;
begin
  Result := xmlNewDocNode(Self, Ns, PChar(Name),
    specialize IfThen<PChar>(Content <> '', PChar(Content), nil));
end;

function TxmlDocHelper.NewDocNode(const Name: PChar; Ns: xmlNsPtr;
  Content: PChar): xmlNodePtr;
begin
  Result := xmlNewDocNode(Self, Ns, Name, Content);
end;

function TxmlDocHelper.NewDocNodeEatName(const Name: String; Ns: xmlNsPtr;
  Content: String): xmlNodePtr;
begin
  Result := xmlNewDocNode(Self, Ns, PChar(Name),
    specialize IfThen<PChar>(Content <> '', PChar(Content), nil));
end;

function TxmlDocHelper.NewDocNodeEatName(const Name: PChar; Ns: xmlNsPtr;
  Content: PChar): xmlNodePtr;
begin
  Result := xmlNewDocNode(Self, Ns, Name, Content);
end;

function TxmlDocHelper.NewDocPI(const Name, Content: String): xmlNodePtr;
begin
  Result := xmlNewDocPI(Self, PChar(Name), PChar(Content));
end;

function TxmlDocHelper.NewDocPI(const Name, Content: PChar): xmlNodePtr;
begin
  Result := xmlNewDocPI(Self, Name, Content);
end;

function TxmlDocHelper.NewDocProp(const Name, Value: String): xmlAttrPtr;
begin
  Result := xmlNewDocProp(Self, PChar(Name), PChar(Value));
end;

function TxmlDocHelper.NewDocProp(const Name, Value: PChar): xmlAttrPtr;
begin
  Result := xmlNewDocProp(Self, Name, Value);
end;

function TxmlDocHelper.NewDocRawNode(const Name: String; Ns: xmlNsPtr;
  Content: String): xmlNodePtr;
begin
  Result := xmlNewDocRawNode(Self, Ns, PChar(Name),
    specialize IfThen<PChar>(Content <> '', PChar(Content), nil));
end;

function TxmlDocHelper.NewDocRawNode(const Name: PChar; Ns: xmlNsPtr;
  Content: PChar): xmlNodePtr;
begin
  Result := xmlNewDocRawNode(Self, Ns, Name, Content);
end;

function TxmlDocHelper.NewDocText(Content: String): xmlNodePtr;
begin
  Result := xmlNewDocText(Self, PChar(Content));
end;

function TxmlDocHelper.NewDocText(Content: PChar): xmlNodePtr;
begin
  Result := xmlNewDocText(Self, Content);
end;

function TxmlDocHelper.NewDocTextLen(Content: String; Len: Integer): xmlNodePtr;
begin
  Result := xmlNewDocTextLen(Self, PChar(Content), Len);
end;

function TxmlDocHelper.NewDocTextLen(Content: PChar; Len: Integer): xmlNodePtr;
begin
  Result := xmlNewDocTextLen(Self, Content, Len);
end;

function TxmlDocHelper.NewDtd(const Name, ExternalID, SystemID: String
  ): xmlDtdPtr;
begin
  Result := xmlNewDtd(Self, PChar(Name), PChar(ExternalID), PChar(SystemID));
end;

function TxmlDocHelper.NewDtd(const Name, ExternalID, SystemID: PChar
  ): xmlDtdPtr;
begin
  Result := xmlNewDtd(Self, Name, ExternalID, SystemID);
end;

function TxmlDocHelper.NewEntity(const Name: String; &Type: Integer;
  const ExternalID, SystemID, Content: String): xmlEntityPtr;
begin
  Result := xmlNewEntity(Self, xmlCharPtr(Name), &Type, xmlCharPtr(ExternalID),
    xmlCharPtr(SystemID), xmlCharPtr(Content));
end;

function TxmlDocHelper.NewEntity(const Name: xmlCharPtr; &Type: Integer;
  const ExternalID, SystemID, Content: xmlCharPtr): xmlEntityPtr;
begin
  Result := xmlNewEntity(Self, Name, &Type, ExternalID,
    SystemID, Content);
end;

function TxmlDocHelper.NewTextWriterTree(Node: xmlNodePtr; Compression: Integer
  ): xmlTextWriterPtr;
begin
  Result := xmlNewTextWriterTree(Self, Node, Compression);
end;

function TxmlDocHelper.NewReference(const Name: String): xmlNodePtr;
begin
  Result := xmlNewReference(Self, PChar(Name));
end;

function TxmlDocHelper.NewReference(const Name: PChar): xmlNodePtr;
begin
  Result := xmlNewReference(Self, Name);
end;

function TxmlDocHelper.NodeGetBaseS(const Cur: xmlNodePtr): String;
var
  Res: xmlCharPtr;
begin
  Res := xmlNodeGetBase(Self, Cur);
  if Res <> nil then
  begin
    Result := Res;
    xmlFree(Res);
  end
  else
    Result := '';
end;

function TxmlDocHelper.NodeGetBase(const Cur: xmlNodePtr): xmlCharPtr;
begin
  Result := xmlNodeGetBase(Self, Cur);
end;

function TxmlDocHelper.NodeListGetRawStringS(const List: xmlNodePtr;
  &InLine: LongBool): String;
var
  Res: xmlCharPtr;
begin
  Res := xmlNodeListGetRawString(Self, List, Integer(&InLine));
  if Res <> nil then
  begin
    Result := Res;
    xmlFree(Res);
  end
  else
    Result := '';
end;

function TxmlDocHelper.NodeListGetRawString(const List: xmlNodePtr;
  &InLine: LongBool): xmlCharPtr;
begin
  Result := xmlNodeListGetRawString(Self, List, Integer(&InLine));
end;

function TxmlDocHelper.NodeListGetStringS(const List: xmlNodePtr;
  &InLine: LongBool): String;
var
  Res: xmlCharPtr;
begin
  Res := xmlNodeListGetString(Self, List, Integer(&InLine));
  if Res <> nil then
  begin
    Result := Res;
    xmlFree(Res);
  end
  else
    Result := '';
end;

function TxmlDocHelper.NodeListGetString(const List: xmlNodePtr;
  &InLine: LongBool): xmlCharPtr;
begin
  Result := xmlNodeListGetString(Self, List, Integer(&InLine));
end;

function TxmlDocHelper.StringGetNodeList(const Value: String): xmlNodePtr;
begin
  Result := xmlStringGetNodeList(Self, xmlCharPtr(Value));
end;

function TxmlDocHelper.StringGetNodeList(const Value: xmlCharPtr): xmlNodePtr;
begin
  Result := xmlStringGetNodeList(Self, Value);
end;

function TxmlDocHelper.StringLenGetNodeList(const Value: String; Len: Integer
  ): xmlNodePtr;
begin
  Result := xmlStringLenGetNodeList(Self, xmlCharPtr(Value), Len);
end;

function TxmlDocHelper.StringLenGetNodeList(const Value: xmlCharPtr;
  Len: Integer): xmlNodePtr;
begin
  Result := xmlStringLenGetNodeList(Self, Value, Len);
end;

function TxmlDocHelper.ParseBalancedChunkMemory(Sax: xmlSAXHandlerPtr;
  UserData: Pointer; Depth: Integer; InString: String; out List: xmlNodePtr
  ): Integer;
begin
  Result := xmlParseBalancedChunkMemory(Self, Sax, UserData, Depth,
    xmlCharPtr(InString), List);
end;

function TxmlDocHelper.ParseBalancedChunkMemory(Sax: xmlSAXHandlerPtr;
  UserData: Pointer; Depth: Integer; InString: xmlCharPtr; out List: xmlNodePtr
  ): Integer;
begin
  Result := xmlParseBalancedChunkMemory(Self, Sax, UserData, Depth, InString,
    List);
end;

function TxmlDocHelper.ParseBalancedChunkMemoryRecover(Sax: xmlSAXHandlerPtr;
  UserData: Pointer; Depth: Integer; InString: String; out List: xmlNodePtr;
  Recover: Integer): Integer;
begin
  Result := xmlParseBalancedChunkMemoryRecover(Self, Sax, UserData, Depth,
    xmlCharPtr(InString), List, Recover);
end;

function TxmlDocHelper.ParseBalancedChunkMemoryRecover(Sax: xmlSAXHandlerPtr;
  UserData: Pointer; Depth: Integer; InString: xmlCharPtr; out
  List: xmlNodePtr; Recover: Integer): Integer;
begin
  Result := xmlParseBalancedChunkMemoryRecover(Self, Sax, UserData, Depth,
    InString, List, Recover);
end;

function TxmlDocHelper.ParseExternalEntity(Sax: xmlSAXHandlerPtr;
  UserData: Pointer; Depth: Integer; const URL, ID: String; out List: xmlNodePtr
  ): Integer;
begin
  Result := xmlParseExternalEntity(Self, Sax, UserData, Depth, xmlCharPtr(URL),
    xmlCharPtr(ID), List);
end;

function TxmlDocHelper.ParseExternalEntity(Sax: xmlSAXHandlerPtr;
  UserData: Pointer; Depth: Integer; const URL, ID: xmlCharPtr; out
  List: xmlNodePtr): Integer;
begin
  Result := xmlParseExternalEntity(Self, Sax, UserData, Depth, URL, ID, List);
end;

function TxmlDocHelper.ReaderWalker: xmlTextReaderPtr;
begin
  Result := xmlReaderWalker(Self);
end;

function TxmlDocHelper.ReconciliateNs(Tree: xmlNodePtr): Integer;
begin
  Result := xmlReconciliateNs(Self, Tree);
end;

function TxmlDocHelper.RelaxNGNewDocParserCtxt: xmlRelaxNGParserCtxtPtr;
begin
  Result := xmlRelaxNGNewDocParserCtxt(Self);
end;

function TxmlDocHelper.RemoveID(Attr: xmlAttrPtr): Boolean;
begin
  Result := xmlRemoveID(Self, Attr) = 0;
end;

function TxmlDocHelper.RemoveRef(Attr: xmlAttrPtr): Boolean;
begin
  Result := xmlRemoveRef(Self, Attr) = 0;
end;

function TxmlDocHelper.SaveDoc(Ctxt: xmlSaveCtxtPtr): Integer;
begin
  Result := xmlSaveDoc(Ctxt, Self);
end;

function TxmlDocHelper.SaveFile(const FileName: String): Integer;
begin
  Result := xmlSaveFile(PChar(FileName), Self);
end;

function TxmlDocHelper.SaveFile(const FileName: PChar): Integer;
begin
  Result := xmlSaveFile(FileName, Self);
end;

function TxmlDocHelper.SaveFileEnc(const FileName, Encoding: String): Integer;
begin
  Result := xmlSaveFileEnc(PChar(FileName), Self, PChar(Encoding));
end;

function TxmlDocHelper.SaveFileEnc(const FileName, Encoding: PChar): Integer;
begin
  Result := xmlSaveFileEnc(FileName, Self, Encoding);
end;

function TxmlDocHelper.SaveFileTo(Buf: xmlOutputBufferPtr;
  const Encoding: String): Integer;
begin
  Result := xmlSaveFileTo(Buf, Self, PChar(Encoding));
end;

function TxmlDocHelper.SaveFileTo(Buf: xmlOutputBufferPtr; const Encoding: PChar
  ): Integer;
begin
  Result := xmlSaveFileTo(Buf, Self, Encoding);
end;

function TxmlDocHelper.SaveFormatFile(const FileName: String; Format: Integer
  ): Integer;
begin
  Result := xmlSaveFormatFile(PChar(FileName), Self, Format);
end;

function TxmlDocHelper.SaveFormatFile(const FileName: PChar; Format: Integer
  ): Integer;
begin
  Result := xmlSaveFormatFile(FileName, Self, Format);
end;

function TxmlDocHelper.SaveFormatFileEnc(const FileName, Encoding: String;
  Format: Integer): Integer;
begin
  Result := xmlSaveFormatFileEnc(PChar(FileName), Self, PChar(Encoding), Format);
end;

function TxmlDocHelper.SaveFormatFileEnc(const FileName, Encoding: PChar;
  Format: Integer): Integer;
begin
  Result := xmlSaveFormatFileEnc(FileName, Self, Encoding, Format);
end;

function TxmlDocHelper.SaveFormatFileTo(Buf: xmlOutputBufferPtr;
  const Encoding: String; Format: Integer): Integer;
begin
  Result := xmlSaveFormatFileTo(Buf, Self, PChar(Encoding), Format);
end;

function TxmlDocHelper.SaveFormatFileTo(Buf: xmlOutputBufferPtr;
  const Encoding: PChar; Format: Integer): Integer;
begin
  Result := xmlSaveFormatFileTo(Buf, Self, Encoding, Format);
end;

function TxmlDocHelper.SchemaNewDocParserCtxt: xmlSchemaParserCtxtPtr;
begin
  Result := xmlSchemaNewDocParserCtxt(Self);
end;

function TxmlDocHelper.SchematronNewDocParserCtxt: xmlSchematronParserCtxtPtr;
begin
  Result := xmlSchematronNewDocParserCtxt(Self);
end;

function TxmlDocHelper.SearchNs(Node: xmlNodePtr; const NameSpace: String
  ): xmlNsPtr;
begin
  Result := xmlSearchNs(Self, Node, xmlCharPtr(NameSpace));
end;

function TxmlDocHelper.SearchNs(Node: xmlNodePtr; const NameSpace: xmlCharPtr
  ): xmlNsPtr;
begin
  Result := xmlSearchNs(Self, Node, NameSpace);
end;

function TxmlDocHelper.SearchNsByHref(Node: xmlNodePtr; const HRef: String
  ): xmlNsPtr;
begin
  Result := xmlSearchNsByHref(Self, Node, xmlCharPtr(HRef));
end;

function TxmlDocHelper.SearchNsByHref(Node: xmlNodePtr; const HRef: xmlCharPtr
  ): xmlNsPtr;
begin
  Result := xmlSearchNsByHref(Self, Node, HRef);
end;

function TxmlDocHelper.ValidNormalizeAttributeValue(Elem: xmlNodePtr;
  const Name, Value: String): String;
begin
  Result := xmlValidNormalizeAttributeValue(Self, Elem, xmlCharPtr(Name),
    xmlCharPtr(Value));
end;

function TxmlDocHelper.ValidNormalizeAttributeValue(Elem: xmlNodePtr;
  const Name, Value: xmlCharPtr): xmlCharPtr;
begin
  Result := xmlValidNormalizeAttributeValue(Self, Elem, Name, Value);
end;

function TxmlDocHelper.XIncludeNewContext: xmlXIncludeCtxtPtr;
begin
  Result := xmlXIncludeNewContext(Self);
end;

function TxmlDocHelper.XIncludeProcess: Integer;
begin
  Result := xmlXIncludeProcess(Self);
end;

function TxmlDocHelper.XIncludeProcessFlags(Flags: Integer): Integer;
begin
  Result := xmlXIncludeProcessFlags(Self, Flags);
end;

function TxmlDocHelper.XIncludeProcessFlagsData(Flags: Integer; Data: Pointer
  ): Integer;
begin
  Result := xmlXIncludeProcessFlagsData(Self, Flags, Data);
end;

function TxmlDocHelper.XPathNewContext: xmlXPathContextPtr;
begin
  Result := xmlXPathNewContext(Self);
end;

function TxmlDocHelper.XPathOrderDocElems: Integer;
begin
  Result := xmlXPathOrderDocElems(Self);
end;

function TxmlDocHelper.XPtrNewContext(Here, Origin: xmlNodePtr
  ): xmlXPathContextPtr;
begin
  Result := xmlXPtrNewContext(Self, Here, Origin);
end;

end.

