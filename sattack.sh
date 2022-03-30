#!/bin/bash

# ____  _       _ _            ____                        _
#/ ___|| |_ ___| | | __ _ _ __/ ___|  __ _ _   _  __ _  __| |
#\___ \| __/ _ \ | |/ _` | '__\___ \ / _` | | | |/ _` |/ _` |
# ___) | ||  __/ | | (_| | |   ___) | (_| | |_| | (_| | (_| |
#|____/ \__\___|_|_|\__,_|_|  |____/ \__, |\__,_|\__,_|\__,_|
#                                       |_|

#Colors
green="\e[0;32m\033[1m"
closecolor="\033[0m\e[0m"
clear='\033[0m'
red="\e[0;31m\033[1m"
purple="\e[0;35m\033[1m"
magenta='\033[0;35m'
cyan='\033[0;36m'
gray="\e[0;37m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"


helpUso() { 

clear
echo -e "${purple}-------------------------------------"
echo " "
echo -e "${red}✘ Uso: $0 [-i <address>] [-a <minecraft|machine|other>]" 1>&2; 
echo " "
echo -e "${purple}-------------------------------------"
exit 1;

}

while getopts ":i:a:" p; do
    case "${p}" in
	i)
	    i=${OPTARG}
    	    ;;
	a)
            a=${OPTARG}
            ;;
	*)
            helpUso
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${i}" ] || [ -z "${a}" ]; then
    helpUso
fi

clear
echo -e "${purple}---------------------------"
echo " "
echo -e "${red} Objetivo: ${gray}${i}"
echo -e "${red} Tipo de ataque: ${gray}${a}"
echo " "
echo -e "${purple}---------------------------${clear}"
echo -e "${green} Escaneando puertos del objetivo.."

if [ ${a} = 'minecraft' ]; then
	touch ~/Desktop/target.txt; nmap -oN ~/Desktop/target.txt -p 2000-65535 -Pn -v -A ${i} &>/dev/null
elif [ ${a} = 'machine' ]; then
	sudo nmap -oN ~/Desktop/target.txt -p 22-3306 -Pn -v -A ${i} &>/dev/null
elif [ ${a} = '' ]; then
	nmap -oN ~/Desktop/target.txt -F ${i} &>/dev/null
fi

echo " "
echo -e "${green}✔ ${gray}Se han escaneado los puertos correctamente."
echo -e "${gray}Leyendo el archivo ${yellow}target.txt ${gray}que se encuentra en el escritorio.."
echo " "
echo -e "${green}---------------------------------${gray}"
sleep 5; cat ~/Desktop/target.txt
echo -e "${green}---------------------------------"
sleep 5; echo " "; echo -e "${red} Cerrando script.."; sleep 5; rm ~/Desktop/target.txt; clear

