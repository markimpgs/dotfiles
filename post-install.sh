#!/bin/bash

clear

C1='\033[0;31m' # Vermelho
C2='\033[0;32m' # Verde
C3='\033[0;34m' # Azul
NC='\033[0m'
VERSAO="$(awk '/^VERSION=/' /etc/*-release | awk -F"[()]" '{print $2}')"

function instalarPacotes () {
	clear

    if (whiptail --yesno "Instalar pacotes automaticamente?" --yes-button "Auto" --no-button "Manual" 15 50)
    then
        if [ $? = 0 ]
        then
            echo -e "${C2}############################"
            echo -e "Atualizando"
            echo -e "############################"${NC}
            sudo apt-get update
            sudo apt-get upgrade

            echo -e "${C2}\n############################"
            echo -e "Instalando pacotes básicos"
            echo -e "############################${NC}\n"
            sudo apt-get install -y git software-properties-common curl zsh

            echo -e "${C2}\n############################"
            echo -e "Instalando drivers$"
            echo -e "############################${NC}\n"
            sudo apt-add-repository non-free
            sudo apt-add-repository contrib
            sudo apt-get update
            sudo apt-get install firmware-realtek firmware-iwlwifi
            sudo modprobe -r iwlwifi 
            sudo modprobe iwlwifi

            echo -e "${C2}\n############################"
            echo -e "Placa de Video e BumbleBee"
            echo -e "############################${NC}\n"
            sudo apt-get install bumblebee-nvidia primus
            sudo dpkg --add-architecture i386 && sudo apt-get update && sudo apt-get install bumblebee-nvidia primus primus-libs:i386 libgl1-nvidia-glx:i386
            sudo adduser $USER bumblebee
            
            echo "Instalando OhMyZsh"
            sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
            wget https://raw.githubusercontent.com/caiogondim/bullet-train.zsh/master/bullet-train.zsh-theme -O ~/.oh-my-zsh/themes/bullet-train.zsh-theme

            echo -e "${C2}\n############################"
            echo -e "Instalando Vim"
            echo -e "############################${NC}\n"
            sudo apt-get update
            sudo apt-get install ncurses-dev
            cd /tmp
            git clone https://github.com/vim/vim.git
            cd vim/src
            make
            sudo make install

            echo "Instalando Tilda Terminal"
            sudo apt-get update
            sudo apt-get install dh-autoreconf autotools-dev debhelper libconfuse-dev libgtk-3-dev libvte-2.91-dev pkg-config
            cd /tmp
            git clone https://github.com/lanoxx/tilda.git
            cd tilda
            source autogen.sh
            make
            sudo make install

        else
            echo "Manual"
        fi
    fi

	menuInstalacao
}

function copiarDotFiles() {
    echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" | sudo tee -a ~/.zshrc
    git clone --bare https://github.com/markimpgs/dotfiles.git $HOME/.cfg
	menuInstalacao
}

function instalarProgramas() {
	PRG=$(whiptail --title "Lista de Programas" --checklist --fb \
		"Quais programas instalar?" 15 50 5 \
		"1" "VirtualBox" ON \
		"2" "Tilda" ON \
		"3" "PlayOnLinux" OFF \
		"4" "PS4 SDK" OFF \
		"5" "Android Studio" OFF 3>&1 1>&2 2>&3)

    status=$?
    if [ $status = 0 ]; then    
        for prog in ${PRG[@]}; do
            echo $prog
        if [ $prog = '"1"' ]; then
            echo "Virtual"
        elif [ $prog = '"2"' ]; then
            echo "Tilda"
        else
            echo "Selecione uma opção"
        fi
        done
    fi
}

function menuInstalacao() {
	item=$(
	whiptail --title "Markim Post Install Script" --menu "Escolha uma opção" --fb 15 50 4 \
	"1" "Instalar Pacotes Essenciais" \
	"2" "Copiar Dotfiles" \
	"3" "Instalar Programas"  3>&1 1>&2 2>&3)
	 
	status=$?
	if [ $status = 0 ]; then
	   if [ $item = 1 ]; then
		echo "Instalando pacotes"
		instalarPacotes
	   elif [ $item = 2 ]; then
		echo "Copiando dotfiles"
		copiarDotFiles
	   elif [ $item = 3 ]; then
		echo "Instalar Programas"
		instalarProgramas
	   fi
	else
	   echo "Opção cancelada."
	fi
}

menuInstalacao
