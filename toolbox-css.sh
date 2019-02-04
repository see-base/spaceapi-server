echo "$(date) $1" >> /tmp/foo
# Load config values
source /usr/lib/cgi-bin/spaceapi-server/token.conf
# Space toolbox open/close:
if [ $1 = "open" ]; then
    echo "#header h1 a.icon:before { color: lime; }" > /var/www/bodensee.space/web/spaceapi/toolbox/space_api.css
    echo "#navButton .toggle:before { color: lime; }" >> /var/www/bodensee.space/web/spaceapi/toolbox/space_api.css
    echo "#tb-opened { display: blocked; } #tb-closed { display: none !important; }" > /var/www/bodensee.space/web/spaceapi/toolbox/spacestatus.css
    echo "open" > /tmp/space-toolbox.log
arr[0]='Toolbox ist offen :tb:'
arr[1]=':tb: Toolbox ist offen.\nKomm vorbei!'
arr[2]=':tb. offen!'
arr[3]='Toolbox ist offen :tb:\nKomm vorbei und bastel was tolles!'
arr[4]='Hallo erstmal...\nIch weiß jetzt garnicht, ob ihr das wusstet...\nAber die Toolbox...\ndie wäre jetzt übrigens...\nnicht mehr ganz so geschlossen, als Sie vorher war!'
arr[5]='Hey, kommt vorbei. :tb:\nToolbox ist offen!'
arr[6]='Toolbox ist offen. :tb:\n Ihr kommt hoffentlich auch alle?'
arr[7]='Mag jemand etwas in der Toolbox Küche kochen? :waffel:\nDenn der Space ist jetzt offen'
arr[8]='@here: Toolbox ist offen :tb:'
arr[9]='Space ist offen :tb:\nKomm vorbei!'
rand=$[ $RANDOM % 10 ]
    curl -X POST -H 'Content-type: application/json' --data "{'text':'${arr[$rand]}'}" https://hooks.slack.com/services/$TOKEN1/$TOKEN2/$TOKEN3 > /dev/null
else
    echo "#header h1 a.icon:before { color: inherit; }" > /var/www/bodensee.space/web/spaceapi/toolbox/space_api.css
    echo "#navButton .toggle:before { color: #fff; }" > /var/www/bodensee.space/web/spaceapi/toolbox/space_api.css
    echo "#tb-closed { display: blocked; } #tb-opened { display: none !important; }" > /var/www/bodensee.space/web/spaceapi/toolbox/spacestatus.css
    echo "closed" > /tmp/space-toolbox.log
arr[0]='Toolbox ist geschlossen :tb:'
arr[1]=':tb: Toolbox ist zu.\nGeht weg!'
arr[2]='Toolbox ist geschlossen :cry:'
arr[3]='Toolbox ist jetzt zu :sad: :tb:'
arr[4]=':tb: closed\ngo away'
arr[5]='Toolbox ist jetzt müde und schläft\nKomm bald wieder!'
arr[6]='Toolbox schließt jetzt.\n:tb: bis bald :tb:'
   curl -X POST -H 'Content-type: application/json' --data "{'text':'${arr[$rand]}'}" https://hooks.slack.com/services/$TOKEN1/$TOKEN2/$TOKEN3 >/dev/null 
fi

