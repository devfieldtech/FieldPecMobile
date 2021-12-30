unit UDmDB;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet,System.IOUtils,FMX.Dialogs,
  FireDAC.Phys.SQLiteWrapper.Stat,StrUtils;

type
  Tdmdb = class(TDataModule)
    FCon: TFDConnection;
    qryConfig: TFDQuery;
    qryConfigIP_SERVIDOR: TWideStringField;
    qryConfigPOTA_SERVIDOR: TIntegerField;
    qryConfigSERIAL: TWideStringField;
    qryConfigSalvarLogin: TIntegerField;
    qryControAcces: TFDQuery;
    qryControAccesid: TFDAutoIncField;
    qryControAccesusuario: TWideStringField;
    qryControAccesdata_access: TDateTimeField;
    qryControAccessenha: TStringField;
    PROPRIEDADES: TFDQuery;
    PROPRIEDADESID: TIntegerField;
    PROPRIEDADESNOME: TStringField;
    PROPRIEDADESCIDADE: TStringField;
    PROPRIEDADESUF: TStringField;
    PROPRIEDADESENDERECO: TStringField;
    PROPRIEDADESSTATUS: TIntegerField;
    PROPRIEDADESUSRER_ID: TIntegerField;
    PROPRIEDADESDATA_REG: TSQLTimeStampField;
    PROPRIEDADESPROPRIA: TIntegerField;
    PROPRIEDADESCOD_ESTAB_GTA: TStringField;
    PROPRIEDADESIE: TStringField;
    PROPRIEDADESGUID: TWideStringField;
    PROPRIEDADESRASTREADA: TIntegerField;
    PROPRIEDADESCOD_ERAS_BND: TStringField;
    PROPRIEDADESCIF: TStringField;
    PROPRIEDADESNIRF: TStringField;
    PROPRIEDADESINCRA: TStringField;
    CURRAIS: TFDQuery;
    CURRAISID: TIntegerField;
    CURRAISID_PROPRIEDADE: TIntegerField;
    CURRAISTIPO: TIntegerField;
    CURRAISUSER_ID: TIntegerField;
    CURRAISDATAREG: TSQLTimeStampField;
    CURRAISSTATUS: TIntegerField;
    CURRAISPESO_MINIMO: TIntegerField;
    CURRAISPESO_MAXIMO: TIntegerField;
    CURRAISCAPACIDADE: TIntegerField;
    CURRAISLOTACAO: TIntegerField;
    CURRAISSTATUS_LOTACAO: TStringField;
    CURRAISQRCODE: TStringField;
    CURRAISLATITUDE: TStringField;
    CURRAISLONGITUDE: TStringField;
    CURRAISCUSTO_FIXO_DIA: TBCDField;
    CURRAISAREA_HECTARES: TBCDField;
    CURRAISCODIGO: TWideStringField;
    CURRAISID_RETIRO: TIntegerField;
    CURRAISORDERM_FORN: TIntegerField;
    CURRAISTAG_INICIO: TStringField;
    CURRAISTAG_FIM: TStringField;
    ALIMENTO: TFDQuery;
    ALIMENTOID: TIntegerField;
    ALIMENTONOME: TStringField;
    ALIMENTOCUSTO_MEDIO: TFMTBCDField;
    ALIMENTOUNIDADE_MEDIDA: TStringField;
    ALIMENTOPESO_EMBALAGEM: TBCDField;
    ALIMENTOPERCENT_TOLERANCIA: TIntegerField;
    ALIMENTOMS: TBCDField;
    ALIMENTODATAREG: TSQLTimeStampField;
    ALIMENTOID_USUARIO: TIntegerField;
    ALIMENTOSTATUS: TIntegerField;
    ALIMENTOSALDO_ATUAL: TBCDField;
    ALIMENTODATA_CUSTO_MEDIO: TDateField;
    RACA: TFDQuery;
    CATEGORIAS: TFDQuery;
    RACAID: TIntegerField;
    RACANOME: TStringField;
    RACASTATUS: TIntegerField;
    RACADATAREG: TSQLTimeStampField;
    RACAID_USER: TIntegerField;
    RACACODIGO_BND: TStringField;
    CATEGORIASID: TIntegerField;
    CATEGORIASNOME: TStringField;
    CATEGORIASSEXO: TStringField;
    CATEGORIASSTATUS: TIntegerField;
    CATEGORIASDATAREG: TSQLTimeStampField;
    CATEGORIASUSER_ID: TIntegerField;
    CATEGORIASFAIXA_ETARIA: TStringField;
    CATEGORIASGMD: TBCDField;
    CATEGORIASID_FAIXA: TIntegerField;
    CATEGORIASID_CATEGORIA_PADRAO: TIntegerField;
    CATEGORIASCategoriaPadrao: TStringField;
    PRODUTORES: TFDQuery;
    PRODUTORESID: TIntegerField;
    PRODUTORESID_PROPRIEDADE: TIntegerField;
    PRODUTORESNOME: TStringField;
    PRODUTORESCPF_CNPJ: TStringField;
    PRODUTORESSTATUS: TIntegerField;
    PRODUTORESDATAREG: TSQLTimeStampField;
    PRODUTORESGUID: TStringField;
    PRODUTORESUSER_ID: TIntegerField;
    AUX_REBANHO: TFDQuery;
    AUX_REBANHOID: TIntegerField;
    AUX_REBANHONOME: TStringField;
    AUX_REBANHOOBSERVACAO: TStringField;
    AUX_REBANHODATAREG: TSQLTimeStampField;
    AUX_REBANHOSTATUS: TIntegerField;
    AUX_REBANHOID_USUARIO: TIntegerField;
    AUX_REBANHODATA_ALTERACAO: TSQLTimeStampField;
    AUX_REBANHOID_USUARIO_ALTERACAO: TIntegerField;
    procedure FConBeforeConnect(Sender: TObject);
    procedure ReadAccess;
  private
    { Private declarations }
  public
    vIdUser,vIdPropriedade:string;
    function VerificaTabelaVazia(AnomeTable: string): Boolean;
    function AutenticaUsuario(Usuario, Senha: string): Boolean;
    procedure SalvarAcesso(vUsuario, Senha: string);
    procedure AbreCurrais(vPropriedade, vFiltro: string);
  end;

var
  dmdb: Tdmdb;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UPrincipal, UFLogin;

{$R *.dfm}
procedure TdmDB.SalvarAcesso(vUsuario, Senha: string);
begin
  qryControAcces.Close;
  qryControAcces.Open;
  if not qryControAcces.IsEmpty then
  begin
   qryControAcces.Delete;
   qryControAcces.ApplyUpdates(-1);
  end;
  try
   qryControAcces.Close;
   qryControAcces.Open;
   qryControAcces.Insert;
   qryControAccesUsuario.AsString := vUsuario;
   qryControAccesSenha.AsString   := Senha;
   qryControAcces.ApplyUpdates(-1);
  except
   on E : Exception do
      ShowMessage('Erro ao inserir Controle de Acesso : '+E.Message);
  end;
end;

procedure Tdmdb.AbreCurrais(vPropriedade, vFiltro: string);
begin
 with CURRAIS,CURRAIS.SQL do
 begin
   Clear;
   Add('select * from currais');
   Add('where status>-1');
   Add('and ID_PROPRIEDADE='+vPropriedade);
   Add(vFiltro);
   Open;
 end;
end;

function TdmDB.AutenticaUsuario(Usuario, Senha: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FCon;
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('SELECT * FROM USERS');
  Add('WHERE LOGIN='+Usuario.QuotedString);
  Add('AND PASSWORD='+Senha.QuotedString);
  Add('AND ID_PROPRIEDADE='+vIdPropriedade);
  Open;
  if not qryAux.IsEmpty then
   begin
    vIdUser          := qryAux.FieldByName('ID').AsString;
    Result := true
   end
   else
    Result := false;
   end;
   qryAux.Free;
end;

function Tdmdb.VerificaTabelaVazia(AnomeTable: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FCon;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from '+AnomeTable);
   try
    Open;
   except
    on E: Exception do
     ShowMessage('Erro:' + E.Message );
   end;
   frmPrincipal.vPrimeiroAcesso := qryAux.IsEmpty;
   Result := qryAux.IsEmpty;
 end;
 qryAux.free;
end;

procedure TdmDB.ReadAccess;
begin
  qryControAcces.Close;
  qryControAcces.Open;
  if not qryControAcces.IsEmpty then
  begin
   frmPrincipal.frmeLogin1.edtUsuario.Text := qryControAccesUsuario.AsString;
   if qryConfigSalvarLogin.AsInteger=1 then
    frmPrincipal.frmeLogin1.edtSenha.Text   := qryControAccesSenha.AsString;
  end;
end;


procedure Tdmdb.FConBeforeConnect(Sender: TObject);
var
 vPath:string;
begin
 {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   FCon.Params.DriverID :='SQLite';
   FCon.Params.Values['Database'] :=
   TPath.Combine(TPath.GetDocumentsPath,'Field.db3');
 {$ENDIF}
 {$IFDEF MSWINDOWS}
   vPath := 'E:\Projetos2021\Field\Android\FieldPec\db\Field.db3';
   if FileExists(vPath) then
   begin
    FCon.Params.DriverID :='SQLite';
    FCon.Params.Values['Database'] :=vPath;
   end
   else
    ShowMessage('BD Não localizado!!');
 {$ENDIF}
end;

end.
