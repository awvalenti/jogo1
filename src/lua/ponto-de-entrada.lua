local Tabuleiro = require 'logica.Tabuleiro'
local AdaptadorNavegador = require 'graficos.AdaptadorNavegador'

local tabuleiro = Tabuleiro:new()
local adaptador_navegador = AdaptadorNavegador:new(tabuleiro)

adaptador_navegador:atualizar_tabuleiro(tabuleiro:em_texto())
