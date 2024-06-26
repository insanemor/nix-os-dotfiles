# NixOS Dotfiles by InsaneMor

Este repositório contém configurações para NixOS e Home Manager, ideal para configurar um ambiente de sistema operacional de forma reprodutível e portátil usando o NixOS. As configurações são estruturadas para facilitar a instalação, atualização, e manutenção do sistema.

## BUGS

- [ ] script que indentifica a maquina e carrega a configuração correta de hardware
- [ ] script do keybinding.sh que carrega os atalhos das teclas configuradas
- [ ] screenshot nao esta funcionando ( via script ta ok , mas pelo atalho nao )
- [ ] erro quando click no menu de aplicativos minimizados
- [X] history dos comandos nao esta legal , vem primeiro sugestão ao invés de histórico de comandos
- [X] teclado do notbook ainda nao ta legal
- [ ] erro quando muda de perfil nao abre legal o navegador qbrower ( ia so testar , nao sei se vou manter esse navegador, a ideia era estudar para implantar algo parecido com o Brave)
- [ ] waybar ainda com bugs gráficos e funcionais
- [ ] waybar apps nao funciona botão direito e nem via script direto ele abre com erros
  - [ ] Graficamente nao esta abrindo o mesmo theme que pelo comando
- [ ] bug ultimo icone nao esta sendo totalmente exibido , no notbook ele esta cortado ao meio.
- [ ] os icones e temas nao esta legal ainda

## Features a serem implantas

- [X] add atalhos para os scripts desse repo
- [X] implantar profile para terminal e navegar e container ( descidido usar o devcontainer e devbox )
- [X] adicionar histórico de copy e past
- [X] perfil devops
  - [X] asdf toolversion
  - [X] create script para adicionar novas versões dentro do toolversion
- [ ] perfil game
- [ ] testes em VM
- [X] instalar devcontainer na maquina
  - [ ] vou tentar criar o dockerfile de tools diretamente dentro de pastas, e perfis
    - [ ] perfil default  
- [X] configurar o waybar com todas as function que estou testando no PC
- [ ] Descobrir como configurar o wifi graficamente
- [X] VSCODE
  - [X] adicionar o devcontainer
  - [X] instalar plugins
- [ ] Instalar alguma coisa para ser de calendário
- [ ] criar um atalho para calculadora
- [ ] ajustes de janelas nas posições , acho que deve ter uma forma mais rápida de ficar na posição que eu quero
- [ ] descobrir se tem como usar abas no terminal alacritty
- [ ] descobrir se tem como usar raimiter ou algo similar
- [X] pensar em uma forma de ter chaves de acesso de forma segura, pensando em usar o SOPS. ( pelos testes de decidido usar o 1password)
- [X] configurado devbox e devcontainer perfil default, simulando o docker que tenho hoje para acesso aos clientes //
      a ideia é compartilhar esse devbox shell com todos os cliente assim tendo um histórico de comandos compartilhado.
- [X] descobrir como adicionar as secrets dos clientes.
- [ ] Criar um devbox com kubernetes de lab interno usando o kind.
  - [ ] ver se compensa usar esse modelo ou ficar no task com o kind. "<https://github.com/hall/kubenix/tree/main>"
- [ ] Instalar Task para gerenciar as tarefas
- [ ] Implantar o "<https://github.com/nlewo/comin>"
- [ ] Implantar o "<https://github.com/astro/deadnix>"
- [ ] Implantar o "<https://github.com/Gabriella439/nix-diff>"
- [ ] Validar se tem como ser util esse projeto "<https://github.com/snowfallorg/nixos-conf-editor>"
- [ ] Validar se tem como ser util esse projeto "<https://github.com/snowfallorg/nix-software-center>"

## Instalação

### Usando Script de Instalação Automática

Execute o script de instalação incluído para configurar rapidamente:

```bash
sh ./install.sh
```

Este script automatiza o processo de instalação do NixOS e do Home Manager e aplica as configurações deste repositório.

### Instalação Manual

#### Clone o Repositório

Primeiro, clone este repositório na sua pasta `.dotfiles`:

```bash
nix-shell -p git --command "git clone git@github.com:insanemor/nix-os-dotfiles.git ~/.dotfiles"
```

Este comando utiliza `nix-shell` para instalar temporariamente `git` e clonar o repositório de dotfiles.

## Configuração do Ambiente

Após clonar o repositório, siga estes passos para configurar seu ambiente:

### Gerar Configuração de Hardware

Detecte o hardware e gere a configuração necessária:

```bash
sudo nixos-generate-config --show-hardware-config > ~/.dotfiles/system/hardware-configuration.nix
```

Este comando cria a configuração de hardware específica para sua máquina.

### Aplicar Configuração do Sistema  - Manual

Use flakes para aplicar a configuração do sistema:

```bash
sudo nixos-rebuild switch --flake ~/.dotfiles#system
```

Este comando reconstrói o sistema com as configurações especificadas para o sistema.

### Configurar Home Manager - Manual

Configure o ambiente do usuário com o Home Manager:

```bash
home-manager switch --flake ~/.dotfiles#user
```

Este comando aplica configurações de usuário como temas e configurações de aplicativos.

### Uso de Recursos Experimentais

Se já possuir o Home Manager instalado e quiser usar recursos experimentais:

```bash
nix run home-manager/master --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ~/.dotfiles#user;
```

Este comando roda o Home Manager do branch `master`, aplicando configurações usando recursos experimentais.

## Limpeza de Cache

Limpe o cache para liberar espaço após instalações:

```bash
sudo nix-collect-garbage -d
```

Este comando remove arquivos não utilizados do sistema.

```bash
nix-store --optimize
```

Este comando otimiza o armazenamento do Nix, consolidando arquivos duplicados.

## Alias Configurado apos a instalação

Este comando executa o script  `pull.sh`

```bash
npull
```

Este comando executa o script  `soften.sh`

```bash
nsoften
```

Este comando executa o script  `sync.sh`

```bash
nsync
```

Este comando executa o script  `update.sh`

```bash
nupdate
```

Este comando executa o script  `upgrade.sh`

```bash
nupgrade
```

## Scripts Inclusos

### `harden.sh`

Reforça as permissões dos arquivos e pastas em `.dotfiles`.

### `install.sh`

Instala o NixOS e o Home Manager, aplicando todas as configurações deste repositório.

### `print-configuration.sh`

Imprime a configuração do sistema e do usuário.

### `pull.sh`

Atualiza o repositório, chama `harden.sh` para reforçar as permissões, e sincroniza as configurações com `sync.sh`.

### `soften.sh`

Libera as permissões dos arquivos e pastas em `.dotfiles`.

### `sync-posthook.sh`

Verifica logs para necessidade de reiniciar apps e executa esses reinícios.

### `sync.sh`

Aplica as configurações do NixOS e Home Manager, finalizando com `sync-posthook.sh`.

### `update.sh`

Atualiza pacotes do sistema para as últimas versões disponíveis.

### `upgrade.sh`

Atualiza o sistema para a última versão do NixOS disponível nos canais configurados.

## Conclusão

Este repositório proporciona uma maneira flexível e modular de gerenciar configurações de sistema e usuário no NixOS, simplificando o processo de manutenção e atualização do sistema operacional.
