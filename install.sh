#!/bin/bash

# Colors
green="\e[0;32m\033[1m"
white='\033[0;37m'

sudo cp ./sattack.sh /usr/bin/
sudo chmod +x /usr/bin/sattack.sh
clear; echo "alias sa='/usr/bin/./sattack.sh'" >> ~/.zshrc
sleep 1; echo -e "\n\n${green}✔ ${white}SAttack instalado correctamente | Incluido en ${green}/usr/bin/${white}, vuelve a abrir la terminal y ejecuta el comando 'sa'"
