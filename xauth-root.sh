#! /bin/bash
#2012 tiagobrait

[[ -n $DISPLAY ]] && return

if [ $(id -u) = "0"  ]; then

    xline=$(who | egrep ':[0-9]+' | head -n1)
    xuser=$(echo $xline | cut -f1 -d\ )
    xdisp=$(echo $xline | awk -F "[()]" {'print $2'})
    xuser_home=$( [[ ! -z $xuser ]]  && getent passwd $xuser | cut -f6 -d:)

    [[ ! -z $xuser_home  ]] &&  xauth merge ${xuser_home}/.Xauthority && export DISPLAY=$xdisp
fi
