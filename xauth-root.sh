#! /bin/bash
#2012-16 tiagobrait

[[ -n $DISPLAY ]] && return

if [ $(id -u) = "0"  ]; then

    #use loginctl to get the info we need instead of who 
    
    #find out what session is active
    active_session=''
    for curr_session in $(loginctl --no-pager --no-legend list-sessions | awk '{print $1}'); do
      if [ "$(loginctl show-session -p Active $curr_session | cut -f2 -d=)" = "yes" ]; then
        active_session=$curr_session
        break
      fi
    done
    #not a very good idea to use eval here, but again, lazy
    eval $(loginctl show-session -p Display -p User $active_session)
    user_home=$(getent passwd $User | cut -f6 -d:)
    [[ ! -z $user_home ]] && xauth merge ${user_home}/.Xauthority && export DISPLAY=$Display
    
    #does not work for arch anymore, too lazy to find out why
    #xline=$(who | egrep ':[0-9]+' | head -n1)
    #xuser=$(echo $xline | cut -f1 -d\ )
    #xdisp=$(echo $xline | awk -F "[()]" {'print $2'})
    #xuser_home=$( [[ ! -z $xuser ]]  && getent passwd $xuser | cut -f6 -d:)

    #[[ ! -z $xuser_home  ]] &&  xauth merge ${xuser_home}/.Xauthority && export DISPLAY=$xdisp
fi
