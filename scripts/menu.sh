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
	echo -e "[2] Instalar apenas os ícones"
	echo -e "[3] Instalar apenas os temas" 
	echo -e "[4] Instalar todos os ícones e temas" 
	echo -e "${VERM}[5] Sair\n" ${NORM}
	read -p "[?] Digite a opção desejada: " RESPOSTA

	  if [[ $RESPOSTA = "1" ]]; then
		BSPWMPERS
	elif [[ $RESPOSTA = "2" ]]; then
		ICONS
	elif [[ $RESPOSTA = "3" ]]; then
		TEMAS
	elif [[ $RESPOSTA = "4" ]]; then
		ICOTHE
	elif [[ $RESPOSTA = "5" ]]; then
		exit 1
	else
		echo -e "\n${VERM}Opção desconhecida\n" ${NORM} ; echo ;  MENU
	fi
}

#Caso seja escolhida a opção [1]
BSPWMPERS () {
	${CURL} ${GIT}instalar.sh | bash
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
	${CURL} ${GIT}icones.sh | bash && ${CURL} ${GIT}temas.sh | bash
	MENU	
}

# Iniciar Menu
clear; MENU
