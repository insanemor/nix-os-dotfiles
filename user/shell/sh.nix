{ pkgs, lib, config, ... }:
let

  # My shell aliases
  myAliases = {
    ls = "eza --icons -l -T -L=1";
    ll = "eza --icons -l -T -L=1 -a";
    cat = "bat";
    htop = "btm";
    fd = "fd -Lu";
    w3m = "w3m -no-cookie -v";
    neofetch = "disfetch";
    fetch = "disfetch";
    gitfetch = "onefetch";
    vim = "nvim";
    cd = "z";
    nsoften = "sudo sh ~/.dotfiles/soften.sh";
    nsync = "sh ~/.dotfiles/sync.sh";
    npull = "sh ~/.dotfiles/pull.sh";
    update = "sh ~/.dotfiles/update.sh";
    upgrade = "sh ~/.dotfiles/upgrade.sh";
    garbage = "sudo nix-collect-garbage -d";
    pd = "podman";
    pda = "podman ps -a";


  };
in
{

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;

    enableCompletion = true;
    autosuggestion.enable = true;


    historySubstringSearch.enable = false;
    
    history = {
      size = 999999;
      save = 999999;
      share = true;
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
      path = "${config.xdg.dataHome}/zsh/history";
    
    };

    syntaxHighlighting.enable = true;

    plugins = [
        {
          name = "powerlevel10k-config";
          src = lib.cleanSource ./p10k-config;
          file = "p10k.zsh";
        }
    ];

    zplug = {
      enable = true;
      plugins = [
        { 
          name = "zsh-users/zsh-autosuggestions"; 
        } 
        { 
          name = "romkatv/powerlevel10k"; 
          tags = [ as:theme depth:1 ]; 
        }

      ];
    };
    
    oh-my-zsh = {
      enable = true;
      theme = "alanpeabody";
      plugins = [ 
        "git" 
        "history-substring-search"
        "colored-man-pages"
        "sudo"
        "web-search"
        "copyfile"
        "copybuffer"
        "dirhistory"
        "jsontools"
      ];
    };

    initExtra = ''

      # inicializa o zoxide
      eval "$(zoxide init zsh)"

      # inicializa o fzf-tab
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      

    '';
  };


  # Gerencia o arquivo powerlevel10k.zsh-theme
  #home.file.".zsh-powerlevel10k.zsh-theme".source = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  home.packages = with pkgs; [
    disfetch lolcat cowsay onefetch
    gnugrep gnused
    bat eza bottom fd bc
    direnv nix-direnv
    zsh-powerlevel10k
    zoxide
  ];

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}
