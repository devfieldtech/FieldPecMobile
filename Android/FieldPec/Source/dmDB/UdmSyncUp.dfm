object dmSyncUp: TdmSyncUp
  OldCreateOrder = False
  Height = 296
  Width = 466
  object LIMPEZABEBEDOURO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from LIMPEZABEBEDOURO a'
      'where sync=0'
      '')
    Left = 66
    Top = 16
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
  object MOVIMENTACAO_ANIMAL: TFDQuery
    Connection = dmdb.FCon
    SQL.Strings = (
      'select'
      ' a.*'
      ' from movimentacao_animal a'
      'where sync=0')
    Left = 202
    Top = 16
  end
  object QryAuxLoop: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    Left = 24
    Top = 232
  end
  object qryAux: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    Left = 104
    Top = 232
  end
end
