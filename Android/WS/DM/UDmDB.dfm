object dmDB: TdmDB
  OldCreateOrder = False
  Height = 410
  Width = 583
  object USERS: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select * from users'
      'where status>-1 ')
    Left = 48
    Top = 16
  end
  object PROPRIEDADES: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select * from propriedades'
      'where propria=1 and status>-1')
    Left = 48
    Top = 72
  end
  object CURRAIS: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select * from currais b'
      'WHERE B.status=1 ')
    Left = 48
    Top = 136
  end
  object ALIMENTO: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select * from alimento'
      'where status=1')
    Left = 48
    Top = 189
  end
  object RACA: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select * from raca'
      'where status=1')
    Left = 200
    Top = 40
  end
  object CATEGORIAS: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select c.* from categorias c')
    Left = 200
    Top = 96
  end
  object CATEGORIA_PADRAO: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select c.* from categoria_padrao c')
    Left = 200
    Top = 160
  end
  object PRODUTORES: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select * from produtores'
      'where id_propriedade in('
      ' select id from propriedades'
      ' where status=1 and propria=1)')
    Left = 208
    Top = 224
  end
  object AUX_REBANHO: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select * from AUX_REBANHO')
    Left = 200
    Top = 288
  end
  object ANIMAL: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT  '
      #39'INSERT INTO ANIMAL'#39'||'
      
        #39'(ID,ID_USUARIO, IDENTIFICACAO_1, IDENTIFICACAO_2, PESO_ENTRADA,' +
        ' PESO_ESTIMADO, ID_LOCAL, ID_LOTE, ID_RACA,'#39'||'
      
        #39'ID_CATEGORIA, ID_REBANHO, ID_PROPRIEDADE, ID_PRODUTOR, ID_CONTR' +
        'ATO,DATA_PROC,IDADE_MESES) VALUES('#39'||'
      ' ID||'#39','#39'||'
      ' ID_USUARIO||'#39','#39'||'
      ' '#39#39#39#39'||COALESCE(IDENTIFICACAO_1,'#39#39')||'#39#39#39#39'||'#39','#39'||'
      ' '#39#39#39#39'||COALESCE(IDENTIFICACAO_2,'#39#39')||'#39#39#39#39'||'#39','#39'|| '
      ' PESO_ENTRADA||'#39','#39'||'
      ' COALESCE(PESO_ESTIMADO,0)||'#39','#39'||'
      ' ID_LOCAL||'#39','#39'||'
      ' COALESCE(ID_LOTE,0)||'#39','#39'||'
      ' ID_RACA||'#39','#39'||'
      ' ID_CATEGORIA||'#39','#39'||'
      ' ID_REBANHO||'#39','#39'||'
      ' ID_PROPRIEDADE||'#39','#39'||'
      ' ID_PRODUTOR||'#39','#39'||'
      ' COALESCE(ID_CONTRATO,0)||'#39','#39'||'
      ' '#39#39#39#39'||CAST(DATA_PROC AS DATE)||'#39#39#39#39'||'#39','#39'||'
      ' IDADE_MESES||'#39');'#39' as InsertInto,'
      'ID_PROPRIEDADE'
      'FROM ANIMAL a '
      'where status=1')
    Left = 336
    Top = 48
    object ANIMALINSERTINTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'INSERTINTO'
      Origin = 'INSERTINTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 467
    end
    object ANIMALID_PROPRIEDADE: TIntegerField
      FieldName = 'ID_PROPRIEDADE'
      Origin = 'ID_PROPRIEDADE'
    end
  end
  object BEBEDOURO: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT a.*,b.ID_PROPRIEDADE FROM bebedouro A'
      'JOIN currais B ON A.id_pasto=B.id'
      'WHERE B.status=1 and a.status=1')
    Left = 344
    Top = 104
  end
  object COCHO: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT A.*,B.ID_PROPRIEDADE FROM cocho A'
      'JOIN currais B ON A.id_pasto=B.id'
      'WHERE B.status=1 and a.status=1')
    Left = 344
    Top = 152
  end
  object LIMPEZABEBEDOURO: TFDQuery
    CachedUpdates = True
    OnReconcileError = LIMPEZABEBEDOUROReconcileError
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select * from LIMPEZABEBEDOURO a'
      '')
    Left = 480
    Top = 40
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
  end
  object AUX_MOTIVO_MOVIMENTACAO: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT * FROM AUX_MOTIVO_MOVIMENTACAO')
    Left = 341
    Top = 216
  end
  object MOVIMENTACAO_ANIMAL: TFDQuery
    CachedUpdates = True
    OnReconcileError = MOVIMENTACAO_ANIMALReconcileError
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select'
      ' a.*'
      'from movimentacao_animal a')
    Left = 482
    Top = 88
  end
  object qryInsert: TFDQuery
    CachedUpdates = True
    OnReconcileError = qryInsertReconcileError
    Connection = frmPrincipal.FCon
    Left = 392
    Top = 304
  end
end
