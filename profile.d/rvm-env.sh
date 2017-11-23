#rvm for everybody who uses it
#2014 tiagobrait

RVM_PATH="$HOME/.rvm"

[[ -d $RVM_PATH  ]] && source $RVM_PATH/scripts/rvm
[[ -r $RVM_PATH/scripts/completion  ]] && \
    rvm_path=$RVM_PATH source $RVM_PATH/scripts/completion

