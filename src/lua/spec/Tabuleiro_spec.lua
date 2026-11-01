local Tabuleiro = require 'logica.Tabuleiro'
local Mapa = require 'logica.Mapa'
local Direcao = require 'logica.Direcao'

local ESQUERDA = Direcao.ESQUERDA
local CIMA = Direcao.CIMA
local DIREITA = Direcao.DIREITA
local BAIXO = Direcao.BAIXO

describe('Tabuleiro', function()
  local tab_exemplo

  before_each(function()
    tab_exemplo = Tabuleiro:new(Mapa:new(
      '- - - \n' ..
      'o - j \n' ..
      ''
    ))
  end)

  context(':dimensoes', function()
    it('informa quantidade de linhas e colunas', function()
      assert.same({ 2, 3 }, { tab_exemplo:dimensoes() })
    end)
  end)

  context(':em_texto', function()
    it('converte estado atual do tabuleiro para texto', function()
      assert.equals(
        '- - - \n' ..
        'o - j \n' ..
        '',
        tab_exemplo:em_texto())
    end)
  end)

    context(':mover', function()

      local function mover(mapa_em_texto, direcoes)
        local tab = Tabuleiro:new(Mapa:new(mapa_em_texto))
        for i = 1, #direcoes do
          tab:mover(direcoes[i])
        end
        return tab:em_texto()
      end

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
          local inicial = caso_de_teste[1]
          local direcao = caso_de_teste[2]
          local final = caso_de_teste[3]
          context(direcao, function()
            it(string.format('move jogador para %s até bater em obstáculo', direcao), function()
              assert.equals(final, mover(inicial, { direcao }))
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
          local inicial = caso_de_teste[1]
          local direcao = caso_de_teste[2]
          local final = caso_de_teste[3]
          context(direcao, function()
            it(string.format('move jogador para %s até chegar à borda', direcao), function()
              assert.equals(final, mover(inicial, { direcao }))
            end)
          end)
        end
      end)

      context('quando passa pela posição inicial', function()
        it('segue o caminho livremente', function()
          assert.equals(
            '- - - - - j \n',
            mover('- - j - - - \n', { ESQUERDA, DIREITA })
          )
        end)
      end)

      context('quando já está adjacente a parede ou obstáculo e tenta mover-se naquela direção', function()
        it('nada acontece', function()
          for _, caso_de_teste in ipairs({
            { 'j - - \n', ESQUERDA, 'j - - \n', },
            { '- j o \n', DIREITA, '- j o \n', },
          }) do
            local inicial = caso_de_teste[1]
            local direcao = caso_de_teste[2]
            local final = caso_de_teste[3]
            assert.equals(final, mover(inicial, { direcao }))
          end
        end)
      end)

    end)

end)
