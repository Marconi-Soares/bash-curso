#!/usr/bin/env bash
# ------------------------------------------------------------
# Script     :
# Descrição  :
# Versão     : 1.0
# Autor      : Marconi S. de Jesus <marconi.developer@outlook.com.br>
# Licença    : GNU/GPL v3.0
# Data       : 10/02/2023
# ------------------------------------------------------------
# Uso:
# ------------------------------------------------------------

fruta=(banana laranja abacate)

while true; do
  clear

  echo "1. Banana"
  echo "2. Laranja"
  echo "3. Abacate"
  echo "4. Sair"
  read -p "Escolha o número da sua opção: " opt

  [[ $opt -eq 4 ]] && break
  echo "Você escolheu ${fruta[(( $opt-1 ))]}."

  read -p "Tecle algo para continuar..." continua

done
