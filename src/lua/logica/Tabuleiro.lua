local Tabuleiro = {}

function Tabuleiro:new()
  local ret = {
    matriz = {
      { 0, 0, 0, },
      { 1, 0, 0, },
      { 0, 0, 0, },
      { 0, 0, 2, },
      { 2, 0, 0, },
      { 0, 0, 3, },
    }
  }
  self.__index = self
  return setmetatable(ret, self)
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

function Tabuleiro:mover()
  local linha_inicial = 2
  local coluna_inicial = 1
  local linha = linha_inicial
  local coluna = coluna_inicial
  local m = self.matriz

  while m[linha + 1][coluna] ~= 2 do
    linha = linha + 1
  end
  linha_final = linha
  coluna_final = coluna

  m[linha_inicial][coluna_inicial] = 0
  m[linha_final][coluna_final] = 1
end

return Tabuleiro
