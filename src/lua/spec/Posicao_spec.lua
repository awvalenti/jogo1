local Posicao = require 'logica.Posicao'

describe('Posicao', function()

  context('.gerar', function()

    it('combina linha e coluna em número inteiro único', function()
      assert.equals(102, Posicao.gerar(1, 2))
    end)

    it('aceita linha e coluna com até dois dígitos decimais', function()
      assert.equals(9876, Posicao.gerar(98, 76))
      assert.equals(9999, Posicao.gerar(99, 99))
    end)

  end)

  context('.linha', function()
    it('extrai linha de posição (dois primeiros dígitos decimais)', function()
      assert.equals(12, Posicao.linha(1234))
    end)
  end)

  context('.coluna', function()
    it('extrai coluna de posição (dois últimos dígitos decimais)', function()
      assert.equals(78, Posicao.coluna(5678))
    end)
  end)

  context('+', function()

    it('soma linha e coluna de ambas as posições', function()
      local pos_10_20 = Posicao.gerar(10, 20)
      local pos_30_40 = Posicao.gerar(30, 40)
      assert.equals(4060, pos_10_20 + pos_30_40)
    end)

    it('também funciona com números negativos', function()

      local pos_5_9 = Posicao.gerar(5, 9)

      local voltar_linha = Posicao.gerar(-1, 0)
      local voltar_coluna = Posicao.gerar(0, -1)
      local voltar_ambas_linha_e_coluna = Posicao.gerar(-1, -1)

      local pos_4_9 = pos_5_9 + voltar_linha
      local pos_5_8 = pos_5_9 + voltar_coluna
      local pos_4_8 = pos_5_9 + voltar_ambas_linha_e_coluna

      assert.equals(409, pos_4_9)
      assert.equals(508, pos_5_8)
      assert.equals(408, pos_4_8)

    end)

  end)

  context('.eh_valida', function()

    context('para posição < 1', function()
      it('dá falso', function()
        assert.is_false(Posicao.eh_valida(0001, 40, 30))
        assert.is_false(Posicao.eh_valida(0100, 40, 30))
        assert.is_false(Posicao.eh_valida(-0001, 40, 30))
        assert.is_false(Posicao.eh_valida(-0100, 40, 30))
      end)
    end)

    context('para 1 <= posição <= altura/largura', function()
      it('dá verdadeiro', function()
        assert.is_true(Posicao.eh_valida(0101, 40, 30))
        assert.is_true(Posicao.eh_valida(4030, 40, 30))
      end)
    end)

    context('para posição > altura/largura', function()
      it('dá falso', function()
        assert.is_false(Posicao.eh_valida(4130, 40, 30))
        assert.is_false(Posicao.eh_valida(4031, 40, 30))
      end)
    end)

  end)

end)
