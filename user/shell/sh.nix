{ pkgs, lib, config, ... }:
let

  # My shell aliases
  myAliases = {
    ls = "eza --icons -l -T -L=1";
    cat = "bat";
    htop = "btm";
    fd = "fd -Lu";
    w3m = "w3m -no-cookie -v";
    neofetch = "disfetch";
    fetch = "disfetch";
    gitfetch = "onefetch";
  };
in
{

  # imports = [
  #   ./p10k.nix
  # ];

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;

    enableCompletion = true;
    autosuggestion.enable = true;

    history.size = 10000;
    history.save = 10000;
    history.expireDuplicatesFirst = true;
    history.ignoreDups = true;
    history.ignoreSpace = true;
    historySubstringSearch.enable = true;
    
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
      theme = "powerlevel10k/powerlevel10k";
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
      bindkey "^[[1;5D" backward-word
      bindkey "^[[1;5C" forward-word

      ZSH_AUTOSUGGEST_STRATEGY=(completion history)

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
  ];

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}
