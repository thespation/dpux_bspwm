#!/usr/bin/env bash
# Desenvolvido pelo William Santos
# contato: thespation@gmail.com ou https://github.com/thespation

# Cores (tabela de cores: https://gist.github.com/avelino/3188137)
VERM="\033[1;31m"	#Deixa a saída na cor vermelho
VERD="\033[0;32m"	#Deixa a saída na cor verde
CIAN="\033[0;36m"	#Deixa a saída na cor ciano
NORM="\033[0m"		#Volta para a cor padrão
# Alias de instalação
SUDD='sudo apt' 	#Base Debian
SUDF='sudo dnf' 	#Fedora
INXI=`inxi -S` 		#Necessário para identifiar a DE (xfce ou gnome)
GIT='https://raw.githubusercontent.com/thespation/dpux_bspwm/main/scripts/' #Pasta dos scripts
CURL='curl -s'		#Comando para execução do scritp, sem baixar
# Pacotes para instalação
PACP="bspwm sxhkd rofi picom polybar dunst" #Base BSPWM
PACC="neofetch htop feh geany dmenu nm-tray xfconf xsettingsd xfce4-power-manager" #Comum a todos os sistemas
PACDG="mate-polkit i3lock xsetroot" #Somente para GNOME
PACDX="thunar-archive-plugin catfish baobab meld" #Somente para Xfce. Para Xubuntu "language-selector-gnome"

#Responsável por atualizar o sistema, instalar a base BSPWM e apps complementares
ATUAS () { 
	if [[ ${INXI} = *Debian* || ${INXI} = *Ubuntu* || ${INXI} = *Pop* ]]; then #Testa se é base Debian
		echo -e "\n${CIAN}[ ] Atualizar sistema" ${NORM}
			${SUDD} update && ${SUDD} upgrade -y && ${SUDD} dist-upgrade -y &&
			${SUDD} autoclean && ${SUDD} autoremove -y &&
		echo -e "${VERD}[*] Sistema atualizado" ${NORM} && sleep 3s
		echo -e "\n${CIAN}[ ] Instalar base BSPWM" ${NORM}
			${SUDD} install ${PACP} -y &&
		echo -e "${VERD}[*] Base BSPWM instalada com sucesso: \"${PACP}\"" ${NORM}
		echo -e "\n${CIAN}[ ] Instalar APPs complementares" ${NORM}
			${SUDD} install ${PACC} -y &&
		echo -e "${VERD}[*] Apps instalados: \"${PACC}\" " ${NORM}
		KSUD
	elif [[ ${INXI} = *Fedora* ]]; then
		echo -e "\n${CIAN}[ ] Atualizar sistema" ${NORM}
			${SUDF} update -y && ${SEGU} &&
		echo -e "${VERD}[*] Sistema atualizado" ${NORM} && sleep 3s
		
		echo -e "\n${CIAN}[ ] Instalar base BSPWM" ${NORM}
			${SUDF} -y ${PACP} &&
		echo -e "${VERD}[*] Base BSPWM instalada com sucesso" ${NORM}
		KSUF
	else
		echo -e "${VERM}[!] Sistema, DE ou versão não suportada\n" ${NORM}
	fi
}

#Responsável por habilitar o menu iniciar na tecla super, base Debian
KSUD () { 
	echo -e "\n${CIAN}[ ] Habilitar tecla Super para abrir menu" ${NORM}
		${SUDD} install gcc make libx11-dev libxtst-dev pkg-config -y &&
		cd /tmp && git clone https://github.com/hanschen/ksuperkey.git &&
		cd ksuperkey
		make && sudo make install &&
	echo -e "${VERD}[*] Tecla Super habilitada com sucesso" ${NORM}
}

#Responsável por habilitar o menu iniciar na tecla super, Fedora
KSUF () { 
	echo -e "\n${CIAN}[ ] Habilitar tecla Super para abrir menu" ${NORM}
		${SUDF} install -y snapd &&
		sudo ln -s /var/lib/snapd/snap /snap && sudo snap wait system seed.loaded
		sudo systemctl enable --now snapd.socket && sudo systemctl start --now snapd.socket
		sudo systemctl restart --now snapd.socket && sudo snap install ksuperkey		
	echo -e "${VERD}[*] Tecla Super habilitada com sucesso" ${NORM}
}

#Aplicativos específicos a Xfce ou GNOME
APPSC () {
	if [[ ${INXI} = *Xfce* && (${INXI} = *Debian* || ${INXI} = *Ubuntu*) ]]; then #Testa se é base Debian Xfce
		echo -e "\n${CIAN}[ ] Instalar APPs para Xfce" ${NORM}
			${SUDD} install ${PACDX} -y &&
		echo -e "${VERD}[*] Apps xfce instalados: \"${PACDX}\" " ${NORM}
	elif [[ ${INXI} = *GNOME* && (${INXI} = *Debian* || ${INXI} = *Ubuntu* || ${INXI} = *Pop*) ]]; then #Testa se é Debian GNOME
		echo -e "\n${CIAN}[ ] Instalar APPs para GNOME" ${NORM}
			${SUDD} install ${PACDG} -y &&
		echo -e "${VERD}[*] Apps GNOME instalados: \"${PACDX} \" " ${NORM}
	elif [[ ${INXI} = *GNOME* && ${INXI} = *Fedora* ]]; then
		echo -e "\n${CIAN}[ ] Instalar APPs para Fedora" ${NORM}
			${SUDF} install -y ${PACC} ${PACDG}&&
		echo -e "${VERD}[*] Apps GNOME instalados: \"${PACC} \" " ${NORM}
	else
		echo -e "\n${VERM}[!] Não foi possível instalar aplicativos complmentares" ${NORM}
	fi
}

#Instalação dos ícones, temas e personalizações comuns
PERCOM () {
	${CURL} ${GIT}temas.sh | bash
	${CURL} ${GIT}icones.sh | bash
	${CURL} ${GIT}persona.comum.sh | bash
}

# Iniciar verificação
ATUAS && APPSC && PERCOM
