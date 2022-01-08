object dmdb: Tdmdb
  OldCreateOrder = False
  Height = 402
  Width = 672
  object FCon: TFDConnection
    Params.Strings = (
      
        'Database=E:\Projetos2021\Field\FieldPecMobile\Android\FieldPec\d' +
        'b\FieldA.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    BeforeConnect = FConBeforeConnect
    Left = 48
    Top = 32
  end
  object qryConfig: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'SELECT * FROM CONFIG')
    Left = 48
    Top = 80
    object qryConfigIP_SERVIDOR: TWideStringField
      FieldName = 'IP_SERVIDOR'
      Origin = 'IP_SERVIDOR'
      Size = 15
    end
    object qryConfigPOTA_SERVIDOR: TIntegerField
      FieldName = 'POTA_SERVIDOR'
      Origin = 'POTA_SERVIDOR'
    end
    object qryConfigSERIAL: TWideStringField
      FieldName = 'SERIAL'
      Origin = 'SERIAL'
    end
    object qryConfigSalvarLogin: TIntegerField
      FieldName = 'SalvarLogin'
      Origin = 'SalvarLogin'
    end
  end
  object qryControAcces: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from control_access'
      'order by id desc'
      'limit 1')
    Left = 56
    Top = 144
    object qryControAccesid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryControAccesusuario: TWideStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Size = 32767
    end
    object qryControAccesdata_access: TDateTimeField
      FieldName = 'data_access'
      Origin = 'data_access'
    end
    object qryControAccessenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 100
    end
  end
  object PROPRIEDADES: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'select * from propriedades'
      'where propria=1 and status>-1')
    Left = 48
    Top = 216
    object PROPRIEDADESID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object PROPRIEDADESNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object PROPRIEDADESCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Required = True
      Size = 100
    end
    object PROPRIEDADESUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      FixedChar = True
      Size = 15
    end
    object PROPRIEDADESENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 200
    end
    object PROPRIEDADESSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object PROPRIEDADESUSRER_ID: TIntegerField
      FieldName = 'USRER_ID'
      Origin = 'USRER_ID'
    end
    object PROPRIEDADESDATA_REG: TSQLTimeStampField
      FieldName = 'DATA_REG'
      Origin = 'DATA_REG'
      Required = True
    end
    object PROPRIEDADESPROPRIA: TIntegerField
      FieldName = 'PROPRIA'
      Origin = 'PROPRIA'
      Required = True
    end
    object PROPRIEDADESCOD_ESTAB_GTA: TStringField
      FieldName = 'COD_ESTAB_GTA'
      Origin = 'COD_ESTAB_GTA'
    end
    object PROPRIEDADESIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
    end
    object PROPRIEDADESGUID: TWideStringField
      FieldName = 'GUID'
      Origin = 'GUID'
      Size = 32767
    end
    object PROPRIEDADESRASTREADA: TIntegerField
      FieldName = 'RASTREADA'
      Origin = 'RASTREADA'
    end
    object PROPRIEDADESCOD_ERAS_BND: TStringField
      FieldName = 'COD_ERAS_BND'
      Origin = 'COD_ERAS_BND'
    end
    object PROPRIEDADESCIF: TStringField
      FieldName = 'CIF'
      Origin = 'CIF'
    end
    object PROPRIEDADESNIRF: TStringField
      FieldName = 'NIRF'
      Origin = 'NIRF'
    end
    object PROPRIEDADESINCRA: TStringField
      FieldName = 'INCRA'
      Origin = 'INCRA'
    end
  end
  object CURRAIS: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'select c.*, '
      'case '
      ' when TIPO =0 then '#39'PASTO'#39
      ' when TIPO =1 then '#39'CONFINAMENTO'#39
      'end TIPOSTR'
      'from currais c')
    Left = 48
    Top = 280
    object CURRAISID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object CURRAISID_PROPRIEDADE: TIntegerField
      FieldName = 'ID_PROPRIEDADE'
      Origin = 'ID_PROPRIEDADE'
    end
    object CURRAISTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
    object CURRAISUSER_ID: TIntegerField
      FieldName = 'USER_ID'
      Origin = 'USER_ID'
    end
    object CURRAISDATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
    end
    object CURRAISSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object CURRAISPESO_MINIMO: TIntegerField
      FieldName = 'PESO_MINIMO'
      Origin = 'PESO_MINIMO'
      Required = True
    end
    object CURRAISPESO_MAXIMO: TIntegerField
      FieldName = 'PESO_MAXIMO'
      Origin = 'PESO_MAXIMO'
      Required = True
    end
    object CURRAISCAPACIDADE: TIntegerField
      FieldName = 'CAPACIDADE'
      Origin = 'CAPACIDADE'
      Required = True
    end
    object CURRAISLOTACAO: TIntegerField
      FieldName = 'LOTACAO'
      Origin = 'LOTACAO'
    end
    object CURRAISSTATUS_LOTACAO: TStringField
      FieldName = 'STATUS_LOTACAO'
      Origin = 'STATUS_LOTACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CURRAISQRCODE: TStringField
      FieldName = 'QRCODE'
      Origin = 'QRCODE'
      Size = 30
    end
    object CURRAISLATITUDE: TStringField
      FieldName = 'LATITUDE'
      Origin = 'LATITUDE'
      Size = 50
    end
    object CURRAISLONGITUDE: TStringField
      FieldName = 'LONGITUDE'
      Origin = 'LONGITUDE'
      Size = 30
    end
    object CURRAISCUSTO_FIXO_DIA: TBCDField
      FieldName = 'CUSTO_FIXO_DIA'
      Origin = 'CUSTO_FIXO_DIA'
      Precision = 15
      Size = 2
    end
    object CURRAISAREA_HECTARES: TBCDField
      FieldName = 'AREA_HECTARES'
      Origin = 'AREA_HECTARES'
      Precision = 15
      Size = 3
    end
    object CURRAISCODIGO: TWideStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 32767
    end
    object CURRAISID_RETIRO: TIntegerField
      FieldName = 'ID_RETIRO'
      Origin = 'ID_RETIRO'
    end
    object CURRAISORDERM_FORN: TIntegerField
      FieldName = 'ORDERM_FORN'
      Origin = 'ORDERM_FORN'
    end
    object CURRAISTAG_INICIO: TStringField
      FieldName = 'TAG_INICIO'
      Origin = 'TAG_INICIO'
      Size = 30
    end
    object CURRAISTAG_FIM: TStringField
      FieldName = 'TAG_FIM'
      Origin = 'TAG_FIM'
      Size = 30
    end
    object CURRAISTIPOSTR: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPOSTR'
      Origin = 'TIPOSTR'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object ALIMENTO: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from alimento'
      'where status=1')
    Left = 48
    Top = 336
    object ALIMENTOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object ALIMENTONOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object ALIMENTOCUSTO_MEDIO: TFMTBCDField
      FieldName = 'CUSTO_MEDIO'
      Origin = 'CUSTO_MEDIO'
      Required = True
      Precision = 18
      Size = 3
    end
    object ALIMENTOUNIDADE_MEDIDA: TStringField
      FieldName = 'UNIDADE_MEDIDA'
      Origin = 'UNIDADE_MEDIDA'
    end
    object ALIMENTOPESO_EMBALAGEM: TBCDField
      FieldName = 'PESO_EMBALAGEM'
      Origin = 'PESO_EMBALAGEM'
      Precision = 15
      Size = 2
    end
    object ALIMENTOPERCENT_TOLERANCIA: TIntegerField
      FieldName = 'PERCENT_TOLERANCIA'
      Origin = 'PERCENT_TOLERANCIA'
    end
    object ALIMENTOMS: TBCDField
      FieldName = 'MS'
      Origin = 'MS'
      Precision = 15
      Size = 2
    end
    object ALIMENTODATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object ALIMENTOID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
    object ALIMENTOSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object ALIMENTOSALDO_ATUAL: TBCDField
      FieldName = 'SALDO_ATUAL'
      Origin = 'SALDO_ATUAL'
      Precision = 15
      Size = 3
    end
    object ALIMENTODATA_CUSTO_MEDIO: TDateField
      FieldName = 'DATA_CUSTO_MEDIO'
      Origin = 'DATA_CUSTO_MEDIO'
    end
  end
  object RACA: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from raca'
      'where status=1')
    Left = 160
    Top = 24
    object RACAID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object RACANOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object RACASTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object RACADATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object RACAID_USER: TIntegerField
      FieldName = 'ID_USER'
      Origin = 'ID_USER'
    end
    object RACACODIGO_BND: TStringField
      FieldName = 'CODIGO_BND'
      Origin = 'CODIGO_BND'
      FixedChar = True
      Size = 2
    end
  end
  object CATEGORIAS: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select c.*,cp.nome CategoriaPadrao from categorias c'
      'join categoria_padrao cp on cp.id=c.id_categoria_padrao'
      'where status=1')
    Left = 160
    Top = 80
    object CATEGORIASID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object CATEGORIASNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object CATEGORIASSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CATEGORIASSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object CATEGORIASDATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object CATEGORIASUSER_ID: TIntegerField
      FieldName = 'USER_ID'
      Origin = 'USER_ID'
    end
    object CATEGORIASFAIXA_ETARIA: TStringField
      FieldName = 'FAIXA_ETARIA'
      Origin = 'FAIXA_ETARIA'
    end
    object CATEGORIASGMD: TBCDField
      FieldName = 'GMD'
      Origin = 'GMD'
      Precision = 15
      Size = 3
    end
    object CATEGORIASID_FAIXA: TIntegerField
      FieldName = 'ID_FAIXA'
      Origin = 'ID_FAIXA'
    end
    object CATEGORIASID_CATEGORIA_PADRAO: TIntegerField
      FieldName = 'ID_CATEGORIA_PADRAO'
      Origin = 'ID_CATEGORIA_PADRAO'
      Required = True
    end
    object CATEGORIASCategoriaPadrao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CategoriaPadrao'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object PRODUTORES: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'SELECT * FROM PRODUTORES')
    Left = 160
    Top = 144
    object PRODUTORESID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object PRODUTORESID_PROPRIEDADE: TIntegerField
      FieldName = 'ID_PROPRIEDADE'
      Origin = 'ID_PROPRIEDADE'
      Required = True
    end
    object PRODUTORESNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object PRODUTORESCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Required = True
    end
    object PRODUTORESSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object PRODUTORESDATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object PRODUTORESGUID: TStringField
      FieldName = 'GUID'
      Origin = 'GUID'
      Size = 100
    end
    object PRODUTORESUSER_ID: TIntegerField
      FieldName = 'USER_ID'
      Origin = 'USER_ID'
    end
  end
  object AUX_REBANHO: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from AUX_REBANHO')
    Left = 160
    Top = 200
    object AUX_REBANHOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object AUX_REBANHONOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
    end
    object AUX_REBANHOOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 100
    end
    object AUX_REBANHODATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object AUX_REBANHOSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object AUX_REBANHOID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
    object AUX_REBANHODATA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ALTERACAO'
      Origin = 'DATA_ALTERACAO'
    end
    object AUX_REBANHOID_USUARIO_ALTERACAO: TIntegerField
      FieldName = 'ID_USUARIO_ALTERACAO'
      Origin = 'ID_USUARIO_ALTERACAO'
    end
  end
  object ANIMAIS: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'SELECT  '
      ' a.ID,'
      ' IDENTIFICACAO_1,'
      ' IDENTIFICACAO_2,'
      ' PESO_ENTRADA,'
      ' PESO_ESTIMADO,'
      ' DATA_PROC,'
      ' c.NOME Categoria,'
      ' r.NOME Raca,'
      ' ar.NOME Rebanho,'
      ' c2.CODIGO,'
      ' p.NOME PROPRIEDADE,'
      ' p2.NOME PRODUTOR'
      'FROM ANIMAL a '
      'JOIN CATEGORIAS c ON c.id=a.ID_CATEGORIA '
      'JOIN RACA r ON r.id=a.ID_RACA '
      'JOIN AUX_REBANHO ar ON ar.id=a.ID_REBANHO '
      'JOIN CURRAIS c2 ON c2.id=a.ID_LOCAL'
      'JOIN PROPRIEDADES p ON p.id=a.ID_PROPRIEDADE '
      'JOIN PRODUTORES p2 ON p2.id=a.ID_PRODUTOR '
      'WHERE a.STATUS =1')
    Left = 160
    Top = 272
    object ANIMAISIDENTIFICACAO_1: TStringField
      FieldName = 'IDENTIFICACAO_1'
      Origin = 'IDENTIFICACAO_1'
      Size = 25
    end
    object ANIMAISIDENTIFICACAO_2: TStringField
      FieldName = 'IDENTIFICACAO_2'
      Origin = 'IDENTIFICACAO_2'
      Size = 25
    end
    object ANIMAISPESO_ENTRADA: TBCDField
      FieldName = 'PESO_ENTRADA'
      Origin = 'PESO_ENTRADA'
      Precision = 15
      Size = 2
    end
    object ANIMAISPESO_ESTIMADO: TBCDField
      FieldName = 'PESO_ESTIMADO'
      Origin = 'PESO_ESTIMADO'
      Precision = 15
      Size = 2
    end
    object ANIMAISDATA_PROC: TSQLTimeStampField
      FieldName = 'DATA_PROC'
      Origin = 'DATA_PROC'
      Required = True
    end
    object ANIMAISCategoria: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Categoria'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object ANIMAISRaca: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Raca'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object ANIMAISRebanho: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Rebanho'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
    end
    object ANIMAISCODIGO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object ANIMAISPROPRIEDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PROPRIEDADE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object ANIMAISPRODUTOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTOR'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object ANIMAISID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
  end
  object BEBEDOURO: TFDQuery
    OnReconcileError = BEBEDOUROReconcileError
    Connection = FCon
    SQL.Strings = (
      'select A.*,B.codigo Pasto from BEBEDOURO A'
      'JOIN currais B ON A.id_pasto=B.id')
    Left = 256
    Top = 24
    object BEBEDOUROID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object BEBEDOUROID_PASTO: TIntegerField
      FieldName = 'ID_PASTO'
      Origin = 'ID_PASTO'
      Required = True
    end
    object BEBEDOUROIDENTIFICACAO: TStringField
      FieldName = 'IDENTIFICACAO'
      Origin = 'IDENTIFICACAO'
    end
    object BEBEDOUROVOLUME: TBCDField
      FieldName = 'VOLUME'
      Origin = 'VOLUME'
      Precision = 15
      Size = 2
    end
    object BEBEDOUROVAZAO: TBCDField
      FieldName = 'VAZAO'
      Origin = 'VAZAO'
      Precision = 15
      Size = 2
    end
    object BEBEDOUROFREQ_LIMPEZA: TIntegerField
      FieldName = 'FREQ_LIMPEZA'
      Origin = 'FREQ_LIMPEZA'
    end
    object BEBEDOUROULTIMA_LIMPEZA: TDateField
      FieldName = 'ULTIMA_LIMPEZA'
      Origin = 'ULTIMA_LIMPEZA'
    end
    object BEBEDOURODATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object BEBEDOUROID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
    object BEBEDOURODATA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ALTERACAO'
      Origin = 'DATA_ALTERACAO'
    end
    object BEBEDOUROID_USUARIO_ALTERACAO: TIntegerField
      FieldName = 'ID_USUARIO_ALTERACAO'
      Origin = 'ID_USUARIO_ALTERACAO'
    end
    object BEBEDOUROSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object BEBEDOUROPasto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Pasto'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object qryAux: TFDQuery
    Connection = FCon
    Left = 256
    Top = 80
  end
  object COCHO: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'select A.*,B.codigo Pasto from cocho A'
      'left JOIN currais B ON A.id_pasto=B.id'
      'where b.ID_PROPRIEDADE=9001')
    Left = 256
    Top = 144
    object COCHOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object COCHOID_PASTO: TIntegerField
      FieldName = 'ID_PASTO'
      Origin = 'ID_PASTO'
      Required = True
    end
    object COCHONOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 40
    end
    object COCHOTAG: TStringField
      FieldName = 'TAG'
      Origin = 'TAG'
      Size = 40
    end
    object COCHOID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
    object COCHODATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object COCHOSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object COCHOID_MINERAL: TIntegerField
      FieldName = 'ID_MINERAL'
      Origin = 'ID_MINERAL'
    end
    object COCHOMETRAGEM: TBCDField
      FieldName = 'METRAGEM'
      Origin = 'METRAGEM'
      Precision = 15
      Size = 2
    end
    object COCHOCREEPFEED: TIntegerField
      FieldName = 'CREEPFEED'
      Origin = 'CREEPFEED'
    end
    object COCHOPasto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Pasto'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object LIMPEZABEBEDOURO: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select a.*,c.codigo Pasto from LIMPEZABEBEDOURO a'
      'join bebedouro b on a.id_bebedouro=b.id'
      'join currais c on c.id=b.id_pasto')
    Left = 392
    Top = 64
    object LIMPEZABEBEDOUROID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object LIMPEZABEBEDOUROID_BEBEDOURO: TIntegerField
      FieldName = 'ID_BEBEDOURO'
      Origin = 'ID_BEBEDOURO'
    end
    object LIMPEZABEBEDOUROID_RESPOPNSAVEL: TIntegerField
      FieldName = 'ID_RESPOPNSAVEL'
      Origin = 'ID_RESPOPNSAVEL'
    end
    object LIMPEZABEBEDOURODATA: TDateField
      FieldName = 'DATA'
      Origin = 'DATA'
    end
    object LIMPEZABEBEDOUROOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 100
    end
    object LIMPEZABEBEDOURODATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
    end
    object LIMPEZABEBEDOUROSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object LIMPEZABEBEDOUROID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
    end
    object LIMPEZABEBEDOUROHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
    end
    object LIMPEZABEBEDOUROLATITUDE: TStringField
      FieldName = 'LATITUDE'
      Origin = 'LATITUDE'
    end
    object LIMPEZABEBEDOUROLONGITUDE: TStringField
      FieldName = 'LONGITUDE'
      Origin = 'LONGITUDE'
    end
    object LIMPEZABEBEDOUROPasto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Pasto'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object LIMPEZABEBEDOUROSYNC: TIntegerField
      FieldName = 'SYNC'
      Origin = 'SYNC'
    end
  end
  object MOVIMENTACAO_ANIMAL: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select'
      ' a.*,'
      ' o.codigo Origem,'
      ' d.codigo Destino,'
      ' m.nome Motivo,'
      ' case'
      '  when length(an.identificacao_2)>0 then identificacao_2'
      '  else'
      '   identificacao_1'
      ' end identificacao'
      'from movimentacao_animal a'
      'join animal an on an.id=a.id_animal'
      'join currais o on o.id=a.id_pasto_origem'
      'join currais d on d.id=a.id_pasto_destino'
      'join AUX_MOTIVO_MOVIMENTACAO m on m.id=a.id_motivo')
    Left = 392
    Top = 112
    object MOVIMENTACAO_ANIMALID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object MOVIMENTACAO_ANIMALID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
    end
    object MOVIMENTACAO_ANIMALID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'ID_ANIMAL'
    end
    object MOVIMENTACAO_ANIMALID_PASTO_ORIGEM: TIntegerField
      FieldName = 'ID_PASTO_ORIGEM'
      Origin = 'ID_PASTO_ORIGEM'
    end
    object MOVIMENTACAO_ANIMALID_PASTO_DESTINO: TIntegerField
      FieldName = 'ID_PASTO_DESTINO'
      Origin = 'ID_PASTO_DESTINO'
    end
    object MOVIMENTACAO_ANIMALDATA: TDateField
      FieldName = 'DATA'
      Origin = 'DATA'
    end
    object MOVIMENTACAO_ANIMALID_MOTIVO: TIntegerField
      FieldName = 'ID_MOTIVO'
      Origin = 'ID_MOTIVO'
    end
    object MOVIMENTACAO_ANIMALDATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
    end
    object MOVIMENTACAO_ANIMALPESO_ENTRADA: TBCDField
      FieldName = 'PESO_ENTRADA'
      Origin = 'PESO_ENTRADA'
      Precision = 15
      Size = 2
    end
    object MOVIMENTACAO_ANIMALPESO_SAIDA_PROJ: TBCDField
      FieldName = 'PESO_SAIDA_PROJ'
      Origin = 'PESO_SAIDA_PROJ'
      Precision = 15
      Size = 2
    end
    object MOVIMENTACAO_ANIMALDIAS: TIntegerField
      FieldName = 'DIAS'
      Origin = 'DIAS'
    end
    object MOVIMENTACAO_ANIMALORIGEM_DADOS: TIntegerField
      FieldName = 'ORIGEM_DADOS'
      Origin = 'ORIGEM_DADOS'
    end
    object MOVIMENTACAO_ANIMALTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
    object MOVIMENTACAO_ANIMALSYNC: TIntegerField
      FieldName = 'SYNC'
      Origin = 'SYNC'
    end
    object MOVIMENTACAO_ANIMALOrigem: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Origem'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object MOVIMENTACAO_ANIMALDestino: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Destino'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object MOVIMENTACAO_ANIMALMotivo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Motivo'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object MOVIMENTACAO_ANIMALidentificacao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'identificacao'
      Origin = 'identificacao'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object AUX_MOTIVO_MOVIMENTACAO: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'SELECT * FROM AUX_MOTIVO_MOVIMENTACAO')
    Left = 392
    Top = 160
    object AUX_MOTIVO_MOVIMENTACAOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object AUX_MOTIVO_MOVIMENTACAONOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object AUX_MOTIVO_MOVIMENTACAOID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
    object AUX_MOTIVO_MOVIMENTACAODATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object AUX_MOTIVO_MOVIMENTACAOSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
  end
end
