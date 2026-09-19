local Mapa = require 'logica.Mapa'
local Posicao = require 'logica.Posicao'

describe('Mapa', function()

  local mapa = Mapa:new(
    '- - - \n' ..
    '- j - \n' ..
    'o - - \n' ..
    '- - o \n' ..
    ''
  )

  context('altura', function()
    it('informa quantidade de linhas', function()
      assert.equals(4, mapa:altura())
    end)
  end)

  context('largura', function()
    it('informa quantidade de colunas', function()
      assert.equals(3, mapa:largura())
    end)
  end)

  it('permite ler elementos nas devidas posições', function()

    assert.equals('-', mapa:obter(Posicao.gerar(1, 1)))
    assert.equals('-', mapa:obter(Posicao.gerar(1, 2)))
    assert.equals('-', mapa:obter(Posicao.gerar(1, 3)))

    assert.equals('-', mapa:obter(Posicao.gerar(2, 1)))
    assert.equals('j', mapa:obter(Posicao.gerar(2, 2)))
    assert.equals('-', mapa:obter(Posicao.gerar(2, 3)))

    assert.equals('o', mapa:obter(Posicao.gerar(3, 1)))
    assert.equals('-', mapa:obter(Posicao.gerar(3, 2)))
    assert.equals('-', mapa:obter(Posicao.gerar(3, 3)))

    assert.equals('-', mapa:obter(Posicao.gerar(4, 1)))
    assert.equals('-', mapa:obter(Posicao.gerar(4, 2)))
    assert.equals('o', mapa:obter(Posicao.gerar(4, 3)))

  end)
end)
