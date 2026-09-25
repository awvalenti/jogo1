local Posicao = require 'logica.Posicao'

return {
  ESQUERDA = Posicao.gerar(0, -1),
  DIREITA = Posicao.gerar(0, 1),
  BAIXO = Posicao.gerar(1, 0),
  CIMA = Posicao.gerar(-1, 0),
}
