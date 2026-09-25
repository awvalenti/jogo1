local Posicao = require 'logica.Posicao'

local Tabuleiro = {}

function Tabuleiro:new(mapa)
  local elementos = {}

  local pos_jogador
  for l = 1, mapa:altura() do
    for c = 1, mapa:largura() do
      local pos_atual = Posicao.gerar(l, c)
      local elemento = mapa:obter(pos_atual)
      if elemento == 'j' then
        pos_jogador = pos_atual
      end
      elementos[pos_atual] = elemento
    end
  end

  local ret = {
    _elementos = elementos,
    _pos_jogador = pos_jogador,
    _altura = mapa:altura(),
    _largura = mapa:largura(),
  }
  self.__index = self
  return setmetatable(ret, self)
end

function Tabuleiro:dimensoes()
  return self._altura, self._largura
end

function Tabuleiro:em_texto()
  local saida = ''
  for l = 1, self._altura do
    for c = 1, self._largura do
      saida = saida .. self._elementos[Posicao.gerar(l, c)] .. ' '
    end
    saida = saida .. '\n'
  end
  return saida
end

function Tabuleiro:mover(direcao)

  local altura, largura = self:dimensoes()

  self._elementos[self._pos_jogador] = '-'
  while true do
    local proxima_pos = self._pos_jogador + direcao
    if not Posicao.eh_valida(proxima_pos, altura, largura) or self._elementos[proxima_pos] == 'o' then break end
    self._pos_jogador = proxima_pos
  end
  self._elementos[self._pos_jogador] = 'j'
end

return Tabuleiro
