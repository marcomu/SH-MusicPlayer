#!/bin/bash -f

clear
echo "Esta es tu lista de canciones."
echo "Selecciona la que quieras escuchar"
echo ""
echo ""

    select var in `ls music | grep -E \(\.mp3\)$`
    do

if [ "$!" != "" ]
        then 
    		kill -KILL $!
		afplay music/$var &   
    		echo "Reproduciendo: $var "
		echo "Codigo1: $!"
        else
            if [ "$!" == "" ]
           	 then
            		afplay music/$var &
            		echo "Reproduciendo: $var "
            		echo "Codigo2: $!"
           	 else
	
    done
  
