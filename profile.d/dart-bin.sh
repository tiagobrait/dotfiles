#!/bin/bash
#2018 tiaogbrait
#dart bin stuff

PUB_DIR="$HOME/.pub-cache"

[[ -d "${PUB_DIR}" ]] && export PATH="${PUB_DIR}/bin":${PATH}
