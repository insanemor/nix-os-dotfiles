#!/bin/bash

# Diretório do arquivo de configuração do ASDF no repositório
ASDF_CONFIG_FILE="$HOME/.dotfiles/user/app/asdf/asdf.nix"

echo "Arquivo de configuração: $ASDF_CONFIG_FILE"

# Função para instalar ferramentas do arquivo .tool-versions
install_tools() {
    while read -r tool version; do
        echo "Instalando: $tool $version"
        asdf plugin-add "$tool"
        asdf install "$tool" "$version"
    done < ~/.tool-versions
}

# Função para adicionar uma nova ferramenta ao asdf.nix
add_tool() {
    local tool=$1
    local version=$2

    echo "Adicionando ferramenta: $tool $version"
    # Adiciona a ferramenta e versão ao arquivo asdf.nix
    sed -i "/home.file.\".tool-versions\".text = ''/a\\
        $tool $version" "$ASDF_CONFIG_FILE"

    # Operações Git
    (cd "$HOME/.dotfiles" && git pull && git add user/app/asdf/asdf.nix && git commit -m "Add $tool $version to asdf.nix" && git push)
    sh ~/.dotfiles/sync.sh

    # Chama a função install_tools para instalar a ferramenta adicionada
    echo "Instalando a ferramenta adicionada: $tool $version"
    install_tools
}

# Função para atualizar a versão de uma ferramenta
update_tool() {
    local tool=$1
    local new_version=$2

    echo "Atualizando ferramenta: $tool para $new_version"
    # Atualiza a versão no arquivo asdf.nix
    sed -i "s/$tool [0-9.]*/$tool $new_version/" "$ASDF_CONFIG_FILE"

    # Operações Git
    (cd "$HOME/.dotfiles" && git pull && git add user/app/asdf/asdf.nix && git commit -m "Update $tool to $new_version in asdf.nix" && git push)
    sh ~/.dotfiles/sync.sh
    
    # Chama a função install_tools para instalar a ferramenta adicionada
    echo "Instalando a ferramenta adicionada: $tool $version"
    install_tools    
}

# Função para listar as ferramentas instaladas
list_tools() {
    echo "Ferramentas no repositório:"
    cat "$ASDF_CONFIG_FILE"
    echo "Ferramentas locais:"
    cat ~/.tool-versions
    echo "Ferramentas ASDF instaladas:"
    asdf list
}

# Processando argumentos do comando
case "$1" in
    install)
        install_tools
        ;;
    add)
        add_tool "$2" "$3"
        ;;
    update)
        update_tool "$2" "$3"
        ;;
    list)
        list_tools
        ;;
    *)
        echo "Uso: nasdf.sh [install|add|update|list]"
        exit 1
        ;;
esac
