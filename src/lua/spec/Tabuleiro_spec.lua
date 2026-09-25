local Tabuleiro = require 'logica.Tabuleiro'
local Mapa = require 'logica.Mapa'
local Direcao = require 'logica.Direcao'

local ESQUERDA = Direcao.ESQUERDA
local CIMA = Direcao.CIMA
local DIREITA = Direcao.DIREITA
local BAIXO = Direcao.BAIXO

describe('Tabuleiro', function()
  local tabuleiro_com_obstaculos

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

      context('quando atinge obstáculo', function()
        for _, caso_de_teste in ipairs({
          {
            'o - - j - \n',
            ESQUERDA,
            'o j - - - \n',
          },
          {
            '- - - o - \n' ..
            '- - - - - \n' ..
            '- - - - - \n' ..
            '- - - j - \n' ..
            '',
            CIMA,
            '- - - o - \n' ..
            '- - - j - \n' ..
            '- - - - - \n' ..
            '- - - - - \n' ..
            '',
          },
          {
            '- j - - o \n',
            DIREITA,
            '- - - j o \n',
          },
          {
            '- - - j - \n' ..
            '- - - - - \n' ..
            '- - - - - \n' ..
            '- - - o - \n' ..
            '',
            BAIXO,
            '- - - - - \n' ..
            '- - - - - \n' ..
            '- - - j - \n' ..
            '- - - o - \n' ..
            '',
          },
        }) do
          local mapa_em_texto_inicial = caso_de_teste[1]
          local direcao = caso_de_teste[2]
          local mapa_em_texto_final = caso_de_teste[3]
          context(direcao, function()
            it(string.format('move jogador para %s até bater em obstáculo', direcao), function()
              local tabuleiro = Tabuleiro:new(Mapa:new(mapa_em_texto_inicial))
              tabuleiro:mover(direcao)
              assert.equals(mapa_em_texto_final, tabuleiro:em_texto())
            end)
          end)
        end
      end)

      context('quando atinge bordas', function()
        for _, caso_de_teste in ipairs({
          {
            '- - - j - \n',
            ESQUERDA,
            'j - - - - \n',
          },
          {
            '- - - - - \n' ..
            '- - - - - \n' ..
            '- - - j - \n' ..
            '',
            CIMA,
            '- - - j - \n' ..
            '- - - - - \n' ..
            '- - - - - \n' ..
            '',
          },
          {
            '- j - - - \n',
            DIREITA,
            '- - - - j \n',
          },
          {
            '- - - j - \n' ..
            '- - - - - \n' ..
            '- - - - - \n' ..
            '',
            BAIXO,
            '- - - - - \n' ..
            '- - - - - \n' ..
            '- - - j - \n' ..
            '',
          },
        }) do
          local mapa_em_texto_inicial = caso_de_teste[1]
          local direcao = caso_de_teste[2]
          local mapa_em_texto_final = caso_de_teste[3]
          context(direcao, function()
            it(string.format('move jogador para %s até chegar à borda', direcao), function()
              local tabuleiro = Tabuleiro:new(Mapa:new( mapa_em_texto_inicial))
              tabuleiro:mover(direcao)
              assert.equals(mapa_em_texto_final, tabuleiro:em_texto())
            end)
          end)
        end
      end)

      context('quando passa pela posição inicial', function()
        it('segue o caminho livremente', function()
          local inicial = '- - j - - - \n'
          local passo1 = ESQUERDA
          local passo2 = DIREITA
          local final = '- - - - - j \n'
          local tabuleiro = Tabuleiro:new(Mapa:new(inicial))
          tabuleiro:mover(passo1)
          tabuleiro:mover(passo2)
          assert.equals(final, tabuleiro:em_texto())
        end)
      end)

      context('quando já está adjacente a parede ou obstáculo e tenta mover-se naquela direção', function()
        it('nada acontece', function()
          for _, caso_de_teste in ipairs({
            {
              'j - - \n',
              ESQUERDA,
              'j - - \n',
            },
            {
              '- j o \n',
              DIREITA,
              '- j o \n',
            },
          }) do
            local inicial = caso_de_teste[1]
            local passo = caso_de_teste[2]
            local final = caso_de_teste[3]
            local tabuleiro = Tabuleiro:new(Mapa:new(inicial))
            tabuleiro:mover(passo)
            assert.equals(final, tabuleiro:em_texto())
          end
        end)
      end)

    end)

end)
