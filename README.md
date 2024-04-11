# HELP

## Instalação (Shell Script)

```bash
sh ./install.sh
```

## Instalar manualmente

Clone o repositório:

```bash
nix-shell -p git --command "git clone git@github.com:insanemor/nix-os-dotfiles.git ~/.dotfiles"
```

## Configurar Ambiente

Comandos usados:

```bash
sudo nixos-generate-config --show-hardware-config > ~/.dotfiles/system/hardware-configuration.nix
```

```bash
sudo nixos-rebuild switch --flake ~/.dotfiles#system
```

```bash
home-manager switch --flake ~/.dotfiles#user
```

```bash
nix run home-manager/master --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ~/.dotfiles#user;
```

## LImpeza de cache

Comando para limpar de uma instalação para outra:

```bash
sudo nix-collect-garbage -d
```

```bash
nix-store --optimize
```

## Outros comandos

Para instalar o home-manager e o nixos, basta rodar o comando:

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager

nix-channel --update

nix-shell '<home-manager>' -A install
```

### Scripts na rais do projeto

harden.sh - Usado para recriar as permissões dos arquivos e pastas em .dotfiles

install.sh - Usado para instalar o nixos e o home-manager e configurar o ambiente

pull.sh - Usado para atualizar o repositório no final ele chama o harden.sh e chama o sync.sh

sync.sh - Usado para aplicar as configurações do nixos e do home-manager e no final ele chama o sync-posthook.sh

sync-posthook.sh - Usado para olhar o LOG e verificar se precisa reiniciar algum app e reinicia ele se precisar

update.sh - Usado para atualizar e os pacotes

upgrade.sh - Usado para atualizar o sistema
