<p align="center">
<img width="800px" src="https://user-images.githubusercontent.com/84329097/143779279-c96cc289-a9aa-4a37-bd7b-1edd30d8fd83.png" align="center" alt="white" /><br><br>
 
<!-- (site para ícones: https://shields.io/ ) -->
 
<img alt="Maintained" src="https://img.shields.io/badge/Maintained%3F-No-red">
<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/thespation/dpux_bspwm">
<img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/thespation/dpux_bspwm">
<img alt="GitHub commit activity (branch)" src="https://img.shields.io/github/commit-activity/y/thespation/dpux_bspwm">
<!-- <a href="#"><img src="https://badges.pufler.dev/visits/thespation/dpux_bspwm"> -->

 <p align="center">
 <a href="https://github.com/thespation/dpux_bspwm#sobre" target="_blank"><img alt="undefined" src="https://img.shields.io/badge/-Sobre-blue"></a>
 <a href="https://github.com/thespation/dpux_bspwm#instalação" target="_blank"><img alt="undefined" src="https://img.shields.io/badge/-Instalação-blue"></a>
 <a href="https://github.com/thespation/dpux_bspwm#temas-e-customizações-disponíveis" target="_blank"><img alt="undefined" src="https://img.shields.io/badge/-Temas e customizações disponíveis-blue"></a>
<a href="https://github.com/thespation/dpux_bspwm#dependências" target="_blank"><img alt="undefined" src="https://img.shields.io/badge/-Dependências-blue"></a>
 <a href="https://github.com/thespation/dpux_bspwm#o-que-será-instalado" target="_blank"><img alt="undefined" src="https://img.shields.io/badge/-O que será instalado-blue"></a>
 <a href="https://github.com/thespation/dpux_bspwm#teclas-de-atalhos" target="_blank"><img alt="undefined" src="https://img.shields.io/badge/-Teclas de atalhos-blue"></a>
  <a href="https://github.com/thespation/dpux_bspwm#dicas" target="_blank"><img alt="undefined" src="https://img.shields.io/badge/-Dicas-blue"></a>
 <a href="https://github.com/thespation/dpux_bspwm#créditos" target="_blank"><img alt="undefined" src="https://img.shields.io/badge/-Créditos-blue"></a>
</p>


# Sobre

Esse script possui a intenção de instalar o gerenciador de janelas [bspwm](https://github.com/baskerville/bspwm) em conjunto com [polybar](https://github.com/polybar/polybar) e [rofi](https://github.com/davatorium/rofi).

<hr>

# Instalação

## Base Debian (Debian, Pop!_OS, Ubuntu e Xubuntu)
Em seu terminal, rode o comando abaixo para começar a instalação:
```bash
sudo apt install git inxi -y && cd /tmp && git clone https://github.com/thespation/dpux_bspwm && chmod 755 dpux_bspwm/* -R && cd dpux_bspwm/ && ./instalar.sh
```
 
## Fedora
Em seu terminal, rode o comando abaixo para começar a instalação:
```bash
sudo dnf install -y git inxi && cd /tmp && git clone https://github.com/thespation/dpux_bspwm && chmod 755 dpux_bspwm/* -R && cd dpux_bspwm/ && ./instalar.sh
```

<hr>

# Sistemas suportados
Para que o script rode corretamente, é necessário ter o sistema, versão e DE abaixo:

<table align=center border="1">
    <tr>
        <th>Sistema</td>
        <th>DE</td>
    </tr>
    <tr>
        <td align="center"valign="center">Debian</td>
        <td align="center"valign="center">Xfce ou GNOME</td>
    </tr>
    <tr>
        <td align="center"valign="center">Fedora</td>
        <td rowspan="3" align="center"valign="center">GNOME</td>
    </tr>
    <tr>
        <td>Pop!_OS</td>
     </tr>
     <tr>
        <td align="center"valign="center">Ubuntu</td>
    </tr>
     <tr>
        <td align="center"valign="center">Xubuntu</td>
        <td align="center"valign="center">Xfce</td>
    </tr>
</table>
  
Caso queira executar por conta própria ou modificar na intenção de moldar conforme necessário para seu sistema, fique à vontade, porém não tem como me responsabilizar por isso.<br><br>
> **Note**: Foram realizados testes no Fedora v35 e v36, porém deve funcionar normalmente na v37 e v38.
<hr>

# Temas e customizações disponíveis

## Temas para o BSPWM
Utilize o atalho <kbd>Ctrl</kbd> + <kbd>alt</kbd> + <kbd>t</kbd> para selecionar o tema desejado:<br>
<!-- (Site para crair gif: https://ezgif.com/maker) -->

![temas](https://user-images.githubusercontent.com/84329097/175645568-0d0022b3-3e61-4478-af97-0a50c48e26c7.gif)


##

## Temas do menu rofi
 
Podendo mudar a cor de acordo com o tema selecionado:

![rofi](https://user-images.githubusercontent.com/84329097/175645627-198f778a-6fe6-400e-9f6c-2c41cfa08e7d.gif)

<hr>

## Troca de tema para LightDM

Caso esse script seja rodado no Debian Xfce ou no Xubuntu, será modificado o tema do gestor de login, ficando:

![01](https://user-images.githubusercontent.com/84329097/141336377-58b7b39c-62a2-430d-aad8-c7388b7ae75d.png)

Observação: o Xubuntu é configurado para usar o papel de parede da sessão no LightDM, com isso usará o papel de parede da sessão.

<hr>

# Dependências

Para que seja realizada a instalação correta, é necessário ter instalado `inxi` em seu sistema, assim como o `git`. Caso a instalação seja realizada pelo comando apresentado acima, será instalado automaticamente.

<hr>

# O que será instalado
* Pacotes comuns a todas as distros:

   > bspwm, sxhkd, rofi, compton, polybar, dunst, [ksuperkey](https://github.com/hanschen/ksuperkey), neofetch, htop, feh, lxappearance, geany, dmenu, nm-tray, xfconf, xsettingsd, xfce4-power-manager, zenity, git.

* Pacotes destinados as distros xfce:

   > thunar-archive-plugin, catfish, baobab, meld, language-selector-gnome* (somente para o Xubuntu).

* Pacotes destinados as distros GNOME:

   > mate-polkit, i3lock.

<hr>

# Teclas de atalhos</h2>
Para utilização do *bspwm* vai notar que muitas das vezes o teclado é o nosso melhor amigo, para isso precisamos aprender alguns atalhos interessantes para nossa utilização.

Caso queira personalizar algum, acrescentar ou remover, pode ser realizado editando o arquivo: `~/.config/sxhkd/sxhkdrc`.

Seguem os atalho já configurados:
<br>(Legenda: <kbd> W</kbd> = Tecla Windows)

## Menus
| Teclas | Ação |
| --- | --- |
| <kbd>W</kbd> ou <kbd>alt</kbd> ou <kbd>F1</kbd> | Menu de aplicativos |
| <kbd>W</kbd> + <kbd>w</kbd> | Mostra programas abertos (tecla Windows mais a tecla "w") |
| <kbd>W</kbd> + <kbd>x</kbd> | Menu com opções de desligamento |
| <kbd>W</kbd> + <kbd>d</kbd> | dmenu (menu alternativo ao Rofi) |
| <kbd>W</kbd> + <kbd>N</kbd> | Menu para gerenciar conexões |
| <kbd>Ctrl</kbd> + <kbd>alt</kbd> + <kbd>t</kbd> | Seletor de tema |

## Comandos internos
| Teclas | Ação |
| --- | --- |
| <kbd>W</kbd> + <kbd>esc</kbd> | Recarregar atalhos (arquivos sxhkd) |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>r</kbd> | Recarregar BSPWM |
| <kbd>W</kbd> + <kbd>l</kbd> | bloquear tela |

## Aplicativos
| Teclas | Ação |
| --- | --- |
| <kbd>W</kbd> + <kbd>Enter</kbd> | Terminal |
| <kbd>W</kbd> + <kbd>e</kbd> | Gestor de arquivos (thunar ou nautilus) |
| <kbd>W</kbd> + <kbd>Shift</kbd> + <kbd>w</kbd> | Firefox |
| <kbd>W</kbd> + <kbd>Shift</kbd> + <kbd>e</kbd> | Geany |
| <kbd>W</kbd> + <kbd>c</kbd> | Fechar janela em foco |

## Áreas de trabalho
| Teclas | Ação |
| --- | --- |
| <kbd>W</kbd> + <kbd>1-8</kbd> | Troca de área de trabalho |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>←/→</kbd> | Troca de área de trabalho para a ao lado |

## Gerenciar Janelas
| Teclas | Ação |
| --- | --- |
| <kbd>W</kbd> + <kbd>Shift</kbd> + <kbd>1-8</kbd> | Envia app em foco para a área de trabalho desejada |
| <kbd>W</kbd> + <kbd>Barra de espaço</kbd>|- troca entre modo tiling / floating |
| <kbd>W</kbd> + <kbd>F</kbd> | modo uma janela em tela cheia |
| <kbd>W</kbd> + <kbd>H/V/Q</kbd> | Prepara a divisão do app na Horizontal, Vertical ou Cancela |
| <kbd>W</kbd> + <kbd>TAB</kbd> | Volta para último app aberto |
| <kbd>W</kbd> + <kbd>Ctrl</kbd> + <kbd>←/→/↑ /↓ </kbd> | Expande a janela em foco |
| <kbd>W</kbd> + <kbd>Alt</kbd> + <kbd>←/→/↑ /↓</kbd> | Diminuir a janela em foco |

<hr>

# Dicas

* [Como configurar a resolução e rotação das telas no BSPWM](https://plus.diolinux.com.br/t/como-configurar-a-resolucao-e-rotacao-das-telas-no-bspwm/37957)
* [Como configurar BSPWM e polybar para mais de um monitor](https://plus.diolinux.com.br/t/como-configurar-bspwm-e-polybar-para-mais-de-um-monitor/35201)

<hr>

# Créditos
Tanto os menus, polybar, temas e configurações para bspwm quanto sxhkd foram elaborados pelo [Aditya Shakya](https://github.com/adi1090x) que disponibilizou em seu Github ([polybar](https://github.com/adi1090x/polybar-themes) e [rofi](https://github.com/adi1090x/rofi)).

