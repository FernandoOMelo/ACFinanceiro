object dmConexao: TdmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 400
  Width = 593
  object SQLConexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Fontes\Cursos\Delphi\ACFinanceiro\ACFinanceiro\src\d' +
        'b\SistemaFinanceiro.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 136
    Top = 120
  end
  object FDQuery1: TFDQuery
    Connection = SQLConexao
    SQL.Strings = (
      'SELECT * FROM USUARIOS')
    Left = 240
    Top = 280
  end
end
