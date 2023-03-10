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
source ./modules/msg.mod.sh        #msg
source ./modules/game-utils.mod.sh #gm
source ./modules/number.mod.sh     #num

main() {
  while true; do
    export tentativas=0

    gm_desenha_tela
    
    num_get_numero

    [[ $numero = "err" ]] && continue  

    gm_gerar_key
    gm_jogar

  done
}

main
