local js = require 'js'
local Direcao = require 'logica.Direcao'

local AdaptadorNavegador = {}

function AdaptadorNavegador:new(tabuleiro)
  local ret = { tabuleiro = tabuleiro }
  self.__index = self
  js.global.processarEntrada =
    function(_, direcaoEmTexto)
      local direcaoEmPosicao = Direcao[direcaoEmTexto]
      ret.tabuleiro:mover(direcaoEmPosicao)
      ret:atualizar_tabuleiro()
    end
  return setmetatable(ret, self)
end

function AdaptadorNavegador:atualizar_tabuleiro()
  js.global:desenharTabuleiro(self.tabuleiro:em_texto())
end

return AdaptadorNavegador
