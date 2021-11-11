# dpux_bspwm

### Instalação
Em seu terminal, rode o comando abaixo para começar a instalação:

```bash
sudo apt install git inxi -y && cd /tmp && git clone https://github.com/thespation/dpux_bspwm && chmod 755 dpux_bspwm/* -R && cd dpux_bspwm/ && ./instalar.sh
```

##

### Sobre
Esse script possui a intenção de instalar o gerenciador de janelas [bspwm](https://github.com/baskerville/bspwm) em conjunto com [polybar](https://github.com/polybar/polybar) e [rofi](https://github.com/davatorium/rofi).

##

### Sistemas suportados

Para que o script rode corretamente, é necessário ter o sistema, versão e DE abaixo:

|   Sistema   | Versão | DE |
| :-----------: | :-----------: | :-----------: |
|    Debian   | Bullseye ou Bookworm | Xfce ou GNOME |
|   Pop!_OS   |        21.04         | - |
|   Ubuntu    |        21.10         | GNOME |
|   Xubuntu   |        21.10         | Xfce |

 
Caso queira executar por conta própria ou modificar na intenção de moldar conforme necessário para seu sistema, fique à vontade, porém não tem como me responsabilizar por isso.

##

### Telas dos temas disponíveis

![temas](https://user-images.githubusercontent.com/84329097/141335499-8e8b4683-a1d0-4727-9c66-58f3e452f491.gif)

### Menu rofi
Podendo mudar a cor de acordo com o tema selicionado:

![rofi](https://user-images.githubusercontent.com/84329097/141335969-4cc5440c-342c-431b-bd89-693efd947a4a.gif)

### Troca de tema para LightDM
Caso esse escript sera rodado no Debian Xfce ou no Xubuntu, será modificado o tema do gestor de login, ficando:

![01](https://user-images.githubusercontent.com/84329097/141336377-58b7b39c-62a2-430d-aad8-c7388b7ae75d.png)

Observação: o Xubuntu é configurado para usar o papel de parece no LightDM, com isso usará o papel de parede da sessão.

##

### Dependências
Para que seja realizada a instalação correta, é necesário ter instalado `inxi` em seu sistema, assim como o `git`. Caso a instalação seja realizada pelo comando apresentado acima, será instalado automaticamente.

### O que será instalado
Pacotes comuns a todas as distros: bspwm, sxhkd, rofi, compton, polybar, dunst, [ksuperkey](https://github.com/hanschen/ksuperkey), neofetch, htop, feh, lxappearance, geany, dmenu, nm-tray, xfconf, xsettingsd, xfce4-power-manager, zenity, git.

Pacotes destinados as distros xfce: thunar-archive-plugin, catfish, baobab, meld, language-selector-gnome* (somente para o Xubuntu).

Pacotes destinados as distros GNOME: mate-polkit, i3lock.


