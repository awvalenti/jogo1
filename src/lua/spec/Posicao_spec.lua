local Posicao = require 'logica.Posicao'

describe('Posicao', function()

  local p = Posicao.gerar(1, 2)

  it('permite obter linha', function()
    assert.equals(1, Posicao.linha(p))
  end)

  it('permite obter coluna', function()
    assert.equals(2, Posicao.coluna(p))
  end)

end)
