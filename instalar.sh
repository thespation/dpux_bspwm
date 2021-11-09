#!/usr/bin/env bash
# Desenvolvido pelo William Santos
# contato: thespation@gmail.com ou https://github.com/thespation

clear
##--------------------------------Funções utilizadas no script--------------------------------##
#--Identificar Distribuição--#
declare -f VERIF_DISTRIB
function VERIF_DISTRIB()
{	INXI=`inxi -S`
	ID=`lsb_release -i`
	RELEASE=`lsb_release -r`
	if [[ $INXI = *Xfce* && $INXI = *21.10* && $INXI = *Ubuntu* ]]; then
			inxi -S
			sleep 2s
			echo ""
			ATUALIZAR
			KSUPERKEY
			APPS_XFCE
			PERSONA_XUBUNTU
		
	elif [[ $ID = "Distributor ID:	Pop" && $RELEASE = "Release:	21.04" ]]; then
			inxi -S
			sleep 2s
			echo ""
			ATUALIZAR
			KSUPERKEY
			APPS_POP
			PERSONA_POP

		elif [[ $INXI = *Xfce* && $INXI = *bullseye* && $INXI = *debian* ]]; then
			inxi -S
			sleep 2s
			echo ""
			ATUALIZAR
			APPS_XFCE
			APPS_DEBIAN
			
		elif [[ $INXI = *GNOME* && $INXI = *21.10* && $INXI = *Ubuntu* ]]; then
			inxi -S
			sleep 2s
			echo ""
			ATUALIZAR
			KSUPERKEY
			APPS_POP
			PERSONA_UBUNTU
	else	
		NOTF_FALHA
			sleep 3
	fi
}

#--Função: Atualiar sistema--#
declare -f ATUALIZAR
function ATUALIZAR(){
			echo "#-----------------------------Atualizar Sistema------------------------------#"
				sudo apt update
			echo "#-------------------------Repositórios Atualizados---------------------------#"
			sleep 1s
				sudo apt upgrade -y
			echo "#---------------------------Programas Atualizados----------------------------#"
			sleep 1s

			sudo apt dist-upgrade -y && sudo apt autoclean && sudo apt autoremove -y
				clear
			echo "#-----------------------------Sistema Atualizado-----------------------------#"
				sleep 2s
			BSPWM
		}
			
#--Função: Instalar base BSPWM--#
declare -f BSPWM
function BSPWM()
	{
			echo "#---------------------------Instalando base BSPWM----------------------------#"
				sudo apt install bspwm sxhkd rofi picom polybar dunst -y
				clear
			echo "#---------------------------Base BSPWM instalada-----------------------------#"
				sleep 2s
			APPS
	}

#--Função: Instalar ksuperkey (possibilidata chamar o Rofi com a tecla super--#
declare -f KSUPERKEY
function KSUPERKEY()
	{
			echo "#----------------------------Habilitar ksuperkey-----------------------------#"
				sudo apt install snapd -y && sudo snap install ksuperkey
				clear
			echo "#---------------------------Ksuperkey habilitado-----------------------------#"
				sleep 2s
	}

#--Função: Instalar aplicativos complementares--#
declare -f APPS
function APPS()
	{
			echo "#-----------------------Instalar apps complementares-------------------------#"
			sudo apt install neofetch htop feh lxappearance geany dmenu nm-tray xfconf xsettingsd xfce4-power-manager zenity git -y
			
			clear
			echo "#----------------------Apps complementares instalados------------------------#"
				sleep 2s
			PERSONA
	}

#--Função: Instalar aplicativos complementares no Xubuntu--#
declare -f APPS_XFCE
function APPS_XFCE()
	{
			echo "#------------------Instalar apps complementares para xfce--------------------#"
			sudo apt install thunar-archive-plugin catfish baobab meld -y
			sudo apt install language-selector-gnome -y
			clear
			echo "#-------------------------Apps para xfce instalados--------------------------#"
				sleep 2s
	}
	
#--Função: Instalar aplicativos complementares no PopOs--#
declare -f APPS_POP
function APPS_POP()
	{
			echo "#------------------------------Apps para Gnome-------------------------------#"
			sudo apt install mate-polkit i3lock -y
			clear
			echo "#-------------------------Apps para Gnome instalados-------------------------#"
				sleep 2s
	}
	
#--Função: Instalar aplicativos complementares no Debian--#
declare -f APPS_DEBIAN
function APPS_DEBIAN()
	{
			echo "#------------------------------Apps para Debian------------------------------#"
			sudo apt install gcc make libx11-dev libxtst-dev pkg-config -y
			cd /tmp && git clone https://github.com/hanschen/ksuperkey.git
			cd ksuperkey
			make
			sudo make install
			clear
			echo "#-------------------------Apps para Debian instalados------------------------#"
				sleep 2s
			PERSONA_DEBIAN
	}
	
#--Função: Usar personalizações para: fonts, configs, ícones, themas, polybar, dunst e rofi--#
declare -f PERSONA
function PERSONA()
	{
			echo "#----------------Copiar personalizações (ícones, themas, fonts)--------------#"
				sudo cp -r /tmp/dpux_bspwm/fonts/* /usr/share/fonts
				cp -rf /tmp/dpux_bspwm/home/config/* ~/.config
				mv /tmp/dpux_bspwm/home/Xresources.d /tmp/dpux_bspwm/home/.Xresources.d
				cp -rf /tmp/dpux_bspwm/home/.Xresources.d $HOME
				cp -rf /tmp/dpux_bspwm/home/.Xresources $HOME
				cp -rf /tmp/dpux_bspwm/home/.gtkrc-2.0 $HOME
				cp -rf /tmp/dpux_bspwm/home/.xsettingsd $HOME
		
				# Copiar temas
				cd /tmp && git clone https://github.com/archcraft-os/archcraft-themes && chmod 755 archcraft-themes/* -R
				sudo cp -rf /tmp/archcraft-themes/archcraft-gtk-theme-adapta/files/* /usr/share/themes
				sudo cp -rf /tmp/archcraft-themes/archcraft-gtk-theme-arc/files/* /usr/share/themes
				sudo cp -rf /tmp/archcraft-themes/archcraft-gtk-theme-blade/files/* /usr/share/themes
				sudo cp -rf /tmp/archcraft-themes/archcraft-gtk-theme-cyberpunk/files/* /usr/share/themes
				sudo cp -rf /tmp/archcraft-themes/archcraft-gtk-theme-dracula/files/* /usr/share/themes
				sudo cp -rf /tmp/archcraft-themes/archcraft-gtk-theme-groot/files/* /usr/share/themes
				sudo cp -rf /tmp/archcraft-themes/archcraft-gtk-theme-gruvbox/files/* /usr/share/themes
				sudo cp -rf /tmp/archcraft-themes/archcraft-gtk-theme-hack/files/* /usr/share/themes
				sudo cp -rf /tmp/archcraft-themes/archcraft-gtk-theme-juno/files/* /usr/share/themes
				sudo cp -rf /tmp/archcraft-themes/archcraft-gtk-theme-kripton/files/* /usr/share/themes
				sudo cp -rf /tmp/archcraft-themes/archcraft-gtk-theme-manhattan/files/* /usr/share/themes
				sudo cp -rf /tmp/archcraft-themes/archcraft-gtk-theme-nordic/files/* /usr/share/themes
				sudo cp -rf /tmp/archcraft-themes/archcraft-gtk-theme-rick/files/* /usr/share/themes
				sudo cp -rf /tmp/archcraft-themes/archcraft-gtk-theme-spark/files/* /usr/share/themes
				sudo cp -rf /tmp/archcraft-themes/archcraft-gtk-theme-sweet/files/* /usr/share/themes
				sudo cp -rf /tmp/archcraft-themes/archcraft-gtk-theme-wave/files/* /usr/share/themes
				sudo cp -rf /tmp/archcraft-themes/archcraft-gtk-theme-white/files/* /usr/share/themes
				sudo cp -rf /tmp/archcraft-themes/archcraft-gtk-theme-windows/files/* /usr/share/themes
					
				# Copiar Icones do sistema
				cd /tmp && git clone https://github.com/archcraft-os/archcraft-icons && chmod 755 archcraft-icons/* -R
				sudo cp -rf /tmp/archcraft-icons/archcraft-icons-arc/files/* /usr/share/icons
				sudo cp -rf /tmp/archcraft-icons/archcraft-icons-breeze/files/* /usr/share/icons
				sudo cp -rf /tmp/archcraft-icons/archcraft-icons-hack/files/* /usr/share/icons
				sudo cp -rf /tmp/archcraft-icons/archcraft-icons-luna/files/* /usr/share/icons
				sudo cp -rf /tmp/archcraft-icons/archcraft-icons-luv/files/* /usr/share/icons
				sudo cp -rf /tmp/archcraft-icons/archcraft-icons-nordic/files/* /usr/share/icons
				sudo cp -rf /tmp/archcraft-icons/archcraft-icons-numix/files/* /usr/share/icons
				sudo cp -rf /tmp/archcraft-icons/archcraft-icons-papirus/files/* /usr/share/icons
				sudo cp -rf /tmp/archcraft-icons/archcraft-icons-qogir/files/* /usr/share/icons
				sudo cp -rf /tmp/archcraft-icons/archcraft-icons-white/files/* /usr/share/icons
				sudo cp -rf /tmp/archcraft-icons/archcraft-icons-win11/files/* /usr/share/icons
				sudo cp -rf /tmp/archcraft-icons/archcraft-icons-zafiro/files/* /usr/share/icons
			clear	
			echo "#---------------------Personalizações padrões copiadas-----------------------#"
	}
	
#--Função: Personalização específica para PopOs--#
declare -f PERSONA_POP
function PERSONA_POP()
	{
			clear
			echo "#--------------------Copiar personalizações para o PopOs---------------------#"
				cp -rf /tmp/dpux_bspwm/home/pop/.fehbg $HOME
				cp -rf /tmp/dpux_bspwm/home/pop/powermenu ~/.config/bspwm/rofi/bin
				cp -rf /tmp/dpux_bspwm/home/pop/sxhkd/ ~/.config
				sudo cp -rf /tmp/dpux_bspwm/home/pop/nordico.png /usr/share/backgrounds/pop/
				sudo rm -rf /usr/share/fonts/truetype/arphic
			clear
			echo "#-------------------Personalizações para o PopOs copiadas--------------------#"
				sleep 3s
			clear
			NOTF_SUCESS
	}

#--Função: Personalização específica para Xubuntu--#
declare -f PERSONA_XUBUNTU
function PERSONA_XUBUNTU()
	{
			clear
			echo "#--------------------Copiar personalizações para Xubuntu---------------------#"
				cp -rf /tmp/dpux_bspwm/home/xubuntu/.fehbg $HOME
				cp -rf /tmp/dpux_bspwm/home/xubuntu/Thunar/ ~/.config
				cp -rf /tmp/dpux_bspwm/home/xubuntu/sxhkd/ ~/.config
				cp -rf /tmp/dpux_bspwm/home/xubuntu/powermenu ~/.config/bspwm/rofi/bin
				sudo cp -rf /tmp/dpux_bspwm/home/xubuntu/nordico.png /usr/share/xfce4/backdrops/
				sudo cp -rf /tmp/dpux_bspwm/home/xubuntu/lightdm-gtk-greeter.conf /etc/lightdm/
				sudo cp -rf /tmp/dpux_bspwm/home/xubuntu/apps_as_root.sh /usr/local/bin
				sudo cp -rf /tmp/dpux_bspwm/home/xubuntu/askpass_rofi.sh /usr/local/bin
			clear
			echo "#-------------------Personalizações para Xubuntu copiadas--------------------#"
				sleep 3s
			clear
			NOTF_SUCESS
	}
	
#--Função: Personalização específica para Debian xfce--#
declare -f PERSONA_DEBIAN
function PERSONA_DEBIAN()
	{
			clear
			echo "#---------------------Copiar personalizações para Debian---------------------#"
				cp -rf /tmp/dpux_bspwm/home/debian/.fehbg $HOME
				cp -rf /tmp/dpux_bspwm/home/xubuntu/Thunar/ ~/.config
				cp -rf /tmp/dpux_bspwm/home/xubuntu/sxhkd/ ~/.config
				cp -rf /tmp/dpux_bspwm/home/xubuntu/powermenu ~/.config/bspwm/rofi/bin
				sudo cp -rf /tmp/dpux_bspwm/home/debian/nordico.png /usr/share/images/desktop-base/
				sudo cp -rf /tmp/dpux_bspwm/home/debian/lightdm-gtk-greeter.conf /etc/lightdm/
				sudo cp -rf /tmp/dpux_bspwm/home/xubuntu/apps_as_root.sh /usr/local/bin
				sudo cp -rf /tmp/dpux_bspwm/home/xubuntu/askpass_rofi.sh /usr/local/bin
			clear
			echo "#--------------------Personalizações para Debian copiadas--------------------#"
				sleep 3s
			clear
			NOTF_SUCESS
	}

#--Função: Personalização específica para Uguntu--#
declare -f PERSONA_UBUNTU
function PERSONA_UBUNTU()
	{
			clear
			echo "#---------------------Copiar personalizações para Ubuntu---------------------#"
				cp -rf /tmp/dpux_bspwm/home/ubuntu/.fehbg $HOME
				cp -rf /tmp/dpux_bspwm/home/pop/powermenu ~/.config/bspwm/rofi/bin
				cp -rf /tmp/dpux_bspwm/home/pop/sxhkd/ ~/.config
				sudo cp -rf /tmp/dpux_bspwm/home/xubuntu/nordico.png /usr/share/backgrounds/
			clear
			echo "#--------------------Personalizações para Ubuntu copiadas--------------------#"
				sleep 3s
			clear
			NOTF_SUCESS
	}

#--Função: Notificar sucesso na operação--#
declare -f NOTF_SUCESS
function NOTF_SUCESS()
	{
		zenity --info --width 300 --text "Sucesso na instalação. Para que tudo funcione corretamente, é recomendável que reinicie seu micro."
	}
	
#--Função: Notificar Falha na operação--#
declare -f NOTF_FALHA
function NOTF_FALHA()
	{
		clear
		echo "#--------------------------Sistema não suportado------------------------------#"
		echo "#--------Esse script foi desenvolvido para rodar nas seguintes distros:-------#"		
		echo "#-----------------------------Debian 11 (xfce)--------------------------------#"
		echo "#------------------------------Pop!_Os 21.04----------------------------------#"
		echo "#--------------------------Ubuntu ou Xubuntu 21.10----------------------------#"
	}
		
##--------------------------------Funções utilizadas no script--------------------------------##
	echo "#---------------Esse assistente instalará bspwm em sua máquina---------------#".
	echo "#-------Caso não tenha inxi instalado em sua máquina, será instalado---------#".
	sudo apt install inxi -y
	
	VERIF_DISTRIB
