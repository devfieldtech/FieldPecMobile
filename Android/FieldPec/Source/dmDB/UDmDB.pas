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
    ANIMAIS: TFDQuery;
    ANIMAISIDENTIFICACAO_1: TStringField;
    ANIMAISIDENTIFICACAO_2: TStringField;
    ANIMAISPESO_ENTRADA: TBCDField;
    ANIMAISPESO_ESTIMADO: TBCDField;
    ANIMAISDATA_PROC: TSQLTimeStampField;
    ANIMAISCategoria: TStringField;
    ANIMAISRaca: TStringField;
    ANIMAISRebanho: TStringField;
    ANIMAISCODIGO: TWideStringField;
    ANIMAISPROPRIEDADE: TStringField;
    ANIMAISPRODUTOR: TStringField;
    ANIMAISID: TIntegerField;
    CURRAISTIPOSTR: TWideStringField;
    BEBEDOURO: TFDQuery;
    BEBEDOUROID: TIntegerField;
    BEBEDOUROID_PASTO: TIntegerField;
    BEBEDOUROIDENTIFICACAO: TStringField;
    BEBEDOUROVOLUME: TBCDField;
    BEBEDOUROVAZAO: TBCDField;
    BEBEDOUROFREQ_LIMPEZA: TIntegerField;
    BEBEDOUROULTIMA_LIMPEZA: TDateField;
    BEBEDOURODATAREG: TSQLTimeStampField;
    BEBEDOUROID_USUARIO: TIntegerField;
    BEBEDOURODATA_ALTERACAO: TSQLTimeStampField;
    BEBEDOUROID_USUARIO_ALTERACAO: TIntegerField;
    BEBEDOUROSTATUS: TIntegerField;
    qryAux: TFDQuery;
    BEBEDOUROPasto: TWideStringField;
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
    COCHOPasto: TWideStringField;
    LIMPEZABEBEDOURO: TFDQuery;
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
    LIMPEZABEBEDOUROPasto: TWideStringField;
    LIMPEZABEBEDOUROSYNC: TIntegerField;
    LIMPEZABEBEDOUROID: TFDAutoIncField;
    MOVIMENTACAO_ANIMAL: TFDQuery;
    AUX_MOTIVO_MOVIMENTACAO: TFDQuery;
    AUX_MOTIVO_MOVIMENTACAOID: TIntegerField;
    AUX_MOTIVO_MOVIMENTACAONOME: TStringField;
    AUX_MOTIVO_MOVIMENTACAOID_USUARIO: TIntegerField;
    AUX_MOTIVO_MOVIMENTACAODATAREG: TSQLTimeStampField;
    AUX_MOTIVO_MOVIMENTACAOSTATUS: TIntegerField;
    MOVIMENTACAO_ANIMALID: TFDAutoIncField;
    MOVIMENTACAO_ANIMALID_USUARIO: TIntegerField;
    MOVIMENTACAO_ANIMALID_ANIMAL: TIntegerField;
    MOVIMENTACAO_ANIMALID_PASTO_ORIGEM: TIntegerField;
    MOVIMENTACAO_ANIMALID_PASTO_DESTINO: TIntegerField;
    MOVIMENTACAO_ANIMALDATA: TDateField;
    MOVIMENTACAO_ANIMALID_MOTIVO: TIntegerField;
    MOVIMENTACAO_ANIMALDATAREG: TSQLTimeStampField;
    MOVIMENTACAO_ANIMALPESO_ENTRADA: TBCDField;
    MOVIMENTACAO_ANIMALPESO_SAIDA_PROJ: TBCDField;
    MOVIMENTACAO_ANIMALDIAS: TIntegerField;
    MOVIMENTACAO_ANIMALORIGEM_DADOS: TIntegerField;
    MOVIMENTACAO_ANIMALTIPO: TIntegerField;
    MOVIMENTACAO_ANIMALSYNC: TIntegerField;
    MOVIMENTACAO_ANIMALOrigem: TWideStringField;
    MOVIMENTACAO_ANIMALDestino: TWideStringField;
    MOVIMENTACAO_ANIMALMotivo: TStringField;
    MOVIMENTACAO_ANIMALidentificacao: TWideStringField;
    procedure FConBeforeConnect(Sender: TObject);
    procedure ReadAccess;
    procedure BEBEDOUROReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
  private
    { Private declarations }
  public
    vIdUser,vIdPropriedade,vLocalAnimalId:string;
    function VerificaTabelaVazia(AnomeTable: string): Boolean;
    function AutenticaUsuario(Usuario, Senha: string): Boolean;
    procedure SalvarAcesso(vUsuario, Senha: string);
    procedure AbreCurrais(vPropriedade, vFiltro: string);
    procedure AbreBebedouro(vPropriedade, vFiltro: string);
    procedure AbreBuscaAnimal(vFiltro:string);
    procedure AbreCocho(vPropriedade, vFiltro: string);
    procedure AbreLimpezaBebedouro(vPropriedade, vFiltro: string);
    function RetornaNomeBebedouro(vId:string):string;
    procedure AbreMovAnimal(vPropriedade, vFiltro: string);


    procedure DeletaBebedouroPropriedade;
    procedure DeletaCochoPropriedade;
    procedure DeletaGenerico(vID,vTabela:string);
    function  RetornaOrigemAnimalMov(vIdAnimal:string):string;
  end;

var
  dmdb: Tdmdb;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UPrincipal, UFLogin;

{$R *.dfm}

procedure TdmDB.DeletaBebedouroPropriedade;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from bebedouro');
   Add('where id_pasto in(');
   Add('select id from currais where id_propriedade='+dmdb.vIdPropriedade);
   Add(')');
   qryAux.SQL.Text;
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

procedure TdmDB.DeletaCochoPropriedade;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from cocho');
   Add('where id_pasto in(');
   Add('select id from currais where id_propriedade='+dmdb.vIdPropriedade);
   Add(')');
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

procedure Tdmdb.DeletaGenerico(vID, vTabela: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from '+vTabela);
   Add('where id='+vID);
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

procedure Tdmdb.AbreBuscaAnimal(vFiltro: string);
begin
 with ANIMAIS,ANIMAIS.SQL do
 begin
   Clear;
   Add('SELECT');
   Add('a.ID,');
   Add(' IDENTIFICACAO_1,');
   Add(' IDENTIFICACAO_2,');
   Add(' PESO_ENTRADA,');
   Add(' PESO_ESTIMADO,');
   Add(' DATA_PROC,');
   Add(' c.NOME Categoria,');
   Add(' r.NOME Raca,');
   Add(' ar.NOME Rebanho,');
   Add(' c2.CODIGO,');
   Add(' p.NOME PROPRIEDADE,');
   Add(' p2.NOME PRODUTOR');
   Add('FROM ANIMAL a');
   Add('JOIN CATEGORIAS c ON c.id=a.ID_CATEGORIA');
   Add('JOIN RACA r ON r.id=a.ID_RACA');
   Add('JOIN AUX_REBANHO ar ON ar.id=a.ID_REBANHO');
   Add('JOIN CURRAIS c2 ON c2.id=a.ID_LOCAL');
   Add('JOIN PROPRIEDADES p ON p.id=a.ID_PROPRIEDADE');
   Add('JOIN PRODUTORES p2 ON p2.id=a.ID_PRODUTOR');
   Add('WHERE a.STATUS =1');
   Add(vFiltro);
   Open;
 end;
end;

procedure Tdmdb.AbreCurrais(vPropriedade, vFiltro: string);
begin
 with CURRAIS,CURRAIS.SQL do
 begin
   Clear;
   Add('select c.*,');
   Add('case');
   Add('when TIPO =0 then ''PASTO''');
   Add('when TIPO =1 then ''CONFINAMENTO''');
   Add('end TIPOSTR');
   Add('from currais c');
   Add('where status>-1');
   Add('and ID_PROPRIEDADE='+vPropriedade);
   Add(vFiltro);
   Open;
 end;
end;

procedure Tdmdb.AbreBebedouro(vPropriedade, vFiltro: string);
begin
 with BEBEDOURO,BEBEDOURO.SQL do
 begin
   Clear;
   Add('select A.*,B.codigo Pasto from BEBEDOURO A');
   Add('left JOIN currais B ON A.id_pasto=B.id');
   Add('where b.ID_PROPRIEDADE='+vPropriedade);
   Add(vFiltro);
   Open;
 end;
end;

procedure Tdmdb.AbreLimpezaBebedouro(vPropriedade, vFiltro: string);
begin
 with LIMPEZABEBEDOURO,LIMPEZABEBEDOURO.SQL do
 begin
   Clear;
   Add('select a.*,c.codigo Pasto from LIMPEZABEBEDOURO a');
   Add('join bebedouro b on a.id_bebedouro=b.id');
   Add('join currais c on c.id=b.id_pasto');
   Add('where c.ID_PROPRIEDADE='+vPropriedade);
   Add(vFiltro);
   Add('order by a.id desc');
   Open;
 end;
end;

procedure Tdmdb.AbreMovAnimal(vPropriedade, vFiltro: string);
begin
 with MOVIMENTACAO_ANIMAL,MOVIMENTACAO_ANIMAL.SQL do
 begin
   Clear;
   Add('select');
   Add(' a.*,');
   Add(' o.codigo Origem,');
   Add(' d.codigo Destino,');
   Add(' m.nome Motivo,');
   Add(' case');
   Add('when length(an.identificacao_2)>0 then identificacao_2');
   Add('else');
   Add(' identificacao_1');
   Add('end identificacao');
   Add('from movimentacao_animal a');
   Add('join animal an on an.id=a.id_animal');
   Add('join currais o on o.id=a.id_pasto_origem');
   Add('join currais d on d.id=a.id_pasto_destino');
   Add('join AUX_MOTIVO_MOVIMENTACAO m on m.id=a.id_motivo');
   Add('where o.ID_PROPRIEDADE='+vPropriedade);
   Add(vFiltro);
   Add('order by a.id desc');
   Open;
 end;
end;

procedure Tdmdb.AbreCocho(vPropriedade, vFiltro: string);
begin
 with COCHO,COCHO.SQL do
 begin
   Clear;
   Add('select A.*,B.codigo Pasto from cocho A');
   Add('left JOIN currais B ON A.id_pasto=B.id');
   Add('where b.ID_PROPRIEDADE='+vPropriedade);
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

procedure Tdmdb.BEBEDOUROReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
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


function Tdmdb.RetornaNomeBebedouro(vId: string): string;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('select c.codigo from  bebedouro b');
   Add('join currais c on c.id=b.id_pasto');
   Add('where b.id='+vId);
   Open;
   Result := FieldByName('codigo').AsString;
 end;
end;

function Tdmdb.RetornaOrigemAnimalMov(vIdAnimal: string): string;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('select b.CODIGO,b.id from ANIMAL a');
   Add('join CURRAIS b on a.ID_LOCAL=b.id');
   Add('where a.id='+vIdAnimal);
   Open;
   vLocalAnimalId := FieldByName('id').AsString;
   Result         := FieldByName('CODIGO').AsString;
 end;
end;

procedure Tdmdb.FConBeforeConnect(Sender: TObject);
var
 vPath:string;
begin
 {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   FCon.Params.DriverID :='SQLite';
   FCon.Params.Values['Database'] :=
   TPath.Combine(TPath.GetDocumentsPath,'FieldA.db');
 {$ENDIF}
 {$IFDEF MSWINDOWS}
   vPath := 'E:\Projetos2021\Field\FieldPecMobile\Android\FieldPec\db\Fieldw.db3';
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
