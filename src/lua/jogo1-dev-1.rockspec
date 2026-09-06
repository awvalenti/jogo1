package = "jogo1"
version = "dev-1"
source = {
   url = "git+ssh://git@github.com/awvalenti/jogo1.git"
}
description = {
   homepage = "https://github.com/awvalenti/jogo1.git",
   license = "UNLICENSED"
}
dependencies = {
   "lua ~> 5.3",
   "busted ~> 2.3.0-1",
}
build = {
   type = "builtin",
   modules = {
      ["graficos.AdaptadorNavegador"] = "graficos/AdaptadorNavegador.lua",
      ["logica.Tabuleiro"] = "logica/Tabuleiro.lua",
      ["ponto-de-entrada"] = "ponto-de-entrada.lua"
   }
}
