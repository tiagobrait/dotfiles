#bash aliases
#2009 tiagobrait

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mpkg='updpkgsums ; makepkg -fci --noconfirm'
#alias vim='vwrap'

#function vwrap() {
  #if [ -x '/usr/bin/nvim'  ]; then
    #/usr/bin/nvim "${@}"
  #elif [ -x '/usr/bin/nvim' ]; then
    #/usr/bin/vim "${@}"
  #else
    #echo "cant find vim or nvim!"
  #fi
#}
