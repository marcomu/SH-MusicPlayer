#!/bin/bash -f
clear
echo "::::::::::::::::::::::::::::::::::::::::::::::::"
echo "::::::::::::                      ::::::::::::::"
echo "::::::::::::      PREBEPLAYER     ::::::::::::::"
echo "::::::::::::                      ::::::::::::::"
echo "::::::::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo "-----------------------------------[ Favoritos ]"
echo ""
touch temp.txt
ps > temp.txt
repro=`cat temp.txt | grep -E ".mp3" | cut -d " " -f 8`            # Nombre de la cancion
proc=`cat temp.txt | grep -E ".mp3" | cut -d " " -f 1`               # PID de la cancion
rm temp.txt



configuracion=`find . -name favoritos.txt`
if [ "$configuracion" == "./favoritos.txt" ]
    then

select var in `cat favoritos.txt`
do

    if [ "$proc" == "" ]
        then
            afplay $var &
            echo "[ Reproduciendo: $var ]"
            

        else
            kill -9 $proc
            afplay $var &
            echo " [ Reproduciendo: $var ] "
    fi
break
    
done
        



    else
        echo "No hay canciones todavia."
fi

echo ""
echo "------------------------------------------------"
echo ""
echo ""
echo "Presiona [enter] para continuar."