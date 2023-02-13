#!/usr/bin/env bash
# ------------------------------------------------------------
# Script     :
# Descrição  :
# Versão     : 1.0
# Autor      : Marconi S. de Jesus <marconi.developer@outlook.com.br>
# Licença    : GNU/GPL v3.0
# Data       : 11/02/2023
# ------------------------------------------------------------
# Uso:
# ------------------------------------------------------------

desenha_tela() {
  clear
  echo -e "\
Jogo da adivinhação
Digite um número entre 1 e 100:
'S' para sair.
"
}


invalidate_number() {
  numero=err
  read -p "Aperte algo para continuar..." ignore
}

numero_isValid() {
  local is_digit='^[-]?[0-9]+$'
  if [[ !($numero =~ $is_digit) ]]; then 
    echo 'Por favor, digite um NÚMERO entre 1 e 100'
    invalidate_number
    return 1
  fi

  if [[ $numero -le 0 || $numero -gt 100 ]]; then
    echo 'Este número não é válido'
    invalidate_number
    return 1
  fi
}

get_numero() {
  read -p ">>>  " numero
  [[ $numero = "S" ]] && exit 0
  
  numero_isValid
}

gerar_key() {
  export key=$(( $RANDOM / 1000 ))
}

msg_ganhou="
PARABÊNS! Você acertou o número.
"

msg_greater="
Valor muito alto!
"

msg_less="
Valor muito baixo!
"

finalizar() {
  echo -e $msg_ganhou
  read -p "Aperte algo para continuar..." ignore
}

jogar() {
  while true; do 
   
    [[ $numero = 'err' ]] && get_numero

    [[ $numero = $key ]] && finalizar && break 
    
    [[ $numero -gt $key ]] && echo -e $msg_greater

    [[ $numero -lt $key ]] && echo -e $msg_less

    get_numero
  
  done
}

main() {
  while true; do
    desenha_tela
    
    get_numero

    [[ $numero = "err" ]] && continue  

    gerar_key
    jogar

  done
}

main
