#!/bin/bash
#.▄▄ ·▄▄▄▄▄▄▄▄ .▄▄▌  ▄▄▌   ▄▄▄· ▄▄▄  .▄▄ · .▄▄▄  ▄• ▄▌ ▄▄▄· ·▄▄▄▄
#▐█ ▀.•██  ▀▄.▀·██•  ██•  ▐█ ▀█ ▀▄ █·▐█ ▀. ▐▀•▀█ █▪██▌▐█ ▀█ ██▪ ██
#▄▀▀▀█▄▐█.▪▐▀▀▪▄██▪  ██▪  ▄█▀▀█ ▐▀▀▄ ▄▀▀▀█▄█▌·.█▌█▌▐█▌▄█▀▀█ ▐█· ▐█▌
#▐█▄▪▐█▐█▌·▐█▄▄▌▐█▌▐▌▐█▌▐▌▐█ ▪▐▌▐█•█▌▐█▄▪▐█▐█▪▄█·▐█▄█▌▐█ ▪▐▌██. ██
# ▀▀▀▀ ▀▀▀  ▀▀▀ .▀▀▀ .▀▀▀  ▀  ▀ .▀  ▀ ▀▀▀▀ ·▀▀█.  ▀▀▀  ▀  ▀ ▀▀▀▀▀•
#
# Author: Tyranzx
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

# EX: ./sattack.sh -i 164.132.119.73 -p 25565 -t 5 -m true -s minecraft

function helpUsage(){
clear
echo -e "${red}"
echo -e "  ██████  ▄▄▄     ▄▄▄█████▓▄▄▄█████▓ ▄▄▄      ▄████▄   ██ ▄█▀ "
echo -e " ▒██    ▒ ▒████▄   ▓  ██▒ ▓▒▓  ██▒ ▓▒▒████▄   ▒██▀ ▀█   ██▄█▒  "
echo -e " ░ ▓██▄   ▒██  ▀█▄ ▒ ▓██░ ▒░▒ ▓██░ ▒░▒██  ▀█▄ ▒▓█    ▄ ▓███▄░  "
echo -e "   ▒   ██▒░██▄▄▄▄██░ ▓██▓ ░ ░ ▓██▓ ░ ░██▄▄▄▄██▒▓▓▄ ▄██▒▓██ █▄  "
echo -e " ▒██████▒▒ ▓█   ▓██▒ ▒██▒ ░   ▒██▒ ░  ▓█   ▓██▒ ▓███▀ ░▒██▒ █▄ "
echo -e " ▒ ▒▓▒ ▒ ░ ▒▒   ▓▒█░ ▒ ░░     ▒ ░░    ▒▒   ▓▒█░ ░▒ ▒  ░▒ ▒▒ ▓▒ "
echo -e " ░ ░▒  ░ ░  ▒   ▒▒ ░   ░        ░      ▒   ▒▒ ░ ░  ▒   ░ ░▒ ▒░ "
echo -e " ░  ░  ░    ░   ▒    ░        ░        ░   ▒  ░        ░ ░░ ░  "
echo -e "       ░        ░  ░                       ░  ░ ░      ░  ░    "
echo -e "                                              ░                "
echo -e "\n${BRed}✖ ${white}Uso correcto: ${0} [-i <address>] [-p <port>]"
echo -e "\t${green}[${yellow}+${green}]${white} i = Address | p = Port"
echo -e "\n${BYellow}⚠️ ${white}Otro: \n\t${white}Ejemplo de puertos: \n\t\t${yellow}[${red}*${yellow}] ${white}445\n\t\t${yellow}[${red}*${yellow}] ${white}139\n\t\t${yellow}[${red}*${yellow}] ${white}3306\n\t\t${yellow}[${red}*${yellow}] ${white}53\n\t\t${yellow}[${red}*${yellow}] ${white}22\n\t\t${yellow}[${red}*${yellow}] ${white}2222\n\t\t${yellow}[${red}*${yellow}] ${white}2000-65535 ${red}[Minecraft]\n\t\t${yellow}[${red}*${yellow}] ${white}25565 ${red}[Minecraft Localhost]" #\n\t${white}Developers:\n\t\t${yellow}[${red}*${yellow}] ${white}Tyranzx"
echo -e "\n${BGreen}✔ ${white}Ejemplo: ${0} -i 164.132.119.73 -p 2000-65535"
echo -e "\t${green}[${yellow}+${green}]${white} Ejemplo de una escala de puertos.\n\n"
exit 1
}

trap ctrl_c INT

function ctrl_c(){
echo " "
echo -e "${red} Cerrando script.."; sleep 0.5; exit 0
}

args=0; while getopts ":i:p:" o; do
	case "${o}" in
		i)
		  i=${OPTARG}; let args+=1
		  ;;
		p)
		  p=${OPTARG}; let args+=1
		  ;;
		*)
		helpUsage;;
	esac
done

if [ ${args} -ne 2 ]; then
	helpUsage
else
	clear
	echo -e "\n${white} ◆ ${red}Objetivo: ${white}${i}"
	echo -e "${white} ◆ ${red}Puerto Especificado: ${white}${p}"
	sleep 1; echo -e "\n\n${white}[${green}!${white}]${white} Escaneando puertos..\n${clear}"
	sleep 3; touch ~/.config/bin/sattack_target; nmap -p ${p} -v -T4 -A ${i} -oG ~/.config/bin/sattack_target
	sleep 1; echo -e "\n\n\n${BGreen}✔ ${white}Se han escaneado los puertos correctamente. Leyendo resultados de ${yellow}~/.config/bin/sattack_target${white}.."
	sleep 2
	echo -ne "\n${green}▶———————————————————————————————————————————◀${white}\n\n"
	grep -v ^\# ~/.config/bin/sattack_target | tr '/' ' '; echo -ne "\n${green}▶———————————————————————————————————————————◀\n"; exit 0
fi
