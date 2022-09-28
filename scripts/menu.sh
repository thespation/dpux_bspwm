#!/usr/bin/env bash
# Desenvolvido pelo William Santos
# contato: thespation@gmail.com ou https://github.com/thespation

# Cores (tabela de cores: https://gist.github.com/avelino/3188137)
VERM="\033[1;31m"	#Deixa a saída na cor vermelho
VERD="\033[0;32m"	#Deixa a saída na cor verde
CIAN="\033[0;36m"	#Deixa a saída na cor ciano
NORM="\033[0m"		#Volta para a cor padrão

#Alias
GIT='https://raw.githubusercontent.com/thespation/dpux_bspwm/main/scripts/'
CURL='curl -s'

#Menu de seleção, possibilidades disponíveis
MENU () {
	echo -e "\n${CIAN}[ ] Escolha uma das opções disponíveis\n" ${NORM}
	echo -e "${VERD}[1] Instalar e configurar BSPWM personalizado" ${NORM}
	echo -e "[2] Instalar apenas os ícones" ${NORM}
	echo -e "[3] Instalar apenas os temas" ${NORM}
	echo -e "[4] Instalar todos os ícones e temas" ${NORM}
	echo -e "${VERM}[5] Sair\n" ${NORM}
	echo -e "\n[ ] Digite a opção desejada:" ${NORM}
	read resposta ; case $resposta in
		1) BSPWMPERS 	;;
		2) ICONS 	;;
		3) TEMAS 	;;
		4) ICOTHE	;;
		5) exit		;;
		*) "Opção desconhecida." ; echo ; MENU ;;
	esac
}

#Caso seja escolhida a opção [1] base bspwm
BSPWMPERS () {
	${CURL} ${GIT}base.sh | bash
	MENU
}

ICONS () {
	${CURL} ${GIT}icones.sh | bash
	MENU
}

TEMAS () {
	${CURL} ${GIT}temas.sh | bash
	MENU
}

ICOTHE () {
	${CURL} ${GIT}icones.sh | bash &&
	${CURL} ${GIT}temas.sh | bash
	MENU
	
	#echo -e "${VERD}[*] Tudo instalado e configurado. Aproveite!" ${NORM}
}

# Iniciar Menu
clear; MENU
