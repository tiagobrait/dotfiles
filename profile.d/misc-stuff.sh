#misc stuff when loging in
#2011-13-16 tiagobrait

#put ~/bin *last* in out PATH
[[ -d $HOME/bin ]] && PATH=${PATH}:${HOME}/bin

#proper line breaking when resizing xterms
[[ $TERM =~ xterm.+ ]]  && shopt -s checkwinsize

#vimses
[[ -x /usr/bin/vim  ]] &&  export EDITOR=/usr/bin/vim
#nvim last win case we have it
[[ -x /usr/bin/nvim  ]] &&  export EDITOR=/usr/bin/nvim
[[ -x /usr/bin/vimpager  ]] &&  export MANPAGER=/usr/bin/vimpager

#disable annoying bell
#setterm -blength 0
