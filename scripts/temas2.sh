#!/usr/bin/env bash
# Desenvolvido pelo William Santos
# contato: thespation@gmail.com ou https://github.com/thespation

# Cores (tabela de cores: https://gist.github.com/avelino/3188137)
VERM="\033[1;31m"	#Deixa a saída na cor vermelho
VERD="\033[0;32m"	#Deixa a saída na cor verde
CIAN="\033[0;36m"	#Deixa a saída na cor ciano
NORM="\033[0m"		#Volta para a cor padrão

## Alias
TEMPTHEME="/tmp/archcraft-themes"	#Pasta temporária dos temas
FINALTHEME="/usr/share/themes/"		#Pasta dos temas do sistema

#Testar se já baixou os temas	
BAIXARTEMA () {
if [[ -d "${TEMPTHEME}" ]]; then #Verifica se existe a pasta temporária dos temas
		COPTEMA
	else
		echo -e "\n${CIAN}[ ] Baixando os temas para" ${TEMPTHEME} ${NORM}
		cd /tmp && git clone https://github.com/archcraft-os/archcraft-themes
		chmod 755 archcraft-themes/* -R #Concede permissão à pasta baixada
		echo -e "${VERD}[*] Temas na pasta" ${TEMPTHEME} ${NORM}
		COPTEMA
fi
}
# COPTEMA - copia os temas para de temas do usuário	
COPTEMA () {
	echo -e "\n${CIAN}[ ] Copiando os temas para" $FINALTHEME ${NORM} # Copiando os temas para a pasta de temas "/usr/share/themes"
		sudo cp -rf ${TEMPTHEME}/*/files/* ${FINALTHEME}
	if [[ -d "${FINALTHEME}/Spark" || "${FINALTHEME}/Sweet-Dark" ]]; then #Verifica se as pastas estão no lugar certo
		ls $FINALTHEME #Exibe a pasta de temas
		echo -e "${VERD}[*] Temas copiados para a pasta" $FINALTHEME ${NORM} #Notifica sucesso
	else
		echo -e "\n${VERM}[!] Não foi possível copiar os temas\n" ${NORM} #Notifica em caso de falha
	fi
}
# Iniciar verificação, download e cópia dos arquivos
BAIXARTEMA
