#!/bin/bash
#2014 tiagobrait

_DIRCOLORS='/etc/dir_colors'

[[ "$TERMINAL" = "linux" ]] && ( eval $(dircolors); return )

if [ -f "$_DIRCOLORS" ]; then
  eval $(dircolors ${_DIRCOLORS})
else
  eval $(dircolors)
fi

