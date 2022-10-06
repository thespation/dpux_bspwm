#!/usr/bin/env bash
# Desenvolvido pelo William Santos
# contato: thespation@gmail.com ou https://github.com/thespation

# Cores (tabela de cores: https://gist.github.com/avelino/3188137)
VERM="\033[1;31m"	#Deixa a saída na cor vermelho
VERD="\033[0;32m"	#Deixa a saída na cor verde
CIAN="\033[0;36m"	#Deixa a saída na cor ciano
NORM="\033[0m"		#Volta para a cor padrão

# Termina, em caso de erro de execução
set -e

# Alias
DATA=`date +%F.%T`		PASTA="$HOME/.config/"	
PTMP='/tmp/dpux_bspwm/home/xubuntu/'
COP="cp -rf"			SCOP="sudo cp -rf"

# Copiar arquivos personalizados para Xubuntu
COPI () {
	#echo -e "\n${CIAN}[ ] Iniciar processo de cópia" ${NORM}
		${COP} ${PTMP}.fehbg $HOME						#Arquivo responsável pelo papel de parede
		${COP} ${PTMP}powermenu ${PASTA}bspwm/rofi/bin				#Arquivos responsável pelo menu de desligamento
		${SCOP} ${PTMP}nordico.png /usr/share/xfce4/backdrops/			#Papel de parede nordico para o Xubuntu
		PNEOF && mkdir -p ${PASTA}/neofetch					#Arquivos para exibição personalizada do neofetch
		${COP} ${PTMP}config.conf ${PASTA}/neofetch				#Arquivos para exibição personalizada do neofetch
		PTHUN && ${COP} ${PTMP}Thunar/ ${PASTA}					#Arquivos para ações personalizadas no Thunar
		PSXHK && ${COP} ${PTMP}sxhkd/ ${PASTA}					#Responsável pelas teclas de atalhos
		PLIGH && ${SCOP} ${PTMP}lightdm-gtk-greeter.conf /etc/lightdm/		#Personalização do LightDM
	echo -e "${VERD}[*] Arquivos de personalização copiados" ${NORM}
}

# Verificar se existe a pasta neofetch, caso tenha faz backup antes de jogar o arquivo
PNEOF () {
	if [[ -d "${PASTA}neofetch" ]]; then
		echo -e "\n${CIAN}[ ] Fazendo backup da pasta ${PASTA}neofetch" ${NORM}
		mv ${PASTA}neofetch ${PASTA}neofetch.bkp.${DATA}	
		echo -e "${VERD}[*] Backup realizado com sucesso" ${NORM}
	fi
}

# Verificar se existe a pasta Thunar, caso tenha faz backup antes de jogar a pasta
PTHUN () {
	if [[ -d "${PASTA}Thunar" ]]; then
		echo -e "\n${CIAN}[ ] Fazendo backup da pasta ${PASTA}Thunar" ${NORM}
		mv ${PASTA}Thunar ${PASTA}Thunar.bkp.${DATA}
		echo -e "${VERD}[*] Backup realizado com sucesso" ${NORM}
	fi
}

# Verificar se existe o arquivo sxhkdrc, caso tenha faz backup antes de jogar o arquivo
PSXHK () {
	if [[ -d ${PASTA}sxhkd ]]; then
		echo -e "\n${CIAN}[ ] Fazendo backup da arquivo sxhkd" ${NORM}
		mv ${PASTA}sxhkd ${PASTA}sxhkd.bkp.${DATA}	
		echo -e "${VERD}[*] Backup realizado com sucesso" ${NORM}
	fi
}

# Faz backup antes de jogar o arquivo lightdm-gtk-greeter.conf
PLIGH () {
	if [[ -f /etc/lightdm/lightdm-gtk-greeter.conf ]]; then
		echo -e "\n${CIAN}[ ] Fazendo backup da arquivo lightdm-gtk-greeter.conf" ${NORM}
		sudo mv /etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf.bkp.${DATA}	
		echo -e "${VERD}[*] Backup realizado com sucesso" ${NORM}
	fi
}

# Inicia script
COPI
