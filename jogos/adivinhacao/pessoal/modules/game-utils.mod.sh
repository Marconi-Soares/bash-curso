#!/usr/bin/env bash
# ------------------------------------------------------------
# Script     :
# Descrição  :
# Versão     : 1.0
# Autor      : Marconi S. de Jesus <marconi.developer@outlook.com.br>
# Licença    : GNU/GPL v3.0
# Data       : 13/02/2023
# ------------------------------------------------------------
# Uso:
# ------------------------------------------------------------
gm_desenha_tela() {
  clear
  echo -e "\
Jogo da adivinhação
Digite um número entre 1 e 100:
'S' para sair.
"
}

gm_gerar_key() {
  export key=$(( $RANDOM / 325 ))
}

gm_finalizar() {
  msg_ganhou="PARABÊNS! Você acertou o número em $tentativas tentativas."
  echo -e $msg_ganhou
  read -p "Aperte algo para continuar..." ignore
}

gm_jogar() {
  while true; do 
    ((tentativas++))
    [[ $numero = 'err' ]] && num_get_numero

    [[ $numero = $key ]] && gm_finalizar && break 
    
    [[ $numero -gt $key ]] && echo -e $msg_greater

    [[ $numero -lt $key ]] && echo -e $msg_less

    num_get_numero
  
  done
}
