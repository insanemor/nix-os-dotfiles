#!/bin/sh

# Automated script to install my dotfiles

# Clone dotfiles
# TODO make ~/.dotfiles path arbitrary and make all other scripts conform to this
# using SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
nix-shell -p git --command "git clone git@github.com:insanemor/nix-os-dotfiles.git ~/.dotfiles"

# Passo 1: Ler o nome do modelo do dispositivo
model_name=$(cat /sys/devices/virtual/dmi/id/product_name)
# Passo 2: Substituir espaços por hífens se necessário (opcional)
model_name=${model_name// /-}
# Passo 3: Definir o diretório de destino
destination="$HOME/.dotfiles/machines/$model_name"
# Passo 4: Criar o diretório caso não exista
mkdir -p "$destination"
# Generate hardware config for new system
sudo nixos-generate-config --show-hardware-config > "$destination/${model_name}-configuration.nix"
echo "Configuração de hardware salva em: $destination/${model_name}-configuration.nix"

# Check if uefi or bios
if [ -d /sys/firmware/efi/efivars ]; then
    sed -i "0,/bootMode.*=.*\".*\";/s//bootMode = \"uefi\";/" ~/.dotfiles/flake.nix
else
    sed -i "0,/bootMode.*=.*\".*\";/s//bootMode = \"bios\";/" ~/.dotfiles/flake.nix
    grubDevice=$(findmnt / | awk -F' ' '{ print $2 }' | sed 's/\[.*\]//g' | tail -n 1 | lsblk -no pkname | tail -n 1 )
    sed -i "0,/grubDevice.*=.*\".*\";/s//grubDevice = \"\/dev\/$grubDevice\";/" ~/.dotfiles/flake.nix
fi

# Patch flake.nix with different username/name and remove email by default
sed -i "0,/ins/s//$(whoami)/" ~/.dotfiles/flake.nix
sed -i "0,/Moreira/s//$(getent passwd $(whoami) | cut -d ':' -f 5 | cut -d ',' -f 1)/" ~/.dotfiles/flake.nix
#sed -i "s/moreira@zaia.com.br//" ~/.dotfiles/flake.nix

# Open up editor to manually edit flake.nix before install
if [ -z "$EDITOR" ]; then
    EDITOR=nano;
fi
$EDITOR ~/.dotfiles/flake.nix;

# Permissions for files that should be owned by root
sudo ~/.dotfiles/harden.sh ~/.dotfiles;

# Rebuild system
sudo nixos-rebuild switch --flake ~/.dotfiles#system;

# Install and build home-manager configuration
nix run home-manager/master --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ~/.dotfiles#user;

