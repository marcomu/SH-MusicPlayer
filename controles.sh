#!/bin/bash -f
clear
echo "::::::::::::::::::::::::::::::::::::::::::::::::"
echo "::::::::::::                      ::::::::::::::"
echo "::::::::::::      PREBEPLAYER     ::::::::::::::"
echo "::::::::::::                      ::::::::::::::"
echo "::::::::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
    touch temp.txt
    ps > temp.txt
    repro=`cat temp.txt | grep -E ".mp3" | cut -d " " -f 8`            # Nombre de la cancion
    proc=`cat temp.txt | grep -E ".mp3" | cut -d " " -f 1`               # PID de la cancion
    rm temp.txt

if [ "$repro" == "" ]
    then
        echo "No hay nada reproduciendose actualmente."
    else
    echo "Reproduciendo: $repro "
fi

echo ""
echo ""


select opcion in  Play Pause Stop "Volumen" "++Favoritos" Regresar
do
    case $opcion in


        Play)
            if [ "$repro" == "" ]
                then
                    echo "Primero reproduce una cancion."
                else
                    clear
                    echo "::::::::::::::::::::::::::::::::::::::::::::::::"
                    echo "::::::::::::                      ::::::::::::::"
                    echo "::::::::::::      PREBEPLAYER     ::::::::::::::"
                    echo "::::::::::::                      ::::::::::::::"
                    echo "::::::::::::::::::::::::::::::::::::::::::::::::"
                    echo ""
                    echo ""
                    echo "Reproduciendo: $repro "
                    echo ""
                    echo "Play"
                    kill -CONT "$proc"
                    echo ""
                    echo "Presiona [enter] para continuar."
                    
            fi
        ;;

        Pause)
            if [ "$repro" == "" ]
                then
                    echo "Primero reproduce una cancion."
                else
                    clear
                    echo "::::::::::::::::::::::::::::::::::::::::::::::::"
                    echo "::::::::::::                      ::::::::::::::"
                    echo "::::::::::::      PREBEPLAYER     ::::::::::::::"
                    echo "::::::::::::                      ::::::::::::::"
                    echo "::::::::::::::::::::::::::::::::::::::::::::::::"
                    echo ""
                    echo ""
                    echo "Reproduciendo: $repro "
                    echo ""
                    echo "Pause"
                    kill -STOP "$proc"
                    echo ""
                    echo "Presiona [enter] para continuar."
            fi

        ;;



        Stop)
            if [ "$repro" == "" ]
                then
                    echo "Primero reproduce una cancion."
                else
                    clear
                    echo "::::::::::::::::::::::::::::::::::::::::::::::::"
                    echo "::::::::::::                      ::::::::::::::"
                    echo "::::::::::::      PREBEPLAYER     ::::::::::::::"
                    echo "::::::::::::                      ::::::::::::::"
                    echo "::::::::::::::::::::::::::::::::::::::::::::::::"
                    echo ""
                    echo ""
                    echo "$repro detenida."
                    kill -9 "$proc"
                    proc=""
                    repro=""
                    busca=""
                    echo ""
                    echo "Presiona [enter] para continuar."
                    exit


            fi
            
        ;;
        "Volumen")
            if [ "$repro" == "" ]
                then
                    echo "Primero reproduce una cancion."
                else
                read -p "Escribe un numero del 0 al 7: " i
            for i in `sudo osascript -e "set Volume $i"`
                do
                    echo "Nivel de volumen: $i"
                    echo ""
                    echo ""
                    echo "Presiona [enter] para continuar."
                done
                    echo ""
                    echo ""
                    echo "Nivel de volumen: $i"
                    echo "Presiona [enter] para continuar."
            fi
        ;;




        "++Favoritos")
                if [ "$repro" == "" ]
                    then
                        echo "Primero reproduce una cancion."
                    else
                        touch favoritos.txt
                        touch temp.txt
                        ps > temp.txt
                        fav=`cat temp.txt | grep -E ".mp3" | cut -d " " -f 8`
                        existe=`cat favoritos.txt | grep $fav`
                        rm temp.txt

                        if [ "$existe" == "" ]
                            then
                                echo "$fav" >> favoritos.txt
                                echo "La canción: $fav ha sido agregada a Favoritos satisfactoriamente."
                                echo ""
                                echo "Presiona [enter] para continuar."
                            else
                                echo "La cancion ya se encuentra en tus Favoritos."
                                echo ""
                                echo "Presiona [enter] para continuar."
                        fi
                           
                fi
        ;;
            
        Regresar)
        echo "Presiona [enter] para continuar."
        exit
        ;;
        *)
        echo ":::: Por favor escribe únicamente LOS NUMEROS del menu."
        ;;
    esac

done
