{ pkgs, ... }:

{


  #xdg.configFile."~/dconf/.keep".source = builtins.toFile "keep" ""; 

  home.file."/dconf/default/devbox.json".text = ''
    {
      "packages": [
        "awscli2@2.15.18",
        "kubernetes-helm@3.14.4",
        "k9s@0.32.4",
        "kubectl@1.29.4",
        "kubectx@0.9.5",
        "terraform@1.8.1",
        "terraformer@0.8.24",
        "terragrunt@0.56.5",
        "argocd@2.10.7",
        "sops@3.8.1",
      ],
      "shell": {
        "init_hook": [
          "echo 'Welcome to devbox!'"
        ],
      },
      "scripts": {

      },

    }
  
  '';




}