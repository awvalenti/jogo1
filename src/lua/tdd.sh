eval "$(luarocks path --bin)"

observar_sistema_de_arquivos()
{
  inotifywait -r -e close_write,create,delete,move -m . 2> /dev/null
}

rodar_testes()
{
  local args=''
  # args+='-o TAP '
  args+='--lang pt-BR '
  echo -ne "\033[H\033[2J"
  busted $args
}

rodar_testes
observar_sistema_de_arquivos |
  while read -r _; do
    rodar_testes
  done
