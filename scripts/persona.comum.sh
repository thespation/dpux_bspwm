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
REPO="https://github.com/thespation/dpux_bspwm"
GIT="git clone"			PTMP='/tmp/dpux_bspwm/home/'
COP="cp -rf"			SCOP="sudo cp -rf"
USRP='/usr/local/bin'

# Clonar o repositório com as personalizações
BAIREP () {
	echo -e "\n${CIAN}[ ] Baixar repositório ${REPO}" ${NORM}
	cd /tmp && ${GIT} ${REPO} && chmod 755 dpux_bspwm/* -R
	echo -e "${VERD}[*] Repositório na pasta temporária" ${NORM}
	COPI
}

# Copiar arquivos personalizados
COPI () {
	echo -e "\n${CIAN}[ ] Iniciar processo de cópia" ${NORM}
		${SCOP} /tmp/dpux_bspwm/fonts/* /usr/share/fonts
	echo -e "${VERD}[*] Fontes copiadas com sucesso" ${NORM}
	
	mv /${PTMP}Xresources.d ${PTMP}.Xresources.d && ${COP} ${PTMP}.Xresources.d $HOME
	${COP} ${PTMP}.Xresources $HOME
	${COP} ${PTMP}.gtkrc-2.0 $HOME
	${COP} ${PTMP}.xsettingsd $HOME
	${SCOP} ${PTMP}xubuntu/apps_as_root.sh ${USRP}
	${SCOP} ${PTMP}xubuntu/nmd ${USRP}
	${SCOP} ${PTMP}xubuntu/askpass_rofi.sh ${USRP}
	#echo -e "${VERD}[*] Arquivos de personalização copiados" ${NORM}
	
	PBSPWM && PDUNST && PGEANY && PGTK3 &&
	${COP} ${PTMP}config/* ~/.config
}

# Verificar se existe a pasta bspwm, caso tenha faz backup antes de copiar
PBSPWM () {
	if [[ -d "${PASTA}bspwm" ]]; then
		echo -e "\n${CIAN}[ ] Fazendo backup da pasta ${PASTA}bspwm" ${NORM}
		mv ${PASTA}bspwm ${PASTA}bspwm.bkp.${DATA}	
		echo -e "${VERD}[*] Backup realizado com sucesso" ${NORM}
	fi
}

# Verificar se existe a pasta dunst, caso tenha faz backup antes de copiar
PDUNST () {
	if [[ -d "${PASTA}dunst" ]]; then
		echo -e "\n${CIAN}[ ] Fazendo backup da pasta ${PASTA}dunst" ${NORM}
		mv ${PASTA}dunst ${PASTA}dunst.bkp.${DATA}	
		echo -e "${VERD}[*] Backup realizado com sucesso" ${NORM}
	fi
}

# Verificar se existe a pasta geany, caso tenha faz backup antes de copiar
PGEANY () {
	if [[ -d "${PASTA}geany" ]]; then
		echo -e "\n${CIAN}[ ] Fazendo backup da pasta ${PASTA}geany" ${NORM}
		mv ${PASTA}geany ${PASTA}geany.bkp.${DATA}	
		echo -e "${VERD}[*] Backup realizado com sucesso" ${NORM}
	fi
}

# Verificar se existe a pasta gtk-3.0, caso tenha faz backup antes de copiar
PGTK3 () {
	if [[ -d "${PASTA}gtk-3.0" ]]; then
		echo -e "\n${CIAN}[ ] Fazendo backup da pasta ${PASTA}gtk-3.0" ${NORM}
		mv ${PASTA}gtk-3.0 ${PASTA}gtk-3.0.bkp.${DATA} && mkdir -p ${PASTA}gtk-3.0
		${COP} ${PASTA}gtk-3.0.bkp.*/bookmarks ${PASTA}gtk-3.0/bookmarks 	#Copia os atalhos personalizados do thunar
		echo -e "${VERD}[*] Backup realizado com sucesso" ${NORM}
	fi
}

# Inicia script
BAIREP
