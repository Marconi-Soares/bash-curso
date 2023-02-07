#!/usr/bin/env bash
# ------------------------------------------------------------
# Script     :
# Descrição  :
# Versão     : 1.0
# Autor      : Marconi S. de Jesus <marconi.developer@outlook.com.br>
# Licença    : GNU/GPL v3.0
# Data       : 07/02/2023
# ------------------------------------------------------------
# Uso:
# ------------------------------------------------------------


alunos=(Joao Maria "Luis Carlos")

IFS=$'\n'

for aluno in ${alunos[*]}; do 
  echo $aluno 
done

