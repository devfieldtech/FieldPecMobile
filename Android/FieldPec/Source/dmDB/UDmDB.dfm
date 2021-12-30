object dmdb: Tdmdb
  OldCreateOrder = False
  Height = 402
  Width = 503
  object FCon: TFDConnection
    Params.Strings = (
      'Database=E:\Projetos2021\Field\Android\FieldPec\db\Field.db3'
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
      'select * from currais'
      'where status>-1 ')
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
    Left = 192
    Top = 88
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
    Left = 192
    Top = 144
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
    Left = 192
    Top = 208
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
    Left = 192
    Top = 264
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
end
