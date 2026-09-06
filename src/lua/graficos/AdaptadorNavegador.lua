local js = require 'js'

local AdaptadorNavegador = {}

function AdaptadorNavegador:new(tabuleiro)
  local ret = { tabuleiro = tabuleiro }
  self.__index = self
  js.global.processarEntrada =
    function(_, direcao)
      ret.tabuleiro:mover(direcao)
      ret:atualizar_tabuleiro(direcao)
    end
  return setmetatable(ret, self)
end

function AdaptadorNavegador:atualizar_tabuleiro()
  js.global:desenharTabuleiro(self.tabuleiro:em_texto())
end

return AdaptadorNavegador
