unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  Horse,
  Horse.Jhonson,
  System.JSON, Horse.HandleException,Winapi.Windows, FireDAC.Phys.PGDef,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.PG, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client,System.Json.writers,System.IniFiles,System.JSON.Types,
  IdBaseComponent, IdComponent, IdIPWatch,Horse.BasicAuthentication,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FMX.Memo.Types;
type
  TfrmPrincipal = class(TForm)
    FCon: TFDConnection;
    ToolBar1: TToolBar;
    lblDB: TLabel;
    IdIPWatch1: TIdIPWatch;
    Rectangle1: TRectangle;
    btnFechar: TImage;
    lblWS: TLabel;
    Rectangle2: TRectangle;
    Image1: TImage;
    mlog: TMemo;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    procedure FormShow(Sender: TObject);
  private
    function GetVersaoArq: string;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses UDmDB;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
 mlog.Lines.Clear;
 try
  if dmDB.ConectaBD then
   mlog.Lines.Add('Conectado com sucesso!')
  else
   mlog.Lines.Add('Erro ao Conectar ao banco!')
 except
  on E : Exception do
      mlog.Lines.Add('Erro ao Conectar ao banco : '+E.Message);
 end;
 THorse.Use(Jhonson);
  THorse.Use(HorseBasicAuthentication(
   function(const AUsername, APassword: string): Boolean
    begin
      Result := AUsername.Equals('fuelmanage') and APassword.Equals('991528798');
    end)
   );
  THorse.Use(HandleException);
  THorse.Get('/ping',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
    Res.Send('pong');
  end);
  THorse.Listen(8089, procedure(Horse: THorse)
  begin
    lblWS.Text := ('WS Fuel Manje Rodando no ip:'+
     IdIPWatch1.LocalIP+' na porta: ' + Horse.Port.ToString+' Versão:'+
      GetVersaoArq);
    Application.ProcessMessages;
  end);

  THorse.Get('/GetTesteServidor',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Testando Servidor');
     try
      Res.Send<TJSONObject>(dmDB.GetTestaServidor);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/USERS',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Usuarios');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.USERS));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/PROPRIEDADES',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Propriedades');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.PROPRIEDADES));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.post('/CURRAIS',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Currais');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetGenericPostPropriedade(dmDB.CURRAIS,LBody));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.post('/BEBEDOURO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Bebedouro');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetGenericPostPropriedade(dmDB.BEBEDOURO,LBody));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.post('/COCHO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Cocho');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetGenericPostPropriedade(dmDB.COCHO,LBody));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/AUX_MOTIVO_MOVIMENTACAO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Motivo Movimentação');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.AUX_MOTIVO_MOVIMENTACAO));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  
  THorse.post('/ANIMAL',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando ANIMAL');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetAnimaisPostPropriedade(dmDB.ANIMAL,LBody));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);


  THorse.Get('/ALIMENTO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando ALIMENTOS');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.ALIMENTO));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/RACA',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando RACA');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.RACA));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/CATEGORIA_PADRAO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando CATEGORIA PADRAO');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.CATEGORIA_PADRAO));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/CATEGORIAS',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando CATEGORIAS');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.CATEGORIAS));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/PRODUTORES',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando PRODUTORES');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.PRODUTORES));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/AUX_REBANHO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando REBANHO');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.AUX_REBANHO));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/SUPLEMENTO_MINERAL',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Suplemento Mineral');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.SUPLEMENTO_MINERAL));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/AUX_NOTAS_LEITURA',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Nota de Leitura');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.AUX_NOTAS_LEITURA));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.post('/LOTE_NUTRICIONAL',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : LOTE NUTRICIONAL');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetGenericPostPropriedade(dmDB.LOTE_NUTRICIONAL,LBody));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);


  THorse.post('/HIST_LEITURA_COCHO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : HISTORICO LEITURA');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetGenericPostPropriedade(dmDB.HIST_LEITURA_COCHO,LBody));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.post('/HIST_CONSUMO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : HISTORICO CONSUMO');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetGenericPostPropriedade(dmDB.HIST_CONSUMO,LBody));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/RACAO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' :  RACAO');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.RACAO));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/RACAOINSUMOS',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' :  RACAO INSUMOS');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.RACAOINSUMOS));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.post('/FORNECIMENTO_PREVISTO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : FORNECIMENTO PREVISTO');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetGenericPostPropriedade(dmDB.FORNECIMENTO_PREVISTO,LBody));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

//****************Post********************************************************
  THorse.Post('/LIMPEZABEBEDOURO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Limpeza Bebedouro');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmDB.AcceptLimpezaBebedouro(LBody);
     Res.Send(LBodyRed).Status(200)
     except on ex:exception do
     begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
     end;
    end;
  end);

  THorse.Post('/MOVIMENTACAO_ANIMAL',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Movimentacao Animal');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmDB.AcceptMovAnimal(LBody);
     Res.Send(LBodyRed).Status(200)
     except on ex:exception do
     begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
     end;
    end;
  end);

  THorse.Post('/FORNECIMENTO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Fornecimento Mineral');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmDB.AcceptFornecimento(LBody);
     Res.Send(LBodyRed).Status(200)
     except on ex:exception do
     begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
     end;
    end;
  end);

  THorse.Post('/LEITURA_COCHO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Leitura de Cocho');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmDB.AcceptLeituraCocho(LBody);
     Res.Send(LBodyRed).Status(200)
     except on ex:exception do
     begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
     end;
    end;
  end);

  THorse.Post('/FABRICACAO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Fabricacao');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmDB.AcceptFabricacao(LBody);
     Res.Send(LBodyRed).Status(200)
     except on ex:exception do
     begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
     end;
    end;
  end);

  THorse.Post('/FABRICACAO_INSUMOS',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Fabricacao');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmDB.AcceptFabricacaoInsumos(LBody);
     Res.Send(LBodyRed).Status(200)
     except on ex:exception do
     begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
     end;
    end;
  end);

  THorse.Post('/FORNECIMENTO_CONF',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Fornecimento');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmDB.AcceptFornecimentoConf(LBody);
     Res.Send(LBodyRed).Status(200)
     except on ex:exception do
     begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
     end;
    end;
  end);

end;

function TfrmPrincipal.GetVersaoArq: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(
  ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0,
  VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue),
  VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(
    dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(
    dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(
    dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

end.
