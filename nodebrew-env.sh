#nodebrew for everybody who uses it
#2016 tiagobrait

NBREW_PATH="${HOME}/.nodebrew"
NBREW_COMP="${NBREW_PATH}/completions/bash/nodebrew-completion"

[[ -d ${NBREW_PATH} ]] && export PATH="${NBREW_PATH}/current/bin:${PATH}"
[[ -f ${NBREW_COMP} ]] && source "${NBREW_COMP}"

