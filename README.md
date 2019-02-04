 spaceapi-server
==================

Das Server Script, das zum ändern der Einträge in der spaceapi für selber verwaltete Hackerspaces zuständig ist.

Daten wie der Speicherort des JSON Files oder der verwendete Token wird in der config.csv definiert.

 aktueller Einsatz
--------------------

Über das Script wird der Spacestatus der [see-base](https://see-base.de) und der [Toolbox](https://toolbox-bodnsee.de) verwaltet.

Das Ergebnis des Scriptes lässt sich für die Toolbox unter folgender Adresse bewundern:
[bodensee.space/spaceapi/toolboxbodenseeev.json](https://bodensee.space/spaceapi/toolboxbodenseeev.json).


Zum ändern des Spacestatus folgende Adresse abrufen:

````
https://bodensee.space/cgi-bin/togglestate?space=see-base&state=show
````

Speicherort des Scripts:
````
/usr/lib/cgi-bin/spaceapi-server
````


