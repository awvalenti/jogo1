# jogo1

## ambiente de desenvolvimento

### pré-requisitos

#### linux mint ou similares

```sh
apt install liblua5.3-dev lua5.3 luarocks
```

### dependências lua
```sh
luarocks install --only-deps --pin --local *.rockspec
```

### testes automatizados: rodar uma vez
```sh
eval "$(luarocks path --bin)"
busted
```

### testes automatizados: tdd contínuo
```sh
./tdd.sh
```
