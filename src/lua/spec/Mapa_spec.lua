local Mapa = require('logica.Mapa')
local Posicao = require('logica.Posicao')

describe('Mapa', function()

  it('permite ler elementos nas devidas posições', function()
    local mapa = Mapa:new(
      '- - - - - \n' ..
      '- j - - - \n' ..
      '- - - - - \n' ..
      '- - - - - \n' ..
      '- o - o - \n' ..
      '- o - - - \n' ..
      ''
    )
    assert.equals('-', mapa:obter(Posicao.gerar(1, 1)))
    assert.equals('-', mapa:obter(Posicao.gerar(1, 2)))
    assert.equals('-', mapa:obter(Posicao.gerar(2, 1)))

    assert.equals('j', mapa:obter(Posicao.gerar(2, 2)))

    assert.equals('o', mapa:obter(Posicao.gerar(5, 2)))
    assert.equals('o', mapa:obter(Posicao.gerar(5, 4)))
    assert.equals('o', mapa:obter(Posicao.gerar(6, 2)))
  end)
end)
