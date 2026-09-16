local Mapa = require('logica.Mapa')

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
    assert.equals('-', mapa:obter(1, 1))
    assert.equals('-', mapa:obter(1, 2))
    assert.equals('-', mapa:obter(2, 1))

    assert.equals('j', mapa:obter(2, 2))

    assert.equals('o', mapa:obter(5, 2))
    assert.equals('o', mapa:obter(5, 4))
    assert.equals('o', mapa:obter(6, 2))
  end)
end)
