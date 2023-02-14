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
# Opções -----------------------------------------------------

rmin=1
rmax=100 

# Mensagens --------------------------------------------------
# Mensagens do jogo...
msg[0]='Você acertou (em %s tentativas)!'
msg[1]='Baixo demais!'
msg[2]='Alto demais!'
msg[3]='Eu disse um número!'
msg[4]="Eu disse entre $rmin e $rmax!"

# Prompts...
prompt[0]="Digite um número entre $rmin e $rmax:"
prompt[1]='Tecle algo para continuar...'
prompt[2]='Quer jogar novamente (S/n)?'

# Saída...
msg_quit='Saindo...'

# Título do jogo... 
str_title='JOGO DA ADIVINHAÇÃO'

# Funções -------------------------------------------------------

# Funções de validação...
is_number() [[ $1 =~ ^[0-9]+$ ]]
in_range() [[ $1 -ge $rmin && $1 -le $rmax ]]

# Funções de conferência...
is_higher() [[ $1 -gt $sec ]]
is_lower() [[ $1 -gt $sec ]]

check_guess() {
  # Validação...
  is_num $1   || return 3
  is_range $1 || return 4

  # Conferências...
  is_lower $1 && return 1
  is_higher $1 && return 2

  # Acerto...
  return 0
}

get_secret() ((sec = RANDOM % 100 - 1 ))


set_game() {
  count=1
  guesses=''
  get_secret 

}

guess_update() {
  local r go

  case $1 in 
    1) r='↓' ;;
    2) r='↑' ;;
    *) r='-' ;;
  esac

  guesses+="$count:$guess$r"
  $((count++))

  echo "${msg[$1]}"
  read -sN1 "${prompt[1]}" go
}

# Main ------------------------------------------------------------

main() {

  # Inicia o jogo...
  set_game

  while true; do
    clear

    # Imprime título...
    printf '%s\n\n' "$str_title"
    [[ "$guesses" ]] && printf '%s\n\n' "$guesses" 
    
    # Lê entrada do jogador...
    read -e -p "${prompt[0]} " guess
    
    check_guess "$guess" || { guess_update $? ; continue; }

    # Mensagem de acerto...
    printf "${msg[0]\n}" $cont

    #Jogar novamente?
    printf '\n%s' "${prompt[2]}"
    read -sN1 again
    [[ ${again,,} = 'n' ]] && break
    
    # Chegando aqui, a resposta foi SIM!
    set_game 

  done
  


  # Mensagem de saída...
  print '\n\n%s\n\n' "msg_quit"
}
main
