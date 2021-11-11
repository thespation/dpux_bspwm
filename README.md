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
Podendo mudar a cor de acordo com o tema selecionado:

![rofi](https://user-images.githubusercontent.com/84329097/141335969-4cc5440c-342c-431b-bd89-693efd947a4a.gif)

##

### Troca de tema para LightDM
Caso esse script seja rodado no Debian Xfce ou no Xubuntu, será modificado o tema do gestor de login, ficando:

![01](https://user-images.githubusercontent.com/84329097/141336377-58b7b39c-62a2-430d-aad8-c7388b7ae75d.png)

Observação: o Xubuntu é configurado para usar o papel de parede da sessão no LightDM, com isso usará o papel de parede da sessão.

##

### Dependências
Para que seja realizada a instalação correta, é necessário ter instalado `inxi` em seu sistema, assim como o `git`. Caso a instalação seja realizada pelo comando apresentado acima, será instalado automaticamente.

##

### O que será instalado
> Pacotes comuns a todas as distros:

* bspwm, sxhkd, rofi, compton, polybar, dunst, [ksuperkey](https://github.com/hanschen/ksuperkey), neofetch, htop, feh, lxappearance, geany, dmenu, nm-tray, xfconf, xsettingsd, xfce4-power-manager, zenity, git.

>Pacotes destinados as distros xfce:

* thunar-archive-plugin, catfish, baobab, meld, language-selector-gnome* (somente para o Xubuntu).

>Pacotes destinados as distros GNOME:

* mate-polkit, i3lock.

##

### Teclas de atalhos
Para utilização do *bspwm* vai notar que muitas das vezes o teclado é o nosso melhor amigo, para isso precisamos aprender alguns atalhos interessantes para nossa utilização.

Caso queira personalizar algum, acrescentar ou remover, pode ser realizado editando o arquivo: `~/.config/sxhkd/sxhkdrc`.

Seguem os atalho já configurados:

Legenda: <kbd> W</kbd> = Tecla Windows <br>
<kbd> W</kbd> - Menu de aplicativos <br>
<kbd> Ctrl + W + t</kbd> - Seletor de tema <br>
<kbd> W + w </kbd> - Mostra programas abertos (tecla Windows mais a tecla "w") <br>
<kbd> W + 1-8</kbd> - Troca de área de trabalho <br>
<kbd> W + Shift + 1-8</kbd> - Envia app em foco para a área de trabalho desejada <br>
<kbd>W + Enter</kbd> - Terminal <br>
<kbd>W + Barra de espaço</kbd> - troca entre modo tiling / floating <br>
<kbd>W + F</kbd> - modo uma janela em tela cheia <br>
<kbd>W + H/V/Q</kbd> - Prepara a divisão do app na Horizontal, Vertical ou Cancela <br>
<kbd>W + TAB</kbd> - Volta para última área de trabalho aberta <br>
<kbd>W + Shift + 1-8</kbd> - Envia a janela em foco para a área desejada <br>
<kbd>W + Ctrol + ←/→/↑ /↓ </kbd> - Expande a janela em foco <br>
<kbd>W + Alt + ←/→/↑ /↓</kbd> - Diminuir a janela em foco <br>
<kbd>W + C</kbd> - Fecha janela em foco <br>
<kbd>Ctrl + Alt +  ←/→</kbd> - Troca de área de trabalho <br>
<kbd>W + x</kbd> - Menu com opções de desligamento <br>

##

### Créditos:
Tanto os menus, polybar, temas e configurações para bspwm quanto sxhkd foram elaborados pelo [Aditya Shakya](https://github.com/adi1090x) que disponibilizou em seu Github ([polybar](https://github.com/adi1090x/polybar-themes) e [rofi](https://github.com/adi1090x/rofi)).

