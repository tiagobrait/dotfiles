#
# ~/.bash_profile
#
#[[ -f ~/.bashrc ]] && . ~/.bashrc

export ANDROID_HOME=${HOME}/android-sdk
PATH=$PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

case ${TERM} in
  uxterm*|xterm*|rxvt*|aterm*|st*|kterm|gnome*|linux*|Eterm|screen)
    if declare -f __set_prompts > /dev/null; then
      export PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'__set_prompts'
    fi
      ;;
  *)
    if declare -f __set_prompts_nocolor > /dev/null; then
      export PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'__set_prompts_nocolor'
    fi
      ;;
esac

stty -ixon

function jcurl() {
  curl -Ss "$@" | json | pygmentize -l json
}
export -f jcurl

function pcurl() {
  curl -Ss "$@" | pygmentize
}
export -f jcurl
