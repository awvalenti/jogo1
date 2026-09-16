local Posicao = {}

function Posicao.gerar(linha, coluna)
  return 100 * linha + coluna
end

function Posicao.linha(p)
  return p // 100
end

function Posicao.coluna(p)
  return p % 100
end

return Posicao
