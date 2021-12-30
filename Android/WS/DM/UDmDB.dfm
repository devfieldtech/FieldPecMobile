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
      'SELECT * FROM CURRAIS WHERE STATUS>-1')
    Left = 48
    Top = 136
  end
  object ALIMENTO: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select * from alimento'
      'where status=1')
    Left = 64
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
      ' '#39#39#39#39'||COALESCE(IDENTIFICACAO_2,'#39#39')||'#39#39#39#39'||'#39','#39'||'
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
    Left = 312
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
end
