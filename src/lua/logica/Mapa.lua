local Mapa = {}

function Mapa:new(em_texto)
  local ret = {
    matriz = {},
  }
  self.__index = self

  local linha = 1
  local coluna = 1

  ret.matriz[1] = {}
  for i = 1, #em_texto do
    local caractere = em_texto:sub(i, i)
    if caractere == 'j' or caractere == 'o' then
      ret.matriz[linha][coluna] = caractere
    elseif caractere == ' ' then
      coluna = coluna + 1
    elseif caractere == '\n' then
      linha = linha + 1
      ret.matriz[linha] = {}
      coluna = 1
    end

  end

  return setmetatable(ret, self)
end

function Mapa:obter(linha, coluna)
  local armazenado = self.matriz[linha][coluna]
  return armazenado == nil and '-' or armazenado
end

return Mapa
