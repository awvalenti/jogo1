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

- [x] organizar carregamento de módulos lua
- [x] estudar classes, módulos, escopo etc. para ver o que será útil
- [ ] desenvolver mais a lógica do jogo


## anotações

para criar classes, um jeito é assim:

```lua
Classe = {}

function Classe:new()
  ret = { chave1 = 'valor1', chave2 = 'valor2' }
  self.__index = self
  return setmetatable(ret, self)
end

function Classe:metodo1()
  print(self.chave1, self.chave2)
end

objeto = Classe:new()
objeto.metodo1()
```

só que não funcionou.

instalei lua na máquina com:
```sh
apt install lua5.4
```

descobri: eu estava chamando com . em vez de : - o certo é `objeto:metodo1()`

## próximos passos

- desenvolver mais a lógica do jogo, possivelmente usando classes


# 260902

## objetivos

- [x] verificar se, se não usar palavra-chave local, vars ficam globais
- [x] verificar se isso também se aplica a funções
- [ ] desenvolver mais a lógica do jogo, possivelmente usando classes

## anotações

este é o endereço que o firefox provê para evitar file://: https://firefox.localhost/index.html

sim, somente escrevendo explicitamente local o símbolo fica local. do contrário,
será global. funções também precisam ser declaradas como locais, se forem
funções soltas, fora de tabelas. se forem funções dentro de tabela (métodos), aí
serão locais automaticamente, e nem poderá usar a palavra reservada local.

para referenciar métodos, tem que ser tab.metodo, não tab:metodo. essa última
forma só pode ser usada para chamar o método.

variáveis locais em funções também precisam do local, senão serão globais.

em fors, não pode colocar local, variáveis já são locais.

no construtor (new), não se pode usar self para se referir ao objeto sendo
criado. deve-se usar a variável local correspondente, que até o momento eu
chamei de ret.

## próximos passos

- melhorar a parte que atribui função a js.global.executarMovimento
- desenvolver mais a lógica do jogo usando classes


# 260906

## objetivos

- […] fazer testes automatizados e criar principais lógicas do jogo
  - [x] instalar busted
    - [x] instalar e configurar luarocks
- [ ] desenvolver mais a lógica do jogo usando classes
- [ ] melhorar a parte que atribui função a js.global.executarMovimento

## anotações

tive dificuldade para melhorar a parte da função executarmovimento. está confusa
a arquitetura atual e não vejo muito como melhorá-la. decidi o seguinte: como
eu já fiz as provas de conceito necessárias, não preciso mais validar nada. vou
começar a desenvolver o jogo do zero e do jeito mais organizado. vou fazer um
tddzinho para criar a lógica básica do jogo primeiro. para isso, preciso
escolher uma ferramenta de testes automatizados em lua.

pesquisei sobre isso e descobri que o próprio criador da linguagem faz testes
automatizados em lua puro, só usando a função assert e algumas outras. procurei
opções e achei uma tal de busted, similar a rspec (ruby), jasmine/jest (js) etc.
para usá-la, posso instalar pelo luarocks. fui ver como seria.

instalei pelo apt e foi instalado lua5.1 junto. achei estranho. mas precisou
mesmo, pelo jeito. a versão que tem no repositório do apt é meio antiga, 3.8.0.
porém, a alternativa seria baixar o fonte e fazer um sudo make install da vida,
dependendo ainda de outros pacotes para rodar o make. desisti e fiquei com o do
apt, mesmo. ainda dá pra rodar luarocks-5.4, mas aí fica faltando um tal de
LUA_INCDIR. vou seguir só com o luarocks, mesmo.

a documentação não pareceu grande coisa, pois vi em outro lugar que existe o
luarocks init, similar ao npm init do node. executei. vamos ver.

luarocks install busted funcionou, mas instalou umas 8 outras coisas. lembranças
do npm... espero que pare por aí!

todas as dependências do busted juntas somam 3mb. até agora, tá tranquilo!

tem muitas formas de instalar dependências com luarocks. aparentemente, a melhor
opção foi:
```sh
cd src/lua
luarocks init
luarocks install --pin busted
```

muita complicação aí com versões de lua. o luarocks do jeito padrão definiu que
meu projeto usa lua5.1. não curti. fui ver e o fengari-web usa lua5.3.

blz, se usar lua5.3, até o luarocks consegue usar, ele não exige instalar o 5.1.

mas não funciona, por falta do LUA_INCDIR configurado. se instalar o 5.1, a
saída do luarocks é:

```
Configuration:
   Lua:
      Version    : 5.1
      Interpreter: /usr/bin/lua5.1 (ok)
      LUA_DIR    : /usr (ok)
      LUA_BINDIR : /usr/bin (ok)
      LUA_INCDIR : /usr/include/lua5.1 (ok)
      LUA_LIBDIR : /usr/lib/x86_64-linux-gnu (ok)

   Configuration files:
      System  : /etc/luarocks/config-5.1.lua (ok)
      User    : /home/andre/.luarocks/config-5.1.lua (not found)

   Rocks trees in use:
      /home/andre/.luarocks
      /usr/local
```

achei
[aqui](https://linuxvox.com/blog/lua-5-3-is-installed-but-i-can-t-locate-the-correct-lua-h/):
faltava o pacote liblua5.3-dev.

```sh
luarocks init --lua-versions=5.3
```

parece que encontrei finalmente um jeito a la npm install de configurar as
dependências do projetoa. é assim:
1. `luarocks init` cria os arquivos necessários, principalmente `*.luarocks`
2. você edita manualmente o `*.luarocks` para incluir dependências
3. você instala as dependências com `luarocks install --only-deps --pin --local
   *.rockspec`
4. para rodar os testes, primeiro `eval "$(luarocks path --bin)"`, depois
   `busted`

busted procura uma pasta `spec` e arquivos dentro dela `_spec.lua`. criei um
esboço de teste lá.

## próximos passos

- […] fazer testes automatizados e criar principais lógicas do jogo
- [ ] desenvolver mais a lógica do jogo usando classes

