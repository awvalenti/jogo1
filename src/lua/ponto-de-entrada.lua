-- inclui diretório atual como raiz, permitindo fazer:
-- require 'modulo'
package.path = "../../../src/lua/?.lua;" .. package.path

js = require 'js'
tabuleiro = require 'logica.tabuleiro'
escrever = require 'graficos.escrever'

function desenhar_tabuleiro()
  saida = ''
  for i = 1, #tabuleiro do
    for j = 1, #tabuleiro[i] do
      saida = saida .. tabuleiro[i][j] .. ' '
    end
    saida = saida .. '\n'
  end
  escrever(saida)
end

function executar_movimento()
  linha_inicial = 2
  coluna_inicial = 1

  linha = linha_inicial
  coluna = coluna_inicial
  while tabuleiro[linha + 1][coluna] ~= 2 do
    linha = linha + 1
  end
  linha_final = linha
  coluna_final = coluna

  tabuleiro[linha_inicial][coluna_inicial] = 0
  tabuleiro[linha_final][coluna_final] = 1

  desenhar_tabuleiro()
end

js.global.executarMovimento = executar_movimento

desenhar_tabuleiro()
