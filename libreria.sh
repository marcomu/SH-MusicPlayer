#!/bin/bash -f
clear
configuracion=`find . -name config.txt`
if [ "$configuracion" == "./config.txt" ]
    then
        echo ""
    else
        touch config.txt
        echo "#-------Archivo de Configuración-----" >> config.txt
        echo "#Esta es la ruta de inicio predeterminada," >> config.txt
        echo "#Modificala para que le indiques al programa donde quieres iniciar." >> config.txt
        echo "RutaExploracion:/Users/Mark/Desktop/music/" >> config.txt
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
#------------                                                       --------- Entra a la ruta inicial y muestra la ruta
cd "$ruta" 
echo "Libreria Actual: "
pwd  
echo ""
echo ""
#----------------   Mover 
inc=12
for var in `ls | cut -f 1`
do
	echo -en "\033[$inc;10H"			#Este ciclo es el que permite poner lista en 
	echo $var					# un lugar diferente de la pantalla.
	inc=$(($inc+1))
done
#---------------






until [ "$captura" == "salir" ] # --------          Hasta que apriete salir, te saca del reproductor
do
    echo ""
    echo " [directorio]: Explorar | [cancion.mp3]: Reproduce | regresar: Carpeta Padre | salir: Ir al Menu "
    read -p "Ingresa: " captura
    if [ "$captura" == "" ]         # --  Si presiona enter, muestra lo que contiene la carpeta en la que estas
        then
            clear
            echo "::::::::::::::::::::::::::::::::::::::::::::::::"
            echo "::::::::::::                      ::::::::::::::"
            echo "::::::::::::      PREBEPLAYER     ::::::::::::::"
            echo "::::::::::::                      ::::::::::::::"
            echo "::::::::::::::::::::::::::::::::::::::::::::::::"
            echo ""
            echo ""
            #------------                                                       --------- Entra a la ruta inicial y muestra la ruta
            echo "Libreria Actual: "
            pwd
            echo ""
            echo ""
            #----- Mover
            inc=11
            for var in `ls | cut -f 1`
                do
                    echo -en "\033[$inc;10H"			#Este ciclo es el que permite poner lista en
                    echo $var					# un lugar diferente de la pantalla.
                    inc=$(($inc+1))
                    done
            #------     

        else
            temp=`file $captura | cut -d " " -f 2`
    fi

    if [ "$captura" == "regresar" ] # ------------------------- Si no ingresa nada, se sale... si ingresa algo, lo evalua
                then
                    cd ..
                    clear

                    echo "::::::::::::::::::::::::::::::::::::::::::::::::"
                    echo "::::::::::::                      ::::::::::::::"
                    echo "::::::::::::      PREBEPLAYER     ::::::::::::::"
                    echo "::::::::::::                      ::::::::::::::"
                    echo "::::::::::::::::::::::::::::::::::::::::::::::::"
                    echo ""
                    echo ""
                    echo "Libreria Actual: "
                    pwd
                    echo ""
                    echo ""
                    #----- Mover
                    inc=11
                    for var in `ls | cut -f 1`
                        do
                            echo -en "\033[$inc;10H"			#Este ciclo es el que permite poner lista en
                            echo $var					# un lugar diferente de la pantalla.
                            inc=$(($inc+1))
                        done
                    #------
                    
                else
                    if [ "$temp" == "directory" ]
                        then
                            cd $captura
                            clear
                            echo "::::::::::::::::::::::::::::::::::::::::::::::::"
                            echo "::::::::::::                      ::::::::::::::"
                            echo "::::::::::::      PREBEPLAYER     ::::::::::::::"
                            echo "::::::::::::                      ::::::::::::::"
                            echo "::::::::::::::::::::::::::::::::::::::::::::::::"
                            echo ""
                            echo ""
                            echo "Libreria Actual: "
                            pwd
                            echo ""
                            echo ""
                            #---------------------------------------Mover
                            inc=11
                            for var in `ls | cut -f 1`
                            do
                                echo -en "\033[$inc;10H"
                                echo $var
                                inc=$(($inc+1))
                            done
                            #-----------------------------------------
                        else
                            if [ "$temp" == "Audio" ]
                                then
                                    touch proc.txt
                                    ps > proc.txt
                                    proceso=`cat proc.txt | grep -E ".mp3" | cut -d " " -f 1`
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
                                            echo "-----------------------------------------[ MP3 ]"
                                            echo ""
                                            echo "[ Reproduciendo `pwd`$captura ]"
                                            echo ""
                                            echo "------------------------------------------------"
                                            echo ""
                                            echo ""
                                            afplay `pwd`/$captura &
                                            captura="salir"

                                        else
                                            kill -9 $proceso
                                            clear
                                            echo "::::::::::::::::::::::::::::::::::::::::::::::::"
                                            echo "::::::::::::                      ::::::::::::::"
                                            echo "::::::::::::      PREBEPLAYER     ::::::::::::::"
                                            echo "::::::::::::                      ::::::::::::::"
                                            echo "::::::::::::::::::::::::::::::::::::::::::::::::"
                                            echo ""
                                            echo ""
                                            echo "-----------------------------------------[ MP3 ]"
                                            echo ""
                                            echo "[ Reproduciendo `pwd`$captura ]"
                                            echo ""
                                            echo "------------------------------------------------"
                                            echo ""
                                            echo ""
                                            afplay `pwd`/$captura &
                                            captura="salir"

                                    fi
                
                                else
                                    if [ "$captura" == "salir" ]
                                        then
                                        captura="salir"
                                        else
                                            clear
                                            echo "::::::::::::::::::::::::::::::::::::::::::::::::"
                                            echo "::::::::::::                      ::::::::::::::"
                                            echo "::::::::::::      PREBEPLAYER     ::::::::::::::"
                                            echo "::::::::::::                      ::::::::::::::"
                                            echo "::::::::::::::::::::::::::::::::::::::::::::::::"
                                            echo ""
                                            echo ""
                                            echo "Libreria Actual: "
                                            pwd
                                            echo ""
                                            echo ""
                                            inc=11
                                            for var in `ls | cut -f 1`
                                                do
                                                    echo -en "\033[$inc;10H"
                                                    echo $var
                                                    inc=$(($inc+1))
                                                done
                                            echo ""
                                            echo "Lo que ingresaste no es archivo .mp3 ni directorio."
                                    fi
                            fi
                    fi
                        
    fi
done
echo "Presiona [enter] para continuar."









