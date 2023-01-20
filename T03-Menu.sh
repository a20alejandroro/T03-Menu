#!/bin/bash

#limpiar pantalla

echo `clear`

#menu

function menu() {
	echo ""
	echo -e "\e[1;4mMENU\e[0m"
	echo -e "\e[34m1.Ver contenido de un directorio o archivo"
	echo "2.Buscar archivos por extensión"
	echo "3.Cambiar nombre de un archivo o directorio"
	echo "4.Copiar archivos o directorios"
	echo "5.Crear un enlace simbolico"
	echo "6. Salir del programa"
	echo -e "\e[1;39mNO USES RUTAS INDICANDO EL $HOME\e[0m"
	echo -e "\e[32m"
	read -p "Elige la opcion que quieras: " opcion
	echo ""
}

#inicio programa

#opcion 1

function opcion1() {
	clear;
	read -p "Introduce el nombre de un directorio para ver su contenido: " directorios;
	if [ -d ~/$directorios ]
	then
		ls -R ~/$directorios;
	else
		cat ~/$directorios;
	fi
}

#opcion 2

function opcion2() {
	clear;
	read -p "Introduce en que directorio quieres buscar archivos: " ruta;
	read -p "Introduce una extension: " palabra;
	find ~/$ruta *.$palabra -type d,f;
}

#opcion 3

function opcion3() {
	clear;
	read -p "Introduce el nombre o ruta del archivo o directorio actual: " actual;
	read -p "Introduce el nombre o ruta del archivo o directorio antiguo: " antiguo;
	mv ~/$actual ~/$antiguo;
	cd ~/$antiguo;
	echo "Se ha modificado a: "`pwd`;
}

#opcion 4

function opcion4() {
	clear;
	read -p "Introduce el nombre o ruta del archivo o directorio que quieras copiar (origen): " origen;
	read -p "Introduce el nombre o ruta del archivo o directorio donde quieras tener la copia (destino): " destino;
	cp ~/$origen ~/$destino;
}

#opcion 5

function opcion5() {
	clear;
	read -p "Introduce el nombre o ruta del archivo que quieras crear un enlace simbolico (origen): " origen2;
        read -p "Introduce el nombre o ruta del archivo donde quieras tener el enlace simbolico (destino): " destino2;
        ln ~/$origen2 ~/$destino2
}

while (( opcion != 6 ))
do
	menu

	case $opcion in
		1)
		opcion1
		;;
		2)
		opcion2
		;;
		3)
		opcion3
		;;
		4)
		opcion4
		;;
		5)
		opcion5
		;;
		6)
		echo "Saliste del menu"
		;;
		*)
		echo "Opción invalida, selecione de nuevo un numero válido"
	esac
done
