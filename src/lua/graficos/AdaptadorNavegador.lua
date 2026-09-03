local js = require 'js'

local AdaptadorNavegador = {}

function AdaptadorNavegador:new(tabuleiro)
  local ret = { tabuleiro = tabuleiro }
  self.__index = self
  js.global.executarMovimento =
    function()
      ret.tabuleiro:mover()
      ret:atualizar_tabuleiro()
    end
  return setmetatable(ret, self)
end

function AdaptadorNavegador:atualizar_tabuleiro()
  js.global:atualizarTabuleiro(self.tabuleiro:em_texto())
end

return AdaptadorNavegador
