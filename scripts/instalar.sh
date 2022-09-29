#!/usr/bin/env bash
# Desenvolvido pelo William Santos
# contato: thespation@gmail.com ou https://github.com/thespation

# Cores (tabela de cores: https://gist.github.com/avelino/3188137)
VERM="\033[1;31m"	#Deixa a saída na cor vermelho
VERD="\033[0;32m"	#Deixa a saída na cor verde
NORM="\033[0m"		#Volta para a cor padrão
# Alias de identificação de distro
INXI=`inxi -S` 				#Necessário para identifiar a DE (xfce ou gnome)
RELEASE=`lsb_release -r`	#Identifica a versão da distro
VERU="22.04" 				#Utual versão do Ubuntu
ID=`lsb_release -i`			#Identifica qual distro é
PAST="/tmp/dpux_bspwm/scripts/"

# Verificação da distro base
VERI () {
		if [[ ${INXI} = *Xfce* && ${INXI} = ${VERU} && ${INXI} = *Ubuntu* ]]; then #Testa se é Xubuntu
			inxi -S ; echo -e "\n${VERD}[*] Sistema suportado, instalação seguirá" ${NORM} && sleep 3s
			curl -s https://raw.githubusercontent.com/thespation/dpux_bspwm/main/scripts/base.sh | bash
			#./scripts/xubuntu.sh
		elif [[ $ID = "Distributor ID:	Pop" && $RELEASE = "Release:	22.04" ]]; then #Testa se é o PopOs
			inxi -S ; echo -e "\n${VERD}[*] Sistema suportado, instalação seguirá" ${NORM} && sleep 3s
		elif [[ ${INXI} = *Xfce* && "Distributor ID:	Debian" && (${RELEASE} = "Release:	testing" || ${RELEASE} = "Release:	11") ]]; then #Testa se é Debian xfce
			inxi -S ; echo -e "\n${VERD}[*] Sistema suportado, instalação seguirá" ${NORM} && sleep 3s
			${PAST}base.sh
		elif [[ ${INXI} = *GNOME* && ${INXI} = ${VERU} && ${INXI} = *Ubuntu* ]]; then #Testa se é Ubuntu
			inxi -S ; echo -e "\n${VERD}[*] Sistema suportado, instalação seguirá" ${NORM} && sleep 3s
			#./scripts/ubuntu.sh
		elif [[ ${INXI} = *GNOME* && "Distributor ID:	Debian" && (${RELEASE} = "Release:	testing" || ${RELEASE} = "Release:	11") ]]; then #Testa se é Debian GNOME
			inxi -S ; echo -e "\n${VERD}[*] Sistema suportado, instalação seguirá" ${NORM} && sleep 3s
			#./scripts/debiangnome.sh
		elif [[ ${INXI} = *GNOME* && ${INXI} = *Fedora* ]]; then
			inxi -S ; echo -e "\n${VERD}[*] Sistema suportado, instalação seguirá" ${NORM} && sleep 3s
			#./scripts/fedora.sh
		else	
			clear && echo -e "\n${VERM}[!] Sistema, DE ou versão não suportada\n" ${NORM}
			echo "#--------Esse script foi desenvolvido para rodar nas seguintes distros:-------#"		
			echo "#-----------------Debian Bullseye ou Bookworm (xfce e gnome)------------------#"
			echo "#------------------------------Fedora GNOME-----------------------------------#"
			echo "#------------------------------Pop!_Os 22.04----------------------------------#"
			echo "#--------------------------Ubuntu ou Xubuntu 22.10----------------------------#"
			echo -e "#----Caso esteja usando uma das citadas, é necessário ter 'inxi' instalado----#\n"		
			sleep 3
	fi
}
# Iniciar verificação
clear
VERI
