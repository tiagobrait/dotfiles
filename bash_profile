#
# ~/.bash_profile
#
[[ -f ~/.bashrc ]] && . ~/.bashrc

stty -ixon

export ANDROID_HOME=${HOME}/android-sdk
PATH=$PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:$HOME/bin/depot_tools

# if declare -f __set_prompts > /dev/null; then
  # export PROMPT_COMMAND='__set_prompts;'${PROMPT_COMMAND:+$PROMPT_COMMAND}
# fi

function jcurl() {
  curl -Ss "$@" | json | pygmentize -l json
}
export -f jcurl

function pcurl() {
  curl -Ss "$@" | pygmentize
}

function cdgo() {
  cd "${GOPATH}/src/$1"
}

export -f jcurl
