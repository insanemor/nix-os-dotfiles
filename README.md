# NixOS Dotfiles by InsaneMor

Este repositório contém configurações para NixOS e Home Manager, ideal para configurar um ambiente de sistema operacional de forma reprodutível e portátil usando o NixOS. As configurações são estruturadas para facilitar a instalação, atualização, e manutenção do sistema.

## BUGS

- [ ] script que indentifica a maquina e carrega a configuração correta de hardware
- [ ] script do keybinding.sh que carrega os atalhos das teclas configuradas
- [ ] erro quando click no menu de aplicativos minimizados
- [ ] history dos comandos nao esta legal , vem primeiro sugestao ao inves de historico de comandos
- [X] teclado do notbook ainda nao ta legal
- [ ] erro quando muda de perfil nao abre legal o navegador ( ia so testar , nao sei se vou manter esse navegador, a ideia era estudar para implantar algo parecido com o Brave)

## Features a serem implantas

- [X] add atalhos para os scripts desse repo
- [ ] implantar profile para terminal e navegar e container 
- [ ] adicionar historico de copy e past 
- [X] perfil devops
  - [ ] asdf toolversion
  - [ ] create script para adicionar novas versoes dentro do toolversion
- [ ] perfil game
- [ ] testes em VM

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

### Aplicar Configuração do Sistema

Use flakes para aplicar a configuração do sistema:

```bash
sudo nixos-rebuild switch --flake ~/.dotfiles#system
```

Este comando reconstrói o sistema com as configurações especificadas para o sistema.

### Configurar Home Manager

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

## Scripts Inclusos

### `harden.sh`

Reforça as permissões dos arquivos e pastas em `.dotfiles`.

### `soften.sh`

Libera as permissões dos arquivos e pastas em `.dotfiles`.

### `install.sh`

Instala o NixOS e o Home Manager, aplicando todas as configurações deste repositório.

### `pull.sh`

Atualiza o repositório, chama `harden.sh` para reforçar as permissões, e sincroniza as configurações com `sync.sh`.

### `sync.sh`

Aplica as configurações do NixOS e Home Manager, finalizando com `sync-posthook.sh`.

### `sync-posthook.sh`

Verifica logs para necessidade de reiniciar apps e executa esses reinícios.

### `update.sh`

Atualiza pacotes do sistema para as últimas versões disponíveis.

### `upgrade.sh`

Atualiza o sistema para a última versão do NixOS disponível nos canais configurados.

## Conclusão

Este repositório proporciona uma maneira flexível e modular de gerenciar configurações de sistema e usuário no NixOS, simplificando o processo de manutenção e atualização do sistema operacional.
