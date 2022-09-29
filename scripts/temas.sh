#!/usr/bin/env bash
# Desenvolvido pelo William Santos
# contato: thespation@gmail.com ou https://github.com/thespation

# Cores (tabela de cores: https://gist.github.com/avelino/3188137)
VERM="\033[1;31m"	#Deixa a saída na cor vermelho
VERD="\033[0;32m"	#Deixa a saída na cor verde
CIAN="\033[0;36m"	#Deixa a saída na cor ciano
NORM="\033[0m"		#Volta para a cor padrão
## Alias
CC="sudo cp -rf"		##Comando de cópia de arquivos
GAT="/tmp/archcraft-themes/"	#Pasta temporária dos temas
USRT="/usr/share/themes/"	#Pasta dos temas do sistema
FP="/files/*"			#Alias para o final do nome das pastas de temas

#Funções
	# BAT - Testa/baixa se existe a pasta de temas
	# INSTEMA - copia os temas para a pasta do sistema
BAT () {
	#Testar se já baixou os temas	
	if [[ -d "${GAT}" ]]; then #Veficica se existe a pasta temporária dos temas
		INSTEMA
	elif [[ ! -d "${GAT}" ]]; then #Caso não exista, baixa os temas
		echo -e "\n${CIAN}[ ] Baixando os temas para" ${GAT} ${NORM}
		cd /tmp && git clone https://github.com/archcraft-os/archcraft-themes &&
		chmod 755 archcraft-themes/* -R #Concede permissão à pasta baixada
		echo -e "${VERD}[*] Temas na pasta" ${GAT} ${NORM}
		INSTEMA
	else
		FALH ${NORM} #Notifica em caso de falha
	fi	
}	
	
INSTEMA () {
		echo -e "\n${CIAN}[ ] Copiando os temas para" $USRT ${NORM} # Copiando os temas para a pasta de temas "/usr/share/themes"
		$CC $GAT'archcraft-gtk-theme-adapta'$FP $GAT'archcraft-gtk-theme-arc'$FP $GAT'archcraft-gtk-theme-blade'$FP \
		$GAT'archcraft-gtk-theme-cyberpunk'$FP $GAT'archcraft-gtk-theme-dracula'$FP $GAT'archcraft-gtk-theme-easy'$FP \
		$GAT'archcraft-gtk-theme-groot'$FP $GAT'archcraft-gtk-theme-gruvbox'$FP $GAT'archcraft-gtk-theme-hack'$FP \
		$GAT'archcraft-gtk-theme-juno'$FP $GAT'archcraft-gtk-theme-kripton'$FP $GAT'archcraft-gtk-theme-manhattan'$FP \
		$GAT'archcraft-gtk-theme-nordic'$FP $GAT'archcraft-gtk-theme-rick'$FP $GAT'archcraft-gtk-theme-slime'$FP \
		$GAT'archcraft-gtk-theme-spark'$FP $GAT'archcraft-gtk-theme-sweet'$FP $GAT'archcraft-gtk-theme-wave'$FP \
		$GAT'archcraft-gtk-theme-white'$FP $GAT'archcraft-gtk-theme-windows'$FP $USRT
				
	if [[ -d "$USRT/Spark" || "$USRT/Sweet-Dark" ]]; then #Verifica se as pastas estão no lugar certo
		ls $USRT #Exibe a pasta de temas
		echo -e "${VERD}[*] Temas copiados para a pasta" $USRT ${NORM} #Notifica sucesso
	else
		echo -e "\n${VERM}[!] Não foi possível copiar os temas\n" ${NORM} #Notifica em caso de falha
	fi
}
# Iniciar o processo de verificação e instação de temas
BAT
