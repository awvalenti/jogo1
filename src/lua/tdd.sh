eval "$(luarocks path --bin)"

inotifywait -r -e close_write,create,delete,move -m . | while read -r _; do echo -e "\033[H\033[2J"; busted; done
