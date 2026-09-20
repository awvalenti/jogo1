local Tabuleiro = require 'logica.Tabuleiro'
local Mapa = require 'logica.Mapa'

describe('Tabuleiro', function()
  local tabuleiro

  before_each(function()
    tabuleiro = Tabuleiro:new(Mapa:new(
      '- - - - o - - - \n' ..
      '- - - - - - - - \n' ..
      '- - - - - - - - \n' ..
      'o - - - j - - o \n' ..
      '- - - - - - - - \n' ..
      '- - - - - - - - \n' ..
      '- - - - o - - - \n' ..
      ''
    ))
  end)

  context('dimensoes', function()
    it('informa quantidade de linhas e colunas', function()
      assert.same({ 7, 8 }, { tabuleiro:dimensoes() })
    end)
  end)

  context('em_texto', function()
    it('converte estado atual do tabuleiro para texto', function()
      assert.equals(
        '- - - - o - - - \n' ..
        '- - - - - - - - \n' ..
        '- - - - - - - - \n' ..
        'o - - - j - - o \n' ..
        '- - - - - - - - \n' ..
        '- - - - - - - - \n' ..
        '- - - - o - - - \n' ..
        '',
        tabuleiro:em_texto())
    end)
  end)

  context('mover', function()
    for _, caso_de_teste in ipairs({
      { 'ESQUERDA', '' ..
        '- - - - o - - - \n' ..
        '- - - - - - - - \n' ..
        '- - - - - - - - \n' ..
        'o j - - - - - o \n' ..
        '- - - - - - - - \n' ..
        '- - - - - - - - \n' ..
        '- - - - o - - - \n' ..
        '', },
      { 'CIMA', '' ..
        '- - - - o - - - \n' ..
        '- - - - j - - - \n' ..
        '- - - - - - - - \n' ..
        'o - - - - - - o \n' ..
        '- - - - - - - - \n' ..
        '- - - - - - - - \n' ..
        '- - - - o - - - \n' ..
        '', },
      { 'DIREITA', '' ..
      '- - - - o - - - \n' ..
      '- - - - - - - - \n' ..
      '- - - - - - - - \n' ..
      'o - - - - - j o \n' ..
      '- - - - - - - - \n' ..
      '- - - - - - - - \n' ..
      '- - - - o - - - \n' ..
      '', },
      { 'BAIXO', '' ..
      '- - - - o - - - \n' ..
      '- - - - - - - - \n' ..
      '- - - - - - - - \n' ..
      'o - - - - - - o \n' ..
      '- - - - - - - - \n' ..
      '- - - - j - - - \n' ..
      '- - - - o - - - \n' ..
      '', },
    }) do
      local direcao = caso_de_teste[1]
      local resultado = caso_de_teste[2]

      context(direcao, function()
        it(string.format('move jogador para %s até bater em obstáculo', direcao), function()
          tabuleiro:mover(direcao)
          assert.equals(resultado, tabuleiro:em_texto())
        end)
      end)
    end
  end)
end)
