#!/bin/bash
echo "$(date) $1" >> /tmp/foo

# Select random line from file using reservoir sampling, first argument should be filename.
function randomLine {
    local selectedLine=''
    local i=1
    
    while read -r line; do
    
        # If line is empty, ignore.
        if [ -z "$line" ]; then
            continue
        fi
    
        # If selected line is empty, use this
        if [ -z "$selectedLine" ]
        then
            selectedLine=$line
        else
            # Replace selected Line with probability 1/i
            if [ "$(($RANDOM % $i))" -eq "0" ]; then
                selectedLine=$line
            fi
        fi
        
        ((i++))
    done < "$1"
   
    echo "$selectedLine"
}

# Load config values
source /usr/lib/cgi-bin/spaceapi-server/token.conf
if [ ! -f /var/www/bodensee.space/web/spaceapi/toolbox/space-toolbox.conf ]; then
    toolbox_open=false
else
    source /var/www/bodensee.space/web/spaceapi/toolbox/space-toolbox.conf
fi

# Space toolbox open/close:
if [ $1 = "open" ]; then
    echo "toolbox_open=true" > /var/www/bodensee.space/web/spaceapi/toolbox/space-toolbox.conf
    echo "#header h1 a.icon:before { color: lime; }" > /var/www/bodensee.space/web/spaceapi/toolbox/space_api.css
    echo "#navButton .toggle:before { color: lime; }" >> /var/www/bodensee.space/web/spaceapi/toolbox/space_api.css
    echo "#tb-opened { display: block; } #tb-closed { display: none !important; }" > /var/www/bodensee.space/web/spaceapi/toolbox/spacestatus.css
    if [ "$toolbox_open" = false ]; then curl -X POST -H 'Content-type: application/json' --data "{'text':'$(randomLine '/usr/lib/cgi-bin/spaceapi-server/messages_open.txt')'}" https://hooks.slack.com/services/$TOKEN1/$TOKEN2/$TOKEN3 > /dev/null; fi
else
    echo "toolbox_open=false" > /var/www/bodensee.space/web/spaceapi/toolbox/space-toolbox.conf
    echo "#header h1 a.icon:before { color: inherit; }" > /var/www/bodensee.space/web/spaceapi/toolbox/space_api.css
    echo "#navButton .toggle:before { color: #fff; }" > /var/www/bodensee.space/web/spaceapi/toolbox/space_api.css
    echo "#tb-closed { display: block; } #tb-opened { display: none !important; }" > /var/www/bodensee.space/web/spaceapi/toolbox/spacestatus.css
    if [ "$toolbox_open" = true ]; then curl -X POST -H 'Content-type: application/json' --data "{'text':'$(randomLine '/usr/lib/cgi-bin/spaceapi-server/messages_closed.txt')'}" https://hooks.slack.com/services/$TOKEN1/$TOKEN2/$TOKEN3 >/dev/null;  fi
fi

