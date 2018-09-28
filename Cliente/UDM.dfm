object DM: TDM
  OldCreateOrder = False
  Height = 271
  Width = 415
  object CON_DS: TSQLConnection
    ConnectionName = 'CON_DS'
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=DataSnap'
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=211'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=24.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b')
    Left = 48
    Top = 40
    UniqueId = '{B75BF8EF-83AE-4672-8B4C-1EF31D244314}'
  end
  object DSPCContato: TDSProviderConnection
    ServerClassName = 'TSM'
    SQLConnection = CON_DS
    Left = 48
    Top = 120
  end
  object CDSContato: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPContato'
    RemoteServer = DSPCContato
    Left = 48
    Top = 192
    object CDSContatoCODIGO_CONTATO: TIntegerField
      FieldName = 'CODIGO_CONTATO'
    end
    object CDSContatoNOME_CONTATO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME_CONTATO'
      Required = True
      Size = 40
    end
    object CDSContatoDTNASCIMENTO_CONTATO: TDateField
      DisplayLabel = 'Nascimento'
      FieldName = 'DTNASCIMENTO_CONTATO'
      EditMask = '!99/99/9999;1;_'
    end
    object CDSContatoSQLTelefone: TDataSetField
      FieldName = 'SQLTelefone'
    end
    object CDSContatoSQLEndereco: TDataSetField
      FieldName = 'SQLEndereco'
    end
  end
  object CDSEndereco: TClientDataSet
    Aggregates = <>
    DataSetField = CDSContatoSQLEndereco
    Params = <>
    RemoteServer = DSPCContato
    Left = 120
    Top = 192
    object CDSEnderecoCODIGO_ENDERECO: TIntegerField
      FieldName = 'CODIGO_ENDERECO'
    end
    object CDSEnderecoRUA_ENDERECO: TStringField
      FieldName = 'RUA_ENDERECO'
      Required = True
      Size = 30
    end
    object CDSEnderecoNUMERO_ENDERECO: TStringField
      FieldName = 'NUMERO_ENDERECO'
      Size = 5
    end
    object CDSEnderecoCONTATO_CODCONTATO: TIntegerField
      FieldName = 'CONTATO_CODCONTATO'
      Required = True
    end
  end
  object CDSTelefone: TClientDataSet
    Aggregates = <>
    DataSetField = CDSContatoSQLTelefone
    Params = <>
    RemoteServer = DSPCContato
    Left = 192
    Top = 192
    object CDSTelefoneCODIGO_TELEFONE: TIntegerField
      FieldName = 'CODIGO_TELEFONE'
    end
    object CDSTelefoneNUMERO_TELEFONE: TStringField
      FieldName = 'NUMERO_TELEFONE'
      Required = True
      EditMask = '!\(99\)00000-0000;0;_'
      Size = 11
    end
    object CDSTelefoneCONTATO_CODCONTATO: TIntegerField
      FieldName = 'CONTATO_CODCONTATO'
      Required = True
    end
  end
  object CDSConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPConsulta'
    RemoteServer = DSPCContato
    Left = 192
    Top = 120
  end
end
