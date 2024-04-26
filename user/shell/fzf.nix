{ pkgs, lib, config, ... }:

{

  programs = {
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

  };

  

  home.packages = with pkgs; [ 
    fzf
    zsh-forgit
    zsh-fzf-history-search
    zsh-fzf-tab
  ];


}