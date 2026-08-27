Classe = {}

function Classe:new()
  ret = { chave1 = 'valor1', chave2 = 'valor2' }
  self.__index = self
  return setmetatable(ret, self)
end

function Classe:metodo1()
  print(self.chave1, self.chave2)
end

return Classe
