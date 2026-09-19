local Mapa = require 'logica.Mapa'
local Tabuleiro = require 'logica.Tabuleiro'
local AdaptadorNavegador = require 'graficos.AdaptadorNavegador'

local tabuleiro = Tabuleiro:new(Mapa:new(
  '- - - - - \n' ..
  '- j - - - \n' ..
  '- - - - - \n' ..
  '- - - - - \n' ..
  '- o - o - \n' ..
  '- o - - - \n' ..
  ''
))

local adaptador_navegador = AdaptadorNavegador:new(tabuleiro)

adaptador_navegador:atualizar_tabuleiro(tabuleiro:em_texto())
