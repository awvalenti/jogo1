local Tabuleiro = require 'logica.Tabuleiro'
local Mapa = require 'logica.Mapa'

describe('Tabuleiro', function()
  local tabuleiro_com_obstaculos, tabuleiro_livre

  before_each(function()
    tabuleiro_com_obstaculos = Tabuleiro:new(Mapa:new(
      '- - - - o - - - \n' ..
      '- - - - - - - - \n' ..
      '- - - - - - - - \n' ..
      'o - - - j - - o \n' ..
      '- - - - - - - - \n' ..
      '- - - - - - - - \n' ..
      '- - - - o - - - \n' ..
      ''
    ))
    tabuleiro_livre = Tabuleiro:new(Mapa:new(
      '- - - - - - - - \n' ..
      '- - - - - - - - \n' ..
      '- - - - - - - - \n' ..
      '- - - - j - - - \n' ..
      '- - - - - - - - \n' ..
      '- - - - - - - - \n' ..
      '- - - - - - - - \n' ..
      ''
    ))
  end)

  context(':dimensoes', function()
    it('informa quantidade de linhas e colunas', function()
      assert.same({ 7, 8 }, { tabuleiro_com_obstaculos:dimensoes() })
    end)
  end)

  context(':em_texto', function()
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
        tabuleiro_com_obstaculos:em_texto())
    end)
  end)

    context(':mover', function()

      context('quando passa por obstáculo', function()
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
              tabuleiro_com_obstaculos:mover(direcao)
              assert.equals(resultado, tabuleiro_com_obstaculos:em_texto())
            end)
          end)
        end
      end)

      context('quando passa por bordas', function()
        for _, caso_de_teste in ipairs({
          { 'ESQUERDA', '' ..
            '- - - - - - - - \n' ..
            '- - - - - - - - \n' ..
            '- - - - - - - - \n' ..
            'j - - - - - - - \n' ..
            '- - - - - - - - \n' ..
            '- - - - - - - - \n' ..
            '- - - - - - - - \n' ..
            '', },
          { 'CIMA', '' ..
            '- - - - j - - - \n' ..
            '- - - - - - - - \n' ..
            '- - - - - - - - \n' ..
            '- - - - - - - - \n' ..
            '- - - - - - - - \n' ..
            '- - - - - - - - \n' ..
            '- - - - - - - - \n' ..
            '', },
          { 'DIREITA', '' ..
          '- - - - - - - - \n' ..
          '- - - - - - - - \n' ..
          '- - - - - - - - \n' ..
          '- - - - - - - j \n' ..
          '- - - - - - - - \n' ..
          '- - - - - - - - \n' ..
          '- - - - - - - - \n' ..
          '', },
          { 'BAIXO', '' ..
          '- - - - - - - - \n' ..
          '- - - - - - - - \n' ..
          '- - - - - - - - \n' ..
          '- - - - - - - - \n' ..
          '- - - - - - - - \n' ..
          '- - - - - - - - \n' ..
          '- - - - j - - - \n' ..
          '', },
        }) do
          local direcao = caso_de_teste[1]
          local resultado = caso_de_teste[2]
          context(direcao, function()
            it(string.format('move jogador para %s até chegar à borda', direcao), function()
              tabuleiro_livre:mover(direcao)
              assert.equals(resultado, tabuleiro_livre:em_texto())
            end)
          end)
        end
      end)

    end)

end)
