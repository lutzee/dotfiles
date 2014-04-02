#!/bin/bash
path="/sys/class/backlight/intel_backlight"
#max should be 976
max=$(/bin/cat ${path}/max_brightness)
# step: represent the difference between previous and next brightness
step=120
previous=$(/bin/cat ${path}/brightness)

function commit {
        if [[ $1 = [0-9]* ]]
        then 
                if [[ $1 -gt $max ]]
                then 
                        next=$max
                elif [[ $1 -lt 0 ]]
                then 
                        next=0
                else 
                        next=$1
                fi
                echo $next >> ${path}/brightness
                exit 0
        else 
                exit 1
        fi
}

case "$1" in
    up)
        commit $(($previous + $step))
    ;;
    down)
        commit $(($previous - $step))
    ;;
    max)
            commit $max
    ;;
    on)
            $0 max
    ;;
    off)
            commit 0
    ;;
    show)
            echo $previous
    ;;
    night)
            commit 1 
            ;;
    allowusers)
            # Allow members of users group to change brightness
            sudo chgrp users ${path}/brightness
            sudo chmod 666 ${path}/brightness
    ;;
    disallowusers)
            # Allow members of users group to change brightness
            sudo chgrp root ${path}/brightness
            sudo chmod g-w ${path}/brightness
    ;;
    *)
            commit	$1
esac

exit 0
#!/bin/bash
