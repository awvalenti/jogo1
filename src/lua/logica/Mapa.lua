local Posicao = require('logica.Posicao')

local Mapa = {}

function Mapa:new(em_texto)
  self.__index = self

  local lin = 1
  local col = 0
  local elementos = {}
  local altura = 0
  local largura = 0

  for i = 1, #em_texto do
    local caractere = em_texto:sub(i, i)
    if caractere == 'j' or caractere == 'o' then
      col = col + 1
      elementos[Posicao.gerar(lin, col)] = caractere
    elseif caractere == '-' then
      col = col + 1
    elseif caractere == '\n' then
      altura = lin
      largura = col
      lin = lin + 1
      col = 0
    end
  end

  return setmetatable({
    _elementos = elementos,
    _altura = altura,
    _largura = largura,
  }, self)
end

function Mapa:obter(posicao)
  return self._elementos[posicao] or '-'
end

function Mapa:altura()
  return self._altura
end

function Mapa:largura()
  return self._largura
end

return Mapa
