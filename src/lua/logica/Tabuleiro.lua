local Posicao = require('logica.Posicao')

local Tabuleiro = {}

function Tabuleiro:new(mapa)
  local matriz = {}

  local pos_jogador
  for l = 1, mapa:altura() do
    matriz[l] = {}
    for c = 1, mapa:largura() do
      local pos_atual = Posicao.gerar(l, c)
      local elemento = mapa:obter(pos_atual)
      if elemento == 'j' then
        pos_jogador = pos_atual
      end
      matriz[l][c] = elemento
    end
  end

  local ret = {
    matriz = matriz,
    pos_jogador = pos_jogador,
  }
  self.__index = self
  return setmetatable(ret, self)
end

function Tabuleiro:dimensoes()
  return #self.matriz, #self.matriz[1]
end

function Tabuleiro:em_texto()
  local saida = ''
  local m = self.matriz
  for i = 1, #m do
    for j = 1, #m[i] do
      saida = saida .. m[i][j] .. ' '
    end
    saida = saida .. '\n'
  end
  return saida
end

function Tabuleiro:mover(direcao)
  if direcao ~= 'baixo' then return end

  local linha = Posicao.linha(self.pos_jogador)
  local coluna = Posicao.coluna(self.pos_jogador)
  local m = self.matriz

  m[Posicao.linha(self.pos_jogador)][Posicao.coluna(self.pos_jogador)] = '-'

  while m[linha + 1][coluna] ~= 'o' do
    linha = linha + 1
  end
  self.linha_jogador = linha
  self.coluna_jogador = coluna
  m[self.linha_jogador][self.coluna_jogador] = 'j'
end

return Tabuleiro
