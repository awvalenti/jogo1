local Tabuleiro = require 'logica.Tabuleiro'
local Mapa = require 'logica.Mapa'

describe('Tabuleiro', function()

  local tabuleiro = Tabuleiro:new(Mapa:new(
    '- - - - - \n' ..
    '- j - - - \n' ..
    '- - - - - \n' ..
    '- - - - - \n' ..
    '- o - o - \n' ..
    '- o - - - \n' ..
    ''
  ))

  context('dimensoes', function()
    it('informa quantidade de linhas e colunas', function()
      assert.same({ 6, 5 }, { tabuleiro:dimensoes() })
    end)
  end)

  context('em_texto', function()
    it('converte estado atual do tabuleiro para texto', function()
      assert.equals(
        '- - - - - \n' ..
        '- j - - - \n' ..
        '- - - - - \n' ..
        '- - - - - \n' ..
        '- o - o - \n' ..
        '- o - - - \n' ..
        '',
        tabuleiro:em_texto())
    end)
  end)

  context('mover', function()
    it('calcula novo tabuleiro com movimento feito', function()
      tabuleiro:mover('baixo')
      assert.equals('' ..
        '- - - - - \n' ..
        '- - - - - \n' ..
        '- - - - - \n' ..
        '- j - - - \n' ..
        '- o - o - \n' ..
        '- o - - - \n' ..
      '', tabuleiro:em_texto())
    end)
  end)

end)
