#!/bin/bash -f
clear

mostrarCanciones=`ls $1 | grep -E "(.mp3)$"`

echo "::::::::::::::::::::::::::::::::::::::::::::::::"
echo "::::::::::::                      ::::::::::::::"
echo "::::::::::::      PREBEPLAYER     ::::::::::::::"
echo "::::::::::::                      ::::::::::::::"
echo "::::::::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo "Libreria Default: "
echo "$1"
echo ""
echo "-----------------------------------------[ MP3 ]"
echo ""
echo "$mostrarCanciones"
echo ""
echo "------------------------------------------------"
echo ""


echo "Presiona [enter] o escribe salir para ir al Menu"
read -p "Cancion: " reproduce


if [ "$reproduce" == "" ] # -------------------------------------------Valida que el campo no este vacio
	then
        echo ""
        reproduce="salir"
	else
		valida_repro=`file $1$reproduce | cut -d " " -f 1`
fi





until [ "$reproduce" == "salir" ] # -------------------------------------Escribe salir para ir al menu principal
do
    valida_repro=`file $1$reproduce | cut -d " " -f 2`

	if [ "$valida_repro" == "Audio" ] # -----------------------------Si es audio, reproduce
		then
                touch proc.txt
                ps > proc.txt
                proceso=`cat proc.txt | grep -E ".mp3" | cut -d " " -f 1 | tail -n 1`
                rm proc.txt

            if [ "$proceso" == "" ]
                then
                    clear

                    echo "::::::::::::::::::::::::::::::::::::::::::::::::"
                    echo "::::::::::::                      ::::::::::::::"
                    echo "::::::::::::      PREBEPLAYER     ::::::::::::::"
                    echo "::::::::::::                      ::::::::::::::"
                    echo "::::::::::::::::::::::::::::::::::::::::::::::::"
                    echo ""
                    echo ""
                    echo "Libreria Default: "
                    echo "$1"
                    echo ""
                    echo "-----------------------------------------[ MP3 ]"
                    echo ""
                    echo "[ Reproduciendo $reproduce ]"
                    echo ""
                    echo "------------------------------------------------"
                    echo ""
                    echo ""
                    afplay $1$reproduce &
                    reproduce="salir"
            
                else
                    clear
                    echo "::::::::::::::::::::::::::::::::::::::::::::::::"
                    echo "::::::::::::                      ::::::::::::::"
                    echo "::::::::::::      PREBEPLAYER     ::::::::::::::"
                    echo "::::::::::::                      ::::::::::::::"
                    echo "::::::::::::::::::::::::::::::::::::::::::::::::"
                    echo ""
                    echo ""
                    echo "Libreria Default: "
                    echo "$1"
                    echo ""

                    kill -9 $proceso
                    echo "-----------------------------------------[ MP3 ]"
                    echo ""
                    echo "[ Reproduciendo $reproduce ]"
                    echo ""
                    echo "------------------------------------------------"
                    echo ""
                    echo ""
                    afplay $1$reproduce &
                    reproduce="salir"

            fi


			
		else			# -------------------------------Si no es audio, error
			echo "Error, $reproduce no se puede reproducir"
            read -p "Escribe el nombre de la cancion: " reproduce

            if [ "$reproduce" != "" ] # -------------------------------------------Valida que el campo no este vacio
                then
                    valida_repro=`file $1$reproduce | cut -d " " -f 2`
                else
                    reproduce="salir"
            fi


    fi
done
echo "Presiona [enter] para continuar"

