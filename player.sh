#!/bin/bash -f
clear
configuracion=`find . -name config.txt`
if [ "$configuracion" == "./config.txt" ]
        then
            echo "Archivo de configuracion encontrado."
        else

        touch config.txt
        echo "#-------Archivo de Configuración-----" >> config.txt
        echo "#Esta es la ruta de inicio predeterminada," >> config.txt
        echo "#Modificala para que le indiques al programa donde quieres iniciar." >> config.txt
        echo "RutaExploracion:`pwd`" >> config.txt
        echo "Se creo archivo de configuracion"
fi
#-------------
ruta="`cat config.txt | grep "RutaExploracion" | cut -d ":" -f 2`"
#--------------								----SE ESTABLECE RUTA INICIAL
echo "::::::::::::::::::::::::::::::::::::::::::::::::"
echo "::::::::::::                      ::::::::::::::"
echo "::::::::::::      PREBEPLAYER     ::::::::::::::"
echo "::::::::::::                      ::::::::::::::"
echo "::::::::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo "Libreria Default: "
echo "$ruta"
echo ""
echo ""
select opcion in  Reproducir Libreria Controles Favoritos Ayuda Salir
do
	case $opcion in
		Reproducir)
		./reproducir.sh $ruta
		;;
		Libreria)
		./libreria.sh
		;;
        Controles)
        ./controles.sh
        ;;
        Favoritos)
        ./favoritos.sh
        ;;
        Ayuda)
        ./ayuda.sh
        ;;
		Salir)
            touch temp.txt
            ps > temp.txt
            repro=`cat temp.txt | grep -E ".mp3" | cut -d " " -f 8`            # Nombre de la cancion
            proc=`cat temp.txt | grep -E ".mp3" | cut -d " " -f 1`               # PID de la cancion
            rm temp.txt
            if [ "$proc" == "" ]
                then
                    clear
                    echo ":::: Gracias por usar PREBEPLAYER."
                    echo ""
                    sleep 1
                    exit
                else
                    kill -9 $proc
                    clear
                    echo ":::: Gracias por usar PREBEPLAYER."
                    echo ""
                    sleep 1
                    exit
            fi
		;;
		*)
		echo ":::: Por favor escribe únicamente LOS NUMEROS del menu."
		;;
	esac

done
	
