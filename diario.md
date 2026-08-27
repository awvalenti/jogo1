# 260808

## objetivos
- retomar o desenvolvimento
- verificar a viabililidade de rodar código lua no navegador

## anotações

repl de lua bem fácil de usar: https://seb-jones.github.io/lua-browser-repl/

este projeto parece ser o que eu procuro, um interpretador de lua simples feito
em js. é antigo, está há uns 13 a 14 anos sem atualizações: https://github.com/MaddieM4/weblua

este parece bom também e é mais recente: https://github.com/ceifa/wasmoon

este aqui parece bem completo, ativo e mais pretensioso:
https://github.com/fengari-lua/fengari . o lance dele é reescrever o código c de
lua em js.

já este componente do anterior teve seu último lançamento em 2018:
https://github.com/fengari-lua/fengari-web

# 260823

## objetivos

- [x] verificar se licença de fengari-web é compatível com nossos objetivos neste
  projeto
  - caso não seja, encontrar uma alternativa que seja compatível
- [x] fazer uma prova de conceito um pouco maior fazendo um minijogo em lua rodar
  - [x] de alguma forma viabilizar a comunicação entre o código javascript e o
        código lua, possivelmente com document.write do js

## anotações

licença do fengari-web: mit. tá tranquilo.

## próximos passos

- dividir o código lua em arquivos separados
- desenvolver mais a lógica do jogo
- eliminar estado global

# 260826

## objetivos

- [x] dividir o código lua em arquivos separados
- [ ] desenvolver mais a lógica do jogo
- [ ] eliminar estado global

## anotações

ao migrar o script de dentro do html para arquivo externo .lua, passa a ter
problema com cors em file://. por sorte, firefox já faz automaticamente o lance
de https://firefox.localhost/ . testei no chrome e não funcionou, nem em file:
nem nesse mesmo endereço que funciona no firefox.

ao fazer require dentro de um arquivo lua para outro arquivo lua, se tudo
estiver na raiz do projeto, não precisa colocar o caminho, basta o nome base do
arquivo (sem .lua). se não estiverem na raiz, aí tem que colocar o caminho
completo iniciando sem barra e pode separar as pastas com ponto ou barra.
exemplos:
```lua
tabuleiro = require 'src.lua.tabuleiro'
escrever = require 'src/lua/escrever'
```

outra opção é alterar o require.path para olhar para algum diretório. por
exemplo, pode-se fazê-lo olhar para a raiz do código lua, o que faz bastante
sentido. por padrão, a raiz do require.path é o diretório onde fica o arquivo
html que inclui um script lua. é esquisito, mas é assim que o fengari-web
funciona.

## próximos passos

- [ ] desenvolver mais a lógica do jogo
- [ ] eliminar estado global

# 260827

## objetivos

- […] continuar separando os arquivos lua
- [ ] estudar classes, módulos, escopo etc. para ver o que será útil
- [ ] desenvolver mais a lógica do jogo


## anotações


## próximos passos


