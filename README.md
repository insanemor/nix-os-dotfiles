# HELP

Clone o repositório:

```bash
nix-shell -p git --command "git clone https://github.com/insanemor/dotfiles-nixos.git ~/.dotfiles"
```

Para instalar o home-manager e o nixos, basta rodar o comando:

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager

nix-channel --update

nix-shell '<home-manager>' -A install
```  

Comandos usados:

```bash
sudo nixos-rebuild switch --flake ~/.dotfiles
```

```bash
home-manager switch --flake ~/.dotfiles
```

Comando para limpar de uma instalação para outra:

```bash
sudo nix-collect-garbage -d
```

```bash
nix-store --optimize
```
