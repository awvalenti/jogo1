local Posicao = require('logica.Posicao')

local Mapa = {}

function Mapa:new(em_texto)
  self.__index = self

  local lin = 0
  local col = 0
  local linha_em_construcao = {}
  local matriz = {}
  local altura = 0
  local largura = 0

  for i = 1, #em_texto do
    local caractere = em_texto:sub(i, i)
    if caractere == 'j' or caractere == 'o' then
      col = col + 1
      linha_em_construcao[col] = caractere
    elseif caractere == '-' then
      col = col + 1
    elseif caractere == '\n' then
      lin = lin + 1
      matriz[lin] = linha_em_construcao
      altura = lin
      largura = col
      linha_em_construcao = {}
      col = 0
    end
  end

  return setmetatable({
    _matriz = matriz,
    _altura = altura,
    _largura = largura,
  }, self)
end

function Mapa:obter(posicao)
  return self._matriz[Posicao.linha(posicao)][Posicao.coluna(posicao)] or '-'
end

function Mapa:altura()
  return self._altura
end

function Mapa:largura()
  return self._largura
end

return Mapa
