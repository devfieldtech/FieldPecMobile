object dmSync: TdmSync
  OldCreateOrder = False
  Height = 327
  Width = 797
  object USERS: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from users'
      'where status>-1 ')
    Left = 48
    Top = 16
  end
  object qryAux: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    Left = 120
    Top = 264
  end
  object PROPRIEDADES: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from propriedades'
      'where propria=1 and status>-1')
    Left = 48
    Top = 72
  end
  object CURRAIS: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from currais'
      'where status>-1 and id_propriedade=90001')
    Left = 48
    Top = 128
  end
  object ALIMENTO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from alimento'
      'where status=1')
    Left = 40
    Top = 189
  end
  object RACA: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from raca'
      'where status=1')
    Left = 136
    Top = 16
  end
  object CATEGORIAS: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select c.* from categorias c')
    Left = 136
    Top = 72
  end
  object CATEGORIA_PADRAO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select c.* from categoria_padrao c')
    Left = 136
    Top = 136
  end
  object PRODUTORES: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT * FROM PRODUTORES')
    Left = 128
    Top = 192
  end
  object AUX_REBANHO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from AUX_REBANHO')
    Left = 224
    Top = 16
  end
  object ANIMAIS: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    Left = 224
    Top = 80
  end
  object BEBEDOURO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select b.*,c.id_propriedade from BEBEDOURO b'
      'JOIN currais c ON b.id_pasto=c.id')
    Left = 224
    Top = 136
  end
  object COCHO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT a.*,b.id_propriedade FROM cocho A'
      'JOIN currais B ON A.id_pasto=B.id')
    Left = 224
    Top = 200
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
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 32
    Top = 264
  end
  object AUX_MOTIVO_MOVIMENTACAO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT * FROM AUX_MOTIVO_MOVIMENTACAO')
    Left = 349
    Top = 16
  end
end
