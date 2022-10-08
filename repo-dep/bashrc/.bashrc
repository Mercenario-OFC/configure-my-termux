
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Não armazenar as linhas duplicadas ou linhas que começam com espaço no historico.
HISTCONTROL=ignoreboth

# Adicionar ao Historico e não substitui-lo.
shopt -s histappend

# Definições do comprimento e tamnho do historico.
HISTSIZE=1000
HISTFILESIZE=2000

# Checa o tamanho do terminal e ajusta o script para não ocorrer bugs
 shopt -s checkwinsize

# Editar sources.list
 alias lists='nano /etc/apt/sources.list'

# reload settins
alias tt='termux-reload-settings'

# mais alguns apelidos de ls
 alias ls='lsd'
 alias ll='ls -l'
 alias la='ls -A'
 alias l='ls -CF'
 alias listar='ls -CF -a | lolcat'

# Navegação
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Reparar o apt-get
alias aptrepair='apt -f install'

# Reparar o dpkg
alias dpkgrepair='sudo dpkg --configure -a'

# atualizar o apt
alias upd='pkg update -y'

#Meck aliases
alias meck='nala'

# Confirme antes de substituir
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias clone='git clone'

## utilitarios
alias proxy='proxychains4 $1 2>/dev/null'

## tor check
tcheck(){
curl --socks5-hostname localhost:9050 -s https://check.torproject.org &> /dev/null && echo "Tor conectado" || echo "Tor nao esta conectado"
}

# command not found handle
command_not_found_handle() {
   printf "$blue achei esse comando nao pow $red):\n"
      return 127
      }


# Netcat-based command line pastebin. 
 alias tb='ncat termbin.com 9999'
# cd multiple levels down
# usage: cdn <number>
function cdn() {
    local LVL=${1:-0}
    local ARG=""
    for (( i=0; i<${LVL}; i++)); do
        ARG="${ARG}../"
    done
    cd "${ARG:-$HOME}"
}

# Generate a PIN code
# usage: genpin [length]
function genpin() {
    local PINLEN=${1:-4}
    tr -dc 0-9 < /dev/urandom | head -c ${PINLEN} | xargs
}

# Generate a random password
# usage: genpasswd [length]
function genpasswd() {
    local PWDLEN=${1:-32}
    tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${PWDLEN} | xargs
}

## EXTRAÇÃO DE ARQUIVO ###
## Uso: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' não pode ser extraído via ex()" ;;
    esac
  else
    echo "'$1' não é um arquivo válido"
  fi
}
