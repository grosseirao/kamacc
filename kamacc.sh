#!/bin/bash
kakeledir=~/.prefs/kakele
# Define as opções do menu em um array
options=(1 "Role"
         2 "Play"
         3 "Game")

# Define a variável de saída inicialmente vazia
output=""

while true; do
  # Mostra o menu de seleção e captura a escolha do usuário
  clear
  output=$(dialog --menu "Escolha uma opção:" 10 30 3 "${options[@]}" 2>&1 >/dev/tty)

  # Verifica se o usuário pressionou "Cancelar" ou fechou a janela do diálogo
  if [ "$?" -ne 0 ]; then
    break
  else
    # Executa o comando correspondente à escolha do usuário
    pkill -x "kakele"
    case $output in
        1)
           xmlstarlet ed --inplace --update "/properties/entry[@key='loginKey']" --value "tolken" $kakeledir
           ;;
        2)
           xmlstarlet ed --inplace --update "/properties/entry[@key='loginKey']" --value "tolken" $kakeledir
           ;;
        3)
           xmlstarlet ed --inplace --update "/properties/entry[@key='loginKey']" --value "tolken" $kakeledir
           ;;
    esac
    setsid kakele &>/dev/null &
  fi
done
