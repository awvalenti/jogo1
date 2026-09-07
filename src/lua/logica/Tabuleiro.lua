local Tabuleiro = {}

function Tabuleiro:new(em_texto)
  local matriz = {}

  em_texto = em_texto:gsub(' ', '')

  local i = 1
  for linha in em_texto:gmatch('[^\n]+') do
    local j = 1
    matriz[i] = {}
    for elemento in linha:gmatch('.') do
      if elemento == 'p' then
        linha_protagonista = i
        coluna_protagonista = j
      end
      matriz[i][j] = elemento
      j = j + 1
    end
    i = i + 1
  end

  local ret = {
    matriz = matriz,
    linha_protagonista = linha_protagonista,
    coluna_protagonista = coluna_protagonista,
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

  local linha = self.linha_protagonista
  local coluna = self.coluna_protagonista
  local m = self.matriz

  m[self.linha_protagonista][self.coluna_protagonista] = '-'

  while m[linha + 1][coluna] ~= 'o' do
    linha = linha + 1
  end
  self.linha_protagonista = linha
  self.coluna_protagonista = coluna
  m[self.linha_protagonista][self.coluna_protagonista] = 'p'
end

return Tabuleiro
