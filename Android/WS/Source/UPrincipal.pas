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
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase;
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
