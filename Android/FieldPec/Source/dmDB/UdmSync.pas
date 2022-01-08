unit UdmSync;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  System.JSON,FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client,System.Json.writers,System.IniFiles,System.JSON.Types,
  IdBaseComponent, IdComponent, IdIPWatch, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Stan.StorageJSON;

type
  TdmSync = class(TDataModule)
    USERS: TFDQuery;
    qryAux: TFDQuery;
    PROPRIEDADES: TFDQuery;
    CURRAIS: TFDQuery;
    ALIMENTO: TFDQuery;
    RACA: TFDQuery;
    CATEGORIAS: TFDQuery;
    CATEGORIA_PADRAO: TFDQuery;
    PRODUTORES: TFDQuery;
    AUX_REBANHO: TFDQuery;
    ANIMAIS: TFDQuery;
    BEBEDOURO: TFDQuery;
    COCHO: TFDQuery;
    COCHOID: TIntegerField;
    COCHOID_PASTO: TIntegerField;
    COCHONOME: TStringField;
    COCHOTAG: TStringField;
    COCHOID_USUARIO: TIntegerField;
    COCHODATAREG: TSQLTimeStampField;
    COCHOSTATUS: TIntegerField;
    COCHOID_MINERAL: TIntegerField;
    COCHOMETRAGEM: TBCDField;
    COCHOCREEPFEED: TIntegerField;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    AUX_MOTIVO_MOVIMENTACAO: TFDQuery;
  private

  public
    Host,Porta:string;
    function  GetGenerico(DataSet: TFDQuery): string;
    function  GetGenericoPostIdPropriedade(DataSet: TFDQuery): string;
    function  GetAnimais: string;
    procedure DeletaTabelaSync(Atabela:string);
    procedure DeletaTabelaSyncPropriedade(Atabela,vIDProp:string);
    function  TestaServidor: string;
  end;

var
  dmSync: TdmSync;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UDmDB, UPrincipal, UFSync;

{$R *.dfm}

{ TdmSync }



{ TdmSync }
procedure TdmSync.DeletaTabelaSync(Atabela: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from '+Atabela);
   try
    ExecSQL;
   except
     on E: Exception do
      TThread.Synchronize(nil, procedure
      begin
       ShowMessage(e.Message);
      end);
   end
 end;
end;

function TdmSync.TestaServidor: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
  if (Host.Length=0) or (Porta.Length=0) then
  begin
   dmdb.qryConfig.Close;
   dmdb.qryConfig.Open;
   Host  := dmdb.qryConfigIP_SERVIDOR.AsString;
   Porta := dmdb.qryConfigPOTA_SERVIDOR.AsString;
  end;

   Url :='http://'+Host+':'+Porta+'/GetTesteServidor';
   frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := frmPrincipal.IdHTTP1.Get(URL);
    Result:= vJsonString;
   except
     Result  := 'Erro';
   end;
end;


procedure TdmSync.DeletaTabelaSyncPropriedade(Atabela,vIDProp: string);
begin
  with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from '+Atabela);
   Add('where ID_PROPRIEDADE='+vIDProp);
   try
    ExecSQL;
   except
     on E: Exception do
      TThread.Synchronize(nil, procedure
      begin
       ShowMessage(e.Message);
      end);
   end
 end;
end;

function TdmSync.GetAnimais: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
 StrAux      : TStringWriter;
 txtJson     : TJsonTextWriter;
 LJsonObj    : TJSONObject;
 JsonToSend  : TStringStream;
begin
 if (Host.Length=0) or (Porta.Length=0) then
  begin
   dmdb.qryConfig.Close;
   dmdb.qryConfig.Open;
   Host  := dmdb.qryConfigIP_SERVIDOR.AsString;
   Porta := dmdb.qryConfigPOTA_SERVIDOR.AsString;
  end;

  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  TxtJSON.WriteStartObject;
  TxtJSON.WritePropertyName('IDPROPRIEDADE');
  TxtJSON.WriteStartArray;
    txtJson.WriteStartObject;
    txtJson.WritePropertyName('id');
    txtJson.WriteValue(dmdb.vIdPropriedade);
  TxtJSON.WriteEndArray;
  TxtJSON.WriteEndObject;
  LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
  JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
 Url :='http://'+Host+':'+Porta+'/ANIMAL';
 frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
 try
  vJsonString        := frmPrincipal.IdHTTP1.Post(URL,JsonToSend);
  DeletaTabelaSyncPropriedade('ANIMAL',dmdb.vIdPropriedade);
  if(vJsonString<>'{"Mensagem":"Nenhum Animal encontrado!"}') then
  begin
    jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
     vJoGet := jSubObj.GetValue<TJSONArray>('ANIMAL') as TJSONArray;
     for i := 0 to vJoGet.Count-1 do
     begin
        vJoGetJ         := vJoGet.Items[i] as TJSONObject;
        vID             := vJoGetJ.GetValue('INSERT').value;
        if vID.Length>0 then
        begin
          with qryAux,qryAux.SQL do
          begin
            Clear;
            Add(vID);
            try
              ExecSQL;
              TThread.Synchronize(nil, procedure
               begin
                  frmPrincipal.FrameSync1.mlog.text :=('Animais '+intToStr(i)+' de '+intToStr(vJoGet.Count));
               end);
            except
              on E: Exception do
               Raise exception.Create(E.Message);
            end;
          end;
        end;
     end;
     result:='Animais Baixado com Sucesso!'
  end
  else
   Result :=vJsonString;
 except
 on E: Exception do
   begin
     Raise exception.Create(E.Message);
   end;
 end;
end;

function TdmSync.GetGenerico(DataSet: TFDQuery): string;
var
 Url,vJsonString,vIsert,vJsonCopy,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
 f: TField;
begin
  if (Host.Length=0) or (Porta.Length=0) then
  begin
   dmdb.qryConfig.Close;
   dmdb.qryConfig.Open;
   Host  := dmdb.qryConfigIP_SERVIDOR.AsString;
   Porta := dmdb.qryConfigPOTA_SERVIDOR.AsString;
  end;


  Url := 'http://'+Host+':'+Porta+'/'+DataSet.Name;
  frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := frmPrincipal.IdHTTP1.Get(URL);
    vJsonCopy          := copy(vJsonString,0,6);
     if(vJsonCopy<>'{"Erro') then
     begin
      if(vJsonString<>'{"'+DataSet.Name+'":[]}') then
      begin
        DeletaTabelaSync(DataSet.Name);
        DataSet.Close;
        DataSet.Open;
        jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
         vJoGet := jSubObj.GetValue<TJSONArray>(DataSet.Name) as TJSONArray;
         for i := 0 to vJoGet.Count-1 do
         begin
            vJoGetJ         := vJoGet.Items[i] as TJSONObject;
            vId               := vJoGetJ.GetValue('ID').value;
            DataSet.Close;
            DataSet.Open;
            DataSet.Insert;
             for f in DataSet.Fields do
             begin
              vField:=f.FieldName;
              DataSet.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
             end;
            try
             DataSet.ApplyUpdates(-1);
             TThread.Synchronize(nil, procedure
             begin
              frmPrincipal.FrameSync1.mlog.text :=('Registros '+intToStr(i)+' de '+intToStr(vJoGet.Count));
             end);
            except
             on E: Exception do
              result:='Erro:'+E.Message;
            end;
         end;
         result:=StringReplace(DataSet.Name,'T','',[rfReplaceAll])+
         ' Baixados com Sucesso!'
      end
      else
       Result :=StringReplace(DataSet.Name,'T','',[rfReplaceAll])+' Sem Dados Para Baixar!'
     end
     else
       Result :=vJsonString;
     except
     on E: Exception do
       begin
         result:='Erro ao comunicar com Servidor:'+E.Message;
       end;
     end;
end;

function TdmSync.GetGenericoPostIdPropriedade(DataSet: TFDQuery): string;
var
 Url,vJsonString,vIsert,vJsonCopy,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
 StrAux      : TStringWriter;
 txtJson     : TJsonTextWriter;
 LJsonObj    : TJSONObject;
 JsonToSend  : TStringStream;
 f: TField;
begin
  if (Host.Length=0) or (Porta.Length=0) then
  begin
   dmdb.qryConfig.Close;
   dmdb.qryConfig.Open;
   Host  := dmdb.qryConfigIP_SERVIDOR.AsString;
   Porta := dmdb.qryConfigPOTA_SERVIDOR.AsString;
  end;


  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  TxtJSON.WriteStartObject;
  TxtJSON.WritePropertyName('IDPROPRIEDADE');
  TxtJSON.WriteStartArray;
    txtJson.WriteStartObject;
    txtJson.WritePropertyName('id');
    txtJson.WriteValue(dmdb.vIdPropriedade);
  TxtJSON.WriteEndArray;
  TxtJSON.WriteEndObject;
  LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
  JsonToSend := TStringStream.Create(LJsonObj.ToJSON);

  Url := 'http://'+Host+':'+Porta+'/'+DataSet.Name;
  frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
  frmPrincipal.IdHTTP1.Request.ContentType := 'application/json';
  frmPrincipal.IdHTTP1.Request.Accept      := 'application/json';
  try
    vJsonString        := frmPrincipal.IdHTTP1.Post(URL,JsonToSend);
    vJsonCopy          := copy(vJsonString,0,6);
     if(vJsonCopy<>'{"Erro') then
     begin
      if(vJsonString<>'{"'+DataSet.Name+'":[]}') then
      begin
        if (DataSet.Name='COCHO')then
         dmdb.DeletaCochoPropriedade;
        if (DataSet.Name='BEBEDOURO') then
         dmdb.DeletaBebedouroPropriedade;
        if (DataSet.Name<>'COCHO')and(DataSet.Name<>'BEBEDOURO') then
         DeletaTabelaSyncPropriedade(DataSet.Name,dmdb.vIdPropriedade);

        DataSet.Close;
        DataSet.Open;
        jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
         vJoGet := jSubObj.GetValue<TJSONArray>(DataSet.Name) as TJSONArray;
         for i := 0 to vJoGet.Count-1 do
         begin
            vJoGetJ         := vJoGet.Items[i] as TJSONObject;
            vId               := vJoGetJ.GetValue('ID').value;
            DataSet.Close;
            DataSet.Open;
            DataSet.Insert;
             for f in DataSet.Fields do
             begin
              vField:=f.FieldName;
              if (DataSet.Name='COCHO')or(DataSet.Name='BEBEDOURO') then
              begin
               if vField<>'ID_PROPRIEDADE' then
                DataSet.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
              end
              else
               DataSet.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
             end;
            try
             DataSet.ApplyUpdates(-1);
             TThread.Synchronize(nil, procedure
             begin
              frmPrincipal.FrameSync1.mlog.text :=('Registros '+intToStr(i)+' de '+intToStr(vJoGet.Count));
             end);
            except
             on E: Exception do
              result:='Erro:'+E.Message;
            end;
         end;
         result:=StringReplace(DataSet.Name,'T','',[rfReplaceAll])+
         ' Baixados com Sucesso!'
      end
      else
       Result :=StringReplace(DataSet.Name,'T','',[rfReplaceAll])+' Sem Dados Para Baixar!'
     end
     else
       Result :=vJsonString;
     except
     on E: Exception do
       begin
         result:='Erro ao comunicar com Servidor:'+E.Message;
       end;
     end;
end;
end.
