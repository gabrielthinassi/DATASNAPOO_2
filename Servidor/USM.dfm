object SM: TSM
  OldCreateOrder = False
  Height = 358
  Width = 511
  object CON_FB: TSQLConnection
    ConnectionName = 'CON_FB'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver240.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver240.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      
        'Database=127.0.0.1/3054:C:\TRABALHO\PROVANOVA\DATASNAPOO\Dados\D' +
        'ADOSDS.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    Connected = True
    Left = 49
    Top = 38
  end
  object SQLContato: TSQLDataSet
    CommandText = 
      'select'#13#10'    CONTATO.CODIGO_CONTATO,'#13#10'    CONTATO.NOME_CONTATO,'#13#10 +
      '    CONTATO.DTNASCIMENTO_CONTATO'#13#10'from CONTATO'#13#10'where CONTATO.CO' +
      'DIGO_CONTATO = :CODIGO_CONTATO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO_CONTATO'
        ParamType = ptInput
      end>
    SQLConnection = CON_FB
    Left = 64
    Top = 120
    object SQLContatoCODIGO_CONTATO: TIntegerField
      FieldName = 'CODIGO_CONTATO'
      Required = True
    end
    object SQLContatoNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Required = True
      Size = 40
    end
    object SQLContatoDTNASCIMENTO_CONTATO: TDateField
      FieldName = 'DTNASCIMENTO_CONTATO'
    end
  end
  object DSPContato: TDataSetProvider
    DataSet = SQLContato
    Options = [poCascadeDeletes, poCascadeUpdates, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 64
    Top = 176
  end
  object SQLConsulta: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = CON_FB
    Left = 184
    Top = 120
  end
  object DSPConsulta: TDataSetProvider
    DataSet = SQLConsulta
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 184
    Top = 176
  end
  object SQLExecuteReader: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = CON_FB
    Left = 304
    Top = 120
  end
  object DSPExecuteReader: TDataSetProvider
    DataSet = SQLExecuteReader
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 304
    Top = 176
  end
  object CDSExecuteReader: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPExecuteReader'
    Left = 304
    Top = 240
  end
  object SQLProximoCodigo: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = CON_FB
    Left = 408
    Top = 120
  end
  object DSPProximoCodigo: TDataSetProvider
    DataSet = SQLProximoCodigo
    Options = [poReadOnly, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 176
  end
  object CDSProximoCodigo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPProximoCodigo'
    Left = 408
    Top = 240
  end
  object DSEndereco: TDataSource
    DataSet = SQLContato
    Left = 28
    Top = 232
  end
  object DSTelefone: TDataSource
    DataSet = SQLContato
    Left = 98
    Top = 232
  end
  object SQLEndereco: TSQLDataSet
    CommandText = 
      'select'#13#10'    CONTATO_ENDERECO.CODIGO_ENDERECO,'#13#10'    CONTATO_ENDER' +
      'ECO.RUA_ENDERECO,'#13#10'    CONTATO_ENDERECO.NUMERO_ENDERECO,'#13#10'    CO' +
      'NTATO_ENDERECO.CONTATO_CODCONTATO'#13#10'from CONTATO_ENDERECO'#13#10'where ' +
      'CONTATO_ENDERECO.CONTATO_CODCONTATO = :CODIGO_CONTATO'
    DataSource = DSEndereco
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO_CONTATO'
        ParamType = ptInput
      end>
    SQLConnection = CON_FB
    Left = 28
    Top = 288
    object SQLEnderecoCODIGO_ENDERECO: TIntegerField
      FieldName = 'CODIGO_ENDERECO'
      Required = True
    end
    object SQLEnderecoRUA_ENDERECO: TStringField
      FieldName = 'RUA_ENDERECO'
      Required = True
      Size = 30
    end
    object SQLEnderecoNUMERO_ENDERECO: TStringField
      FieldName = 'NUMERO_ENDERECO'
      Size = 5
    end
    object SQLEnderecoCONTATO_CODCONTATO: TIntegerField
      FieldName = 'CONTATO_CODCONTATO'
      Required = True
    end
  end
  object SQLTelefone: TSQLDataSet
    CommandText = 
      'select'#13#10'    CONTATO_TELEFONE.CODIGO_TELEFONE,'#13#10'    CONTATO_TELEF' +
      'ONE.NUMERO_TELEFONE,'#13#10'    CONTATO_TELEFONE.CONTATO_CODCONTATO'#13#10'f' +
      'rom CONTATO_TELEFONE'#13#10'where CONTATO_TELEFONE.CONTATO_CODCONTATO ' +
      '= :CODIGO_CONTATO'
    DataSource = DSTelefone
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO_CONTATO'
        ParamType = ptInput
      end>
    SQLConnection = CON_FB
    Left = 98
    Top = 288
    object SQLTelefoneCODIGO_TELEFONE: TIntegerField
      FieldName = 'CODIGO_TELEFONE'
      Required = True
    end
    object SQLTelefoneNUMERO_TELEFONE: TStringField
      FieldName = 'NUMERO_TELEFONE'
      Required = True
      Size = 11
    end
    object SQLTelefoneCONTATO_CODCONTATO: TIntegerField
      FieldName = 'CONTATO_CODCONTATO'
      Required = True
    end
  end
end
