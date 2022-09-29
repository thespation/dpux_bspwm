#!/usr/bin/env bash
# Desenvolvido pelo William Santos
# contato: thespation@gmail.com ou https://github.com/thespation

# Cores (tabela de cores: https://gist.github.com/avelino/3188137)
VERM="\033[1;31m"	#Deixa a saída na cor vermelho
VERD="\033[0;32m"	#Deixa a saída na cor verde
CIAN="\033[0;36m"	#Deixa a saída na cor ciano
NORM="\033[0m"		#Volta para a cor padrão
## Alias
CC="sudo cp -rf"		#Comando de cópia de arquivos
GAT="/tmp/archcraft-icons/"	#Pasta temporária dos ícones
USRT="/usr/share/icons/"	#Pasta dos ícones do sistema
FP="/files/*"			#Alias para o final do nome das pastas de ícones

#Funções
	# BAT - Testa/baixa se existe a pasta de ícones
	# INSTEMA - copia os ícones para a pasta do sistema
BAT () {
	#Testar se já baixou os ícones	
	if [[ -d "${GAT}" ]]; then #Veficica se existe a pasta temporária dos ícones
		INSTEMA
	elif [[ ! -d "${GAT}" ]]; then #Caso não exista, baixa os ícones
		echo -e "\n${CIAN}[ ] Baixando os ícones para" ${GAT} ${NORM}
		cd /tmp && git clone https://github.com/archcraft-os/archcraft-icons &&
		chmod 755 archcraft-themes/* -R #Concede permissão à pasta baixada
		echo -e "${VERD}[*] ícones na pasta" ${GAT} ${NORM}
		INSTEMA
	else
		echo -e "\n${VERM}[!] Não foi possível copiar os ícones\n" ${NORM} #Notifica em caso de falha
	fi	
}	
	
INSTEMA () {
		echo -e "\n${CIAN}[ ] Copiando os ícones para" $USRT ${NORM} # Copiando os ícones para a pasta de ícones "/usr/share/themes"
		$CC $GAT'archcraft-icons-arc'$FP $GAT'archcraft-icons-breeze'$FP $GAT'archcraft-icons-hack'$FP \
		$GAT'archcraft-icons-luna'$FP $GAT'archcraft-icons-luv'$FP $GAT'archcraft-icons-nordic'$FP \
		$GAT'archcraft-icons-numix'$FP $GAT'archcraft-icons-papirus'$FP $GAT'archcraft-icons-qogir'$FP \
		$GAT'archcraft-icons-white'$FP $GAT'archcraft-icons-win11'$FP $GAT'archcraft-icons-zafiro'$FP $USRT
				
	if [[ -d "$USRT/Luv-Folders-Dark" || "$USRT/Nordic-Folders" ]]; then #Verifica se as pastas estão no lugar certo
		ls $USRT #Exibe a pasta de ícones
		echo -e "${VERD}[*] Ícones copiados para a pasta" $USRT ${NORM} #Notifica sucesso
	else
		echo -e "\n${VERM}[!] Não foi possível copiar os ícones\n" ${NORM} #Notifica em caso de falha
	fi
}
# Iniciar o processo de verificação e instação de ícones
BAT
