object dmSync: TdmSync
  OldCreateOrder = False
  Height = 317
  Width = 482
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
    Connection = dmdb.FCon
    Left = 144
    Top = 24
  end
  object PROPRIEDADES: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from propriedades'
      'where propria=1 and status>-1')
    Left = 72
    Top = 72
  end
  object CURRAIS: TFDQuery
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from currais'
      'where status>-1 and id_propriedade=90001')
    Left = 72
    Top = 128
  end
  object ALIMENTO: TFDQuery
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from alimento'
      'where status=1')
    Left = 64
    Top = 189
  end
  object RACA: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from raca'
      'where status=1')
    Left = 232
    Top = 32
  end
  object CATEGORIAS: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select c.* from categorias c')
    Left = 232
    Top = 88
  end
  object CATEGORIA_PADRAO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select c.* from categoria_padrao c')
    Left = 232
    Top = 152
  end
  object PRODUTORES: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT * FROM PRODUTORES')
    Left = 232
    Top = 208
  end
  object AUX_REBANHO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from AUX_REBANHO')
    Left = 328
    Top = 24
  end
  object ANIMAIS: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    Left = 328
    Top = 88
  end
end
