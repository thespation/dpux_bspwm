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
	echo -e "[1] Instalar APENAS a base BSPWM (sem as personalizações)" ${NORM}
	echo -e "[2] Copiar os arquivos personalizados (sem instalar a base e personalizações)" ${NORM}
	echo -e "[3] Instalar todos os ícones" ${NORM}
	echo -e "[4] Instalar todos os temas" ${NORM}
	echo -e "[5] Instalar todos os ícones e temas" ${NORM}
	echo -e "${VERD}[6] Todas as opções juntas (instalar e configurar)" ${NORM}
	echo -e "${VERM}[7] Sair\n" ${NORM}
	echo -e "\n[ ] Digite a opção desejada:" ${NORM}
	read resposta ; case $resposta in
		1) BASE 	;;
		2) PERSONA 	;;
		3) ICONS 	;;
		4) TEMAS 	;;
		5) ICOTHE	;;
		6) TODOS	;;
		7) exit		;;
		*) "Opção desconhecida." ; echo ; MENU ;;
	esac
}

#Caso seja escolhida a opção [1] base bspwm
BASE () {
	${CURL} ${GIT}base.sh | bash
	MENU
}

PERSONA () {
	#${CURL} ${GIT}persona.sh | bash
	echo -e "\n${VERM}[!] Script sendo produzido\n" ${NORM}
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
}

TODOS () {
	#${CURL} ${GIT}todos.sh | bash
	echo -e "${VERD}[*] Tudo instalado e configurado. Aproveite!" ${NORM}
}

# Iniciar Menu
clear; MENU
