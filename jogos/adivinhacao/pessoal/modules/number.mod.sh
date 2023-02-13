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
num_invalidate_number() {
  numero=err
  read -p "Aperte algo para continuar..." ignore
}

num_numero_isValid() {
  local is_digit='^[-]?[0-9]+$'
  if [[ !($numero =~ $is_digit) ]]; then 
    echo 'Por favor, digite um NÚMERO entre 1 e 100'
    num_invalidate_number
    return 1
  fi

  if [[ $numero -lt 0 || $numero -gt 100 ]]; then
    echo 'Este número não é válido'
    num_invalidate_number
    return 1
  fi
}

num_get_numero() {
  read -p ">>>  " numero
  [[ $numero = "S" ]] && exit 0
  
  num_numero_isValid
}
