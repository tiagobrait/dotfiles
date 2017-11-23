#! /bin/bash

#run xprofile instead
[ -f ~/.xprofile ] && source ~/.xprofile

exec /usr/bin/i3
