local Posicao = require 'logica.Posicao'

local Tabuleiro = {}

function Tabuleiro:new(mapa)
  -- local matriz = {}
  local elementos = {}

  local pos_jogador
  for l = 1, mapa:altura() do
    -- matriz[l] = {}
    for c = 1, mapa:largura() do
      local pos_atual = Posicao.gerar(l, c)
      local elemento = mapa:obter(pos_atual)
      if elemento == 'j' then
        pos_jogador = pos_atual
      end
      -- matriz[l][c] = elemento
      elementos[pos_atual] = elemento
    end
  end

  local ret = {
    -- matriz = matriz,
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
  -- local m = self.matriz
  for l = 1, self._altura do
    for c = 1, self._largura do
      -- saida = saida .. m[i][j] .. ' '
      saida = saida .. self._elementos[Posicao.gerar(l, c)] .. ' '
    end
    saida = saida .. '\n'
  end
  return saida
end

function Tabuleiro:mover(direcao)

  -- dois bugs a resolver:
  -- - quando encostado em parede ou obstáculo desde o início do movimento
  -- - quando passa novamente por onde o jogador começou a fase

  local incremento = ({
    ESQUERDA = Posicao.gerar(0, -1),
    DIREITA = Posicao.gerar(0, 1),
    BAIXO = Posicao.gerar(1, 0),
    CIMA = Posicao.gerar(-1, 0),
  })[direcao]

  -- local m = self.matriz

  local altura, largura = self:dimensoes()

  -- m[Posicao.linha(self._pos_jogador)][Posicao.coluna(self._pos_jogador)] = '-'
  self._elementos[self._pos_jogador] = '-'
  while true do
    local proxima_pos = self._pos_jogador + incremento
    -- if not Posicao.eh_valida(proxima_pos, altura, largura) or m[Posicao.linha(proxima_pos)][Posicao.coluna(proxima_pos)] == 'o' then break end
    if not Posicao.eh_valida(proxima_pos, altura, largura) or self._elementos[proxima_pos] == 'o' then break end
    self._pos_jogador = proxima_pos
  end
  -- m[Posicao.linha(self._pos_jogador)][Posicao.coluna(self._pos_jogador)] = 'j'
  self._elementos[self._pos_jogador] = 'j'
end

return Tabuleiro
