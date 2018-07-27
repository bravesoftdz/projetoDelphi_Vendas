object uDMConnection: TuDMConnection
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 128
  Width = 147
  object FDconnection: TFDConnection
    Params.Strings = (
      'DriverID=PG'
      'User_Name=postgres')
    Left = 56
    Top = 32
  end
end
