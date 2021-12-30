unit UDmDB;

interface

uses
  System.SysUtils, System.Classes, System.Json,
  vcl.Forms, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin,
  System.Json.writers,System.JSON.Types, FireDAC.Phys.PGDef, FireDAC.Phys.PG,
  FireDAC.Phys.ODBCBase,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef,System.IniFiles, FireDAC.FMXUI.Wait,FMX.Dialogs,
  FireDAC.Phys.IBBase,IdSSLOpenSSL,IdSMTP,IdMessage,IdText,IdExplicitTLSClientServerBase,
  IdAttachmentFile, FireDAC.Comp.BatchMove,System.Variants, FireDAC.Comp.BatchMove.JSON,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  System.Net.HttpClient,FMX.Types,System.Net.URLClient,
  System.Net.HttpClientComponent, FireDAC.ConsoleUI.Wait,FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Script,IdHashMessageDigest;


type
  TdmDB = class(TDataModule)
    USERS: TFDQuery;
    PROPRIEDADES: TFDQuery;
    CURRAIS: TFDQuery;
    ALIMENTO: TFDQuery;
    RACA: TFDQuery;
    CATEGORIAS: TFDQuery;
    CATEGORIA_PADRAO: TFDQuery;
    PRODUTORES: TFDQuery;
    AUX_REBANHO: TFDQuery;
    ANIMAL: TFDQuery;
    ANIMALINSERTINTO: TStringField;
    ANIMALID_PROPRIEDADE: TIntegerField;
  private
    function LerIni(Diretorio,Chave1, Chave2, ValorPadrao: String): String;
    function GetDataSetAsJSON(DataSet: TDataSet): TJSONObject;
  public
    var vDataBaseCampo,vPathBD,vPathBDMaster,vNomeBase,vIdUserLogado,
    vNomeUserLogado,vTipoUser,vDataBase,vServer,vNomePropriedade,
    vPainelAnimais,vPainelEstoque,vPainelFinanceiro,
    vRastreada,vRacaBndOutroEras,vSexoBndOutroEras,vDnBndOutroEras,
    vLic,vSenhaUserLogado,vNomeProdutorEmbarque,vTotalAnimais :string;
    vCadPedido,vGeraAnexoSaida,vCadGTA,vSyncBC: integer;
    function ConectaBD:Boolean;

    function GetGeneric(DataSet: TDataSet):TJSONObject;
    function GetGenericPostPropriedade(DataSet: TDataSet;obj: TJSONObject):TJSONObject;
    function GetAnimaisPostPropriedade(DataSet: TDataSet;obj: TJSONObject):TJSONObject;
    function GetTestaServidor: TJSONObject;
  end;

var
  dmDB: TdmDB;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UPrincipal;

{$R *.dfm}
function TdmDB.GetTestaServidor: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
begin
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue('OK');
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.ConectaBD:Boolean;
var
  Arquivo: String;
  vVendorLib:string;
begin
  frmPrincipal.FCon.Connected := false;
  Arquivo := ExtractFilePath(ParamStr(0))+'fieldconf.ini';
  if not FileExists(Arquivo) then
  begin
    ShowMessage('Arquivo fieldconf.ini não localizado no seguinte diretorio:'+#13+
    Arquivo);
    Exit;
  end
  else
  begin
    vVendorLib :=ExtractFilePath(ParamStr(0))+'fbclient_32.dll';
    frmPrincipal.FDPhysFBDriverLink1.VendorLib := vVendorLib;
    try
      with frmPrincipal.FCon do
        begin
          vPathBD                    := LerIni(Arquivo,'FIREBIRD','dbRede','');
          vNomeBase                  := LerIni(Arquivo,'FIREBIRD','NomeBase','');
          Params.Clear;
          Params.Values['DriverID']  :='FB';
          vDataBase := LerIni(Arquivo,'FIREBIRD','Database','');
          vServer   := LerIni(Arquivo,'FIREBIRD','Server','');
          Params.Values['Server']    :=LerIni(Arquivo,'FIREBIRD','Server','');
          Params.Values['Database']  :=LerIni(Arquivo,'FIREBIRD','Database','');
          vPathBDMaster := vServer+':'+vDataBase;
          vLic                       :=LerIni(Arquivo,'FIREBIRD','Lic','');
          Params.Values['User_name'] :=LerIni(Arquivo,'FIREBIRD','User','');
          Params.Values['Password']  :=LerIni(Arquivo,'FIREBIRD','Password','');
          Params.Values['Port']      :=LerIni(Arquivo,'FIREBIRD','Port','');
          Connected := True;
          frmPrincipal.lblDB.TEXT := 'DB : '+vServer+':'+vDataBase;
          Result := true;
        end;
    except
     on E : Exception do
     begin
      ShowMessage('Erro ao Conectar ao banco : '+E.Message);
      Result := false;
     end;
    end;
  end;
end;

function TdmDB.LerIni(Diretorio,Chave1, Chave2, ValorPadrao: String): String;
var
 FileIni: TIniFile;
begin
  result := ValorPadrao;
  try
    FileIni := TIniFile.Create(Diretorio);
    if FileExists(Diretorio) then
      result := FileIni.ReadString(Chave1, Chave2, ValorPadrao);
  finally
    FreeAndNil(FileIni)
  end;
end;

function TdmDB.GetAnimaisPostPropriedade(DataSet: TDataSet;
  obj: TJSONObject): TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
 vJsonString :string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1: TJSONArray;
 vidPropriedade:string;
 IStatus:integer;
begin
   vJsonString      := Obj.ToString;
   vJoInsert        := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
   vJoItem          := vJoInsert.GetValue('IDPROPRIEDADE') as TJSONArray;
   vJoItemO         := vJoItem.Items[0] as TJSONObject;
   vidPropriedade   :=  vJoItemO.GetValue('id').value;
   ANIMAL.Filtered := false;
   ANIMAL.Close;
   ANIMAL.Open;
   ANIMAL.Filter   := 'ID_PROPRIEDADE='+vidPropriedade;
   ANIMAL.Filtered := true;
   if not ANIMAL.IsEmpty then
   begin
    StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('ANIMAL');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not ANIMAL.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('INSERT');
      txtJson.WriteValue(ANIMAL.FieldByName('InsertInto').AsString);
      txtJson.WriteEndObject;
      ANIMAL.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabecalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhum Animal encontrado!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
end;

function TdmDB.GetDataSetAsJSON(DataSet: TDataSet): TJSONObject;
var
  f: TField;
  o: TJSOnObject;
  a: TJSONArray;
begin
  a := TJSONArray.Create;
  DataSet.Active := True;
  DataSet.First;
  while not DataSet.EOF do begin
    o := TJSOnObject.Create;
    for f in DataSet.Fields do
      o.AddPair(f.FieldName, VarToStr(f.Value));
    a.AddElement(o);
    DataSet.Next;
  end;
  DataSet.Active := False;
  Result := TJSONObject.Create;
  Result.AddPair(DataSet.Name, a);
end;


function TdmDB.GetGeneric(DataSet: TDataSet): TJSONObject;
begin
 DataSet.Close;
 DataSet.Open;
 Result := GetDataSetAsJSON(DataSet);
end;

function TdmDB.GetGenericPostPropriedade(DataSet: TDataSet;obj: TJSONObject): TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
 vJsonString :string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1: TJSONArray;
 vidPropriedade:string;
 IStatus:integer;
begin
   vJsonString      := Obj.ToString;
   vJoInsert        := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
   vJoItem          := vJoInsert.GetValue('IDPROPRIEDADE') as TJSONArray;
   vJoItemO         := vJoItem.Items[0] as TJSONObject;
   vidPropriedade   :=  vJoItemO.GetValue('id').value;
   DataSet.Filtered := false;
   DataSet.Close;
   DataSet.Open;
   DataSet.Filter   := 'ID_PROPRIEDADE='+vidPropriedade;
   DataSet.Filtered := true;
   Result := GetDataSetAsJSON(DataSet);
end;

end.
