object dmUsuarios: TdmUsuarios
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 503
  Width = 649
  object sqlUsuarios: TFDQuery
    Connection = dmConexao.SQLConexao
    Left = 48
    Top = 48
  end
  object dspUsuarios: TDataSetProvider
    DataSet = sqlUsuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 120
    Top = 48
  end
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarios'
    Left = 184
    Top = 48
    object cdsUsuariosID: TStringField
      FieldName = 'ID'
      Size = 36
    end
    object cdsUsuariosNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsUsuariosLOGIN: TStringField
      FieldName = 'LOGIN'
    end
    object cdsUsuariosSENHA: TStringField
      FieldName = 'SENHA'
    end
    object cdsUsuariosSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object cdsUsuariosDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
  end
end
