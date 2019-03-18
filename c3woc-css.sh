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

# Space toolbox open/close:
if [ $1 = "open" ]; then
    echo "#header h1 a.icon:before { color: lime; }" > /var/www/bodensee.space/web/spaceapi/c3woc/space_api.css
    echo "#navButton .toggle:before { color: lime; }" >> /var/www/bodensee.space/web/spaceapi/c3woc/space_api.css
    echo "#waffel-available { display: blocked; } #no-waffles { display: none !important; }" > /var/www/bodensee.space/web/spaceapi/c3woc/spacestatus.css
else
    echo "#header h1 a.icon:before { color: inherit; }" > /var/www/bodensee.space/web/spaceapi/c3woc/space_api.css
    echo "#navButton .toggle:before { color: #fff; }" > /var/www/bodensee.space/web/spaceapi/c3woc/space_api.css
    echo "#no-waffles { display: blocked; } #waffel-available { display: none !important; }" > /var/www/bodensee.space/web/spaceapi/c3woc/spacestatus.css
fi

