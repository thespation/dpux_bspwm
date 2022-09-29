## Pré-requisito

Para rodar o comando de instalação com sucesso, é necessário ter instalado o `curl` em seu sistema:

## Instalação
Em seu terminal, rode o comando abaixo:

### Temas

```
curl -s https://raw.githubusercontent.com/thespation/dpux_bspwm/main/scripts/temas.sh | bash
```

### Ícones

```
curl -s https://raw.githubusercontent.com/thespation/dpux_bspwm/main/scripts/icones.sh | bash
```

## Estrutura (em desenvolvimento)

````
dpux_bspwm/scripts
  └── Instalar              : Verifica se a distro é compatível
      ├── base              : Instala a base estrutural bspwm
      ├── persona.comum     : Porsonalizações comuns a todas a distros
      │   └── icones        : Icones personalizados
      │   └── temas         : Temas personalizados
      └── *Distro           : Script voltado a personalização individual
````
