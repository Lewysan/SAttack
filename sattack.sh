#!/bin/bash
# ____  _       _ _            ____                        _
#/ ___|| |_ ___| | | __ _ _ __/ ___|  __ _ _   _  __ _  __| |
#\___ \| __/ _ \ | |/ _` | '__\___ \ / _` | | | |/ _` |/ _` |
# ___) | ||  __/ | | (_| | |   ___) | (_| | |_| | (_| | (_| |
#|____/ \__\___|_|_|\__,_|_|  |____/ \__, |\__,_|\__,_|\__,_|
#                                       |_|
# Author: Tyranzx
# To: StellarSquad
# Made: 03/31/2022
# Version: 1.5
#
# Colors
green="\e[0;32m\033[1m"
white='\033[0;37m'
black='\033[0;30m'
clear='\033[0m'
red="\e[0;31m\033[1m"
purple="\e[0;35m\033[1m"
magenta='\033[0;35m'
cyan='\033[0;36m'
gray="\e[0;37m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"

# Bold
BBlack='\033[1;30m'
BRed='\033[1;31m'
BGreen='\033[1;32m'
BYellow='\033[1;33m'
BBlue='\033[1;34m'
BPurple='\033[1;35m'
BCyan='\033[1;36m'
BWhite='\033[1;37m'

# Underline
UBlack='\033[4;30m'
URed='\033[4;31m'
UGreen='\033[4;32m'
UYellow='\033[4;33m'
UBlue='\033[4;34m'
UPurple='\033[4;35m'
UCyan='\033[4;36m'
UWhite='\033[4;37m'

# EX: ./scanner2.sh -i 164.132.119.73 -p 25565 -t 5 -m true -s minecraft

helpPanel(){
clear
echo " "
echo -e "${white}———————————————————————————————————————————"
echo " "
echo -e "${BRed}✖ ${red}Uso correcto: ./scanner2.sh [-i <address>] [-p <port>] [-t <0-5>] [-m (Machine) <true|false>] [-s minecraft|other]"
echo -e "${white}i = Address | p = Port | t = Time Policy | m = Specificy Machine | s = Service"
echo " "
echo -e "${white}———————————————————————————————————————————"
echo " "
exit 1
}

while getopts ":i:p:t:m:s:" o; do
	case "${o}" in
		i)
		  i=${OPTARG}
		  ;;
		p)
		  p=${OPTARG}
		  ;;
		t)
		  t=${OPTARG}
		  ((t == 0 || t == 1 || t == 2 || t == 3 || t == 4 || t == 5)) || helpPanel
		  ;;
		m)
		  m=${OPTARG}
		  ((m == "true" || m == "false")) || helpPanel
		  ;;
		s)
		  s=${OPTARG}
		  ((s == "minecraft" || s == "other")) || helpPanel
		  ;;
	esac
done

shift $((OPTIND-1))

if [ -z ${i} ] || [ -z ${p} ] || [ -z ${t} ] || [ -z ${m} ] || [ -z ${s} ]; then
	helpPanel
fi

clear
echo -e "${white}▶———————————————————————————————————————————◀"
echo " "
echo -e "${yellow} ◆ ${cyan}Objetivo: ${white}${i}"
echo -e "${yellow} ◆ ${cyan}Puerto Especificado: ${white}${p}"
echo -e "${yellow} ◆ ${cyan}Tiempo de policy: ${white}${t}"
echo -e "${yellow} ◆ ${cyan}Detectar Maquina: ${white}${m}"
echo -e "${yellow} ◆ ${cyan}Servicio: ${white}${s}"
echo " "
echo -e "${white}▶———————————————————————————————————————————◀"
echo " "
sleep 5; echo -e "${green} Escaneando puertos.."
sleep 5
if [ ${m} = "true" ]; then
	touch ~/Desktop/target.txt; nmap -oN ~/Desktop/target.txt -p ${p} ${i} -v -T${t} -A &>/dev/null
elif [ ${m} = "false" ]; then
	touch ~/Desktop/target.txt; nmap -oN ~/Desktop/target.txt -p ${p} ${i} -v -T${t} &>/dev/null
elif [ ${s} = "other" ]; then
	touch ~/Desktop/target.txt; nmap -oN ~/Desktop/target.txt -p 80-${p} ${i} -sS -v -T${t} &>/dev/null
elif [ ${s} = "minecraft" ]; then
	touch ~/Desktop/target.txt; nmap -oN ~/Desktop/target.txt -p ${p} ${i} -v -T${t} -A &>/dev/null
else
	errorMessage
fi

clear
sleep 2; echo " "; echo -e "${BGreen}✔ ${white} Se han escaneado los puertos correctamente. Leyendo resultados.."
sleep 3
echo " "
echo -e "${green}▶———————————————————————————————————————————◀${white}"
echo " "
cat ~/Desktop/target.txt
echo " "
echo -e "${green}▶———————————————————————————————————————————◀"
echo " "
sleep 5; echo -e "${red} Cerrando script en 10 segundos.."
sleep 10; rm ~/Desktop/target.txt; clear; exit 0
