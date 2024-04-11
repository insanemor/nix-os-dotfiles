# HELP

Clone o repositório:

```bash
nix-shell -p git --command "git clone git@github.com:insanemor/nix-os-dotfiles.git ~/.dotfiles"
```

## Configurar Ambiente

Comandos usados:

```bash
sudo nixos-rebuild switch --flake ~/.dotfiles#system
```

```bash
home-manager switch --flake ~/.dotfiles#user
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
