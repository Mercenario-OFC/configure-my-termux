red='\e[1;31m'
green='\e[1;32m'
blue='\e[1;34m'
purple='\e[1;35m'
icyan='\e[1;36m'
white='\e[1;37m'
yellow='\e[1;33m' 


distro="
..............
            ..,;:ccc,.
          ......''';lxO.
.....''''..........,:ld;
           .';;;:::;,,.x,
      ..'''.            0Xxoc:,.  ...
  ....                ,ONkc;,;cokOdc',.
.                   OMo           ':ddo.
                    dMc               :OO;
                    0M.                 .:o.
                    ;Wd
                     ;XO,
                       ,d0Odlc;,..
                           ..',;:cdOOd::,.
                                    .:d;.':;.
                                       'd,  .'
                                         ;l   ..
                                          .o
                                            c
                                            .'
                                             .
" 

paste <(printf "%s" "$distro") | lolcat 

echo -e "            ${green}⧏${red}=================${yellow}======${yellow}============${red}=================${green}⧐"
echo
echo -e ${red}"---------------------------------${icyan}{ Termux }${red}------------------------------"
echo
echo -e "            ${green}⧏${red}=================${yellow}======${yellow}============${red}=================${green}⧐"
echo
PS1='\[\033[01;31m\]┌─\[\033[01;34m\][\[\e[1;34m\]\[\033[01;32m\]Mercenario\e[0m\]\[\033[01;34m\]]\[\033[01;31m\]-\e[0m\]\[\033[01;34m\][\[\e[01;33m\]\t\e[0m\]\[\033[01;34m\]]\[\033[01;31m\]
┃\n\[\033[01;31m\]└─\[\033[01;34m\][\[\033[01;32m\]${PWD/*\//}\[\033[01;34m\]]\[\033[01;31m\]-\[\033[01;34m\]}\[\033[01;36m\] '

#=-----------------------------------------=

"
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

# Confirme antes de substituir
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias clone='git clone'

## utilitarios
alias proxy='proxychains4 $1 2>/dev/null'

#  comandos comuns
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias lm='ls | more'
alias ll='ls -lFh'
alias la='ls -alFh --group-directories-first'
alias l1='ls -1F --group-directories-first'
alias l1m='ls -1F --group-directories-first | more'
alias lh='ls -ld .??*'
alias lsn='ls | cat -n'
alias mkdir='mkdir -p -v'
alias cp='cp --preserve=all'
alias cpv='cp --preserve=all -v'
alias cpr='cp --preserve=all -R'
alias cpp='rsync -ahW --info=progress2'
alias cs='printf "\033c"'
alias q='exit'

# memoria/CPU
alias df='df -Tha --total'
alias free='free -mt'
alias ps='ps auxf'
alias ht='htop'
alias cputemp='sensors | grep Core'

# tornar menos amigável para arquivos de entrada não-texto, veja lesspipe
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/bash lesspipe)"

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
}"
 https://raw.githubusercontent.com/Mercenario-OFC/configure-my-termux/main/repo-dep/bashrc/.bashrc#:~:text=%5B%5B%20%24PS1%20%26%26%20%2Df%20/usr,arquivo%20v%C3%A1lido%22%0A%20%20fi%0A%7D
