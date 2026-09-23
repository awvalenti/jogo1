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

function Posicao.eh_valida(p, altura, largura)
  local l, c = Posicao.linha(p), Posicao.coluna(p)
  return l >= 1 and l <= altura and c >= 1 and c <= largura
end

return Posicao
