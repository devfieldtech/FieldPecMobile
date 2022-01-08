unit UdmSyncUp;

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
  TdmSyncUp = class(TDataModule)
    LIMPEZABEBEDOURO: TFDQuery;
    LIMPEZABEBEDOUROID: TFDAutoIncField;
    LIMPEZABEBEDOUROID_BEBEDOURO: TIntegerField;
    LIMPEZABEBEDOUROID_RESPOPNSAVEL: TIntegerField;
    LIMPEZABEBEDOURODATA: TDateField;
    LIMPEZABEBEDOUROOBSERVACAO: TStringField;
    LIMPEZABEBEDOURODATAREG: TSQLTimeStampField;
    LIMPEZABEBEDOUROSTATUS: TIntegerField;
    LIMPEZABEBEDOUROID_USUARIO: TIntegerField;
    LIMPEZABEBEDOUROHORA: TTimeField;
    LIMPEZABEBEDOUROLATITUDE: TStringField;
    LIMPEZABEBEDOUROLONGITUDE: TStringField;
    MOVIMENTACAO_ANIMAL: TFDQuery;
    QryAuxLoop: TFDQuery;
    qryAux: TFDQuery;
  private
    procedure AlteraFlagSync(Atabela, AFlag,Aid: string);
  public
   Host,Porta:string;
   function PostLimpezaBebedouro: string;
   function PostMovAnimal: string;
  end;

var
  dmSyncUp: TdmSyncUp;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UDmDB, UPrincipal;

{$R *.dfm}

procedure TdmSyncUp.AlteraFlagSync(Atabela, AFlag, Aid: string);
begin
  with qryAux,qryAux.SQL do
  begin
    Clear;
    Add('update '+Atabela+' set sync='+AFlag);
    Add('where id='+Aid);
    try
     ExecSQL;
    except
     on E: Exception do
      TThread.Synchronize(nil, procedure
      begin
       ShowMessage(e.Message);
      end);
    end;
  end;
end;

function TdmSyncUp.PostLimpezaBebedouro: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 with QryAuxLoop,QryAuxLoop.SQL do
 begin
   Clear;
   Add('select * from LIMPEZABEBEDOURO where SYNC=0');
   Open;
   I :=1;
   while not QryAuxLoop.Eof do
   begin
     frmPrincipal.FrameSync1.mlog.text:='Enviando Limpeza Bebedouro:'+
      IntToStr(i)+' de '+IntToStr(QryAuxLoop.RecordCount) ;

     with LIMPEZABEBEDOURO,LIMPEZABEBEDOURO.SQL do
     begin
      Clear;
      Add('select * from LIMPEZABEBEDOURO a');
      Add('where id='+QryAuxLoop.FieldByName('id').AsString);
      Open;
     end;
     if not LIMPEZABEBEDOURO.IsEmpty then
     begin
       JsonToSend := TStringStream.Create(nil);
       LIMPEZABEBEDOURO.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/LIMPEZABEBEDOURO';
       frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
       frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
       frmPrincipal.IdHTTP1.Request.ContentType := 'application/json';
       frmPrincipal.IdHTTP1.Request.Accept      := 'application/json';
       try
         vReultHTTP := frmPrincipal.IdHTTP1.Post(url,JsonToSend);
         if copy(vReultHTTP,0,4)='{"OK'then
         begin
           vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
           vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
           AlteraFlagSync('limpezabebedouro','1',vReultHTTP);
         end
         else
          TThread.Synchronize(nil, procedure
          begin
           ShowMessage(vReultHTTP);
          end);
         inc(I);
         QryAuxLoop.Next;
       except
        on E: Exception do
        begin
         TThread.Synchronize(nil, procedure
         begin
           ShowMessage('Erro ao sioncronizar Start Diario : '+e.Message);
         end);
         Result:='Erro ao sioncronizar Start Diario : '+e.Message;
         Break;
        end;
       end;
     end;
   end;
 end;
 Result:= vReultHTTP;
end;

function TdmSyncUp.PostMovAnimal: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if (Host.Length=0) or (Porta.Length=0) then
 begin
  dmdb.qryConfig.Close;
  dmdb.qryConfig.Open;
  Host  := dmdb.qryConfigIP_SERVIDOR.AsString;
  Porta := dmdb.qryConfigPOTA_SERVIDOR.AsString;
 end;
 with QryAuxLoop,QryAuxLoop.SQL do
 begin
   Clear;
   Add('select * from movimentacao_animal where SYNC=0');
   Open;
   I :=1;
   while not QryAuxLoop.Eof do
   begin
     frmPrincipal.FrameSync1.mlog.text:='Enviando Mov. Animal:'+
      IntToStr(i)+' de '+IntToStr(QryAuxLoop.RecordCount) ;

     with MOVIMENTACAO_ANIMAL,MOVIMENTACAO_ANIMAL.SQL do
     begin
      Clear;
      Add('select * from movimentacao_animal a');
      Add('where id='+QryAuxLoop.FieldByName('id').AsString);
      Open;
     end;
     if not MOVIMENTACAO_ANIMAL.IsEmpty then
     begin
       JsonToSend := TStringStream.Create(nil);
       MOVIMENTACAO_ANIMAL.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/MOVIMENTACAO_ANIMAL';
       frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
       frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
       frmPrincipal.IdHTTP1.Request.ContentType := 'application/json';
       frmPrincipal.IdHTTP1.Request.Accept      := 'application/json';
       try
         vReultHTTP := frmPrincipal.IdHTTP1.Post(url,JsonToSend);
         if copy(vReultHTTP,0,4)='{"OK'then
         begin
           vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
           vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
           AlteraFlagSync('MOVIMENTACAO_ANIMAL','1',vReultHTTP);
         end
         else
          TThread.Synchronize(nil, procedure
          begin
           ShowMessage(vReultHTTP);
          end);
         inc(I);
         QryAuxLoop.Next;
       except
        on E: Exception do
        begin
         TThread.Synchronize(nil, procedure
         begin
           ShowMessage('Erro ao sioncronizar Mov. Animal : '+e.Message);
         end);
         Result:='Erro ao sioncronizar Mov. Animal : '+e.Message;
         Break;
        end;
       end;
     end;
   end;
 end;
 Result:= vReultHTTP;
end;

end.
